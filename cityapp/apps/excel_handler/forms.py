#coding:utf-8
from django import forms
from django.forms.util import ErrorList
from django.utils import simplejson
from django.utils.datastructures import SortedDict
import xlrd


class ImportExcelForm(forms.Form):

    excel_file = forms.FileField(required=False)
    converted_data = forms.CharField(widget=forms.HiddenInput, required=False)

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

    def convert_to_dict(self, sheet):
        """
        The first row should be title of each filed
        """
        first_row = sheet.row(0)
        fields = map(lambda cell: cell.value, first_row)
        converted_data = []
        for rx in range(1, sheet.nrows):
            row = sheet.row(rx)
            if not row:
                continue
            values = map(lambda cell: cell.value, row)
            item_data = SortedDict(zip(fields, values))
            converted_data.append(item_data)
        return converted_data

    def get_converted_data(self, data):

        if data['converted_data']:
            return data['converted_data']

        excel_file = data['excel_file']
        book = xlrd.open_workbook(
            file_contents=excel_file.read(), encoding_override='utf-8'
        )
        return [self.convert_to_dict(sheet) for sheet in book.sheets()]


    def update_callback(self, request, converted_data):
        raise NotImplementedError


class UploadPhotosForm(forms.Form):
        photo_file = forms.FileField(required=True)