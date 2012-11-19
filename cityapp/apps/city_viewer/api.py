from __future__ import unicode_literals
from rest_framework import status
from rest_framework.decorators import api_view, authentication_classes, permission_classes
from rest_framework.authentication import BasicAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from cityapp.apps.city_viewer.models import Area, OfflineMap, APPInfo, APPLike, APPDevice, APPReview
from cityapp.apps.city_viewer.utils import spherical_distance

@api_view(['GET'])
#@authentication_classes((BasicAuthentication,))
#@permission_classes((IsAuthenticated,))
def app_metadata(request, name):
    """
    return meta info of an area
    """
    try:
        area = Area.objects.get(en_name = name)
        offline = OfflineMap.objects.get(in_area=area)
        appinfo = APPInfo.objects.get(area=area)
        response = {'liked_num': 100 + APPLike.objects.liked_num(area),
                    'author_name': area.author.get_profile().name,
                    'author_desc': area.author_desc,
                    'map_size': offline.file.size,
                    'map_center': offline.center,
                    'map_url': offline.file.url,
                    'map_zoom': offline.zoom,
                    'map_min_zoom':offline.min_zoom,
                    'map_max_zoom':offline.max_zoom,
                    'latest_ver':appinfo.latest_ver,
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
        apps = APPInfo.objects.all().exclude(area__en_name=name)
        result = {}
        cityapps = []
        for app in apps:
            dict = {}
            map = OfflineMap.objects.get(in_area=app.area)
            to_coord = map.center
            distance = spherical_distance(from_coord.split(','), to_coord.split(','))
            dict.update({'name': app.name})
            dict.update({'app': app.area.en_name})
            dict.update({'desc': '%s %0.1f'% (zh_name, distance)})
            dict.update({'icon': app.icon.url})
            dict.update({'link': app.link})
            cityapps.append(dict)
        result['cityapps'] = cityapps
        result['others'] = []
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
        print device_id
        device = APPDevice.objects.get(identifier=device_id)
        return Response(status=status.HTTP_409_CONFLICT)
    except APPDevice.DoesNotExist:
        device = APPDevice(identifier=device_id, system=system, platform=platform)
        device.save()
        return Response(status=status.HTTP_201_CREATED)

@api_view(['POST'])
@authentication_classes((BasicAuthentication,))
@permission_classes((IsAuthenticated,))
def like_me(request, name):
    """
    Like
    """
    try:
        device_id = request.DATA['device']
        area = Area.objects.get(en_name=name)
        device = APPDevice.objects.get(identifier=device_id)
        like = APPLike(area=area, device=device)
        like.save()
        return Response(status=status.HTTP_201_CREATED)
    except Area.DoesNotExist:
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
        area = Area.objects.get(en_name=name)
        data = request.DATA
        device_id = data['device']
        contact = data['contact']
        ip_address = data['ip']
        content = data['content'].encode('utf-8')
        device = APPDevice.objects.get(identifier=device_id)
        review = APPReview(area=area, device=device, content=content, contact=contact, ip_address=ip_address)
        review.save()
        return Response(status=status.HTTP_201_CREATED)
    except Area.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    except APPDevice.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

