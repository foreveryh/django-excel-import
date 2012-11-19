# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import os
from django.db import models
from django.utils.translation import ugettext_lazy as _
from django.conf import settings
from cityapp.apps.city_viewer.models import Area
from django_extensions.db.fields import  ModificationDateTimeField

class OfflineMap(models.Model):
    class Meta:
        app_label = 'city_viewer'
        verbose_name = verbose_name_plural = _('离线地图')

    file = models.FileField(_('地图文件'), upload_to='uploads/offlinemaps')
    center = models.CharField(_('中心坐标'), max_length=100, help_text=_('格式: 纬度，经度'), default='0,0')
    zoom = models.CharField(_('默认层级'), max_length=2, default='16')
    min_zoom = models.CharField(_('最小层级'), max_length=2, default='12')
    max_zoom = models.CharField(_('最大层级'), max_length=2, default='18')
    in_area = models.ForeignKey(Area, verbose_name=_("所属城市"), blank=True, null=True, on_delete=models.SET_NULL)
    version = models.SmallIntegerField(default=1)
    modified_at = ModificationDateTimeField()

    def __unicode__(self):
        return self.in_area.zh_name
