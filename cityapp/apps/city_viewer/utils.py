# -*- coding: utf-8 -*-
import os
import shutil
import sqlite3
from string import Template
from django.conf import settings
from cityapp.apps.city_viewer.models import Area


topic_template = Template("""INSERT INTO "city_topic" VALUES('${id}','${name}','${desc}',${in_area_id},${weight});""")
place_template = Template("""INSERT INTO "city_place" VALUES('${id}','${zh_name}','${en_name}',${category},${in_area_id},'${longitude}','${latitude}','${short_desc}','${full_desc}',${fit_time},'${open_time}','${address}','${traffic}','${price}','${tel}','${website}','${tips}','${modified_at}'); """)
place_in_topic_template = Template("""INSERT INTO "city_place_in_topics" VALUES('${id}','${place_id}','${topic_id}');""");
picture_template = Template("""INSERT INTO "city_picture" VALUES('${id}','${file_name}','${url}','${desc}','${in_place_id}','${create_at}');""")
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
                line = place_template.substitute(**place.__dict__).encode('utf-8')
                fp.write('%s\n' % line)
                for pic in place.picture_set.all():
                    line = picture_template.substitute(**pic.__dict__).encode('utf-8')
                    fp.write('%s\n' % line)
            fp.write('COMMIT;')

def export_city_db(name):
    db_dir_path = os.path.join(settings.STATIC_ROOT, 'city_db/')
    sql_path = db_dir_path + name + '.sql'
    db_path = db_dir_path + name + '.db'
    with open(sql_path, 'r') as fp:
        connection = sqlite3.connect(db_path)
        cursor = connection.cursor()
        cursor.executescript(fp.read())
        connection.commit()
        cursor.close()

