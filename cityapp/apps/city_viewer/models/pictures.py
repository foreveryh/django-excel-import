# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from django.utils.translation import ugettext_lazy as _
from django_extensions.db.fields import UUIDField
from cityapp.apps.city_viewer.models import Place
from django_extensions.db.fields import CreationDateTimeField
from django.conf import settings
class Picture(models.Model):
    class Meta:
        app_label = 'city_viewer'
        verbose_name = verbose_name_plural = _('图片')
        ordering = ['weight']

    id = UUIDField(primary_key=True)
    file_name = models.CharField(_('文件名'), max_length=50)
    url = models.CharField(_('地址'), max_length=255, help_text='/static/media/uploads/cityname/fielname')
    desc = models.CharField(_('描述'), max_length=255, blank=True)
    in_place = models.ForeignKey(Place, verbose_name=_('地名'))
    weight = models.SmallIntegerField(_('权重'), default=0)
    create_at = CreationDateTimeField()

    def __unicode__(self):
        return self.file_name

