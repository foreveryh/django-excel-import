#coding:utf-8
from filebrowser.functions import version_generator
import os
import shutil
from django import forms
from django.forms.util import ErrorList
from django.utils import simplejson
from django.views.generic import FormView, TemplateView, CreateView
from django.conf import settings
from cityapp.apps.excel_handler.forms import ImportExcelForm
from cityapp.apps.city_viewer.models import  Area, Place, Topic, Picture, TripTip
from dajaxice.decorators import dajaxice_register
from filebrowser.sites import site
from unidecode import unidecode
from cityapp.utils import convert_name
import globals as v


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
            form.fields['zh_name'] = forms.CharField(required=True, label=u'输入城市中文名称')
            #form.fields['en_name'] = forms.CharField(required=True, )
            dir_list = site.storage.listdir(settings.MEDIA_ROOT+'/uploads/')
            dir_choices = map ((lambda x: (x, x)), dir_list[0])
            form.fields['en_name'] = forms.ChoiceField(choices=dir_choices, label=u'选择图片的文件夹名称（英文名）')
            form.fields['file_type'] =  forms.ChoiceField(choices = ([('zh',u'中文名_1.jpg'), ('en',u'英文名_1.jpg')]), required = True, label=u'上传图片名格式')
            self.extra_context.update({'form': form , 'uploaded': True, 'converted_data': converted_data})
            return super(ImportExcel, self).render_to_response(self.extra_context)


#####################################################################
#    verify and import excel data to database by an ajax request    #



@dajaxice_register(method='POST', name='generate.images')
def generate_images(request,city, data):
    """生成不同版本图片"""
    v.dataDict = simplejson.loads(data)
    v.cityDict = simplejson.loads(city)
    type = v.cityDict['type']
    places = v.dataDict[0]
    area = Area.objects.get(zh_name=v.cityDict['zh_name'])
    resource_path = os.path.join(settings.MEDIA_ROOT, 'uploads', area.en_name)
    area_dir_path = os.path.join(settings.STATIC_ROOT,'cities',area.en_name)
    if not os.path.isdir(area_dir_path):
        os.mkdir(area_dir_path)
    export_path = os.path.join(area_dir_path,'images')
    if not os.path.isdir(export_path):
        os.mkdir(export_path)
    for place in places:
        #首先通过英文名称查找
        findit = True
        count = 0
        while findit:
            count += 1
            if type == 'en':
                file_name = convert_name(place['en_name'] + '_%d' % count + '.jpg')
            elif type == 'zh':
                file_name = convert_name(place['zh_name'] + '_%d' % count + '.jpg')
            full_path = resource_path + '/' + file_name
            findit = os.path.isfile(full_path)
            if findit:
                for path in [version_generator(full_path, version, force=True) for version in ['thumbnail', 'small', 'medium', 'big']]:
                    try:
                        shutil.move(path, export_path)
                    except:
                        raise IOError

    return simplejson.dumps({'message':'ok'})

@dajaxice_register(method='POST', name="import.data")
def check_area(request, city, data):
    message = {'message': None}
    v.dataDict = simplejson.loads(data)
    v.cityDict = simplejson.loads(city)
    #检测图片文件夹是否存在
    area_dir_path = os.path.join(settings.MEDIA_ROOT, 'uploads/', v.cityDict['en_name'])
    if not os.path.isdir(area_dir_path):
        message['message']=u'图片文件夹不存在'
        return simplejson.dumps(message)
    try:
        area = Area.objects.get(zh_name=v.cityDict['zh_name'])
    except Area.DoesNotExist:
        #新建城市
        user = request.user
        area = Area(zh_name=v.cityDict['zh_name'], en_name=v.cityDict['en_name'], author=user)
        area.save()
        message['message'] = import_data(area, v.dataDict, v.cityDict['type'])
    else:
        message['message'] = u'城市已经存在'
    return simplejson.dumps(message)

def import_data(area, data, type):
    """
    Import data to database
    """
    msg = 'ok'
    #导入Tips
    tips = data[2]
    for item in tips:
        try:
            tip = TripTip.objects.get(title=item['title'], in_area=area)
        except TripTip.DoesNotExist:
            #新建tip
            tipDict = handle_tip_data(item)
            tip = TripTip(**tipDict)
            tip.in_area = area
            tip.save()

    #导入主题
    topics = data[1]
    ttopics = []
    for item in topics:
        try:
            topic = Topic.objects.get(name=item['name'], in_area=area)
        except Topic.DoesNotExist:
            #新建主题
            topicDict = handle_topic_data(item, type)
            topic = Topic(**topicDict)
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
            #导入照片
            link_local_pics(area, place, type)
    return msg

def handle_tip_data(item):
    #处理超链接
    item['content'] = item['content'].replace("##","<br/>")
    return item

def handle_topic_data(item, type):
    #处理cover_pic
    if type == 'en':
        file_name = convert_name(item['cover_pic'])
    elif type == 'zh':
        file_name = convert_name(item['cover_pic'])
    item['cover_pic'] = file_name
    return item

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
    #处理电话、网站格式
    item['tel'] = item['tel'].replace(' ','-')
    if item['website'].startswith('http://'):
        item['website'] = item['website'][7:]
    print item['tel']
    print item['website']
    #丢掉不用的
    item.pop('topic')
    item.pop('slug')
    return item

def link_local_pics(area, place, pics_name_type):

    #首先通过英文名称查找
    findit = True
    count = 0
    area_dir_path = os.path.join(settings.MEDIA_ROOT, 'uploads/', area.en_name)
    while findit:
        count += 1
        if pics_name_type == 'en':
            file_name = convert_name(place.en_name + '_%d' % count + '.jpg')
        elif pics_name_type == 'zh':
            file_name = convert_name(place.zh_name + '_%d' % count + '.jpg')
        full_path = area_dir_path + '/' + file_name
        findit = os.path.isfile(full_path)
        if findit:
            url = settings.MEDIA_URL + 'uploads/' + area.en_name + '/' + file_name
            pic = Picture(in_place=place, file_name = file_name, url = url)
            pic.save()
    return count - 1
