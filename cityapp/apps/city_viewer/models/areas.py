# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from django.utils.translation import ugettext_lazy as _
from django_extensions.db.fields import CreationDateTimeField
from django.contrib.auth.models import User
from django.contrib.contenttypes.models import ContentType


class Area(models.Model):
    class Meta:
        app_label = 'city_viewer'
        verbose_name = verbose_name_plural = _('城市')
        permissions = (
            ('view_area', 'View Area'),
            )
    zh_name = models.CharField(_('中文名'), max_length=50, unique=True)
    en_name = models.CharField(_('英文名'), max_length=50, unique=True, blank=True)
    cover_pic = models.ImageField(_('封面'), upload_to='uploads/cover')
    owner = models.ForeignKey(User, verbose_name=_('负责人'))
    create_at = CreationDateTimeField()

    def __unicode__(self):
        return self.zh_name


