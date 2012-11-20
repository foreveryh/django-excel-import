# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.views.generic import ListView, TemplateView
from django.contrib.auth.models import User
from cityapp.apps.city_viewer.models import Area, Topic, Place, Picture, TripTip, APPInfo

class IndexView(ListView):
    context_object_name = 'apps'
    queryset = APPInfo.objects.all()
    template_name = 'city_viewer/index.html'

    def get_context_data(self, **kwargs):
        context = super(IndexView, self).get_context_data(**kwargs)
        return context

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

class TripTipView(ListView):
    context_object_name = 'tips'
    template_name = 'city_viewer/triptips.html'

    def get(self, request, *args, **kwargs):
        city_name = kwargs['city']
        self.queryset = TripTip.objects.filter(in_area__en_name=city_name)
        return super(TripTipView, self).get(request, *args, **kwargs)

class AboutMeView(TemplateView):
    template_name = 'city_viewer/aboutme.html'

    def get_context_data(self, **kwargs):
        context = super(AboutMeView, self).get_context_data(**kwargs)
        context['author'] = User.objects.get(username=kwargs['author']).get_profile()
        return context
