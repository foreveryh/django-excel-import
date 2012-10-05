#-*- coding:utf-8 -*-
from django.contrib import admin
from guardian.admin import GuardedModelAdmin
from cityapp.apps.city_viewer.models import Area, Place, Topic, Picture


class AreaAdmin(GuardedModelAdmin):
    pass


class PlaceAdmin(GuardedModelAdmin):
    pass


class TopicAdmin(GuardedModelAdmin):
    pass

class PictureAdmin(GuardedModelAdmin):
    pass

admin.site.register(Area, AreaAdmin)
admin.site.register(Place, PlaceAdmin)
admin.site.register(Topic, TopicAdmin)
admin.site.register(Picture, PictureAdmin)