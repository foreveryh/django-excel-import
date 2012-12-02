#-*- coding:utf-8 -*-
from __future__ import unicode_literals
from django.utils.translation import ugettext_lazy as _
from django.contrib import admin
from django.core.urlresolvers import reverse
from guardian.admin import GuardedModelAdmin

from cityapp.apps.city_viewer.models import *
from cityapp.apps.city_viewer.utils import *

class AreaAdmin(GuardedModelAdmin):
    list_display = ('zh_name', 'author', 'topic_num', 'place_num')
    actions = ['export_db']

    def topic_num(self, obj):
        return obj.topic_set.all().count()

    topic_num.short_description = '主题数'

    def place_num(self, obj):
        return obj.place_set.all().count()

    place_num.short_description = '景点数'

    def export_db(self, request, queryset):
        if len(queryset) > 1:
            self.message_user(request, "一次只能导出一个城市的数据")
        else:
            en_name = queryset[0].en_name
            export_city_sql(en_name)
            export_city_db(en_name)
            export_city_tips_html(en_name)
            self.message_user(request, "导出数据成功")

    export_db.short_description = '导出数据库'


class PlaceAdmin(GuardedModelAdmin):
    list_display = ('zh_name', 'in_area', 'short_desc', 'full_desc', 'open_time', 'address', 'traffic', 'price', 'tel', 'website', 'tips')
    list_filter = (
        ('in_area'),
    )
    search_fields = ['zh_name','en_name']
    search_fields_verbose = ['中文名','英文名']


class TopicAdmin(GuardedModelAdmin):
    list_display = ('name', 'in_area', 'desc', 'place_num')
    list_filter = (
        ('in_area'),
    )
    def place_num(self, obj):
        return obj.place_set.all().count()
    place_num.short_description = '景点数'


class PictureAdmin(GuardedModelAdmin):
    list_display = ('file_name', 'in_place')
    list_filter = (
        ('in_place'),
    )
    search_fields = ['file_name', 'in_place__zh_name']
    search_fields_verbose = ['文件名', '景点名']


class TripTipAdmin(GuardedModelAdmin):
    list_display = ('title', 'in_area', 'content', 'weight')
    list_filter = (
        ('in_area'),
    )
    search_fields = ['title']
    search_fields_verbose = ['主题']
    class Media:
        js = ['//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js',
              '/static/js/tiny_mce/tiny_mce.js',]


class OfflineMapAdmin(GuardedModelAdmin):
    list_display = ('in_area', 'center', 'min_zoom', 'max_zoom', 'map_size')

    def map_size(self, obj):
        return int(obj.file.size)/1024/1000

    map_size.short_description = '文件大小'


class APPInfoAdmin(GuardedModelAdmin):
    list_display = ('name', 'area', 'sell_date', 'liked_num', 'installed_num')

    def liked_num(self, obj):
        return APPLike.objects.liked_num(obj)
    liked_num.short_description = '喜欢数'

    def installed_num(self, obj):
        return APPInstall.objects.device_num(obj)
    installed_num.short_description = '安装数'


class APPReviewAdmin(GuardedModelAdmin):
    list_display = ('title', 'app', 'content', 'contact', 'ip', 'source', 'created_at')
    list_filter = (
        ('app'),
    )


class APPDeviceAdmin(GuardedModelAdmin):
    list_display = ('identifier', 'system', 'platform')
    list_filter = (
        ('system'), ('platform'),
    )


class APPDeviceTokenAdmin(GuardedModelAdmin):
    list_display = ('device', 'token')


class APPChannelAdmin(GuardedModelAdmin):
    list_display = ('name', 'app', 'channel_url', 'click_num', 'created_at', 'click_fraud')

    def channel_url(self, obj):
        return obj.url

    channel_url.short_description = '链接'

    def click_num(self, obj):
        return ClickStat.objects.filter(channel=obj).count()

    click_num.short_description = '点击量'

    def click_fraud(self, obj):
        return ClickStat.objects.is_click_fraud(obj)

    click_fraud.short_description = '恶意点击'

class ClickStatAdmin(GuardedModelAdmin):
    list_display = ('channel', 'ip', 'created_at')


admin.site.register(Area, AreaAdmin)
admin.site.register(Place, PlaceAdmin)
admin.site.register(Topic, TopicAdmin)
admin.site.register(Picture, PictureAdmin)
admin.site.register(TripTip, TripTipAdmin)
admin.site.register(OfflineMap, OfflineMapAdmin)
admin.site.register(APPInfo, APPInfoAdmin)
admin.site.register(APPReview, APPReviewAdmin)
admin.site.register(APPDevice, APPDeviceAdmin)
admin.site.register(APPDeviceToken, APPDeviceTokenAdmin)
admin.site.register(Channel, APPChannelAdmin)
admin.site.register(ClickStat, ClickStatAdmin)