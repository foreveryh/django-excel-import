import inspect
import os

from configurations import Settings


PROJECT_ROOT = os.path.dirname(os.path.realpath(__file__))
DOMAIN = 'cityapp.local'


class Base(Settings):

    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.sqlite3',
            'NAME': 'cityapp.db',
            'USER': '',                      # Not used with sqlite3.
            'PASSWORD': '',                  # Not used with sqlite3.
            'HOST': '',                      # Set to empty string for localhost. Not used with sqlite3.
            'PORT': '',                      # Set to empty string for default. Not used with sqlite3.
        }
    }
    USE_SOUTH = True

    DEFAULT_FROM_EMAIL = 'noreply@tukeq.com'.format(DOMAIN)
    INSTALLED_APPS = (
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
#        'django.contrib.gis',
        'dajaxice',
        'south',
        'django_extensions',
        'guardian',
        'userena',
        'bootstrap_toolkit',
        'easy_thumbnails',
        'filebrowser',
        'cityapp.apps.excel_handler',
        'cityapp.apps.city_viewer',
    )
    TIME_ZONE = 'Asia/Shanghai'
    LANGUAGE_CODE = 'zh-cn'
    MEDIA_ROOT = os.path.join(PROJECT_ROOT, 'static', 'media')
    MEDIA_URL = '/static/media/'

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
        'django.core.context_processors.i18n',
        'django.core.context_processors.media',
        'django.core.context_processors.static',
        'django.core.context_processors.request',
        'django.contrib.messages.context_processors.messages'
    )

    STATICFILES_FINDERS = (
        'django.contrib.staticfiles.finders.FileSystemFinder',
        'django.contrib.staticfiles.finders.AppDirectoriesFinder',
        'dajaxice.finders.DajaxiceFinder',
    )

    ROOT_URLCONF = 'cityapp.urls'
    SECRET_KEY = '@5ae)r=gfw20@+4x0^-wkdq&amp;jevw1lv6_%m!q(9cm5g5#%(x!2'
    SERVER_EMAIL = 'robot@tukeq.com'.format(DOMAIN)
    SITE_ID = 1
    SETTINGS_MODULE = 'cityapp.settings'
    STATICFILES_DIRS = (
        os.path.join(PROJECT_ROOT, 'static'),
    )
    #STATIC_ROOT = os.path.join(PROJECT_ROOT, 'static')
    STATIC_URL = '/static/'
    TEMPLATE_DIRS = (os.path.join(PROJECT_ROOT, 'templates'),)
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

    FILEBROWSER_MAX_UPLOAD_SIZE = 52428800


class LocalDev(Base):
    DATABASES = Base.DATABASES
    DEBUG = True
    INTERNAL_IPS = ('127.0.0.1',)
    TEMPLATE_DEBUG = True
