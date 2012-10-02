#-*- coding:utf-8 -*-

from django.db import models
from django.utils.translation import ugettext_lazy as _
from django_extensions.db.fields import UUIDField
from areas import Area


class Topic(models.Model):
    class Meta:
        verbose_name = verbose_name_plural = _('主题')
    id = UUIDField(primary_key=True)
    name = models.CharField(_('主题名'), max_length=50)
    desc = models.CharField(_('描述'), max_length=255)
    in_area = models.ForeignKey(Area, verbose_name="所属城市")
    def __unicode__(self):
        return '%s[%s]' % (self.name, self.in_area)

