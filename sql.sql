PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "django_admin_log" (
    "id" integer NOT NULL PRIMARY KEY,
    "action_time" datetime NOT NULL,
    "user_id" integer NOT NULL,
    "content_type_id" integer,
    "object_id" text,
    "object_repr" varchar(200) NOT NULL,
    "action_flag" smallint unsigned NOT NULL,
    "change_message" text NOT NULL
);
INSERT INTO "django_admin_log" VALUES(1,'2012-10-04 15:55:45.049059',1,10,'1','香港',2,'已修改 en_name 。');
INSERT INTO "django_admin_log" VALUES(2,'2012-10-06 03:26:05.458851',1,10,'1','香港',2,'已修改 cover_pic 。');
INSERT INTO "django_admin_log" VALUES(3,'2012-10-06 03:26:26.494828',1,10,'1','香港',2,'已修改 cover_pic 。');
INSERT INTO "django_admin_log" VALUES(4,'2012-10-06 09:56:28.301463',1,12,'68f91982-0f9b-11e2-8556-3c0754041eea','凯旋门[巴黎]',2,'没有字段被修改。');
INSERT INTO "django_admin_log" VALUES(5,'2012-10-06 09:57:29.307396',1,11,'3d5896ee-0f9c-11e2-b1e6-3c0754041eea','测试主题[巴黎]',1,'');
INSERT INTO "django_admin_log" VALUES(6,'2012-10-06 09:57:55.446777',1,12,'68f91982-0f9b-11e2-8556-3c0754041eea','凯旋门[巴黎]',2,'已修改 in_topics 。');
INSERT INTO "django_admin_log" VALUES(7,'2012-10-06 10:08:58.391163',1,10,'2','巴黎',2,'已修改 cover_pic 。');
CREATE TABLE "auth_permission" (
    "id" integer NOT NULL PRIMARY KEY,
    "name" varchar(50) NOT NULL,
    "content_type_id" integer NOT NULL,
    "codename" varchar(100) NOT NULL,
    UNIQUE ("content_type_id", "codename")
);
INSERT INTO "auth_permission" VALUES(1,'Can add log entry',1,'add_logentry');
INSERT INTO "auth_permission" VALUES(2,'Can change log entry',1,'change_logentry');
INSERT INTO "auth_permission" VALUES(3,'Can delete log entry',1,'delete_logentry');
INSERT INTO "auth_permission" VALUES(4,'Can add group',3,'add_group');
INSERT INTO "auth_permission" VALUES(5,'Can add permission',2,'add_permission');
INSERT INTO "auth_permission" VALUES(6,'Can add user',4,'add_user');
INSERT INTO "auth_permission" VALUES(7,'Can change group',3,'change_group');
INSERT INTO "auth_permission" VALUES(8,'Can change permission',2,'change_permission');
INSERT INTO "auth_permission" VALUES(9,'Can change user',4,'change_user');
INSERT INTO "auth_permission" VALUES(10,'Can delete group',3,'delete_group');
INSERT INTO "auth_permission" VALUES(11,'Can delete permission',2,'delete_permission');
INSERT INTO "auth_permission" VALUES(12,'Can delete user',4,'delete_user');
INSERT INTO "auth_permission" VALUES(13,'Can add content type',5,'add_contenttype');
INSERT INTO "auth_permission" VALUES(14,'Can change content type',5,'change_contenttype');
INSERT INTO "auth_permission" VALUES(15,'Can delete content type',5,'delete_contenttype');
INSERT INTO "auth_permission" VALUES(16,'Can add session',6,'add_session');
INSERT INTO "auth_permission" VALUES(17,'Can change session',6,'change_session');
INSERT INTO "auth_permission" VALUES(18,'Can delete session',6,'delete_session');
INSERT INTO "auth_permission" VALUES(19,'Can add site',7,'add_site');
INSERT INTO "auth_permission" VALUES(20,'Can change site',7,'change_site');
INSERT INTO "auth_permission" VALUES(21,'Can delete site',7,'delete_site');
INSERT INTO "auth_permission" VALUES(22,'Can add migration history',8,'add_migrationhistory');
INSERT INTO "auth_permission" VALUES(23,'Can change migration history',8,'change_migrationhistory');
INSERT INTO "auth_permission" VALUES(24,'Can delete migration history',8,'delete_migrationhistory');
INSERT INTO "auth_permission" VALUES(25,'Can add 主题',11,'add_topic');
INSERT INTO "auth_permission" VALUES(26,'Can add 作者资料',9,'add_userprofile');
INSERT INTO "auth_permission" VALUES(27,'Can add 地点',12,'add_place');
INSERT INTO "auth_permission" VALUES(28,'Can add 城市',10,'add_area');
INSERT INTO "auth_permission" VALUES(29,'Can change 主题',11,'change_topic');
INSERT INTO "auth_permission" VALUES(30,'Can change 作者资料',9,'change_userprofile');
INSERT INTO "auth_permission" VALUES(31,'Can change 地点',12,'change_place');
INSERT INTO "auth_permission" VALUES(32,'Can change 城市',10,'change_area');
INSERT INTO "auth_permission" VALUES(33,'Can delete 主题',11,'delete_topic');
INSERT INTO "auth_permission" VALUES(34,'Can delete 作者资料',9,'delete_userprofile');
INSERT INTO "auth_permission" VALUES(35,'Can delete 地点',12,'delete_place');
INSERT INTO "auth_permission" VALUES(36,'Can delete 城市',10,'delete_area');
INSERT INTO "auth_permission" VALUES(37,'View Area',10,'view_area');
INSERT INTO "auth_permission" VALUES(38,'Can add group object permission',14,'add_groupobjectpermission');
INSERT INTO "auth_permission" VALUES(39,'Can add user object permission',13,'add_userobjectpermission');
INSERT INTO "auth_permission" VALUES(40,'Can change group object permission',14,'change_groupobjectpermission');
INSERT INTO "auth_permission" VALUES(41,'Can change user object permission',13,'change_userobjectpermission');
INSERT INTO "auth_permission" VALUES(42,'Can delete group object permission',14,'delete_groupobjectpermission');
INSERT INTO "auth_permission" VALUES(43,'Can delete user object permission',13,'delete_userobjectpermission');
INSERT INTO "auth_permission" VALUES(44,'Can add userena registration',15,'add_userenasignup');
INSERT INTO "auth_permission" VALUES(45,'Can change userena registration',15,'change_userenasignup');
INSERT INTO "auth_permission" VALUES(46,'Can delete userena registration',15,'delete_userenasignup');
INSERT INTO "auth_permission" VALUES(47,'Can add source',16,'add_source');
INSERT INTO "auth_permission" VALUES(48,'Can add thumbnail',17,'add_thumbnail');
INSERT INTO "auth_permission" VALUES(49,'Can change source',16,'change_source');
INSERT INTO "auth_permission" VALUES(50,'Can change thumbnail',17,'change_thumbnail');
INSERT INTO "auth_permission" VALUES(51,'Can delete source',16,'delete_source');
INSERT INTO "auth_permission" VALUES(52,'Can delete thumbnail',17,'delete_thumbnail');
INSERT INTO "auth_permission" VALUES(53,'Can view profile',9,'view_profile');
INSERT INTO "auth_permission" VALUES(54,'Can change profile',9,'change_profile');
INSERT INTO "auth_permission" VALUES(55,'Can delete profile',9,'delete_profile');
INSERT INTO "auth_permission" VALUES(59,'Can add 图片',19,'add_picture');
INSERT INTO "auth_permission" VALUES(60,'Can change 图片',19,'change_picture');
INSERT INTO "auth_permission" VALUES(61,'Can delete 图片',19,'delete_picture');
INSERT INTO "auth_permission" VALUES(62,'Can add zip file',20,'add_zipfile');
INSERT INTO "auth_permission" VALUES(63,'Can change zip file',20,'change_zipfile');
INSERT INTO "auth_permission" VALUES(64,'Can delete zip file',20,'delete_zipfile');
CREATE TABLE "auth_group_permissions" (
    "id" integer NOT NULL PRIMARY KEY,
    "group_id" integer NOT NULL,
    "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"),
    UNIQUE ("group_id", "permission_id")
);
CREATE TABLE "auth_group" (
    "id" integer NOT NULL PRIMARY KEY,
    "name" varchar(80) NOT NULL UNIQUE
);
CREATE TABLE "auth_user_user_permissions" (
    "id" integer NOT NULL PRIMARY KEY,
    "user_id" integer NOT NULL,
    "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"),
    UNIQUE ("user_id", "permission_id")
);
CREATE TABLE "auth_user_groups" (
    "id" integer NOT NULL PRIMARY KEY,
    "user_id" integer NOT NULL,
    "group_id" integer NOT NULL REFERENCES "auth_group" ("id"),
    UNIQUE ("user_id", "group_id")
);
CREATE TABLE "auth_user" (
    "id" integer NOT NULL PRIMARY KEY,
    "username" varchar(30) NOT NULL UNIQUE,
    "first_name" varchar(30) NOT NULL,
    "last_name" varchar(30) NOT NULL,
    "email" varchar(75) NOT NULL,
    "password" varchar(128) NOT NULL,
    "is_staff" bool NOT NULL,
    "is_active" bool NOT NULL,
    "is_superuser" bool NOT NULL,
    "last_login" datetime NOT NULL,
    "date_joined" datetime NOT NULL
);
INSERT INTO "auth_user" VALUES(-1,'AnonymousUser','','','','',0,1,0,'2012-10-03 08:21:49.284960','2012-10-03 08:21:49.284977');
INSERT INTO "auth_user" VALUES(1,'xiaoxia','','','gaopeng@tukeq.com','pbkdf2_sha256$10000$JsLrBTkfx2O2$WA859sJsf+1qULjRfTsbW5JdIo+89AhmO7dGwtkeDgY=',1,1,1,'2012-10-03 08:49:09.355523','2012-10-03 08:21:42.082063');
CREATE TABLE "django_content_type" (
    "id" integer NOT NULL PRIMARY KEY,
    "name" varchar(100) NOT NULL,
    "app_label" varchar(100) NOT NULL,
    "model" varchar(100) NOT NULL,
    UNIQUE ("app_label", "model")
);
INSERT INTO "django_content_type" VALUES(1,'log entry','admin','logentry');
INSERT INTO "django_content_type" VALUES(2,'permission','auth','permission');
INSERT INTO "django_content_type" VALUES(3,'group','auth','group');
INSERT INTO "django_content_type" VALUES(4,'user','auth','user');
INSERT INTO "django_content_type" VALUES(5,'content type','contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES(6,'session','sessions','session');
INSERT INTO "django_content_type" VALUES(7,'site','sites','site');
INSERT INTO "django_content_type" VALUES(8,'migration history','south','migrationhistory');
INSERT INTO "django_content_type" VALUES(9,'作者资料','city_viewer','userprofile');
INSERT INTO "django_content_type" VALUES(10,'城市','city_viewer','area');
INSERT INTO "django_content_type" VALUES(11,'主题','city_viewer','topic');
INSERT INTO "django_content_type" VALUES(12,'地点','city_viewer','place');
INSERT INTO "django_content_type" VALUES(13,'user object permission','guardian','userobjectpermission');
INSERT INTO "django_content_type" VALUES(14,'group object permission','guardian','groupobjectpermission');
INSERT INTO "django_content_type" VALUES(15,'userena registration','userena','userenasignup');
INSERT INTO "django_content_type" VALUES(16,'source','easy_thumbnails','source');
INSERT INTO "django_content_type" VALUES(17,'thumbnail','easy_thumbnails','thumbnail');
INSERT INTO "django_content_type" VALUES(19,'图片','city_viewer','picture');
INSERT INTO "django_content_type" VALUES(20,'zip file','excel_handler','zipfile');
CREATE TABLE "django_session" (
    "session_key" varchar(40) NOT NULL PRIMARY KEY,
    "session_data" text NOT NULL,
    "expire_date" datetime NOT NULL
);
INSERT INTO "django_session" VALUES('0c5146642cbcaf88fa57549bafad0cdb','OWQ0OTIyOTViOWQ2ODE1NGU3MWFmM2VlNWJkM2VhYjFmODhiM2IwMjqAAn1xAShVEl9hdXRoX3Vz
ZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED
VQ1fYXV0aF91c2VyX2lkcQRLAXUu
','2012-10-17 08:49:09.359507');
CREATE TABLE "django_site" (
    "id" integer NOT NULL PRIMARY KEY,
    "domain" varchar(100) NOT NULL,
    "name" varchar(50) NOT NULL
);
INSERT INTO "django_site" VALUES(1,'example.com','example.com');
CREATE TABLE "south_migrationhistory" (
    "id" integer NOT NULL PRIMARY KEY,
    "app_name" varchar(255) NOT NULL,
    "migration" varchar(255) NOT NULL,
    "applied" datetime NOT NULL
);
INSERT INTO "south_migrationhistory" VALUES(1,'guardian','0001_initial','2012-10-03 08:21:49.103500');
INSERT INTO "south_migrationhistory" VALUES(2,'guardian','0002_auto__add_field_groupobjectpermission_object_pk__add_field_userobjectp','2012-10-03 08:21:49.143752');
INSERT INTO "south_migrationhistory" VALUES(3,'guardian','0003_update_objectpermission_object_pk','2012-10-03 08:21:49.159676');
INSERT INTO "south_migrationhistory" VALUES(4,'guardian','0004_auto__del_field_groupobjectpermission_object_id__del_unique_groupobjec','2012-10-03 08:21:49.254998');
INSERT INTO "south_migrationhistory" VALUES(5,'guardian','0005_auto__chg_field_groupobjectpermission_object_pk__chg_field_userobjectp','2012-10-03 08:21:49.268849');
INSERT INTO "south_migrationhistory" VALUES(6,'userena','0001_initial','2012-10-03 08:21:49.327709');
INSERT INTO "south_migrationhistory" VALUES(7,'easy_thumbnails','0001_initial','2012-10-03 08:21:49.379199');
INSERT INTO "south_migrationhistory" VALUES(8,'easy_thumbnails','0002_filename_indexes','2012-10-03 08:21:49.394972');
INSERT INTO "south_migrationhistory" VALUES(9,'easy_thumbnails','0003_auto__add_storagenew','2012-10-03 08:21:49.409715');
INSERT INTO "south_migrationhistory" VALUES(10,'easy_thumbnails','0004_auto__add_field_source_storage_new__add_field_thumbnail_storage_new','2012-10-03 08:21:49.442125');
INSERT INTO "south_migrationhistory" VALUES(11,'easy_thumbnails','0005_storage_fks_null','2012-10-03 08:21:49.477362');
INSERT INTO "south_migrationhistory" VALUES(12,'easy_thumbnails','0006_copy_storage','2012-10-03 08:21:49.488230');
INSERT INTO "south_migrationhistory" VALUES(13,'easy_thumbnails','0007_storagenew_fks_not_null','2012-10-03 08:21:49.520120');
INSERT INTO "south_migrationhistory" VALUES(14,'easy_thumbnails','0008_auto__del_field_source_storage__del_field_thumbnail_storage','2012-10-03 08:21:49.546432');
INSERT INTO "south_migrationhistory" VALUES(15,'easy_thumbnails','0009_auto__del_storage','2012-10-03 08:21:49.555450');
INSERT INTO "south_migrationhistory" VALUES(16,'easy_thumbnails','0010_rename_storage','2012-10-03 08:21:49.584897');
INSERT INTO "south_migrationhistory" VALUES(17,'easy_thumbnails','0011_auto__add_field_source_storage_hash__add_field_thumbnail_storage_hash','2012-10-03 08:21:49.611740');
INSERT INTO "south_migrationhistory" VALUES(18,'easy_thumbnails','0012_build_storage_hashes','2012-10-03 08:21:49.620728');
INSERT INTO "south_migrationhistory" VALUES(19,'easy_thumbnails','0013_auto__del_storage__del_field_source_storage__del_field_thumbnail_stora','2012-10-03 08:21:49.654347');
INSERT INTO "south_migrationhistory" VALUES(20,'easy_thumbnails','0014_auto__add_unique_source_name_storage_hash__add_unique_thumbnail_name_s','2012-10-03 08:21:49.670008');
INSERT INTO "south_migrationhistory" VALUES(21,'easy_thumbnails','0015_auto__del_unique_thumbnail_name_storage_hash__add_unique_thumbnail_sou','2012-10-03 08:21:49.689896');
CREATE TABLE "city_viewer_userprofile" (
    "id" integer NOT NULL PRIMARY KEY,
    "mugshot" varchar(100) NOT NULL,
    "privacy" varchar(15) NOT NULL,
    "user_id" integer NOT NULL UNIQUE REFERENCES "auth_user" ("id"),
    "name" varchar(20) NOT NULL,
    "philosophy" varchar(255) NOT NULL,
    "created_at" datetime NOT NULL
);
CREATE TABLE "guardian_groupobjectpermission" ("permission_id" integer NOT NULL, "object_pk" varchar(255) NOT NULL, "group_id" integer NOT NULL, "content_type_id" integer NOT NULL, "id" integer PRIMARY KEY);
CREATE TABLE "guardian_userobjectpermission" ("permission_id" integer NOT NULL, "object_pk" varchar(255) NOT NULL, "user_id" integer NOT NULL, "content_type_id" integer NOT NULL, "id" integer PRIMARY KEY);
CREATE TABLE "userena_userenasignup" ("id" integer NOT NULL PRIMARY KEY, "user_id" integer NOT NULL UNIQUE, "last_active" datetime NULL, "activation_key" varchar(40) NOT NULL, "activation_notification_send" bool NOT NULL, "email_unconfirmed" varchar(75) NOT NULL, "email_confirmation_key" varchar(40) NOT NULL, "email_confirmation_key_created" datetime NULL);
CREATE TABLE "easy_thumbnails_source" ("id" integer PRIMARY KEY, "modified" datetime NOT NULL, "storage_hash" varchar(40) NOT NULL DEFAULT '', "name" varchar(255) NOT NULL);
CREATE TABLE "easy_thumbnails_thumbnail" ("source_id" integer NOT NULL, "modified" datetime NOT NULL, "id" integer PRIMARY KEY, "storage_hash" varchar(40) NOT NULL DEFAULT '', "name" varchar(255) NOT NULL);
CREATE TABLE "city_viewer_picture" (
    "id" varchar(36) NOT NULL PRIMARY KEY,
    "file_name" varchar(50) NOT NULL,
    "url" varchar(200) NOT NULL,
    "desc" varchar(255) NOT NULL,
    "in_place_id" varchar(36) NOT NULL REFERENCES "city_viewer_place" ("id"),
    "create_at" datetime NOT NULL
);
INSERT INTO "city_viewer_picture" VALUES('748d2ef5-0f5e-11e2-a3ea-3c0754041eea','青马大桥_1.jpg','/static/media/uploads/hongkong/青马大桥_1.jpg','','7487fee8-0f5e-11e2-882b-3c0754041eea','2012-10-06 02:35:13.126504');
INSERT INTO "city_viewer_picture" VALUES('748dd887-0f5e-11e2-add9-3c0754041eea','青马大桥_2.jpg','/static/media/uploads/hongkong/青马大桥_2.jpg','','7487fee8-0f5e-11e2-882b-3c0754041eea','2012-10-06 02:35:13.131282');
INSERT INTO "city_viewer_picture" VALUES('748fc166-0f5e-11e2-b58f-3c0754041eea','香港迪士尼乐园_1.jpg','/static/media/uploads/hongkong/香港迪士尼乐园_1.jpg','','748e8c9c-0f5e-11e2-b63b-3c0754041eea','2012-10-06 02:35:13.144571');
INSERT INTO "city_viewer_picture" VALUES('7491a166-0f5e-11e2-85fc-3c0754041eea','浅水湾_1.jpg','/static/media/uploads/hongkong/浅水湾_1.jpg','','74907502-0f5e-11e2-81da-3c0754041eea','2012-10-06 02:35:13.156478');
INSERT INTO "city_viewer_picture" VALUES('7492312e-0f5e-11e2-8db2-3c0754041eea','浅水湾_2.jpg','/static/media/uploads/hongkong/浅水湾_2.jpg','','74907502-0f5e-11e2-81da-3c0754041eea','2012-10-06 02:35:13.160278');
INSERT INTO "city_viewer_picture" VALUES('749423ee-0f5e-11e2-807b-3c0754041eea','香港会议展览中心_1.jpg','/static/media/uploads/hongkong/香港会议展览中心_1.jpg','','7492db30-0f5e-11e2-bd23-3c0754041eea','2012-10-06 02:35:13.172862');
INSERT INTO "city_viewer_picture" VALUES('7494c3ab-0f5e-11e2-8f8e-3c0754041eea','香港会议展览中心_2.jpg','/static/media/uploads/hongkong/香港会议展览中心_2.jpg','','7492db30-0f5e-11e2-bd23-3c0754041eea','2012-10-06 02:35:13.177387');
INSERT INTO "city_viewer_picture" VALUES('7496dcf5-0f5e-11e2-9caa-3c0754041eea','金紫荆广场_1.jpg','/static/media/uploads/hongkong/金紫荆广场_1.jpg','','74958f9c-0f5e-11e2-9cb3-3c0754041eea','2012-10-06 02:35:13.191036');
INSERT INTO "city_viewer_picture" VALUES('74976194-0f5e-11e2-b501-3c0754041eea','金紫荆广场_2.jpg','/static/media/uploads/hongkong/金紫荆广场_2.jpg','','74958f9c-0f5e-11e2-9cb3-3c0754041eea','2012-10-06 02:35:13.194259');
INSERT INTO "city_viewer_picture" VALUES('74994251-0f5e-11e2-993a-3c0754041eea','香港海洋公园_1.jpg','/static/media/uploads/hongkong/香港海洋公园_1.jpg','','74980fd7-0f5e-11e2-8d21-3c0754041eea','2012-10-06 02:35:13.206731');
INSERT INTO "city_viewer_picture" VALUES('7499bfc0-0f5e-11e2-bfa9-3c0754041eea','香港海洋公园_2.jpg','/static/media/uploads/hongkong/香港海洋公园_2.jpg','','74980fd7-0f5e-11e2-8d21-3c0754041eea','2012-10-06 02:35:13.210061');
INSERT INTO "city_viewer_picture" VALUES('749a4dab-0f5e-11e2-bf2f-3c0754041eea','香港海洋公园_3.jpg','/static/media/uploads/hongkong/香港海洋公园_3.jpg','','74980fd7-0f5e-11e2-8d21-3c0754041eea','2012-10-06 02:35:13.213695');
INSERT INTO "city_viewer_picture" VALUES('749fe2f8-0f5e-11e2-8523-3c0754041eea','幻彩咏香江_1.jpg','/static/media/uploads/hongkong/幻彩咏香江_1.jpg','','749ec775-0f5e-11e2-a274-3c0754041eea','2012-10-06 02:35:13.250276');
INSERT INTO "city_viewer_picture" VALUES('74a05e51-0f5e-11e2-b03f-3c0754041eea','幻彩咏香江_2.jpg','/static/media/uploads/hongkong/幻彩咏香江_2.jpg','','749ec775-0f5e-11e2-a274-3c0754041eea','2012-10-06 02:35:13.253370');
INSERT INTO "city_viewer_picture" VALUES('74a2644c-0f5e-11e2-9f49-3c0754041eea','香港杜莎夫人蜡像馆_1.jpg','/static/media/uploads/hongkong/香港杜莎夫人蜡像馆_1.jpg','','74a118a6-0f5e-11e2-9884-3c0754041eea','2012-10-06 02:35:13.266669');
INSERT INTO "city_viewer_picture" VALUES('74a2ed40-0f5e-11e2-8168-3c0754041eea','香港杜莎夫人蜡像馆_2.jpg','/static/media/uploads/hongkong/香港杜莎夫人蜡像馆_2.jpg','','74a118a6-0f5e-11e2-9884-3c0754041eea','2012-10-06 02:35:13.270215');
INSERT INTO "city_viewer_picture" VALUES('74a5afa8-0f5e-11e2-adc6-3c0754041eea','天星小轮_1.jpg','/static/media/uploads/hongkong/天星小轮_1.jpg','','74a3b4fa-0f5e-11e2-8863-3c0754041eea','2012-10-06 02:35:13.288186');
INSERT INTO "city_viewer_picture" VALUES('74a64ddc-0f5e-11e2-8eaf-3c0754041eea','天星小轮_2.jpg','/static/media/uploads/hongkong/天星小轮_2.jpg','','74a3b4fa-0f5e-11e2-8863-3c0754041eea','2012-10-06 02:35:13.292342');
INSERT INTO "city_viewer_picture" VALUES('74a8c95e-0f5e-11e2-8ea0-3c0754041eea','维多利亚港_1.jpg','/static/media/uploads/hongkong/维多利亚港_1.jpg','','74a70128-0f5e-11e2-88ed-3c0754041eea','2012-10-06 02:35:13.308457');
INSERT INTO "city_viewer_picture" VALUES('74a9497d-0f5e-11e2-93db-3c0754041eea','维多利亚港_2.jpg','/static/media/uploads/hongkong/维多利亚港_2.jpg','','74a70128-0f5e-11e2-88ed-3c0754041eea','2012-10-06 02:35:13.311833');
INSERT INTO "city_viewer_picture" VALUES('74abf49c-0f5e-11e2-8a6d-3c0754041eea','香港星光大道_1.jpg','/static/media/uploads/hongkong/香港星光大道_1.jpg','','74a9f554-0f5e-11e2-8491-3c0754041eea','2012-10-06 02:35:13.329404');
INSERT INTO "city_viewer_picture" VALUES('74ac6f51-0f5e-11e2-956d-3c0754041eea','香港星光大道_2.jpg','/static/media/uploads/hongkong/香港星光大道_2.jpg','','74a9f554-0f5e-11e2-8491-3c0754041eea','2012-10-06 02:35:13.332508');
INSERT INTO "city_viewer_picture" VALUES('74ad3e57-0f5e-11e2-a495-3c0754041eea','香港星光大道_3.jpg','/static/media/uploads/hongkong/香港星光大道_3.jpg','','74a9f554-0f5e-11e2-8491-3c0754041eea','2012-10-06 02:35:13.337426');
INSERT INTO "city_viewer_picture" VALUES('74b05070-0f5e-11e2-9379-3c0754041eea','太平山(香港山顶)_1.jpg','/static/media/uploads/hongkong/太平山(香港山顶)_1.jpg','','74ae5c6e-0f5e-11e2-8b71-3c0754041eea','2012-10-06 02:35:13.357540');
INSERT INTO "city_viewer_picture" VALUES('74b0dd0f-0f5e-11e2-8ab7-3c0754041eea','太平山(香港山顶)_2.jpg','/static/media/uploads/hongkong/太平山(香港山顶)_2.jpg','','74ae5c6e-0f5e-11e2-8b71-3c0754041eea','2012-10-06 02:35:13.361094');
INSERT INTO "city_viewer_picture" VALUES('74b1678a-0f5e-11e2-bbfe-3c0754041eea','太平山(香港山顶)_3.jpg','/static/media/uploads/hongkong/太平山(香港山顶)_3.jpg','','74ae5c6e-0f5e-11e2-8b71-3c0754041eea','2012-10-06 02:35:13.364648');
INSERT INTO "city_viewer_picture" VALUES('74b582e8-0f5e-11e2-9e0d-3c0754041eea','添好运点心专卖店_1.jpg','/static/media/uploads/hongkong/添好运点心专卖店_1.jpg','','74b4545e-0f5e-11e2-8b72-3c0754041eea','2012-10-06 02:35:13.391864');
INSERT INTO "city_viewer_picture" VALUES('74b602a3-0f5e-11e2-b5d4-3c0754041eea','添好运点心专卖店_2.jpg','/static/media/uploads/hongkong/添好运点心专卖店_2.jpg','','74b4545e-0f5e-11e2-8b72-3c0754041eea','2012-10-06 02:35:13.395272');
INSERT INTO "city_viewer_picture" VALUES('74b67e94-0f5e-11e2-a61c-3c0754041eea','添好运点心专卖店_3.jpg','/static/media/uploads/hongkong/添好运点心专卖店_3.jpg','','74b4545e-0f5e-11e2-8b72-3c0754041eea','2012-10-06 02:35:13.398525');
INSERT INTO "city_viewer_picture" VALUES('74b88005-0f5e-11e2-9176-3c0754041eea','糖朝_1.jpg','/static/media/uploads/hongkong/糖朝_1.jpg','','74b75d3d-0f5e-11e2-8486-3c0754041eea','2012-10-06 02:35:13.411447');
INSERT INTO "city_viewer_picture" VALUES('74b92e5c-0f5e-11e2-9306-3c0754041eea','糖朝_2.jpg','/static/media/uploads/hongkong/糖朝_2.jpg','','74b75d3d-0f5e-11e2-8486-3c0754041eea','2012-10-06 02:35:13.415836');
INSERT INTO "city_viewer_picture" VALUES('74c02299-0f5e-11e2-a218-3c0754041eea','糖朝_3.jpg','/static/media/uploads/hongkong/糖朝_3.jpg','','74b75d3d-0f5e-11e2-8486-3c0754041eea','2012-10-06 02:35:13.461431');
INSERT INTO "city_viewer_picture" VALUES('74c1f09e-0f5e-11e2-9d44-3c0754041eea','恭和堂_1.jpg','/static/media/uploads/hongkong/恭和堂_1.jpg','','74c0d697-0f5e-11e2-b981-3c0754041eea','2012-10-06 02:35:13.473224');
INSERT INTO "city_viewer_picture" VALUES('74c2926b-0f5e-11e2-aef5-3c0754041eea','恭和堂_2.jpg','/static/media/uploads/hongkong/恭和堂_2.jpg','','74c0d697-0f5e-11e2-b981-3c0754041eea','2012-10-06 02:35:13.477538');
INSERT INTO "city_viewer_picture" VALUES('74c32330-0f5e-11e2-a4fd-3c0754041eea','恭和堂_3.jpg','/static/media/uploads/hongkong/恭和堂_3.jpg','','74c0d697-0f5e-11e2-b981-3c0754041eea','2012-10-06 02:35:13.481028');
INSERT INTO "city_viewer_picture" VALUES('74c51199-0f5e-11e2-8c8f-3c0754041eea','义顺牛奶公司_1.jpg','/static/media/uploads/hongkong/义顺牛奶公司_1.jpg','','74c3ddc0-0f5e-11e2-99b2-3c0754041eea','2012-10-06 02:35:13.493272');
INSERT INTO "city_viewer_picture" VALUES('74c5948a-0f5e-11e2-b0c6-3c0754041eea','义顺牛奶公司_2.jpg','/static/media/uploads/hongkong/义顺牛奶公司_2.jpg','','74c3ddc0-0f5e-11e2-99b2-3c0754041eea','2012-10-06 02:35:13.497136');
INSERT INTO "city_viewer_picture" VALUES('74c76cb8-0f5e-11e2-b2fd-3c0754041eea','十三座牛杂_1.jpg','/static/media/uploads/hongkong/十三座牛杂_1.jpg','','74c64921-0f5e-11e2-9d5d-3c0754041eea','2012-10-06 02:35:13.509392');
INSERT INTO "city_viewer_picture" VALUES('74c986a8-0f5e-11e2-b85a-3c0754041eea','威记粥店_1.jpg','/static/media/uploads/hongkong/威记粥店_1.jpg','','74c8289e-0f5e-11e2-92cd-3c0754041eea','2012-10-06 02:35:13.523097');
INSERT INTO "city_viewer_picture" VALUES('74ca1a45-0f5e-11e2-b8b6-3c0754041eea','威记粥店_2.jpg','/static/media/uploads/hongkong/威记粥店_2.jpg','','74c8289e-0f5e-11e2-92cd-3c0754041eea','2012-10-06 02:35:13.526902');
INSERT INTO "city_viewer_picture" VALUES('74cc518a-0f5e-11e2-be5d-3c0754041eea','强记大排档_1.jpg','/static/media/uploads/hongkong/强记大排档_1.jpg','','74cb0df0-0f5e-11e2-bbc3-3c0754041eea','2012-10-06 02:35:13.541321');
INSERT INTO "city_viewer_picture" VALUES('74ce88e1-0f5e-11e2-bba1-3c0754041eea','海港城_1.jpg','/static/media/uploads/hongkong/海港城_1.jpg','','74cd41bd-0f5e-11e2-81f3-3c0754041eea','2012-10-06 02:35:13.555080');
INSERT INTO "city_viewer_picture" VALUES('74d098bd-0f5e-11e2-adbf-3c0754041eea','铜锣湾_1.jpg','/static/media/uploads/hongkong/铜锣湾_1.jpg','','74cf4e8a-0f5e-11e2-bef9-3c0754041eea','2012-10-06 02:35:13.569501');
INSERT INTO "city_viewer_picture" VALUES('74d13b97-0f5e-11e2-bb50-3c0754041eea','铜锣湾_2.jpg','/static/media/uploads/hongkong/铜锣湾_2.jpg','','74cf4e8a-0f5e-11e2-bef9-3c0754041eea','2012-10-06 02:35:13.573408');
INSERT INTO "city_viewer_picture" VALUES('74d34ec2-0f5e-11e2-98dd-3c0754041eea','尖沙咀_1.jpg','/static/media/uploads/hongkong/尖沙咀_1.jpg','','74d21214-0f5e-11e2-a437-3c0754041eea','2012-10-06 02:35:13.587186');
INSERT INTO "city_viewer_picture" VALUES('74d3e170-0f5e-11e2-ac05-3c0754041eea','尖沙咀_2.jpg','/static/media/uploads/hongkong/尖沙咀_2.jpg','','74d21214-0f5e-11e2-a437-3c0754041eea','2012-10-06 02:35:13.591000');
INSERT INTO "city_viewer_picture" VALUES('74d47c70-0f5e-11e2-8a86-3c0754041eea','尖沙咀_3.jpg','/static/media/uploads/hongkong/尖沙咀_3.jpg','','74d21214-0f5e-11e2-a437-3c0754041eea','2012-10-06 02:35:13.595031');
INSERT INTO "city_viewer_picture" VALUES('74d67899-0f5e-11e2-b583-3c0754041eea','朗豪坊_1.jpg','/static/media/uploads/hongkong/朗豪坊_1.jpg','','74d54338-0f5e-11e2-85f4-3c0754041eea','2012-10-06 02:35:13.607920');
INSERT INTO "city_viewer_picture" VALUES('74d88414-0f5e-11e2-8172-3c0754041eea','太古广场_1.jpg','/static/media/uploads/hongkong/太古广场_1.jpg','','74d72aa6-0f5e-11e2-9fa3-3c0754041eea','2012-10-06 02:35:13.621329');
INSERT INTO "city_viewer_picture" VALUES('74e1a2e1-0f5e-11e2-bbd3-3c0754041eea','APM_1.jpg','/static/media/uploads/hongkong/APM_1.jpg','','74e079cf-0f5e-11e2-96e9-3c0754041eea','2012-10-06 02:35:13.681229');
INSERT INTO "city_viewer_picture" VALUES('74e39368-0f5e-11e2-a592-3c0754041eea','东荟城_1.jpg','/static/media/uploads/hongkong/东荟城_1.jpg','','74e256c5-0f5e-11e2-996a-3c0754041eea','2012-10-06 02:35:13.693903');
INSERT INTO "city_viewer_picture" VALUES('74e88e7a-0f5e-11e2-a9ce-3c0754041eea','香港殖民地都爹利街石阶_1.jpg','/static/media/uploads/hongkong/香港殖民地都爹利街石阶_1.jpg','','74e751cf-0f5e-11e2-83fd-3c0754041eea','2012-10-06 02:35:13.726521');
INSERT INTO "city_viewer_picture" VALUES('74ea89a3-0f5e-11e2-8bce-3c0754041eea','永利街_1.jpg','/static/media/uploads/hongkong/永利街_1.jpg','','74e96b1c-0f5e-11e2-b813-3c0754041eea','2012-10-06 02:35:13.739522');
INSERT INTO "city_viewer_picture" VALUES('74eb2645-0f5e-11e2-aa2a-3c0754041eea','永利街_2.jpg','/static/media/uploads/hongkong/永利街_2.jpg','','74e96b1c-0f5e-11e2-b813-3c0754041eea','2012-10-06 02:35:13.743443');
INSERT INTO "city_viewer_picture" VALUES('74ed509c-0f5e-11e2-8c2d-3c0754041eea','黄大仙祠_1.jpg','/static/media/uploads/hongkong/黄大仙祠_1.jpg','','74ebed9c-0f5e-11e2-8e27-3c0754041eea','2012-10-06 02:35:13.757252');
INSERT INTO "city_viewer_picture" VALUES('74ede7dc-0f5e-11e2-a651-3c0754041eea','黄大仙祠_2.jpg','/static/media/uploads/hongkong/黄大仙祠_2.jpg','','74ebed9c-0f5e-11e2-8e27-3c0754041eea','2012-10-06 02:35:13.761465');
INSERT INTO "city_viewer_picture" VALUES('74f167ae-0f5e-11e2-ae2a-3c0754041eea','楼梯街_1.jpg','/static/media/uploads/hongkong/楼梯街_1.jpg','','74f038b8-0f5e-11e2-83b6-3c0754041eea','2012-10-06 02:35:13.784501');
INSERT INTO "city_viewer_picture" VALUES('74f212d9-0f5e-11e2-b300-3c0754041eea','楼梯街_2.jpg','/static/media/uploads/hongkong/楼梯街_2.jpg','','74f038b8-0f5e-11e2-83b6-3c0754041eea','2012-10-06 02:35:13.788530');
INSERT INTO "city_viewer_picture" VALUES('74ff5197-0f5e-11e2-8923-3c0754041eea','林村许愿树_1.jpg','/static/media/uploads/hongkong/林村许愿树_1.jpg','','74fa6502-0f5e-11e2-870c-3c0754041eea','2012-10-06 02:35:13.875262');
INSERT INTO "city_viewer_picture" VALUES('75038451-0f5e-11e2-a903-3c0754041eea','镛记酒家_1.jpg','/static/media/uploads/hongkong/镛记酒家_1.jpg','','75008661-0f5e-11e2-ad9c-3c0754041eea','2012-10-06 02:35:13.902766');
INSERT INTO "city_viewer_picture" VALUES('7508f8ba-0f5e-11e2-8d95-3c0754041eea','翠华餐厅_1.jpg','/static/media/uploads/hongkong/翠华餐厅_1.jpg','','750474e8-0f5e-11e2-8964-3c0754041eea','2012-10-06 02:35:13.938315');
INSERT INTO "city_viewer_picture" VALUES('750cbc51-0f5e-11e2-87b2-3c0754041eea','翠华餐厅_2.jpg','/static/media/uploads/hongkong/翠华餐厅_2.jpg','','750474e8-0f5e-11e2-8964-3c0754041eea','2012-10-06 02:35:13.963494');
INSERT INTO "city_viewer_picture" VALUES('7519b128-0f5e-11e2-9635-3c0754041eea','兰芳园_1.jpg','/static/media/uploads/hongkong/兰芳园_1.jpg','','751861f5-0f5e-11e2-a48c-3c0754041eea','2012-10-06 02:35:14.048528');
INSERT INTO "city_viewer_picture" VALUES('751bf3c0-0f5e-11e2-a78e-3c0754041eea','陆羽茶室_1.jpg','/static/media/uploads/hongkong/陆羽茶室_1.jpg','','751a6fbd-0f5e-11e2-b9a0-3c0754041eea','2012-10-06 02:35:14.063080');
INSERT INTO "city_viewer_picture" VALUES('751c8235-0f5e-11e2-9c13-3c0754041eea','陆羽茶室_2.jpg','/static/media/uploads/hongkong/陆羽茶室_2.jpg','','751a6fbd-0f5e-11e2-b9a0-3c0754041eea','2012-10-06 02:35:14.067005');
INSERT INTO "city_viewer_picture" VALUES('751d272b-0f5e-11e2-90cc-3c0754041eea','陆羽茶室_3.jpg','/static/media/uploads/hongkong/陆羽茶室_3.jpg','','751a6fbd-0f5e-11e2-b9a0-3c0754041eea','2012-10-06 02:35:14.071188');
INSERT INTO "city_viewer_picture" VALUES('751f88bd-0f5e-11e2-b354-3c0754041eea','莲香楼_1.jpg','/static/media/uploads/hongkong/莲香楼_1.jpg','','751e0540-0f5e-11e2-9697-3c0754041eea','2012-10-06 02:35:14.086866');
INSERT INTO "city_viewer_picture" VALUES('7520373a-0f5e-11e2-b3c4-3c0754041eea','莲香楼_2.jpg','/static/media/uploads/hongkong/莲香楼_2.jpg','','751e0540-0f5e-11e2-9697-3c0754041eea','2012-10-06 02:35:14.091231');
INSERT INTO "city_viewer_picture" VALUES('752238e8-0f5e-11e2-a871-3c0754041eea','何洪记粥面专家_1.jpg','/static/media/uploads/hongkong/何洪记粥面专家_1.jpg','','7520f780-0f5e-11e2-8ec1-3c0754041eea','2012-10-06 02:35:14.103829');
INSERT INTO "city_viewer_picture" VALUES('7522f617-0f5e-11e2-8426-3c0754041eea','何洪记粥面专家_2.jpg','/static/media/uploads/hongkong/何洪记粥面专家_2.jpg','','7520f780-0f5e-11e2-8ec1-3c0754041eea','2012-10-06 02:35:14.108498');
INSERT INTO "city_viewer_picture" VALUES('752745a3-0f5e-11e2-9289-3c0754041eea','金凤茶餐厅_1.jpg','/static/media/uploads/hongkong/金凤茶餐厅_1.jpg','','752591ab-0f5e-11e2-b906-3c0754041eea','2012-10-06 02:35:14.137419');
INSERT INTO "city_viewer_picture" VALUES('7527f7a6-0f5e-11e2-b057-3c0754041eea','金凤茶餐厅_2.jpg','/static/media/uploads/hongkong/金凤茶餐厅_2.jpg','','752591ab-0f5e-11e2-b906-3c0754041eea','2012-10-06 02:35:14.142046');
INSERT INTO "city_viewer_picture" VALUES('7529f60a-0f5e-11e2-a48e-3c0754041eea','九记牛腩_1.jpg','/static/media/uploads/hongkong/九记牛腩_1.jpg','','7528a366-0f5e-11e2-be6e-3c0754041eea','2012-10-06 02:35:14.155024');
INSERT INTO "city_viewer_picture" VALUES('752a7330-0f5e-11e2-a0c5-3c0754041eea','九记牛腩_2.jpg','/static/media/uploads/hongkong/九记牛腩_2.jpg','','7528a366-0f5e-11e2-be6e-3c0754041eea','2012-10-06 02:35:14.158363');
INSERT INTO "city_viewer_picture" VALUES('753220b3-0f5e-11e2-8c71-3c0754041eea','泰昌饼家_1.jpg','/static/media/uploads/hongkong/泰昌饼家_1.jpg','','752b2a70-0f5e-11e2-9c48-3c0754041eea','2012-10-06 02:35:14.208621');
INSERT INTO "city_viewer_picture" VALUES('7534204f-0f5e-11e2-bd2a-3c0754041eea','蛇王芬饭店_1.jpg','/static/media/uploads/hongkong/蛇王芬饭店_1.jpg','','7532d1cf-0f5e-11e2-ad3f-3c0754041eea','2012-10-06 02:35:14.221732');
INSERT INTO "city_viewer_picture" VALUES('7534a919-0f5e-11e2-a879-3c0754041eea','蛇王芬饭店_2.jpg','/static/media/uploads/hongkong/蛇王芬饭店_2.jpg','','7532d1cf-0f5e-11e2-ad3f-3c0754041eea','2012-10-06 02:35:14.225053');
INSERT INTO "city_viewer_picture" VALUES('7536d6eb-0f5e-11e2-aa63-3c0754041eea','檀岛咖啡饼店_1.jpg','/static/media/uploads/hongkong/檀岛咖啡饼店_1.jpg','','75358338-0f5e-11e2-b308-3c0754041eea','2012-10-06 02:35:14.239525');
INSERT INTO "city_viewer_picture" VALUES('7538dfc7-0f5e-11e2-ba7c-3c0754041eea','永合成茶餐厅_1.jpg','/static/media/uploads/hongkong/永合成茶餐厅_1.jpg','','7537951c-0f5e-11e2-8039-3c0754041eea','2012-10-06 02:35:14.252882');
INSERT INTO "city_viewer_picture" VALUES('753acb19-0f5e-11e2-9df4-3c0754041eea','庙街夜市_1.jpg','/static/media/uploads/hongkong/庙街夜市_1.jpg','','75399433-0f5e-11e2-a28a-3c0754041eea','2012-10-06 02:35:14.265460');
INSERT INTO "city_viewer_picture" VALUES('753b496e-0f5e-11e2-9aea-3c0754041eea','庙街夜市_2.jpg','/static/media/uploads/hongkong/庙街夜市_2.jpg','','75399433-0f5e-11e2-a28a-3c0754041eea','2012-10-06 02:35:14.268733');
INSERT INTO "city_viewer_picture" VALUES('753d6045-0f5e-11e2-93d0-3c0754041eea','鸭寮街_1.jpg','/static/media/uploads/hongkong/鸭寮街_1.jpg','','753c19de-0f5e-11e2-9f0d-3c0754041eea','2012-10-06 02:35:14.282347');
INSERT INTO "city_viewer_picture" VALUES('753e092e-0f5e-11e2-b943-3c0754041eea','鸭寮街_2.jpg','/static/media/uploads/hongkong/鸭寮街_2.jpg','','753c19de-0f5e-11e2-9f0d-3c0754041eea','2012-10-06 02:35:14.286669');
INSERT INTO "city_viewer_picture" VALUES('754057d9-0f5e-11e2-9458-3c0754041eea','西洋菜街_1.jpg','/static/media/uploads/hongkong/西洋菜街_1.jpg','','753eee99-0f5e-11e2-817a-3c0754041eea','2012-10-06 02:35:14.301801');
INSERT INTO "city_viewer_picture" VALUES('75423c61-0f5e-11e2-bca9-3c0754041eea','花园街_1.jpg','/static/media/uploads/hongkong/花园街_1.jpg','','7540fe19-0f5e-11e2-9c0a-3c0754041eea','2012-10-06 02:35:14.314164');
INSERT INTO "city_viewer_picture" VALUES('75444621-0f5e-11e2-9db7-3c0754041eea','荷里活道_1.jpg','/static/media/uploads/hongkong/荷里活道_1.jpg','','75430097-0f5e-11e2-b2d6-3c0754041eea','2012-10-06 02:35:14.327595');
INSERT INTO "city_viewer_picture" VALUES('7547fea1-0f5e-11e2-92ab-3c0754041eea','Felix餐厅_1.jpg','/static/media/uploads/hongkong/Felix餐厅_1.jpg','','7546a14a-0f5e-11e2-bc3f-3c0754041eea','2012-10-06 02:35:14.351895');
INSERT INTO "city_viewer_picture" VALUES('75487ee8-0f5e-11e2-93dc-3c0754041eea','Felix餐厅_2.jpg','/static/media/uploads/hongkong/Felix餐厅_2.jpg','','7546a14a-0f5e-11e2-bc3f-3c0754041eea','2012-10-06 02:35:14.355334');
INSERT INTO "city_viewer_picture" VALUES('754a6af3-0f5e-11e2-bd40-3c0754041eea','天一酒家_1.jpg','/static/media/uploads/hongkong/天一酒家_1.jpg','','754924e3-0f5e-11e2-b0b5-3c0754041eea','2012-10-06 02:35:14.367789');
INSERT INTO "city_viewer_picture" VALUES('754af4f3-0f5e-11e2-bbad-3c0754041eea','天一酒家_2.jpg','/static/media/uploads/hongkong/天一酒家_2.jpg','','754924e3-0f5e-11e2-b0b5-3c0754041eea','2012-10-06 02:35:14.371338');
INSERT INTO "city_viewer_picture" VALUES('7551340c-0f5e-11e2-805a-3c0754041eea','凌霄阁_1.jpg','/static/media/uploads/hongkong/凌霄阁_1.jpg','','754fbd5e-0f5e-11e2-ba58-3c0754041eea','2012-10-06 02:35:14.411717');
INSERT INTO "city_viewer_picture" VALUES('7551e373-0f5e-11e2-bd0e-3c0754041eea','凌霄阁_2.jpg','/static/media/uploads/hongkong/凌霄阁_2.jpg','','754fbd5e-0f5e-11e2-ba58-3c0754041eea','2012-10-06 02:35:14.415754');
INSERT INTO "city_viewer_picture" VALUES('75527238-0f5e-11e2-99f6-3c0754041eea','凌霄阁_3.jpg','/static/media/uploads/hongkong/凌霄阁_3.jpg','','754fbd5e-0f5e-11e2-ba58-3c0754041eea','2012-10-06 02:35:14.420296');
INSERT INTO "city_viewer_picture" VALUES('7554503a-0f5e-11e2-acb1-3c0754041eea','半山自动扶梯_1.jpg','/static/media/uploads/hongkong/半山自动扶梯_1.jpg','','755330e1-0f5e-11e2-8c2f-3c0754041eea','2012-10-06 02:35:14.432766');
INSERT INTO "city_viewer_picture" VALUES('7554d24f-0f5e-11e2-a39a-3c0754041eea','半山自动扶梯_2.jpg','/static/media/uploads/hongkong/半山自动扶梯_2.jpg','','755330e1-0f5e-11e2-8c2f-3c0754041eea','2012-10-06 02:35:14.436084');
INSERT INTO "city_viewer_picture" VALUES('755c6b9e-0f5e-11e2-9387-3c0754041eea','昂坪360缆车_1.jpg','/static/media/uploads/hongkong/昂坪360缆车_1.jpg','','755593dc-0f5e-11e2-8aed-3c0754041eea','2012-10-06 02:35:14.485410');
INSERT INTO "city_viewer_picture" VALUES('755d3cf3-0f5e-11e2-b4bf-3c0754041eea','昂坪360缆车_2.jpg','/static/media/uploads/hongkong/昂坪360缆车_2.jpg','','755593dc-0f5e-11e2-8aed-3c0754041eea','2012-10-06 02:35:14.490919');
INSERT INTO "city_viewer_picture" VALUES('7566748f-0f5e-11e2-b65c-3c0754041eea','跑马地赛马场_1.jpg','/static/media/uploads/hongkong/跑马地赛马场_1.jpg','','755e08fa-0f5e-11e2-a8c9-3c0754041eea','2012-10-06 02:35:14.551350');
INSERT INTO "city_viewer_picture" VALUES('756ea35c-0f5e-11e2-a575-3c0754041eea','香港太空馆_1.jpg','/static/media/uploads/hongkong/香港太空馆_1.jpg','','756cc582-0f5e-11e2-8d39-3c0754041eea','2012-10-06 02:35:14.604673');
INSERT INTO "city_viewer_picture" VALUES('75769ab3-0f5e-11e2-a7d2-3c0754041eea','大屿山_1.jpg','/static/media/uploads/hongkong/大屿山_1.jpg','','75721e9e-0f5e-11e2-9882-3c0754041eea','2012-10-06 02:35:14.656809');
INSERT INTO "city_viewer_picture" VALUES('75775038-0f5e-11e2-8f16-3c0754041eea','大屿山_2.jpg','/static/media/uploads/hongkong/大屿山_2.jpg','','75721e9e-0f5e-11e2-9882-3c0754041eea','2012-10-06 02:35:14.661776');
INSERT INTO "city_viewer_picture" VALUES('7579ab78-0f5e-11e2-845c-3c0754041eea','南丫岛_1.jpg','/static/media/uploads/hongkong/南丫岛_1.jpg','','7578300f-0f5e-11e2-b25a-3c0754041eea','2012-10-06 02:35:14.677329');
INSERT INTO "city_viewer_picture" VALUES('7585fab8-0f5e-11e2-8cc7-3c0754041eea','南丫岛_2.jpg','/static/media/uploads/hongkong/南丫岛_2.jpg','','7578300f-0f5e-11e2-b25a-3c0754041eea','2012-10-06 02:35:14.756694');
INSERT INTO "city_viewer_picture" VALUES('75901a85-0f5e-11e2-a126-3c0754041eea','长洲_1.jpg','/static/media/uploads/hongkong/长洲_1.jpg','','75874563-0f5e-11e2-aa2f-3c0754041eea','2012-10-06 02:35:14.823921');
INSERT INTO "city_viewer_picture" VALUES('7592c9c7-0f5e-11e2-bcf4-3c0754041eea','长洲_2.jpg','/static/media/uploads/hongkong/长洲_2.jpg','','75874563-0f5e-11e2-aa2f-3c0754041eea','2012-10-06 02:35:14.841587');
INSERT INTO "city_viewer_picture" VALUES('75937117-0f5e-11e2-b0e1-3c0754041eea','长洲_3.jpg','/static/media/uploads/hongkong/长洲_3.jpg','','75874563-0f5e-11e2-aa2f-3c0754041eea','2012-10-06 02:35:14.846128');
INSERT INTO "city_viewer_picture" VALUES('759675bd-0f5e-11e2-8969-3c0754041eea','赤柱_1.jpg','/static/media/uploads/hongkong/赤柱_1.jpg','','75944e9c-0f5e-11e2-be3d-3c0754041eea','2012-10-06 02:35:14.865323');
INSERT INTO "city_viewer_picture" VALUES('759cbe05-0f5e-11e2-b609-3c0754041eea','赤柱_2.jpg','/static/media/uploads/hongkong/赤柱_2.jpg','','75944e9c-0f5e-11e2-be3d-3c0754041eea','2012-10-06 02:35:14.906729');
INSERT INTO "city_viewer_picture" VALUES('759e153a-0f5e-11e2-9819-3c0754041eea','赤柱_3.jpg','/static/media/uploads/hongkong/赤柱_3.jpg','','75944e9c-0f5e-11e2-be3d-3c0754041eea','2012-10-06 02:35:14.915618');
INSERT INTO "city_viewer_picture" VALUES('6916164a-0f9b-11e2-8a96-3c0754041eea','Fontainebleau_1.jpg','/static/media/uploads/paris/Fontainebleau_1.jpg','','6914b847-0f9b-11e2-a195-3c0754041eea','2012-10-06 09:51:33.192363');
INSERT INTO "city_viewer_picture" VALUES('6916b17a-0f9b-11e2-98d2-3c0754041eea','Fontainebleau_2.jpg','/static/media/uploads/paris/Fontainebleau_2.jpg','','6914b847-0f9b-11e2-a195-3c0754041eea','2012-10-06 09:51:33.196741');
INSERT INTO "city_viewer_picture" VALUES('69174e33-0f9b-11e2-8b24-3c0754041eea','Fontainebleau_3.jpg','/static/media/uploads/paris/Fontainebleau_3.jpg','','6914b847-0f9b-11e2-a195-3c0754041eea','2012-10-06 09:51:33.200680');
INSERT INTO "city_viewer_picture" VALUES('6917f347-0f9b-11e2-a9f3-3c0754041eea','Fontainebleau_4.jpg','/static/media/uploads/paris/Fontainebleau_4.jpg','','6914b847-0f9b-11e2-a195-3c0754041eea','2012-10-06 09:51:33.204812');
INSERT INTO "city_viewer_picture" VALUES('69189f9e-0f9b-11e2-9d21-3c0754041eea','Fontainebleau_5.jpg','/static/media/uploads/paris/Fontainebleau_5.jpg','','6914b847-0f9b-11e2-a195-3c0754041eea','2012-10-06 09:51:33.209326');
INSERT INTO "city_viewer_picture" VALUES('693783fa-0f9b-11e2-a33f-3c0754041eea','Invalides_1.jpg','/static/media/uploads/paris/Invalides_1.jpg','','693621ba-0f9b-11e2-ba06-3c0754041eea','2012-10-06 09:51:33.411775');
INSERT INTO "city_viewer_picture" VALUES('6937fd33-0f9b-11e2-bef9-3c0754041eea','Invalides_2.jpg','/static/media/uploads/paris/Invalides_2.jpg','','693621ba-0f9b-11e2-ba06-3c0754041eea','2012-10-06 09:51:33.414942');
INSERT INTO "city_viewer_picture" VALUES('69388e3a-0f9b-11e2-adb2-3c0754041eea','Invalides_3.jpg','/static/media/uploads/paris/Invalides_3.jpg','','693621ba-0f9b-11e2-ba06-3c0754041eea','2012-10-06 09:51:33.418628');
INSERT INTO "city_viewer_picture" VALUES('693939ae-0f9b-11e2-90ee-3c0754041eea','Invalides_4.jpg','/static/media/uploads/paris/Invalides_4.jpg','','693621ba-0f9b-11e2-ba06-3c0754041eea','2012-10-06 09:51:33.422267');
INSERT INTO "city_viewer_picture" VALUES('6939c430-0f9b-11e2-be86-3c0754041eea','Invalides_5.jpg','/static/media/uploads/paris/Invalides_5.jpg','','693621ba-0f9b-11e2-ba06-3c0754041eea','2012-10-06 09:51:33.426503');
INSERT INTO "city_viewer_picture" VALUES('69616cb3-0f9b-11e2-9160-3c0754041eea','Colette_1.jpg','/static/media/uploads/paris/Colette_1.jpg','','695ff007-0f9b-11e2-b6f0-3c0754041eea','2012-10-06 09:51:33.686473');
INSERT INTO "city_viewer_picture" VALUES('69621282-0f9b-11e2-98d7-3c0754041eea','Colette_2.jpg','/static/media/uploads/paris/Colette_2.jpg','','695ff007-0f9b-11e2-b6f0-3c0754041eea','2012-10-06 09:51:33.690645');
INSERT INTO "city_viewer_picture" VALUES('6962bae8-0f9b-11e2-a75f-3c0754041eea','Colette_3.jpg','/static/media/uploads/paris/Colette_3.jpg','','695ff007-0f9b-11e2-b6f0-3c0754041eea','2012-10-06 09:51:33.695036');
INSERT INTO "city_viewer_picture" VALUES('696a7685-0f9b-11e2-b1d3-3c0754041eea','Berthillon_1.jpg','/static/media/uploads/paris/Berthillon_1.jpg','','69690e8f-0f9b-11e2-850d-3c0754041eea','2012-10-06 09:51:33.745688');
INSERT INTO "city_viewer_picture" VALUES('696b2687-0f9b-11e2-b0e0-3c0754041eea','Berthillon_2.jpg','/static/media/uploads/paris/Berthillon_2.jpg','','69690e8f-0f9b-11e2-850d-3c0754041eea','2012-10-06 09:51:33.749832');
INSERT INTO "city_viewer_picture" VALUES('696bdae3-0f9b-11e2-ab66-3c0754041eea','Berthillon_3.jpg','/static/media/uploads/paris/Berthillon_3.jpg','','69690e8f-0f9b-11e2-850d-3c0754041eea','2012-10-06 09:51:33.754710');
INSERT INTO "city_viewer_picture" VALUES('696c781e-0f9b-11e2-b14b-3c0754041eea','Berthillon_4.jpg','/static/media/uploads/paris/Berthillon_4.jpg','','69690e8f-0f9b-11e2-850d-3c0754041eea','2012-10-06 09:51:33.758781');
INSERT INTO "city_viewer_picture" VALUES('696d2430-0f9b-11e2-9ae2-3c0754041eea','Berthillon_5.jpg','/static/media/uploads/paris/Berthillon_5.jpg','','69690e8f-0f9b-11e2-850d-3c0754041eea','2012-10-06 09:51:33.763076');
INSERT INTO "city_viewer_picture" VALUES('696dba75-0f9b-11e2-82cd-3c0754041eea','Berthillon_6.jpg','/static/media/uploads/paris/Berthillon_6.jpg','','69690e8f-0f9b-11e2-850d-3c0754041eea','2012-10-06 09:51:33.767110');
INSERT INTO "city_viewer_picture" VALUES('696e8059-0f9b-11e2-a250-3c0754041eea','Berthillon_7.jpg','/static/media/uploads/paris/Berthillon_7.jpg','','69690e8f-0f9b-11e2-850d-3c0754041eea','2012-10-06 09:51:33.771698');
INSERT INTO "city_viewer_picture" VALUES('6970d2e3-0f9b-11e2-85d8-3c0754041eea','Angelina_1.jpg','/static/media/uploads/paris/Angelina_1.jpg','','696f65f5-0f9b-11e2-aa5d-3c0754041eea','2012-10-06 09:51:33.787207');
INSERT INTO "city_viewer_picture" VALUES('69716cc0-0f9b-11e2-9f4a-3c0754041eea','Angelina_2.jpg','/static/media/uploads/paris/Angelina_2.jpg','','696f65f5-0f9b-11e2-aa5d-3c0754041eea','2012-10-06 09:51:33.791374');
INSERT INTO "city_viewer_picture" VALUES('69720b45-0f9b-11e2-a327-3c0754041eea','Angelina_3.jpg','/static/media/uploads/paris/Angelina_3.jpg','','696f65f5-0f9b-11e2-aa5d-3c0754041eea','2012-10-06 09:51:33.795344');
INSERT INTO "city_viewer_picture" VALUES('6972be4a-0f9b-11e2-a551-3c0754041eea','Angelina_4.jpg','/static/media/uploads/paris/Angelina_4.jpg','','696f65f5-0f9b-11e2-aa5d-3c0754041eea','2012-10-06 09:51:33.799874');
INSERT INTO "city_viewer_picture" VALUES('697352b8-0f9b-11e2-b29d-3c0754041eea','Angelina_5.jpg','/static/media/uploads/paris/Angelina_5.jpg','','696f65f5-0f9b-11e2-aa5d-3c0754041eea','2012-10-06 09:51:33.803871');
INSERT INTO "city_viewer_picture" VALUES('6973e6b0-0f9b-11e2-be09-3c0754041eea','Angelina_6.jpg','/static/media/uploads/paris/Angelina_6.jpg','','696f65f5-0f9b-11e2-aa5d-3c0754041eea','2012-10-06 09:51:33.807537');
INSERT INTO "city_viewer_picture" VALUES('69765e19-0f9b-11e2-b051-3c0754041eea','Fauchon_1.jpg','/static/media/uploads/paris/Fauchon_1.jpg','','6974cc30-0f9b-11e2-8f9e-3c0754041eea','2012-10-06 09:51:33.823568');
INSERT INTO "city_viewer_picture" VALUES('6976f3f0-0f9b-11e2-8bea-3c0754041eea','Fauchon_2.jpg','/static/media/uploads/paris/Fauchon_2.jpg','','6974cc30-0f9b-11e2-8f9e-3c0754041eea','2012-10-06 09:51:33.827526');
INSERT INTO "city_viewer_picture" VALUES('6977a085-0f9b-11e2-ac59-3c0754041eea','Fauchon_3.jpg','/static/media/uploads/paris/Fauchon_3.jpg','','6974cc30-0f9b-11e2-8f9e-3c0754041eea','2012-10-06 09:51:33.831823');
INSERT INTO "city_viewer_picture" VALUES('69783adc-0f9b-11e2-98bc-3c0754041eea','Fauchon_4.jpg','/static/media/uploads/paris/Fauchon_4.jpg','','6974cc30-0f9b-11e2-8f9e-3c0754041eea','2012-10-06 09:51:33.835928');
INSERT INTO "city_viewer_picture" VALUES('6978f454-0f9b-11e2-a031-3c0754041eea','Fauchon_5.jpg','/static/media/uploads/paris/Fauchon_5.jpg','','6974cc30-0f9b-11e2-8f9e-3c0754041eea','2012-10-06 09:51:33.840602');
INSERT INTO "city_viewer_picture" VALUES('69799ff8-0f9b-11e2-a07f-3c0754041eea','Fauchon_6.jpg','/static/media/uploads/paris/Fauchon_6.jpg','','6974cc30-0f9b-11e2-8f9e-3c0754041eea','2012-10-06 09:51:33.845059');
INSERT INTO "city_viewer_picture" VALUES('697a54e8-0f9b-11e2-a2a9-3c0754041eea','Fauchon_7.jpg','/static/media/uploads/paris/Fauchon_7.jpg','','6974cc30-0f9b-11e2-8f9e-3c0754041eea','2012-10-06 09:51:33.849644');
INSERT INTO "city_viewer_picture" VALUES('697fd670-0f9b-11e2-9c25-3c0754041eea','Chartier_1.jpg','/static/media/uploads/paris/Chartier_1.jpg','','697e807a-0f9b-11e2-8a63-3c0754041eea','2012-10-06 09:51:33.885704');
INSERT INTO "city_viewer_picture" VALUES('69806df5-0f9b-11e2-9fe2-3c0754041eea','Chartier_2.jpg','/static/media/uploads/paris/Chartier_2.jpg','','697e807a-0f9b-11e2-8a63-3c0754041eea','2012-10-06 09:51:33.889376');
CREATE TABLE "city_viewer_topic" (
    "id" varchar(36) NOT NULL PRIMARY KEY,
    "name" varchar(50) NOT NULL,
    "desc" varchar(255) NOT NULL,
    "in_area_id" integer NOT NULL REFERENCES "city_viewer_area" ("id"),
    "weight" smallint NOT NULL
);
INSERT INTO "city_viewer_topic" VALUES('746ed2a8-0f5e-11e2-aebf-3c0754041eea','必游之地','没到过这些地方，不算真正游过香港！',1,1);
INSERT INTO "city_viewer_topic" VALUES('7481eb7a-0f5e-11e2-9a84-3c0754041eea','维港景致','太平山顶、天际100、Aqua Spirit都号称自己是坐拥无敌维港美景的绝佳位置，你心目中的圣地在哪里呢？',1,2);
INSERT INTO "city_viewer_topic" VALUES('748286c2-0f5e-11e2-b934-3c0754041eea','购物天堂中的“天堂”','到香港“血拼”，靠的就是眼力、脚力、耐力和荷包的承受力。',1,3);
INSERT INTO "city_viewer_topic" VALUES('74832bb8-0f5e-11e2-a725-3c0754041eea','特色购物街区','不是每一次购物都是满载而归，也许这次的香港之行你需要的就是一双限量版的波鞋而已。',1,4);
INSERT INTO "city_viewer_topic" VALUES('7483c60c-0f5e-11e2-ad73-3c0754041eea','地道美食代表作','如果摆在面前的食物在任何地方都能吃到，那我来香港干嘛？',1,5);
INSERT INTO "city_viewer_topic" VALUES('748479e6-0f5e-11e2-bb8b-3c0754041eea','名人热捧的老字号','没有两把刷子，光靠“老字号”的招牌，单凭“名人”的效应在香港这个美食之都可是难以立足的。',1,6);
INSERT INTO "city_viewer_topic" VALUES('74851694-0f5e-11e2-9b9f-3c0754041eea','晚九朝五夜精彩','夜色渐浓，街上行人不减反增，不夜城并非浪得虚名，这会儿夜生活才刚刚开始呢！',1,7);
INSERT INTO "city_viewer_topic" VALUES('7485cf26-0f5e-11e2-85c2-3c0754041eea','原味香港在离岛','香港总给人一种熙来攘往繁忙热闹的感觉，其实只需坐船30分钟，昔日宁静的小渔港将立刻重现眼前。',1,8);
INSERT INTO "city_viewer_topic" VALUES('74867fc0-0f5e-11e2-ba8d-3c0754041eea','怀旧与传统','这是一座超级繁华的国际化的大都市，却又有这么多保存完好的历史遗迹以及影响深远的传统文化，真是难能可贵。',1,9);
INSERT INTO "city_viewer_topic" VALUES('748743e1-0f5e-11e2-bc25-3c0754041eea','有趣难忘的体验','试着用一天的时间去赛马，去听演唱会，去逛逛太空馆，香港的颜色将会变得更加多彩。',1,10);
INSERT INTO "city_viewer_topic" VALUES('68e231fd-0f9b-11e2-a830-3c0754041eea','巴黎必游景点','巴黎，何时开始对她心生向往？',2,1);
INSERT INTO "city_viewer_topic" VALUES('68edf319-0f9b-11e2-8b8a-3c0754041eea','漫步特色街区','文艺的巴黎，时尚的巴黎、浪漫的巴黎，美食的巴黎，每个人的心中都有一个自己的巴黎。',2,2);
INSERT INTO "city_viewer_topic" VALUES('68ee9adc-0f9b-11e2-a258-3c0754041eea','塞纳河畔风光','无论是白天、日落时分还是华灯齐明的夜晚，泛舟塞纳河，看两岸景象飘忽而过，呈现一个平静祥和的巴黎。',2,3);
INSERT INTO "city_viewer_topic" VALUES('68ef500a-0f9b-11e2-a544-3c0754041eea','拉丁区的文艺地图','咖啡馆的浓香味和淡淡的书香味在巴黎左岸拉丁区的古老街道随处飘荡，如果在巴黎却不去拉丁区走走总是会有些遗憾。',2,4);
INSERT INTO "city_viewer_topic" VALUES('68eff230-0f9b-11e2-bef1-3c0754041eea','蒙马特艺术与香艳并存','神圣的教堂，画家云集的广场，夜夜笙歌的场所，还有写满爱意的爱墙，宗教、艺术、香艳和爱情在这里和谐并存着。',2,5);
INSERT INTO "city_viewer_topic" VALUES('68f094f5-0f9b-11e2-b00e-3c0754041eea','左岸咖啡','左岸咖啡似乎总能引发人们对巴黎咖啡馆的浪漫想象，其实位于巴黎左岸的咖啡馆都能算得上是左岸咖啡。',2,6);
INSERT INTO "city_viewer_topic" VALUES('68f13f3d-0f9b-11e2-91ed-3c0754041eea','美食大搜罗','巴黎人爱美食，巴黎人留恋无拘无束的露天咖啡馆，巴黎人更离不开各种甜品，或许这就是表巴黎的美食性格。',2,7);
INSERT INTO "city_viewer_topic" VALUES('68f1e861-0f9b-11e2-a0e6-3c0754041eea','巴黎之夜','巴黎的夜晚可以去红磨坊看康康舞，可以泛舟塞纳河上，也可以在酒吧看帅哥……浪漫的、风雅的、有趣的、疯狂的事，在巴黎都可以做！',2,8);
INSERT INTO "city_viewer_topic" VALUES('68f2a461-0f9b-11e2-9caa-3c0754041eea','在巴黎血拼','巴黎作为时尚之都，自然是不能不采购一番了，大到奢侈品，小到独一无二的个性设计品，只要花点时间，总能淘到自己喜欢的。',2,9);
INSERT INTO "city_viewer_topic" VALUES('68f3590c-0f9b-11e2-84e8-3c0754041eea','近郊推荐','如果有足够的时间，那么不妨去巴黎近郊的凡尔赛宫和枫丹白露。',2,10);
INSERT INTO "city_viewer_topic" VALUES('3d5896ee-0f9c-11e2-b1e6-3c0754041eea','测试主题','测试主题',2,11);
CREATE TABLE "city_viewer_place_in_topics" (
    "id" integer NOT NULL PRIMARY KEY,
    "place_id" varchar(36) NOT NULL,
    "topic_id" varchar(36) NOT NULL REFERENCES "city_viewer_topic" ("id"),
    UNIQUE ("place_id", "topic_id")
);
INSERT INTO "city_viewer_place_in_topics" VALUES(1,'7487fee8-0f5e-11e2-882b-3c0754041eea','746ed2a8-0f5e-11e2-aebf-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(2,'748e8c9c-0f5e-11e2-b63b-3c0754041eea','746ed2a8-0f5e-11e2-aebf-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(3,'74907502-0f5e-11e2-81da-3c0754041eea','746ed2a8-0f5e-11e2-aebf-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(4,'7492db30-0f5e-11e2-bd23-3c0754041eea','746ed2a8-0f5e-11e2-aebf-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(5,'74958f9c-0f5e-11e2-9cb3-3c0754041eea','746ed2a8-0f5e-11e2-aebf-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(6,'74980fd7-0f5e-11e2-8d21-3c0754041eea','746ed2a8-0f5e-11e2-aebf-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(7,'749ec775-0f5e-11e2-a274-3c0754041eea','746ed2a8-0f5e-11e2-aebf-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(8,'74a118a6-0f5e-11e2-9884-3c0754041eea','746ed2a8-0f5e-11e2-aebf-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(9,'74a3b4fa-0f5e-11e2-8863-3c0754041eea','746ed2a8-0f5e-11e2-aebf-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(10,'74a3b4fa-0f5e-11e2-8863-3c0754041eea','7481eb7a-0f5e-11e2-9a84-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(11,'74a70128-0f5e-11e2-88ed-3c0754041eea','746ed2a8-0f5e-11e2-aebf-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(12,'74a70128-0f5e-11e2-88ed-3c0754041eea','7481eb7a-0f5e-11e2-9a84-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(13,'74a9f554-0f5e-11e2-8491-3c0754041eea','746ed2a8-0f5e-11e2-aebf-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(14,'74a9f554-0f5e-11e2-8491-3c0754041eea','7481eb7a-0f5e-11e2-9a84-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(15,'74ae5c6e-0f5e-11e2-8b71-3c0754041eea','746ed2a8-0f5e-11e2-aebf-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(16,'74ae5c6e-0f5e-11e2-8b71-3c0754041eea','7481eb7a-0f5e-11e2-9a84-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(17,'74b22061-0f5e-11e2-90b4-3c0754041eea','746ed2a8-0f5e-11e2-aebf-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(18,'74b22061-0f5e-11e2-90b4-3c0754041eea','7481eb7a-0f5e-11e2-9a84-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(19,'74b4545e-0f5e-11e2-8b72-3c0754041eea','7483c60c-0f5e-11e2-ad73-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(20,'74b75d3d-0f5e-11e2-8486-3c0754041eea','7483c60c-0f5e-11e2-ad73-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(21,'74c0d697-0f5e-11e2-b981-3c0754041eea','7483c60c-0f5e-11e2-ad73-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(22,'74c3ddc0-0f5e-11e2-99b2-3c0754041eea','7483c60c-0f5e-11e2-ad73-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(23,'74c64921-0f5e-11e2-9d5d-3c0754041eea','7483c60c-0f5e-11e2-ad73-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(24,'74c8289e-0f5e-11e2-92cd-3c0754041eea','7483c60c-0f5e-11e2-ad73-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(25,'74cb0df0-0f5e-11e2-bbc3-3c0754041eea','7483c60c-0f5e-11e2-ad73-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(26,'74cd41bd-0f5e-11e2-81f3-3c0754041eea','748286c2-0f5e-11e2-b934-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(27,'74cf4e8a-0f5e-11e2-bef9-3c0754041eea','748286c2-0f5e-11e2-b934-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(28,'74d21214-0f5e-11e2-a437-3c0754041eea','748286c2-0f5e-11e2-b934-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(29,'74d54338-0f5e-11e2-85f4-3c0754041eea','748286c2-0f5e-11e2-b934-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(30,'74d72aa6-0f5e-11e2-9fa3-3c0754041eea','748286c2-0f5e-11e2-b934-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(31,'74dd64b5-0f5e-11e2-9dc6-3c0754041eea','748286c2-0f5e-11e2-b934-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(32,'74dec0f3-0f5e-11e2-8c8f-3c0754041eea','748286c2-0f5e-11e2-b934-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(33,'74e079cf-0f5e-11e2-96e9-3c0754041eea','748286c2-0f5e-11e2-b934-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(34,'74e256c5-0f5e-11e2-996a-3c0754041eea','748286c2-0f5e-11e2-b934-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(35,'74e48c47-0f5e-11e2-b855-3c0754041eea','748286c2-0f5e-11e2-b934-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(36,'74e5f4fa-0f5e-11e2-9b0a-3c0754041eea','748286c2-0f5e-11e2-b934-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(37,'74e751cf-0f5e-11e2-83fd-3c0754041eea','74867fc0-0f5e-11e2-ba8d-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(38,'74e96b1c-0f5e-11e2-b813-3c0754041eea','74867fc0-0f5e-11e2-ba8d-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(39,'74ebed9c-0f5e-11e2-8e27-3c0754041eea','74867fc0-0f5e-11e2-ba8d-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(40,'74eeb361-0f5e-11e2-8a81-3c0754041eea','74867fc0-0f5e-11e2-ba8d-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(41,'74f038b8-0f5e-11e2-83b6-3c0754041eea','74867fc0-0f5e-11e2-ba8d-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(42,'74fa6502-0f5e-11e2-870c-3c0754041eea','74867fc0-0f5e-11e2-ba8d-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(43,'75008661-0f5e-11e2-ad9c-3c0754041eea','748479e6-0f5e-11e2-bb8b-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(44,'750474e8-0f5e-11e2-8964-3c0754041eea','748479e6-0f5e-11e2-bb8b-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(45,'751861f5-0f5e-11e2-a48c-3c0754041eea','748479e6-0f5e-11e2-bb8b-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(46,'751a6fbd-0f5e-11e2-b9a0-3c0754041eea','748479e6-0f5e-11e2-bb8b-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(47,'751e0540-0f5e-11e2-9697-3c0754041eea','748479e6-0f5e-11e2-bb8b-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(48,'7520f780-0f5e-11e2-8ec1-3c0754041eea','748479e6-0f5e-11e2-bb8b-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(49,'7523d2ab-0f5e-11e2-8c5e-3c0754041eea','748479e6-0f5e-11e2-bb8b-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(50,'752591ab-0f5e-11e2-b906-3c0754041eea','748479e6-0f5e-11e2-bb8b-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(51,'7528a366-0f5e-11e2-be6e-3c0754041eea','748479e6-0f5e-11e2-bb8b-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(52,'752b2a70-0f5e-11e2-9c48-3c0754041eea','748479e6-0f5e-11e2-bb8b-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(53,'7532d1cf-0f5e-11e2-ad3f-3c0754041eea','748479e6-0f5e-11e2-bb8b-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(54,'75358338-0f5e-11e2-b308-3c0754041eea','748479e6-0f5e-11e2-bb8b-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(55,'7537951c-0f5e-11e2-8039-3c0754041eea','748479e6-0f5e-11e2-bb8b-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(56,'75399433-0f5e-11e2-a28a-3c0754041eea','74832bb8-0f5e-11e2-a725-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(57,'753c19de-0f5e-11e2-9f0d-3c0754041eea','74832bb8-0f5e-11e2-a725-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(58,'753eee99-0f5e-11e2-817a-3c0754041eea','74832bb8-0f5e-11e2-a725-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(59,'7540fe19-0f5e-11e2-9c0a-3c0754041eea','74832bb8-0f5e-11e2-a725-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(60,'75430097-0f5e-11e2-b2d6-3c0754041eea','74851694-0f5e-11e2-9b9f-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(61,'754530dc-0f5e-11e2-aaad-3c0754041eea','74851694-0f5e-11e2-9b9f-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(62,'7546a14a-0f5e-11e2-bc3f-3c0754041eea','7481eb7a-0f5e-11e2-9a84-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(63,'754924e3-0f5e-11e2-b0b5-3c0754041eea','7481eb7a-0f5e-11e2-9a84-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(64,'754fbd5e-0f5e-11e2-ba58-3c0754041eea','7481eb7a-0f5e-11e2-9a84-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(65,'755330e1-0f5e-11e2-8c2f-3c0754041eea','748743e1-0f5e-11e2-bc25-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(66,'755593dc-0f5e-11e2-8aed-3c0754041eea','748743e1-0f5e-11e2-bc25-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(67,'755e08fa-0f5e-11e2-a8c9-3c0754041eea','748743e1-0f5e-11e2-bc25-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(68,'756cc582-0f5e-11e2-8d39-3c0754041eea','748743e1-0f5e-11e2-bc25-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(69,'75705794-0f5e-11e2-8b52-3c0754041eea','748743e1-0f5e-11e2-bc25-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(70,'75721e9e-0f5e-11e2-9882-3c0754041eea','7485cf26-0f5e-11e2-85c2-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(71,'7578300f-0f5e-11e2-b25a-3c0754041eea','7485cf26-0f5e-11e2-85c2-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(72,'75874563-0f5e-11e2-aa2f-3c0754041eea','7485cf26-0f5e-11e2-85c2-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(73,'75944e9c-0f5e-11e2-be3d-3c0754041eea','7485cf26-0f5e-11e2-85c2-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(74,'75944e9c-0f5e-11e2-be3d-3c0754041eea','74832bb8-0f5e-11e2-a725-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(75,'68f41b4c-0f9b-11e2-a6f8-3c0754041eea','68e231fd-0f9b-11e2-a830-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(76,'68f41b4c-0f9b-11e2-a6f8-3c0754041eea','68ee9adc-0f9b-11e2-a258-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(77,'68f64fde-0f9b-11e2-a5ea-3c0754041eea','68e231fd-0f9b-11e2-a830-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(78,'68f64fde-0f9b-11e2-a5ea-3c0754041eea','68ee9adc-0f9b-11e2-a258-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(79,'68f64fde-0f9b-11e2-a5ea-3c0754041eea','68f1e861-0f9b-11e2-a0e6-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(81,'68fa85d7-0f9b-11e2-b042-3c0754041eea','68e231fd-0f9b-11e2-a830-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(82,'68fa85d7-0f9b-11e2-b042-3c0754041eea','68f2a461-0f9b-11e2-9caa-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(83,'68fcb999-0f9b-11e2-86b3-3c0754041eea','68e231fd-0f9b-11e2-a830-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(84,'68fcb999-0f9b-11e2-86b3-3c0754041eea','68ee9adc-0f9b-11e2-a258-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(85,'68feadf0-0f9b-11e2-84dc-3c0754041eea','68e231fd-0f9b-11e2-a830-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(86,'68feadf0-0f9b-11e2-84dc-3c0754041eea','68eff230-0f9b-11e2-bef1-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(87,'6900ad4f-0f9b-11e2-aa41-3c0754041eea','68f3590c-0f9b-11e2-84e8-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(88,'69070073-0f9b-11e2-b90b-3c0754041eea','68e231fd-0f9b-11e2-a830-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(89,'69070073-0f9b-11e2-b90b-3c0754041eea','68ee9adc-0f9b-11e2-a258-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(90,'69091666-0f9b-11e2-8d2a-3c0754041eea','68e231fd-0f9b-11e2-a830-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(91,'69091666-0f9b-11e2-8d2a-3c0754041eea','68ee9adc-0f9b-11e2-a258-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(92,'69091666-0f9b-11e2-8d2a-3c0754041eea','68ef500a-0f9b-11e2-a544-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(93,'690bb447-0f9b-11e2-9f41-3c0754041eea','68e231fd-0f9b-11e2-a830-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(94,'690d5aee-0f9b-11e2-bba3-3c0754041eea','68e231fd-0f9b-11e2-a830-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(95,'690d5aee-0f9b-11e2-bba3-3c0754041eea','68ee9adc-0f9b-11e2-a258-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(96,'690d5aee-0f9b-11e2-bba3-3c0754041eea','68f1e861-0f9b-11e2-a0e6-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(97,'691047d9-0f9b-11e2-a149-3c0754041eea','68edf319-0f9b-11e2-8b8a-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(98,'6911e8e1-0f9b-11e2-b70d-3c0754041eea','68e231fd-0f9b-11e2-a830-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(99,'691368dc-0f9b-11e2-83ad-3c0754041eea','68ef500a-0f9b-11e2-a544-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(100,'6914b847-0f9b-11e2-a195-3c0754041eea','68f3590c-0f9b-11e2-84e8-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(101,'69197c2b-0f9b-11e2-9a08-3c0754041eea','68ee9adc-0f9b-11e2-a258-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(102,'691adb8a-0f9b-11e2-bcbc-3c0754041eea','68ee9adc-0f9b-11e2-a258-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(103,'691c613a-0f9b-11e2-aaad-3c0754041eea','68edf319-0f9b-11e2-8b8a-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(104,'691dfb42-0f9b-11e2-99b8-3c0754041eea','68f1e861-0f9b-11e2-a0e6-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(105,'691dfb42-0f9b-11e2-99b8-3c0754041eea','68eff230-0f9b-11e2-bef1-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(106,'69203328-0f9b-11e2-96b9-3c0754041eea','68ef500a-0f9b-11e2-a544-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(107,'6921b797-0f9b-11e2-a1ac-3c0754041eea','68f1e861-0f9b-11e2-a0e6-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(108,'6923590f-0f9b-11e2-afc7-3c0754041eea','68ef500a-0f9b-11e2-a544-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(109,'6923590f-0f9b-11e2-afc7-3c0754041eea','68f094f5-0f9b-11e2-b00e-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(110,'69254354-0f9b-11e2-9caa-3c0754041eea','68ef500a-0f9b-11e2-a544-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(111,'69254354-0f9b-11e2-9caa-3c0754041eea','68f094f5-0f9b-11e2-b00e-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(112,'6927c50a-0f9b-11e2-8044-3c0754041eea','68ee9adc-0f9b-11e2-a258-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(113,'69296075-0f9b-11e2-9233-3c0754041eea','68e231fd-0f9b-11e2-a830-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(114,'692adc7d-0f9b-11e2-8fce-3c0754041eea','68eff230-0f9b-11e2-bef1-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(115,'692c68f0-0f9b-11e2-857d-3c0754041eea','68ee9adc-0f9b-11e2-a258-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(116,'692dd8e6-0f9b-11e2-b6ac-3c0754041eea','68ee9adc-0f9b-11e2-a258-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(117,'692f4047-0f9b-11e2-9b7c-3c0754041eea','68ef500a-0f9b-11e2-a544-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(118,'6930cb33-0f9b-11e2-bc36-3c0754041eea','68f2a461-0f9b-11e2-9caa-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(119,'69327c40-0f9b-11e2-91c9-3c0754041eea','68e231fd-0f9b-11e2-a830-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(120,'6934004c-0f9b-11e2-bd5b-3c0754041eea','68e231fd-0f9b-11e2-a830-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(121,'6934004c-0f9b-11e2-bd5b-3c0754041eea','68edf319-0f9b-11e2-8b8a-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(122,'693621ba-0f9b-11e2-ba06-3c0754041eea','68ee9adc-0f9b-11e2-a258-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(123,'693a7a75-0f9b-11e2-bd30-3c0754041eea','68ee9adc-0f9b-11e2-a258-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(124,'693c0fb0-0f9b-11e2-9753-3c0754041eea','68f2a461-0f9b-11e2-9caa-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(125,'693da4e3-0f9b-11e2-a19c-3c0754041eea','68f2a461-0f9b-11e2-9caa-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(126,'693f4f23-0f9b-11e2-b467-3c0754041eea','68f2a461-0f9b-11e2-9caa-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(127,'6943d7b8-0f9b-11e2-a3a1-3c0754041eea','68f2a461-0f9b-11e2-9caa-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(128,'69452926-0f9b-11e2-858d-3c0754041eea','68f2a461-0f9b-11e2-9caa-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(129,'6946bdd7-0f9b-11e2-9fb1-3c0754041eea','68edf319-0f9b-11e2-8b8a-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(130,'69488333-0f9b-11e2-b57f-3c0754041eea','68f2a461-0f9b-11e2-9caa-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(131,'6949ff78-0f9b-11e2-b46b-3c0754041eea','68ef500a-0f9b-11e2-a544-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(132,'694b9263-0f9b-11e2-b2ff-3c0754041eea','68f2a461-0f9b-11e2-9caa-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(133,'694b9263-0f9b-11e2-b2ff-3c0754041eea','68edf319-0f9b-11e2-8b8a-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(134,'694dd359-0f9b-11e2-b05b-3c0754041eea','68eff230-0f9b-11e2-bef1-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(135,'694f625e-0f9b-11e2-bd6a-3c0754041eea','68f1e861-0f9b-11e2-a0e6-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(136,'6950ddfa-0f9b-11e2-93e4-3c0754041eea','68edf319-0f9b-11e2-8b8a-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(137,'69526a8c-0f9b-11e2-96e3-3c0754041eea','68ee9adc-0f9b-11e2-a258-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(138,'6953f17d-0f9b-11e2-83bc-3c0754041eea','68ee9adc-0f9b-11e2-a258-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(139,'69556ae8-0f9b-11e2-837c-3c0754041eea','68f094f5-0f9b-11e2-b00e-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(140,'69556ae8-0f9b-11e2-837c-3c0754041eea','68f13f3d-0f9b-11e2-91ed-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(141,'6957f9de-0f9b-11e2-8694-3c0754041eea','68f094f5-0f9b-11e2-b00e-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(142,'6957f9de-0f9b-11e2-8694-3c0754041eea','68f13f3d-0f9b-11e2-91ed-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(143,'695a1a1e-0f9b-11e2-9110-3c0754041eea','68f1e861-0f9b-11e2-a0e6-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(144,'695a1a1e-0f9b-11e2-9110-3c0754041eea','68eff230-0f9b-11e2-bef1-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(145,'695c52c2-0f9b-11e2-b1e2-3c0754041eea','68f094f5-0f9b-11e2-b00e-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(146,'695e270a-0f9b-11e2-98ac-3c0754041eea','68f2a461-0f9b-11e2-9caa-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(147,'695ff007-0f9b-11e2-b6f0-3c0754041eea','68f2a461-0f9b-11e2-9caa-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(148,'69639399-0f9b-11e2-b922-3c0754041eea','68f13f3d-0f9b-11e2-91ed-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(149,'696555c0-0f9b-11e2-9ba4-3c0754041eea','68edf319-0f9b-11e2-8b8a-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(150,'696555c0-0f9b-11e2-9ba4-3c0754041eea','68f2a461-0f9b-11e2-9caa-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(151,'696795c2-0f9b-11e2-8f33-3c0754041eea','68f13f3d-0f9b-11e2-91ed-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(152,'69690e8f-0f9b-11e2-850d-3c0754041eea','68f13f3d-0f9b-11e2-91ed-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(153,'696f65f5-0f9b-11e2-aa5d-3c0754041eea','68f13f3d-0f9b-11e2-91ed-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(154,'6974cc30-0f9b-11e2-8f9e-3c0754041eea','68f13f3d-0f9b-11e2-91ed-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(155,'697b410a-0f9b-11e2-a28e-3c0754041eea','68f13f3d-0f9b-11e2-91ed-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(156,'697cf040-0f9b-11e2-bf72-3c0754041eea','68f13f3d-0f9b-11e2-91ed-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(157,'697e807a-0f9b-11e2-8a63-3c0754041eea','68f13f3d-0f9b-11e2-91ed-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(158,'69814bc2-0f9b-11e2-a78f-3c0754041eea','68f13f3d-0f9b-11e2-91ed-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(159,'6982b2bd-0f9b-11e2-9882-3c0754041eea','68edf319-0f9b-11e2-8b8a-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(160,'6982b2bd-0f9b-11e2-9882-3c0754041eea','68f2a461-0f9b-11e2-9caa-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(161,'6984e528-0f9b-11e2-a637-3c0754041eea','68f13f3d-0f9b-11e2-91ed-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(162,'6986b273-0f9b-11e2-85fe-3c0754041eea','68f13f3d-0f9b-11e2-91ed-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(163,'6988b054-0f9b-11e2-bfdd-3c0754041eea','68f13f3d-0f9b-11e2-91ed-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(164,'68f91982-0f9b-11e2-8556-3c0754041eea','3d5896ee-0f9c-11e2-b1e6-3c0754041eea');
INSERT INTO "city_viewer_place_in_topics" VALUES(165,'68f91982-0f9b-11e2-8556-3c0754041eea','68e231fd-0f9b-11e2-a830-3c0754041eea');
CREATE TABLE "city_viewer_place" (
    "id" varchar(36) NOT NULL PRIMARY KEY,
    "zh_name" varchar(50) NOT NULL,
    "en_name" varchar(100) NOT NULL,
    "category" smallint NOT NULL,
    "in_area_id" integer NOT NULL REFERENCES "city_viewer_area" ("id"),
    "longitude" varchar(20) NOT NULL,
    "latitude" varchar(20) NOT NULL,
    "short_desc" varchar(100) NOT NULL,
    "full_desc" text NOT NULL,
    "fit_time" smallint NOT NULL,
    "open_time" text NOT NULL,
    "address" varchar(255) NOT NULL,
    "traffic" text NOT NULL,
    "price" varchar(100) NOT NULL,
    "tel" varchar(30) NOT NULL,
    "website" varchar(255) NOT NULL,
    "tips" text NOT NULL,
    "modified_at" datetime NOT NULL
);
INSERT INTO "city_viewer_place" VALUES('7487fee8-0f5e-11e2-882b-3c0754041eea','青马大桥','Qing Ma Da Qiao',1,1,'114.074178','22.351267','青马大桥实际上算不得一个景点，因为任谁都没办法在上面驻留，但只要是坐飞机来港的，当然都会经过这里。在山水的映衬下，大桥的景深感非常好。','青马大桥（Tsing Ma Bridge），是配合香港国际机场（赤蜡角机场）而建的十大核心工程之一。于1992年5月开始兴建，历时五年竣工，造价71.44亿港元。青马大桥横跨青衣岛及马湾，桥身总长度2,200米，主跨长度1,377米，离海面高62米，青马大桥除创造世界最长的行车、铁路两用吊桥纪录外，包括青马大桥在内的“机场核心计划”还于1999年荣获美国建筑界权威及编辑选为“二十世纪十大建筑成就奖Top10 Construction Achievements of the20th Century”得主之一，并与英法海峡隧道、三藩市金门大桥、艾森豪威尔州际和国防公路系统、纽约帝国大厦、科罗拉多胡佛水坝、巴拿马运河、悉尼歌剧院、埃及阿斯旺水坝工程及纽约世界贸易中心同享殊荣。',3,'全天','香港青衣岛','','免费','','','','2012-10-06 02:35:13.094922');
INSERT INTO "city_viewer_place" VALUES('748e8c9c-0f5e-11e2-b63b-3c0754041eea','香港迪士尼乐园','Xiang Gang Di Shi Ni Le Yuan',9,1,'114.042109','22.312967','童年追的卡通人物触手可及，骑旋转木马的不是怪叔叔，扮公主的阿姨也不是老萝莉，迪士尼里只有快乐的孩子心性，无论你几岁。','香港迪士尼乐园（English: Hong Kong Disneyland）是位于香港新界大屿山香港迪士尼乐园度假区内的主题公园，占地约22.4公顷（不包括后台、仓库等支援设施），是迪士尼的第五座迪士尼乐园。乐园分为“美国小镇大街”、“探险世界”、“幻想世界”、“明日世界”，以及“反斗奇兵大本营”5大园区，各区均有中、西特色餐厅和不同的纪念品店。高潮所在的是每天下午3点30分举行的大巡游，以及晚上闭园前的烟花表演，足够玩乐一整天。',3,'周一至周日10:00-21:00','香港特别行政区大屿山 欣澳','港铁东涌线至“欣澳”站，转乘迪士尼线主题列车，直达迪士尼。','1日票成人:399HKD##1日票小童:285HKD##1日票长者:100HKD','852 1-830-830','park.hongkongdisneyland.com','','2012-10-06 02:35:13.137881');
INSERT INTO "city_viewer_place" VALUES('74907502-0f5e-11e2-81da-3c0754041eea','浅水湾','Qian Shui Wan',1,1,'114.196468','22.236654','香港最具代表性的沙滩，遍布别墅豪宅，李嘉诚的豪宅就在这里，张爱玲的《倾城之恋》就是以当时的浅水湾酒店作为背景的。','浅水湾在香港岛之南，依山傍海，海湾呈新月形，坡缓滩长，波平浪静，水清沙细，沙滩宽阔洁净而水浅，且冬暖夏凉，水温在十六摄氏度至二十七摄氏度之间，历来是港人消夏弄潮的胜地，也是游人必至的著名风景区。昔日，香江八景之一的“海国浮沉”，指的就是浅水湾的海滨浴场。',3,'全天','香港浅水湾海滩道26号','港铁香港站A1出口，步行至中环交易广场巴士总站搭乘6, 6A, 6X, 66或260线巴士，于浅水湾下车。','免费','','','','2012-10-06 02:35:13.150384');
INSERT INTO "city_viewer_place" VALUES('7492db30-0f5e-11e2-bd23-3c0754041eea','香港会议展览中心','Xiang Gang Hui Yi Zhan Lan Zhong Xin',1,1,'114.173025','22.280961','填海而筑的会展中心无疑是维港两岸最为抢眼的建筑，似一只展翅待飞的海鸟，俯瞰着维多利亚港。','香港会议展览中心是香港最新建筑群中的代表。在香港会议展览中心除了有大型会议以及展览作用外，会议展览中心还设立了两间五星级酒店、豪华公寓以及办公大楼，为来此旅游的各界人士提供了方便。在1997年香港回归的时候曾在香港会议展览中心举行过中国大典，那一伟大的时刻也让这里成为了国际的焦点。',8,'周一至周日08:00-22:00','香港湾仔港湾道1号','港铁湾仔站','','852-2582 8888','www.hkcec.com.hk/','','2012-10-06 02:35:13.166101');
INSERT INTO "city_viewer_place" VALUES('74958f9c-0f5e-11e2-9cb3-3c0754041eea','金紫荆广场','Jin Zi Jing Yan Chang',1,1,'114.173548','22.284488','标志香港回归的“永远盛开的紫荆花”，合影留念第一景，当然也是人满为患。','“永远盛开的紫荆花”雕塑－金紫荆雕像矗立于香港会议展览中心新翼海旁的博览海滨花园内。在金紫荆广场飘扬着中国国旗及香港特区区旗，每天上午8时举行升旗仪式，晚6点举行降旗仪式。每年的7月1日香港特区成立纪念日和10月1日中国国庆日，这里都会举行隆重的升旗仪式，特区行政长官率领特区政府主要官员出席，飞行服务队的直升机方阵低飞过广场上空，消防船还会进行喷水表演，吸引大批市民和游客前来观赏。',8,'全天','香港湾仔博览道1号香港会展中心旁','港铁湾仔站','免费','','','','2012-10-06 02:35:13.183825');
INSERT INTO "city_viewer_place" VALUES('74980fd7-0f5e-11e2-8d21-3c0754041eea','香港海洋公园','Xiang Gang Hai Yang Gong Yuan',9,1,'114.176080','22.245425','香港老牌主题公园，香港旅游的代名词，拥有全东南亚最大海洋水族馆,海豚表演最受欢迎。','香港海洋公园是香港一个以海洋为主的大型主题公园，位于香港南区的黄竹坑，1977年1月10日落成启用。香港海洋公园拥有全东南亚最大的海洋水族馆及主题游乐园，凭山临海，旖旎多姿，是访港旅客最爱光顾的地方。在这里不仅可以看到趣味十足的露天游乐场、海豚表演，还有千奇百怪的海洋性鱼类、高耸入云的海洋摩天塔，更有惊险刺激的越矿飞车、极速之旅，堪称科普、观光、娱乐的完美组合。',3,'周一至周日06:00-18:00','香港海洋公園道','中环码头出口往左直走乘专线629','成人: 280HKD##3-11岁儿童: 140HKD','852-3923 2323 ‎','','','2012-10-06 02:35:13.200223');
INSERT INTO "city_viewer_place" VALUES('749ec775-0f5e-11e2-a274-3c0754041eea','幻彩咏香江','Huan Cai Yong Xiang Jiang',1,1,'114.172583','22.288938','在维港星空下，与光芒四射的电影明星，一同观赏全球最大型的灯光音乐汇演！','幻彩咏香江（ A Symphony of Lights）是香港著名的镭射灯光音乐汇演，由香港维多利亚港两岸合共44座大厦摩天大楼及地标合作举行，透过互动灯光及音乐效果，展示维港充满动感和多姿多彩的一面。观赏汇演的最佳地点是由星光大道至香港文化中心外的尖沙咀海旁、湾仔金紫荆广场海滨长廊，或维多利亚港内的观光渡轮。',4,'周一至周日20:00-20:14','香港 九龙西油尖旺区尖沙咀','','免费','','','','2012-10-06 02:35:13.244245');
INSERT INTO "city_viewer_place" VALUES('74a118a6-0f5e-11e2-9884-3c0754041eea','香港杜莎夫人蜡像馆','Xiang Gang Du Sha Fu Ren Zha Xiang Guan',1,1,'114.149628','22.271400','涛哥嘉诚这类人物岂是我等屌丝能够随便得见的，不如在蜡像馆里一饱眼福吧。和姚明比高，和贝克汉姆比球技，与明星合照不再是梦想！','香港杜莎夫人蜡像馆（Madame Tussauds Hong Kong），简称“香港蜡像馆”，位于香港太平山顶凌霄阁，是专门展览名人蜡像的博物馆。杜莎夫人蜡像馆总馆位于英国伦敦，香港分馆于2000年开幕，展出约100尊国际、中国及香港名人的蜡像。包括中华人民共和国国家主席胡锦涛、篮球明星姚明、足球明星碧咸（大卫·贝克汉姆）、香港奥运金牌得主李丽珊、著名艺人陈慧琳、周杰伦、刘德华等，以及已故巨星邓丽君、梅艳芳、张国荣等。',6,'周一至周日10:00-22:00','香港 山顶道128号凌霄阁2楼','港岛中环站J2出口，步行约15分钟前往花园道缆车站换乘山顶缆车。','成人门票160HKD##小童门票（三至十一岁）90HKD##长者门票（六十五岁或以上）90HKD','852-2849 6966','www.madametussauds.com/','','2012-10-06 02:35:13.259425');
INSERT INTO "city_viewer_place" VALUES('74a3b4fa-0f5e-11e2-8863-3c0754041eea','天星小轮','Tian Xing Xiao Lun',1,1,'114.161232','22.287171','在香港玩，最有腔调的交通方式就是天星小轮，年头比上海摆渡船还久，风景比黄浦江两岸还更胜一筹，价钱却只是在北京坐一次地铁的花费而已。','天星小轮是香港著名的拥有悠久历史的交通工具，是香港的维多利亚港常见的渡海交通工具。服务香港逾百年的天星小轮，在香港的维多利亚港提供渡海小轮服务，载客来往香港岛及九龙半岛。每隔数分钟或十多分钟便有一台开往对岸。《国家地理旅游杂志》曾把乘搭天星小轮游览维港两岸誉为“人生50个必到景点”之一。',4,'周一至周日06:30-23:30','中环民耀街7号','港铁尖沙咀站','尖沙咀/湾仔往来中环航线收费##平日成人下层2HKD,上层2.50HKD##3至12岁小童分别为1.40HKD和1.50HKD##周六日及公众假日下层2.40HKD、上层3.00HKD##3至12岁小童分别为1.70HKD和1.80HKD','','','','2012-10-06 02:35:13.276543');
INSERT INTO "city_viewer_place" VALUES('74a70128-0f5e-11e2-88ed-3c0754041eea','维多利亚港','Wei Duo Li Ya Gang',1,1,'114.170866','22.289533','维多利亚港是香港的城市天际线，入夜后，沿岸一列列的摩天楼宇里万家灯火亮起，犹如星光闪烁，十分美丽。节日还会放烟火，让人想起《玻璃之城》。','维多利亚港（简称维港，英文：Victoria Harbour）是香港的香港岛和九龙半岛之间的海港。由于港阔水深，被喻为“世界三大天然良港”之一，香港亦因而有了“东方之珠”和“世界三大夜景”之美誉。当年英国占领这个海港时，正是维多利亚女王在位，因此得名。',4,'全天','香港岛中西区','','免费','','','','2012-10-06 02:35:13.298150');
INSERT INTO "city_viewer_place" VALUES('74a9f554-0f5e-11e2-8491-3c0754041eea','香港星光大道','Xiang Gang Xing Guang Da Dao',1,1,'114.175088','22.29342','逛维港的时候就可以来看看，熟悉香港电影人尤其是香港武侠片的话，这条路就显得有趣多了，从李小龙雕像到姜大卫手印，让你过足怀旧的瘾。','香港星光大道（英语：Avenue of Stars）是位于香港九龙尖沙咀东部的尖沙咀海滨花园，沿新世界中心对面的维多利亚港。2003年，由新世界发展有限公司斥资4000万港元赞助兴建，在2004年4月27日开幕，并移交予香港特别行政区政府，供市民休憩及游客观光。星光大道是为表扬香港电影界的杰出人士的特色景点，仿效好莱坞星光大道，杰出电影工作者的芳名与手掌印镶嵌在特制的纪念牌匾，以年代依次排列在星光大道上，目前星光大道有可容纳100名电影工作者的纪念牌匾。',8,'全天','尖沙咀梳士巴利道18号','','免费','','','','2012-10-06 02:35:13.317505');
INSERT INTO "city_viewer_place" VALUES('74ae5c6e-0f5e-11e2-8b71-3c0754041eea','太平山(香港山顶)','Tai Ping Shan(Xiang Gang Shan Ding)',1,1,'114.149435','22.270643','美不胜收的东方之珠一览无余，没有到过太平山，你无法体会港城的魅力。','香港太平山，英语：Victoria Peak，一般指“太平山山顶”，因而被香港人简称为山顶，太平山原名“硬头山”，古称香炉峰，海拔554米，是香港岛的最高峰。据传嘉庆年间海盗张保仔盘踞港岛时，在山下设东西营盘，并利用该峰作了望台，看见海上有商船经过，就用旗号通知山下营寨，出动船只去截劫，故称扯旗山。这里是看香港夜景的最佳地点。山顶缆车车票：成人（单程25元，双程36元）；儿童和长者（单程9元，双程16元）。',4,'周一至周日10:00-23:00','香港山頂山頂道118號','港岛中环站J2出口，步行约15分钟前往花园道缆车站换乘山顶缆车。','免费','852-2849 7654','www.thepeak.com.hk/tc/home.asp','','2012-10-06 02:35:13.346425');
INSERT INTO "city_viewer_place" VALUES('74b22061-0f5e-11e2-90b4-3c0754041eea','尖沙咀海滨花园','Jian Sha Zui Hai Bin Hua Yuan',1,1,'114.178711','22.297559','动感香港也有安静的一面，这一条沿维多利亚港而建的观景步道，非常适合漫游一族。','尖沙咀海滨花园（英语：Tsim Sha Tsui Promenade，俗称尖沙咀海滨长廊）是香港的一个海滨公园，位于九龙尖沙咀东海旁，可看到维多利亚港海景。公园全长1.6公里，西至尖沙咀天星码头，东至红磡海底隧道九龙入口。2003年，公园的其中一部分改建为“星光大道”，表扬香港电影界的杰出人士。这一带是欣赏维港景色的理想地方。整个公园铺砌了粉红色的阶砖路，有超过100盏街灯作照明，为尖沙咀的夜色增添璀灿光辉。',8,'全天','尖沙咀梳士巴利道','港铁尖沙咀站F出口，或尖沙咀火车站，往太空馆方向前进即达。','免费','','','','2012-10-06 02:35:13.371038');
INSERT INTO "city_viewer_place" VALUES('74b4545e-0f5e-11e2-8b72-3c0754041eea','添好运点心专卖店','Tian Hao Yun Dian Xin Zhuan Mai Dian',2,1,'114.173063','22.316019','原四季酒店点心主管创办，被评为全世界最便宜的米其林餐厅。','添好运点心专门店是一间著名的香港点心店，现有两间分店，分别位于九龙旺角广华街及深水埗福荣街。店东麦桂培原是龙景轩点心主管，于2009年3月创业开设添好运，不足一年已获国际饮食权威米其林评为一星级食肆，是全球最廉宜的“星级食府”。该店点心“即叫即蒸”，以脆皮叉烧包、萝卜糕及糯米鸡等闻名。',8,'周一至周日10:00-22:00','旺角登打士街83号','港铁油麻地站','人均40HKD','852-2332 2896','','','2012-10-06 02:35:13.385478');
INSERT INTO "city_viewer_place" VALUES('74b75d3d-0f5e-11e2-8486-3c0754041eea','糖朝','Tang Chao',2,1,'114.168707','22.299319','招牌甜品是原桶豆腐花，爽滑可口，豆味十足，邀约三五好友一起享用吧！','糖朝是一间坚持沿用传统家传技术烹调糖水的专门店。推开糖朝大门，古色古香的环境顿时映入眼帘，仿古的吊扇弥漫着怀旧气息，如同时光倒流，仿佛置身于五六十年代的感觉。糖朝用传统手法所做的糖水也非常考究，材料方面，以原材料本身特有的甜味为主角，而冰糖、蔗糖则是调和的配角，确保多吃亦无妨，健康、养颜等功效更佳，老幼皆宜。适逢冬季进补的好时节，一些养生养颜、有药膳功效的糖水大受欢迎。',8,'周一～周四10:00-24:00##周五10:00-01:00##周六07:30-01:00##周日07:30-24:00','尖沙咀广东道116-118号','港铁尖沙咀站A1出口，沿海防道西行至广东道右转。','人均消费：30HKD','852-2199 7799','','','2012-10-06 02:35:13.405367');
INSERT INTO "city_viewer_place" VALUES('74c0d697-0f5e-11e2-b981-3c0754041eea','恭和堂','Gong He Tang',2,1,'114.183108','22.278613','传统工艺制作的正宗龟灵膏，每晚睡前一盅，清热去火最佳选择。','恭和堂的格局分明就引领大家回到武侠小说中人人懂掌门会放飞剑的年代，大师兄中了毒小师妹要在江湖中访寻名医仙药，终于觅得坚持古法秘方用上野生金钱龟板熬煮出的汁液，凝固成半透明深棕色的固状龟苓膏，入口既韧且滑，甘而不苦。传统食法当然要趁热，但为了开拓年轻市场，也有冻食的选择，一样是清热解毒的药疗美味。吃后来碗这里著名的雪梨水，清润解渴，相得益彰。',8,'周一至周日10:30-23:45','铜锣湾波斯富街87号','港铁铜锣湾站。','人均消费：50HKD','852-2576 1001','','','2012-10-06 02:35:13.467453');
INSERT INTO "city_viewer_place" VALUES('74c3ddc0-0f5e-11e2-99b2-3c0754041eea','义顺牛奶公司','Yi Shun Niu Nai Gong Si',2,1,'114.183287','22.280477','专攻炖蛋炖奶，临街的冷冻橱窗蛋黄奶白一碗一碗高低排列就已足够吸引途人驻足。','义顺牛奶公司是香港一间很普通的茶餐厅，但出名的奶制品却让人流连忘返。双皮奶、姜撞奶都是招牌奶制品。',6,'周一至周日12:00-00:00','香港铜锣湾骆克道506号','','人均消费：40HKD','852-2591 1837','','','2012-10-06 02:35:13.487307');
INSERT INTO "city_viewer_place" VALUES('74c64921-0f5e-11e2-9d5d-3c0754041eea','十三座牛杂','Shi San Zuo Niu Za',2,1,'114.200134','22.291335','总能看见一群上班族或学生，在这个小摊子前，手里握着牛杂，鱼蛋不顾形象的大快朵颐。','香港十三座牛杂除了牛杂，鱼蛋、八爪鱼、香辣卤也做出应有的小食水准，鱼蛋的咖喱汁用了3种咖喱粉、磨豉酱等11种调味料调味，咖喱汁配爽口弹牙的八爪鱼亦深受欢迎，近年更推出樽仔奶茶，味道比坊间的冻奶茶来得浓滑，深受奶茶迷喜爱。必尝招牌菜：牛杂、八爪鱼、鱼蛋、樽仔奶茶。总店在香港北角书局街1号。',6,'周一至周日07:00-21:00（牛杂供应12:00-21:00）','香港北角书局街1号','','','852-3575 9299 ','','','2012-10-06 02:35:13.503160');
INSERT INTO "city_viewer_place" VALUES('74c8289e-0f5e-11e2-92cd-3c0754041eea','威记粥店','Wei Ji Zhou Dian',2,1,'114.154480','22.283614','外表简陋的粥店味道50年不变，是中环人从小吃到大的早餐店。除了碎牛肉粥和艇仔粥必点，香港最好的炸肠也在这里。','风光一时的士丹利街街角尽处，走过几铺铁皮大牌档，就会发觉一家装修简陋的街坊粥店，卖的是白粥、牛肉粥、猪红粥、及第粥、蒸萝卜糕、炒面、肉粽、虾米猪肠粉、炸两以及各式油器如油条、牛脷酥、咸煎饼等等，都是平凡朴实不过日常早点选择。威记大抵不是全城最出色的粥品店，但这类纯粹并完整以早餐粥品作内容的食肆其实已不多见。',3,'除周日及公众假期07:00-17:30外, 每天07:00到19:00开放','香港中环士丹利街82号','港铁中环站C出口，乘中环至半山自动扶梯即达','','852-2551 5564','','','2012-10-06 02:35:13.515427');
INSERT INTO "city_viewer_place" VALUES('74cb0df0-0f5e-11e2-bbc3-3c0754041eea','强记大排档','Qiang Ji Da Pai Dang',2,1,'114.162675','22.328336','变幻莫测的大排档，白天和晚上供应的菜式完全不一样。','强记大排档和其她的大排檔有少少不同，其她的大排檔很多时都是只做一种类的食物，例如食粉面的很少会做小菜，但强记就不同了，她们会上午和中午做港式早餐，食煎蛋和火腿这一些，但到了晚上就转做了广东小菜，真是有香港人多变和适应力强的性格。',4,'','香港深水埗基隆街194号','港铁深水埗站','','852-2776 2712','','','2012-10-06 02:35:13.534410');
INSERT INTO "city_viewer_place" VALUES('74cd41bd-0f5e-11e2-81f3-3c0754041eea','海港城','Habour City',12,1,'114.167958','22.297847','海港城究竟有多大？几乎雄霸了大半条广东道。仅凭这一点，它拥有全香港最大最全的化妆品卖场也不足为奇了。','海港城（英文：Harbour City）位于香港九龙尖沙咀，是香港面积最大的购物中心，也是西九龙区最大商场之一，是九龙仓集团旗下的物业。商场部分占地200万平方尺，包括约50间食肆、2间大型电影院、3间饭店以及约700间零售商店。',8,'周一至五10:00-21:00##周六/日/公众假期10:00-22:00','香港尖沙咀广东道15号','港铁尖沙咀站','','852-2118 8666','http://www.harbourcity.com.hk/landing.htm','','2012-10-06 02:35:13.548850');
INSERT INTO "city_viewer_place" VALUES('74cf4e8a-0f5e-11e2-bef9-3c0754041eea','铜锣湾','Tong Luo Wan',12,1,'114.180951','22.280678','知名餐厅和特色café数不胜数，个性小店俯首皆是，陈冠希的潮服店也开在这里。','铜锣湾（因为粤音比较顺口的关系，部分香港人会把铜锣湾读成铜锣“环”，使三字都变成阳平声）位于香港岛的中心北岸之西，是香港的主要商业及娱乐场所集中地。区内有多家大型百货公司及大型商场，包括：崇光百货、时代广场、利舞台广场以及世贸中心。铜锣湾购物区亦是全世界租金第二贵的地段，仅次于美国纽约的第五大道。',8,'全天','香港 湾仔以东，北角以西','港铁铜锣湾站','','','','','2012-10-06 02:35:13.562274');
INSERT INTO "city_viewer_place" VALUES('74d21214-0f5e-11e2-a437-3c0754041eea','尖沙咀','Jian Sha Ju',8,1,'114.171124','22.293822','这里是香港旅游的心脏，高端品牌的聚集地，血拼的必经之地，还能看到海景，是个国际范儿的购物天堂。','尖沙咀位于香港九龙半岛的最南端，自古就是华南海路的要冲，外国商船都是在尖沙咀的海面停泊。现在我们所看到的尖沙咀，大部分土地都是靠填海得来的。尖沙咀是香港非常著名的旅游区，区内的高级酒店、大型购物广场、名牌旗舰店、高级餐厅数不胜数，同时还保留有大量文化艺术与殖民时期的旧建筑，是香港旅行的热门地区。',8,'全天','香港九龙油尖旺区','港铁尖沙咀站','免费','','','','2012-10-06 02:35:13.580382');
INSERT INTO "city_viewer_place" VALUES('74d54338-0f5e-11e2-85f4-3c0754041eea','朗豪坊','Langham Place',4,1,'114.168549','22.318637','九龙市区的潮流地标，荟萃国际及本地潮流品牌、特色餐饮食肆和戏院等消费热点。','朗豪坊（英语：Langham Place）位于香港旺角砵兰街，于2004年落成，是该区的著名地标建筑。朗豪坊属于三合一大型发展项目，分别由购物商场——朗豪坊购物商场、酒店——朗豪酒店以及办公室大楼——朗豪坊办公大楼组成。朗豪坊的三个项目有互惠互补的特点，大型商场设有大量商店、食肆及娱乐设施，而高级写字楼和五星级酒店则分别为商场带来高消费力的上班族及旅客，形成一个稳定的消费链。',6,'周一至周日11:00-23:00','香港亚皆老街8號','港铁旺角站C出口。','','852-3520 2800','http://www.langhamplace.com.hk/tch/','','2012-10-06 02:35:13.601302');
INSERT INTO "city_viewer_place" VALUES('74d72aa6-0f5e-11e2-9fa3-3c0754041eea','太古广场','Pacific Place',12,1,'114.164649','22.277866','太古向来是香港名人明星的热门购物地点，狗仔队常年埋伏在周围。','太古广场位于香港中环东侧，这里是体验香港人吃喝玩乐生活消费模式的极佳去处。从金钟地铁站2楼到太古广场有步行通道相连。广场拥有3家五星级饭店、高级办公楼、住宅，以及200多家专卖店，云集了Prada Christian、Dior、Gucci、Louis Vuitton、D&G、Hugo、Lance等名牌。虽然这里的欧洲品牌没有置地广场和半岛酒店名店街那么多，但物品丰富，价格也比较合理，是许多香港人的购物首选。',8,'周一至周日10:00-24:00','香港金鐘道66號','港铁金钟站2楼可直达','','852-2844 8988','http://www.pacificplace.com.hk/sc/','','2012-10-06 02:35:13.613783');
INSERT INTO "city_viewer_place" VALUES('74dd64b5-0f5e-11e2-9dc6-3c0754041eea','香港DFS环球免税店（华懋广场店）','Xiang Gang DFS Huan Qiu Mian Shui Dian （Hua Mao Guang Chang Dain）',4,1,'114.179760','22.299475','购物狂最喜欢在这里扫一些“新品未定价”类的货品，关键是——免税哦！','DFS环球免税店是香港旅游观光局认可的高品质商家，同时也是香港特别行政区知识产权署发起的“正版正货”承诺的成员零售商。DFS只提供原厂正品，绝不出售仿造、盗版。到香港DFS环球免税店购物，优惠的价格比之内地，着实让人惊喜。皮具手表节省10-40%，美容化妆品甚至少花50%，这里有众多大牌为DFS独家呈现的限量精品，或旅游零售独家套装，还有杂志上“新品未定价”“内地未发售”的众多精品，让人满载而归才够尽兴！',8,'周一至周六9:00-22:00','尖沙咀麼地道72号日航酒店对面','','','852-2732 5229','dfsgalleria.com','','2012-10-06 02:35:13.654599');
INSERT INTO "city_viewer_place" VALUES('74dec0f3-0f5e-11e2-8c8f-3c0754041eea','香港DFS环球免税店(太阳广场店)','DFS Galleria Sun Plaza',4,1,'114.169439','22.296643','香港购物必扫地之一，在这里可享受购买世界名牌产品的免税优惠价格。','香港DFS Galleria太阳广场位于尖沙咀广东道与北京道交会处，有两个主要入口，若从九龙公园径手扶梯直接进入太阳广场二楼，迎面而来是精通不同国家语言的亲切柜台人员，二楼则是名店街，由名牌精品，优质皮具，时尚服饰，名表珠宝，潮流配饰，烟酒，旅游纪念品及糖果美食等商品专柜组成，包含世界的著名品牌，让国内游客满载而归。',8,'周一至周日10:00-23:00','尖沙咀广东道12号','港铁尖沙咀站E出口','','852-2302 6600','dfsgalleria.com‎','','2012-10-06 02:35:13.663504');
INSERT INTO "city_viewer_place" VALUES('74e079cf-0f5e-11e2-96e9-3c0754041eea','APM','APM',12,1,'114.225379','22.312364','香港首个开创夜行概念的商场，大部份店铺的营业时间直至凌晨，甚至通宵。','新鸿基地产于香港九龙开发的旗舰商场，APM将am日与pm夜结合，以年轻人为主要对象的立体生活杂志，延长营业时间或叫做“深夜零售”，不拘一格的消费文化生活，是香港唯一的夜间开放的商场。APM，香港的一个大型购物商场，为观塘创纪之城五期的商场部分，其范围除了在创纪之城五期外，亦包括港贸中心大堂的一层。发展商为新鸿基地产，早于2005年3月试业，并于2005年7月17日正式开幕。APM以年轻人为主要销售对象，总面积逾60万平方尺。',8,'周一至周日11:00-02:00##部分店家自定','香港观塘道418号','地铁观塘线观塘站','','852-2267 0500','http://www.apm-millenniumcity.com/chi/index.php','','2012-10-06 02:35:13.674794');
INSERT INTO "city_viewer_place" VALUES('74e256c5-0f5e-11e2-996a-3c0754041eea','东荟城','Dong Hui Cheng',4,1,'113.942741','22.290878','香港唯一的名店折扣商场，提供至少三至七折的折扣优惠，还有亚洲最大的户外互动型喷水池。','东荟城名店仓是香港一间大型的名店折扣商场，为您带来超过80个品牌，包括国际时装、运动服饰、美容、配饰、童装及家居用品，全年提供最少三至七折折扣优惠，给您如寻宝一般的购物乐趣。东荟城名店仓店购物满载而归之余，还可以同时享受水疗、电影娱乐及各国风味佳肴，以及全亚洲最大的户外互动型喷水池，购物娱乐，享受口福，一次性尽情释放。东荟城名店仓与香港国际机场约10分钟车程，到埗后或临上飞机离港前，记得来个寻宝之旅，一定会令您满载而归。',8,'周一至周日10:00-22:00','香港大屿山东涌达东路20号','港铁东涌线C出口','','852-2109 2933','http://www.citygateoutlets.com.hk/about/Pages/cgo_info.aspx?lang=SC','','2012-10-06 02:35:13.687002');
INSERT INTO "city_viewer_place" VALUES('74e48c47-0f5e-11e2-b855-3c0754041eea','国际金融中心商场','IFC Mall',4,1,'114.157989','22.284510','香港购物地标，苹果旗舰店等大牌云集的国际型shopping mall，加上有机场专线，很适合坐飞机前来购物的游客。','国际金融中心商场的建筑气派不凡，汇聚世界级名店近200家，云集多个国际殿堂级品牌，带来高格调的购物及消闲体验。坐落于中环海滨的国际金融中心综合发展项目，总面积达470万平方尺，外观设计新颖，气派不凡，是香港的标志性建筑之一。主体购物区国际金融中心商场，场内宽敞明亮，还有宽阔舒适的人行道，营造出国际化的购物环境，给消费者带来高品味、高格调的消费体验。国际金融中心商场内汇集国际殿堂级品牌展示店，散发着世界超级品牌的魅力，是名牌追求者的消费热点，也是各地旅客的观光胜地。',8,'周一至周日10:00-22:00','香港港景街1号','地铁/机场快线香港站A/E1/F出口。','','852-2295 3308','http://www.ifc.com.hk','','2012-10-06 02:35:13.701477');
INSERT INTO "city_viewer_place" VALUES('74e5f4fa-0f5e-11e2-9b0a-3c0754041eea','红点 Mega Box','Mega Box',12,1,'114.208492','22.319510','新兴的大型商场，除了购物，还可以玩室内滑冰和曲棍球。','位于九龙湾的Mega Box- 红点，是新近开幕的香港首家超大型”全贯通” 垂直式商场，共19层。拥有鲜艳红色外墙的MEGA BOX - 红点，是香港少见的大型商场，也是东九龙重新规划下的潮流热点，购物方面有全港唯一的百安居B&Q，澳大利亚来的Spotlight生活用品专门店，全新概念品牌的年青潮流服饰楼层；除了有全新的零售及娱乐热点外，更有IMAX 3D立体电影院。同时，全香港最大型的室内滑冰中心也建在这里。与一般大型商场内的滑冰中心不一样，MEGA BOX - 红点滑冰场，这里是全香港唯一标准的曲棍球比赛场，同时既是大众玩乐的最新消闲场所，也是曲棍球迷的朝圣乐园 。建成以后，众多世界级花样滑冰比赛和冰上运动赛都在此举办，为香港的体育迷创造了更好的运动条件。',8,'','香港九龙湾宏照道38号企业广场','','','852-2989 3000','http://www.megabox.com.hk/index.php?lang=schi','','2012-10-06 02:35:13.710706');
INSERT INTO "city_viewer_place" VALUES('74e751cf-0f5e-11e2-83fd-3c0754041eea','香港殖民地都爹利街石阶','Xiang Gang Zhi Min Di Du Die Li Jie Shi Jie',1,1,'114.156733','22.279660','石阶上那四盏香港仅存的煤气街灯，每晚6:准时亮起，浪漫无比。','都爹利街虽然只是一条位于高楼大厦中的小巷，但是在小巷的尽头却隐藏着两样有过百年历史的古迹──石阶及煤气街灯。连接都爹利街与雪厂街的石阶以花岗石筑成，约建于是1875至1889年期间。都爹利街石阶于1979年被列为法定古迹。石阶两端栏杆的石柱上安装了四座古老煤气路灯，是香港仅存的煤气路灯。由于这里的石阶与路灯甚具特色，所以成了拍摄电影与及硬照的热门地点。',8,'全天','中环都爹利街13号','','免费','','','','2012-10-06 02:35:13.719645');
INSERT INTO "city_viewer_place" VALUES('74e96b1c-0f5e-11e2-b813-3c0754041eea','永利街','Yong Li Jie',1,1,'114.149478','22.283425','想看看香港60年代风貌的请移步到此。','永利街（Wing Lee Street），是香港上环一条街道，位于上环南部必列者士街以南，楼梯街与城皇街之间，东西走向。该处以保留香港1960年代特色而著名，柏林影展得奖香港电影《岁月神偷》也是在此取景。',8,'全天','香港永利街','港铁上环站','免费','','','','2012-10-06 02:35:13.733396');
INSERT INTO "city_viewer_place" VALUES('74ebed9c-0f5e-11e2-8e27-3c0754041eea','黄大仙祠','Huang Da Xian Ci',1,1,'114.194086','22.342991','黄大仙“有求必应”，签文灵验，常年吸引无数善信到来膜拜求签。','黄大仙祠又名啬色园，建于1945，是香港九龙有名的胜迹之一，也是香港最著名的庙宇之一，在本港及海外享负盛名。据传说，黄大仙又名赤松仙子，以行医济世为怀而广为人知。相传祠内所供奉的黄大仙是“有求必应”的，他的签文十分灵验。此外，该祠是香港唯一一所可以举行道教婚礼的道教庙宇。',3,'周一至周日07:00-17:30','香港九龙黄大仙道','观塘线黄大仙站B2出口，步行约3分钟到达。','免费','852-2327 8141','','','2012-10-06 02:35:13.749860');
INSERT INTO "city_viewer_place" VALUES('74eeb361-0f5e-11e2-8a81-3c0754041eea','石板街','Shi Ban Jie',1,1,'114.156546','22.283698','保持着老风貌的石板台阶，熙攘的人群，略带闷湿的空气，港片中的景点取景胜地，不过斜坡路需要点脚力喔。','香港石板街，其实即砵甸乍街，位于中环荷里活道交界至干诺道中环段，是一条香港著名的怀旧老街，历史悠久的地面由一块块大石板砌成，故又得名石板街。石板街聚集了许多老旧的小店和摊子，充满怀旧气氛，所以吸引了电影人的注意，许多电影、电视和音乐录像带，如刘德华、郑秀文的《龙凤斗》、《无间道》等都特意到来取景，也有不少喜爱摄影的同好们喜爱前来拍照。',8,'全天','中环砵甸乍街','','免费','','','','2012-10-06 02:35:13.768009');
INSERT INTO "city_viewer_place" VALUES('74f038b8-0f5e-11e2-83b6-3c0754041eea','楼梯街','Lou Ti Jie',1,1,'114.150696','22.290367','TVB中高频出现的宽敞整洁的长楼梯，慢慢“爬”，是个颇有历史和灵气的地方。','楼梯街位于香港上环，顾名思义，是一条全条都是楼梯的街道。是上环一带最长的阶梯。以前富有人家一般乘坐轿子沿楼梯街拾级而上,所以以此命名,而现时住在这个狭窄的阶梯上的仍是有钱人家。楼梯街由皇后大道中起，沿山势而上，经过摩啰街、荷李活道、四方街及必列者士街，直至坚道。',8,'全天','香港岛湾仔区荷李活道','','免费','','','','2012-10-06 02:35:13.777986');
INSERT INTO "city_viewer_place" VALUES('74fa6502-0f5e-11e2-870c-3c0754041eea','林村许愿树','Lin Cun Xu Yuan Shu',1,1,'114.142700','22.456284','在许愿树下，诚心参拜，许下一个个愿望。','林村许愿树位于香港新界的大埔林村丽，大埔林村丽是香港著名的许愿胜地，坐落于村内建于清朝乾间。林村许愿树实际上是两棵大榕树。因为这两棵树被当地村民视为神灵，而且在人们在其根部燃点香烛祈褔许愿。后来，人们还制作了宝牒并写上了愿望，然后并系上重物，然后并诚心向林村许愿树许愿后便抛上树干，如果不掉下来就代表愿望可以成真。',3,'8:00-18:00','林村林村鄉公所路 香港','','20HKD','','','','2012-10-06 02:35:13.844650');
INSERT INTO "city_viewer_place" VALUES('75008661-0f5e-11e2-ad9c-3c0754041eea','镛记酒家','Yong Ji Jiu Jia',2,1,'114.155671','22.281462','又名“飞天烧鹅”，源于游客都喜欢吃后打包上飞机。','镛记酒家的镇店之宝是皮脆肉嫩的金牌烧鹅，还有那几近失传的经典粤菜如银"木面"煀鸽、礼云子琵琶虾、凤凰煎猪脑等等巧手功夫菜。而饭前必吃的前菜溏心皮蛋酸姜，还有那已成传奇佳话的烧鹅髀油“太子”捞面，都是几十年如一日的保持极高水准。1968年被美国《财富杂志》选为“全球15大食府”之一。同时也是《米其林指南》一星餐馆。',8,'周一至周日11:00-23:30','香港中环威灵顿街32-40号','港铁中环站D2出口，沿德己立街转入威灵顿街','人均约200HKD','852-2522 1624','','','2012-10-06 02:35:13.884839');
INSERT INTO "city_viewer_place" VALUES('750474e8-0f5e-11e2-8964-3c0754041eea','翠华餐厅','Cui Hua Can Ting',2,1,'114.183765','22.281631','最受游客欢迎的港式茶餐厅，虽有多家连锁店，每家排队的队伍还是很长','1967年于旺角甘霖街的一间小小的冰室开始，发展至现时连锁式经营的“翠华餐厅”。最早期的“翠华冰室”没卖什么花巧，卖的也是简单的地道咖啡，奶茶，西饼和面包，为附近卖鸡蛋的工人提供一处落脚地。随着香港的经济起飞，时代及口味需求的转变，食客希望能吃到西饼以外之食物，茶餐厅因而衍生而来，翠华亦跟上如此的演变。1977年，首间“翠华餐厅”建于新蒲岗，为历史最悠久的一间。推荐菜：鱼蛋河粉、冻奶茶、猪仔包。',8,'24小时营业','香港铜锣湾景隆街20-28号','港铁铜锣湾站','人均消费：50HKD','852-2573 4338','','','2012-10-06 02:35:13.910598');
INSERT INTO "city_viewer_place" VALUES('751861f5-0f5e-11e2-a48c-3c0754041eea','兰芳园','Lan Fang Yuan',2,1,'114.153697','22.282788','港式丝袜奶茶的创始地就在这里','兰芳园是香港一间历史悠久的茶餐厅，总店位于香港岛中环结志街2号及4A-6号，早年以大牌档形式经营，现时除设于大厦的旧店及新店两间店铺外，位于街边的档口仍然保留，是香港仅余的大牌档之一。',3,'周一至周日8:00-20:00','香港中环结志街2号','港铁中环站','人均消费：30HKD','852-2850 8683 ‎','','','2012-10-06 02:35:14.041261');
INSERT INTO "city_viewer_place" VALUES('751a6fbd-0f5e-11e2-b9a0-3c0754041eea','陆羽茶室','Lu Yu Cha Shi',2,1,'114.155513','22.282286','很多香港富豪一家几代每天都风雨不改的来这里，山竹牛肉球、蔗糖杞子糕、家乡蒸粉果几乎每台必点。','陆羽茶室已有六十多年历史, 却依旧保持着旧式香港茶楼的格调 , 室内装潢古色古香, 穿着传统唐装的老侍应生及充满怀旧气息的菜,让人深深感受到在这里 [饮茶], 彷佛回到香港5、60年化的茶楼。茶室共有三层楼, 一楼为散客接代区, 二, 三楼则为团体订位区 , 不想被打扰的客人也可以在此另辟房间谈事. 最特别的是可以品尝到其他餐厅觉得麻烦不做的点心, 像滑鸡球大包, 虾仁鲜荷饭 , 云腿鲮鱼角都是非常难得的小品, 绝对算是陆羽茶室的一绝。',8,'周一至周日07:00-22:00','香港中环士丹利街24号','港铁中环站D2出口，近石板街。','人均消费:150HKD','852-2523 5464','','','2012-10-06 02:35:14.054646');
INSERT INTO "city_viewer_place" VALUES('751e0540-0f5e-11e2-9697-3c0754041eea','莲香楼','Lian Xiang Lou',2,1,'114.153445','22.284314','香港所剩无几的旧式茶楼，坚持用茶盅泡茶，百年老店的莲蓉包可千万不要错过哦！','香港的莲香楼在中区威灵顿街与鸭巴甸街交界，朝6晚11，经营中式茶楼午市晚饭，不另加一，著名菜式有浆烧骨、霸皇鸭、煎酿鲮鱼。 它也以莲香老饼家为卖点。该建筑物名为曾昭灏大厦，旧式唐楼高七层，无升降机，莲香楼只占近威灵顿街的两层，楼下东面是贷仓及厨房，西面是卖年糕唐饼的店面，中间有宽大木楼梯上二楼茶室。茶室之内，茶客自行找座位，无知客、大厅四面装有中国古文诗句、山水字画，不设贵宾房、欢迎搭台，有手推点心车，星期天特别热闹。',8,'周一至周日06:00-23:00','香港中环威灵顿街160号','港铁上环站E2出口，威林顿街、鸭巴甸街交界。','人均消费：50HKD','852-2544 4556','','','2012-10-06 02:35:14.078135');
INSERT INTO "city_viewer_place" VALUES('7520f780-0f5e-11e2-8ec1-3c0754041eea','何洪记粥面专家','He Hong Ji Zhou Mian Zhuan Jia',2,1,'114.183070','22.278198','香港特首曾荫权、美食专家蔡澜等名人热捧的云吞面老店，日卖800碗！','创于1946年的何洪记，即使生意再好，也拒绝开分店，第二代传人何冠明先生解释，是要好好控制食品的品质，确保每位顾客都能享受品牌最好的出品。何洪记的干炒牛河以古法猪油炒成，每条河粉都均匀地沾满自家出品的秘制酱油，配合新鲜嫩滑的牛肉片，口感特别香滑。餐厅面积不大，不想等位的话，最好选择下午3点至6点光顾。干炒牛河港币52元。',2,'星期一至日11:30-23:30','香港铜锣湾波斯富街99号','港铁铜锣湾站A出口。','人均消费：50HKD','852-2577 6558','','','2012-10-06 02:35:14.097441');
INSERT INTO "city_viewer_place" VALUES('7523d2ab-0f5e-11e2-8c5e-3c0754041eea','金华烧腊','Jin Hua Shao La',2,1,'114.155191','22.284284','店门口挂满了油光锃亮的烧鹅，半肥半瘦的叉烧让人垂涎欲滴，欲罢不能。','金华的出炉叉烧，特别是那必吃的经典半肥瘦叉烧，能够做到入口松化嫩滑肉汁满渗，瘦的部位爽脆有嚼劲，肥的部位软润甘香，皆因为选料用上新鲜脢头肉，用上生抽、磨豉、麻酱、海鲜酱、干葱、蒜头、糖盐、天津玫瑰露等等酱料腌上三小时，然后明火挂炉并不停转身的烧至九成熟，最关键的是拿出来稍稍放凉，涂上大量麦芽糖再回炉烧五分钟，并在最后阶段把炉火调大，让叉烧表面部份部位抢火至焦香，这便是金华的叉烧与众不同的原因。当然除了半肥瘦叉烧配上热腾腾白饭，这里的老火汤、烧鸭粥、油鸡切鸡都不能不试。出身广州烧腊世家的老板苏庆先生和接班的儿子以及一众师傅员工的辛勤努力更是金华能够成功跨越四十多年的最大原因。',6,'周一至周日11:00-22:00','香港中环租庇利街9-11号','','人均消费：50HKD','852-2545 1472','','','2012-10-06 02:35:14.116158');
INSERT INTO "city_viewer_place" VALUES('752591ab-0f5e-11e2-b906-3c0754041eea','金凤茶餐厅','Jin Feng Cha Cang Ting',2,1,'114.172599','22.275592','美食家蔡澜夸他家的奶茶“一香、二浓、三滑”，茶、奶比例刚刚好，口感如丝绸漫舞。独霸一方的还有鸡尾包。','早在1956年于湾仔太原街开业的金凤，后来搬到了春园街。小小一家店堂只得三百来尺，却是长年累月挤满了捧场客。大家坐下来喝着那热腾腾的奶茶，或者那冲好后放入雪柜冰了一个晚上的冻奶茶。引颈以待等的是那新鲜出炉的蛋挞和鸡批。蛋挞的酥皮搓入猪油，蛋液只加少量奶水不加鲜奶，蛋香突出，鸡批馅用的鸡和火腿调味后炒过再雪藏半天让其入味，批皮以牛油，面粉和蛋黄液搓成，加入蛋盐牛奶调匀，焗来格外酥脆，出炉时香飘一室，从小小饼房捧出还未走到房门口的饼柜，已经被场内的嘴馋食客截停数次，一扫而光。',3,'周一至周日6:45-19:00','香港湾仔春园街41号','港铁湾仔站A3出口左转','人均消费20HKD','852-2572 0526','','','2012-10-06 02:35:14.127599');
INSERT INTO "city_viewer_place" VALUES('7528a366-0f5e-11e2-be6e-3c0754041eea','九记牛腩','Jiu Ji Niu Nan',2,1,'114.152538','22.284225','全港最知名的牛腩面店，没有之一，凭清汤牛腩及咖喱牛腩而声名远播，受到蔡澜、梁朝伟、陈奕迅等多位港台名人的极力推荐。','这家餐厅几十年不变只供应一种食品，就是和牛腩有关的面，每天从中午开始营业，卖完了就收工。他们的牛腩据说有什么特别的秘方，很受欢迎，基本上午饭过后就全部卖完，不过现在已经是第二代在经营，营业时间也变了，从中午一直到晚上11点，不过晚上7点半却休息一个小时。',6,'星期一至六 12:30-22:30##星期日及公众假期休息','香港中环歌赋街19号','港铁上环站E2出口，沿永吉街、鸭巴甸街直上斜路便是。','','852-2815 0123','','','2012-10-06 02:35:14.147711');
INSERT INTO "city_viewer_place" VALUES('752b2a70-0f5e-11e2-9c48-3c0754041eea','泰昌饼家','Tai Chang Bing Jia',2,1,'114.172022','22.276389','因末代港督彭定康钟情它的蛋挞而闻名海外，沙翁和菠萝包也值得一试。','泰昌饼家，是香港一家传统饼店，于1954年开业，现时东主是欧阳天闰。泰昌饼家最驰名的食品包括蛋挞、沙翁与菠萝包等，全部以传统方法人手制造，与现时香港普遍饼店采用机制方式生产相比，除了更有特色，也多了一点点人情味。',2,'周一至周五11:30-20:00##周六、周日13:00-18:00','香港中环摆花街35号地下','港铁中环站C出口，乘中环至半山自动扶梯即达','人均消费20HKD','852-2544 3475','www.hk-aluminium.com','','2012-10-06 02:35:14.164301');
INSERT INTO "city_viewer_place" VALUES('7532d1cf-0f5e-11e2-ad3f-3c0754041eea','蛇王芬饭店','She Wang Fen Fan Dian',2,1,'114.154282','22.282797','传统古法烹调的五蛇羹日卖达600盅，最驰名的润肠鸡饭一定要连吃两碗才过瘾。','中环芸芸的著名食肆老铺当中，就是蛇王芬最令人有回家的温暖舒服的感觉。作为街坊老主顾，会耳闻目睹蛇王芬的新一代掌门人吴煋姿小姐如何从父母手中接过这六十多年老字号的统领大任。既保留着一贯优良传统，又能够在竞争激烈的饮食界中勇猛突围，而慕名而来的新客人，亦马上会被这小小店堂的亲密体贴的氛围打动：是那些四季更替一样窝心的明火炖汤，是那一碗材料丰足鲜美浓稠的蛇羹，是那吃得满口酒香油香的鲜鸭润肠和切肉腊肠配上一大碗白饭，还有那鲜滑惹味的得奖名菜子姜面酱鱼云煲。当然还会看到还未退下火线的吴妈妈，钜细无遗打点，温厚真诚待客，叫人再一次清楚明白一家独立老铺能够屹立至今，依然深受爱戴的真正原因。',8,'周一至周日11:00-22:30','香港中环阁麟街30-34号','港铁中环站D2出口，近中环至半山自动扶梯侧。','人均消费100HKD','852-2543 1032','','','2012-10-06 02:35:14.214434');
INSERT INTO "city_viewer_place" VALUES('75358338-0f5e-11e2-b308-3c0754041eea','檀岛咖啡饼店','Tan Dao Ka Fei Bing Dian',2,1,'114.174050','22.277491','老牌茶餐厅，蛋挞不得不尝，看老伙计一只手拎起6只茶杯的功夫，也是一种享受。','檀岛咖啡饼店是一间屹立五十年的老牌咖啡店，香滑的蛋挞是令大家不离不弃的真正原因。',8,'周一至周六06:00-00:00','湾仔轩尼诗道180-186号','港铁湾仔站','人均消费：30HKD','852-2575 1823','','','2012-10-06 02:35:14.232087');
INSERT INTO "city_viewer_place" VALUES('7537951c-0f5e-11e2-8039-3c0754041eea','永合成茶餐厅','Yong He Cheng Cha Can Ting',2,1,'114.150302','22.285845','独门秘技炉焗煲仔饭只此一家，黄秋生、汪明荃、薛家燕是这里的常客。','午饭时间永远人山人海的永合成，煲仔饭是一绝。“在用面包炉代替炭烧改良出来的煲仔饭干爽饭香四溢, 招牌窝蛋牛肉饭的牛肉用人手剁极有口感,”，美食家们从来不会吝啬对永合成的赞美之词。',3,'6:00-17:00(周六至15:30)##周日及公众假期休息','香港上环苏杭街115号','港铁上环站','','852-2850 5723 ‎','','','2012-10-06 02:35:14.245653');
INSERT INTO "city_viewer_place" VALUES('75399433-0f5e-11e2-a28a-3c0754041eea','庙街夜市','Miao Jie Ye Shi',4,1,'114.170112','22.306994','庙街的夜晚，是TVB电视剧里经常出现的场景，卖牛丸的老伯，吃宵夜的小妹，热闹又慵懒的气氛，浓浓香港市井气，都在这里了，亲切又真实。','庙街位于九龙的油麻地，是香港最有名的露天市场，分南北两段，因中段有一庙宇故名庙街。庙街是香港龙蛇混杂之地，亦是香港早期烟花之地，故游庙街时可留意很多售卖翻版、冒牌及色情事物的摊档。香港很多电影曾多次以庙街为题材及在此取景拍成电影。庙街区共有四座庙宇，全都集中在众坊街附近。庙街的夜市为香港别有特色之处，每天下午四时后街侧开始摆满摊档，五光十色，人潮不断，充满了各式各样的地摊货。从傍晚6点到深夜12点是最热闹的。',4,'全天','香港庙街','港铁油麻地站C出口','','','','','2012-10-06 02:35:14.258737');
INSERT INTO "city_viewer_place" VALUES('753c19de-0f5e-11e2-9f0d-3c0754041eea','鸭寮街','Ya Liao Jie',4,1,'114.163364','22.329144','最著名的是二手的音响摊档，《无间道》里刘德华和梁朝伟见面的音像店就在这条街上。','鸭寮街，人称“电器街”，位于钦州街至南昌街之间，因早年盖满鸭寮而得此名，以售卖手机、平价电子零件、二手及水货电器闻名，吸引不少本地人光顾。为刺激本地旅游业，政府月前已决定短期内将这条街翻新，吸引游客前往消费，将鸭寮街发展为香港著名旅游景点之一。',8,'全天','香港深水埗鸭寮街','港铁深水埗站','','','','','2012-10-06 02:35:14.275291');
INSERT INTO "city_viewer_place" VALUES('753eee99-0f5e-11e2-817a-3c0754041eea','西洋菜街','Xi Yang Cai Jie',4,1,'114.169954','22.319515','楼上书店让这条街除了电器，还有了书香气。','80年代起，亚毕老街以南的一段西洋菜街，陆续开设了不少电器店。到了现在，这条街道已成了旺角区主要的电子产品销售地点，遍布百老汇摄影器材、丰泽电器、泰林电器、国美电器等连锁店。此外，地面铺位亦有不少化妆品店、电话服务公司、街边小吃店，而楼上书店更是这条街道的特色。自2003年起，该段西洋菜南街被划为时限行人专用区，减免人车争路情况，亦令西洋菜南街成为旺角一个重要的旅游点。',8,'全天','香港旺角西洋菜街','港铁旺角站。','','','','','2012-10-06 02:35:14.293822');
INSERT INTO "city_viewer_place" VALUES('7540fe19-0f5e-11e2-9c0a-3c0754041eea','花园街','Hua Yuan Jie',4,1,'114.170802','22.321053','只要花心思淘，你会发现这里隐秘了很多在商场里买不到的限量版运动鞋。','花园街是香港油尖旺区的一条著名道路，位于九龙旺角东部，北至界限街，南至登打士街，与通菜街及洗衣街等街道平行。现时这条街道是香港著名的购物区之一。位于亚皆老街以南的一段花园街，也就是“波鞋街”，整条街约150米长，有50多间售卖运动鞋和运动用品的店铺。以北一段则有大量售卖成衣、蔬菜和水果的摊档。沿路著名地点是波鞋街和花园街市政大厦。',8,'全天','香港旺角花园街','','','','','','2012-10-06 02:35:14.307386');
INSERT INTO "city_viewer_place" VALUES('75430097-0f5e-11e2-b2d6-3c0754041eea','荷里活道','He Li Huo Dao',8,1,'114.149789','22.284460','街名与好莱坞没有半点关系，但丝毫不影响在这里的外国特色酒吧里偶遇明星的几率。','荷李活道(Hollywood Road)，有时亦称作荷里活道，位于香港中环至上环，是香港开埠后兴建的第一条街道。“荷李活道”的名字与美国电影业的好莱坞无关，却来自早年荷李活道一带的冬青树(Hollywood)。今日的荷李活道，深具香港中西文化合璧的特色。由于早年统治香港的英国人聚居荷李活道一带的半山区，中环荷李活道南边一段的苏豪区英文名字“Soho”除了取源于英国伦敦苏豪区外，起初也是来自“荷李活道的南边”的英文缩写“South of Hollywood Road”的。今天的苏豪区充斥着不少充满外国特色的餐厅和酒吧。荷李活道东端连接着兰桂坊，而旧中区警署(前香港警察总部)亦位于此街上，而在旧中区警署侧中央广场的Dragon-i酒吧，曾吸引多位足球明星访港时到此消遣。连接中环与半山区的中环至半山自动扶梯系统，亦途经荷李活道。在上环一端荷李活道附近的嚤啰街，则是著名的古董和怀旧物品集中地。亦是著名庙宇文武庙的所在地。',4,'全天','荷里活道','','','','','','2012-10-06 02:35:14.320496');
INSERT INTO "city_viewer_place" VALUES('754530dc-0f5e-11e2-aaad-3c0754041eea','兰桂坊','Lan Gui Fang',10,1,'114.155701','22.280827','灯红酒绿的兰桂坊夜夜笙歌，纸醉金迷，别怕去的时间太晚，夜生活才刚刚开始呢。','兰桂坊（Lan Kwai Fong），狭义而言指位于香港中环区的一条呈L型的上坡小径，名叫“兰桂坊”（取其兰桂腾芳之意）。广义而言是指与德己立街、威灵顿街、云咸街、和安里、仁寿里及荣华里构成的一个聚集大小酒吧与餐馆的中高档消费区，深受中产阶级、外籍人士及游客的欢迎，是香港的特色旅游景点之一。',4,'全天','香港中环兰桂坊','港岛线或荃湾线的中环站，D1出口。','','','','','2012-10-06 02:35:14.334835');
INSERT INTO "city_viewer_place" VALUES('7546a14a-0f5e-11e2-bc3f-3c0754041eea','Felix餐厅','Felix Can Ting',2,1,'114.171826','22.295157','被民间评为“全亚洲景色最好的男厕”就在这里。','Felix餐厅位于半岛酒店28楼，是尖沙咀首屈一指的海景餐厅，也是一直以来受人追捧的亚洲最佳餐厅。设计师是鬼才PHILIPPE STARCK，这个喜欢在椅子上搞怪的设计师吸引眼球的第一手自然是餐厅的椅子。每个圆形的餐椅上都有一张脸，每张脸跟这个餐厅都有不寻常的故事。而那个传说中的无敌海景洗手间更是令每一个到餐厅的人惊奇不已。洗手间两边都是巨大的弧形玻璃，男士可以对着九龙的高楼大厦方便，女士则可以对着维多利亚港梳妆。洗手间的分隔居然是一块底部透明的磨砂玻璃，可以看到进入洗手间的一双脚消失在一片朦胧之中。',4,'周一至周日18:00-02:00','尖沙咀梳士巴利道19号半岛酒店28楼','港铁尖沙咀站F出口。','人均消费:400HKD','852-2315 3188','http://www.peninsula.com','','2012-10-06 02:35:14.344265');
INSERT INTO "city_viewer_place" VALUES('754924e3-0f5e-11e2-b0b5-3c0754041eea','天一酒家','Tian Yi Jiu Jia',3,1,'114.149687','22.271276','如果白天天气晴好，夜晚月明星稀，那一定要去山顶的天一酒家，令人惊叹的维港夜色全景足以让你忘记今夜吃的究竟是什么。','天一酒家位于凌霄阁二、三楼，除了具有居高临下、俯视维港的好视野外，菜色方面则以新派粤菜为主打，这里的创意新菜也获得不少食客的称赞。招牌菜：南非十二头乾鲍鱼、高汤金山勾大生翅、黑椒带子安格斯牛柳粒、渔珠映月。',6,'周一至周六11:00-23:30##周日及公众假日09:00-23:00','香港山顶道101号凌霄阁山顶道101号','港岛中环站J2出口，步行约15分钟前往花园道缆车站换乘山顶缆车。','人均消费：400HKD','852-2907 3888','','','2012-10-06 02:35:14.360745');
INSERT INTO "city_viewer_place" VALUES('754fbd5e-0f5e-11e2-ba58-3c0754041eea','凌霄阁','Ling Xiao Ge',1,1,'114.150028','22.271249','在东方之珠的最高点一睹其全景，不论白天的高楼丛林还是黑夜的闪烁灯海都是很极致的视觉享宴。','凌霄阁（The Peak Tower）是香港的一座特色建筑，位于香港岛扯旗山与歌赋山之间的炉峰峡上，亦是山顶缆车的终点站，地址为山顶道128号。它座落于海拔396米高之处而非山顶最高处，设计突出却不破坏山景线。凌霄阁最高处达海拔428米，能俯览维多利亚港两岸景致，是香港主要旅游景点之一。',4,'周一至周日10:00-23:00','香港 山顶道128号','港岛中环站J2出口，步行约15分钟前往花园道缆车站换乘山顶缆车。','成人票价：20HKD##小童(3-11岁)票价：10HKD##长者(65岁或以上)票价：10HKD','852 2849 7654','','','2012-10-06 02:35:14.404010');
INSERT INTO "city_viewer_place" VALUES('755330e1-0f5e-11e2-8c2f-3c0754041eea','半山自动扶梯','Ban Shan Zi Dong Fu Ti',1,1,'114.162849','22.280963','这个全球最大的自动扶梯恰好经过许多景点，包括有百年历史的旧中区警署、酒吧与餐厅林立的苏豪区和夜店成排的兰桂坊。','半山自动扶梯是用于从香港中环到半山区行人的通道系统。自动扶梯长达800米，由行人道、天桥、20条可以转换上下方向的单向自动扶手电梯和3条自动人行道所组成。半山自动扶梯通道系统是以连接中区行人天桥系统的恒生银行的总行大厦为起点的，路经中环街市、毕利街、荷李活道等。',8,'6:00-10:00下行，10:20-00:00上行','香港岛中西区干诺道','地铁地铁中环站公交3号小巴','免费','','','','2012-10-06 02:35:14.426594');
INSERT INTO "city_viewer_place" VALUES('755593dc-0f5e-11e2-8aed-3c0754041eea','昂坪360缆车','Ang Ping 360 Lan Che',1,1,'113.901390','22.256258','乘坐“飞”一般缆车，在大屿山展开360°海陆空之旅!','昂坪360是一条缆车路线，是世界上规模最大的吊车系统。有别于一般的缆车，昂坪360的设计分成三段，需要拐弯两次。缆车定线由坐落于东涌的吊车站开始，首先跨过东涌湾到达赤腊角的转向站，然后转向60度向北大屿山郊野公园内的弥勒山山坡攀升，再于弥勒山山腰的转向站再转向，最后抵达位于昂坪的缆车站。乘客可在吊车内360度观赏大屿山风景。',3,'周一至周日10:00-18:00','香港大屿山宝昂路','地铁东涌线','成人: 145HKD##小童: 75HKD##学生及长者: 108HKD','852-2109 9898','www.np360.com.hk','','2012-10-06 02:35:14.442256');
INSERT INTO "city_viewer_place" VALUES('755e08fa-0f5e-11e2-a8c9-3c0754041eea','跑马地赛马场','Pao Ma Di Sai Ma Chang',8,1,'114.180667','22.274426','随着马匹的竞跑而呐喊呼叫，令人兴奋莫名，尤其是夜间赛马，嘶叫声欢呼声划破长空，无比刺激。','跑马地赛马场位于香港湾仔及铜锣湾的之间，夜色璀璨，景色迷人，是全球少数的市区马场，可容纳超过五万五千位观众，是观赏夜赛的必然选择。香港第一个赛马场就是在此兴建。跑马地的赛马场地，由一片沼泽地填平而来。第一场赛马早在1846年举行，以后每年都继续举办，一直到今日，而夜间赛马则是1973年才开始。',6,'除周一及新年休馆外, 全年开放。##日间赛事10:00-17:00##夜场赛事19:15至23:00','香港跑馬地黃泥涌道','港铁铜锣湾站A出口，沿黄泥甬道步行约20分钟即可到达。','免费','','','','2012-10-06 02:35:14.497654');
INSERT INTO "city_viewer_place" VALUES('756cc582-0f5e-11e2-8d39-3c0754041eea','香港太空馆','Xiang Gang Tai Kong Guan',1,1,'114.171869','22.294422','看震撼的天象厅电影、玩有趣的手动项目、试试模拟飞翔，寓教于乐的好地方。','香港太空馆是亚洲著名的天文馆之一，位于香港九龙半岛尖沙咀。1977年动工兴建，1980年建成，占地约8000平方米。该馆分为东西两侧，东侧外形似一颗巨大的蛋，内设天象厅和展览厅；西侧为太阳科学。天象厅天幕直径23米，设座位316个，是世界上最大的天象厅之一。星象投映仪能将天空中包括太阳在内的8000多颗恒星、月亮及金木水火土五大行星投射到天幕上。该厅还配备非常新颖的全天域放映机，为亚洲最先使用。厅内的六声道音响系统，有几十组扬声器，效果极佳。',3,'星期一、三、四、五13:00-21:00##星期六、日及公众假期10:00-21:00##逢周二（公众假期除外）、农历新年年初一及初二休馆##圣诞前夕及农历新年除夕提前于下午5时休馆','香港九龙尖沙咀梳士巴利道10号','港铁尖沙咀站F出口','成人: 10HKD##学生及老人: 5HKD##逢周三: 0HKD','852-2721 0226','','','2012-10-06 02:35:14.594289');
INSERT INTO "city_viewer_place" VALUES('75705794-0f5e-11e2-8b52-3c0754041eea','香港体育馆(红馆)','Xiang Gang Ti Yu Guan (Hong Guan )',8,1,'114.181896','22.301269','在这里48港币就能买到握手位的票，这种价钱在大陆只买得到山顶票，连人是男是女都看不清啊！后排位更是白菜价，并且天天都有演唱会看哦！','香港体育馆（亦称红磡体育馆，简称红馆）是香港的综合室内多用途表演场馆，位于九龙油尖旺区红磡畅运道9号、港铁红磡站平台上，1983年4月27日开幕，现时由康乐及文化事务署管理。香港体育馆外形上阔下窄像一颗钻石或倒转的金字塔，全馆设有空气调节，内里设有12,500个座位，场内并无任何支柱。香港体育馆虽以“体育馆”命名，实际上只有很少体育活动在这里举行，却经常有不少歌星举行演唱会，因其座位之多在香港称得上数一数二，更是少数可以开设四面台的场地，故香港大部分歌手都以在体育馆举行个人演唱会为荣。许冠杰是首位在香港体育馆开演唱会的歌手，而无线电视自制的大型综艺节目《香港小姐竞选》活动也曾在此处举行。',4,'10:00-18:30','香港九龙油尖旺区红磡畅运道9号','','','','','','2012-10-06 02:35:14.617704');
INSERT INTO "city_viewer_place" VALUES('75721e9e-0f5e-11e2-9882-3c0754041eea','大屿山','Da Yu Shan',1,1,'113.940582','22.270670','大屿山可以玩的地方很多，看天坛大佛、吃斋菜、大澳渔村吃海鲜、迪士尼玩到high…如果不是跟团，那乘坐缆车是首选，全透明那种相当刺激。','大屿山总面积达146.75平方公里，是香港最大的岛屿，位处香港西南面，在珠江三角洲口。在大屿山中部的山谷，有昂坪市集、宝莲禅寺、天坛大佛等著名景点。在大屿山西北面有一个宁静的小渔港，拥有传统渔民居住的水上棚屋，素有“东方威尼斯”之称。至今仍保存着古朴的渔村风貌。',3,'全天','香港大屿山','中环6号码头（港铁香港站E1出口），搭乘往梅窝的新渡轮，再于码头转乘1号巴士前往。##港铁东涌线东涌站B出口，于东涌市中心转乘11号巴士。','平日成人295HKD、小孩（3至11岁）210HKD、老人（65岁或以上）170HKD##周末与节假日成人350HKD、小孩（3至11岁）250HKD、老人（65岁或以上）200HKD','','','','2012-10-06 02:35:14.629285');
INSERT INTO "city_viewer_place" VALUES('7578300f-0f5e-11e2-b25a-3c0754041eea','南丫岛','Nan Ya Dao',1,1,'114.145720','22.208971','岛上一间卖豆花的小店开了几十年，店主每日坐在店里，连姿势也不曾换过，可想而知满岛的安逸味道，本地人十分贪恋这份怀旧感。','南丫岛是香港境内的第三大岛屿，面积仅次于大屿山和香港岛。南丫岛也叫做博寮洲，行政上属于香港十八区之中的离岛区。由于靠近市区，南丫岛便成了周末悠闲的胜地。从烦嚣的香港岛市区出发，只需半小时船程，便可到达。岛上中西文化交融，洋溢着浓厚的艺术气息。清新的空气，优美的海岸风光，美味的海鲜美食，吸引了不少游人到此郊游远足，为这小岛增添了迷人的缤纷色彩。',3,'全天','香港南丫岛','中环4号码头（港铁香港站E1出口），乘搭港九小轮前往。','成人: 60HKD##儿童及长者: 50HKD','','港九小轮渡班车查询www.hkkf.com.hk','','2012-10-06 02:35:14.669058');
INSERT INTO "city_viewer_place" VALUES('75874563-0f5e-11e2-aa2f-3c0754041eea','长洲','Chang Zhou',1,1,'114.018299','22.200088','看海晒太阳，远离烦嚣适合生活的小村落，像是香港外的另一个世界。','长洲位于香港岛之西南海域，面积约3平方公里，人口（连渔民流动人口）虽只有3至4万人，却为本港各离岛之冠。岛民大部份世代而居，故相处融洽、民风简朴、互助友爱。长洲是个无烟小岛，由于形状比较大，中部较窄较长，而且形状有点像哑铃，所以长洲被称之为哑铃岛。顺着这样的优势，聪明的渔民们将港湾发展成为了渔港、码头等，甚至成为了海外的东湾泳滩。',3,'全天','香港长洲','从香港中环5号码头坐快船去长洲岛，船程约30分钟至1小时。','免费','852-2508 1234','','','2012-10-06 02:35:14.767949');
INSERT INTO "city_viewer_place" VALUES('75944e9c-0f5e-11e2-be3d-3c0754041eea','赤柱','Chi Zhu',5,1,'114.216614','22.216887','复古建筑、欧式街道、典雅餐厅，发呆散步吹海风，面对大海的小资情调。','赤柱是港岛南端的一个景色秀丽小镇，位于浅水湾的东方，石澳的西方，是香港著名的旅游景点。赤柱最大的特色莫过于那种充满古色古香和中西文化融洽的风格，那里有阳光海滩、独特的建筑和购物饮食中心，是一个观光消闲的好去处。赤柱不单吸引游客来到此购物，而且本地人也经常到这里。赤柱商铺有大量的丝质衣服、运动衣及牛仔裤，更有很多加大码的衣服，适合外国人穿着。那里还有很多酒吧和餐厅，坐在海滩一边喝酒一边看风景，是十分惬意的。',8,'全天','香港赤柱','在港铁中环站, 坐大巴6/6a/6x/66/260','免费','','','','2012-10-06 02:35:14.853356');
INSERT INTO "city_viewer_place" VALUES('68f41b4c-0f9b-11e2-a6f8-3c0754041eea','巴黎圣母院大教堂','Cathedrale Notre-Dame de Paris',1,2,'2.349433','48.853174','高耸的塔楼、精致的玫瑰玻璃窗、繁复的石雕，听钟声想起仿佛还能看见那个丑陋而善良的敲钟怪人卡西莫多正在敲钟。','巴黎圣母院大教堂是巴黎最大最出色的天主教堂，是哥特式建筑的最佳典范，它位于塞纳河中部小岛西堤岛的东侧南岸，开口面对西方。而在圣母院门口外的圣母院广场中，有个原点（Point Zéro）纪念物，是法国丈量全国各地里程时所使用的起测点。圣母院大教堂始建于十二世纪六十年代年，很快就成为法国宗教活动中心。巍峨耸立的教堂里摆放着法国最大的管风琴和圣路易国王捐赠的彩色玻璃窗。1944年，教堂里的钟声响起，法国人民在这里向世界宣布巴黎已经脱离了德国的殖民统治，获得解放。##Tips：如果体力足够，可以爬上387个阶梯，登上南塔瞭望西堤岛及周边全景。夕阳下的巴黎圣母院也是极美的。',3,'圣母院周一~周五 8:00~18:45（周六~周日延长至19:15），登塔4~5月和9月 10:00~18:30、6~8月 周六~周日10:00~23:00，10月~次年3月10:00~17:30。登塔1月1日、5月1日、12月25日休息。','6 Place du Parvis Notre-Dame, 75004 Paris, 法国','地铁4号线Cite站下，步行5分钟可达','圣母院免费；钟楼登塔全票7.5EUR，半票4.8EUR，10月~次年3月每个月第一个周日和18岁以下免费。适用博物馆卡。','0142345610','http://www.notredamedeparis.fr','','2012-10-06 09:51:32.971297');
INSERT INTO "city_viewer_place" VALUES('68f64fde-0f9b-11e2-a5ea-3c0754041eea','埃菲尔铁塔','Eiffel Tower',1,2,'2.294437','48.858391','看落日辉映晚霞，看城市灯光渐次点亮，埃菲尔铁塔，似乎更适合夜晚。','埃菲尔铁塔是于1889年由居里塔夫•埃菲尔设计修建的，居里塔夫•埃菲尔被法国人爱称为“铁娘子”，它不仅是城市之光的象征，也是法国的象征。埃菲尔铁塔高1063英尺，虽然它早已失去了世界第一高的称号，早在1930年克兰斯勒大厦就抢走了它的名号，但它仍然值得一看。虽然排队的队伍总是很长，但那里的景色是值得等待的。或者，抢占一张盖布朗利博物馆外面的桌子，从远处观赏铁塔也是不错的选择。',8,'坐电梯1月1日~6月14日9:30~23:45（23:00前最后入场，前往顶层22:30前最后入场）、6月15日~9月1日9:00~00:45（00:00前最后入场，前往顶层23:00前最后入场）,9月2日~12月31日9:30~23:45（23:00前最后入场，前往顶层22:30前最后入场）；爬楼梯1月1日~6月14日9:30~18:30（18:00前最后入场）、6月15日~9月1日9:00~00:45（00:00前最后入场）,9月2日~12月31日9:30~18:30（18:00前最后入场）。','Avenue Gustave Eiffel, 75007 Paris, 法国','地铁6号线Bir-Hakeim站下，或地铁6号线、9号线Trocadero站下，或地铁8号线Ecde Militaire站下，步行5-10分钟可达；或RER C线Champs de Mars Tour Eiffel站下，步行2分钟可达。','坐电梯2层全票：4.8EUR；半票：2.5EUR；3层全票：7.8EUR；半票：4.3EUR；顶层全票：12EUR；半票：6.7EUR；爬楼梯2和3层全票：4EUR；半票：3.1EUR。3岁以下免费。','0144112323','http://www.tour-eiffel.fr','','2012-10-06 09:51:32.985755');
INSERT INTO "city_viewer_place" VALUES('68f91982-0f9b-11e2-8556-3c0754041eea','凯旋门','Arc de Triomphe',1,2,'2.295029','48.873834','如果在巴黎还能有什么建筑堪比埃菲尔铁塔，那就是这座宏伟的凯旋门了，在法国人民心中，如果没有它就没有巴黎。','凯旋门是法国纪念战争史、重大时事以及举行庆典的场所。陈列在馆内的死者名单可能会深深地触动你。在卢浮宫经香榭丽舍大街通往拉德芳斯区新凯旋门的延长线上，建有一座巨大的纪念碑式的建筑物，它将具有历史意义的广场与新凯旋门连接了起来，通过这座纪念碑式建筑的最上层，可以享受巴黎令人惊叹的美景。它是一个让人真正印象深刻的里程碑，高164英尺，宽147英尺，在法国人民心中，如果没有它就没有巴黎。##Tips：每年的10月12日拿破仑生日这天，太阳会从凯旋门正中坠下。上面的雕刻是不能错过的欣赏重点。',8,'凯旋门24小时开放，顶楼观景台4月1日—9月30日10:00-23:00（22:30前最后入场），10月1日—次年3月31日10:00-22:30（22:00前最后入场），1月1日、5月1日、5月8日早上、7月14日早上、11月11日早上、12月25日不开放。','Place Charles-de-Gaulle-Étoile, Paris 75008 France','地铁1、2、6号线或RER A线于Charles de Gaulle oile站下','凯旋门免费；顶楼观景台全篇: 9EUR，半票：5EUR，10月—次年3月第一个周日和18岁以下免费。适用于博物馆卡。','0155377377','http://www.arcdetriompheparis.com','','2012-10-06 09:57:55.441369');
INSERT INTO "city_viewer_place" VALUES('68fa85d7-0f9b-11e2-b042-3c0754041eea','香榭丽舍大街','Avenue des Champs-Élysees',5,2,'2.297135','48.873090','香榭丽舍就像是法国向世界展示它成就的橱窗，LV、Dior、Chane……还有那时不时擦肩而过的国际巨星。','绵延两公里（1英里）的林荫道，香榭丽舍大街已经成为官方庆祝活动和游行的中心。对于喜欢在夜晚漫步在广阔且景色如画的街道上的人们，无论是游客还是群众，这里都充满了吸引力。道路两旁商贾云集，您既可在其中消遣娱乐，又可采买购物，当你在附近享有盛名的精品店、银行或者大使馆逛累的时候，就可以在电影院、咖啡、饭馆等一边歇脚一边欣赏人间第一美丽大街的万种风情。这条别致的林荫街道最初由路易十四的园丁安德烈勒诺特为了提高从杜乐丽花园观赏的美感修建于1667年，18世纪末，这条著名的大街被延长至1800米，东起协和广场，西至戴高乐广场，是巴黎大街中心的女王。',8,'10:00—19:00，各店不一','Avenue des Champs-Élysees 75008 Paris, 法国','地铁1、2、6号线，或RER A线Charles de Gaulle-Étoile站下','','','','','2012-10-06 09:51:33.013338');
INSERT INTO "city_viewer_place" VALUES('68fcb999-0f9b-11e2-86b3-3c0754041eea','卢浮宫','Musee du Louvre',1,2,'2.337652','48.860591','卢浮宫是艺术爱好者的朝圣之地，有人说，每天花3小时到卢浮宫看展览就可以待上一年了，如果您不走文艺路线，那也别错过卢浮宫三宝。','对博物馆爱好者来说，卢浮宫就是艺术的航母。卢浮宫始建于12世纪，最初是用作防御的城堡，14世纪被改建为皇家宫殿。其最新添加的设计是美建筑师贝聿铭于1981年设计修建的玻璃金字塔，玻璃塔刚建成时，颇受争议，它将古典式的宫殿进行了现代化，使光线可以透过玻璃射到地下大厅。卢浮宫收藏了大量的艺术作品，许多终生难得一见的作品都在这里展览，确切的说，卢浮宫包括黎塞留、苏利、德农三个庭院，收藏了35000多件展品。在人口攒动的人群中苦苦寻觅，只为了瞥一眼隐藏在他们身后的蒙娜丽莎以及她那现实生活中较少见到的微笑。##Tips：每月第一个周日免费。最佳入口是 Palais Royal - Musée du Louvre 地铁站的地下通道。',3,'周三——次周周一9:00-18:00，周三和周五延长至22：00，周二以及1月1日、5月1日、11月11日、12月25日休息。','place du Louvre 1er','地铁1、7号线Palais Royal - Musée du Louvre站下','门票全价9EUR，半票6EUR（不含拿破仑馆Hall Napoleon特展），拿破仑馆特展9.5EUR，两者联票全票13EUR，半票11EUR；每月第一个周日以及18岁以下免费（不含拿破仑馆特展）。适用博物馆卡。','0140205317','http://www.louvre.fr','','2012-10-06 09:51:33.027799');
INSERT INTO "city_viewer_place" VALUES('68feadf0-0f9b-11e2-84dc-3c0754041eea','圣心大教堂','Basilique du Sacre-Coeur (Le)',1,2,'2.343011','48.886783','如果说从埃菲尔铁塔上看到的巴黎是辉煌的，那么从圣心大教堂看到的巴黎则是平实的。','这座具有罗马诺-拜占庭式建筑风格的教堂位于巴黎蒙马特高地的最高点上，从这里可以俯瞰整个如画般的蒙马特区，是巴黎最美丽的地区之一。教堂顶部为一座独特的大穹顶，是俯瞰整个城市的最佳位置。教堂内部，基督的马赛克拼图画和隐窝非常独特有趣。圣心大教堂始建于1875年，受天主教委托，在保尔•阿巴蒂的严密监视下于1914年落成使用。',7,'教堂6:00~23:00（22:15前最后入场）、圆顶9:00~17:30（夏季延长至19:00）','35 Rue du Chevalier de la Barre, 75018 Paris, 法国','地铁2号线Anvers站下','','0153418900','http://www.sacre-coeur-montmartre.com','','2012-10-06 09:51:33.040585');
INSERT INTO "city_viewer_place" VALUES('6900ad4f-0f9b-11e2-aa41-3c0754041eea','凡尔赛宫','Château de Versailles',1,2,'2.120348','48.804869','说到极致奢华，放眼全法国，如果凡尔赛宫排第二，那第一就得空缺了。','凡尔赛宫所有的城堡都建于17世纪，宏伟的宫殿是法国王室的象征。这所宫殿最伟大的居住者法国国王路易十四，是在1682年搬入凡尔赛宫的。瞥一眼凡尔赛宫举世无双的镜厅，然后是众所周知的在法国大革命期间，在1789年，路易十六和玛丽皇后最后被送上法国历史上最残酷的发明，断头台。另一方面，许多著名的条约都在凡尔赛宫签订，其中包括结束美国独立战争的巴黎条约以及第一次世界大战结束签订的凡尔赛条约。除此之外，完美风格的花园也值得一逛。',3,'皇家礼拜堂、国王正殿和寝宫、王后的寝宫，旺季9:00~18:30（17:00前最后入场），淡季9:00~17:30，私人套间需要参加导览行程才能参观。','Place d''Armes, 78000 Versailles, 法国','地铁(2.65EUR) 可以搭乘RER C线，在Versailles Rive Gauche站下（C5方向的终点站）##火车(21.15EUR) 在圣拉扎尔火车站、蒙巴那斯火车站乘坐开往凡尔赛宫的火车即可到达','全票: 13.5~15EUR；半票10~11EUR；18岁以下免费。一日通行证（可参观宫殿、翠安农宫、马车博物馆和小树林导览）16~25EUR。','0130837889','http://www.chateauversailles.fr','','2012-10-06 09:51:33.053710');
INSERT INTO "city_viewer_place" VALUES('69070073-0f9b-11e2-b90b-3c0754041eea','协和广场','Place de la Concorde',1,2,'2.32114','48.865795','一个上演真实历史剧目的大舞台，过去，人们来这里观看大革命的恐怖屠杀，现在，人们来这里感受历史发展，体味都市变迁。','协和广场，最初被命名为“路易十五广场”，是1755年至1775年根据著名建筑师卡布里埃尔的设计而建造的。1792年法国大革命时期改名为“革命广场”，曾在这里修建了断头台，将包括路易十六在内的2800人送上了这里。1830年，路易∙菲利普将其更名为协和广场。广场中心矗立着一座埃及方尖碑，这是1840年埃及总督罕默德∙阿里赠送给法国国王查尔斯十世的礼物。广场的四面八方分别矗立着八个代表19世纪法国最大的八个城市的雕像，同时，又增设了两个场景宏大的喷泉。协和广场也是巴黎最著名的饭店之一克里翁大饭店的所在地。',8,'24小时','Place de la Concorde, 75008 Paris, 法国','地铁1号线、8号线、12号线Concorde站下','免费','','','','2012-10-06 09:51:33.095132');
INSERT INTO "city_viewer_place" VALUES('69091666-0f9b-11e2-8d2a-3c0754041eea','奥赛博物馆','Musee d''Orsay',1,2,'2.326661','48.859887','连接古代艺术殿堂卢浮宫和现代艺术殿堂蓬皮杜中心的完美过渡，莫奈、塞尚、梵高、雷诺阿，罗丹，能够叫得出名字的艺术大师们的作品都能在这里见到。','奥赛博物馆和卢浮宫、蓬皮杜中心被称为巴黎三大艺术博物馆，主要收藏1848年到1914年间的作品，1848年前的在卢浮宫，1914年后的蓬皮杜中心。每年有近250万游客会来这个世界上收藏印象派艺术画作最多的地方进行参观。这里原来被称为奥赛火车站，是1990年为了迎接世界博览会而修建的。第二次世界大战期间，主要用来欢迎释放的囚犯。当这个火车站慢慢被废弃，邻近的酒店也于1973年关闭了，它就面临着被拆除的危险。然而，法国政府决定将该建筑改建成19世纪下半叶艺术作品的收藏地。1986年在弗朗索瓦•密特朗总理的管理下建成开馆。一层的主画廊长138米（453英尺），高32米（105英尺），暗示着这座建筑物的历史。这个画廊中陈列了许多作品，有备受争议的古斯塔夫•库尔贝的作品《奥南的葬礼》，珍-弗朗索瓦•米勒的《拾穗》等。如果你是一位印象派作品的痴迷者，那就应该直接去五楼，那里有这个流派最杰出的大师的巨幅作品，挂在画廊29至48。根据出现的顺序，包括德加的《舞蹈课》，马奈的静物画，例如《芦笋》，雷诺阿的《煎饼磨坊的舞会》，克劳德•莫奈的《圣拉扎尔火车站》、《卢昂大教堂》、《睡莲》，梵高的作品在35号画廊，而塞尚的在36号画廊。37号和38号画廊是最小的画廊，主要挂着德加的蜡笔画。画廊43、44则专门陈列保罗高更在创作于塔希提版画作品。装饰艺术主要在楼下几层，非常值得一看的是新艺术派的收藏作品，让人永生难忘。在同一层千万不要错过罗丹阳台，那里陈放着罗丹的雕塑作品《行走的人》，是值得花时间欣赏的。经过长时间的参观，我们需要一个短暂的休息，以帮助吸收这种惊人的收藏，然后继续参观。三层的一个高地咖啡馆或者六层的餐馆都是不错的选择。',3,'周二~周三和周五~周日9:30~18:00（17:00前最后入场），周四9:30~21:45（21:00前最后入场），周一、1月1日、5月1日、12月25日休息。','62 rue de Lille, Paris 75007 France','搭RER C线Musée d''Orsay站下','门票全票：8EUR，半票：5.5EUR，和罗丹博物馆联票（需同天参观）12EUR，每月第一个周日和18岁以下游人免费。适用博物馆卡。','0140494814','http://www.musee-orsay.fr','','2012-10-06 09:51:33.108800');
INSERT INTO "city_viewer_place" VALUES('690bb447-0f9b-11e2-9f41-3c0754041eea','蓬皮杜中心','Centre Pompidou',1,2,'2.352608','48.860648','说起蓬皮杜中心，不得不提的就是它的外观了，远看像模型玩具，近看像水管工场，够花上几个小时去研究了。','蓬皮杜中心，也被美称为“波堡”，这个与众不同的建筑是1968年法国总统乔治∙蓬皮杜授权修建的，于1977年建成开放。大多数巴黎人最初都被它颠覆传统的“高技派”建筑风格所震撼，空调、自动扶梯、电梯都被建在建筑的外面，内部则是空前的自由。20世纪90年代后期，经过大规模的整修以后，在其中心新建了国立现代艺术美术馆和公共图书馆、临时展览馆、电影院以及其它设施。不同的游览景点参观的时间和门票的价格是不同的。',3,'除周二、5月1日闭馆外, 每天11:00到21:00开放（20:00前最后入场）。','place Georges Pompidou,Paris,France','地铁11号线Rambuteau站下','博物馆门票全票10~12EUR，半票8~9EUR，每月第一个周日和18岁以下免费。适用博物馆卡。','0144781233','http://www.centrepompidou.fr/','','2012-10-06 09:51:33.125948');
INSERT INTO "city_viewer_place" VALUES('690d5aee-0f9b-11e2-bba3-3c0754041eea','塞纳河','Seine',1,2,'2.304509','48.863649','塞纳河就像巴黎地图上的一条斜向上的抛物线，将整个巴黎一分为二，北边的巴黎叫右岸，南边的巴黎叫左岸。','塞纳河位于巴黎的中轴线上，是巴黎版图上不可或缺的一部分。塞纳河右岸是巴黎的北部地区，而左岸则是南部地区，岸的西端则是圣日耳曼地区。河上共有36道桥，其中最负盛名的是亚历山大三世桥。塞纳河周边有许多著名的建筑，将其连成一线，包括大宫、荣军院等。想要一睹塞纳河美丽的风采，最惬意最独特的游览方式便是乘坐泊靠在阿尔玛桥附近的小船，一边划船，一边细细的欣赏美丽的风景。##塞纳河游船资讯：##苍蝇船 http://www.bateaux-mouches.fr/zh ##巴黎人游船 http://www.bateauxparisiens.com/',8,'','La Seine, Paris, France','','游船门票一般为 11EUR左右','','','','2012-10-06 09:51:33.136766');
INSERT INTO "city_viewer_place" VALUES('691047d9-0f9b-11e2-a149-3c0754041eea','蒙马特高地','Montmartre',1,2,'2.338638','48.884466','蒙马特，一个拥有山城景致，艺术广场，圣洁教堂，闪烁霓虹，粉红橱窗，探夜流莺和柔软爱情的地方。','蒙马特对于巴黎就像曼哈顿对于纽约一样，受欢迎程度仅次于埃菲尔铁塔。到这个浪漫之都如果没有爬上这座奇异的小山丘，那么你的旅程是不完整的。位于其至高点的是圣心大教堂，它的高贵和壮观连那些无神论者都为之钦佩。攀爬的过程可能有一点辛苦，但是当一个充满战争与浪漫气息的城市的全景展现在你面前时，你会觉得这是对于您刚才攀爬艰辛的奖赏。在沿路上你会看到变戏法的、吞火的、模仿表演的和一些著名的手风琴演奏者，这些人就是巴黎的代名词。在以前蒙马特是一些艺术家像莫奈、梵高等人的家乡，尽管它们很贫穷但他们都在这里却创作了他们最著名的作品。即使现在你也能发现一些艺术家沿着鹅卵石路带着他们的帆布和画刷，随着时间的变迁，描绘着五彩缤纷的世界。',8,'','21 Place Tertre, 75018 Paris, 法国','地铁2号线Anvers站，12号线Abbesses站，或地铁2号线、12号线Pigalle站','','','http://www.montmartre-paris-france.com/','','2012-10-06 09:51:33.155942');
INSERT INTO "city_viewer_place" VALUES('6911e8e1-0f9b-11e2-b70d-3c0754041eea','拉雪兹神父公墓','Cimetière du Père-Lachaise',1,2,'2.394247','48.861318','如果你厌倦了蒙娜丽莎面前的人潮，香榭丽舍大街的喧嚣，那就去拉雪兹神父公墓，安静的缅怀先人，看看王尔德墓前疯狂读者的香吻。','拉雪兹神父公墓是巴黎最著名的公墓，它的名字来源于路易十四的虔悔神父，也是这个拉雪兹原来的所有者。1840年。巴黎市买下了这里，并将其建为公墓。这里埋葬着很多名人，有马塞尔∙布鲁斯特，奥斯卡∙王尔德，巴尔扎克，歌唱家伊迪丝∙琵雅夫以及摇滚诗人吉姆∙莫里森（他的坟墓是参观人最多的），在19世纪修建的墓碑中，有一座被称为巴黎公社社员墙，是为了纪念1871年5月28日巴黎公社运动中被枪杀的147名公社战士而建的。提示，如果有心寻找名人墓碑，一定要提前下载打印地图，现场找是不可能找到的。',3,'','Rue du Repos 16, Paris 75020 France','地铁2号线、3号线Pere Lachaise站','','0155258210','http://www.pere-lachaise.com','','2012-10-06 09:51:33.166611');
INSERT INTO "city_viewer_place" VALUES('691368dc-0f9b-11e2-83ad-3c0754041eea','莎士比亚书店','Shakespeare and Company',1,2,'2.347109','48.852590','黄色的招牌，深绿色的店面，杂乱却魅力十足，在莎士比亚书店不要冷漠地对待陌生人，因为他们有可能是天使所乔装的。','“莎士比亚书店(Shakspeare & Company)”诞生于一战之后, 主要以出售英文书籍为主, 当时在巴黎的海明威, 费兹杰拉德, 斯坦因等“迷惘的一代”都是书店主人西尔维亚·碧奇(Sylvia Beach)的座上客. 这个书店二战之中由于受到纳粹的骚扰而关闭. 1951年, 一个叫乔治·惠特曼的美国人在巴黎圣母院对面的BUCHERIE街37号开了一家卖英文书籍的书店. 像西尔维亚一样, 他把书店的二层辟为图书馆, 书堆间还有床铺, 成了文人聚会, 甚至临时栖居地. 惠特曼与美国东海岸作家来往密切, 在50年代, 书店成了垮派作家在巴黎的聚点, 金斯堡和威廉.巴勒斯都在书店前的空地上朗诵过他们的作品. 后来旧金山“城市之光City light bookstore”书店的店主当时也经常泡在Shakespeare & Co.. 60年代, 惠特曼在得到碧奇小姐的同意下, 正式把书店更名为莎士比亚书店.',8,'每天10：00—23:00','37 Rue de la Bucherie, 75005 Paris, 法国','地铁2号线Maubert—Mutualité站，或RER C线Saint-Michel-Notre-Dame站','','','http://www.shakespeareandcompany.com/','','2012-10-06 09:51:33.176445');
INSERT INTO "city_viewer_place" VALUES('6914b847-0f9b-11e2-a195-3c0754041eea','枫丹白露','Fontainebleau',1,2,'2.703225','48.401243','枫丹白露的魅力不在于极致的奢华，而在于年深日久的历史所沉淀下来的皇室风情，据说拿破仑也对枫丹白露念念不忘。','枫丹白露是法国最大的王宫之一，最美的是弗朗索瓦一世的画廊。室内有众多的寓意画、水果装饰品、花环彩带和丰富的石膏花饰、雕塑品，是带意大利风格的法国文艺复兴艺术的典范。这座16世纪的宫殿，直到19世纪它的修缮扩建都未停止过，各个时期的建筑风格都在这里留下了痕迹，众多著名的建筑家和艺术家参与了这座法国历代帝王行宫的建设。',3,'大殿建筑、欧仁妮皇后客厅和中国馆10月~次年5月9:30~17:00（16:15前最后入场）、6~9月9:30~18:00（17:15前最后入场）；小殿建筑和拿破仑一世纪念馆10:15~15:00，必须跟随导游才能入内参观；广场和花园11月11月~次年2月9:00~17:00、3~4月和10月9:00~18:00、5~9月9:00~19:00（英式花园提早1小时开门），周二、1月1日、5月1日、12月25日休息。','Fontainebleau, France','从巴黎的里昂火车站（Gare due Lyon）搭火车到Fontainebleau-Avon站下，约40分钟可达','门票大殿建筑、欧仁妮皇后客厅和中国馆全票6.5EUR，半票4.5EUR，18岁以下免费；小殿建筑和拿破仑一世纪念馆全票3EUR，半票2EUR，18岁以下免费，语音导览4.6EUR（含英、法、日语），广场与花园免费。适用博物馆卡。','0160715060','','','2012-10-06 09:51:33.185023');
INSERT INTO "city_viewer_place" VALUES('69197c2b-0f9b-11e2-9a08-3c0754041eea','亚历山大三世桥','Pont Alexandre-III',1,2,'2.313509','48.863852','塞纳河上最壮观的一座桥，也被称为世界上最美的大桥，第一次看到或许您还会有点熟悉感，因为据说天津的北安桥就是仿造了这座桥。','在巴黎有一座被称为世界上最美的大桥，这就是亚历山大三世桥。大桥于1900年巴黎博览会前建成，全长107米，是一座单拱铁桥。为了不影响两岸的视野，桥身建造得特别低矮。它是由俄国沙皇尼古拉二世作为法俄亲善的礼物送给法国的，并以尼古拉二世的父亲亚历山大三世名字命名。大桥将两岸的香榭丽舍大道与荣军院广场连接起来。桥的两端各有一对立柱，柱上的青铜骑士雕像造型生动。桥身装饰以水生动植物和花环为主，小爱神路灯精致可爱。',8,'','Pont Alexandre-III, Paris 75008 France','地铁8号线、13号线
Invalides站，或RER C线Invalides站','','','','','2012-10-06 09:51:33.216310');
INSERT INTO "city_viewer_place" VALUES('691adb8a-0f9b-11e2-bcbc-3c0754041eea','杜乐丽花园','Jardin des Tuileries',1,2,'2.327471','48.863501','杜乐丽花园就像是卢浮宫博物馆的前庭院，优雅古典，无论是坐在池塘边，或是在露天咖啡座喝杯咖啡，都能感受到悠闲的巴黎。','杜乐丽花园坐落在巴黎的正中心，位于罗浮宫和协和广场之间。1564年，皇后卡特琳∙德∙麦迪奇下旨修建的，同一时间修建的还有杜乐丽宫殿（后来被破坏）。1664年，著名建筑师安德烈∙勒诺特对其重新设计修建，包括道路的布局，对称的花圃以及可以观赏塞纳河美丽风景的阳台。一直以来，这里都是休闲散步放松的最佳地点（这里甚至有骑驴活动）。21世纪以来，每年的6月到8月25日，杜乐丽花园都会举办一些公平有趣的活动，你可以通过旋转的摩天轮观赏里沃利街美丽迷人的景色。这个花园也是橘园和国立美术馆所在地。',8,'10月—次年3月7:30-19:30,4-6月和9月7:30-21:00,7-8月周一—周五7:30-23:45、周六—周日7:30-24:45','rue de Rivoli, Paris 75001 France','地铁1号线、8号线、12号线Concorde站下，或地铁1号线Tuileries站下','免费','0140209043','','','2012-10-06 09:51:33.225249');
INSERT INTO "city_viewer_place" VALUES('691c613a-0f9b-11e2-aaad-3c0754041eea','拉丁区','Quartier Latin (Latin Quarter)',5,2,'2.349262','48.844959','巴黎的拉丁区就像是一个漩涡，有精美的历史，也有纠结的文艺或情感往事，有趣的是，历史中的种种，在今天的现实中也依旧可见。','拉丁区的名字来源于早期居住在那里说拉丁语的学生，中世纪早期就有人居住在那里。在那里你经常可以看见艺术家，知识分子，还有一些过着波希米亚式生活的人。这个地区拥有各式各样的巴黎风味建筑，像克鲁尼美术馆，阿拉伯世界博物馆，国家自然历史博物馆以及植物园。在拉丁区的中心，作为其标志，矗立着世界著名的索邦大学。索邦大学旁边是充满活力的历史性建筑和高级商店。晚上，还可以在这里享受烟雾弥漫的酒吧和爵士乐俱乐部。',8,'','Le Quartier Latin,75005 Paris，France','','','','','','2012-10-06 09:51:33.235223');
INSERT INTO "city_viewer_place" VALUES('691dfb42-0f9b-11e2-99b8-3c0754041eea','红磨坊','Moulin Rouge',8,2,'2.332298','48.884117','绚丽的灯光，曼妙的歌声，那一片扭动，那一片摇摆，是香艳还是低俗，仁者见仁智者见智，看客请自解。','红磨坊的历史可以追溯到19世纪下半叶。那时候，来自世界各地的流浪艺术家，在蒙马特高地作画卖艺，使那一带充满艺术气氛，成为巴黎最别致、最多姿多彩的城区之一。而今红磨坊已成为一家大型的歌舞表演厅，是巴黎的一个旅游景点。',4,'21:00、23:00各一场，另有晚餐+表演秀19:00','82 Boulevard de Clichy, 75018 Paris, 法国','地铁2号线Blanche站下','表演21:00价格99EUR，23:00价格89EUR，晚餐+表演秀145EUR起。','0153098282','','','2012-10-06 09:51:33.245722');
INSERT INTO "city_viewer_place" VALUES('69203328-0f9b-11e2-96b9-3c0754041eea','罗丹博物馆','Musee Rodin',1,2,'2.315873','48.855348','花草树丛中散落着罗丹的大型铜雕作品，独特而优雅，如果累了还可以在长椅上像《思想者》一样思考。','这里曾经是奥古斯特•罗丹度过余生的地方，罗丹从1908年起就住在这里，一直到1917年去世，从那时起，他的杰出雕刻和珍贵的私人艺术收藏品就被收藏在了这里。有很大一部分雕刻留在了花园里，其中就包括他最有名的一件作品《思想者》 。花园里，有郁郁葱葱的树木为人遮荫，树下还摆放了供人乘坐纳凉的长椅，再加上四周宁静的环境，使这里成为最佳冥想和放松的地方。博物馆的Villa des Brillants别墅，是罗丹于1985年买下的，坐落在穆东。如果你想来罗丹博物馆参观，请提前打电话或者查看网站信息，以确定博物馆的开馆时间。',3,'4~9月博物馆9:30~17:45（17:15前最后入场）、庭院9:30~18:45，10月~次年3月博物馆9:30~16:45（16:15前最后入场）、庭院9:30~17:00。','79 Rue de Varenne, Paris 75007 France','地铁13号线Varenne站下','门票博物馆全票6EUR、半票4~5EUR，卡米耶展全票7EUR、半票4~5EUR，两者联票（含参观庭院）全票10EUR、半票7EUR，只参观庭院1EUR，每月第一个周日和18岁以下游人免费；语音导览（含英、法、日）4EUR。适用博物馆卡。','0144186110','http://www.musee-rodin.fr/','','2012-10-06 09:51:33.260330');
INSERT INTO "city_viewer_place" VALUES('6921b797-0f9b-11e2-a1ac-3c0754041eea','巴黎歌剧院','Opéra de Garnier',9,2,'2.331789','48.872044','巴黎歌剧院本身就是一款经典之作，华丽的大厅和楼梯，让人不禁遥想起过去的奢华年代。如果能在这里看一场表演会让人终生难忘的。','巴黎歌剧院，也就是加尼叶歌剧院，是以设计它的建筑师沙尔勒∙加尼叶的姓氏命名的，后因作家加斯顿∙勒鲁写下的《歌剧魅影》而闻名于世。这所建筑将巴洛克式的、古典的、希腊的以及拿破仑三世时期的建筑风格完美的结合在一起，规模宏大，精美细致，金碧辉煌。进入歌剧院，美丽的马赛克图像庄严肃穆，大厅里有一个圆屋顶，是画家马克∙夏卡尔设计装饰的，非常精美，旁边还有一个让人永生难忘的洛可可式楼梯，可以直接通往剧院华丽的会客室。剧院外面，修建了四座宏伟的石头雕像，分别代表了音乐、抒情诗、抒情剧、舞蹈等寓意。不过，自从巴士底歌剧院开放后，巴黎歌剧院主要集中在舞蹈剧的表演。',7,'10:00-17:00（16:30前最后入场），1月1日、5月1日休息。','1 Place de l''Opéra, Paris, France','地铁3号线、7号线、8号线Opéra站下','参观门票全票: 8EUR; 半票: 4EUR；表演票价请查询官网','0172293535','http://www.opera-de-paris.fr','','2012-10-06 09:51:33.270218');
INSERT INTO "city_viewer_place" VALUES('6923590f-0f9b-11e2-afc7-3c0754041eea','花神咖啡馆','Café de flore',3,2,'2.332778','48.85398','萨特与波伏瓦经常联袂出现的咖啡馆，也深受其他文艺界人士的喜爱，更因为毕加索的青睐而名声大振。','花神”咖啡馆，是巴黎著名三大咖啡馆之一，1865年开始营业，它以接待文化艺术界人士而闻名于世，至今已有一百多年的历史。毕加索、萨特、布雷东还有政治人物托洛斯基都在那里喝过咖啡。花神咖啡馆，现在是属于巴黎文化遗址保护单位。',7,'每天早上7:30-凌晨1:30开放','172 Boulevard Saint-Germain, 75006 Paris, 法国','地铁4号线Saint-Germain-des-Prés站下','','0145485526','http://www.cafedeflore.fr/','','2012-10-06 09:51:33.280896');
INSERT INTO "city_viewer_place" VALUES('69254354-0f9b-11e2-9caa-3c0754041eea','双叟咖啡馆','Les Deux Magots',3,2,'2.333044','48.854026','海明威、萨特、毕加索……都曾把这里当做根据地，在露台的柳条椅上，在深绿色遮阳篷下，来一杯咖啡吧。','双叟咖啡馆，又译“双偶咖啡馆”是法国巴黎的一个著名咖啡馆, 位于左岸的圣日耳曼德佩区。它曾经拥有巴黎文学和知识精英聚集地的声誉。这声誉来自于来此光顾的超现实主义艺术家，西蒙·波娃和萨特等知识分子，和欧内斯特·海明威等年轻作家。加缪和毕加索也是这里的常客。',7,'每天早上7:00-凌晨1:00开放','6 Place St Germain des Prés, 75006 Paris, 法国','地铁4号线Saint-Germain-des-Prés站下','','0145485525','http://www.lesdeuxmagots.fr/','','2012-10-06 09:51:33.293447');
INSERT INTO "city_viewer_place" VALUES('6927c50a-0f9b-11e2-8044-3c0754041eea','橘园美术馆','Musee de l''Orangerie',1,2,'2.3222','48.863947','纯白的墙面，柔和的光线透过天窗洒落进来，那些粉红色、浅紫色、东青色的睡莲似乎都漂浮在画布之上。','去美丽的杜乐丽花园旅行吧，橘园美术馆就位于这里。这个博物馆藏有许多著名的极好的艺术家的作品，像塞尚，马蒂斯，毕加索和亨利卢梭等大家的作品都有收集。在本馆中的所有的作品都交给Jean Walter 和 Paul Guillaume保管。这两个艺术狂热分子确保所有的作品一起展现，以便公众能欣赏到它们的所有光辉。在地下室里有一个奇观，在这个椭圆形的房子里，一些莫奈的水百合画永久展出。另一个等待着你的奇观是，国立画廊的香格里拉，这是一个橘园双子塔。',3,'美术馆9:00-18:00（17:45前最后入场）、书店9:00-17:30，周二、12月25日休息。','Jardin Tuileries, 75001 Paris, 法国','地铁1号线、8号线、12号线Concorde站下','门票全价7.5EUR，半票5.5EUR，特展附加2EUR，每月第一个周日和18岁以下免费，语音导览（含中、英、法、日）5EUR。适用博物馆卡。','0144778007','http://www.musee-orangerie.fr','','2012-10-06 09:51:33.309882');
INSERT INTO "city_viewer_place" VALUES('69296075-0f9b-11e2-9233-3c0754041eea','卢森堡公园','Jardin du Luxembourg',1,2,'2.337274','48.846947','据说许多巴黎人童年时都在这里的八角形池塘里用长棍子划过小木船，而现在他们的孩子又在这里做这些。','卢森堡公园和卢森堡宫殿所处的位置是原来罗马军队扎营的地方。1257年，夏特尔猫修道组织买下这里并在此修建了一座修道院，直到1615年，女摄政王玛利亚∙冯∙梅迪奇在此修建了卢森堡宫殿。卢森堡公园是巴黎人民最喜欢的公园之一，尤其是它巧妙精美恰如其分的布局。这里也是最受巴黎拉丁区学生和居民欢迎的地方，孩子们可以在这里尽情的玩耍，骑矮矮的小马驹，荡秋千，在八角形的池塘了开玩具船。当然这里也是深受人们青睐的集会约会的地方。卢森堡公园每天早晨7点半开始将对外开放。',8,'公园24小时开放，博物馆周一、五、六10:30-22：00，周二~周四10:30-19:00，周日9:00-19:00','19 Rue de Vaugirard, Paris, France','地铁12号线Rennes站下，或RER B线Luxembourg站下','公园免费，博物馆全票11EUR，半票6~9EUR；10岁以下免费','0142342595','','','2012-10-06 09:51:33.320511');
INSERT INTO "city_viewer_place" VALUES('692adc7d-0f9b-11e2-8fce-3c0754041eea','巴黎爱墙','The love Wall Of Paris',1,2,'2.338725','48.884764','“就使有一天霹雳震翻了宇宙，也震不翻你我‘爱墙’内的自由！”不知徐志摩在写这首诗时会不会想到，几十年后的巴黎真的有“爱墙”。','巴黎爱墙坐落于巴黎市北蒙马特高地半山腰上的一个小公园里。蒙马特高地是巴黎文人聚居的地方，这里有著名的圣心圣殿、红磨坊。爱墙面积约为40平方米，由511块深蓝色的长方形石砖组成，墙上写满了“我爱你”，据说包括311种字体和280种语言。墙壁左侧可以找到三个竖排的中文“爱”字。在墙的上方有一幅画，画中是一位身穿深蓝色吊带裙的女孩，斜倚在一张小桌旁，画旁边有一行小字：“保持理智，勿要强求（soyons raisonnable, exigeons l''impossible）”。',8,'全天','Square Jean Rictus 75018 Paris, France','地铁12号线Abbesses站','免费','','','','2012-10-06 09:51:33.330131');
INSERT INTO "city_viewer_place" VALUES('692c68f0-0f9b-11e2-857d-3c0754041eea','艺术桥','Pont des Arts',1,2,'2.337746','48.858793','这座黑色铁桥可以说是巴黎黑白明信片上最常出现的风景，除了古色古香的木椅和桥灯，还有那大大小小的爱情锁。','在横跨塞纳河的36座桥中艺术桥无疑是最有浪漫特色的，它的全金属桥身将卢浮宫和法国学院连接在一起。这个建于18世纪的令人兴奋的小天桥曾经一度是一座步行桥。起初，在桥的每一端都建有一个收费站，确保只有上层阶级可以在桥上行走。',8,'全天','Place de l''Institut, 75006 Paris, 法国','地铁7号线Pont Neuf站下','免费','','','','2012-10-06 09:51:33.340287');
INSERT INTO "city_viewer_place" VALUES('692dd8e6-0f9b-11e2-b6ac-3c0754041eea','圣礼拜堂','Sainte Chapelle (La)',1,2,'2.345162','48.855323','美轮美奂的彩绘玻璃窗与巴黎圣母院的玫瑰玻璃窗齐名，16面彩色玻璃窗却诉说了千余个圣经故事。','圣礼拜堂与邻近的司法宫殿同位于巴黎市中心的西堤岛上，它是一个典型的哥特式辐射风格小教堂，1238年至1244年路易九世国王下令修建。这里主要用来保存一些耶稣受难时荆冠残片等圣品。这些圣品是1239年拜占庭皇帝鲍德温二世花了135000利弗（修建该教堂只花费了40000利弗）的天价购买的，主要是为了提升巴黎作为西方基督教领导者的地位。圣礼拜堂给参观者一种与众不同的壮丽视觉体验，因为整个教堂的上层是用巨型的彩色玻璃窗围成的。',3,'除1月1日, 5月1日, 12月25日闭馆外, 每年3月至10月9:30~18:00（17:30前最后入场），11月~次年2月9:00~17:00（16:30前最后入场）。','4 Boulevard du Palais, Paris 75001 France','地铁4号线Cité站下','全票7.5EUR，半票4.8EUR，10月~次年3月第一个周日和18岁以下免费。适用博物馆卡。','0153406097','','','2012-10-06 09:51:33.349699');
INSERT INTO "city_viewer_place" VALUES('692f4047-0f9b-11e2-9b7c-3c0754041eea','先贤祠','Pantheon',1,2,'2.346171','48.846308','法国名人和伟人的安息之地，有趣的是，启蒙运动中的死对头卢梭和伏尔泰却在这里相互为伴，在同一个墓室中待了两个多世纪。','这座宏伟的建筑建于1764年至1790年，是国王路易十五为及纪念曾治愈他的疾病的巴黎守护神圣吉纳∙维芙曾而下令修建的，该工程刚好在法国大革命爆发之前竣工，后在法国大革命期间又将其作为一些法国著名人物的长期陵墓。去这里参观的游客对这座新古典主义风格的早前典范充满了钦佩和赞美之情，这里埋葬着著名的作家、哲学家有埃米尔、左拉、维克多∙雨果、让∙雅克、卢梭、伏尔泰，科学家皮埃尔和玛丽居里夫妇以及曾是夏尔∙戴高乐部长的安德烈∙马尔罗。先贤祠的正面外观显著地受到罗马万神殿的启发，而其高达83米（272英尺）的圆屋顶则与伦敦圣保罗大教堂以及法国另一教堂荣军院相似。',3,'4~9月10:00~18:30、10月~次年3月10:00~18:00；顶层4~10月10:15、11:00、14:30、15:30、16:30、17:15开放参观，1月1日、5月1日、12月25日休息。','Place du Panthéon, Paris, France','地铁10号线Cardinal Lemoine站下，火车RER B线Luxembourg站下','门票全票7.5EUR、半票：4.8EUR，10月~次年3月第一个周日和18岁以下免费。适用博物馆卡。','0144321800','','','2012-10-06 09:51:33.358903');
INSERT INTO "city_viewer_place" VALUES('6930cb33-0f9b-11e2-bc36-3c0754041eea','巴黎春天百货','Printemps',4,2,'2.328192','48.873766','巴黎春天百货，是去巴黎购物的必到之处，不过它已经超过了一般意义上的购物圣地，成为了法国历史和文化不可或缺的坐标之一。','巴黎春天百货公司位于遗产纪念塔内右侧，这里收藏的服饰、珠宝以及其他展出的配件都会让女士们疯狂。最著名最时髦的品牌占据了春天百货的一角：香奈儿、迪奥、古琦、圣罗兰、亚历山大•麦昆、斯特拉•麦卡特尼和路易威登等。四层主要用于展出像查第格伏尔泰、麦考林伊莎贝尔以及凡妮莎•布鲁诺等新设计师的作品。如果你是一名男士，大楼六层是单为你们设计的。如果你要购买家庭用品，你可以在这里买到家俱、瓷器、银器以及所有你想为婚宴准备的东西。说到婚礼，你可以在婚礼沙龙里试穿你将来的新娘礼服。如果你担心过度沉溺于购物后的身体，春天百货公司还拥有自己的美容厅和SPA场所。这里还可能提供什么呢？每周四会举行一次时装秀。巴黎春天百货美食家也为美食爱好者提供了许多美味佳肴，也可以在这里的餐馆或者咖啡馆休息一下，然后再继续领略巴黎的时尚风情。',3,'周一~周六9:35~19:00（周四延长至22:00），周日休息。','64 Boulevard Haussmann, 75009 Paris, 法国','地铁3号线、9号线Havre—Caumartin站下','','0142825787','http://departmentstoreparis.printemps.com/','','2012-10-06 09:51:33.369016');
INSERT INTO "city_viewer_place" VALUES('69327c40-0f9b-11e2-91c9-3c0754041eea','新凯旋门','Grand Arche',1,2,'2.335404','48.86105','巴黎新区的标志，远远望去就像一个巨大的门框，门框内形状不规则的棚盖就似飘进来的一朵云彩，给人无限遐想。','在卢浮宫经香榭丽舍大街通往戴高乐广场上凯旋门的延长线上，建有一座巨大的纪念碑式的建筑物，这就是20世纪的凯旋门。虽然称之为“门”，但实际上它是一幢很摩登的现代化大楼。这里地处巴黎的新区，周围都是现代化的设施。',3,'瞭望台4~9月10:00~20:00、10~3月10:00~19:00','99 Rue de Rivoli, 75004 Paris, 法国','地铁1号线或RER A线La Défense Grand Arche站下','瞭望台全票9EUR，半票7.5EUR。','0149072755','','','2012-10-06 09:51:33.380096');
INSERT INTO "city_viewer_place" VALUES('6934004c-0f9b-11e2-bd5b-3c0754041eea','拉德芳斯','La Défense',1,2,'2.241219','48.890219','拉德方斯就像是建筑师们的竞技场，各种奇形怪状的建筑物在这里比比皆是，大圆球状的，倒扣着的贝壳状的，三角形丝巾状的……','拉德芳斯区位于巴黎市的西北部，巴黎城市主轴线的西端，于上世纪五十年代开始建设开发,拉德芳斯的名称来自该地的一座雕像“La Défense de Paris”（直译为“保卫巴黎”）。现在是巴黎都会区首要的中心商务区，位于巴黎城西的上塞纳省，邻近塞纳河畔纳伊。其涵盖的市镇包括库尔贝瓦以及皮托和南泰尔的一部分。作为欧洲最完善的商务区，拉德芳斯是法国经济繁荣的象征。它拥有巴黎都会区中最多的摩天大厦，除此之外地标建筑新凯旋门即座落于此，办公场地约300万平方米，各类企业1500家。建区50年以来，拉德芳斯不再局限于商务领域的开拓，而是将工作居住休闲三者融合，环境优先的拉德芳斯也正在成为一个宜居区域。',8,'','1 Parvis de la Défense, 92800法国','地铁1号线或RER A线La Défense Grand Arche站下','','','','','2012-10-06 09:51:33.390039');
INSERT INTO "city_viewer_place" VALUES('693621ba-0f9b-11e2-ba06-3c0754041eea','荣军院','Invalides',1,2,'2.313778','48.855604','从伤兵大道进入可以欣赏到整个荣军院的全貌，特别是放置拿破仑墓的圆顶教堂，其金色的大顶闪闪发亮，气势逼人，是留影拍照的绝佳背景。','巴黎荣军院又名“巴黎残老军人院”。它是法兰西“太阳王”路易十四时期的建筑。1670年2月24日路易十四下令兴建一座用来安置他的军队中伤残军人的建筑，从此荣军院“应旨而生”。现如今，这座荣军院依旧行使着它初建时收容安置伤残军人的功能。它同时也是多个博物馆的所在之地。法兰西帝国的始皇帝拿破仑一世的墓也在这里。',3,'10月~次年3月周三~次周周一10:00~17:00（16:30前最后入场）、周二10:00~21:00（20:30前最后入场）、4~9月周三~次周周一10:00~18:00（17:30前最后入场）、周二10:00~21:00（20:30前最后入场）。每月第一个周一、1月1日、5月1日、11月1日、12月25日休息。','129 Rue de Grenelle, 75007 Paris, 法国','地铁8号线La Tour-Maubourg站下，或地铁13号线Varenne站下，或地铁8号线、13号线、RER C线Invalides站下','门票全票：8EUR，半票：6EUR，18岁以下免费。','0144423877','','','2012-10-06 09:51:33.403991');
INSERT INTO "city_viewer_place" VALUES('693a7a75-0f9b-11e2-bd30-3c0754041eea','圣路易岛','île Saint-Louis',1,2,'2.356524','48.851917','拿一筒贝蒂咏蛋卷冰淇林，逛逛精致的小店，看看街头艺人的表演，宁静安详的圣路易岛绝对是暂时远离城市喧嚣的好去处。','圣路易岛上的风貌多归功于17世纪路易十四的宫廷建筑师勒沃，如今岛上还保留着许多勒沃的经典名作。比较有看头的有音乐家瓦格纳曾经暂居过的洛赞别墅，还有兰贝尔别馆。',8,'','圣路易岛，75004 巴黎 法国','地铁7号线Pont Marie站下','','','','','2012-10-06 09:51:33.432477');
INSERT INTO "city_viewer_place" VALUES('693c0fb0-0f9b-11e2-9753-3c0754041eea','老佛爷百货公司','Galeries Lafayette',4,2,'2.332942','48.873187','这是一家曾凭豪华如宫殿的装修轰动一时的百货公司，在拜占庭式的巨型镂金雕花圆顶下，来往的人影绰约，就像是在赴一场中世纪的聚会。','尽管遭受了Gap、Zara、H&M等许多知名品牌公司的入侵，在歌剧院一带区域，老佛爷百货公司，以及附近的巴黎春天百货公司依然是巴黎最别致的最后堡垒之一。老佛爷百货建于1894年，这个购物者的天堂通过不断的改造和完善来吸引来来回回的顾客。华丽的主厅陈列着一列香水、配件以及其他商品。这里不仅设有所有享誉世界的品牌专柜，而且还有它自己的精美奢华的百货柜台，六家餐厅，一家旅行社，时装秀以及互联网接入等。每年在这里举行的声势浩大的圣诞节橱窗展示已经成为巴黎的一种习俗。',7,'周一~周六9:30~20:00（周四延长至21:00），周日休息。','40 Boulevard Haussmann, Paris 75008 France','地铁7号线、9号线Chaussée d''Antin—La Fayette站下','','0142823722','http://www.galerieslafayette.com/','','2012-10-06 09:51:33.442855');
INSERT INTO "city_viewer_place" VALUES('693da4e3-0f9b-11e2-a19c-3c0754041eea','山谷购物村','La Vallée Village',4,2,'2.783151','48.853892','巴黎购物的不二选择，超过95家的名牌折扣店，够逛上一天了。','山谷购物村坐落于时尚尖端之都，自然也就成为“必到的购物景点”。山谷购物村设有超过90家知名品牌专卖店，所有商品全年均按建议零售价的超低折扣出售。Bonpoint、Celine、Givenchy、Lancel，以及Antik Batik、Agnès b.和Lalique在全球唯一的专卖店，更显示了购物村的与众不同。与之相伴的富有传奇色彩的国际知名品牌还包括：Armani、Diane von Furstenber、Jimmy Choo、Joseph、Marni、Moncler、Paul Smith、Polo Ralph Lauren、Valentino、Salvatore Ferragamo以及世界知名店铺 Dsquared2 和 Maison Martin Margiela。',3,'周一-周日  10:00–19:00','3, Cours de la Garonne, 77700 Serris, 法国','RER A线Val d''Europe站下','','0160423500','http://www.lavalleevillage.com/','','2012-10-06 09:51:33.453226');
INSERT INTO "city_viewer_place" VALUES('693f4f23-0f9b-11e2-b467-3c0754041eea','乔治五世大道','Avenue George V',4,2,'2.300968','48.868531','乔治五世大道，巴黎奢侈品金三角的一条边，它的安静与香榭丽舍大道的熙来攘往形成了反差。','乔治五世大街和香榭丽舍大道是垂直方向的两条大街，在香街的中部地段交汇。相比于香街的门庭若市，乔治五世大街而显得较为冷清，店铺分布也不是很密集，确实一个悠闲购物的好去处。',3,'10:00-19:00，各店不一，周日休息','Avenue George V, Paris, France','地铁1号线George V站下','','','','','2012-10-06 09:51:33.464217');
INSERT INTO "city_viewer_place" VALUES('6943d7b8-0f9b-11e2-a3a1-3c0754041eea','蒙田大道','Avenue Montaigne',4,2,'2.306412','48.866800','蒙田大道也是巴黎奢侈品世界的地标之一，老远就能嗅到时尚之中的贵族气息。','巴黎蒙田大道（Avenue Montaigne）汇聚了众多世界顶级奢侈品品牌，如Ungaro Prada（2号）、Valentino （17号）、LV（22号）、Dior（30号）、Chanel（40-42号）、Calvin Klein（53号）和Gucci（60号）。 蒙田大道于1723年得名，此前大街上缤纷的树影，曾经引得不少怨妇们来此散心休闲。20世纪下半叶，随着Christian Dior (30号), Valentino (17-19号), Chanel (42号)等一批高档奢侈品品牌入驻，蒙田大道奢侈品形象得以骤然提升。此外，位于蒙田大道的Plaza Athene hotel酒店也是许多欧美贵族人士、亿万富翁、演艺明星和政府要人驻足之地。',3,'10:00-19:00，各店不一，周日休息','Avenue Montaigne 75008 Paris, France','地铁1号线、9号线Franklin D. Roosevelt站下','','','','','2012-10-06 09:51:33.493850');
INSERT INTO "city_viewer_place" VALUES('69452926-0f9b-11e2-858d-3c0754041eea','乐蓬马歇百货公司','Le Bon Marché',4,2,'2.324617','48.850597','乐蓬马歇百货经常出现在法国电影中，是老佛爷百货最有力的竞争对手之一，法国大文豪Zola就很喜欢流连其中寻求创作灵感。','乐蓬马歇百货公司（Le Bon Marché，意为“好市场”，或“好交易”）是法国巴黎的一个著名的百货公司，位于第七区的色佛尔街（rue de Sèvres）24号，以及巴比伦街（rue de Babylone）和巴克街（rue du Bac）转角。',3,'09:30-19:00','24, rue de Sèvres, 75007 Paris, 法国','地铁12号线Sèvres Babylone站下','','','http://www.bonmarche.fr','','2012-10-06 09:51:33.502486');
INSERT INTO "city_viewer_place" VALUES('6946bdd7-0f9b-11e2-9fb1-3c0754041eea','圣马丁运河','Canal St-Martin',1,2,'2.36426','48.876511','圣马丁运河是巴黎最美的景色之一，但也是最不为人所知的。在运河边漫步时，不妨去找一下法国著名电影《Amelie》的拍摄点。','圣马丁运河从共和国总部附近的弗雷德里克勒梅特广场延伸至拉斐特街及拉维莱特公园的迷人的小池塘。这条运河是游船穿过第十郡沿着塞纳河环绕的长线的捷径，自1825年修建以后，圣马丁运河颇受许多著名的艺术家和电影导演的喜爱和青睐。尤其著名的是颇受年轻人喜爱的电影《天使爱美丽》。去巴黎旅游的人们，都喜欢沿着圣马丁运河长长的河岸漫步，看着驳船从身边驶过，沿着长度九锁的运河向远方驶去。游客们还可以在诺德酒店轻酌一杯热茶，追忆在这里度过的美好时光。',3,'','Quai de Valmy, 75010 Paris, 法国','地铁2号线、5号线、7号线Jaur站下','','','','','2012-10-06 09:51:33.512845');
INSERT INTO "city_viewer_place" VALUES('69488333-0f9b-11e2-b57f-3c0754041eea','圣图安跳蚤市场','Puces de Montreuil',4,2,'2.412470','48.854129','巴黎最大的跳蚤市场，要想找到与众不同的玩意儿，就得往远处、深处钻，各式各样的“古董”待价而沽，喜欢就带回家吧。','跳蚤市场（Marche aux Puces），这个是法国最大的旧货市场。只要乘坐地铁4号线，终点Porte de Clignancourt下车，步行几分钟便到。这个市场足足横跨几条街，当中还细分几个小市场，好像Marche Michelet、Marche Vernaison、Marche Paul Bert、Marche Biron、Marche Malassis、Marche Dauphine、Marche des Rosiers等，有些是露天档口，有些是简陋地摊，亦有些别致小店。这里货品种类繁多，现代日常用品，新潮衣服鞋袜，还有各式各样的古董珍藏，杂货旧物……堪称全球跳蚤市场老大。',3,'周六9:00-18:00，周日10:00-18:00，周一11:00-19:00，周二至周五休息','261 Rue de Paris, 93100 Montreuil, 法国','地铁9号线Robespierre站下','','0143630110','','','2012-10-06 09:51:33.524459');
INSERT INTO "city_viewer_place" VALUES('6949ff78-0f9b-11e2-b46b-3c0754041eea','索邦大学','Sorbonne (La)',1,2,'2.343454','48.848380','宏伟的建筑、穹顶礼拜堂、酸橙树遍布的广场，来到索邦大学请务必怀着崇敬的心情，因为它不但是法国著名的大学，更有“欧洲大学之母”的美誉。','由罗伯特德索邦和国王圣路易的牧师建于1257的索邦大学是世界著名的一流大学。它有一个很不起眼的开始，起初只有16个学习科技的学生在这里学习。现在有数以千计的学生在各个研究领域力求完善他们的专业知识和专业技能。教堂是唯一存有红衣主教黎塞留建立的各项法令的地方，大学校长也于1626年葬于这个教堂。1791年在法国革命期间，颁布了一项抑制大学活动的法令，后在1806年拿破仑又重新恢复了大学活动。自19世纪末起，一个新的重建索邦大学的大项目项目中被启动，在这里新增加了宫殿Academique，大剧场和巨大的Bibliothèque。今天，索邦大学继续欢迎来自法国和世界各地的优秀学生和研究人员来这里一起工作和学习。参观大学是免费的。',8,'','1 Rue Victor Cousin, 75005 Paris, 法国','地铁10号线Cluny—La Sorbonne','','0140462211','http://www.sorbonne.fr','','2012-10-06 09:51:33.534198');
INSERT INTO "city_viewer_place" VALUES('694b9263-0f9b-11e2-b2ff-3c0754041eea','圣日耳曼德佩区','Saint-Germain-des-Prés',5,2,'2.332190','48.854095','圣日耳曼德佩区是巴黎最精华的艺术文化区，不了解它，你将满足于香榭丽舍的浮华，圣奥诺雷街的奢华，乃至玛黑区的新锐，却永远在巴黎精神的外围游荡。','圣日耳曼德佩区位于塞纳河的左岸，涵盖了巴黎六、七两个行政区，是象征巴黎的一个神秘地方。该街区自从十七世纪以来，就一直是巴黎的精神中心。漫步在这个街区，随处便可以找到文化的印记和历史的烙印。十八世纪法国一部分著名的启蒙思想家狄德罗、魁奈、伏尔泰、卢梭等，他们经常聚集在朗戴乐咖啡馆 café Landelle，布西街 rue de Buci 或是普寇咖啡馆 Procope，他们在这里共同编纂了世界上第一部《百科全书》 。法国大革命后期的领导人物，马拉 Marat，丹东 Danton就曾住在这个街区。',8,'','Saint-Germain des Prés, 75006 Paris, 法国','','','','','','2012-10-06 09:51:33.544507');
INSERT INTO "city_viewer_place" VALUES('694dd359-0f9b-11e2-b05b-3c0754041eea','小丘广场','Place du Tertre',1,2,'2.340659','48.886515','小丘广场影映在一片楼宇和绿树环抱中，就是这样一个不起眼的广场，却被称为落魄文人的天堂。','位于巴黎市中心不远处有一个广场，名叫小丘广场。小丘广场影映在一片楼宇和绿树环抱中，就是这样一个不起眼的广场，却被称作是落魄文人的天堂。从19世纪开始，这里就聚集了各种不得志、穷困潦倒的落魄文人，他们在这里以作画为生,或出售自己的画作，或为游客画画。著名画家卢梭、高更、雷诺瓦、毕加索、梵高、布拉克等都曾在此以作画为生，留下了一个个凄美的故事和传说。',8,'','Place du Tertre, 75018 Paris, 法国','地铁12号线Abbesses站下','','','','','2012-10-06 09:51:33.559277');
INSERT INTO "city_viewer_place" VALUES('694f625e-0f9b-11e2-bd6a-3c0754041eea','巴士底歌剧院','Opéra Bastille',9,2,'2.370496','48.852117','巴黎人曾称这座位于古老建筑群中的玻璃、水泥建筑为世界上最大的公共厕所，不过欣赏一场文艺表演的价格还是很平民的。','巴士底歌剧院是法国第二大歌剧院，也是欧洲最大的歌剧院之一。座落在巴黎十二区的巴士底广场，由卡洛斯·奥特设计，于1989年落成。巴士底歌剧院和加尼叶歌剧院是法国国家歌剧院指定的两个歌剧演出场所。',4,'','120 Rue de Lyon, 75012 Paris, 法国','地铁1号线、5号线、8号线Bastille站下','门票全票11EUR，半票6~9EUR.','0140011970','http://www.operadeparis.fr/','','2012-10-06 09:51:33.569500');
INSERT INTO "city_viewer_place" VALUES('6950ddfa-0f9b-11e2-93e4-3c0754041eea','孚日广场','Place des Vosges',1,2,'2.365654','48.855692','四方形广场在巴黎很少见，临街骑楼的设计更是稀有，整齐排列的高窗，立面的四方砖饰更是增添了音乐般的韵律感。','孚日广场是玛黑区的精华，这是一个完全对称的四方广场，广场上所有的石头和砖房是完全相同的，墙面上方都是陡峭的石板房顶，外墙则是类似矩形的砖块堆砌而成的，十分整齐匀称，是游览巴黎不可错过的名胜之一，这里的每一幢房子几乎都和一个显赫的名字相连，2号是著名的文学沙龙夫人苏维妮侯爵夫人出生地，莫里哀的成名剧本就是在这里被首次朗诵，由此揭开了法国喜剧的新篇；11号是一代名妓Marion Delorme的居所，21号住过黎胥留红衣大主教；6号雨果故居，如今成为雨果博物馆。四周环绕着成荫的拱形走廊里，开满了各种各样的时尚精品店。',8,'24小时','Place des Vosges 75004 Paris, France','地铁1号线、5号线、8号线Bastille站下，或地铁8号线Chemin Vert站下','免费','','','','2012-10-06 09:51:33.579215');
INSERT INTO "city_viewer_place" VALUES('69526a8c-0f9b-11e2-96e3-3c0754041eea','夏约宫','Palais de Chaillot',1,2,'2.288509','48.862770','拍摄埃菲尔铁塔的最佳位置，值得一去。','夏约宫位于埃菲尔铁塔底部，是1937年建筑师阿泽玛、路易斯∙奥古斯特∙布瓦洛和雅克∙卡吕为巴黎万国博览会修建的宫殿，位于夏约山上。这座新古典主义的纪念塔，其外形犹如香蕉一样呈两翼张开状，由四大博物馆和长度均为195米（639英尺）的两翼组成。其上是用30年代的雕塑和浅浮雕装饰而成，上面还刻着诗人瓦莱利的金色铭文。夏约宫内主要包括人类博物馆、海洋博物馆、亨利∙朗格洛瓦电影博物馆、法兰西文献博物馆、西堤岛宗教团体建筑、夏洛特国家剧院以及法国电影博物馆等。夏约宫的前面是特洛卡德罗庭院。',8,'','1 Place du Trocadéro et du 11 Novembre, 75116 Paris, 法国','地铁6号线、9号线Trocadéro站下','','0158515200','http://www.citechaillot.fr/en/','','2012-10-06 09:51:33.589363');
INSERT INTO "city_viewer_place" VALUES('6953f17d-0f9b-11e2-83bc-3c0754041eea','大皇宫','Grand Palais',1,2,'2.315532','48.866204','精致的柱廊，华丽的雕刻，透明的玻璃圆顶，在夜晚，在灯光的照射下尤其绚烂。','巴黎大皇宫（Grand Palais）位于巴黎香榭丽舍大道，是为了举办1900年世界博览会所兴建的。世博会后，其他建筑拆除，独留下巴黎大皇宫和埃菲尔铁塔这两座建筑作为法国及巴黎市的象征。这座已经有超过100年历史的建筑，现在是一个公共展览厅，举办过时尚名人伊夫·圣罗兰的拍卖会，也开过克里斯蒂安·博尔坦斯基的个展，并且还会举行各式各样的大型节庆活动。巴黎大皇宫独立艺术家作品展于1884年在巴黎创办，每年在巴黎大皇宫举行，是法国最具历史意义的艺术展之一。众多才华横溢的艺术家年轻时都曾在这里展出自己的作品，包括梵高、塞尚、雷诺阿、马蒂斯、达利、毕加索，他们当时还尚未闻名于世。',3,'10:00-20:00，周三延长至22:00','1 Avenue Géneral Eisenhower, 75008 Paris','地铁1号线、13号线Champs-Élysées - Clemenceau站下','','','','','2012-10-06 09:51:33.599369');
INSERT INTO "city_viewer_place" VALUES('69556ae8-0f9b-11e2-837c-3c0754041eea','圆顶咖啡馆','La Coupole',2,2,'2.328005','48.842335','这家曾号称全球最大的咖啡馆，如今已不再只是单纯的咖啡馆了，更是高级餐厅、时尚酒吧和欢乐舞厅，吸引着来自世界各地的名流雅士。','这是一家综合咖啡馆，风格很左岸，也很蒙帕纳斯。蒙帕纳斯曾是艺术家密集的地区，而La Coupole则是密度更高的场所。海明威、乔哀思、沙特、西蒙．波娃都曾经流连在此。它不只是咖啡馆，也可以因应需要利用隔屏改成酒馆、舞厅。圆顶的装潢，清丽而不华，一进门就给人一种亲切的感觉。甚至于可能还有人误会它是一个画廊，而不是餐馆。它四壁的墙上，挂满了巨大的油画，这些画不是一个人的作品，而是经常更换，包括夏卡尔（Chagall）及布朗库西（Brancuci）的作品。海明威当年来巴黎时一文不名，靠着比自己大了8岁的老婆打工挣来的钱混迹巴黎。当年与海明威为伍的公子哥儿们还有一批画家，因付不起欠圆顶咖啡馆的饭钱，便和老板定下了君子协议，为圆顶咖啡馆画些装饰壁画。今天这些装饰壁画已经价值连城。',7,'周一~周三、周日：8:30–0:00；周四~周六：8:30–1:00','102 Boulevard du Montparnasse, 75014 Paris, 法国','地铁4号线Vavin站下','starters €6.50-20, mains €12.50-35','0143201420','http://www.lacoupoleparis.com','','2012-10-06 09:51:33.609033');
INSERT INTO "city_viewer_place" VALUES('6957f9de-0f9b-11e2-8694-3c0754041eea','丁香园咖啡馆','La Closerie des Lilas',2,2,'2.336002','48.840043','海明威在这里构思了《太阳照样升起》，如果你是海明威的书迷，记得找找酒吧角落的“海明威之椅”，或许无法文思泉涌，但绝对能拥有难忘的咖啡馆时光。','现在的丁香园咖啡馆外围有着高高的一层绿色植物重重包围着，稍不留神就会错过他的入口，这和巴黎其他咖啡馆通透的落地玻璃窗风格截然不同，客人可以坐在玻璃窗后欣赏花园的美景，还可以选择在花园里用餐，花园中间还有小型的舞台，经常有著名的戏剧演员在这里用餐并即兴表演。当你看到这里的露天阳台，肯定会为它的绿而感动：即使在隆冬时节，也绿得让人满心丰盈；而夏天更是如处于绿林之中，花香草绿，清凉宜人。盛名所累、今日文人、艺术家少了，多的是富哥豪婆。丁香园咖啡馆的一个角落，至今还保留着一张“海明威之椅”—椅背的铜牌上刻着海明威的名字，咖啡馆还有一道名叫“海明威胡椒牛排”的招牌菜，据说美国人在巴黎旅游时一定会到此一游。著名作家左拉、画家塞尚和毕加索都曾在这里驻足，就连列宁都很喜欢丁香园。当法国最大的出版社负责人龚固尔兄弟创立法国最受人重视的龚固尔文学奖时，所有的构思与宗旨，都在这里起草。历史可以证明，龚固尔文学奖对法国文学的深远影响。',6,'周一~周六11:00–23:30；周日11:00–23:00','171 Boulevard du Montparnasse, 75006 Paris, 法国','搭RER B号线于Port-Royal站下，出站即达。','','0140513450','http://www.closeriedeslilas.fr','','2012-10-06 09:51:33.625795');
INSERT INTO "city_viewer_place" VALUES('695a1a1e-0f9b-11e2-9110-3c0754041eea','狡兔酒馆','Le Lapin Agile',2,2,'2.339972','48.88893','如同它斑驳而鲜艳的外观一般，狡兔酒馆的历史故事也总是为人所称道，这里一直以诗、歌和法国民谣表演著称，毕加索、尤特里罗、魏尔伦都曾是这里的常客。','狡兔酒馆的历史从1860年展开，最初是以杀手酒馆(Cabaretdes Assassins)为名，直到1880年，画家吉勒(André Gillh)在此画下了一幅手持酒瓶跳出煎锅的画作，由于法文里“吉勒的兔子”(Le Lapin à Gill)与“狡兔”(Lapin Agile)谐音，让这里从此改名为狡兔酒馆。直到今天，酒馆还是维持一贯传统，每天(周一除外)上演精采的音乐表演，成了体验旧日美好气氛的最佳去处。',4,'周二～周日21:00~2:00','22 Rue des Saules','地铁12号线Lamarck-Caulaincourt站下','入场费成人€24(含1杯饮料)、学生€17(含1杯饮料)，加点含酒精饮料€7、不含酒精饮料€6。','0146068587','http://www.au-lapin-agile.com/','','2012-10-06 09:51:33.639743');
INSERT INTO "city_viewer_place" VALUES('695c52c2-0f9b-11e2-b1e2-3c0754041eea','多摩咖啡館','Le Dôme',2,2,'2.329042','48.841955','列宁在其流亡生涯中，就经常在多摩咖啡馆明亮玻璃天花板下的座位上与托洛茨基构思和争论着俄国的革命。','20世纪初，随着拉丁区与蒙帕纳斯区的蓬勃发展，艺术家、记者、逃亡的俄罗斯贵族、无政府主义者、冒险家、观光客……都向这一带涌来，Dome便成了众人交换信息、打发时光的聚集地。这家咖啡馆在三、四十年代刚成立时，其实只是一家卖快餐和咖啡的小店，现今整个店面富丽堂皇，甚至，不少人认为Dome的装饰华丽俗气，照理不是艺文雅士所欣赏的，但因它的墙上贴满了毕加索、马蒂斯、达利等众多现代派画家的照片，不难想见当年艺术风流的盛况。更吸引人目光的，还是踏进咖啡馆映入眼帘的那幅作品，这幅签着作者Carzoo的名字的大画，特别显眼。还有布拉塞(BRASSAI)，他爱煞了他称作“波西米亚人(BOHEMIAN)”的这一帮，他用相机和文字描述了这些整夜泡在LE DOME里不安分的人。',7,'周一~周日:8:00–23:30','108, boulevard du Montparnasse, 75014 Paris, 法国','地铁4号线Vavin站下','starters/mains €20/40','0143352581','http://papeteriedudome.fr/index.htm','','2012-10-06 09:51:33.654290');
INSERT INTO "city_viewer_place" VALUES('695e270a-0f9b-11e2-98ac-3c0754041eea','旺多姆广场','Place Vendôme',5,2,'2.329595','48.867533','旺多姆广场号称“巴黎珠宝箱”，世界级的珠宝商、名表店都在广场边拥有店面，来到此地绝对让人眼前一亮。','沿着Castiglione街和de la Paix酒店就可以到达巴黎最著名的广场之一旺多姆广场。这个建筑中的杰作创建于 1685年，受国王路易十四委托并由Jules- Hardouin Mansart设计的，与法国的历史一脉相连。环绕广场的大厦拱廊在首都的中心形成了紧密的沙龙。毫无疑问，它是由巴黎的贵族提议建造的。在拿破仑建立的奥斯特利茨圆柱周围是许多享有盛誉的银行和法国典雅的象征。奢侈品牌如绰美，宝诗龙，梵克雅宝，卡地亚，娇兰，香奈儿比比皆是。当你驻足这里，停在里茨饭店或者爱丽舍宫（总统官邸），是的，这真的是豪华，优雅和霸权之家。',8,'24小时','Rue de la Paix, Paris 75002 France','地铁1号线Tuileries站下','免费','','http://www.place-vendome.net','','2012-10-06 09:51:33.666311');
INSERT INTO "city_viewer_place" VALUES('695ff007-0f9b-11e2-b6f0-3c0754041eea','科莱特','Colette',4,2,'2.331145','48.865308','Colette的出现真算得上是一个异类，这里是潮流人士的必去之地，时装、手袋、化妆品、饰物以及各种稀奇古怪的商品都有。','巴黎作为时尚奢侈品的购物天堂仍然成功的保留了它的典雅，尽管它拥有一流的时尚华丽的国家艺术装饰水平。这家商店的宗旨是将最美丽、最独特的、最昂贵的设计师的作品汇聚到这里。所以如果你在寻找古奇表或者杰瑞米•斯科特设计的礼服(时尚的新星之一) ,或从纽约进口的化妆品,那么在这里你一定可以找到。展亭里的最新且最顶级的时装和设计杂志非常值得一看,同时其高科技咖啡馆提供了超过100种不同品牌的矿泉水。',2,'周一~周六：11:00–19:00','213 Rue Saint-Honore, Paris 75001 France','地铁1号线Tuileries站下','','0155353390','http://www.colette.fr/','','2012-10-06 09:51:33.677982');
INSERT INTO "city_viewer_place" VALUES('69639399-0f9b-11e2-b922-3c0754041eea','Pierre Herme甜品店','Pierre Herme',2,2,'2.332081','48.873231','这家店的MACARON可以算是全巴黎乃至全世界最好的了，而在众多新老品种中，最令人感动的就是这款ISAFAHAN了，吃完会有种意犹未尽，沉浸在幸福之中的感觉。','你是否曾想象过，缀满草莓或者拿破仑点心或者美味的巧克力的天蓝色蛋糕可以论斤买？那么，顺便去这里逛逛吧，这个奇妙的食品店会给你馋涎欲滴的美味享受。用红纸包裹的惊奇二号，是由调和蛋白、果慕斯组成的，是许多常客的最爱。对于喜欢吃巧克力的顾客来说，PH3是菜单列表上最受欢迎的，它包含了白色巧克力，蛋糕内部裹满了柠檬果酱或者拔丝苹果。',7,'周一~周三、周五~周六：9:30–20:00，周四：9:30–21:00，周日休息','Galeries Lafayette, 40 Boulevard Haussmann, 75009 Paris, 法国','地铁7号线、9号线Chaussée d''Antin - La Fayette站下','','0143544777','http://www.pierreherme.com','','2012-10-06 09:51:33.701827');
INSERT INTO "city_viewer_place" VALUES('696555c0-0f9b-11e2-9ba4-3c0754041eea','玛黑区','Marais',4,2,'2.361453','48.857600','玛黑区跟左岸一样拥有艺文气息，却多了一点艺术家放形浪骇的狂野，跟右岸一样拥有领导时尚潮流的特质，却多了一点新鲜感。在玛黑区永远是充满惊喜的。','13世纪时，玛黑区是一片沼泽地，Marais的法文意思就是沼泽，直到17世纪皇室贵族进驻，兴建许多豪宅府邸，加上美丽的庭园点缀，成为迷人的区域，法国大革命时期人去楼空而荒废。幸而在70年代政府宣布玛黑区为古迹，并通过马勒侯法令(le loi Malraux)加以保护，经过修复的建筑重现风貌，吸引餐馆、画廊、服装店聚集，漫步其中，除了逛街，欣赏历史建筑也令人赏心悦目。今日的玛黑区是同志活动中心，各种风格的酒吧、另类书店、情趣商店等，将玛黑区点缀得形形色色，同志酒吧集中于旧寺院街(Rue Vieille du Temple)和不列堂尼圣十字架街(Rue St Croix de la Bretonnerie)周围，热闹的夜生活不只同志最爱，年轻人也趋之若鹜。',8,'','marais, paris','','','','','','2012-10-06 09:51:33.713342');
INSERT INTO "city_viewer_place" VALUES('696795c2-0f9b-11e2-8f33-3c0754041eea','stohrer蛋糕店','Stohrer',2,2,'2.346769','48.865189','这家让人无法抗拒的甜品店位于巴黎市中心，曾经为皇家宫廷做甜品，如果是在情人节去，记得点一道“爱之泉”。','这家店是著名的朗姆酒海绵蛋糕的发源地，也提供巴黎最好吃的巧克力长条糕点（éclair）。1725年，波兰国王的女儿玛丽（Marie）嫁给了路易十五，跟随她到凡尔赛宫的还有御用甜点师Nicolas Stohrer。5年后，Nicolas Stohrer的甜品店在Montorgueil大街51号开张了。Nicolas Stohrer在来巴黎前就研制出了baba。波兰国王Stanislas当时正在看《一千零一夜》，就把这种点心命名为阿里巴巴。如今Stohrer出售四种版本的baba：朗姆酒海绵蛋糕，奶油和葡萄干阿里巴巴，鲜奶油海绵蛋糕和藏红花阿里巴巴，最后一种只在年终时提供，而且要提前预定。',3,'7:30-20:30，每年8月头两个星期停业','51, rue Montorgueil, 75002 Paris, 法国','地铁3号线、4号线Réaumur-Sébastopol站下','','0142333820','http://www.stohrer.fr/','','2012-10-06 09:51:33.728095');
INSERT INTO "city_viewer_place" VALUES('69690e8f-0f9b-11e2-850d-3c0754041eea','Berthillon贝蒂咏店','Berthillon',2,2,'2.356752','48.851690','巴黎最有名的冰淇淋店，座落在圣路易岛上，她的名气不是靠打广告，而是绝佳的口碑，尤其以水果味冰淇淋(SORBE)闻名。','这个店位于巴黎圣路易岛，是这个岛的传奇。该店创办于1954年，有70多种口味可供选择，水果口味的的确很美味，还有其他口味的如巧克力、咖啡、甜栗阿马尼亚克酒混合洋李干、榛子和蜂蜜果仁等。',7,'周三~周日：10:00–20:00，周一、周二休息','31 Rue Saint-Louis en l''Île, 75004 Paris, 法国','地铁7号线Pont Marie站下','','0143543161','http://www.berthillon.fr','','2012-10-06 09:51:33.737742');
INSERT INTO "city_viewer_place" VALUES('696f65f5-0f9b-11e2-aa5d-3c0754041eea','Angelina甜品店','Angelina',2,2,'2.328425','48.865061','Angelina这间百年老店，就在卢浮宫旁边，其原创作品MONT-BLANC勃朗峰几乎会让每一个来到巴黎的美食爱好者慕名而来。','ANGELINA是一间著名的法式茶点沙龙，装潢以Belle Époque风格为主题，自1903年起就受到法国上流社会的青睐。离卢浮宫仅几步之遥，其最著名的是栗子塔，表面盖了一层条状栗子泥，里面是奶油馅料，然后烤蛋白垫底，口感和味道都绝佳。建议配上ANGELINA红茶。',3,'周一至周五 09:30-19:00；周六至周日 08:30-19:00','226, Rue de Rivoli, Paris','地铁1号线Tuileries站下','','0142608200','http://www.angelina-paris.fr/','','2012-10-06 09:51:33.779296');
INSERT INTO "city_viewer_place" VALUES('6974cc30-0f9b-11e2-8f9e-3c0754041eea','Fauchon甜品店','Fauchon',2,2,'2.325655','48.870377','这家店很巴黎，游客基本都喜欢这里，想象一下把蒙娜丽莎咬进嘴里的感觉。','FAUCHON中文名是馥颂，它是由August Fauchon在1886年创建，他在负于盛名的巴黎玛德莲娜广场创办了第一家馥颂品牌店，馥颂的美名开始在法国流传。最初只是一家经营果蔬的杂货店，后又创建了其自己的面包店和糖果店。Fauchon还首创了高级食品零售商品牌，以Fauchon为品牌的茶叶、巧克力、咖啡和果酱以及饼干等一直是高档食品品质的代名词，号称“拿面包当香水卖”的奢侈品牌。',3,'周一~周六：9:00–20:00，周日休息','26 Place de la Madeleine, 75008 Paris, 法国','地铁8号线、12号线、14号线Madeleine站下','','0170393800','http://www.fauchon.com/','','2012-10-06 09:51:33.814717');
INSERT INTO "city_viewer_place" VALUES('697b410a-0f9b-11e2-a28e-3c0754041eea','和平咖啡','Cafe de la paix',2,2,'2.331019','48.870484','虽然叫和平咖啡，却不是个和平的地方，经常会有“甜点战争”，各种甜品比赛在这里打的火热，这里的千层饼也被大师们赋予独特的风格。','著名的和平咖啡馆（Café de la Paix）坐落在巴黎歌剧院附近的证卷和金融小区中心，它幽静的露台恰好处在巴黎皇宫花园的拱廊下方，巴黎人在这样的氛围下忘记了时光的流逝。和平咖啡馆是文化人、作家的最爱，也是政治人物经常光顾的地方，历届法国总统来此都不止一次，而且第二次世界大战，法军光复巴黎，法军统帅戴高乐将军「痛饮巴黎」的第一杯咖啡就是这里。和平咖啡馆也是餐馆，餐馆与咖啡馆分开两边经营，这也是一般巴黎豪华餐馆的格局，因为法国人不在餐桌上喝咖啡。',7,'周一~周日：7:00–23:30','12 Boulevard des Capucines, 75009 Paris, 法国','地铁3号线、7号线、8号线Opera站下','','0140073636','http://www.cafedelapaix.fr','','2012-10-06 09:51:33.857080');
INSERT INTO "city_viewer_place" VALUES('697cf040-0f9b-11e2-bf72-3c0754041eea','LeNôtre甜品店','LeNôtre',2,2,'2.288712','48.871222','柠檬塔是一款简单的甜品，但Le Nôtre家的绝对会让人眼前一亮，柠檬塔上面烤蛋白的甜味和下面柠檬的酸味拿捏的十分到位。','LeNotre不但是法国糕饼新派始祖，也是糕饼界的人才培训机构，Furet Tanrade、Christian Constant…的老板们，都曾經在LeNotrer任职，足见其地位之重要性。已经企业化经营的LeNotre，1957年开始第一家店，目前在巴黎已有7家门市及3家餐厅，旗舰店位于凯旋门附近的HUGO大道，店面装饰得富丽堂皇，所有门市的糕点都在凡尔赛附近的总公司中央厨房统一制造处理。LeNotre每天生产6000种不同的产品，Macaron每天都有100公斤的需求量，特别值得一提的是，开心果，草莓，红莓，巧克力，香草，咖啡等多达6种口味的Macaron冰淇淋是LeNotre最主要的产品之一。',7,'周一~周四：9:30–21:00，周五~周日：9:00–21:00','48 Avenue Victor Hugo, 75016 Paris, 法国','地铁6号线Kléber站下','','0145022121','http://www.lenotre.fr','','2012-10-06 09:51:33.868037');
INSERT INTO "city_viewer_place" VALUES('697e807a-0f9b-11e2-8a63-3c0754041eea','Chartier餐厅','Chartier',2,2,'2.343022','48.871954','行李架在头顶，陌生人坐一桌，点菜写桌布，Chartier就是这样一家餐厅：出名、奇怪、法国菜、物美价廉。','自1896年开张餐厅，已成为历史建筑。开业于19世纪末的法国巴黎餐厅chartier，其服务宗旨是：以平民的价格提供简单可口的热食，满足你的胃绝不伤害你的钱包。餐厅主人认为chartier提供的是听觉，味觉，嗅觉，视觉的感官盛宴。',6,'周一~周日：11:30–22:00','7 Rue du Faubourg Montmartre, 75009 Paris, 法国','地铁8号线、9号线Grands Boulevards站下','','0147708629','http://www.restaurant-chartier.com/www/','','2012-10-06 09:51:33.878349');
INSERT INTO "city_viewer_place" VALUES('69814bc2-0f9b-11e2-a78f-3c0754041eea','Brasserie Lipp利普餐厅','Brasserie Lipp',2,2,'2.332441','48.853788','安德烈·幻德及其《法兰西》杂志社撰稿作家们会定期在这里见面探讨写作心得，圣·罗兰也经常涉足这里。','这里供应choucroute garnie和jarret de porc aux lentilles等美味食品，常有政治家、知识分子、媒体界的重要人士会面。',7,'
周一~周日：9:00–0:45','151 Boulevard Saint-Germain, 75006 Paris,法国','地铁4号线Saint-Germain-des-Prés站下','starters €10-15, mains €15-25','0145485391','http://www.groupe-bertrand.com','','2012-10-06 09:51:33.896589');
INSERT INTO "city_viewer_place" VALUES('6982b2bd-0f9b-11e2-9882-3c0754041eea','法兰西布尔乔亚街','Rue des Francs-Bourgeois',5,2,'2.361312','48.857439','个性创意小店遍布的一条街，如果想淘独一无二的设计作品可以来这里。','时装店、帽子店、手袋店、披肩店、鞋店、珠宝店、扣子店、甚至只出售女士白衬衫的，里面的货品几乎都是独此一件的设计师作品，每家店都在飚创意，绝不雷同，挨家瞧过去，你可以收获一箩筐的新奇主意。多花一点时间，说不定也能淘到几件品位个性皆不俗的宝贝。最值得一看的还要算那些古灵精怪的创意小店。',3,'','Rue des Francs Bourgeois, Paris, 法国','地铁1号线Saint-Paul站下','','','','','2012-10-06 09:51:33.905838');
INSERT INTO "city_viewer_place" VALUES('6984e528-0f9b-11e2-a637-3c0754041eea','Bistrot du Sommelier','Bistrot du Sommelier',2,2,'2.318144','48.874875','淳朴精致的法国菜，会令人味觉大开，菜肴的摆盘方式更是令人惊艳。','这家店非常的值得推荐，在用餐的同时还能享用到葡萄酒，老板是全球顶级的调酒师之一，如果要欣赏一下他配对美食和佳酿，最好是选择周五来，出售的三道菜试吃午餐配葡萄酒价格为€45，五道菜晚餐配葡萄酒价格是€70。',6,'周一~周五：12:00-22:30，周六、周日休息','97 Boulevard Haussmann, 75008 Paris, 法国','地铁9号线St-Augustin站下','lunch menu €33, incl wine €43, dinner menus €65-110','0142652485','http://www.bistrotdusommelier.com/','','2012-10-06 09:51:33.920183');
INSERT INTO "city_viewer_place" VALUES('6986b273-0f9b-11e2-85fe-3c0754041eea','Brasserie de l’île St-Louis','Brasserie de l’île St-Louis',2,2,'2.3533','48.852925','味美价廉的一家店，可以一边欣赏河畔的美景，一边享受店里的美食。','这家餐厅位于塞纳河畔圣路易岛上，供应choucroute garnie，jarret以及onglet de boeuf等，味道很好，价格很便宜，值得推荐。',6,'周一~周二、周四~周日：12:00–23:00，周三休息','55 Quai Bourbon, 75004 Paris, 法国','地铁7号线Pont Marie站下','starters €10-15, mains €17.50','0143540259','http://www.labrasserie-isl.fr','','2012-10-06 09:51:33.931992');
INSERT INTO "city_viewer_place" VALUES('6988b054-0f9b-11e2-bfdd-3c0754041eea','Polidor餐厅','Polidor',2,2,'2.340138','48.849826','典型的法国陈设餐厅，而且没有两天的菜是相同的，菜单每天变化。','印象好，严格的传统味道。 牛肉有意大利人的风味。巧克力冻也不错。还保留了19世纪的文化风气。套餐 15.50 欧元.',6,'周一~周四：12:00–0:30，周五~周六：19:00–0:30，周日：12:00–23:00','41 Rue Monsieur le Prince, 75006 Paris, 法国','搭RER B号线
Luxembourg站下','','0143269534','','','2012-10-06 09:51:33.945050');
CREATE TABLE "city_viewer_area" (
    "id" integer NOT NULL PRIMARY KEY,
    "zh_name" varchar(50) NOT NULL UNIQUE,
    "en_name" varchar(50) NOT NULL UNIQUE,
    "cover_pic" varchar(100) NOT NULL,
    "owner_id" integer NOT NULL REFERENCES "auth_user" ("id"),
    "create_at" datetime NOT NULL
);
INSERT INTO "city_viewer_area" VALUES(1,'香港','hongkong','uploads/封面.jpg',1,'2012-10-06 02:35:12.921060');
INSERT INTO "city_viewer_area" VALUES(2,'巴黎','paris','uploads/Basilique_du_Sacre-Coeur_Le_3.jpg',1,'2012-10-06 09:51:32.848627');
CREATE INDEX "django_admin_log_fbfc09f1" ON "django_admin_log" ("user_id");
CREATE INDEX "django_admin_log_e4470c6e" ON "django_admin_log" ("content_type_id");
CREATE INDEX "auth_permission_e4470c6e" ON "auth_permission" ("content_type_id");
CREATE INDEX "auth_group_permissions_bda51c3c" ON "auth_group_permissions" ("group_id");
CREATE INDEX "auth_group_permissions_1e014c8f" ON "auth_group_permissions" ("permission_id");
CREATE INDEX "auth_user_user_permissions_fbfc09f1" ON "auth_user_user_permissions" ("user_id");
CREATE INDEX "auth_user_user_permissions_1e014c8f" ON "auth_user_user_permissions" ("permission_id");
CREATE INDEX "auth_user_groups_fbfc09f1" ON "auth_user_groups" ("user_id");
CREATE INDEX "auth_user_groups_bda51c3c" ON "auth_user_groups" ("group_id");
CREATE INDEX "django_session_c25c2c28" ON "django_session" ("expire_date");
CREATE UNIQUE INDEX "guardian_groupobjectpermission_object_pk__group_id__content_type_id__permission_id" ON "guardian_groupobjectpermission"("object_pk", "group_id", "content_type_id", "permission_id");
CREATE UNIQUE INDEX "guardian_userobjectpermission_object_pk__user_id__content_type_id__permission_id" ON "guardian_userobjectpermission"("object_pk", "user_id", "content_type_id", "permission_id");
CREATE INDEX "easy_thumbnails_source_3a997c55" ON "easy_thumbnails_source" ("storage_hash");
CREATE UNIQUE INDEX "easy_thumbnails_source_name__storage_hash" ON "easy_thumbnails_source"("name", "storage_hash");
CREATE UNIQUE INDEX "easy_thumbnails_thumbnail_source_id__name__storage_hash" ON "easy_thumbnails_thumbnail"("source_id", "name", "storage_hash");
CREATE INDEX "city_viewer_picture_3ee6582b" ON "city_viewer_picture" ("in_place_id");
CREATE INDEX "city_viewer_topic_c21db00" ON "city_viewer_topic" ("in_area_id");
CREATE INDEX "city_viewer_place_in_topics_c4391d6c" ON "city_viewer_place_in_topics" ("place_id");
CREATE INDEX "city_viewer_place_in_topics_57732028" ON "city_viewer_place_in_topics" ("topic_id");
CREATE INDEX "city_viewer_place_c21db00" ON "city_viewer_place" ("in_area_id");
CREATE INDEX "city_viewer_area_5d52dd10" ON "city_viewer_area" ("owner_id");
COMMIT;
