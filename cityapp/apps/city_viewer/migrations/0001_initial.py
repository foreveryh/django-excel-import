# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'UserProfile'
        db.create_table(u'city_viewer_userprofile', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('mugshot', self.gf('django.db.models.fields.files.ImageField')(max_length=100, blank=True)),
            ('privacy', self.gf('django.db.models.fields.CharField')(default='registered', max_length=15)),
            ('user', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['auth.User'], unique=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=20)),
            ('cover', self.gf('django.db.models.fields.files.ImageField')(max_length=100, blank=True)),
            ('philosophy', self.gf('django.db.models.fields.CharField')(max_length=255)),
            ('weibo_url', self.gf('django.db.models.fields.URLField')(max_length=200, blank=True)),
            ('douban_url', self.gf('django.db.models.fields.URLField')(max_length=200, blank=True)),
            ('created_at', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime.now, blank=True)),
        ))
        db.send_create_signal(u'city_viewer', ['UserProfile'])

        # Adding model 'Area'
        db.create_table(u'city_viewer_area', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('zh_name', self.gf('django.db.models.fields.CharField')(unique=True, max_length=50)),
            ('en_name', self.gf('django.db.models.fields.CharField')(unique=True, max_length=50, blank=True)),
            ('cover_pic', self.gf('django.db.models.fields.files.ImageField')(max_length=100, blank=True)),
            ('author', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['auth.User'])),
            ('author_desc', self.gf('django.db.models.fields.TextField')()),
            ('create_at', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime.now, blank=True)),
            ('offline_map', self.gf('django.db.models.fields.files.FileField')(max_length=100, blank=True)),
        ))
        db.send_create_signal(u'city_viewer', ['Area'])

        # Adding model 'Topic'
        db.create_table(u'city_viewer_topic', (
            ('id', self.gf('django.db.models.fields.CharField')(max_length=36, primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=50)),
            ('desc', self.gf('django.db.models.fields.CharField')(max_length=255)),
            ('in_area', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['city_viewer.Area'])),
            ('weight', self.gf('django.db.models.fields.SmallIntegerField')()),
            ('pic', self.gf('django.db.models.fields.FilePathField')(max_length=100)),
        ))
        db.send_create_signal(u'city_viewer', ['Topic'])

        # Adding model 'Place'
        db.create_table(u'city_viewer_place', (
            ('id', self.gf('django.db.models.fields.CharField')(max_length=36, primary_key=True)),
            ('zh_name', self.gf('django.db.models.fields.CharField')(max_length=50)),
            ('en_name', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('category', self.gf('django.db.models.fields.SmallIntegerField')()),
            ('in_area', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['city_viewer.Area'])),
            ('longitude', self.gf('django.db.models.fields.CharField')(max_length=20)),
            ('latitude', self.gf('django.db.models.fields.CharField')(max_length=20)),
            ('short_desc', self.gf('django.db.models.fields.CharField')(max_length=100, blank=True)),
            ('full_desc', self.gf('django.db.models.fields.TextField')()),
            ('fit_time', self.gf('django.db.models.fields.SmallIntegerField')()),
            ('open_time', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('address', self.gf('django.db.models.fields.CharField')(max_length=255)),
            ('traffic', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('price', self.gf('django.db.models.fields.CharField')(max_length=100, blank=True)),
            ('tel', self.gf('django.db.models.fields.CharField')(max_length=30, blank=True)),
            ('website', self.gf('django.db.models.fields.CharField')(max_length=255, blank=True)),
            ('tips', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('modified_at', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime.now, blank=True)),
        ))
        db.send_create_signal(u'city_viewer', ['Place'])

        # Adding M2M table for field in_topics on 'Place'
        db.create_table(u'city_viewer_place_in_topics', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('place', models.ForeignKey(orm[u'city_viewer.place'], null=False)),
            ('topic', models.ForeignKey(orm[u'city_viewer.topic'], null=False))
        ))
        db.create_unique(u'city_viewer_place_in_topics', ['place_id', 'topic_id'])

        # Adding model 'Picture'
        db.create_table(u'city_viewer_picture', (
            ('id', self.gf('django.db.models.fields.CharField')(max_length=36, primary_key=True)),
            ('file_name', self.gf('django.db.models.fields.CharField')(max_length=50)),
            ('url', self.gf('django.db.models.fields.CharField')(max_length=255)),
            ('desc', self.gf('django.db.models.fields.CharField')(max_length=255, blank=True)),
            ('in_place', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['city_viewer.Place'])),
            ('weight', self.gf('django.db.models.fields.SmallIntegerField')(default=0)),
            ('create_at', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime.now, blank=True)),
        ))
        db.send_create_signal(u'city_viewer', ['Picture'])

        # Adding model 'TripTip'
        db.create_table(u'city_viewer_triptip', (
            ('id', self.gf('django.db.models.fields.CharField')(max_length=36, primary_key=True)),
            ('title', self.gf('django.db.models.fields.CharField')(max_length=50)),
            ('content', self.gf('tinymce.models.HTMLField')()),
            ('in_area', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['city_viewer.Area'])),
            ('weight', self.gf('django.db.models.fields.SmallIntegerField')()),
        ))
        db.send_create_signal(u'city_viewer', ['TripTip'])

        # Adding model 'APPInfo'
        db.create_table(u'city_viewer_appinfo', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(unique=True, max_length=50)),
            ('icon', self.gf('django.db.models.fields.files.ImageField')(max_length=100)),
            ('desc', self.gf('django.db.models.fields.TextField')(max_length=255)),
            ('link', self.gf('django.db.models.fields.URLField')(max_length=200, blank=True)),
            ('liked', self.gf('django.db.models.fields.SmallIntegerField')(default=100)),
            ('down_count', self.gf('django.db.models.fields.SmallIntegerField')(default=0)),
            ('uninstall_count', self.gf('django.db.models.fields.SmallIntegerField')(default=0)),
            ('sell_date', self.gf('django.db.models.fields.DateField')()),
        ))
        db.send_create_signal(u'city_viewer', ['APPInfo'])

        # Adding model 'APPReview'
        db.create_table(u'city_viewer_appreview', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('title', self.gf('django.db.models.fields.CharField')(max_length=100, blank=True)),
            ('content', self.gf('django.db.models.fields.TextField')()),
            ('datetime', self.gf('django.db.models.fields.DateTimeField')()),
            ('contact', self.gf('django.db.models.fields.CharField')(max_length=50, blank=True)),
            ('tracked', self.gf('django.db.models.fields.CharField')(max_length=255, blank=True)),
            ('source', self.gf('django.db.models.fields.CharField')(max_length=3)),
        ))
        db.send_create_signal(u'city_viewer', ['APPReview'])


    def backwards(self, orm):
        # Deleting model 'UserProfile'
        db.delete_table(u'city_viewer_userprofile')

        # Deleting model 'Area'
        db.delete_table(u'city_viewer_area')

        # Deleting model 'Topic'
        db.delete_table(u'city_viewer_topic')

        # Deleting model 'Place'
        db.delete_table(u'city_viewer_place')

        # Removing M2M table for field in_topics on 'Place'
        db.delete_table('city_viewer_place_in_topics')

        # Deleting model 'Picture'
        db.delete_table(u'city_viewer_picture')

        # Deleting model 'TripTip'
        db.delete_table(u'city_viewer_triptip')

        # Deleting model 'APPInfo'
        db.delete_table(u'city_viewer_appinfo')

        # Deleting model 'APPReview'
        db.delete_table(u'city_viewer_appreview')


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
        u'city_viewer.appinfo': {
            'Meta': {'object_name': 'APPInfo'},
            'desc': ('django.db.models.fields.TextField', [], {'max_length': '255'}),
            'down_count': ('django.db.models.fields.SmallIntegerField', [], {'default': '0'}),
            'icon': ('django.db.models.fields.files.ImageField', [], {'max_length': '100'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'liked': ('django.db.models.fields.SmallIntegerField', [], {'default': '100'}),
            'link': ('django.db.models.fields.URLField', [], {'max_length': '200', 'blank': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '50'}),
            'sell_date': ('django.db.models.fields.DateField', [], {}),
            'uninstall_count': ('django.db.models.fields.SmallIntegerField', [], {'default': '0'})
        },
        u'city_viewer.appreview': {
            'Meta': {'object_name': 'APPReview'},
            'contact': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'content': ('django.db.models.fields.TextField', [], {}),
            'datetime': ('django.db.models.fields.DateTimeField', [], {}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'source': ('django.db.models.fields.CharField', [], {'max_length': '3'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '100', 'blank': 'True'}),
            'tracked': ('django.db.models.fields.CharField', [], {'max_length': '255', 'blank': 'True'})
        },
        u'city_viewer.area': {
            'Meta': {'object_name': 'Area'},
            'author': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['auth.User']"}),
            'author_desc': ('django.db.models.fields.TextField', [], {}),
            'cover_pic': ('django.db.models.fields.files.ImageField', [], {'max_length': '100', 'blank': 'True'}),
            'create_at': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now', 'blank': 'True'}),
            'en_name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '50', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'offline_map': ('django.db.models.fields.files.FileField', [], {'max_length': '100', 'blank': 'True'}),
            'zh_name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '50'})
        },
        u'city_viewer.picture': {
            'Meta': {'ordering': "[u'weight']", 'object_name': 'Picture'},
            'create_at': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now', 'blank': 'True'}),
            'desc': ('django.db.models.fields.CharField', [], {'max_length': '255', 'blank': 'True'}),
            'file_name': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'id': ('django.db.models.fields.CharField', [], {'max_length': '36', 'primary_key': 'True'}),
            'in_place': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['city_viewer.Place']"}),
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
            'price': ('django.db.models.fields.CharField', [], {'max_length': '100', 'blank': 'True'}),
            'short_desc': ('django.db.models.fields.CharField', [], {'max_length': '100', 'blank': 'True'}),
            'tel': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'tips': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'traffic': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'website': ('django.db.models.fields.CharField', [], {'max_length': '255', 'blank': 'True'}),
            'zh_name': ('django.db.models.fields.CharField', [], {'max_length': '50'})
        },
        u'city_viewer.topic': {
            'Meta': {'object_name': 'Topic'},
            'desc': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'id': ('django.db.models.fields.CharField', [], {'max_length': '36', 'primary_key': 'True'}),
            'in_area': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['city_viewer.Area']"}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'pic': ('django.db.models.fields.FilePathField', [], {'max_length': '100'}),
            'weight': ('django.db.models.fields.SmallIntegerField', [], {})
        },
        u'city_viewer.triptip': {
            'Meta': {'ordering': "[u'-weight']", 'object_name': 'TripTip'},
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