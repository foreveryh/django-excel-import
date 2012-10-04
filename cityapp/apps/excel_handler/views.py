#coding:utf-8
from django import forms
from django.forms.util import ErrorList
from django.utils import simplejson
from django.views.generic import FormView, TemplateView, CreateView
from cityapp.apps.excel_handler.forms import ImportExcelForm
from cityapp.apps.city_viewer.models import  Area, Place, Topic
from dajaxice.decorators import dajaxice_register


class ImportError(Exception):
    """
    Exception thrown when imported data format is illegal
    """
    pass


class ImportExcel(FormView):
    """
    upload excel file and display it in browser
    """
    template_name = 'excel_handler/excel_import.html'
    form_class = ImportExcelForm
    success_url = ''
    extra_context = {}
    def form_valid(self, form):
        cleaned_data = form.cleaned_data
        try:
            converted_data = form.get_converted_data(cleaned_data)
        except Exception, e:
            error_message = u'Error with excel file: %s' % str(e)
            form.errors['excel_file'] = ErrorList([error_message])
        else:
            initial =  {'converted_data': simplejson.dumps(converted_data) }
            form = self.get_form_class()(initial=initial)
            form.fields['excel_file'].widget = forms.HiddenInput()
            form.fields['city_name'] = forms.CharField(required=True, label=u'输入城市中文名称')
            self.extra_context.update({'form': form , 'uploaded': True, 'converted_data': converted_data})
            return super(ImportExcel, self).render_to_response(self.extra_context)


#####################################################################
#    verify and import excel data to database by an ajax request    #

@dajaxice_register(method='POST', name="import.data")
def check_area(request, city, data):
    message = {'message': None}
    user = request.user
    data =  simplejson.loads(data)

    try:
        area = Area.objects.get(name=city)
    except Area.DoesNotExist:
        #新建城市
        area = Area(name=city, owner=user)
        area.save()
        message['message'] = import_data(area, data)
    else:
        message['message'] = u'城市已经存在'
    return simplejson.dumps(message)

def import_data(area, data):
    """
    Import data to database
    """
    #导入主题
    msg = 'ok'
    topics = data[1]
    ttopics = []
    for item in topics:
        try:
            topic = Topic.objects.get(name=item['name'], in_area=area)
        except Topic.DoesNotExist:
            #新建主题
            topic = Topic(**item)
            topic.in_area = area
            topic.save()
        finally:
            ttopics.append(topic)

    #导入景点
    places = data[0]
    for item in places:
        try:
            place = Place.objects.get(zh_name=item['zh_name'], in_area=area)
        except Place.DoesNotExist:
            pass
        else:
            place.delete()
        finally:
        #新建景点
            place_topic = item['topic'].split(',')
            placeDict = handle_place_data(item)
            place = Place(**placeDict)
            place.in_area = area
            place.save()
            #处理主题
            for t in place_topic:
                for topic in ttopics:
                    if t == topic.name:
                        place.in_topics.add(topic)
    return msg


categoryDict = {u'景点': 1, u'餐厅': 1<<1, u'购物': 1<<2, u'娱乐': 1<<3}
fittimeDict = {u'上午': 1, u'下午': 1<<1, u'晚上': 1<<2, u'全天': 1<<3}
def handle_place_data(item):
    #处理经纬度
    latlng = item['latlng'].split(',')
    item.update({'latitude': latlng[0]})
    item.update({'longitude': latlng[1]})
    item.pop('latlng')
    #处理分类 景点 1 餐厅 1<<1 购物 1<<2 娱乐 1<<3
    category=0
    categories = item['category'].split(',')
    for c in categories:
        category |= categoryDict[c]
    item['category'] = category
    #处理时间
    fit_time=0
    fit_times = item['fit_time'].split(',')
    for t in fit_times:
        fit_time |= fittimeDict[t]
    item['fit_time'] = fit_time
    #处理图片
    pictures = item['pictures'].split(',')
    item.pop('pictures')
    #新建地点
    item.pop('topic')
    item.pop('slug')
    return item
