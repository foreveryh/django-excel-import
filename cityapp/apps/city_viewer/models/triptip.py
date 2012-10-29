# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from django.utils.translation import ugettext_lazy as _
from django_extensions.db.fields import UUIDField
from cityapp.apps.city_viewer.models import Area
from tinymce import models as tinymce_models

class TripTip(models.Model):
    class Meta:
        app_label = 'city_viewer'
        verbose_name = verbose_name_plural = _('旅行贴士')
    id = UUIDField(primary_key=True)
    title = models.CharField(_('主题名'), max_length=50)
    content = tinymce_models.HTMLField(verbose_name=_('内容'))
    in_area = models.ForeignKey(Area, verbose_name=_("所属城市"))
    weight = models.SmallIntegerField()
    def __unicode__(self):
        return '%s[%s]' % (self.title, self.in_area)