from django.conf.urls import patterns, include, url
from django.contrib import admin
from django.contrib.auth.decorators import login_required
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.views.generic import TemplateView, ListView
from dajaxice.core import dajaxice_autodiscover, dajaxice_config
from filebrowser.sites import site
import tinymce
from cityapp.apps.excel_handler.views import ImportExcel
from cityapp.apps.city_viewer.views import CityViewerView, IndexView, HomeView,\
    TripTipView, AboutMeView, WeixinView
from cityapp.apps.city_viewer.api import app_metadata, app_links, like_me, \
    install_me, feedback, feedback_via_web, add_device_token

dajaxice_autodiscover()
admin.autodiscover()

urlpatterns = patterns('',
    url(r'^tinymce/', include('tinymce.urls')),
    url(r'^grappelli/', include('grappelli.urls')),
    url(r'^accounts/', include('userena.urls')),
    url(dajaxice_config.dajaxice_url, include('dajaxice.urls')),
    url(r'^admin/doc/', include('django.contrib.admindocs.urls')),
    url(r'^admin/pics/', include(site.urls)),
    url(r'^admin/', include(admin.site.urls)),
)
urlpatterns += patterns('',
    url('^api/(?P<name>\w+)/info/$', app_metadata),
    url('^api/(?P<name>\w+)/links/$', app_links),
    url('^api/(?P<name>\w+)/feedback/$', feedback),
    url('^api/feedback/$',feedback_via_web),
    url('^api/(?P<name>\w+)/likeme/$', like_me),
    url('^api/(?P<name>\w+)/installme/$', install_me),
    url('^api/(?P<name>\w+)/devicetoken/$', add_device_token)
)
urlpatterns += patterns('',
    url(r'^(?P<city>\w+)/$',CityViewerView.as_view(), name='city_viewer'),
    url(r'^(?P<city>\w+)/tips/$', TripTipView.as_view(), name='city_info'),
    url(r'^weixin/(?P<city>\w+)/(?P<sid>[a-z0-9-]+)/?', WeixinView.as_view(), name='weixin'),
    url(r'^authors/(?P<author>\w+)/$',AboutMeView.as_view(), name='about_me'),
    url(r'^import/excel/', login_required(ImportExcel.as_view()), name='import_excel'),
    url(r'^import/guide/', login_required(TemplateView.as_view(template_name='city_viewer/stepbystep.html')), name='import'),
    url(r'^home/', login_required(HomeView.as_view()), name='home'),
    url(r'', IndexView.as_view(), name='index'),
) + staticfiles_urlpatterns()