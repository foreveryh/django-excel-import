# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from django.utils.translation import ugettext_lazy as _
from django_extensions.db.fields import  ModificationDateTimeField, UUIDField
from cityapp.apps.city_viewer.models import Topic
from cityapp.apps.city_viewer.models import Area


CATEGORY = ((1, _('景点')),
            (1<<1, _('餐厅')),
            (1<<2, _('购物')),
            (1<<3, _('娱乐')),)

FITTIME = ((1, _('上午')),
           (1<<1, _('下午')),
           (1<<2, _('晚上')),
           (1<<3, _('全天')),)

class Place(models.Model):
    class Meta:
        app_label = 'city_viewer'
        verbose_name = verbose_name_plural = _('地点')

    id = UUIDField(primary_key=True)
    zh_name = models.CharField(_('中文名'), max_length=50)
    en_name = models.CharField(_('英文名'), max_length=100)
    category = models.SmallIntegerField(_('分类'))#,choices=CATEGORY)
    in_topics = models.ManyToManyField(Topic, verbose_name=_('所属主题'))
    in_area = models.ForeignKey(Area, verbose_name=_('当前城市'))
    longitude = models.CharField(_('经度'), max_length=20)
    latitude = models.CharField(_('纬度'), max_length=20)
    short_desc = models.CharField(_('一句话'), max_length=100, blank=True)
    full_desc = models.TextField(_('描述'), help_text=_('换行符用双井号（##）代替'))
    fit_time = models.SmallIntegerField(_('游玩时间'))#, choices=FITTIME)
    open_time = models.TextField(_('开放时间'), blank=True)
    address = models.CharField(_('地址'), max_length=255)
    traffic = models.TextField(_('交通方式'), blank=True)
    price = models.CharField(_('门票价格'), max_length=255, blank=True)
    tel = models.CharField(_('电话'), max_length=30, blank=True, help_text=_('用中横线隔开'))
    website = models.CharField(_('网址'), max_length=255, blank=True, help_text=_('不要添加http等开头'))
    tips = models.TextField(_('实用信息'), blank=True)
    modified_at = ModificationDateTimeField()

    def __unicode__(self):
        return '%s[%s]' % (self.zh_name, self.in_area)

