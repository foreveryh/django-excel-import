# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.conf import settings
from django.db import models
from django.db.models import Count
from django.utils.translation import ugettext_lazy as _
from django_extensions.db.fields import CreationDateTimeField
from django.contrib.auth.models import User
from cityapp.apps.city_viewer.models import APPInfo

class Channel(models.Model):
    class Meta:
        app_label = 'city_viewer'
        verbose_name = verbose_name_plural = _('推广渠道')

    app = models.ForeignKey(APPInfo, verbose_name=_('App'))
    name = models.CharField(_('渠道名称'), max_length=100)
    created_at = CreationDateTimeField()

    def __unicode__(self):
        return self.name

    @property
    def url(self):
        return 'http://%s/channels/%s/%s/' % (settings.DOMAIN, self.app.area.en_name, self.id)

class ClickStatManager(models.Manager):
    def is_click_fraud(self, channel):
        if self.filter(channel=channel).values('ip').annotate(count=Count('ip')).filter(count__gt=5).count():
            return _('异常')
        else:
            return _('无异常')

    def click_fraud_ip(self):
        return self.values('ip').annotate(count=Count('ip')).filter(count__gt=5).values_list('ip', flat=True)

class ClickStat(models.Model):
    class Meta:
        app_label = 'city_viewer'
        verbose_name = verbose_name_plural = _('点击统计')

    channel = models.ForeignKey(Channel, verbose_name=_('渠道'))
    ip = models.IPAddressField(blank=True, default='0.0.0.0')
    created_at = CreationDateTimeField()
    objects = ClickStatManager()