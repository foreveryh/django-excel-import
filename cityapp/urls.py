from django.conf.urls import patterns, include, url
from django.contrib import admin
from django.contrib.auth.decorators import login_required
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from cityapp.apps.excel_handler.views import ImportExcel
from dajaxice.core import dajaxice_autodiscover, dajaxice_config


dajaxice_autodiscover()
admin.autodiscover()

urlpatterns = patterns('',
    url(r'^grappelli/', include('grappelli.urls')),
    url(r'^accounts/', include('userena.urls')),
    url(dajaxice_config.dajaxice_url, include('dajaxice.urls')),
    url(r'^admin/doc/', include('django.contrib.admindocs.urls')),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^import/excel/', login_required(ImportExcel.as_view())),
    url(r'^import/pics/', login_required()),
) + staticfiles_urlpatterns()
