#-*- coding:utf-8 -*-
import inspect
import os
import djcelery

from configurations import Settings

PROJECT_ROOT = os.path.dirname(os.path.realpath(__file__))
class Base(Settings):

    DATABASES = {
#        'default': {
#            'ENGINE': 'django.db.backends.sqlite3',
#            'NAME': 'cityapp.db',
#            'USER': '',                      # Not used with sqlite3.
#            'PASSWORD': '',                  # Not used with sqlite3.
#            'HOST': '',                      # Set to empty string for localhost. Not used with sqlite3.
#            'PORT': '',                      # Set to empty string for default. Not used with sqlite3.
#        }
        'default': {
            'ENGINE': 'django.db.backends.mysql', #'django.db.backends.sqlite3',
            'NAME': 'cityapp', #'cityapp.db',
            'USER': 'root',                      # Not used with sqlite3.
            'PASSWORD': 'tukeq123',                  # Not used with sqlite3.
            'HOST': 'localhost',                      # Set to empty string for localhost. Not used with sqlite3.
            'PORT': '',                      # Set to empty string for default. Not used with sqlite3.
        }
    }

    USE_SOUTH = True

    INSTALLED_APPS = (
        'grappelli.dashboard',
        'grappelli',
        'django.contrib.admin',
        'django.contrib.auth',
        'django.contrib.contenttypes',
        'django.contrib.sessions',
        'django.contrib.sites',
        'django.contrib.messages',
        'django.contrib.staticfiles',
        'django.contrib.admin',
        'django.contrib.admindocs',
        'dajaxice',
        'south',
        'django_extensions',
        'guardian',
        'userena',
        'bootstrap_toolkit',
        'easy_thumbnails',
        'filebrowser',
        'tinymce',
        'rest_framework',
        'djcelery',
        'cityapp.apps.excel_handler',
        'cityapp.apps.city_viewer',
        'cityapp.apps.ios_notifications',
    )

    TIME_ZONE = 'Etc/GMT-8'
    USE_TZ = True
    LANGUAGE_CODE = 'zh-cn'

    MIDDLEWARE_CLASSES = (
        'django.middleware.common.CommonMiddleware',
        'django.contrib.sessions.middleware.SessionMiddleware',
        'django.middleware.csrf.CsrfViewMiddleware',
        'django.contrib.auth.middleware.AuthenticationMiddleware',
        #'cityapp.middleware.threadlocal.ThreadLocalMiddleware',
        'django.contrib.messages.middleware.MessageMiddleware',
        'django.middleware.clickjacking.XFrameOptionsMiddleware',)

    TEMPLATE_LOADERS = (
        'django.template.loaders.filesystem.Loader',
        'django.template.loaders.app_directories.Loader',
        'django.template.loaders.eggs.Loader',
    )

    TEMPLATE_CONTEXT_PROCESSORS =(
        'django.contrib.auth.context_processors.auth',
        'django.core.context_processors.debug',
        'django.core.context_processors.request',
        'django.core.context_processors.i18n',
        'django.core.context_processors.media',
        'django.core.context_processors.static',
        'django.contrib.messages.context_processors.messages'
    )

    STATICFILES_FINDERS = (
        'django.contrib.staticfiles.finders.FileSystemFinder',
        'django.contrib.staticfiles.finders.AppDirectoriesFinder',
        'dajaxice.finders.DajaxiceFinder',
    )

    STATICFILES_DIRS = (
        os.path.join(PROJECT_ROOT, 'cityapp', 'static'),
    )

    TEMPLATE_DIRS = (os.path.join(PROJECT_ROOT, 'templates'),)

    DOMAIN = 'cityapps.tukeq.com'
    MEDIA_ROOT = os.path.join(PROJECT_ROOT, 'static', 'media')
    MEDIA_URL = '/static/media/'

    STATIC_ROOT = os.path.join(PROJECT_ROOT, 'static')
    STATIC_URL = '/static/'


    ROOT_URLCONF = 'cityapp.urls'
    SECRET_KEY = '@5ae)r=gfw20@+4x0^-wkdq&amp;jevw1lv6_%m!q(9cm5g5#%(x!2'

    SITE_ID = 1
    SETTINGS_MODULE = 'cityapp.settings'

    USE_L10N = True
    USE_TZ = True

    WSGI_APPLICATION = 'cityapp.wsgi.application'

    # django-userena / django-guardian
    ANONYMOUS_USER_ID = -1
    AUTH_PROFILE_MODULE = 'city_viewer.UserProfile'
    AUTHENTICATION_BACKENDS = (
        'userena.backends.UserenaAuthenticationBackend',
        'guardian.backends.ObjectPermissionBackend',
        'django.contrib.auth.backends.ModelBackend',
    )
    LOGIN_REDIRECT_URL = '/accounts/%(username)s/'
    LOGIN_URL = '/accounts/signin/'
    LOGOUT_URL = '/accounts/signout/'
    USERENA_LANGUAGE_FIELD = 'zh_CN'
    USERENA_ACTIVATION_REQUIRED = False

    #File browser
    DEFAULT_FILE_STORAGE = 'cityapp.utils.ASCIIFileSystemStorage'
    FILEBROWSER_DIRECTORY = 'uploads/'
    FILEBROWSER_MAX_UPLOAD_SIZE = 52428800
    FILEBROWSER_VERSIONS = {
        'admin_thumbnail': {'verbose_name': 'Admin Thumbnail', 'width': 60, 'height': 60, 'opts': 'crop'},
        'thumbnail': {'verbose_name': u'我的收藏', 'width': 144, 'height': 150, 'opts': 'crop'},
        'small': {'verbose_name': u'相关景点', 'width': 290, 'height': 184, 'opts': 'crop'},
        'medium': {'verbose_name': u'精彩主题', 'width': 600, 'height': 200, 'opts': 'crop'},
        'big': {'verbose_name': u'景点大图', 'width': 640, 'height': 480, 'opts': 'crop'},
        'large': {'verbose_name': u'大图', 'width': 640, 'height': '', 'opts': ''},
        }
    #FILEBROWSER_VERSIONS_BASEDIR = 'images/'

    TINYMCE_DEFAULT_CONFIG = {
        'plugins': "table,spellchecker,paste,searchreplace",
        'theme': "advanced",
        'cleanup_on_startup': True,
        'custom_undo_redo_levels': 10,
        'relative_urls': False,
    }

    GRAPPELLI_ADMIN_TITLE = u'城市系列App管理后台'
    GRAPPELLI_INDEX_DASHBOARD = 'cityapp.apps.city_viewer.dashboard.CityAppDashboard'

    REST_FRAMEWORK = {
        'DEFAULT_AUTHENTICATION_CLASSES': (
            'rest_framework.authentication.BasicAuthentication',
            ),
        'DEFAULT_PERMISSION_CLASSES': (
            'rest_framework.permissions.IsAuthenticated',
            )
    }

    TINYMCE_JS_URL = os.path.join(STATIC_ROOT, "js/tiny_mce/tiny_mce.js")
    TINYMCE_JS_ROOT = os.path.join(STATIC_ROOT, "js/tiny_mce")

    #SHORT URL BASE URL
    SITE_BASE_SHORTURL = 'http://cityapps.tukeq.com/notif/'

    #Celery
    djcelery.setup_loader()
    BROKER_HOST = 'localhost'
    BROKER_PORT = 5672
    BROKER_USER = 'guest'
    BROKER_PASSWORD = 'guest'
    BROKER_URL = 'amqp://guest:guest@localhost:5672/'

    #Upyun
    UPYUN_MAPS_BINDING_DOMAIN = 'cityapp-map.b0.upaiyun.com'
    UPYUN_MAPS_BUCKET = 'cityapp-map'
    UPYUN_PICS_BINDING_DOMAIN = 'cityapp-pics.b0.upaiyun.com'
    UPYUN_PICS_BUCKET = 'cityapp-pics'
    UPYUN_OPERATOR_NAME = 'tukeq'
    UPYUN_OPERATOR_PASSWORD = '1qaz2wsx'

class LocalDev(Base):
    DATABASES = Base.DATABASES
    DEBUG = True
    INTERNAL_IPS = ('127.0.0.1',)
    TEMPLATE_DEBUG = True

class Prod(Base):
    DATABASES = Base.DATABASES
    DEBUG = False

    DOMAIN = 'cityapps.tukeq.com'
    MEDIA_ROOT = 'static/media/'
    MEDIA_URL = 'static/media/'

    STATIC_ROOT = 'static/'
    STATIC_URL = '/static/'

    TINYMCE_JS_URL = os.path.join(STATIC_ROOT, "js/tiny_mce/tiny_mce.js")
    TINYMCE_JS_ROOT = os.path.join(STATIC_ROOT, "js/tiny_mce")