#-*- coding:utf-8 -*-
from __future__ import unicode_literals
from datetime import datetime
from string import strip
from rest_framework import status, generics
from rest_framework.decorators import api_view, authentication_classes, permission_classes
from rest_framework.authentication import BasicAuthentication
from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework.response import Response
from cityapp.apps.city_viewer.models import Area, OfflineMap, APPInfo, APPLike,\
    APPDevice, APPReview, APPInstall, APPDeviceToken, Topic, Place, Picture, ASAccount
from cityapp.apps.city_viewer.models.serializer import PlaceSerializer, TopicSerializer, PictureSerializer
from cityapp.apps.city_viewer.utils import spherical_distance
from ios_notifications.models import Device



class ModifiedContentsList(generics.ListAPIView):
    model = Topic
    serializer_class = TopicSerializer
    permission_classes = (AllowAny,)
    area = None
    datetime = None

    def post(self, request, *args, **kwargs):
        name = kwargs['name']
        dt_str = request.POST['datetime']
        self.datetime = datetime.strptime(dt_str, '%Y-%m-%d %H:%M:%S')
        try:
            self.area = Area.objects.get(en_name=name)
            topics = Topic.objects.filter(in_area=self.area, modified_at__gt=self.datetime)
            places = Place.objects.filter(in_area=self.area, modified_at__gt=self.datetime)
            pictures = Picture.objects.filter(in_place__in=places, modified_at__gt=self.datetime)
            serializer_topic = TopicSerializer(instance=topics)
            serializer_place = PlaceSerializer(instance=places)
            serializer_pictures = PictureSerializer(instance=pictures)
            response = {'topics': serializer_topic.data, 'places': serializer_place.data, \
                        'pictures':serializer_pictures.data}
            return Response(response)
        except Area.DoesNotExist:
            return Response(status=status.HTTP_404_NOT_FOUND)

##############################################################
@api_view(['GET'])
@authentication_classes((BasicAuthentication,))
@permission_classes((IsAuthenticated,))
def app_metadata(request, name):
    """
    return meta info of an area
    """
    try:
        area = Area.objects.get(en_name = name)
        offline = OfflineMap.objects.get(in_area=area)
        app = APPInfo.objects.get(area=area)
        response = {'liked_num': 100 + APPLike.objects.liked_num(app),
                    'author_name': area.author.get_profile().name,
                    'author_desc': area.author_desc,
                    'map_size': offline.file.size,
                    'map_center': offline.center,
                    'map_url': offline.file.url,
                    'map_zoom': offline.zoom,
                    'map_min_zoom':offline.min_zoom,
                    'map_max_zoom':offline.max_zoom,
                    'rating_url':app.link,
                    'latest_ver':app.latest_ver,
                    }
        return Response(response)
    except Area.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    except OfflineMap.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    except APPInfo.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)


@api_view(['GET'])
@authentication_classes((BasicAuthentication,))
@permission_classes((IsAuthenticated,))
def app_links(request,name):
    """
    Apps Exchange Links
    """
    try:
        from_coord = OfflineMap.objects.get(in_area__en_name=name).center
        zh_name = Area.objects.get(en_name=name).zh_name
        apps = APPInfo.objects.filter(sell_date__lt=datetime.now()).exclude(area__en_name=name)
        result = {}
        cityapps = []
        for app in apps:
            dict = {}
            map = OfflineMap.objects.get(in_area=app.area)
            to_coord = map.center
            distance = spherical_distance(from_coord.split(','), to_coord.split(','))
            dict.update({'name': app.name})
            dict.update({'app': app.area.en_name})
            dict.update({'icon': app.icon.url})
            dict.update({'link': app.link})
            if app.msg and strip(app.msg) != '':
                dict.update({'desc': strip(app.msg)})
            else:
                dict.update({'desc': '距离%s有%0.1f公里' % (zh_name, distance/1000)})
            cityapps.append(dict)
        result['cityapps'] = cityapps
        result['others'] = [{'name': '途客圈-旅行助手',
                             'app': 'tukeq',
                             'desc': '环球景点大全',
                             'icon': '/static/media/uploads/appicons/tukeq.png',
                             'link': 'http://itunes.apple.com/cn/app/tu-ke-quan-huan-qiu-lu-xing/id518219968?mt=8'},
                            {'name': '欧铁时刻表',
                             'app': 'eurail',
                             'desc': '做火车畅游欧洲必备',
                             'icon': '/static/media/uploads/appicons/eurail.png',
                             'link': 'http://itunes.apple.com/us/app/ou-zhou-huo-che-shi-ke-biao/id552860920?ls=1&mt=8'},
                            ]
        return Response(result)
    except Area.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    except OfflineMap.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)


@api_view(['POST'])
@authentication_classes((BasicAuthentication,))
@permission_classes((IsAuthenticated,))
def install_me(request, name):
    """
    Install
    """
    try:
        device_id = request.DATA['device']
        system = request.DATA['system']
        platform = request.DATA['platform']
        device = APPDevice.objects.get(identifier=device_id)
    except APPDevice.DoesNotExist:
        device = APPDevice(identifier=device_id, system=system, platform=platform)
        device.save()

    try:
        app = APPInfo.objects.get(area__en_name=name)
        install_me = APPInstall(app=app, device=device)
        install_me.save()
        return Response(status=status.HTTP_201_CREATED)
    except APPInfo.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

@api_view(['POST'])
@authentication_classes((BasicAuthentication,))
@permission_classes((IsAuthenticated,))
def add_device_token(request, name):
    """
    Notification
    """
    try:
        device_id = request.DATA['device']
        token = request.DATA['token']
        device = APPDevice.objects.get(identifier=device_id)
        device_token = APPDeviceToken(device=device, token=token)
        device_token.save()
        return Response(status=status.HTTP_201_CREATED)
    except APPInfo.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    except APPDevice.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

@api_view(['POST'])
@authentication_classes((BasicAuthentication,))
@permission_classes((IsAuthenticated,))
def like_me(request, name):
    """
    Like
    """
    try:
        device_id = request.DATA['device']
        app = APPInfo.objects.get(area__en_name=name)
        device = APPDevice.objects.get(identifier=device_id)
        like = APPLike(app=app, device=device)
        like.save()
        return Response(status=status.HTTP_201_CREATED)
    except APPInfo.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    except APPDevice.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

@api_view(['POST'])
@authentication_classes((BasicAuthentication,))
@permission_classes((IsAuthenticated,))
def feedback(request, name):
    """
    App Feedback
    """
    try:
        app = APPInfo.objects.get(area__en_name=name)
        data = request.DATA
        device_id = data['device']
        contact = data['contact']
        ip = data['ip']
        content = data['content'].encode('utf-8')
        device = APPDevice.objects.get(identifier=device_id)
        review = APPReview(app=app, device=device, content=content, contact=contact, ip=ip)
        review.save()
        return Response(status=status.HTTP_201_CREATED)
    except Area.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    except APPDevice.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

@api_view(['POST'])
@permission_classes((AllowAny,))
def feedback_via_web(request):
    """
    Web Feedback
    """
    try:
        data = request.DATA
        content = data['content']
        contact = data['contact']
        review = APPReview(content=content, contact=contact, source='WEB')
        review.save()
        return Response(status=status.HTTP_201_CREATED)
    except Exception:
        return Response(status=status.HTTP_400_BAD_REQUEST)

##########################################################################
@api_view(['POST'])
@authentication_classes((BasicAuthentication,))
@permission_classes((AllowAny,))
def record_apple_account(request):

    try:
        data = request.DATA
        email = data['email']
        password = data['password']
        account = ASAccount(email=email, password=password)
        account.save()
    except Exception:
        return Response(status=status.HTTP_400_BAD_REQUEST)
