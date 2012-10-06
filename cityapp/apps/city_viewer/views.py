# -*- coding: utf-8 -*-
from django.views.generic import ListView
from cityapp.apps.city_viewer.models import Area, Topic, Place, Picture

class HomeView(ListView):
    context_object_name = 'cities'
    queryset = Area.objects.all()
    template_name = 'city_viewer/home.html'

    def get_context_data(self, **kwargs):
        # Call the base implementation first to get a context
        context = super(HomeView, self).get_context_data(**kwargs)
        return context

class CityViewerView(ListView):
    context_object_name = 'topics'
    #queryset = Topic.objects.filter(in_area__zh_name=u"香港")
    template_name = 'city_viewer/viewer.html'

    def get(self, request, *args, **kwargs):
        city_name = kwargs['city']
        self.queryset = Topic.objects.filter(in_area__en_name=city_name)
        return super(CityViewerView, self).get(request, *args, **kwargs)