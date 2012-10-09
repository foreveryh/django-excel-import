BEGIN;
CREATE TABLE "city_area" (
    "id" integer NOT NULL PRIMARY KEY,
    "zh_name" varchar(50) NOT NULL UNIQUE,
    "en_name" varchar(50) NOT NULL UNIQUE,
    "cover_pic" varchar(100) NOT NULL,
    "create_at" datetime NOT NULL
)
;
CREATE TABLE "city_topic" (
    "id" varchar(36) NOT NULL PRIMARY KEY,
    "name" varchar(50) NOT NULL,
    "desc" varchar(255) NOT NULL,
    "in_area_id" integer NOT NULL REFERENCES "city_area" ("id"),
    "weight" smallint NOT NULL
)
;
CREATE TABLE "city_place_in_topics" (
    "id" integer NOT NULL PRIMARY KEY,
    "place_id" varchar(36) NOT NULL,
    "topic_id" varchar(36) NOT NULL REFERENCES "city_topic" ("id"),
    UNIQUE ("place_id", "topic_id")
)
;
CREATE TABLE "city_place" (
    "id" varchar(36) NOT NULL PRIMARY KEY,
    "zh_name" varchar(50) NOT NULL,
    "en_name" varchar(100) NOT NULL,
    "category" smallint NOT NULL,
    "in_area_id" integer NOT NULL REFERENCES "city_area" ("id"),
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
)
;
CREATE TABLE "city_picture" (
    "id" varchar(36) NOT NULL PRIMARY KEY,
    "file_name" varchar(50) NOT NULL,
    "url" varchar(200) NOT NULL,
    "desc" varchar(255) NOT NULL,
    "in_place_id" varchar(36) NOT NULL REFERENCES "city_place" ("id"),
    "create_at" datetime NOT NULL
)
;
CREATE INDEX "city_topic_c21db00" ON "city_topic" ("in_area_id");
CREATE INDEX "city_place_c21db00" ON "city_place" ("in_area_id");
CREATE INDEX "city_picture_3ee6582b" ON "city_picture" ("in_place_id");


