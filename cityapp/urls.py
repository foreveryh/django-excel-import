from django.conf.urls import patterns, include, url
from django.contrib import admin
from django.contrib.staticfiles.urls import staticfiles_urlpatterns


admin.autodiscover()

urlpatterns = patterns('',
    url(r'^accounts/', include('userena.urls')),

    url(r'^admin/doc/', include('django.contrib.admindocs.urls')),
    url(r'^admin/django-ses/', include('django_ses.urls')),
    url(r'^admin/', include(admin.site.urls)),
) + staticfiles_urlpatterns()
