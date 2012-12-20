# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'APNService'
        db.create_table('ios_notifications_apnservice', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('app', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['city_viewer.APPInfo'])),
            ('hostname', self.gf('django.db.models.fields.CharField')(default='gateway.push.apple.com', max_length=100)),
            ('certificate', self.gf('django.db.models.fields.TextField')()),
            ('private_key', self.gf('django.db.models.fields.TextField')()),
            ('passphrase', self.gf('django_fields.fields.EncryptedCharField')(max_length=101, null=True, cipher='AES', blank=True)),
        ))
        db.send_create_signal('ios_notifications', ['APNService'])

        # Adding unique constraint on 'APNService', fields ['app', 'hostname']
        db.create_unique('ios_notifications_apnservice', ['app_id', 'hostname'])

        # Adding model 'Notification'
        db.create_table('ios_notifications_notification', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('message', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('badge', self.gf('django.db.models.fields.PositiveIntegerField')(default=1, null=True)),
            ('sound', self.gf('django.db.models.fields.CharField')(default='default', max_length=30, null=True)),
            ('created_at', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
            ('last_sent_at', self.gf('django.db.models.fields.DateTimeField')(null=True, blank=True)),
        ))
        db.send_create_signal('ios_notifications', ['Notification'])

        # Adding M2M table for field services on 'Notification'
        db.create_table('ios_notifications_notification_services', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('notification', models.ForeignKey(orm['ios_notifications.notification'], null=False)),
            ('apnservice', models.ForeignKey(orm['ios_notifications.apnservice'], null=False))
        ))
        db.create_unique('ios_notifications_notification_services', ['notification_id', 'apnservice_id'])

        # Adding model 'DeviceToken'
        db.create_table('ios_notifications_devicetoken', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('token', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('is_active', self.gf('django.db.models.fields.BooleanField')(default=True)),
            ('deactivated_at', self.gf('django.db.models.fields.DateTimeField')(null=True, blank=True)),
            ('service', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['ios_notifications.APNService'])),
            ('added_at', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
            ('last_notified_at', self.gf('django.db.models.fields.DateTimeField')(null=True, blank=True)),
            ('device', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['city_viewer.APPDevice'])),
        ))
        db.send_create_signal('ios_notifications', ['DeviceToken'])

        # Adding unique constraint on 'DeviceToken', fields ['token', 'service']
        db.create_unique('ios_notifications_devicetoken', ['token', 'service_id'])

        # Adding model 'FeedbackService'
        db.create_table('ios_notifications_feedbackservice', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('app', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['city_viewer.APPInfo'])),
            ('hostname', self.gf('django.db.models.fields.CharField')(default='gateway.push.apple.com', max_length=100)),
            ('apn_service', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['ios_notifications.APNService'])),
        ))
        db.send_create_signal('ios_notifications', ['FeedbackService'])

        # Adding unique constraint on 'FeedbackService', fields ['app', 'hostname']
        db.create_unique('ios_notifications_feedbackservice', ['app_id', 'hostname'])


    def backwards(self, orm):
        # Removing unique constraint on 'FeedbackService', fields ['app', 'hostname']
        db.delete_unique('ios_notifications_feedbackservice', ['app_id', 'hostname'])

        # Removing unique constraint on 'DeviceToken', fields ['token', 'service']
        db.delete_unique('ios_notifications_devicetoken', ['token', 'service_id'])

        # Removing unique constraint on 'APNService', fields ['app', 'hostname']
        db.delete_unique('ios_notifications_apnservice', ['app_id', 'hostname'])

        # Deleting model 'APNService'
        db.delete_table('ios_notifications_apnservice')

        # Deleting model 'Notification'
        db.delete_table('ios_notifications_notification')

        # Removing M2M table for field services on 'Notification'
        db.delete_table('ios_notifications_notification_services')

        # Deleting model 'DeviceToken'
        db.delete_table('ios_notifications_devicetoken')

        # Deleting model 'FeedbackService'
        db.delete_table('ios_notifications_feedbackservice')


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
            'identifier': ('django.db.models.fields.CharField', [], {'max_length': '255', 'db_index': 'True'}),
            'platform': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'system': ('django.db.models.fields.CharField', [], {'max_length': '100'})
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
        'contenttypes.contenttype': {
            'Meta': {'ordering': "('name',)", 'unique_together': "(('app_label', 'model'),)", 'object_name': 'ContentType', 'db_table': "'django_content_type'"},
            'app_label': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'model': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'ios_notifications.apnservice': {
            'Meta': {'unique_together': "(('app', 'hostname'),)", 'object_name': 'APNService'},
            'app': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['city_viewer.APPInfo']"}),
            'certificate': ('django.db.models.fields.TextField', [], {}),
            'hostname': ('django.db.models.fields.CharField', [], {'default': "'gateway.push.apple.com'", 'max_length': '100'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'passphrase': ('django_fields.fields.EncryptedCharField', [], {'max_length': '101', 'null': 'True', 'cipher': "'AES'", 'blank': 'True'}),
            'private_key': ('django.db.models.fields.TextField', [], {})
        },
        'ios_notifications.devicetoken': {
            'Meta': {'unique_together': "(('token', 'service'),)", 'object_name': 'DeviceToken'},
            'added_at': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'deactivated_at': ('django.db.models.fields.DateTimeField', [], {'null': 'True', 'blank': 'True'}),
            'device': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['city_viewer.APPDevice']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'is_active': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'last_notified_at': ('django.db.models.fields.DateTimeField', [], {'null': 'True', 'blank': 'True'}),
            'service': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['ios_notifications.APNService']"}),
            'token': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'ios_notifications.feedbackservice': {
            'Meta': {'unique_together': "(('app', 'hostname'),)", 'object_name': 'FeedbackService'},
            'apn_service': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['ios_notifications.APNService']"}),
            'app': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['city_viewer.APPInfo']"}),
            'hostname': ('django.db.models.fields.CharField', [], {'default': "'gateway.push.apple.com'", 'max_length': '100'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'})
        },
        'ios_notifications.notification': {
            'Meta': {'object_name': 'Notification'},
            'badge': ('django.db.models.fields.PositiveIntegerField', [], {'default': '1', 'null': 'True'}),
            'created_at': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'last_sent_at': ('django.db.models.fields.DateTimeField', [], {'null': 'True', 'blank': 'True'}),
            'message': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'services': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['ios_notifications.APNService']", 'symmetrical': 'False'}),
            'sound': ('django.db.models.fields.CharField', [], {'default': "'default'", 'max_length': '30', 'null': 'True'})
        }
    }

    complete_apps = ['ios_notifications']