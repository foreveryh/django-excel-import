# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from django.utils.translation import ugettext_lazy as _


class APPInfo(models.Model):
    class Meta:
        app_label = 'city_viewer'
        verbose_name = verbose_name_plural = _('城市APP')

    name = models.CharField(_('名称'), max_length=50, unique=True)
    icon = models.ImageField(_('Icon'), upload_to='uploads/appicons/')
    desc = models.TextField(_('App描述'), max_length=255)
    link = models.URLField(_('App Store链接'), blank=True)
    liked = models.SmallIntegerField(_('喜欢数'), default=100)
    down_count = models.SmallIntegerField(_('下载量'), default=0, editable=False)
    uninstall_count = models.SmallIntegerField(_('卸载数'), default=0, editable=False)
    sell_date = models.DateField(_('上线时间'))

    def __unicode__(self):
        return self.name
