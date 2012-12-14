BEGIN;
CREATE TABLE "city_meta" (
    "key" varchar(50) NOT NULL UNIQUE,
    "value" varchar(50) NOT NULL
)
;
CREATE TABLE "city_topic" (
    "id" varchar(36) NOT NULL PRIMARY KEY,
    "name" varchar(50) NOT NULL,
    "desc" varchar(255) NOT NULL,
    "cover_pic" varchar(100) NOT NULL,
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
    "longitude" DOUBLE NOT NULL,
    "latitude" DOUBLE NOT NULL,
    "short_desc" varchar(100) NOT NULL,
    "fit_time" smallint NOT NULL,
    "info" text NOT NULL
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
CREATE INDEX "city_picture_3ee6582b" ON "city_picture" ("in_place_id");


