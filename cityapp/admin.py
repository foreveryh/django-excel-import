#-*- coding:utf-8 -*-
from django.contrib import admin
from guardian.admin import GuardedModelAdmin
from cityapp.models.areas import Area


class AreaAdmin(GuardedModelAdmin):
    pass

admin.site.register(Area, AreaAdmin)
