from django.conf.urls import patterns, include, url
from django.contrib import admin
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from excel_handler.views import import_excel

admin.autodiscover()

urlpatterns = patterns('',
    #url(r'^accounts/', include('userena.urls')),
    url(r'^admin/doc/', include('django.contrib.admindocs.urls')),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^import/', import_excel),
    url(r'^grappelli/', include('grappelli.urls')),
) + staticfiles_urlpatterns()
