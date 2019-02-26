/*
Navicat Oracle Data Transfer
Oracle Client Version : 12.1.0.2.0

Source Server         : Oracle
Source Server Version : 110200
Source Host           : localhost:1521
Source Schema         : WECHATAPP

Target Server Type    : ORACLE
Target Server Version : 110200
File Encoding         : 65001

Date: 2018-12-21 00:04:09
*/


-- ----------------------------
-- Table structure for contacts
-- ----------------------------
DROP TABLE "WECHATAPP"."contacts";
CREATE TABLE "WECHATAPP"."contacts" (
"user_id" VARCHAR2(64 BYTE) NOT NULL ,
"contact_id" VARCHAR2(64 BYTE) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of contacts
-- ----------------------------
INSERT INTO "WECHATAPP"."contacts" VALUES ('sst', 'whr');
INSERT INTO "WECHATAPP"."contacts" VALUES ('whr', 'sst');

-- ----------------------------
-- Indexes structure for table contacts
-- ----------------------------

-- ----------------------------
-- Checks structure for table contacts
-- ----------------------------
ALTER TABLE "WECHATAPP"."contacts" ADD CHECK ("user_id" IS NOT NULL);
ALTER TABLE "WECHATAPP"."contacts" ADD CHECK ("contact_id" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table contacts
-- ----------------------------
ALTER TABLE "WECHATAPP"."contacts" ADD PRIMARY KEY ("user_id", "contact_id");
