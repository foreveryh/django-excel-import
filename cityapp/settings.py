import inspect
import os

from configurations import Settings


PROJECT_ROOT = os.path.dirname(inspect.getfile(inspect.currentframe()))
DOMAIN = 'cityapp.local'


class Base(Settings):

    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.sqlite3',
            'NAME': 'cityapp',
            'USER': 'cityapp',
        }
    }
    DEFAULT_FROM_EMAIL = 'noreply@{}'.format(DOMAIN)
    INSTALLED_APPS = (
        'django.contrib.auth',
        'django.contrib.contenttypes',
        'django.contrib.sessions',
        'django.contrib.sites',
        'django.contrib.messages',
        'django.contrib.staticfiles',
        'django.contrib.admin',
        'django.contrib.admindocs',
        'django.contrib.gis',

        'south',
        'django_extensions',
        'guardian',
    )
    LANGUAGE_CODE = 'en-gb'
    MEDIA_ROOT = os.path.join(PROJECT_ROOT, 'static', 'media')

    @property
    def MEDIA_URL(self):
        return '{}media/'.format(self.STATIC_URL)

    MIDDLEWARE_CLASSES = (
        'django.middleware.common.CommonMiddleware',
        'django.contrib.sessions.middleware.SessionMiddleware',
        'django.middleware.csrf.CsrfViewMiddleware',
        'django.contrib.auth.middleware.AuthenticationMiddleware',
        #'cityapp.middleware.threadlocal.ThreadLocalMiddleware',
        'django.contrib.messages.middleware.MessageMiddleware',
        'django.middleware.clickjacking.XFrameOptionsMiddleware',)
    ROOT_URLCONF = 'cityapp.urls'
    SECRET_KEY = '@5ae)r=gfw20@+4x0^-wkdq&amp;jevw1lv6_%m!q(9cm5g5#%(x!2'
    SERVER_EMAIL = 'robot@{}'.format(DOMAIN)
    SITE_ID = 1
    SETTINGS_MODULE = 'cityapp.settings'
    STATICFILES_DIRS = (os.path.join(PROJECT_ROOT, 'static'), )
    STATIC_URL = '/static/'
    TEMPLATE_DIRS = (os.path.join(PROJECT_ROOT, 'templates'),)
    TIME_ZONE = 'Europe/London'
    USE_L10N = True
    USE_TZ = True
    WSGI_APPLICATION = 'cityapp.wsgi.application'

    # django-userena / django-guardian
    ANONYMOUS_USER_ID = -1
    AUTH_PROFILE_MODULE = 'core.UserProfile'
    AUTHENTICATION_BACKENDS = (
        'userena.backends.UserenaAuthenticationBackend',
        'guardian.backends.ObjectPermissionBackend',
        'django.contrib.auth.backends.ModelBackend',
    )
    LOGIN_REDIRECT_URL = '/accounts/%(username)s/'
    LOGIN_URL = '/accounts/signin/'
    LOGOUT_URL = '/accounts/signout/'

class LocalDev(Base):
    DATABASES = Base.DATABASES
    DATABASES['default']['HOST'] = 'localhost'
    DATABASES['default']['PASSWORD'] = 'cityapp'
    DEBUG = True
    INTERNAL_IPS = ('127.0.0.1',)
    TEMPLATE_DEBUG = True
