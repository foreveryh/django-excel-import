# -*- coding: utf-8 -*-

from os import path

from django.core.files import File
from storage import UpYunStorage


def upload(filename, use_full_path=False, prefix=False, bucket_name=False, key=None, secret=None,
           bucket_url=None):
    """
    Uploading files to UpYun
    """
    upyun = UpYunStorage(bucket=bucket_name, bucket_url=bucket_url)
    name = None

    if isinstance(filename, basestring):
        filename = open(filename, 'rb')
        name = path.basename(filename.name)
    elif isinstance(filename, (file, File)):
        if use_full_path:
            name = filename.name
        else:
            dir_name, name = path.split(filename.name)

    if not name:
        raise TypeError('Filename must be file or string instance.')

    if prefix:
        if prefix.endswith('/'):
            full_path = prefix + name
        else:
            full_path = prefix + '/' + name
    else:
        full_path = name

    key = upyun.save(full_path, filename)

    return upyun.url(full_path)