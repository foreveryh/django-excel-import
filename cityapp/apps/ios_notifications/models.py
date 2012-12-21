# -*- coding: utf-8 -*-
import socket
import struct
from binascii import hexlify, unhexlify, Error
import datetime

from django.db import models
from django.utils import simplejson as json
from django_fields.fields import EncryptedCharField
from django.conf import settings
from django.utils.translation import ugettext_lazy as _
import OpenSSL
from cityapp.apps.city_viewer.models import APPDevice, APPInfo, ShortURL
from cityapp.apps.city_viewer.utils.baseconv import base62


class NotificationPayloadSizeExceeded(Exception):
    def __init__(self, message='The notification maximum payload size of 256 bytes was exceeded'):
        super(NotificationPayloadSizeExceeded, self).__init__(message)


class NotConnectedException(Exception):
    def __init__(self, message='You must open a socket connection before writing a message'):
        super(NotConnectedException, self).__init__(message)


class InvalidPassPhrase(Exception):
    def __init__(self, message='The passphrase for the private key appears to be invalid'):
        super(InvalidPassPhrase, self).__init__(message)


class BaseService(models.Model):
    """
    A base service class intended to be subclassed.
    """
    app = models.ForeignKey(APPInfo, verbose_name=_('App'))
    hostname = models.CharField(max_length=100, default='gateway.push.apple.com')
    PORT = 0  # Should be overriden by subclass
    connection = None

    def connect(self, certificate, private_key, passphrase=None):
        """
        Establishes an encrypted SSL socket connection to the service.
        After connecting the socket can be written to or read from.
        """
        # ssl in Python < 3.2 does not support certificates/keys as strings.
        # See http://bugs.python.org/issue3823
        # Therefore pyOpenSSL which lets us do this is a dependancy.
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        cert = OpenSSL.crypto.load_certificate(OpenSSL.crypto.FILETYPE_PEM, certificate)
        args = [OpenSSL.crypto.FILETYPE_PEM, private_key]
        if passphrase is not None:
            args.append(str(passphrase))
        try:
            pkey = OpenSSL.crypto.load_privatekey(*args)
        except OpenSSL.crypto.Error:
            raise InvalidPassPhrase
        context = OpenSSL.SSL.Context(OpenSSL.SSL.SSLv3_METHOD)
        context.use_certificate(cert)
        context.use_privatekey(pkey)
        self.connection = OpenSSL.SSL.Connection(context, sock)
        self.connection.connect((self.hostname, self.PORT))
        self.connection.set_connect_state()
        try:
            self.connection.do_handshake()
            return True
        except Exception as e:
            if getattr(settings, 'DEBUG', False):
                print e, e.__class__
        return False

    def disconnect(self):
        """
        Closes the SSL socket connection.
        """
        if self.connection is not None:
            self.connection.shutdown()
            self.connection.close()

    class Meta:
        abstract = True


class APNService(BaseService):
    """
    Represents an Apple Notification Service either for live
    or sandbox notifications.

    `private_key` is optional if both the certificate and key are provided in
    `certificate`.
    """
    certificate = models.TextField()
    private_key = models.TextField()
    passphrase = EncryptedCharField(null=True, blank=True, help_text='Passphrase for the private key')

    PORT = 2195
    fmt = '!cH32sH%ds'

    def connect(self):
        """
        Establishes an encrypted SSL socket connection to the service.
        After connecting the socket can be written to or read from.
        """
        return super(APNService, self).connect(self.certificate, self.private_key, self.passphrase)

    def push_notification_to_devices(self, notification, devices=None):
        """
        Sends the specific notification to devices.
        if `devices` is not supplied, all devices in the `APNService`'s device
        list will be sent the notification.
        """
        if devices is None:
            devices = self.devicetoken_set.filter(is_active=True)
        if self.connect():
            self._write_message(notification, devices)
            self.disconnect()

    def _write_message(self, notification, devices):
        """
        Writes the message for the supplied devices to
        the APN Service SSL socket.
        """
        if not isinstance(notification, Notification):
            raise TypeError('notification should be an instance of ios_notifications.models.Notification')

        if self.connection is None:
            if not self.connect():
                return

        payload = self.get_payload(notification)

        for device in devices:
            try:
                self.connection.send(self.pack_message(payload, device))
            except OpenSSL.SSL.WantWriteError:
                self.disconnect()
                i = devices.index(device)
                if isinstance(devices, models.query.QuerySet):
                    devices.update(last_notified_at=datetime.datetime.now())
                devices[:i].update(last_notified_at=datetime.datetime.now())
                return self._write_message(notification, devices[i:]) if self.connect() else None
        if isinstance(devices, models.query.QuerySet):
            devices.update(last_notified_at=datetime.datetime.now())
        else:
            for device in devices:
                device.last_notified_at = datetime.datetime.now()
                device.save()
        notification.last_sent_at = datetime.datetime.now()
        notification.save()

    def get_payload(self, notification):
        aps = {'alert':  notification.message}
        if notification.badge is not None:
            aps['badge'] = notification.badge
        if notification.sound is not None:
            aps['sound'] = notification.sound
        if notification.link is not None:
            aps['l'] = notification.link

        message = {'aps': aps}
        payload = json.dumps(message, separators=(',', ':'), ensure_ascii=False).encode('utf8')
        if len(payload) > 256:
            raise NotificationPayloadSizeExceeded

        return payload

    def pack_message(self, payload, device):
        """
        Converts a notification payload into binary form.
        """
        if len(payload) > 256:
            raise NotificationPayloadSizeExceeded
        if not isinstance(device, DeviceToken):
            raise TypeError('device must be an instance of ios_notifications.models.DeviceToken')

        hexToken = device.token.strip().strip('<>').replace(' ','').replace('-', '')
        msg = struct.pack(self.fmt % len(payload), chr(0), 32, unhexlify(hexToken), len(payload), payload)
        return msg

    def __unicode__(self):
        return u'APNService %s' % self.app.name

    class Meta:
        unique_together = ('app', 'hostname')
        verbose_name = verbose_name_plural = _('APNs')


class Notification(models.Model):
    """
    Represents a notification which can be pushed to an iOS device.
    """
    class Meta:
        verbose_name = verbose_name_plural = _(u'推送消息')

    services = models.ManyToManyField(APNService)
    message = models.CharField(_(u'消息'), max_length=200, help_text=_(u'最多100个中文字符'))
    badge = models.PositiveIntegerField(_(u'气泡数'), default=1, null=True)
    sound = models.CharField(_(u'声音'), max_length=30, null=True, default='default')
    link = models.CharField(_(u'链接'), max_length=10, blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    last_sent_at = models.DateTimeField(null=True, blank=True)


    def push_to_all_devices(self):
        """
        Pushes this notification to all active devices using the
        notification's related APN service.
        """
        for service in self.services:
            service.push_notification_to_devices(self)

    def save(self, force_insert=False, force_update=False):
        key = base62.to_decimal(self.link)
        try:
            ShortURL.objects.get(pk=key)
        except ShortURL.DoesNotExist:
            raise ValueError(_('Invalid value of link'))
        models.Model.save(self, force_insert, force_update)

    def __unicode__(self):
        return u'消息: %s' % self.message

    @staticmethod
    def is_valid_length(message, badge=None, sound=None):
        """
        Determines if a notification payload is a valid length.

        returns bool
        """
        aps = {'alert': message}
        if badge is not None:
            aps['badge'] = badge
        if sound is not None:
            aps['sound'] = sound

        message = {'aps': aps}
        payload = json.dumps(message, separators=(',', ':'))
        return len(payload) <= 256



class DeviceToken(models.Model):
    """
    Represents an iOS device with unique token.
    """
    token = models.CharField(max_length=100, blank=False, null=False)
    is_active = models.BooleanField(default=True)
    deactivated_at = models.DateTimeField(null=True, blank=True)
    service = models.ForeignKey(APNService)
    added_at = models.DateTimeField(auto_now_add=True)
    last_notified_at = models.DateTimeField(null=True, blank=True)
    device = models.ForeignKey(APPDevice, verbose_name=_(u'设备'))
    #users = models.ManyToManyField(User, null=True, blank=True, related_name='ios_devices')
    #platform = models.CharField(max_length=30, blank=True, null=True)
    #display = models.CharField(max_length=30, blank=True, null=True)
    #os_version = models.CharField(max_length=20, blank=True, null=True)

    def push_notification(self, notification):
        """
        Pushes a ios_notifications.models.Notification instance to an the device.
        For more details see http://developer.apple.com/library/mac/#documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/ApplePushService/ApplePushService.html
        """
        if not isinstance(notification, Notification):
            raise TypeError('notification should be an instance of ios_notifications.models.Notification')

        services = notification.services.all()
        for service in services:
            service.push_notification_to_devices(notification, [self])
        self.save()

    def __unicode__(self):
        return u'Device %s' % self.token

    class Meta:
        unique_together = ('token', 'service')
        verbose_name = verbose_name_plural = _(u'推送设备')


class FeedbackService(BaseService):
    """
    The service provided by Apple to inform you of devices which no longer have your app installed
    and to which notifications have failed a number of times. Use this class to check the feedback
    service and deactivate any devices it informs you about.

    https://developer.apple.com/library/ios/#documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/CommunicatingWIthAPS/CommunicatingWIthAPS.html#//apple_ref/doc/uid/TP40008194-CH101-SW3
    """
    apn_service = models.ForeignKey(APNService)

    PORT = 2196

    fmt = '!lh32s'

    def connect(self):
        """
        Establishes an encrypted socket connection to the feedback service.
        """
        return super(FeedbackService, self).connect(self.apn_service.certificate, self.apn_service.private_key)

    def call(self):
        """
        Calls the feedback service and deactivates any devices the feedback service mentions.
        """
        if self.connect():
            device_tokens = []
            try:
                while True:
                    data = self.connection.recv(38)  # 38 being the length in bytes of the binary format feedback tuple.
                    timestamp, token_length, token = struct.unpack(self.fmt, data)
                    device_token = hexlify(token)
                    device_tokens.append(device_token)
            except OpenSSL.SSL.ZeroReturnError:
                # Nothing to receive
                pass
            devices = DeviceToken.objects.filter(token__in=device_tokens, service=self.apn_service)
            devices.update(is_active=False, deactivated_at=datetime.datetime.now())
            self.disconnect()
            return devices.count()

    def __unicode__(self):
        return u'FeedbackService %s' % self.app.name

    class Meta:
        unique_together = ('app', 'hostname')
        verbose_name = verbose_name_plural = _(u'推送回馈')
