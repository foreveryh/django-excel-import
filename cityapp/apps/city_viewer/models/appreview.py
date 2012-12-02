# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from django.utils.translation import ugettext_lazy as _
from cityapp.apps.city_viewer.models import APPInfo, APPDevice
from django_extensions.db.fields import CreationDateTimeField

SOURCE_CHOICES = (
    ('AS', _('APP STORE')),
    ('APP', _('客户端')),
    ('WEB', _('网站')),
)
class APPReview(models.Model):
    class Meta:
        app_label = 'city_viewer'
        verbose_name = verbose_name_plural = _('App反馈')

    title = models.CharField(_('标题'), max_length=100, blank=True, default='用户反馈')
    device = models.ForeignKey(APPDevice, verbose_name=_('设备'), blank=True, null=True)
    content = models.TextField(_('内容'))
    contact = models.CharField(_('联系方式'), max_length=100, blank=True)
    tracked = models.CharField(_('处理结果'), max_length=255, default='未处理')
    ip = models.IPAddressField(blank=True, default='0.0.0.0')
    source = models.CharField(_('来源'), max_length=3, choices=SOURCE_CHOICES, default='APP')
    app = models.ForeignKey(APPInfo, verbose_name=_('APP'), blank=True, default='1')
    created_at = CreationDateTimeField()

    def __unicode__(self):
        return '%s[%s]' % (self.content, self.source)