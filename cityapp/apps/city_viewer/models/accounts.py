# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from django.utils.translation import ugettext_lazy as _
from django_extensions.db.fields import CreationDateTimeField
from django.contrib.auth.models import User
from userena.models import UserenaBaseProfile

class UserProfile(UserenaBaseProfile):
    class Meta:
        app_label = 'city_viewer'
        verbose_name = verbose_name_plural = _('作者资料')

    user = models.OneToOneField(User, unique=True, verbose_name=_('作者'))
    name = models.CharField(_('笔名'), max_length=20)
    philosophy = models.CharField(_('旅行哲学'), max_length=255, blank=True)
    created_at = CreationDateTimeField()



