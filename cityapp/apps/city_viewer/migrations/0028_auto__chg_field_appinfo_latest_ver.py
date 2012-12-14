# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):

        # Changing field 'APPInfo.latest_ver'
        db.alter_column(u'city_viewer_appinfo', 'latest_ver', self.gf('django.db.models.fields.CharField')(max_length=4))

    def backwards(self, orm):

        # Changing field 'APPInfo.latest_ver'
        db.alter_column(u'city_viewer_appinfo', 'latest_ver', self.gf('django.db.models.fields.CharField')(max_length=3))

    models = {
        'auth.group': {
            'Meta': {'object_name': 'Group'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '80'}),
            'permissions': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['auth.Permission']", 'symmetrical': 'False', 'blank': 'True'})
        },
        'auth.permission': {
            'Meta': {'ordering': "('content_type__app_label', 'content_type__model', 'codename')", 'unique_together': "(('content_type', 'codename'),)", 'object_name': 'Permission'},
            'codename': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'content_type': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['contenttypes.ContentType']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '50'})
        },
        'auth.user': {
            'Meta': {'object_name': 'User'},
            'date_joined': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'email': ('django.db.models.fields.EmailField', [], {'max_length': '75', 'blank': 'True'}),
            'first_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'groups': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['auth.Group']", 'symmetrical': 'False', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'is_active': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'is_staff': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'is_superuser': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'last_login': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'last_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'password': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            'user_permissions': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['auth.Permission']", 'symmetrical': 'False', 'blank': 'True'}),
            'username': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '30'})
        },
        u'city_viewer.appdevice': {
            'Meta': {'object_name': 'APPDevice'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'identifier': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'platform': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'system': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        u'city_viewer.appdevicetoken': {
            'Meta': {'object_name': 'APPDeviceToken'},
            'app': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['city_viewer.APPInfo']"}),
            'device': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['city_viewer.APPDevice']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'token': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        u'city_viewer.appinfo': {
            'Meta': {'object_name': 'APPInfo'},
            'area': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['city_viewer.Area']", 'null': 'True', 'on_delete': 'models.SET_NULL', 'blank': 'True'}),
            'asid': ('django.db.models.fields.CharField', [], {'default': "u'0'", 'max_length': '10'}),
            'desc': ('django.db.models.fields.TextField', [], {}),
            'icon': ('django.db.models.fields.files.ImageField', [], {'max_length': '100'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'latest_ver': ('django.db.models.fields.CharField', [], {'default': "u'1000'", 'max_length': '4'}),
            'link': ('django.db.models.fields.URLField', [], {'max_length': '200', 'blank': 'True'}),
            'msg': ('django.db.models.fields.CharField', [], {'max_length': '100', 'blank': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '50'}),
            'sell_date': ('django.db.models.fields.DateField', [], {})
        },
        u'city_viewer.appinstall': {
            'Meta': {'object_name': 'APPInstall'},
            'app': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['city_viewer.APPInfo']"}),
            'created_at': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now', 'blank': 'True'}),
            'device': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['city_viewer.APPDevice']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'})
        },
        u'city_viewer.applike': {
            'Meta': {'object_name': 'APPLike'},
            'app': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['city_viewer.APPInfo']"}),
            'created_at': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now', 'blank': 'True'}),
            'device': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['city_viewer.APPDevice']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'})
        },
        u'city_viewer.appreview': {
            'Meta': {'object_name': 'APPReview'},
            'app': ('django.db.models.fields.related.ForeignKey', [], {'default': "u'1'", 'to': u"orm['city_viewer.APPInfo']", 'blank': 'True'}),
            'contact': ('django.db.models.fields.CharField', [], {'max_length': '100', 'blank': 'True'}),
            'content': ('django.db.models.fields.TextField', [], {}),
            'created_at': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now', 'blank': 'True'}),
            'device': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['city_viewer.APPDevice']", 'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'ip': ('django.db.models.fields.IPAddressField', [], {'default': "u'0.0.0.0'", 'max_length': '15', 'blank': 'True'}),
            'source': ('django.db.models.fields.CharField', [], {'default': "u'APP'", 'max_length': '3'}),
            'title': ('django.db.models.fields.CharField', [], {'default': "u'\\u7528\\u6237\\u53cd\\u9988'", 'max_length': '100', 'blank': 'True'}),
            'tracked': ('django.db.models.fields.CharField', [], {'default': "u'\\u672a\\u5904\\u7406'", 'max_length': '255'})
        },
        u'city_viewer.area': {
            'Meta': {'object_name': 'Area'},
            'author': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['auth.User']"}),
            'author_desc': ('django.db.models.fields.TextField', [], {}),
            'created_at': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now', 'blank': 'True'}),
            'en_name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '50', 'blank': 'True'}),
            'hotel_link': ('django.db.models.fields.URLField', [], {'max_length': '200'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'zh_name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '50'})
        },
        u'city_viewer.asaccount': {
            'Meta': {'object_name': 'ASAccount'},
            'created_at': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now', 'blank': 'True'}),
            'email': ('django.db.models.fields.EmailField', [], {'max_length': '75'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'is_valid': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'password': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'remark': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'})
        },
        u'city_viewer.channel': {
            'Meta': {'object_name': 'Channel'},
            'app': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['city_viewer.APPInfo']"}),
            'created_at': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        u'city_viewer.clickstat': {
            'Meta': {'object_name': 'ClickStat'},
            'channel': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['city_viewer.Channel']"}),
            'created_at': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'ip': ('django.db.models.fields.IPAddressField', [], {'default': "u'0.0.0.0'", 'max_length': '15', 'blank': 'True'})
        },
        u'city_viewer.offlinemap': {
            'Meta': {'object_name': 'OfflineMap'},
            'center': ('django.db.models.fields.CharField', [], {'default': "u'0,0'", 'max_length': '100'}),
            'file': ('django.db.models.fields.files.FileField', [], {'max_length': '100'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'in_area': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['city_viewer.Area']", 'null': 'True', 'on_delete': 'models.SET_NULL', 'blank': 'True'}),
            'max_zoom': ('django.db.models.fields.CharField', [], {'default': "u'18'", 'max_length': '2'}),
            'min_zoom': ('django.db.models.fields.CharField', [], {'default': "u'12'", 'max_length': '2'}),
            'modified_at': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now', 'blank': 'True'}),
            'version': ('django.db.models.fields.SmallIntegerField', [], {'default': '1'}),
            'zoom': ('django.db.models.fields.CharField', [], {'default': "u'16'", 'max_length': '2'})
        },
        u'city_viewer.picture': {
            'Meta': {'ordering': "[u'weight']", 'object_name': 'Picture'},
            'desc': ('django.db.models.fields.CharField', [], {'max_length': '255', 'blank': 'True'}),
            'file_name': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'id': ('django.db.models.fields.CharField', [], {'max_length': '36', 'primary_key': 'True'}),
            'in_place': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['city_viewer.Place']"}),
            'modified_at': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now', 'blank': 'True'}),
            'url': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'weight': ('django.db.models.fields.SmallIntegerField', [], {'default': '0'})
        },
        u'city_viewer.place': {
            'Meta': {'object_name': 'Place'},
            'address': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'category': ('django.db.models.fields.SmallIntegerField', [], {}),
            'en_name': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'fit_time': ('django.db.models.fields.SmallIntegerField', [], {}),
            'full_desc': ('django.db.models.fields.TextField', [], {}),
            'id': ('django.db.models.fields.CharField', [], {'max_length': '36', 'primary_key': 'True'}),
            'in_area': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['city_viewer.Area']"}),
            'in_topics': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['city_viewer.Topic']", 'symmetrical': 'False'}),
            'latitude': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            'longitude': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            'modified_at': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now', 'blank': 'True'}),
            'open_time': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'price': ('django.db.models.fields.CharField', [], {'max_length': '255', 'blank': 'True'}),
            'short_desc': ('django.db.models.fields.CharField', [], {'max_length': '100', 'blank': 'True'}),
            'tel': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'tips': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'traffic': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'website': ('django.db.models.fields.CharField', [], {'max_length': '255', 'blank': 'True'}),
            'zh_name': ('django.db.models.fields.CharField', [], {'max_length': '50'})
        },
        u'city_viewer.topic': {
            'Meta': {'object_name': 'Topic'},
            'cover_pic': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'desc': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'id': ('django.db.models.fields.CharField', [], {'max_length': '36', 'primary_key': 'True'}),
            'in_area': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['city_viewer.Area']"}),
            'modified_at': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now', 'blank': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'weight': ('django.db.models.fields.SmallIntegerField', [], {})
        },
        u'city_viewer.triptip': {
            'Meta': {'ordering': "[u'weight']", 'object_name': 'TripTip'},
            'content': ('tinymce.models.HTMLField', [], {}),
            'id': ('django.db.models.fields.CharField', [], {'max_length': '36', 'primary_key': 'True'}),
            'in_area': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['city_viewer.Area']"}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'weight': ('django.db.models.fields.SmallIntegerField', [], {})
        },
        u'city_viewer.userprofile': {
            'Meta': {'object_name': 'UserProfile'},
            'cover': ('django.db.models.fields.files.ImageField', [], {'max_length': '100', 'blank': 'True'}),
            'created_at': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now', 'blank': 'True'}),
            'douban_url': ('django.db.models.fields.URLField', [], {'max_length': '200', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'mugshot': ('django.db.models.fields.files.ImageField', [], {'max_length': '100', 'blank': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            'philosophy': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'privacy': ('django.db.models.fields.CharField', [], {'default': "'registered'", 'max_length': '15'}),
            'user': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['auth.User']", 'unique': 'True'}),
            'weibo_url': ('django.db.models.fields.URLField', [], {'max_length': '200', 'blank': 'True'})
        },
        'contenttypes.contenttype': {
            'Meta': {'ordering': "('name',)", 'unique_together': "(('app_label', 'model'),)", 'object_name': 'ContentType', 'db_table': "'django_content_type'"},
            'app_label': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'model': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        }
    }

    complete_apps = ['city_viewer']