# -*- coding: utf-8 -*-

from django.contrib import admin
from django.conf.urls.defaults import patterns, url
from django.template.response import TemplateResponse
from django.shortcuts import get_object_or_404

from models import DeviceToken, Notification, APNService, FeedbackService, push_notification_to_devices
from forms import APNServiceForm

class APNServiceAdmin(admin.ModelAdmin):
    list_display = ('app', 'hostname')
    form = APNServiceForm


class DeviceAdmin(admin.ModelAdmin):
    fields = ('token', 'is_active', 'service', 'device')
    list_display = ('token', 'is_active', 'service', 'last_notified_at', 'added_at', 'deactivated_at')
    list_filter = ('is_active', 'last_notified_at', 'added_at', 'deactivated_at')
    search_fields = ('token',)


class NotificationAdmin(admin.ModelAdmin):
    exclude = ('last_sent_at',)
    list_display = ('message', 'badge', 'sound', 'created_at', 'last_sent_at')
    list_filter = ('created_at', 'last_sent_at')
    search_fields = ('message', )

    def get_urls(self):
        urls = super(NotificationAdmin, self).get_urls()
        notification_urls = patterns('',
                                     url(r'^(?P<id>\d+)/push-notification/$', self.admin_site.admin_view(self.admin_push_notification),
                                     name='admin_push_notification'),)
        return notification_urls + urls

    def admin_push_notification(self, request, **kwargs):
        notification = get_object_or_404(Notification, **kwargs)
        num_devices = 0
        if request.method == 'POST':
            services = notification.services.all()
            for service in services:
                num_devices += service.devicetoken_set.filter(is_active=True).count()
                #service.push_notification_to_devices.delay(notification)
                push_notification_to_devices.delay(service.id, notification.id)

        return TemplateResponse(request, 'admin/ios_notifications/notification/push_notification.html',
                                {'notification': notification, 'num_devices': num_devices, 'sent': request.method == 'POST'},
                                current_app='ios_notifications')

admin.site.register(DeviceToken, DeviceAdmin)
admin.site.register(Notification, NotificationAdmin)
admin.site.register(APNService, APNServiceAdmin)
admin.site.register(FeedbackService)
