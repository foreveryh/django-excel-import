#-*- coding:utf-8 -*-
from __future__ import unicode_literals
from django.contrib import admin
from django.core.urlresolvers import reverse
from guardian.admin import GuardedModelAdmin
from cityapp.apps.city_viewer.models import Area, Place, Topic, Picture, TripTip
from cityapp.apps.city_viewer.utils import *


class AreaAdmin(GuardedModelAdmin):
   actions = ['export_db']
   def export_db(self, request, queryset):
       if len(queryset) > 1:
           self.message_user(request, "一次只能导出一个城市的数据")
       else:
           en_name = queryset[0].en_name
           export_city_sql(en_name)
           export_city_db(en_name)
           self.message_user(request, "导出数据成功")

   export_db.short_description = '导出数据库'

class PlaceAdmin(GuardedModelAdmin):
    search_fields = ['zh_name','en_name']
    search_fields_verbose = ['中文名','英文名']

class TopicAdmin(GuardedModelAdmin):
    pass

class PictureAdmin(GuardedModelAdmin):
    pass

from tinymce.widgets import TinyMCE

class TripTipAdmin(GuardedModelAdmin):
    class Media:
        js = ['//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js',
              '/static/js/tiny_mce/tiny_mce.js',]

admin.site.register(Area, AreaAdmin)
admin.site.register(Place, PlaceAdmin)
admin.site.register(Topic, TopicAdmin)
admin.site.register(Picture, PictureAdmin)
admin.site.register(TripTip, TripTipAdmin)