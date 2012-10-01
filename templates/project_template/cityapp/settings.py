import inspect
import os

from configurations import Settings


PROJECT_ROOT = os.path.dirname(inspect.getfile(inspect.currentframe()))
DOMAIN = '{{ project_name }}.local'


class Base(Settings):

    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.postgresql_psycopg2',
            'NAME': '{{ project_name }}',
            'USER': '{{ project_name }}',
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
        'django_ses',

        'userena',
        'guardian',
        'easy_thumbnails',
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
        #'{{ project_name }}.middleware.threadlocal.ThreadLocalMiddleware',
        'django.contrib.messages.middleware.MessageMiddleware',
        'django.middleware.clickjacking.XFrameOptionsMiddleware',)
    ROOT_URLCONF = '{{ project_name }}.urls'
    SECRET_KEY = '{{ secret_key }}'
    SERVER_EMAIL = 'robot@{}'.format(DOMAIN)
    SITE_ID = 1
    SETTINGS_MODULE = '{{ project_name }}.settings'
    STATICFILES_DIRS = (os.path.join(PROJECT_ROOT, 'static'), )
    STATIC_URL = '/static/'
    TEMPLATE_DIRS = (os.path.join(PROJECT_ROOT, 'templates'),)
    TIME_ZONE = 'Europe/London'
    USE_L10N = True
    USE_TZ = True
    WSGI_APPLICATION = '{{ project_name }}.wsgi.application'

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

    # django-ses
    EMAIL_BACKEND = 'django_ses.SESBackend'
    AWS_SES_ACCESS_KEY_ID = '{{ aws_ses_access_key }}'
    AWS_SES_SECRET_ACCESS_KEY = '{{ aws_ses_secret_key }}'
    AWS_SES_REGION_NAME = 'us-east-1'
    AWS_SES_REGION_ENDPOINT = 'email.us-east-1.amazonaws.com'


class LocalDev(Base):
    DATABASES = Base.DATABASES
    DATABASES['default']['HOST'] = 'localhost'
    DATABASES['default']['PASSWORD'] = '{{ project_name }}'
    DEBUG = True
    INTERNAL_IPS = ('127.0.0.1',)
    TEMPLATE_DEBUG = True
