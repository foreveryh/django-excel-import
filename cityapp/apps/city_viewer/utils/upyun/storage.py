# coding=utf-8
#
# Upyun storage class for Django pluggable storage system.
# Author: Fei Tao <filia.tao@gmail.com>
# License: BSD
#
# Usage:
#
# Add below to settings.py:
# UPYUN_BUCKET_NAME       = 'bucketname'
# UPYUN_OPERATOR_NAME     = 'username'
# UPYUN_OPERATOR_PASSWORD = 'password'
#
# addition config (optional)
# UPYUN_BUCKET_URL = 'http://yourdomain.com'
# UPYUN_ENABLE_LINK_TOKEN = True  (default False)
# UPYUN_LINK_TOKEN = 'your link token key '
# UPYUN_LINK_EXPIRATION = 3600 (default 1 day)
#

import time
import hashlib
import urlparse
from lib.upyun import UpYunException, UpYun

try:
    from cStringIO import StringIO
except ImportError:
    from StringIO import StringIO

from django.conf import settings
from django.core.files.base import File
from django.core.files.storage import Storage
from django.core.exceptions import ImproperlyConfigured


BUCKET_NAME = getattr(settings, 'UPYUN_BUCKET_NAME', None)
BUCKET_URL = getattr(settings, 'UPYUN_BUCKET_URL', 'http://%s.b0.upaiyun.com' % BUCKET_NAME)
OPERATOR_NAME = getattr(settings, 'UPYUN_OPERATOR_NAME', None)
OPERATOR_PASSWORD = getattr(settings, 'UPYUN_OPERATOR_PASSWORD', None)

ENABLE_LINK_TOKEN = getattr(settings, 'UPYUN_ENABLE_LINK_TOKEN', False)
LINK_TOKEN = getattr(settings, 'UPYUN_LINK_TOKEN', None)
LINK_EXPIRATION = getattr(settings, 'UPYUN_LINK_EXPIRATION', 3600 * 24)

class UpYunStorageException(Exception): pass

class ThumbnailSupportMixin(object):
    support_thumbnail = True

    def thumbnail_name(self, name, size):
        return name + '!' + size

class UpYunStorage(Storage, ThumbnailSupportMixin):
    """UpYun Storage class for Django pluggable storage system."""


    def __init__(self, bucket=BUCKET_NAME,
                 bucket_url=BUCKET_URL,
                 enable_link_token=ENABLE_LINK_TOKEN,
                 link_token=LINK_TOKEN,
                 link_expiration=LINK_EXPIRATION,
                 operator_name=OPERATOR_NAME,
                 operator_password=OPERATOR_PASSWORD):
        self.bucket = bucket
        self.operator_name = operator_name
        self.operator_password = operator_password
        self.bucket_url = bucket_url
        self.enable_link_token = enable_link_token
        self.link_token = link_token
        self.link_expiration = link_expiration
        if not bucket or not operator_name or not operator_password:
            raise ImproperlyConfigured('bucket , opeartor_name, operator_password is requied')
        self.upyun_client = UpYun(self.bucket, self.operator_name, self.operator_password)

    def _open(self, name, mode='rb'):
        if 'w' not in mode and not self.exists(name):
            raise IOError('File does not exist: %s' % name)
        return UpYunStorageFile(name, mode, self)

    def _save(self, name, content):
        print 'try to save ....', name
        self._put_file(name, content.read())
        content.close()
        return name

    def _put_file(self, name, content):
        name = self._clean_name(name)
        self.upyun_client.writeFile(name, content, auto=True)

    def _read(self, name):
        name = self._clean_name(name)
        content = self.upyun_client.readFile(name)
        if content is None:
            raise UpYunStorageException('fail to read file content')
        return content

    def _clean_name(self, name):
        if type(name) is unicode:
            return name.encode('utf-8')
        else:
            return name

    #def get_valid_name(self, name):
    #    print 'get valid name', name
    #    return name

    def listdir(self, path):
        return [d.filename for d in self.upyun_client.readDir(path)]

    def delete(self, name):
        try:
            return self.upyun_client.delete(name)
        except UpYunException:
            raise UpYunStorageException(unicode(UpYunException))

    def exists(self, name):
        try:
            return self.upyun_client.getFileInfo(name) is not None
        except UpYunException:
            raise UpYunStorageException(unicode(UpYunException))

    def size(self, name):
        try:
            fileinfo = self.upyun_client.getFileInfo(name)
        except UpYunException:
            raise UpYunStorageException(unicode(UpYunException))

        if not fileinfo:
            raise UpYunStorageException('file %s not exists' %name)
        return fileinfo['size']

    def url(self, name):
        if not self.bucket_url:
            raise ImproperlyConfigured('bucket_url is required for url method')
        if self.enable_link_token and not self.link_token:
            raise ImproperlyConfigured('link token is required , if enalbe_link_token is on')
        url = urlparse.urljoin(self.bucket_url, name)
        if self.enable_link_token:
            etime = int(time.time() + self.link_expiration)
            if name[0] != '/':
                name = '/' + name
            sign = hashlib.md5('%s&%s&%s' %(self.link_token,etime,name)).hexdigest()[12:20] + str(etime)
            url = url + '?_upt=' + sign
        return url


class UpYunStorageFile(File):
    def __init__(self, name, mode, storage):
        self._name = name
        self._storage = storage
        self._mode = mode
        self._is_dirty = False
        self.file = StringIO()
        self._is_read = False

    @property
    def size(self):
        if not hasattr(self, '_size'):
            self._size = self._storage.size(self._name)
        return self._size

    def read(self, num_bytes=None):
        if not self._is_read:
            self.file = StringIO(self._storage._read(self._name))
            self._is_read = True
        return self.file.read(num_bytes)

    def write(self, content):
        if 'w' not in self._mode:
            raise AttributeError("File was opened for read-only access.")
        self.file.write(content)
        self._is_dirty = True
        self._is_read = True

    def close(self):
        if self._is_dirty:
            self._storage._put_file(self._name, self.file.getvalue())
        self.file.close()

#class UpYunFileField(models.FileField):
#    def __init__(self, bucket=settings.DEFAULT_BUCKET, verbose_name=None, name=None, upload_to='', storage=None, **kwargs):
#        if settings.USE_AMAZON_S3:
#            self.connection = S3Connection(settings.AWS_ACCESS_KEY_ID, settings.AWS_SECRET_ACCESS_KEY)
#            if not self.connection.lookup(bucket):
#                self.connection.create_bucket(bucket)
#            self.bucket = self.connection.get_bucket(bucket)
#            storage = S3Storage(self.bucket)
#        super(S3EnabledFileField, self).__init__(verbose_name, name, upload_to, storage, **kwargs)
#
#
#class UpYunImageField(models.ImageField):
#    def __init__(self, bucket=settings.DEFAULT_BUCKET, verbose_name=None, name=None, width_field=None, height_field=None, **kwargs):
#        if settings.USE_AMAZON_S3:
#            self.connection = S3Connection(settings.AWS_ACCESS_KEY_ID, settings.AWS_SECRET_ACCESS_KEY)
#            if not self.connection.lookup(bucket):
#                self.connection.create_bucket(bucket)
#            self.bucket = self.connection.get_bucket(bucket)
#            kwargs['storage'] = S3Storage(self.bucket)
#        super(S3EnabledImageField, self).__init__(verbose_name, name, width_field, height_field, **kwargs)
