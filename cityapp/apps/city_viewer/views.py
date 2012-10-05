# -*- coding: utf-8 -*-
from django.views.generic import ListView
from cityapp.apps.city_viewer.models import Area, Topic, Place, Picture
class CityViewer(ListView):
    context_object_name = 'topics'
    queryset = Topic.objects.filter(in_area__zh_name=u"香港")
    template_name = 'city_viewer/viewer.html'