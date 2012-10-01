from django.db.models import *

from django_extensions.db.fields import CreationDateTimeField, ModificationDateTimeField, UUIDField


class Model(Model):
    id = UUIDField(primary_key=True)
    created = CreationDateTimeField()
    modified = ModificationDateTimeField()

    class Meta:
        abstract = True
