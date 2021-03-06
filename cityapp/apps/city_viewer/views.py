# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.http import Http404, HttpResponseRedirect, HttpResponsePermanentRedirect
from django.shortcuts import get_object_or_404
from django.views.generic import ListView, TemplateView, DetailView, View
from django.contrib.auth.models import User
from cityapp.apps.city_viewer.models import Area, Topic, Place, Picture, TripTip, APPInfo, Channel, ClickStat, ShortURL
from cityapp.apps.city_viewer.utils.baseconv import base62

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

class WeixinView(DetailView):
    model = Place
    template_name = 'city_viewer/weixin.html'
    area = None
    place = None

    def get_object(self, queryset=None):
        return self.place

    def get_context_data(self, **kwargs):
        context = super(WeixinView, self).get_context_data(**kwargs)
        if 'isappinstalled' in self.request.GET:
            isappinstalled = self.request.GET['isappinstalled']
        else:
            isappinstalled = '0'

        app = APPInfo.objects.get(area=self.area)
        context['icon'] = app.icon.url
        context['name'] = app.name

        if isappinstalled != '1':
            context['isappinstalled'] = False
            try:
                context['aslink'] = app.link
            except APPInfo.DoesNotExist:
                context['aslink'] = u'http://cityapps.tukeq.com/'
        else:
            context['isappinstalled'] = True
        return context

    def get(self, request, *args, **kwargs):
        city_name = kwargs['city']
        sid = kwargs['sid']
        try:
            self.area = Area.objects.get(en_name=city_name)
            self.place = Place.objects.get(id=sid)
        except Area.DoesNotExist:
            raise Http404(u"No area found matching the query")
        except Place.DoesNotExist:
            raise Http404(u"No place found matching the query")

        return super(WeixinView, self).get(request,*args,**kwargs)

class AboutMeView(TemplateView):
    template_name = 'city_viewer/aboutme.html'

    def get_context_data(self, **kwargs):
        context = super(AboutMeView, self).get_context_data(**kwargs)
        context['author'] = User.objects.get(username=kwargs['author']).get_profile()
        return context

class ChannelView(View):

    def get_client_ip(self, request):
        x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
        if x_forwarded_for:
            ip = x_forwarded_for.split(',')[0]
        else:
            ip = request.META.get('REMOTE_ADDR')
        return ip

    def get(self, request, *args, **kwargs):
        city_name = kwargs['city']
        cid = kwargs['cid']
        try:
            app = APPInfo.objects.get(area__en_name=city_name)
            channel = Channel.objects.get(id=cid)
            ip = self.get_client_ip(request)
            click = ClickStat(channel=channel,ip=ip)
            click.save()
            return HttpResponseRedirect(app.link)
        except APPInfo.DoesNotExist:
            raise Http404(u'No area found matching the query')
        except Channel.DoesNotExist:
            raise Http404(u'No channel found matching the query')

class ShortURLView(View):

    def get(self, request, *args, **kwargs):
        """
        View which gets the link for the given base62_id value
        and redirects to it.
        """
        base62_id = kwargs['base62_id']
        key = base62.to_decimal(base62_id)
        link = get_object_or_404(ShortURL, pk = key)
        link.usage_count += 1
        link.save()
        return HttpResponsePermanentRedirect(link.url)