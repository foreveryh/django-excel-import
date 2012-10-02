#coding:utf-8
from django import forms
from django.forms.util import ErrorList
from django.utils import simplejson
from django.utils.datastructures import SortedDict
import xlrd


class ImportExcelForm(forms.Form):

    excel_file = forms.FileField(required=False)
    converted_data = forms.CharField(widget=forms.HiddenInput, required=False)
    comment = forms.CharField(required=False)
    is_good = forms.BooleanField(widget=forms.HiddenInput, required=False)

    def clean_converted_data(self):
        converted_data = self.cleaned_data['converted_data']
        if not converted_data:
            return None
        try:
            converted_data = simplejson.loads(converted_data)
        except ValueError:
            raise forms.ValidationError(u'Bad converted data')
        return converted_data

    def clean(self):
        cleaned_data = self.cleaned_data
        if not cleaned_data.get('excel_file') and not cleaned_data.get('converted_data'):
            self.errors['excel_file'] = ErrorList([u'Required Field'])
        return cleaned_data

    def get_converted_data(self, data):
        if data['converted_data']:
            return data['converted_data']
        excel_file = data['excel_file']
        book = xlrd.open_workbook(
            file_contents=excel_file.read(), encoding_override='utf-8'
        )
        sheet = book.sheet_by_index(0)
        first_row = sheet.row(0)
        fields = map(lambda cell: cell.value, first_row)
        converted_data = []
        for rx in range(1, sheet.nrows):
            row = sheet.row(rx)
            if not row:
                continue
            values = map(lambda cell: cell.value, row)
            hotel_data = SortedDict(zip(fields, values))
            converted_data.append(hotel_data)
        return converted_data

    def update_callback(self, request, converted_data):
        raise NotImplementedError