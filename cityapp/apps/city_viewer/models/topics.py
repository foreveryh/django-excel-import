# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from django.utils.translation import ugettext_lazy as _
from django_extensions.db.fields import UUIDField
from cityapp.apps.city_viewer.models import Area


class Topic(models.Model):
    class Meta:
        app_label = 'city_viewer'
        verbose_name = verbose_name_plural = _('主题')
    id = UUIDField(primary_key=True)
    name = models.CharField(_('主题名'), max_length=50)
    desc = models.CharField(_('描述'), max_length=255)
    in_area = models.ForeignKey(Area, verbose_name=_("所属城市"))
    weight = models.SmallIntegerField()
    cover_pic = models.CharField(_('图片名'), max_length=100)
    def __unicode__(self):
        return '%s[%s]' % (self.name, self.in_area)

