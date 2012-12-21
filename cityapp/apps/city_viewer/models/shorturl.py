# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.conf import settings
from django.db import models
from django.utils.translation import ugettext_lazy as _
from cityapp.apps.city_viewer.utils.baseconv import base62
from django_extensions.db.fields import CreationDateTimeField

class ShortURL(models.Model):
    class Meta:
        app_label = 'city_viewer'
        verbose_name = verbose_name_plural = _('短链接')

    url = models.URLField(_('原始链接'), verify_exists=True, unique=True)
    usage_count = models.IntegerField(_('点击数'), default=0)
    created_at = CreationDateTimeField()

    def to_base62(self):
        return base62.from_decimal(self.id)

    def short_url(self):
        return settings.SITE_BASE_SHORTURL + self.to_base62()

    def __unicode__(self):
        return self.to_base62() + ' : ' + self.url
