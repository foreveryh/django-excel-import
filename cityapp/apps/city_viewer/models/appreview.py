# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from django.utils.translation import ugettext_lazy as _

SOURCE_CHOICES = (
    ('AS', _('APP STORE')),
    ('APP', _('客户端')),
    ('WEB', _('网站')),
)
class APPReview(models.Model):
    class Meta:
        app_label = 'city_viewer'
        verbose_name = verbose_name_plural = _('App反馈')

    title = models.CharField(_('标题'), blank=True)
    content = models.TextField(_('内容'))
    datetime = models.DateTimeField(_('时间'))
    contact = models.CharField(_('联系方式'), blank=True)
    tracked = models.CharField(_('追踪'), blank=True)
    source = models.CharField(_('来源'), max_length=3, choices=SOURCE_CHOICES)

    def __unicode__(self):
        return self.title