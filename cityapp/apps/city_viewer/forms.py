from django.forms import *
from django.db.models import *
from tinymce.widgets import TinyMCE
from appinfo.apps.city_viewer.models import TripTip
class TripTipForm(forms.ModelForm):
    content = forms.CharField(widget=TinyMCE(attrs={'cols': 80, 'rows': 10}))
    class Meta:
        model = TripTip