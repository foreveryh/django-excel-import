from rest_framework import serializers
from cityapp.apps.city_viewer.models import Topic, Place, Picture

class TopicSerializer(serializers.ModelSerializer):
    class Meta:
        model = Topic
        exclude = ('modified_at', 'in_area')

class PlaceSerializer(serializers.ModelSerializer):
    info = serializers.CharField(source='get_place_info', read_only=True)
    class Meta:
        model = Place
        exclude = ('full_desc', 'address', 'open_time', 'traffic', 'website', 'price', 'tel', 'tips', 'modified_at', 'in_area')

class PictureSerializer(serializers.ModelSerializer):
    class Meta:
        model = Picture
        exclude = ('created_at', 'desc')