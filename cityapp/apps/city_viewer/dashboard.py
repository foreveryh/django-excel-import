# -*- coding: utf-8 -*-
"""
This file was generated with the customdashboard management command and
contains the class for the main dashboard.

To activate your index dashboard add the following to your settings.py::
    GRAPPELLI_INDEX_DASHBOARD = 'cityapp.dashboard.CustomIndexDashboard'
"""
from __future__ import unicode_literals
from django.utils.translation import ugettext_lazy as _
from django.core.urlresolvers import reverse

from grappelli.dashboard import modules, Dashboard
from grappelli.dashboard.utils import get_admin_site_name

PREFIX = 'cityapp.apps.city_viewer.models.'

class CityAppDashboard(Dashboard):
    """
    Custom index dashboard for www.
    """

    def init_with_context(self, context):
        #site_name = get_admin_site_name(context)

        self.children.append(modules.ModelList(
            _('APP管理'),
            pre_content='''

            ''',
            collapsible=True,
            column=1,
            css_classes=('collapse closed',),
            models=(
                PREFIX + 'appinfo.APPInfo',
                PREFIX + 'appreview.APPReview',
            )
        ))

        self.children.append(modules.ModelList(
            _('渠道管理'),
            pre_content='''

            ''',
            collapsible=True,
            column=1,
            css_classes=('collapse closed',),
            models=(
                PREFIX + 'channels.Channel',
                PREFIX + 'channels.ClickStat',
                )
        ))

        self.children.append(modules.ModelList(
            _('城市内容管理'),
            pre_content='''

            ''',
            collapsible=True,
            column=1,
            css_classes=('collapse closed',),
            models=(
                PREFIX + 'areas.Area',
                PREFIX + 'topics.Topic',
                PREFIX + 'places.Place',
                PREFIX + 'triptip.TripTip',
                PREFIX + 'pictures.Picture',
                )
        ))

        self.children.append(modules.ModelList(
            _('管理用户'),
            pre_content='''

            ''',
            collapsible=True,
            column=1,
            css_classes=('collapse closed',),
            models= (
                PREFIX + 'accounts.UserProfile',
                )
        ))

        self.children.append(modules.AppList(
            _('推送管理'),
            column=1,
            collapsible=False,
            models=('ios_notifications.*',)
        ))

        self.children.append(modules.AppList(
            _('系统管理员'),
            column=1,
            collapsible=False,
            models=('django.contrib.*',),
        ))
        # append another link list module for "support".
        self.children.append(modules.LinkList(
            _('上传图片管理'),
            column=2,
            children=[
                {
                    'title': _('FileBrowser'),
                    'url': '/admin/pics/browse/',
                    'external': False,
                },
            ]
        ))

        # append another link list module for "support".
        self.children.append(modules.LinkList(
            _('开发帮助'),
            column=2,
            children=[
                {
                    'title': _('Django Documentation'),
                    'url': 'http://docs.djangoproject.com/',
                    'external': True,
                },
                {
                    'title': _('Grappelli Documentation'),
                    'url': 'http://packages.python.org/django-grappelli/',
                    'external': True,
                },
            ]
        ))

        # append a feed module
        self.children.append(modules.Feed(
            _('最新评论'),
            column=2,
            feed_url='https://itunes.apple.com/cn/rss/customerreviews/id=577396339/sortBy=mostRecent/xml?l=en',
            limit=10
        ))

        # append a recent actions module
        self.children.append(modules.RecentActions(
            _('最近动作'),
            limit=5,
            collapsible=False,
            column=3,
        ))


