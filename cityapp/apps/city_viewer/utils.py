# -*- coding: utf-8 -*-
#from __future__ import unicode_literals
import os
import shutil
import sqlite3
from string import Template
from django.conf import settings
from django.utils import simplejson
from filebrowser.sites import site
from cityapp.apps.city_viewer.models import Area


topic_template = Template("""INSERT INTO "city_topic" VALUES('${id}','${name}','${desc}',${in_area_id},${weight});""")
#place_template = Template("""INSERT INTO "city_place" VALUES('${id}','${zh_name}','${en_name}',${category},${in_area_id},'${longitude}','${latitude}','${short_desc}','${full_desc}',${fit_time},'${open_time}','${address}','${traffic}','${price}','${tel}','${website}','${tips}','${modified_at}'); """)
place_template = Template("""INSERT INTO "city_place" VALUES('${id}','${zh_name}','${en_name}',${category},${in_area_id},'${longitude}','${latitude}','${short_desc}',${fit_time},'${info}');""")
place_in_topic_template = Template("""INSERT INTO "city_place_in_topics" VALUES('${id}','${place_id}','${topic_id}');""");
picture_template = Template("""INSERT INTO "city_picture" VALUES('${id}','${file_name}','${url}','${desc}','${in_place_id}','${create_at}');""")

def handle_single_quote(**dict):
    for key, value in dict.items():
        #print key,value
        if isinstance(value, basestring):
             dict[key] = value.replace("'","''")
    return dict

def generate_place_info(place):
    info = {}
    if place.full_desc:
        info.update({"description":place.full_desc})
    if place.address:
        info.update({"address":place.address})
    if place.open_time:
        info.update({"openTime":place.open_time})
    if place.traffic:
        info.update({"arriveMethod":place.traffic})
    if place.website:
        info.update({"website":place.website})
    if place.price:
        info.update({"ticketInfo":place.price})
    if place.tel:
        info.update({"phoneNumber":place.tel})
    if place.tips:
        info.update({"tips":place.tips})
    return simplejson.dumps(info)

def export_city_sql(name, sql_schema='db_schema.sql'):
    try:
        area = Area.objects.get(en_name=name)
    except Area.DoesNotExist:
        pass
    else:
        db_dir_path = os.path.join(settings.STATIC_ROOT, 'city_db/')
        src = db_dir_path + sql_schema
        dst = db_dir_path + name + '.sql'
        shutil.copyfile(src, dst)
        with open(dst, 'a') as fp:
            topics = area.topic_set.all()
            count = 0
            for topic in topics:
                line = topic_template.substitute(**topic.__dict__).encode('utf-8')
                fp.write('%s\n' % line)
                for p in topic.place_set.all():
                    count += 1
                    line = place_in_topic_template.substitute(id=count, place_id=p.id, topic_id=topic.id)
                    fp.write('%s\n' % line)
            places = area.place_set.all()
            for place in places:
                place.__dict__ = handle_single_quote(**place.__dict__)
                info = generate_place_info(place)
                print info
                line = place_template.substitute(id=place.id, zh_name=place.zh_name, en_name=place.en_name, \
                    category=place.category, in_area_id=place.in_area_id, longitude=place.longitude, latitude=place.latitude, \
                    fit_time = place.fit_time, short_desc=place.short_desc, info=info).encode('utf-8')
                fp.write('%s\n' % line)
                for pic in place.picture_set.all():
                    pic.__dict__ = handle_single_quote(**pic.__dict__)
                    line = picture_template.substitute(**pic.__dict__).encode('utf-8')
                    fp.write('%s\n' % line)
            fp.write('COMMIT;')

def export_city_db(name):
    area_dir_path = os.path.join(settings.STATIC_ROOT, 'cities/', name)
    #检查目录
    if not site.storage.isdir(area_dir_path):
        raise IOError
    #生成db
    sql_path = area_dir_path + name + '.sql'
    db_path = area_dir_path + name + '.db'
    with open(sql_path, 'r') as fp:
        connection = sqlite3.connect(db_path)
        cursor = connection.cursor()
        cursor.executescript(fp.read())
        connection.commit()
        cursor.close()
    #删除sql脚本
    site.storage.delete(sql_path)

#######################################################