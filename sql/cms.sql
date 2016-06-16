-- MySQL dump 10.14  Distrib 5.5.47-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: cms
-- ------------------------------------------------------
-- Server version	5.5.47-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ogdch_commentmeta`
--

DROP TABLE IF EXISTS `ogdch_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ogdch_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogdch_commentmeta`
--

LOCK TABLES `ogdch_commentmeta` WRITE;
/*!40000 ALTER TABLE `ogdch_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `ogdch_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ogdch_comments`
--

DROP TABLE IF EXISTS `ogdch_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ogdch_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogdch_comments`
--

LOCK TABLES `ogdch_comments` WRITE;
/*!40000 ALTER TABLE `ogdch_comments` DISABLE KEYS */;
INSERT INTO `ogdch_comments` VALUES (1,164,'liip','jazz@liip.ch','','192.168.56.1','2016-06-13 11:56:13','2016-06-13 09:56:13','sdfgsdfg',0,'1','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:47.0) Gecko/20100101 Firefox/47.0','',0,1);
/*!40000 ALTER TABLE `ogdch_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ogdch_links`
--

DROP TABLE IF EXISTS `ogdch_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ogdch_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogdch_links`
--

LOCK TABLES `ogdch_links` WRITE;
/*!40000 ALTER TABLE `ogdch_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `ogdch_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ogdch_nf_objectmeta`
--

DROP TABLE IF EXISTS `ogdch_nf_objectmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ogdch_nf_objectmeta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) NOT NULL,
  `meta_value` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogdch_nf_objectmeta`
--

LOCK TABLES `ogdch_nf_objectmeta` WRITE;
/*!40000 ALTER TABLE `ogdch_nf_objectmeta` DISABLE KEYS */;
INSERT INTO `ogdch_nf_objectmeta` VALUES (1,1,'date_updated','2015-12-09 16:45:43');
INSERT INTO `ogdch_nf_objectmeta` VALUES (2,1,'form_title','Contact form');
INSERT INTO `ogdch_nf_objectmeta` VALUES (3,1,'show_title','0');
INSERT INTO `ogdch_nf_objectmeta` VALUES (4,1,'save_subs','1');
INSERT INTO `ogdch_nf_objectmeta` VALUES (5,1,'logged_in','0');
INSERT INTO `ogdch_nf_objectmeta` VALUES (6,1,'append_page','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (7,1,'ajax','0');
INSERT INTO `ogdch_nf_objectmeta` VALUES (8,1,'clear_complete','1');
INSERT INTO `ogdch_nf_objectmeta` VALUES (9,1,'hide_complete','1');
INSERT INTO `ogdch_nf_objectmeta` VALUES (10,1,'success_msg','Your form has been successfully submitted.');
INSERT INTO `ogdch_nf_objectmeta` VALUES (11,1,'email_from','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (12,1,'email_type','html');
INSERT INTO `ogdch_nf_objectmeta` VALUES (13,1,'user_email_msg','Thank you so much for contacting us. We will get back to you shortly.');
INSERT INTO `ogdch_nf_objectmeta` VALUES (14,1,'user_email_fields','0');
INSERT INTO `ogdch_nf_objectmeta` VALUES (15,1,'admin_email_msg','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (16,1,'admin_email_fields','1');
INSERT INTO `ogdch_nf_objectmeta` VALUES (17,1,'admin_attach_csv','0');
INSERT INTO `ogdch_nf_objectmeta` VALUES (18,1,'email_from_name','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (19,2,'date_updated','2014-09-09');
INSERT INTO `ogdch_nf_objectmeta` VALUES (20,2,'active','1');
INSERT INTO `ogdch_nf_objectmeta` VALUES (21,2,'name','Email User');
INSERT INTO `ogdch_nf_objectmeta` VALUES (22,2,'type','email');
INSERT INTO `ogdch_nf_objectmeta` VALUES (23,2,'email_format','html');
INSERT INTO `ogdch_nf_objectmeta` VALUES (24,2,'attach_csv','0');
INSERT INTO `ogdch_nf_objectmeta` VALUES (25,2,'from_name','opendata.swiss');
INSERT INTO `ogdch_nf_objectmeta` VALUES (26,2,'from_address','opendata@bar.admin.ch');
INSERT INTO `ogdch_nf_objectmeta` VALUES (27,2,'reply_to','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (28,2,'to','field_2');
INSERT INTO `ogdch_nf_objectmeta` VALUES (29,2,'cc','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (30,2,'bcc','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (31,2,'email_subject','Thank you for contacting us!');
INSERT INTO `ogdch_nf_objectmeta` VALUES (32,2,'email_message','Thank you very much for your message. We will contact you as soon as possible.\r\n\r\nHere is a copy of your message:\r\n\r\n[ninja_forms_all_fields]\r\n\r\nKind regards,\r\nSwiss Federal Archives');
INSERT INTO `ogdch_nf_objectmeta` VALUES (33,2,'redirect_url','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (34,2,'success_message_loc','ninja_forms_display_before_fields');
INSERT INTO `ogdch_nf_objectmeta` VALUES (35,2,'success_msg','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (36,3,'date_updated','2014-09-09');
INSERT INTO `ogdch_nf_objectmeta` VALUES (37,3,'active','1');
INSERT INTO `ogdch_nf_objectmeta` VALUES (38,3,'name','Success Message');
INSERT INTO `ogdch_nf_objectmeta` VALUES (39,3,'type','success_message');
INSERT INTO `ogdch_nf_objectmeta` VALUES (40,3,'email_format','html');
INSERT INTO `ogdch_nf_objectmeta` VALUES (41,3,'attach_csv','0');
INSERT INTO `ogdch_nf_objectmeta` VALUES (42,3,'from_name','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (43,3,'from_address','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (44,3,'reply_to','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (45,3,'to','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (46,3,'cc','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (47,3,'bcc','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (48,3,'email_subject','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (49,3,'email_message','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (50,3,'redirect_url','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (51,3,'success_message_loc','ninja_forms_display_after_fields');
INSERT INTO `ogdch_nf_objectmeta` VALUES (52,3,'success_msg','Your form has been successfully submitted.');
INSERT INTO `ogdch_nf_objectmeta` VALUES (53,3,'text_message_number','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (54,3,'text_message_carrier','0');
INSERT INTO `ogdch_nf_objectmeta` VALUES (55,3,'text_message_message','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (56,4,'date_updated','2014-09-09');
INSERT INTO `ogdch_nf_objectmeta` VALUES (57,4,'active','1');
INSERT INTO `ogdch_nf_objectmeta` VALUES (58,4,'name','Email Admin');
INSERT INTO `ogdch_nf_objectmeta` VALUES (59,4,'type','email');
INSERT INTO `ogdch_nf_objectmeta` VALUES (60,4,'email_format','html');
INSERT INTO `ogdch_nf_objectmeta` VALUES (61,4,'attach_csv','1');
INSERT INTO `ogdch_nf_objectmeta` VALUES (62,4,'from_name','field_6`field_1');
INSERT INTO `ogdch_nf_objectmeta` VALUES (63,4,'from_address','field_2');
INSERT INTO `ogdch_nf_objectmeta` VALUES (64,4,'reply_to','field_2');
INSERT INTO `ogdch_nf_objectmeta` VALUES (65,4,'to','juerg.hunziker@liip.ch');
INSERT INTO `ogdch_nf_objectmeta` VALUES (66,4,'cc','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (67,4,'bcc','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (68,4,'email_subject','opendata.swiss Kontaktformular');
INSERT INTO `ogdch_nf_objectmeta` VALUES (69,4,'email_message','The contact form on opendata.swiss was submitted:\r\n\r\n[ninja_forms_all_fields]');
INSERT INTO `ogdch_nf_objectmeta` VALUES (70,4,'redirect_url','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (71,4,'success_message_loc','ninja_forms_display_before_fields');
INSERT INTO `ogdch_nf_objectmeta` VALUES (72,4,'success_msg','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (73,4,'text_message_number','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (74,4,'text_message_carrier','0');
INSERT INTO `ogdch_nf_objectmeta` VALUES (75,4,'text_message_message','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (76,1,'not_logged_in_msg','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (77,1,'sub_limit_number','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (78,1,'sub_limit_msg','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (79,1,'status','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (80,1,'last_sub','2');
INSERT INTO `ogdch_nf_objectmeta` VALUES (81,5,'date_updated','2015-12-09 16:46:36');
INSERT INTO `ogdch_nf_objectmeta` VALUES (82,5,'form_title','Kontaktformular');
INSERT INTO `ogdch_nf_objectmeta` VALUES (83,5,'show_title','0');
INSERT INTO `ogdch_nf_objectmeta` VALUES (84,5,'save_subs','1');
INSERT INTO `ogdch_nf_objectmeta` VALUES (85,5,'logged_in','0');
INSERT INTO `ogdch_nf_objectmeta` VALUES (86,5,'append_page','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (87,5,'ajax','0');
INSERT INTO `ogdch_nf_objectmeta` VALUES (88,5,'clear_complete','1');
INSERT INTO `ogdch_nf_objectmeta` VALUES (89,5,'hide_complete','1');
INSERT INTO `ogdch_nf_objectmeta` VALUES (90,5,'success_msg','Your form has been successfully submitted.');
INSERT INTO `ogdch_nf_objectmeta` VALUES (91,5,'email_from','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (92,5,'email_type','html');
INSERT INTO `ogdch_nf_objectmeta` VALUES (93,5,'user_email_msg','Thank you so much for contacting us. We will get back to you shortly.');
INSERT INTO `ogdch_nf_objectmeta` VALUES (94,5,'user_email_fields','0');
INSERT INTO `ogdch_nf_objectmeta` VALUES (95,5,'admin_email_msg','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (96,5,'admin_email_fields','1');
INSERT INTO `ogdch_nf_objectmeta` VALUES (97,5,'admin_attach_csv','0');
INSERT INTO `ogdch_nf_objectmeta` VALUES (98,5,'email_from_name','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (99,5,'not_logged_in_msg','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (100,5,'sub_limit_number','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (101,5,'sub_limit_msg','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (102,5,'status','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (103,6,'date_updated','2014-09-09');
INSERT INTO `ogdch_nf_objectmeta` VALUES (104,6,'active','1');
INSERT INTO `ogdch_nf_objectmeta` VALUES (105,6,'name','Email User');
INSERT INTO `ogdch_nf_objectmeta` VALUES (106,6,'type','email');
INSERT INTO `ogdch_nf_objectmeta` VALUES (107,6,'email_format','html');
INSERT INTO `ogdch_nf_objectmeta` VALUES (108,6,'attach_csv','0');
INSERT INTO `ogdch_nf_objectmeta` VALUES (109,6,'from_name','opendata.swiss');
INSERT INTO `ogdch_nf_objectmeta` VALUES (110,6,'from_address','opendata@bar.admin.ch');
INSERT INTO `ogdch_nf_objectmeta` VALUES (111,6,'reply_to','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (112,6,'to','field_12');
INSERT INTO `ogdch_nf_objectmeta` VALUES (113,6,'cc','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (114,6,'bcc','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (115,6,'email_subject','opendata.swiss Kontaktformular');
INSERT INTO `ogdch_nf_objectmeta` VALUES (116,6,'email_message','Herzlichen Dank für Ihre Nachricht. Wir melden uns so rasch wie möglich bei Ihnen.\r\n\r\nIhre Nachricht:\r\n\r\n[ninja_forms_all_fields]\r\n\r\nFreundliche Grüsse,\r\nDas Schweizerische Bundesarchiv');
INSERT INTO `ogdch_nf_objectmeta` VALUES (117,6,'redirect_url','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (118,6,'success_message_loc','ninja_forms_display_before_fields');
INSERT INTO `ogdch_nf_objectmeta` VALUES (119,6,'success_msg','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (120,7,'date_updated','2014-09-09');
INSERT INTO `ogdch_nf_objectmeta` VALUES (121,7,'active','1');
INSERT INTO `ogdch_nf_objectmeta` VALUES (122,7,'name','Success Message');
INSERT INTO `ogdch_nf_objectmeta` VALUES (123,7,'type','success_message');
INSERT INTO `ogdch_nf_objectmeta` VALUES (124,7,'email_format','html');
INSERT INTO `ogdch_nf_objectmeta` VALUES (125,7,'attach_csv','0');
INSERT INTO `ogdch_nf_objectmeta` VALUES (126,7,'from_name','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (127,7,'from_address','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (128,7,'reply_to','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (129,7,'to','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (130,7,'cc','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (131,7,'bcc','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (132,7,'email_subject','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (133,7,'email_message','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (134,7,'redirect_url','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (135,7,'success_message_loc','ninja_forms_display_after_fields');
INSERT INTO `ogdch_nf_objectmeta` VALUES (136,7,'success_msg','Das Kontaktformular wurde erfolgreich versendet!');
INSERT INTO `ogdch_nf_objectmeta` VALUES (137,7,'text_message_number','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (138,7,'text_message_carrier','0');
INSERT INTO `ogdch_nf_objectmeta` VALUES (139,7,'text_message_message','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (140,8,'date_updated','2014-09-09');
INSERT INTO `ogdch_nf_objectmeta` VALUES (141,8,'active','1');
INSERT INTO `ogdch_nf_objectmeta` VALUES (142,8,'name','Email Admin');
INSERT INTO `ogdch_nf_objectmeta` VALUES (143,8,'type','email');
INSERT INTO `ogdch_nf_objectmeta` VALUES (144,8,'email_format','html');
INSERT INTO `ogdch_nf_objectmeta` VALUES (145,8,'attach_csv','1');
INSERT INTO `ogdch_nf_objectmeta` VALUES (146,8,'from_name','field_9`field_10');
INSERT INTO `ogdch_nf_objectmeta` VALUES (147,8,'from_address','field_12');
INSERT INTO `ogdch_nf_objectmeta` VALUES (148,8,'reply_to','field_12');
INSERT INTO `ogdch_nf_objectmeta` VALUES (149,8,'to','juerg.hunziker@liip.ch');
INSERT INTO `ogdch_nf_objectmeta` VALUES (150,8,'cc','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (151,8,'bcc','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (152,8,'email_subject','opendata.swiss Kontaktformular');
INSERT INTO `ogdch_nf_objectmeta` VALUES (153,8,'email_message','Das Kontaktformular auf opendata.swiss wurde ausgefüllt:\r\n\r\n[ninja_forms_all_fields]');
INSERT INTO `ogdch_nf_objectmeta` VALUES (154,8,'redirect_url','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (155,8,'success_message_loc','ninja_forms_display_before_fields');
INSERT INTO `ogdch_nf_objectmeta` VALUES (156,8,'success_msg','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (157,8,'text_message_number','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (158,8,'text_message_carrier','0');
INSERT INTO `ogdch_nf_objectmeta` VALUES (159,8,'text_message_message','');
/*!40000 ALTER TABLE `ogdch_nf_objectmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ogdch_nf_objects`
--

DROP TABLE IF EXISTS `ogdch_nf_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ogdch_nf_objects` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogdch_nf_objects`
--

LOCK TABLES `ogdch_nf_objects` WRITE;
/*!40000 ALTER TABLE `ogdch_nf_objects` DISABLE KEYS */;
INSERT INTO `ogdch_nf_objects` VALUES (1,'form');
INSERT INTO `ogdch_nf_objects` VALUES (2,'notification');
INSERT INTO `ogdch_nf_objects` VALUES (3,'notification');
INSERT INTO `ogdch_nf_objects` VALUES (4,'notification');
INSERT INTO `ogdch_nf_objects` VALUES (5,'form');
INSERT INTO `ogdch_nf_objects` VALUES (6,'notification');
INSERT INTO `ogdch_nf_objects` VALUES (7,'notification');
INSERT INTO `ogdch_nf_objects` VALUES (8,'notification');
/*!40000 ALTER TABLE `ogdch_nf_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ogdch_nf_relationships`
--

DROP TABLE IF EXISTS `ogdch_nf_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ogdch_nf_relationships` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `child_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  `child_type` varchar(255) NOT NULL,
  `parent_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogdch_nf_relationships`
--

LOCK TABLES `ogdch_nf_relationships` WRITE;
/*!40000 ALTER TABLE `ogdch_nf_relationships` DISABLE KEYS */;
INSERT INTO `ogdch_nf_relationships` VALUES (1,2,1,'notification','form');
INSERT INTO `ogdch_nf_relationships` VALUES (2,3,1,'notification','form');
INSERT INTO `ogdch_nf_relationships` VALUES (3,4,1,'notification','form');
INSERT INTO `ogdch_nf_relationships` VALUES (4,6,5,'notification','form');
INSERT INTO `ogdch_nf_relationships` VALUES (5,7,5,'notification','form');
INSERT INTO `ogdch_nf_relationships` VALUES (6,8,5,'notification','form');
/*!40000 ALTER TABLE `ogdch_nf_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ogdch_ninja_forms_fav_fields`
--

DROP TABLE IF EXISTS `ogdch_ninja_forms_fav_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ogdch_ninja_forms_fav_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `row_type` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  `data` longtext NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogdch_ninja_forms_fav_fields`
--

LOCK TABLES `ogdch_ninja_forms_fav_fields` WRITE;
/*!40000 ALTER TABLE `ogdch_ninja_forms_fav_fields` DISABLE KEYS */;
INSERT INTO `ogdch_ninja_forms_fav_fields` VALUES (2,0,'_list',0,'a:10:{s:5:\"label\";s:14:\"State Dropdown\";s:9:\"label_pos\";s:4:\"left\";s:9:\"list_type\";s:8:\"dropdown\";s:10:\"multi_size\";s:1:\"5\";s:15:\"list_show_value\";s:1:\"1\";s:4:\"list\";a:1:{s:7:\"options\";a:51:{i:0;a:3:{s:5:\"label\";s:7:\"Alabama\";s:5:\"value\";s:2:\"AL\";s:8:\"selected\";s:1:\"0\";}i:1;a:3:{s:5:\"label\";s:6:\"Alaska\";s:5:\"value\";s:2:\"AK\";s:8:\"selected\";s:1:\"0\";}i:2;a:3:{s:5:\"label\";s:7:\"Arizona\";s:5:\"value\";s:2:\"AZ\";s:8:\"selected\";s:1:\"0\";}i:3;a:3:{s:5:\"label\";s:8:\"Arkansas\";s:5:\"value\";s:2:\"AR\";s:8:\"selected\";s:1:\"0\";}i:4;a:3:{s:5:\"label\";s:10:\"California\";s:5:\"value\";s:2:\"CA\";s:8:\"selected\";s:1:\"0\";}i:5;a:3:{s:5:\"label\";s:8:\"Colorado\";s:5:\"value\";s:2:\"CO\";s:8:\"selected\";s:1:\"0\";}i:6;a:3:{s:5:\"label\";s:11:\"Connecticut\";s:5:\"value\";s:2:\"CT\";s:8:\"selected\";s:1:\"0\";}i:7;a:3:{s:5:\"label\";s:8:\"Delaware\";s:5:\"value\";s:2:\"DE\";s:8:\"selected\";s:1:\"0\";}i:8;a:3:{s:5:\"label\";s:20:\"District of Columbia\";s:5:\"value\";s:2:\"DC\";s:8:\"selected\";s:1:\"0\";}i:9;a:3:{s:5:\"label\";s:7:\"Florida\";s:5:\"value\";s:2:\"FL\";s:8:\"selected\";s:1:\"0\";}i:10;a:3:{s:5:\"label\";s:7:\"Georgia\";s:5:\"value\";s:2:\"GA\";s:8:\"selected\";s:1:\"0\";}i:11;a:3:{s:5:\"label\";s:6:\"Hawaii\";s:5:\"value\";s:2:\"HI\";s:8:\"selected\";s:1:\"0\";}i:12;a:3:{s:5:\"label\";s:5:\"Idaho\";s:5:\"value\";s:2:\"ID\";s:8:\"selected\";s:1:\"0\";}i:13;a:3:{s:5:\"label\";s:8:\"Illinois\";s:5:\"value\";s:2:\"IL\";s:8:\"selected\";s:1:\"0\";}i:14;a:3:{s:5:\"label\";s:7:\"Indiana\";s:5:\"value\";s:2:\"IN\";s:8:\"selected\";s:1:\"0\";}i:15;a:3:{s:5:\"label\";s:4:\"Iowa\";s:5:\"value\";s:2:\"IA\";s:8:\"selected\";s:1:\"0\";}i:16;a:3:{s:5:\"label\";s:6:\"Kansas\";s:5:\"value\";s:2:\"KS\";s:8:\"selected\";s:1:\"0\";}i:17;a:3:{s:5:\"label\";s:8:\"Kentucky\";s:5:\"value\";s:2:\"KY\";s:8:\"selected\";s:1:\"0\";}i:18;a:3:{s:5:\"label\";s:9:\"Louisiana\";s:5:\"value\";s:2:\"LA\";s:8:\"selected\";s:1:\"0\";}i:19;a:3:{s:5:\"label\";s:5:\"Maine\";s:5:\"value\";s:2:\"ME\";s:8:\"selected\";s:1:\"0\";}i:20;a:3:{s:5:\"label\";s:8:\"Maryland\";s:5:\"value\";s:2:\"MD\";s:8:\"selected\";s:1:\"0\";}i:21;a:3:{s:5:\"label\";s:13:\"Massachusetts\";s:5:\"value\";s:2:\"MA\";s:8:\"selected\";s:1:\"0\";}i:22;a:3:{s:5:\"label\";s:8:\"Michigan\";s:5:\"value\";s:2:\"MI\";s:8:\"selected\";s:1:\"0\";}i:23;a:3:{s:5:\"label\";s:9:\"Minnesota\";s:5:\"value\";s:2:\"MN\";s:8:\"selected\";s:1:\"0\";}i:24;a:3:{s:5:\"label\";s:11:\"Mississippi\";s:5:\"value\";s:2:\"MS\";s:8:\"selected\";s:1:\"0\";}i:25;a:3:{s:5:\"label\";s:8:\"Missouri\";s:5:\"value\";s:2:\"MO\";s:8:\"selected\";s:1:\"0\";}i:26;a:3:{s:5:\"label\";s:7:\"Montana\";s:5:\"value\";s:2:\"MT\";s:8:\"selected\";s:1:\"0\";}i:27;a:3:{s:5:\"label\";s:8:\"Nebraska\";s:5:\"value\";s:2:\"NE\";s:8:\"selected\";s:1:\"0\";}i:28;a:3:{s:5:\"label\";s:6:\"Nevada\";s:5:\"value\";s:2:\"NV\";s:8:\"selected\";s:1:\"0\";}i:29;a:3:{s:5:\"label\"3s:13:\"New Hampshire\";s:5:\"value\";s:2:\"NH\";s:8:\"selected\";s:1:\"0\";}i:30;a:3:{s:5:\"label\";s:10:\"New Jersey\";s:5:\"value\";s:2:\"NJ\";s:8:\"selected\";s:1:\"0\";}i:31;a:3:{s:5:\"label\";s:10:\"New Mexico\";s:5:\"value\";s:2:\"NM\";s:8:\"selected\";s:1:\"0\";}i:32;a:3:{s:5:\"label\";s:8:\"New York\";s:5:\"value\";s:2:\"NY\";s:8:\"selected\";s:1:\"0\";}i:33;a:3:{s:5:\"label\";s:14:\"North Carolina\";s:5:\"value\";s:2:\"NC\";s:8:\"selected\";s:1:\"0\";}i:34;a:3:{s:5:\"label\";s:12:\"North Dakota\";s:5:\"value\";s:2:\"ND\";s:8:\"selected\";s:1:\"0\";}i:35;a:3:{s:5:\"label\";s:4:\"Ohio\";s:5:\"value\";s:2:\"OH\";s:8:\"selected\";s:1:\"0\";}i:36;a:3:{s:5:\"label\";s:8:\"Oklahoma\";s:5:\"value\";s:2:\"OK\";s:8:\"selected\";s:1:\"0\";}i:37;a:3:{s:5:\"label\";s:6:\"Oregon\";s:5:\"value\";s:2:\"OR\";s:8:\"selected\";s:1:\"0\";}i:38;a:3:{s:5:\"label\";s:12:\"Pennsylvania\";s:5:\"value\";s:2:\"PA\";s:8:\"selected\";s:1:\"0\";}i:39;a:3:{s:5:\"label\";s:12:\"Rhode Island\";s:5:\"value\";s:2:\"RI\";s:8:\"selected\";s:1:\"0\";}i:40;a:3:{s:5:\"label\";s:14:\"South Carolina\";s:5:\"value\";s:2:\"SC\";s:8:\"selected\";s:1:\"0\";}i:41;a:3:{s:5:\"label\";s:12:\"South Dakota\";s:5:\"value\";s:2:\"SD\";s:8:\"selected\";s:1:\"0\";}i:42;a:3:{s:5:\"label\";s:9:\"Tennessee\";s:5:\"value\";s:2:\"TN\";s:8:\"selected\";s:1:\"0\";}i:43;a:3:{s:5:\"label\";s:5:\"Texas\";s:5:\"value\";s:2:\"TX\";s:8:\"selected\";s:1:\"0\";}i:44;a:3:{s:5:\"label\";s:4:\"Utah\";s:5:\"value\";s:2:\"UT\";s:8:\"selected\";s:1:\"0\";}i:45;a:3:{s:5:\"label\";s:7:\"Vermont\";s:5:\"value\";s:2:\"VT\";s:8:\"selected\";s:1:\"0\";}i:46;a:3:{s:5:\"label\";s:8:\"Virginia\";s:5:\"value\";s:2:\"VA\";s:8:\"selected\";s:1:\"0\";}i:47;a:3:{s:5:\"label\";s:10:\"Washington\";s:5:\"value\";s:2:\"WA\";s:8:\"selected\";s:1:\"0\";}i:48;a:3:{s:5:\"label\";s:13:\"West Virginia\";s:5:\"value\";s:2:\"WV\";s:8:\"selected\";s:1:\"0\";}i:49;a:3:{s:5:\"label\";s:9:\"Wisconsin\";s:5:\"value\";s:2:\"WI\";s:8:\"selected\";s:1:\"0\";}i:50;a:3:{s:5:\"label\";s:7:\"Wyoming\";s:5:\"value\";s:2:\"WY\";s:8:\"selected\";s:1:\"0\";}}}s:3:\"req\";s:1:\"0\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";}','State Dropdown');
INSERT INTO `ogdch_ninja_forms_fav_fields` VALUES (3,0,'_spam',0,'a:6:{s:9:\"label_pos\";s:4:\"left\";s:5:\"label\";s:18:\"Anti-Spam Question\";s:6:\"answer\";s:16:\"Anti-Spam Answer\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";}','Anti-Spam');
INSERT INTO `ogdch_ninja_forms_fav_fields` VALUES (4,0,'_submit',0,'a:4:{s:5:\"label\";s:6:\"Submit\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";}','Submit');
INSERT INTO `ogdch_ninja_forms_fav_fields` VALUES (5,0,'_tax',0,'a:11:{s:5:\"label\";s:3:\"Tax\";s:9:\"label_pos\";s:5:\"above\";s:13:\"default_value\";s:0:\"\";s:19:\"payment_field_group\";s:1:\"1\";s:11:\"payment_tax\";s:1:\"1\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:11:\"conditional\";s:0:\"\";s:11:\"calc_option\";s:1:\"0\";s:4:\"calc\";s:0:\"\";}','Tax');
INSERT INTO `ogdch_ninja_forms_fav_fields` VALUES (6,0,'_text',0,'a:19:{s:5:\"label\";s:10:\"First Name\";s:9:\"label_pos\";s:5:\"above\";s:13:\"default_value\";s:0:\"\";s:4:\"mask\";s:0:\"\";s:10:\"datepicker\";s:1:\"0\";s:5:\"email\";s:1:\"0\";s:10:\"send_email\";s:1:\"0\";s:10:\"from_email\";s:1:\"0\";s:10:\"first_name\";s:1:\"1\";s:9:\"last_name\";s:1:\"0\";s:9:\"from_name\";s:1:\"0\";s:21:\"user_info_field_group\";s:1:\"1\";s:3:\"req\";s:1:\"0\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:17:\"calc_auto_include\";s:1:\"0\";s:11:\"calc_option\";s:1:\"0\";s:11:\"conditional\";s:0:\"\";}','First Name');
INSERT INTO `ogdch_ninja_forms_fav_fields` VALUES (7,0,'_text',0,'a:19:{s:5:\"label\";s:9:\"Last Name\";s:9:\"label_pos\";s:5:\"above\";s:13:\"default_value\";s:0:\"\";s:4:\"mask\";s:0:\"\";s:10:\"datepicker\";s:1:\"0\";s:5:\"email\";s:1:\"0\";s:10:\"send_email\";s:1:\"0\";s:10:\"from_email\";s:1:\"0\";s:10:\"first_name\";s:1:\"0\";s:9:\"last_name\";s:1:\"1\";s:9:\"from_name\";s:1:\"0\";s:21:\"user_info_field_group\";s:1:\"1\";s:3:\"req\";s:1:\"0\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:17:\"calc_auto_include\";s:1:\"0\";s:11:\"calc_option\";s:1:\"0\";s:11:\"conditional\";s:0:\"\";}','Last Name');
INSERT INTO `ogdch_ninja_forms_fav_fields` VALUES (8,0,'_text',0,'a:23:{s:5:\"label\";s:9:\"Address 1\";s:9:\"label_pos\";s:5:\"above\";s:13:\"default_value\";s:0:\"\";s:4:\"mask\";s:0:\"\";s:10:\"datepicker\";s:1:\"0\";s:5:\"email\";s:1:\"0\";s:10:\"send_email\";s:1:\"0\";s:10:\"from_email\";s:1:\"0\";s:10:\"first_name\";s:1:\"0\";s:9:\"last_name\";s:1:\"0\";s:9:\"from_name\";s:1:\"0\";s:14:\"user_address_1\";s:1:\"1\";s:14:\"user_address_2\";s:1:\"0\";s:9:\"user_city\";s:1:\"0\";s:8:\"user_zip\";s:1:\"0\";s:21:\"user_info_field_group\";s:1:\"1\";s:3:\"req\";s:1:\"0\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:17:\"calc_auto_include\";s:1:\"0\";s:11:\"calc_option\";s:1:\"0\";s:11:\"conditional\";s:0:\"\";}','Address 1');
INSERT INTO `ogdch_ninja_forms_fav_fields` VALUES (9,0,'_text',0,'a:23:{s:5:\"label\";s:9:\"Address 2\";s:9:\"label_pos\";s:5:\"above\";s:13:\"default_value\";s:0:\"\";s:4:\"mask\";s:0:\"\";s:10:\"datepicker\";s:1:\"0\";s:5:\"email\";s:1:\"0\";s:10:\"send_email\";s:1:\"0\";s:10:\"from_email\";s:1:\"0\";s:10:\"first_name\";s:1:\"0\";s:9:\"last_name\";s:1:\"0\";s:9:\"from_name\";s:1:\"0\";s:14:\"user_address_1\";s:1:\"0\";s:14:\"user_address_2\";s:1:\"1\";s:9:\"user_city\";s:1:\"0\";s:8:\"user_zip\";s:1:\"0\";s:21:\"user_info_field_group\";s:1:\"1\";s:3:\"req\";s:1:\"0\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:17:\"calc_auto_include\";s:1:\"0\";s:11:\"calc_option\";s:1:\"0\";s:11:\"conditional\";s:0:\"\";}','Address 2');
INSERT INTO `ogdch_ninja_forms_fav_fields` VALUES (10,0,'_text',0,'a:23:{s:5:\"label\";s:4:\"City\";s:9:\"label_pos\";s:5:\"above\";s:13:\"default_value\";s:0:\"\";s:4:\"mask\";s:0:\"\";s:10:\"datepicker\";s:1:\"0\";s:5:\"email\";s:1:\"0\";s:10:\"send_email\";s:1:\"0\";s:10:\"from_email\";s:1:\"0\";s:10:\"first_name\";s:1:\"0\";s:9:\"last_name\";s:1:\"0\";s:9:\"from_name\";s:1:\"0\";s:14:\"user_address_1\";s:1:\"0\";s:14:\"user_address_2\";s:1:\"0\";s:9:\"user_city\";s:1:\"1\";s:8:\"user_zip\";s:1:\"0\";s:21:\"user_info_field_group\";s:1:\"1\";s:3:\"req\";s:1:\"0\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:17:\"calc_auto_include\";s:1:\"0\";s:11:\"calc_option\";s:1:\"0\";s:11:\"conditional\";s:0:\"\";}','City');
INSERT INTO `ogdch_ninja_forms_fav_fields` VALUES (11,0,'_list',0,'a:16:{s:5:\"label\";s:5:\"State\";s:9:\"label_pos\";s:5:\"above\";s:10:\"multi_size\";s:1:\"5\";s:15:\"list_show_value\";s:1:\"1\";s:4:\"list\";a:1:{s:7:\"options\";a:51:{i:0;a:4:{s:5:\"label\";s:7:\"Alabama\";s:5:\"value\";s:2:\"AL\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:1;a:4:{s:5:\"label\";s:6:\"Alaska\";s:5:\"value\";s:2:\"AK\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:2;a:4:{s:5:\"label\";s:7:\"Arizona\";s:5:\"value\";s:2:\"AZ\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:3;a:4:{s:5:\"label\";s:8:\"Arkansas\";s:5:\"value\";s:2:\"AR\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:4;a:4:{s:5:\"label\";s:10:\"California\";s:5:\"value\";s:2:\"CA\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:5;a:4:{s:5:\"label\";s:8:\"Colorado\";s:5:\"value\";s:2:\"CO\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:6;a:4:{s:5:\"label\";s:11:\"Connecticut\";s:5:\"value\";s:2:\"CT\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:7;a:4:{s:5:\"label\";s:8:\"Delaware\";s:5:\"value\";s:2:\"DE\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:8;a:4:{s:5:\"label\";s:20:\"District of Columbia\";s:5:\"value\";s:2:\"DC\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:9;a:4:{s:5:\"label\";s:7:\"Florida\";s:5:\"value\";s:2:\"FL\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:10;a:4:{s:5:\"label\";s:7:\"Georgia\";s:5:\"value\";s:2:\"GA\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:11;a:4:{s:5:\"label\";s:6:\"Hawaii\";s:5:\"value\";s:2:\"HI\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:12;a:4:{s:5:\"label\";s:5:\"Idaho\";s:5:\"value\";s:2:\"ID\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:13;a:4:{s:5:\"label\";s:8:\"Illinois\";s:5:\"value\";s:2:\"IL\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:14;a:4:{s:5:\"label\";s:7:\"Indiana\";s:5:\"value\";s:2:\"IN\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:15;a:4:{s:5:\"label\";s:4:\"Iowa\";s:5:\"value\";s:2:\"IA\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:16;a:4:{s:5:\"label\";s:6:\"Kansas\";s:5:\"value\";s:2:\"KS\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:17;a:4:{s:5:\"label\";s:8:\"Kentucky\";s:5:\"value\";s:2:\"KY\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:18;a:4:{s:5:\"label\";s:9:\"Louisiana\";s:5:\"value\";s:2:\"LA\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:19;a:4:{s:5:\"label\";s:5:\"Maine\";s:5:\"value\";s:2:\"ME\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:20;a:4:{s:5:\"label\";s:8:\"Maryland\";s:5:\"value\";s:2:\"MD\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:21;a:4:{s:5:\"label\";s:13:\"Massachusetts\";s:5:\"value\";s:2:\"MA\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:22;a:4:{s:5:\"label\";s:8:\"Michigan\";s:5:\"value\";s:2:\"MI\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:23;a:4:{s:5:\"label\";s:9:\"Minnesota\";s:5:\"value\";s:2:\"MN\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:24;a:4:{s:5:\"label\";s:11:\"Mississippi\";s:5:\"value\";s:2:\"MS\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:25;a:4:{s:5:\"label\";s:8:\"Missouri\";s:5:\"value\";s:2:\"MO\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:26;a:4:{s:5:\"label\";s:7:\"Montana\";s:5:\"value\";s:2:\"MT\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:27;a:4:{s:5:\"label\";s:8:\"Nebraska\";s:5:\"value\";s:2:\"NE\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:28;a:4:{s:5:\"label\";s:6:\"Nevada\";s:5:\"value\";s:2:\"NV\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:29;a:4:{s:5:\"label\";s:13:\"New Hampshire\";s:5:\"value\";s:2:\"NH\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:30;a:4:{s:5:\"label\";s:10:\"New Jersey\";s:5:\"value\";s:2:\"NJ\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:31;a:4:{s:5:\"label\";s:10:\"New Mexico\";s:5:\"value\";s:2:\"NM\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:32;a:4:{s:5:\"label\";s:8:\"New York\";s:5:\"value\";s:2:\"NY\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:33;a:4:{s:5:\"label\";s:14:\"North Carolina\";s:5:\"value\";s:2:\"NC\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:34;a:4:{s:5:\"label\";s:12:\"North Dakota\";s:5:\"value\";s:2:\"ND\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:35;a:4:{s:5:\"label\";s:4:\"Ohio\";s:5:\"value\";s:2:\"OH\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:36;a:4:{s:5:\"label\";s:8:\"Oklahoma\";s:5:\"value\";s:2:\"OK\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:37;a:4:{s:5:\"label\";s:6:\"Oregon\";s:5:\"value\";s:2:\"OR\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:38;a:4:{s:5:\"label\";s:12:\"Pennsylvania\";s:5:\"value\";s:2:\"PA\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:39;a:4:{s:5:\"label\";s:12:\"Rhode Island\";s:5:\"value\";s:2:\"RI\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:40;a:4:{s:5:\"label\";s:14:\"South Carolina\";s:5:\"value\";s:2:\"SC\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:41;a:4:{s:5:\"label\";s:12:\"South Dakota\";s:5:\"value\";s:2:\"SD\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:42;a:4:{s:5:\"label\";s:9:\"Tennessee\";s:5:\"value\";s:2:\"TN\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:43;a:4:{s:5:\"label\";s:5:\"Texas\";s:5:\"value\";s:2:\"TX\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:44;a:4:{s:5:\"label\";s:4:\"Utah\";s:5:\"value\";s:2:\"UT\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:45;a:4:{s:5:\"label\";s:7:\"Vermont\";s:5:\"value\";s:2:\"VT\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:46;a:4:{s:5:\"label\";s:8:\"Virginia\";s:5:\"value\";s:2:\"VA\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:47;a:4:{s:5:\"label\";s:10:\"Washington\";s:5:\"value\";s:2:\"WA\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:48;a:4:{s:5:\"label\";s:13:\"West Virginia\";s:5:\"value\";s:2:\"WV\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:49;a:4:{s:5:\"label\";s:9:\"Wisconsin\";s:5:\"value\";s:2:\"WI\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:50;a:4:{s:5:\"label\";s:7:\"Wyoming\";s:5:\"value\";s:2:\"WY\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}}}s:9:\"list_type\";s:8:\"dropdown\";s:10:\"user_state\";s:1:\"1\";s:21:\"user_info_field_group\";s:1:\"1\";s:13:\"populate_term\";s:0:\"\";s:3:\"req\";s:1:\"0\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:17:\"calc_auto_include\";s:1:\"0\";s:11:\"calc_option\";s:1:\"0\";s:11:\"conditional\";s:0:\"\";}','State');
INSERT INTO `ogdch_ninja_forms_fav_fields` VALUES (12,0,'_text',0,'a:23:{s:5:\"label\";s:15:\"Zip / Post Code\";s:9:\"label_pos\";s:5:\"above\";s:13:\"default_value\";s:0:\"\";s:4:\"mask\";s:0:\"\";s:10:\"datepicker\";s:1:\"0\";s:5:\"email\";s:1:\"0\";s:10:\"send_email\";s:1:\"0\";s:10:\"from_email\";s:1:\"0\";s:10:\"first_name\";s:1:\"0\";s:9:\"last_name\";s:1:\"0\";s:9:\"from_name\";s:1:\"0\";s:14:\"user_address_1\";s:1:\"0\";s:14:\"user_address_2\";s:1:\"0\";s:9:\"user_city\";s:1:\"0\";s:8:\"user_zip\";s:1:\"1\";s:21:\"user_info_field_group\";s:1:\"1\";s:3:\"req\";s:1:\"0\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:17:\"calc_auto_include\";s:1:\"0\";s:11:\"calc_option\";s:1:\"0\";s:11:\"conditional\";s:0:\"\";}','Zip / Post Code');
INSERT INTO `ogdch_ninja_forms_fav_fields` VALUES (13,0,'_country',0,'a:10:{s:5:\"label\";s:7:\"Country\";s:9:\"label_pos\";s:5:\"above\";s:13:\"default_value\";s:2:\"US\";s:21:\"user_info_field_group\";s:1:\"1\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:17:\"calc_auto_include\";s:1:\"0\";s:11:\"calc_option\";s:1:\"0\";s:11:\"conditional\";s:0:\"\";}','Country');
INSERT INTO `ogdch_ninja_forms_fav_fields` VALUES (14,0,'_text',0,'a:25:{s:5:\"label\";s:5:\"Email\";s:9:\"label_pos\";s:5:\"above\";s:13:\"default_value\";s:0:\"\";s:4:\"mask\";s:0:\"\";s:10:\"datepicker\";s:1:\"0\";s:5:\"email\";s:1:\"1\";s:10:\"send_email\";s:1:\"0\";s:10:\"from_email\";s:1:\"0\";s:10:\"first_name\";s:1:\"0\";s:9:\"last_name\";s:1:\"0\";s:9:\"from_name\";s:1:\"0\";s:14:\"user_address_1\";s:1:\"0\";s:14:\"user_address_2\";s:1:\"0\";s:9:\"user_city\";s:1:\"0\";s:8:\"user_zip\";s:1:\"0\";s:10:\"user_phone\";s:1:\"0\";s:10:\"user_email\";s:1:\"1\";s:21:\"user_info_field_group\";s:1:\"1\";s:3:\"req\";s:1:\"0\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:17:\"calc_auto_include\";s:1:\"0\";s:11:\"calc_option\";s:1:\"0\";s:11:\"conditional\";s:0:\"\";}','Email');
INSERT INTO `ogdch_ninja_forms_fav_fields` VALUES (15,0,'_text',0,'a:25:{s:5:\"label\";s:5:\"Phone\";s:9:\"label_pos\";s:5:\"above\";s:13:\"default_value\";s:0:\"\";s:4:\"mask\";s:14:\"(999) 999-9999\";s:10:\"datepicker\";s:1:\"0\";s:5:\"email\";s:1:\"0\";s:10:\"send_email\";s:1:\"0\";s:10:\"from_email\";s:1:\"0\";s:10:\"first_name\";s:1:\"0\";s:9:\"last_name\";s:1:\"0\";s:9:\"from_name\";s:1:\"0\";s:14:\"user_address_1\";s:1:\"0\";s:14:\"user_address_2\";s:1:\"0\";s:9:\"user_city\";s:1:\"0\";s:8:\"user_zip\";s:1:\"0\";s:10:\"user_phone\";s:1:\"1\";s:10:\"user_email\";s:1:\"0\";s:21:\"user_info_field_group\";s:1:\"1\";s:3:\"req\";s:1:\"0\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:17:\"calc_auto_include\";s:1:\"0\";s:11:\"calc_option\";s:1:\"0\";s:11:\"conditional\";s:0:\"\";}','Phone');
INSERT INTO `ogdch_ninja_forms_fav_fields` VALUES (16,0,'_calc',0,'a:20:{s:9:\"calc_name\";s:9:\"sub_total\";s:13:\"default_value\";s:0:\"\";s:17:\"calc_display_type\";s:4:\"text\";s:5:\"label\";s:9:\"Sub Total\";s:9:\"label_pos\";s:5:\"above\";s:26:\"calc_display_text_disabled\";s:1:\"1\";s:17:\"calc_display_html\";s:26:\"<p>[ninja_forms_calc]</p>\n\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:11:\"calc_method\";s:4:\"auto\";s:4:\"calc\";s:0:\"\";s:7:\"calc_eq\";s:0:\"\";s:19:\"payment_field_group\";s:1:\"1\";s:13:\"payment_total\";s:1:\"0\";s:17:\"payment_sub_total\";s:1:\"1\";s:11:\"calc_places\";s:1:\"2\";s:17:\"calc_auto_include\";s:1:\"0\";s:11:\"calc_option\";s:1:\"0\";s:11:\"conditional\";s:0:\"\";}','Sub Total');
INSERT INTO `ogdch_ninja_forms_fav_fields` VALUES (17,0,'_calc',0,'a:20:{s:9:\"calc_name\";s:5:\"total\";s:13:\"default_value\";s:0:\"\";s:17:\"calc_display_type\";s:4:\"text\";s:5:\"label\";s:5:\"Total\";s:9:\"label_pos\";s:5:\"above\";s:26:\"calc_display_text_disabled\";s:1:\"1\";s:17:\"calc_display_html\";s:26:\"<p>[ninja_forms_calc]</p>\n\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:11:\"calc_method\";s:4:\"auto\";s:4:\"calc\";a:5:{i:0;a:2:{s:2:\"op\";s:3:\"add\";s:5:\"field\";s:2:\"70\";}i:1;a:2:{s:2:\"op\";s:3:\"add\";s:5:\"field\";s:2:\"69\";}i:2;a:2:{s:2:\"op\";s:3:\"add\";s:5:\"field\";s:2:\"15\";}i:3;a:2:{s:2:\"op\";s:3:\"add\";s:5:\"field\";s:2:\"61\";}i:4;a:2:{s:2:\"op\";s:3:\"add\";s:5:\"field\";s:2:\"70\";}}s:7:\"calc_eq\";s:5:\"5 + 5\";s:19:\"payment_field_group\";s:1:\"1\";s:13:\"payment_total\";s:1:\"1\";s:17:\"payment_sub_total\";s:1:\"0\";s:11:\"calc_places\";s:1:\"2\";s:17:\"calc_auto_include\";s:1:\"0\";s:11:\"calc_option\";s:1:\"0\";s:11:\"conditional\";s:0:\"\";}','Total');
INSERT INTO `ogdch_ninja_forms_fav_fields` VALUES (92,0,'_credit_card',0,'a:6:{s:5:\"label\";s:11:\"Credit Card\";s:19:\"payment_field_group\";s:1:\"1\";s:3:\"req\";s:1:\"0\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:11:\"conditional\";s:0:\"\";}','Credit Card');
/*!40000 ALTER TABLE `ogdch_ninja_forms_fav_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ogdch_ninja_forms_fields`
--

DROP TABLE IF EXISTS `ogdch_ninja_forms_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ogdch_ninja_forms_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  `data` longtext NOT NULL,
  `fav_id` int(11) DEFAULT NULL,
  `def_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogdch_ninja_forms_fields`
--

LOCK TABLES `ogdch_ninja_forms_fields` WRITE;
/*!40000 ALTER TABLE `ogdch_ninja_forms_fields` DISABLE KEYS */;
INSERT INTO `ogdch_ninja_forms_fields` VALUES (1,1,'_text',1,'a:36:{s:5:\"label\";s:9:\"Last Name\";s:9:\"label_pos\";s:5:\"above\";s:13:\"default_value\";s:0:\"\";s:4:\"mask\";s:0:\"\";s:10:\"datepicker\";s:1:\"0\";s:5:\"email\";s:1:\"0\";s:10:\"first_name\";s:0:\"\";s:9:\"last_name\";s:0:\"\";s:9:\"from_name\";s:1:\"0\";s:14:\"user_address_1\";s:0:\"\";s:14:\"user_address_2\";s:0:\"\";s:9:\"user_city\";s:0:\"\";s:8:\"user_zip\";s:0:\"\";s:10:\"user_phone\";s:0:\"\";s:10:\"user_email\";s:0:\"\";s:21:\"user_info_field_group\";s:0:\"\";s:3:\"req\";s:1:\"1\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:9:\"show_desc\";s:1:\"0\";s:8:\"desc_pos\";s:4:\"none\";s:9:\"desc_text\";s:0:\"\";s:17:\"calc_auto_include\";s:1:\"0\";s:11:\"placeholder\";s:0:\"\";s:13:\"disable_input\";s:1:\"0\";s:11:\"input_limit\";s:0:\"\";s:16:\"input_limit_type\";s:4:\"char\";s:15:\"input_limit_msg\";s:0:\"\";s:10:\"user_state\";s:1:\"0\";s:16:\"autocomplete_off\";s:1:\"0\";s:8:\"num_sort\";s:1:\"0\";s:18:\"default_value_type\";s:0:\"\";s:11:\"admin_label\";s:0:\"\";s:26:\"user_info_field_group_name\";s:0:\"\";s:28:\"user_info_field_group_custom\";s:0:\"\";}',0,0);
INSERT INTO `ogdch_ninja_forms_fields` VALUES (2,1,'_text',3,'a:38:{s:5:\"label\";s:6:\"E-mail\";s:9:\"label_pos\";s:5:\"above\";s:13:\"default_value\";s:0:\"\";s:4:\"mask\";s:0:\"\";s:10:\"datepicker\";s:1:\"0\";s:5:\"email\";s:1:\"1\";s:10:\"first_name\";s:1:\"0\";s:9:\"last_name\";s:1:\"0\";s:9:\"from_name\";s:1:\"0\";s:14:\"user_address_1\";s:1:\"0\";s:14:\"user_address_2\";s:1:\"0\";s:9:\"user_city\";s:1:\"0\";s:8:\"user_zip\";s:1:\"0\";s:10:\"user_phone\";s:1:\"0\";s:10:\"user_email\";s:1:\"1\";s:21:\"user_info_field_group\";s:1:\"1\";s:3:\"req\";s:1:\"1\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:17:\"calc_auto_include\";s:1:\"0\";s:11:\"calc_option\";s:1:\"0\";s:11:\"conditional\";s:0:\"\";s:26:\"user_info_field_group_name\";s:0:\"\";s:28:\"user_info_field_group_custom\";s:0:\"\";s:9:\"show_desc\";s:1:\"0\";s:8:\"desc_pos\";s:4:\"none\";s:9:\"desc_text\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:13:\"disable_input\";s:1:\"0\";s:11:\"input_limit\";s:0:\"\";s:16:\"input_limit_type\";s:4:\"char\";s:15:\"input_limit_msg\";s:0:\"\";s:10:\"user_state\";s:1:\"0\";s:16:\"autocomplete_off\";s:1:\"0\";s:8:\"num_sort\";s:1:\"0\";s:18:\"default_value_type\";s:0:\"\";s:11:\"admin_label\";s:0:\"\";}',0,14);
INSERT INTO `ogdch_ninja_forms_fields` VALUES (3,1,'_textarea',5,'a:19:{s:5:\"label\";s:7:\"Message\";s:9:\"label_pos\";s:5:\"above\";s:13:\"default_value\";s:0:\"\";s:12:\"textarea_rte\";s:1:\"0\";s:14:\"textarea_media\";s:1:\"0\";s:18:\"disable_rte_mobile\";s:1:\"0\";s:3:\"req\";s:1:\"1\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:9:\"show_desc\";s:1:\"0\";s:8:\"desc_pos\";s:4:\"none\";s:9:\"desc_text\";s:0:\"\";s:17:\"calc_auto_include\";s:1:\"0\";s:11:\"input_limit\";s:0:\"\";s:16:\"input_limit_type\";s:4:\"char\";s:15:\"input_limit_msg\";s:0:\"\";s:8:\"num_sort\";s:1:\"0\";s:11:\"admin_label\";s:0:\"\";}',0,0);
INSERT INTO `ogdch_ninja_forms_fields` VALUES (5,1,'_submit',6,'a:7:{s:5:\"label\";s:4:\"Send\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:9:\"show_desc\";s:1:\"0\";s:8:\"desc_pos\";s:4:\"none\";s:9:\"desc_text\";s:0:\"\";}',0,0);
INSERT INTO `ogdch_ninja_forms_fields` VALUES (6,1,'_text',0,'a:35:{s:5:\"label\";s:10:\"First Name\";s:15:\"input_limit_msg\";s:17:\"character(s) left\";s:9:\"label_pos\";s:5:\"above\";s:11:\"placeholder\";s:0:\"\";s:10:\"first_name\";s:0:\"\";s:9:\"last_name\";s:0:\"\";s:14:\"user_address_1\";s:0:\"\";s:14:\"user_address_2\";s:0:\"\";s:9:\"user_city\";s:0:\"\";s:8:\"user_zip\";s:0:\"\";s:10:\"user_phone\";s:0:\"\";s:10:\"user_email\";s:0:\"\";s:21:\"user_info_field_group\";s:1:\"1\";s:5:\"email\";s:1:\"0\";s:13:\"disable_input\";s:1:\"0\";s:3:\"req\";s:1:\"1\";s:4:\"mask\";s:0:\"\";s:11:\"input_limit\";s:0:\"\";s:16:\"input_limit_type\";s:4:\"char\";s:17:\"calc_auto_include\";s:1:\"0\";s:10:\"datepicker\";s:1:\"0\";s:10:\"user_state\";s:1:\"0\";s:16:\"autocomplete_off\";s:1:\"0\";s:8:\"num_sort\";s:1:\"0\";s:18:\"default_value_type\";s:0:\"\";s:13:\"default_value\";s:0:\"\";s:11:\"admin_label\";s:0:\"\";s:26:\"user_info_field_group_name\";s:0:\"\";s:28:\"user_info_field_group_custom\";s:0:\"\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:9:\"show_desc\";s:1:\"0\";s:8:\"desc_pos\";s:4:\"none\";s:9:\"desc_text\";s:0:\"\";}',NULL,NULL);
INSERT INTO `ogdch_ninja_forms_fields` VALUES (7,1,'_text',2,'a:35:{s:5:\"label\";s:12:\"Organization\";s:15:\"input_limit_msg\";s:17:\"character(s) left\";s:9:\"label_pos\";s:5:\"above\";s:11:\"placeholder\";s:0:\"\";s:10:\"first_name\";s:0:\"\";s:9:\"last_name\";s:0:\"\";s:14:\"user_address_1\";s:0:\"\";s:14:\"user_address_2\";s:0:\"\";s:9:\"user_city\";s:0:\"\";s:8:\"user_zip\";s:0:\"\";s:10:\"user_phone\";s:0:\"\";s:10:\"user_email\";s:0:\"\";s:21:\"user_info_field_group\";s:1:\"1\";s:5:\"email\";s:1:\"0\";s:13:\"disable_input\";s:1:\"0\";s:3:\"req\";s:1:\"0\";s:4:\"mask\";s:0:\"\";s:11:\"input_limit\";s:0:\"\";s:16:\"input_limit_type\";s:4:\"char\";s:17:\"calc_auto_include\";s:1:\"0\";s:10:\"datepicker\";s:1:\"0\";s:10:\"user_state\";s:1:\"0\";s:16:\"autocomplete_off\";s:1:\"0\";s:8:\"num_sort\";s:1:\"0\";s:18:\"default_value_type\";s:0:\"\";s:13:\"default_value\";s:0:\"\";s:11:\"admin_label\";s:0:\"\";s:26:\"user_info_field_group_name\";s:0:\"\";s:28:\"user_info_field_group_custom\";s:0:\"\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:9:\"show_desc\";s:1:\"0\";s:8:\"desc_pos\";s:4:\"none\";s:9:\"desc_text\";s:0:\"\";}',NULL,NULL);
INSERT INTO `ogdch_ninja_forms_fields` VALUES (8,1,'_list',4,'a:19:{s:5:\"label\";s:7:\"Subject\";s:15:\"input_limit_msg\";s:17:\"character(s) left\";s:9:\"label_pos\";s:5:\"above\";s:9:\"list_type\";s:8:\"dropdown\";s:10:\"multi_size\";s:1:\"5\";s:15:\"list_show_value\";s:1:\"0\";s:4:\"list\";a:1:{s:7:\"options\";a:3:{i:0;a:4:{s:5:\"label\";s:25:\"I have a general question\";s:5:\"value\";s:0:\"\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"1\";}i:1;a:4:{s:5:\"label\";s:31:\"I have developed an application\";s:5:\"value\";s:0:\"\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:2;a:4:{s:5:\"label\";s:28:\"I would like to publish data\";s:5:\"value\";s:0:\"\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}}}s:21:\"user_info_field_group\";s:0:\"\";s:3:\"req\";s:1:\"1\";s:17:\"calc_auto_include\";s:1:\"0\";s:10:\"user_state\";s:1:\"0\";s:8:\"num_sort\";s:1:\"0\";s:11:\"admin_label\";s:0:\"\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:9:\"show_desc\";s:1:\"0\";s:8:\"desc_pos\";s:4:\"none\";s:9:\"desc_text\";s:0:\"\";}',NULL,NULL);
INSERT INTO `ogdch_ninja_forms_fields` VALUES (9,5,'_text',0,'a:35:{s:5:\"label\";s:7:\"Vorname\";s:15:\"input_limit_msg\";s:17:\"character(s) left\";s:9:\"label_pos\";s:5:\"above\";s:11:\"placeholder\";s:0:\"\";s:10:\"first_name\";s:0:\"\";s:9:\"last_name\";s:0:\"\";s:14:\"user_address_1\";s:0:\"\";s:14:\"user_address_2\";s:0:\"\";s:9:\"user_city\";s:0:\"\";s:8:\"user_zip\";s:0:\"\";s:10:\"user_phone\";s:0:\"\";s:10:\"user_email\";s:0:\"\";s:21:\"user_info_field_group\";s:1:\"1\";s:5:\"email\";s:1:\"0\";s:13:\"disable_input\";s:1:\"0\";s:3:\"req\";s:1:\"1\";s:4:\"mask\";s:0:\"\";s:11:\"input_limit\";s:0:\"\";s:16:\"input_limit_type\";s:4:\"char\";s:17:\"calc_auto_include\";s:1:\"0\";s:10:\"datepicker\";s:1:\"0\";s:10:\"user_state\";s:1:\"0\";s:16:\"autocomplete_off\";s:1:\"0\";s:8:\"num_sort\";s:1:\"0\";s:18:\"default_value_type\";s:0:\"\";s:13:\"default_value\";s:0:\"\";s:11:\"admin_label\";s:0:\"\";s:26:\"user_info_field_group_name\";s:0:\"\";s:28:\"user_info_field_group_custom\";s:0:\"\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:9:\"show_desc\";s:1:\"0\";s:8:\"desc_pos\";s:4:\"none\";s:9:\"desc_text\";s:0:\"\";}',0,0);
INSERT INTO `ogdch_ninja_forms_fields` VALUES (10,5,'_text',1,'a:36:{s:5:\"label\";s:4:\"Name\";s:9:\"label_pos\";s:5:\"above\";s:13:\"default_value\";s:0:\"\";s:4:\"mask\";s:0:\"\";s:10:\"datepicker\";s:1:\"0\";s:5:\"email\";s:1:\"0\";s:10:\"first_name\";s:0:\"\";s:9:\"last_name\";s:0:\"\";s:9:\"from_name\";s:1:\"0\";s:14:\"user_address_1\";s:0:\"\";s:14:\"user_address_2\";s:0:\"\";s:9:\"user_city\";s:0:\"\";s:8:\"user_zip\";s:0:\"\";s:10:\"user_phone\";s:0:\"\";s:10:\"user_email\";s:0:\"\";s:21:\"user_info_field_group\";s:0:\"\";s:3:\"req\";s:1:\"1\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:9:\"show_desc\";s:1:\"0\";s:8:\"desc_pos\";s:4:\"none\";s:9:\"desc_text\";s:0:\"\";s:17:\"calc_auto_include\";s:1:\"0\";s:11:\"placeholder\";s:0:\"\";s:13:\"disable_input\";s:1:\"0\";s:11:\"input_limit\";s:0:\"\";s:16:\"input_limit_type\";s:4:\"char\";s:15:\"input_limit_msg\";s:0:\"\";s:10:\"user_state\";s:1:\"0\";s:16:\"autocomplete_off\";s:1:\"0\";s:8:\"num_sort\";s:1:\"0\";s:18:\"default_value_type\";s:0:\"\";s:11:\"admin_label\";s:0:\"\";s:26:\"user_info_field_group_name\";s:0:\"\";s:28:\"user_info_field_group_custom\";s:0:\"\";}',0,0);
INSERT INTO `ogdch_ninja_forms_fields` VALUES (11,5,'_text',2,'a:35:{s:5:\"label\";s:12:\"Organisation\";s:15:\"input_limit_msg\";s:17:\"character(s) left\";s:9:\"label_pos\";s:5:\"above\";s:11:\"placeholder\";s:0:\"\";s:10:\"first_name\";s:0:\"\";s:9:\"last_name\";s:0:\"\";s:14:\"user_address_1\";s:0:\"\";s:14:\"user_address_2\";s:0:\"\";s:9:\"user_city\";s:0:\"\";s:8:\"user_zip\";s:0:\"\";s:10:\"user_phone\";s:0:\"\";s:10:\"user_email\";s:0:\"\";s:21:\"user_info_field_group\";s:1:\"1\";s:5:\"email\";s:1:\"0\";s:13:\"disable_input\";s:1:\"0\";s:3:\"req\";s:1:\"0\";s:4:\"mask\";s:0:\"\";s:11:\"input_limit\";s:0:\"\";s:16:\"input_limit_type\";s:4:\"char\";s:17:\"calc_auto_include\";s:1:\"0\";s:10:\"datepicker\";s:1:\"0\";s:10:\"user_state\";s:1:\"0\";s:16:\"autocomplete_off\";s:1:\"0\";s:8:\"num_sort\";s:1:\"0\";s:18:\"default_value_type\";s:0:\"\";s:13:\"default_value\";s:0:\"\";s:11:\"admin_label\";s:0:\"\";s:26:\"user_info_field_group_name\";s:0:\"\";s:28:\"user_info_field_group_custom\";s:0:\"\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:9:\"show_desc\";s:1:\"0\";s:8:\"desc_pos\";s:4:\"none\";s:9:\"desc_text\";s:0:\"\";}',0,0);
INSERT INTO `ogdch_ninja_forms_fields` VALUES (12,5,'_text',3,'a:38:{s:5:\"label\";s:6:\"E-Mail\";s:9:\"label_pos\";s:5:\"above\";s:13:\"default_value\";s:0:\"\";s:4:\"mask\";s:0:\"\";s:10:\"datepicker\";s:1:\"0\";s:5:\"email\";s:1:\"1\";s:10:\"first_name\";s:1:\"0\";s:9:\"last_name\";s:1:\"0\";s:9:\"from_name\";s:1:\"0\";s:14:\"user_address_1\";s:1:\"0\";s:14:\"user_address_2\";s:1:\"0\";s:9:\"user_city\";s:1:\"0\";s:8:\"user_zip\";s:1:\"0\";s:10:\"user_phone\";s:1:\"0\";s:10:\"user_email\";s:1:\"1\";s:21:\"user_info_field_group\";s:1:\"1\";s:3:\"req\";s:1:\"1\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:17:\"calc_auto_include\";s:1:\"0\";s:11:\"calc_option\";s:1:\"0\";s:11:\"conditional\";s:0:\"\";s:26:\"user_info_field_group_name\";s:0:\"\";s:28:\"user_info_field_group_custom\";s:0:\"\";s:9:\"show_desc\";s:1:\"0\";s:8:\"desc_pos\";s:4:\"none\";s:9:\"desc_text\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:13:\"disable_input\";s:1:\"0\";s:11:\"input_limit\";s:0:\"\";s:16:\"input_limit_type\";s:4:\"char\";s:15:\"input_limit_msg\";s:0:\"\";s:10:\"user_state\";s:1:\"0\";s:16:\"autocomplete_off\";s:1:\"0\";s:8:\"num_sort\";s:1:\"0\";s:18:\"default_value_type\";s:0:\"\";s:11:\"admin_label\";s:0:\"\";}',0,14);
INSERT INTO `ogdch_ninja_forms_fields` VALUES (13,5,'_list',4,'a:19:{s:5:\"label\";s:7:\"Betreff\";s:15:\"input_limit_msg\";s:17:\"character(s) left\";s:9:\"label_pos\";s:5:\"above\";s:9:\"list_type\";s:8:\"dropdown\";s:10:\"multi_size\";s:1:\"5\";s:15:\"list_show_value\";s:1:\"0\";s:4:\"list\";a:1:{s:7:\"options\";a:3:{i:0;a:4:{s:5:\"label\";s:30:\"Ich habe eine allgemeine Frage\";s:5:\"value\";s:0:\"\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"1\";}i:1;a:4:{s:5:\"label\";s:34:\"Ich habe eine Anwendung entwickelt\";s:5:\"value\";s:0:\"\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:2;a:4:{s:5:\"label\";s:29:\"Ich möchte Daten publizieren\";s:5:\"value\";s:0:\"\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}}}s:21:\"user_info_field_group\";s:0:\"\";s:3:\"req\";s:1:\"1\";s:17:\"calc_auto_include\";s:1:\"0\";s:10:\"user_state\";s:1:\"0\";s:8:\"num_sort\";s:1:\"0\";s:11:\"admin_label\";s:0:\"\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:9:\"show_desc\";s:1:\"0\";s:8:\"desc_pos\";s:4:\"none\";s:9:\"desc_text\";s:0:\"\";}',0,0);
INSERT INTO `ogdch_ninja_forms_fields` VALUES (14,5,'_textarea',5,'a:19:{s:5:\"label\";s:10:\"Mitteilung\";s:9:\"label_pos\";s:5:\"above\";s:13:\"default_value\";s:0:\"\";s:12:\"textarea_rte\";s:1:\"0\";s:14:\"textarea_media\";s:1:\"0\";s:18:\"disable_rte_mobile\";s:1:\"0\";s:3:\"req\";s:1:\"1\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:9:\"show_desc\";s:1:\"0\";s:8:\"desc_pos\";s:4:\"none\";s:9:\"desc_text\";s:0:\"\";s:17:\"calc_auto_include\";s:1:\"0\";s:11:\"input_limit\";s:0:\"\";s:16:\"input_limit_type\";s:4:\"char\";s:15:\"input_limit_msg\";s:0:\"\";s:8:\"num_sort\";s:1:\"0\";s:11:\"admin_label\";s:0:\"\";}',0,0);
INSERT INTO `ogdch_ninja_forms_fields` VALUES (15,5,'_submit',6,'a:7:{s:5:\"label\";s:6:\"Senden\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:9:\"show_desc\";s:1:\"0\";s:8:\"desc_pos\";s:4:\"none\";s:9:\"desc_text\";s:0:\"\";}',0,0);
/*!40000 ALTER TABLE `ogdch_ninja_forms_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ogdch_oauth_access_tokens`
--

DROP TABLE IF EXISTS `ogdch_oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ogdch_oauth_access_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `access_token` varchar(4000) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogdch_oauth_access_tokens`
--

LOCK TABLES `ogdch_oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `ogdch_oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `ogdch_oauth_access_tokens` VALUES (1,'nz1ca3wps858dhq3k5f4oxzbqwxrhau6pp6dbdny','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-09 15:21:14','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (2,'hch9k18q4ppkp3nipz2husqtyrzxk5nnxg30ctei','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-09 15:21:18','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (3,'1spceplfjwbfqkp0itzdnsr0yw5na6znd1dhfgqq','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-09 15:21:21','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (4,'41annicmy6vtzb6ubtpl48liroaklpgimfij8l4j','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-09 15:21:22','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (5,'k8iqzxed7osqnjtvvxed0tol1bigrhyumedywnuy','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-09 15:21:23','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (6,'lgyklnr4pajagvfi1qanavrbfdyowq9nyo1bycrm','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-09 15:21:23','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (7,'japzyzlowtw7rehlcp1hesv73obykhwjez133kks','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-09 15:21:24','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (8,'nmkxzpdadn1ahdn3llk4xvaywq71foffaobof2lv','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-09 15:21:41','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (9,'tn7r4omalqiennbwsjybt4hlke7ryw6q0gi8sgzf','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-09 15:21:58','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (10,'mgdnlccyqjqdydxgriqf0rpnplk4nij7xbkn1ror','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-09 15:22:32','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (11,'lkpfmqfzxu8zcdzouhlfcovv69pwcjjtdajjpi8o','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-09 15:23:07','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (12,'irnjesjmad3moi23p7uvfrczoo5easzmadjs77hd','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-09 15:23:59','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (13,'1lmswbptarqni3c5yw8wajt7dvjppx89dawfnhip','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-09 15:24:07','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (14,'ifi70lcof17xmwpguc4cu92zalcxjveklv4l6frf','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-09 15:24:47','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (15,'h0bxuuk84cbztuklidbeizlwlwpjvf37hpav63ii','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-09 15:25:56','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (16,'jcyayxtnsou6k60favl2q4dfenga0gqbgss5fs76','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-09 15:26:00','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (17,'bfek5btlq0u41slnq9we8wlwh6ckwyep80orvleu','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-09 15:26:11','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (18,'y9jpws9tjql2xjgvhy7ciw0tfpobdvxgmivvapwq','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-09 15:28:07','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (19,'qcze83gfw1p4fqezpwfbgi1b1gezdu4voyiaexmv','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-10 07:42:17','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (20,'dnxq7smlqoksfvxi8i6mscwqydtyb5dwmub9fa4r','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-10 07:48:33','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (21,'qi8whz2weoyjcows0dyxrmsh8p6ctvcjnyl4a8zy','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-10 07:56:08','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (22,'kcs601tslxsizfafn0qjf5aij01uuxpic1b8bi70','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-10 07:56:18','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (23,'kpf6ekjtho5vbj9zouundk2rfjfvy0u0o3c2ooih','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-10 07:59:31','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (24,'by1zofonq8vyry0zrpehofml4totrgskwv1wpxrv','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-10 07:59:47','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (25,'50teg5032calijwpje4ftij0udtx6gvjl703day3','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-10 07:59:54','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (26,'rlitwmhq3s62rzxs0jk7tj5vrueqvm9dizlhd64e','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-10 08:03:31','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (27,'yhrqxozvkpuf5qptewjiojj0yjzi9dw0caldzdla','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-10 08:05:15','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (28,'i9acsimnmnibpvkyg5cxb2isbmb6aefmb6perqf8','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-10 08:11:18','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (29,'mthkuni6mnagwhtszenqephmdsdvybcbjshtibyf','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-10 08:14:33','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (30,'hrcxkdkqqeaqh86917t4npqg6pafwek5tynha9hw','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-10 08:16:20','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (31,'tq43dnvsgr4erdztil29p47ga57codyjxa8bor1f','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-10 08:17:35','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (32,'w1fzpn55t0jxpseclgivbdr0olamtzdrjt0qmtwc','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-10 08:20:19','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (33,'do1x1c4ld4lhzqd5gleqwfmcsfujottygapazjmk','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-10 08:25:12','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (34,'u0oatojjfneaay9rpsdhysmc5eqkdzlyd5w9uxxr','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-10 08:29:18','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (35,'8imaxpxpohkgwh91xpbcqnsrlhwrs8x1jfkph6pm','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-10 08:29:49','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (36,'ehxl7f2eehcdks7kwnmj7lkx1mg0dcqirdeufcvz','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-10 08:38:42','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (37,'5pyt9q68lgb0u7eurfujqq2pwzgito2qpjkmxfgh','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-10 08:39:12','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (38,'eoftolaeunvmz3t2vuddvkuzzjzmw2nevo9jlfsf','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-10 08:42:15','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (39,'qaolg7airmosy3bejb00i0lsvvwbuhkocovvzzgv','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-10 08:42:56','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (40,'llpe0nbdhadrbfjfsjv3vxmlbqetzuxiryo0bdzv','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-10 08:48:28','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (41,'qis6bn3xtwf4umndsqfqk8gliy8hfjvgpd85iinj','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-10 08:55:23','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (42,'qfcdsugbf3i5lwejhedsvjitcyz3s4iotalut5r5','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-10 16:12:12','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (43,'khfx1vv60oyec9b6pmllkranpvzxt91huh4winmj','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-10 16:12:35','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (44,'jjqplnme1fvexlupz9lewo9toa8iqaubgo8ikbur','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-11 12:13:52','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (45,'72mvpt8mvvu4niaszp8ukycylpasbi5frxuzdwzq','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-14 08:08:09','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (46,'9jal5e8ab6jots8bhztmf4zwaz08j9k2jrbtlbc5','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-14 13:19:48','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (47,'lhxbozzthyzzwu8efl3ilisy2cmkpm7sonanzdyg','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-14 13:20:41','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (48,'d1grako81vkghnn9802immegwdtyoqlbtv4utoak','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-14 15:01:30','basic');
INSERT INTO `ogdch_oauth_access_tokens` VALUES (49,'cbu6uujw5wka6zrywc0reaapxqc2zvoq4emyxyf6','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-15 14:39:38','basic');
/*!40000 ALTER TABLE `ogdch_oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ogdch_oauth_authorization_codes`
--

DROP TABLE IF EXISTS `ogdch_oauth_authorization_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ogdch_oauth_authorization_codes` (
  `authorization_code` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  `redirect_uri` varchar(2000) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(4000) DEFAULT NULL,
  `id_token` varchar(3000) DEFAULT NULL,
  PRIMARY KEY (`authorization_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogdch_oauth_authorization_codes`
--

LOCK TABLES `ogdch_oauth_authorization_codes` WRITE;
/*!40000 ALTER TABLE `ogdch_oauth_authorization_codes` DISABLE KEYS */;
INSERT INTO `ogdch_oauth_authorization_codes` VALUES ('eidwortb7puuxwzxon28huicwysqdi0z8qfxowi8','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','http://ogdch.dev/oauth2/callback','2016-06-09 08:36:36','basic',NULL);
INSERT INTO `ogdch_oauth_authorization_codes` VALUES ('qznmmsydaqyoljmcjdigzk1mmc1kzj1m6emqqus4','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','http://ogdch.dev/oauth2/callback','2016-06-09 08:38:39','basic',NULL);
INSERT INTO `ogdch_oauth_authorization_codes` VALUES ('ulht9irpx3jtchkjeqwypjhqmsokemqdfhcvr0gr','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','http://ogdch.dev/oauth2/callback','2016-06-08 15:19:16','basic',NULL);
/*!40000 ALTER TABLE `ogdch_oauth_authorization_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ogdch_oauth_clients`
--

DROP TABLE IF EXISTS `ogdch_oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ogdch_oauth_clients` (
  `client_id` varchar(80) NOT NULL,
  `client_secret` varchar(80) NOT NULL,
  `redirect_uri` varchar(2000) DEFAULT NULL,
  `grant_types` varchar(80) DEFAULT NULL,
  `scope` varchar(4000) DEFAULT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  `name` varchar(80) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogdch_oauth_clients`
--

LOCK TABLES `ogdch_oauth_clients` WRITE;
/*!40000 ALTER TABLE `ogdch_oauth_clients` DISABLE KEYS */;
INSERT INTO `ogdch_oauth_clients` VALUES ('L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','rMBKjvwAPrWCKsRQ0ObY8gSWepIW4K','http://ogdch.dev/oauth2/callback',NULL,NULL,NULL,'ckan','');
/*!40000 ALTER TABLE `ogdch_oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ogdch_oauth_jwt`
--

DROP TABLE IF EXISTS `ogdch_oauth_jwt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ogdch_oauth_jwt` (
  `client_id` varchar(80) NOT NULL,
  `subject` varchar(80) DEFAULT NULL,
  `public_key` varchar(2000) NOT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogdch_oauth_jwt`
--

LOCK TABLES `ogdch_oauth_jwt` WRITE;
/*!40000 ALTER TABLE `ogdch_oauth_jwt` DISABLE KEYS */;
/*!40000 ALTER TABLE `ogdch_oauth_jwt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ogdch_oauth_public_keys`
--

DROP TABLE IF EXISTS `ogdch_oauth_public_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ogdch_oauth_public_keys` (
  `client_id` varchar(80) NOT NULL DEFAULT '',
  `public_key` varchar(2000) DEFAULT NULL,
  `private_key` varchar(2000) DEFAULT NULL,
  `encryption_algorithm` varchar(100) DEFAULT 'RS256',
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogdch_oauth_public_keys`
--

LOCK TABLES `ogdch_oauth_public_keys` WRITE;
/*!40000 ALTER TABLE `ogdch_oauth_public_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `ogdch_oauth_public_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ogdch_oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `ogdch_oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ogdch_oauth_refresh_tokens` (
  `refresh_token` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`refresh_token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogdch_oauth_refresh_tokens`
--

LOCK TABLES `ogdch_oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `ogdch_oauth_refresh_tokens` DISABLE KEYS */;
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('03cdyuxamlvsfqo0pdv45gcmkjmxptkkljm3iika','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-19 08:42:15','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('27n6vayqwmscnqodxq9lfdbdhu5umdgz3ihbsd5e','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-19 07:59:31','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('29ztnoi00xnqq51tbrsxscuznyxvlrihtzqoesso','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-19 08:38:42','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('79mhrmzmu0ggjtwzsmjqnaf0xgf5z8kn5oarfqvb','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-18 15:25:56','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('8jtysf4zllajfneg0dan6dhf4dcukbhy2nwdbmms','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-23 15:01:30','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('9j2d7o80ltajryz8xjtxqre5qckp7a89yhir7bpj','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-19 08:48:28','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('9nswvqliyqvxkayheyblj6gqkb39gyxtoghdkwtr','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-19 07:59:54','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('9xxedkqmwj40tbu9ree9pddymag2pxnuehd2afsc','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-18 15:21:23','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('9zag6zmn1xrujo5eiadxtrxqdsrzdh5yeyfu0dsq','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-19 08:55:23','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('abu7p6sjbfqgojijhmlavujsdardpaur1r5a3jdp','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-18 15:26:11','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('avu0tnmuvjwd98jn9pj7uaqmdvuaqxw8kxbjd0em','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-20 12:13:52','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('bk1wzaugv2snveahpgnrqrkzkmmvmhos15jltlzu','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-18 15:23:59','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('cklabvw4izfzyfumhxss9c6xszmxha6dfbznlpep','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-18 15:21:41','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('cmv4dy7jimy6t6tuaislvzawoastnpk7ghlfjepl','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-18 15:21:14','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('cuezvzlb7ra83mcffvu3mi4mw1eziiksljfsuw4p','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-23 13:20:41','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('d3psg1jtqg8drq8yedpjwmglatt7tl7wq6dauvbr','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-18 15:21:24','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('dh1eajr5do5synzg7irt9gip3erswrfgsryzumiu','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-18 15:21:22','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('dl8rwe6luxkg3pdxtgsdisxkztobujl1bpj1djbj','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-19 07:48:33','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('dtbbohj8hydptrzmuy2lv5blzyzqkmrm62rir5qe','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-19 07:42:17','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('enewnjolwtsvaquh29ffggqb8jds6po5rezkdzh1','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-24 14:39:38','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('fgffbxtwwxqcody3kjub5jnlywpdono5pbe9z6vh','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-23 08:08:09','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('ftdivu2ml5xjq5dw7l9jwguoidbuhdjf4zhbbiqq','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-18 15:21:18','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('gnigdfjueivbemqkw5jijnze8x3kzblxk5uff5j6','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-19 08:16:20','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('hbqmbcodd9to9crk8s9gkca8v4otcugofnasvhvy','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-19 08:29:18','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('hksy29dt7mqnb6pm9lioqukfxbvci0profsy04r0','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-19 08:05:15','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('j6ufiz03sqirhs8iut12tyn76vm4r7kfnfxqfivm','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-18 15:24:47','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('jrsc5dbmmps3n9poayfm1gcn1vhvresrtpkiaunq','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-19 08:11:18','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('js6sndkuyztnrkvfa1jxjdaznms9raf4xoe9kpbj','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-19 07:59:47','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('k57cxvyuf326n3nal1igwmxtav4tmjh1y4xx1wbx','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-19 08:14:33','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('ktlqk1ervirkipdgeup1rjtpx9ybcythy27ojmcb','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-19 08:25:12','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('l4pj1bxdkziwqmhmyot23yhaqqc6xymrhzcm2r3o','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-18 15:21:21','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('ljcfpra4wjc6yoq1ah14l6rw6dnwjh72h1gjd64n','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-19 08:29:49','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('m3no8jgkfy2vrqznzt6n9dyxksixnjt6vayw7bgv','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-19 07:56:08','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('m9cii2mop4grmnd5yyzz3hytrd6u9zb7bf119ic6','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-23 13:19:48','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('nh8z8h05tzumgylrwkzn1ultjy6obi2upv0fias2','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-19 08:42:56','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('okr6agdqmwxlubgwwjcv4uogck2xd2ix1plc39jg','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-19 07:56:18','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('pss6qrt6hucqyii89wq5lkitnen1jsnjwojjer0j','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-18 15:21:23','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('t0pvuq8lqn0vne4upx7ccmf11hywsggiaqazsmom','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-19 08:17:35','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('tlxz7fdh3mtphijb10pkkcxjd5bastbcpwryvy7k','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-18 15:22:32','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('tqsl7zdu4z0yynqtvyen3xzyov3jbrwfuwy3ti6e','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-19 08:20:19','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('ttjf6yce8lpxzohwbioqvbf2jf2fivaegiq3zo0q','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-19 16:12:12','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('uemnby3hjcspmcgtmtags4uzqm1gw2jzrgsxsepx','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-18 15:21:58','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('v0whybbrvcuexgdqtru0fjr8kpfsee5dfardjrhj','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-18 15:28:07','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('va50fm4bkoqfeaeestszflaiur3izspvtmum9ns3','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-18 15:23:07','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('x0zmxksnvwqx75h8e3hkgf0lz8rqrtvi9yo7eqay','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-18 15:26:00','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('x1f6thqe1eregwtblaztxbqqguvt30eve0r4uh4q','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-19 16:12:35','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('xaboveim2ha1smpad5xqfaje1mo8ys2c36o5tzq0','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-19 08:39:12','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('xpugbaz4g3rkwyvs1kdadgmbnqjedo9kb4edqntr','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-19 08:03:31','basic');
INSERT INTO `ogdch_oauth_refresh_tokens` VALUES ('yyryefchrifqqoomqpr0zas51k9wy6lr5yuihuhq','L9jxUMhjVlNivf6yWlXj4UNYwMHF1r','1','2016-06-18 15:24:07','basic');
/*!40000 ALTER TABLE `ogdch_oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ogdch_oauth_scopes`
--

DROP TABLE IF EXISTS `ogdch_oauth_scopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ogdch_oauth_scopes` (
  `scope` varchar(80) NOT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`scope`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogdch_oauth_scopes`
--

LOCK TABLES `ogdch_oauth_scopes` WRITE;
/*!40000 ALTER TABLE `ogdch_oauth_scopes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ogdch_oauth_scopes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ogdch_options`
--

DROP TABLE IF EXISTS `ogdch_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ogdch_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=845 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogdch_options`
--

LOCK TABLES `ogdch_options` WRITE;
/*!40000 ALTER TABLE `ogdch_options` DISABLE KEYS */;
INSERT INTO `ogdch_options` VALUES (1,'siteurl','http://ogdch.dev/cms','yes');
INSERT INTO `ogdch_options` VALUES (2,'home','http://ogdch.dev/cms','yes');
INSERT INTO `ogdch_options` VALUES (3,'blogname','opendata.swiss','yes');
INSERT INTO `ogdch_options` VALUES (4,'blogdescription','','yes');
INSERT INTO `ogdch_options` VALUES (5,'users_can_register','0','yes');
INSERT INTO `ogdch_options` VALUES (6,'admin_email','jazz@liip.ch','yes');
INSERT INTO `ogdch_options` VALUES (7,'start_of_week','1','yes');
INSERT INTO `ogdch_options` VALUES (8,'use_balanceTags','','yes');
INSERT INTO `ogdch_options` VALUES (9,'use_smilies','','yes');
INSERT INTO `ogdch_options` VALUES (10,'require_name_email','1','yes');
INSERT INTO `ogdch_options` VALUES (11,'comments_notify','','yes');
INSERT INTO `ogdch_options` VALUES (12,'posts_per_rss','10','yes');
INSERT INTO `ogdch_options` VALUES (13,'rss_use_excerpt','0','yes');
INSERT INTO `ogdch_options` VALUES (14,'mailserver_url','mail.example.com','yes');
INSERT INTO `ogdch_options` VALUES (15,'mailserver_login','login@example.com','yes');
INSERT INTO `ogdch_options` VALUES (16,'mailserver_pass','password','yes');
INSERT INTO `ogdch_options` VALUES (17,'mailserver_port','110','yes');
INSERT INTO `ogdch_options` VALUES (18,'default_category','15','yes');
INSERT INTO `ogdch_options` VALUES (19,'default_comment_status','open','yes');
INSERT INTO `ogdch_options` VALUES (20,'default_ping_status','open','yes');
INSERT INTO `ogdch_options` VALUES (21,'default_pingback_flag','','yes');
INSERT INTO `ogdch_options` VALUES (22,'posts_per_page','10','yes');
INSERT INTO `ogdch_options` VALUES (23,'date_format','j. F Y','yes');
INSERT INTO `ogdch_options` VALUES (24,'time_format','H:i','yes');
INSERT INTO `ogdch_options` VALUES (25,'links_updated_date_format','F j, Y g:i a','yes');
INSERT INTO `ogdch_options` VALUES (26,'comment_moderation','','yes');
INSERT INTO `ogdch_options` VALUES (27,'moderation_notify','','yes');
INSERT INTO `ogdch_options` VALUES (28,'permalink_structure','/%postname%/','yes');
INSERT INTO `ogdch_options` VALUES (29,'gzipcompression','0','yes');
INSERT INTO `ogdch_options` VALUES (30,'hack_file','0','yes');
INSERT INTO `ogdch_options` VALUES (31,'blog_charset','UTF-8','yes');
INSERT INTO `ogdch_options` VALUES (32,'moderation_keys','','no');
INSERT INTO `ogdch_options` VALUES (33,'active_plugins','a:11:{i:0;s:21:\"polylang/polylang.php\";i:1;s:47:\"bootstrap-ninja-forms/bootstrap-ninja-forms.php\";i:2;s:13:\"cmb2/init.php\";i:3;s:19:\"members/members.php\";i:4;s:27:\"ninja-forms/ninja-forms.php\";i:5;s:28:\"oauth2-provider/wp-oauth.php\";i:6;s:17:\"polylang-slug.php\";i:7;s:47:\"regenerate-thumbnails/regenerate-thumbnails.php\";i:8;s:51:\"rewrite-rules-inspector/rewrite-rules-inspector.php\";i:11;s:49:\"wp-custom-bulk-actions/wp-custom-bulk-actions.php\";i:12;s:29:\"wp-discourse/wp-discourse.php\";}','yes');
INSERT INTO `ogdch_options` VALUES (34,'category_base','','yes');
INSERT INTO `ogdch_options` VALUES (35,'ping_sites','http://rpc.pingomatic.com/','yes');
INSERT INTO `ogdch_options` VALUES (36,'advanced_edit','0','yes');
INSERT INTO `ogdch_options` VALUES (37,'comment_max_links','2','yes');
INSERT INTO `ogdch_options` VALUES (38,'gmt_offset','','yes');
INSERT INTO `ogdch_options` VALUES (39,'default_email_category','15','yes');
INSERT INTO `ogdch_options` VALUES (40,'recently_edited','','no');
INSERT INTO `ogdch_options` VALUES (41,'template','twentyfifteen','yes');
INSERT INTO `ogdch_options` VALUES (42,'stylesheet','twentyfifteen','yes');
INSERT INTO `ogdch_options` VALUES (43,'comment_whitelist','','yes');
INSERT INTO `ogdch_options` VALUES (44,'blacklist_keys','','no');
INSERT INTO `ogdch_options` VALUES (45,'comment_registration','','yes');
INSERT INTO `ogdch_options` VALUES (46,'html_type','text/html','yes');
INSERT INTO `ogdch_options` VALUES (47,'use_trackback','0','yes');
INSERT INTO `ogdch_options` VALUES (48,'default_role','content_manager','yes');
INSERT INTO `ogdch_options` VALUES (49,'db_version','33056','yes');
INSERT INTO `ogdch_options` VALUES (50,'uploads_use_yearmonth_folders','1','yes');
INSERT INTO `ogdch_options` VALUES (51,'upload_path','','yes');
INSERT INTO `ogdch_options` VALUES (52,'blog_public','1','yes');
INSERT INTO `ogdch_options` VALUES (53,'default_link_category','0','yes');
INSERT INTO `ogdch_options` VALUES (54,'show_on_front','posts','yes');
INSERT INTO `ogdch_options` VALUES (55,'tag_base','','yes');
INSERT INTO `ogdch_options` VALUES (56,'show_avatars','1','yes');
INSERT INTO `ogdch_options` VALUES (57,'avatar_rating','G','yes');
INSERT INTO `ogdch_options` VALUES (58,'upload_url_path','','yes');
INSERT INTO `ogdch_options` VALUES (59,'thumbnail_size_w','150','yes');
INSERT INTO `ogdch_options` VALUES (60,'thumbnail_size_h','150','yes');
INSERT INTO `ogdch_options` VALUES (61,'thumbnail_crop','1','yes');
INSERT INTO `ogdch_options` VALUES (62,'medium_size_w','300','yes');
INSERT INTO `ogdch_options` VALUES (63,'medium_size_h','300','yes');
INSERT INTO `ogdch_options` VALUES (64,'avatar_default','mystery','yes');
INSERT INTO `ogdch_options` VALUES (65,'large_size_w','1024','yes');
INSERT INTO `ogdch_options` VALUES (66,'large_size_h','1024','yes');
INSERT INTO `ogdch_options` VALUES (67,'image_default_link_type','file','yes');
INSERT INTO `ogdch_options` VALUES (68,'image_default_size','','yes');
INSERT INTO `ogdch_options` VALUES (69,'image_default_align','','yes');
INSERT INTO `ogdch_options` VALUES (70,'close_comments_for_old_posts','','yes');
INSERT INTO `ogdch_options` VALUES (71,'close_comments_days_old','14','yes');
INSERT INTO `ogdch_options` VALUES (72,'thread_comments','','yes');
INSERT INTO `ogdch_options` VALUES (73,'thread_comments_depth','5','yes');
INSERT INTO `ogdch_options` VALUES (74,'page_comments','','yes');
INSERT INTO `ogdch_options` VALUES (75,'comments_per_page','50','yes');
INSERT INTO `ogdch_options` VALUES (76,'default_comments_page','newest','yes');
INSERT INTO `ogdch_options` VALUES (77,'comment_order','asc','yes');
INSERT INTO `ogdch_options` VALUES (78,'sticky_posts','a:0:{}','yes');
INSERT INTO `ogdch_options` VALUES (79,'widget_categories','a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `ogdch_options` VALUES (80,'widget_text','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `ogdch_options` VALUES (81,'widget_rss','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `ogdch_options` VALUES (82,'uninstall_plugins','a:1:{s:38:\"ninja-forms/deprecated/ninja-forms.php\";s:21:\"ninja_forms_uninstall\";}','no');
INSERT INTO `ogdch_options` VALUES (83,'timezone_string','Europe/Zurich','yes');
INSERT INTO `ogdch_options` VALUES (85,'page_on_front','0','yes');
INSERT INTO `ogdch_options` VALUES (86,'default_post_format','0','yes');
INSERT INTO `ogdch_options` VALUES (87,'link_manager_enabled','0','yes');
INSERT INTO `ogdch_options` VALUES (88,'initial_db_version','32453','yes');
INSERT INTO `ogdch_options` VALUES (89,'ogdch_user_roles','a:8:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:141:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:9:\"add_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:10:\"list_roles\";b:1;s:12:\"create_roles\";b:1;s:12:\"delete_roles\";b:1;s:10:\"edit_roles\";b:1;s:16:\"restrict_content\";b:1;s:13:\"edit_datasets\";b:1;s:20:\"edit_others_datasets\";b:1;s:16:\"publish_datasets\";b:1;s:21:\"read_private_datasets\";b:1;s:15:\"delete_datasets\";b:1;s:23:\"delete_private_datasets\";b:1;s:25:\"delete_published_datasets\";b:1;s:22:\"delete_others_datasets\";b:1;s:21:\"edit_private_datasets\";b:1;s:23:\"edit_published_datasets\";b:1;s:15:\"create_datasets\";b:1;s:16:\"disable_datasets\";b:1;s:11:\"edit_groups\";b:1;s:18:\"edit_others_groups\";b:1;s:14:\"publish_groups\";b:1;s:19:\"read_private_groups\";b:1;s:13:\"delete_groups\";b:1;s:21:\"delete_private_groups\";b:1;s:23:\"delete_published_groups\";b:1;s:20:\"delete_others_groups\";b:1;s:19:\"edit_private_groups\";b:1;s:21:\"edit_published_groups\";b:1;s:13:\"create_groups\";b:1;s:18:\"edit_organisations\";b:1;s:25:\"edit_others_organisations\";b:1;s:21:\"publish_organisations\";b:1;s:26:\"read_private_organisations\";b:1;s:20:\"delete_organisations\";b:1;s:28:\"delete_private_organisations\";b:1;s:30:\"delete_published_organisations\";b:1;s:27:\"delete_others_organisations\";b:1;s:26:\"edit_private_organisations\";b:1;s:28:\"edit_published_organisations\";b:1;s:20:\"create_organisations\";b:1;s:9:\"edit_apps\";b:1;s:16:\"edit_others_apps\";b:1;s:12:\"publish_apps\";b:1;s:17:\"read_private_apps\";b:1;s:11:\"delete_apps\";b:1;s:19:\"delete_private_apps\";b:1;s:21:\"delete_published_apps\";b:1;s:18:\"delete_others_apps\";b:1;s:17:\"edit_private_apps\";b:1;s:19:\"edit_published_apps\";b:1;s:11:\"create_apps\";b:1;s:22:\"edit_user_organisation\";b:1;s:18:\"manage_frequencies\";b:1;s:16:\"edit_frequencies\";b:1;s:18:\"delete_frequencies\";b:1;s:18:\"assign_frequencies\";b:1;s:11:\"manage_tags\";b:1;s:9:\"edit_tags\";b:1;s:11:\"delete_tags\";b:1;s:11:\"assign_tags\";b:1;s:30:\"edit_data_of_all_organisations\";b:1;s:15:\"manage_keywords\";b:1;s:13:\"edit_keywords\";b:1;s:15:\"delete_keywords\";b:1;s:15:\"assign_keywords\";b:1;s:15:\"edit_harvesters\";b:1;s:22:\"edit_others_harvesters\";b:1;s:18:\"publish_harvesters\";b:1;s:23:\"read_private_harvesters\";b:1;s:17:\"delete_harvesters\";b:1;s:25:\"delete_private_harvesters\";b:1;s:27:\"delete_published_harvesters\";b:1;s:24:\"delete_others_harvesters\";b:1;s:23:\"edit_private_harvesters\";b:1;s:25:\"edit_published_harvesters\";b:1;s:17:\"create_harvesters\";b:1;s:17:\"manage_mediatypes\";b:1;s:15:\"edit_mediatypes\";b:1;s:17:\"delete_mediatypes\";b:1;s:17:\"assign_mediatypes\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:14:\"datenlieferant\";a:2:{s:4:\"name\";s:14:\"Datenlieferant\";s:12:\"capabilities\";a:10:{s:4:\"read\";b:1;s:12:\"upload_files\";b:1;s:15:\"create_datasets\";b:1;s:13:\"edit_datasets\";b:1;s:21:\"edit_private_datasets\";b:1;s:23:\"edit_published_datasets\";b:1;s:16:\"publish_datasets\";b:1;s:21:\"read_private_datasets\";b:1;s:15:\"assign_keywords\";b:1;s:10:\"edit_posts\";b:1;}}s:10:\"data_owner\";a:2:{s:4:\"name\";s:10:\"Data Owner\";s:12:\"capabilities\";a:20:{s:4:\"read\";b:1;s:12:\"upload_files\";b:1;s:15:\"create_datasets\";b:1;s:13:\"edit_datasets\";b:1;s:21:\"edit_private_datasets\";b:1;s:23:\"edit_published_datasets\";b:1;s:16:\"publish_datasets\";b:1;s:21:\"read_private_datasets\";b:1;s:18:\"edit_organisations\";b:1;s:26:\"edit_private_organisations\";b:1;s:28:\"edit_published_organisations\";b:1;s:26:\"read_private_organisations\";b:1;s:15:\"assign_keywords\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:10:\"list_users\";b:1;s:10:\"edit_users\";b:1;s:13:\"promote_users\";b:1;}}s:15:\"content_manager\";a:2:{s:4:\"name\";s:15:\"Content Manager\";s:12:\"capabilities\";a:28:{s:4:\"read\";b:1;s:12:\"upload_files\";b:1;s:18:\"edit_theme_options\";b:1;s:11:\"create_apps\";b:1;s:11:\"delete_apps\";b:1;s:18:\"delete_others_apps\";b:1;s:19:\"delete_private_apps\";b:1;s:21:\"delete_published_apps\";b:1;s:9:\"edit_apps\";b:1;s:16:\"edit_others_apps\";b:1;s:17:\"edit_private_apps\";b:1;s:19:\"edit_published_apps\";b:1;s:12:\"publish_apps\";b:1;s:17:\"read_private_apps\";b:1;s:19:\"delete_others_pages\";b:1;s:12:\"delete_pages\";b:1;s:20:\"delete_private_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:17:\"edit_others_pages\";b:1;s:10:\"edit_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:18:\"read_private_pages\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;}}}','yes');
INSERT INTO `ogdch_options` VALUES (90,'widget_search','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `ogdch_options` VALUES (91,'widget_recent-posts','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `ogdch_options` VALUES (92,'widget_recent-comments','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `ogdch_options` VALUES (93,'widget_archives','a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `ogdch_options` VALUES (94,'widget_meta','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `ogdch_options` VALUES (95,'sidebars_widgets','a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:13:\"array_version\";i:3;}','yes');
INSERT INTO `ogdch_options` VALUES (97,'cron','a:10:{i:1465983102;a:1:{s:19:\"wo_daily_tasks_hook\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1465992526;a:1:{s:24:\"ninja_forms_daily_action\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1465994581;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1465996482;a:1:{s:24:\"ninja_forms_daily_action\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1465997557;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1465997881;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1465999752;a:1:{s:29:\"wp_session_garbage_collection\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1466005699;a:1:{s:24:\"ninja_forms_daily_action\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1466020140;a:1:{s:20:\"wp_maybe_auto_update\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}s:7:\"version\";i:2;}','yes');
INSERT INTO `ogdch_options` VALUES (134,'db_upgraded','','yes');
INSERT INTO `ogdch_options` VALUES (142,'recently_activated','a:3:{s:32:\"wp-ckan-backend/ckan-backend.php\";i:1465822547;s:43:\"pt-wp-discourse-sso/pt-wp-discourse-sso.php\";i:1465809892;s:19:\"adminer/adminer.php\";i:1465396736;}','yes');
INSERT INTO `ogdch_options` VALUES (147,'members_db_version','2','yes');
INSERT INTO `ogdch_options` VALUES (148,'members_settings','a:8:{s:12:\"role_manager\";i:1;s:19:\"content_permissions\";i:0;s:25:\"content_permissions_error\";s:85:\"<p class=\"restricted\">Sorry, but you do not have permission to view this content.</p>\";s:17:\"login_form_widget\";i:0;s:12:\"users_widget\";i:0;s:12:\"private_blog\";i:0;s:12:\"private_feed\";i:0;s:18:\"private_feed_error\";s:80:\"<p class=\"restricted\">You must be logged into the site to view this content.</p>\";}','yes');
INSERT INTO `ogdch_options` VALUES (151,'polylang','a:14:{s:7:\"browser\";i:1;s:7:\"rewrite\";i:1;s:12:\"hide_default\";i:0;s:10:\"force_lang\";i:1;s:13:\"redirect_lang\";i:0;s:13:\"media_support\";i:0;s:4:\"sync\";a:11:{i:0;s:10:\"taxonomies\";i:1;s:9:\"post_meta\";i:2;s:14:\"comment_status\";i:3;s:11:\"ping_status\";i:4;s:12:\"sticky_posts\";i:5;s:9:\"post_date\";i:6;s:11:\"post_format\";i:7;s:11:\"post_parent\";i:8;s:17:\"_wp_page_template\";i:9;s:10:\"menu_order\";i:10;s:13:\"_thumbnail_id\";}s:10:\"post_types\";a:1:{i:0;s:3:\"app\";}s:10:\"taxonomies\";a:0:{}s:7:\"domains\";a:0:{}s:7:\"version\";s:5:\"1.9.2\";s:12:\"default_lang\";s:2:\"de\";s:9:\"nav_menus\";a:2:{s:5:\"ogdch\";a:1:{s:18:\"service_navigation\";a:0:{}}s:14:\"wp-ogdch-theme\";a:4:{s:15:\"main_navigation\";a:4:{s:2:\"de\";i:135;s:2:\"en\";i:136;s:2:\"it\";i:137;s:2:\"fr\";i:138;}s:16:\"about_navigation\";a:0:{}s:15:\"data_navigation\";a:0:{}s:20:\"developer_navigation\";a:0:{}}}s:16:\"previous_version\";s:6:\"1.7.12\";}','yes');
INSERT INTO `ogdch_options` VALUES (158,'category_children','a:0:{}','yes');
INSERT INTO `ogdch_options` VALUES (162,'widget_nav_menu','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `ogdch_options` VALUES (163,'widget_calendar','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `ogdch_options` VALUES (165,'widget_tag_cloud','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `ogdch_options` VALUES (166,'widget_pages','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `ogdch_options` VALUES (167,'widget_polylang','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `ogdch_options` VALUES (170,'_transient_pll_languages_list','a:4:{i:0;a:20:{s:7:\"term_id\";i:2;s:4:\"name\";s:7:\"Deutsch\";s:4:\"slug\";s:2:\"de\";s:10:\"term_group\";s:1:\"0\";s:16:\"term_taxonomy_id\";i:2;s:8:\"taxonomy\";s:8:\"language\";s:11:\"description\";s:5:\"de_CH\";s:6:\"parent\";s:1:\"0\";s:5:\"count\";i:2;s:10:\"tl_term_id\";i:3;s:19:\"tl_term_taxonomy_id\";i:3;s:8:\"tl_count\";i:1;s:6:\"locale\";R:9;s:6:\"is_rtl\";i:0;s:8:\"flag_url\";s:57:\"http://ogdch.dev/content/plugins/polylang/flags/de_CH.png\";s:4:\"flag\";s:558:\"<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAsAAAALCAIAAAAmzuBxAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAEBSURBVHjaYvzPgAD/UNkQBBBALCBedTWQ+P/vHyMjI4jx+zfDjx+Mf/4w//nzZ/ZsgAACq2D4///JU4a/fxkWLfr/H2Tof39/kDpJSaAZAAHEAtb9HyT99y9UGgh+//7/6zfD799AFQABxPAXaFll5b9///4CwZ+/QIN///7969evn0AQHf2egQEggMC2MDL+BwOoATAAcS9AAIFt+fEDLACGyCq+fgWqAAggFiBmBKrw9WX48+f/1q1QSXNzoFMYZWWBsgABBFIB9BXI5UDXwcGvX0AEcSlAAIFUMP3+A/QYSFF8AtAahp8/gLoZwNqAsgABxPgVKfj+oYYmBAEEGACuqcePp4nP0QAAAABJRU5ErkJggg==\" title=\"Deutsch\" alt=\"Deutsch\" />\";s:8:\"home_url\";s:20:\"http://ogdch.dev/de/\";s:10:\"search_url\";s:20:\"http://ogdch.dev/de/\";s:4:\"host\";N;s:5:\"mo_id\";s:2:\"17\";}i:1;a:20:{s:7:\"term_id\";i:5;s:4:\"name\";s:7:\"English\";s:4:\"slug\";s:2:\"en\";s:10:\"term_group\";s:1:\"0\";s:16:\"term_taxonomy_id\";i:5;s:8:\"taxonomy\";s:8:\"language\";s:11:\"description\";s:5:\"en_US\";s:6:\"parent\";s:1:\"0\";s:5:\"count\";i:0;s:10:\"tl_term_id\";i:6;s:19:\"tl_term_taxonomy_id\";i:6;s:8:\"tl_count\";i:1;s:6:\"locale\";R:29;s:6:\"is_rtl\";i:0;s:8:\"flag_url\";s:57:\"http://ogdch.dev/content/plugins/polylang/flags/en_US.png\";s:4:\"flag\";s:878:\"<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAALCAIAAAD5gJpuAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAHzSURBVHjaYkxOP8IAB//+Mfz7w8Dwi4HhP5CcJb/n/7evb16/APL/gRFQDiAAw3JuAgAIBEDQ/iswEERjGzBQLEru97ll0g0+3HvqMn1SpqlqGsZMsZsIe0SICA5gt5a/AGIEarCPtFh+6N/ffwxA9OvP/7//QYwff/6fZahmePeB4dNHhi+fGb59Y4zyvHHmCEAAAW3YDzQYaJJ93a+vX79aVf58//69fvEPlpIfnz59+vDhw7t37968efP3b/SXL59OnjwIEEAsDP+YgY53b2b89++/awvLn98MDi2cVxl+/vl6mituCtBghi9f/v/48e/XL86krj9XzwEEEENy8g6gu22rfn78+NGs5Ofr16+ZC58+fvyYwX8rxOxXr169fPny+fPn1//93bJlBUAAsQADZMEBxj9/GBxb2P/9+S/R8u3vzxuyaX8ZHv3j8/YGms3w8ycQARmi2eE37t4ACCDGR4/uSkrKAS35B3TT////wADOgLOBIaXIyjBlwxKAAGKRXjCB0SOEaeu+/y9fMnz4AHQxCP348R/o+l+//sMZQBNLEvif3AcIIMZbty7Ly6t9ZmXl+fXj/38GoHH/UcGfP79//BBiYHjy9+8/oUkNAAHEwt1V/vI/KBY/QSISFqM/GBg+MzB8A6PfYC5EFiDAABqgW776MP0rAAAAAElFTkSuQmCC\" title=\"English\" alt=\"English\" />\";s:8:\"home_url\";s:20:\"http://ogdch.dev/en/\";s:10:\"search_url\";s:20:\"http://ogdch.dev/en/\";s:4:\"host\";N;s:5:\"mo_id\";s:2:\"18\";}i:2;a:20:{s:7:\"term_id\";i:9;s:4:\"name\";s:8:\"Italiano\";s:4:\"slug\";s:2:\"it\";s:10:\"term_group\";s:1:\"0\";s:16:\"term_taxonomy_id\";i:9;s:8:\"taxonomy\";s:8:\"language\";s:11:\"description\";s:5:\"it_IT\";s:6:\"parent\";s:1:\"0\";s:5:\"count\";i:0;s:10:\"tl_term_id\";i:10;s:19:\"tl_term_taxonomy_id\";i:10;s:8:\"tl_count\";i:1;s:6:\"locale\";R:49;s:6:\"is_rtl\";i:0;s:8:\"flag_url\";s:57:\"http://ogdch.dev/content/plugins/polylang/flags/it_IT.png\";s:4:\"flag\";s:628:\"<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAALCAIAAAD5gJpuAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAE2SURBVHjaYmSYyMDwgwEE/jEw/GF4mvT0HyqQUlX9B5aEIIAAYmH4wlDtWg1SDwT//0lKSv7/D+T9/w+nYmL+//79/88fIPll0yaAAGJhYAGJP/n69O+/v0CAUAcHt2////ULqJpRVhZoA0AAsQCtAZoMVP0HiP7+RlcNBEDVYA0Mv38DNQAEEMj8vwx//wCt/AdC/zEBkgagYoAAYgF6FGj277+///wlpAEoz8AAEEAgDX/BZv/69wuoB48GRrCTAAKICajh9//fv/6CVP/++wu7BrDxQFf/YWAACCCwk0BKf0MQdg1/gBqAPv0L9ANAALEAY+33vz+S3JIgb/z5C45CBkZGRgY4UFICKQUjoJMAAoiRoZSB4RMojkHx/YPhbNVZoM3AOISQQPUK9vaQOIYAgAADAC5Wd4RRwnKfAAAAAElFTkSuQmCC\" title=\"Italiano\" alt=\"Italiano\" />\";s:8:\"home_url\";s:20:\"http://ogdch.dev/it/\";s:10:\"search_url\";s:20:\"http://ogdch.dev/it/\";s:4:\"host\";N;s:5:\"mo_id\";s:2:\"19\";}i:3;a:20:{s:7:\"term_id\";i:13;s:4:\"name\";s:9:\"Français\";s:4:\"slug\";s:2:\"fr\";s:10:\"term_group\";s:1:\"0\";s:16:\"term_taxonomy_id\";i:13;s:8:\"taxonomy\";s:8:\"language\";s:11:\"description\";s:5:\"fr_FR\";s:6:\"parent\";s:1:\"0\";s:5:\"count\";i:0;s:10:\"tl_term_id\";i:14;s:19:\"tl_term_taxonomy_id\";i:14;s:8:\"tl_count\";i:1;s:6:\"locale\";R:69;s:6:\"is_rtl\";i:0;s:8:\"flag_url\";s:57:\"http://ogdch.dev/content/plugins/polylang/flags/fr_FR.png\";s:4:\"flag\";s:798:\"<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAALCAIAAAD5gJpuAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAGzSURBVHjaYiyeepkBBv79+Zfnx/f379+fP38CyT9//jAyMiq5GP77wvDnJ8MfoAIGBoAAYgGqC7STApL///3/9++/pCTv////Qdz/QO4/IMna0vf/z+9/v379//37bUUTQACBNDD8Z/j87fffvyAVX79+/Q8GQDbQeKA9fM+e/Pv18/+vnwzCIkBLAAKQOAY5AIAwCEv4/4PddNUm3ji0QJyxW3rgzE0iLfqDGr2oYuu0l54AYvnz5x9Q6d+/QPQfyAQqAin9B3EOyG1A1UDj//36zfjr1y8GBoAAFI9BDgAwCMIw+P8Ho3GDO6XQ0l4MN8b2kUwYaLszqgKM/KHcDXwBxAJUD3TJ779A8h9Q5D8SAHoARP36+Rfo41+/mcA2AAQQy49ff0Cu//MPpAeI/0FdA1QNYYNVA/3wmwEYVgwMAAHE8uPHH5BqoD1//gJJLADoJKDS378Z//wFhhJAALF8A3rizz8uTmYg788fJkj4QOKREQyYxSWBhjEC/fcXZANAALF8+/anbcHlHz9+ffvx58uPX9KckkCn/gby/wLd8uvHjx96k+cD1UGiGQgAAgwA7q17ZpsMdUQAAAAASUVORK5CYII=\" title=\"Français\" alt=\"Français\" />\";s:8:\"home_url\";s:20:\"http://ogdch.dev/fr/\";s:10:\"search_url\";s:20:\"http://ogdch.dev/fr/\";s:4:\"host\";N;s:5:\"mo_id\";s:2:\"20\";}}','yes');
INSERT INTO `ogdch_options` VALUES (174,'_transient_is_multi_author','0','yes');
INSERT INTO `ogdch_options` VALUES (175,'_transient_twentyfifteen_categories','1','yes');
INSERT INTO `ogdch_options` VALUES (181,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/de_DE/wordpress-4.2.2.zip\";s:6:\"locale\";s:5:\"de_DE\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/de_DE/wordpress-4.2.2.zip\";s:10:\"no_content\";b:0;s:11:\"new_bundled\";b:0;s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.2.2\";s:7:\"version\";s:5:\"4.2.2\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.1\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1432884872;s:15:\"version_checked\";s:5:\"4.2.2\";s:12:\"translations\";a:2:{i:0;a:7:{s:4:\"type\";s:4:\"core\";s:4:\"slug\";s:7:\"default\";s:8:\"language\";s:5:\"de_DE\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-05-28 23:38:57\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.2.2/de_DE.zip\";s:10:\"autoupdate\";b:1;}i:1;a:7:{s:4:\"type\";s:4:\"core\";s:4:\"slug\";s:7:\"default\";s:8:\"language\";s:5:\"it_IT\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-05-23 17:17:36\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.2.2/it_IT.zip\";s:10:\"autoupdate\";b:1;}}}','yes');
INSERT INTO `ogdch_options` VALUES (182,'_site_transient_update_themes','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1432884875;s:7:\"checked\";a:2:{s:5:\"ogdch\";s:3:\"1.0\";s:13:\"twentyfifteen\";s:3:\"1.2\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:3:{i:0;a:7:{s:4:\"type\";s:5:\"theme\";s:4:\"slug\";s:13:\"twentyfifteen\";s:8:\"language\";s:5:\"de_CH\";s:7:\"version\";s:3:\"1.0\";s:7:\"updated\";s:19:\"2015-03-26 14:38:04\";s:7:\"package\";s:77:\"https://downloads.wordpress.org/translation/theme/twentyfifteen/1.0/de_CH.zip\";s:10:\"autoupdate\";b:1;}i:1;a:7:{s:4:\"type\";s:5:\"theme\";s:4:\"slug\";s:13:\"twentyfifteen\";s:8:\"language\";s:5:\"it_IT\";s:7:\"version\";s:3:\"1.1\";s:7:\"updated\";s:19:\"2015-03-27 13:21:51\";s:7:\"package\";s:77:\"https://downloads.wordpress.org/translation/theme/twentyfifteen/1.1/it_IT.zip\";s:10:\"autoupdate\";b:1;}i:2;a:7:{s:4:\"type\";s:5:\"theme\";s:4:\"slug\";s:13:\"twentyfifteen\";s:8:\"language\";s:5:\"fr_FR\";s:7:\"version\";s:3:\"1.1\";s:7:\"updated\";s:19:\"2015-05-06 15:54:09\";s:7:\"package\";s:77:\"https://downloads.wordpress.org/translation/theme/twentyfifteen/1.1/fr_FR.zip\";s:10:\"autoupdate\";b:1;}}}','yes');
INSERT INTO `ogdch_options` VALUES (183,'_site_transient_update_plugins','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1432884873;s:8:\"response\";a:1:{s:13:\"cmb2/init.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:5:\"53754\";s:4:\"slug\";s:4:\"cmb2\";s:6:\"plugin\";s:13:\"cmb2/init.php\";s:11:\"new_version\";s:5:\"2.0.7\";s:3:\"url\";s:35:\"https://wordpress.org/plugins/cmb2/\";s:7:\"package\";s:47:\"https://downloads.wordpress.org/plugin/cmb2.zip\";}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:5:{s:19:\"members/members.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:5:\"10325\";s:4:\"slug\";s:7:\"members\";s:6:\"plugin\";s:19:\"members/members.php\";s:11:\"new_version\";s:5:\"0.2.4\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/members/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/members.0.2.4.zip\";}s:21:\"polylang/polylang.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:5:\"25780\";s:4:\"slug\";s:8:\"polylang\";s:6:\"plugin\";s:21:\"polylang/polylang.php\";s:11:\"new_version\";s:5:\"1.7.5\";s:3:\"url\";s:39:\"https://wordpress.org/plugins/polylang/\";s:7:\"package\";s:57:\"https://downloads.wordpress.org/plugin/polylang.1.7.5.zip\";}s:31:\"query-monitor/query-monitor.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:5:\"10302\";s:4:\"slug\";s:13:\"query-monitor\";s:6:\"plugin\";s:31:\"query-monitor/query-monitor.php\";s:11:\"new_version\";s:5:\"2.7.4\";s:3:\"url\";s:44:\"https://wordpress.org/plugins/query-monitor/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/plugin/query-monitor.2.7.4.zip\";}s:51:\"rewrite-rules-inspector/rewrite-rules-inspector.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:5:\"31263\";s:4:\"slug\";s:23:\"rewrite-rules-inspector\";s:6:\"plugin\";s:51:\"rewrite-rules-inspector/rewrite-rules-inspector.php\";s:11:\"new_version\";s:5:\"1.2.1\";s:3:\"url\";s:54:\"https://wordpress.org/plugins/rewrite-rules-inspector/\";s:7:\"package\";s:72:\"https://downloads.wordpress.org/plugin/rewrite-rules-inspector.1.2.1.zip\";}s:24:\"wordpress-seo/wp-seo.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:4:\"5899\";s:4:\"slug\";s:13:\"wordpress-seo\";s:6:\"plugin\";s:24:\"wordpress-seo/wp-seo.php\";s:11:\"new_version\";s:5:\"2.1.1\";s:3:\"url\";s:44:\"https://wordpress.org/plugins/wordpress-seo/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/plugin/wordpress-seo.2.1.1.zip\";}}}','yes');
INSERT INTO `ogdch_options` VALUES (186,'current_theme','Twenty Fifteen','yes');
INSERT INTO `ogdch_options` VALUES (187,'theme_mods_ogdch','a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:18:\"service_navigation\";i:70;}s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1436165571;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:18:\"orphaned_widgets_1\";a:1:{i:0;s:17:\"recent-comments-2\";}}}}','yes');
INSERT INTO `ogdch_options` VALUES (188,'theme_switched','','yes');
INSERT INTO `ogdch_options` VALUES (331,'nav_menu_options','a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}','yes');
INSERT INTO `ogdch_options` VALUES (406,'ckan_groups_children','a:0:{}','yes');
INSERT INTO `ogdch_options` VALUES (440,'ckan_organisation_children','a:4:{i:103;a:1:{i:0;i:107;}i:105;a:1:{i:0;i:111;}i:111;a:2:{i:0;i:113;i:1;i:117;}i:113;a:1:{i:0;i:115;}}','yes');
INSERT INTO `ogdch_options` VALUES (474,'ckan_group_children','a:0:{}','yes');
INSERT INTO `ogdch_options` VALUES (476,'wpseo','a:20:{s:14:\"blocking_files\";a:0:{}s:26:\"ignore_blog_public_warning\";b:1;s:31:\"ignore_meta_description_warning\";b:0;s:20:\"ignore_page_comments\";b:0;s:16:\"ignore_permalink\";b:0;s:15:\"ms_defaults_set\";b:0;s:23:\"theme_description_found\";s:0:\"\";s:21:\"theme_has_description\";b:0;s:7:\"version\";s:5:\"2.3.5\";s:11:\"alexaverify\";s:0:\"\";s:12:\"company_logo\";s:0:\"\";s:12:\"company_name\";s:0:\"\";s:17:\"company_or_person\";s:0:\"\";s:20:\"disableadvanced_meta\";b:1;s:12:\"googleverify\";s:0:\"\";s:8:\"msverify\";s:0:\"\";s:11:\"person_name\";s:0:\"\";s:12:\"website_name\";s:0:\"\";s:22:\"alternate_website_name\";s:0:\"\";s:12:\"yandexverify\";s:0:\"\";}','yes');
INSERT INTO `ogdch_options` VALUES (477,'wpseo_permalinks','a:13:{s:15:\"cleanpermalinks\";b:0;s:24:\"cleanpermalink-extravars\";s:0:\"\";s:29:\"cleanpermalink-googlecampaign\";b:0;s:31:\"cleanpermalink-googlesitesearch\";b:0;s:15:\"cleanreplytocom\";b:0;s:10:\"cleanslugs\";b:1;s:14:\"hide-feedlinks\";b:0;s:12:\"hide-rsdlink\";b:0;s:14:\"hide-shortlink\";b:0;s:16:\"hide-wlwmanifest\";b:0;s:18:\"redirectattachment\";b:0;s:17:\"stripcategorybase\";b:0;s:13:\"trailingslash\";b:0;}','yes');
INSERT INTO `ogdch_options` VALUES (478,'wpseo_titles','a:114:{s:10:\"title_test\";i:0;s:17:\"forcerewritetitle\";b:1;s:9:\"separator\";s:7:\"sc-pipe\";s:5:\"noodp\";b:0;s:6:\"noydir\";b:0;s:15:\"usemetakeywords\";b:0;s:16:\"title-home-wpseo\";s:42:\"%%sitename%% %%page%% %%sep%% %%sitedesc%%\";s:18:\"title-author-wpseo\";s:41:\"%%name%%, Autor auf %%sitename%% %%page%%\";s:19:\"title-archive-wpseo\";s:38:\"%%date%% %%page%% %%sep%% %%sitename%%\";s:18:\"title-search-wpseo\";s:67:\"Du hast nach %%searchphrase%% gesucht %%page%% %%sep%% %%sitename%%\";s:15:\"title-404-wpseo\";s:41:\"Seite nicht gefunden %%sep%% %%sitename%%\";s:19:\"metadesc-home-wpseo\";s:0:\"\";s:21:\"metadesc-author-wpseo\";s:0:\"\";s:22:\"metadesc-archive-wpseo\";s:0:\"\";s:18:\"metakey-home-wpseo\";s:0:\"\";s:20:\"metakey-author-wpseo\";s:0:\"\";s:22:\"noindex-subpages-wpseo\";b:0;s:20:\"noindex-author-wpseo\";b:1;s:21:\"noindex-archive-wpseo\";b:1;s:14:\"disable-author\";b:1;s:12:\"disable-date\";b:0;s:10:\"title-post\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:13:\"metadesc-post\";s:0:\"\";s:12:\"metakey-post\";s:0:\"\";s:12:\"noindex-post\";b:0;s:13:\"showdate-post\";b:0;s:16:\"hideeditbox-post\";b:0;s:10:\"title-page\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:13:\"metadesc-page\";s:0:\"\";s:12:\"metakey-page\";s:0:\"\";s:12:\"noindex-page\";b:0;s:13:\"showdate-page\";b:0;s:16:\"hideeditbox-page\";b:0;s:16:\"title-attachment\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:19:\"metadesc-attachment\";s:0:\"\";s:18:\"metakey-attachment\";s:0:\"\";s:18:\"noindex-attachment\";b:0;s:19:\"showdate-attachment\";b:0;s:22:\"hideeditbox-attachment\";b:1;s:18:\"title-tax-category\";s:52:\"%%term_title%% Archive %%page%% %%sep%% %%sitename%%\";s:21:\"metadesc-tax-category\";s:0:\"\";s:20:\"metakey-tax-category\";s:0:\"\";s:24:\"hideeditbox-tax-category\";b:1;s:20:\"noindex-tax-category\";b:1;s:18:\"title-tax-post_tag\";s:52:\"%%term_title%% Archive %%page%% %%sep%% %%sitename%%\";s:21:\"metadesc-tax-post_tag\";s:0:\"\";s:20:\"metakey-tax-post_tag\";s:0:\"\";s:24:\"hideeditbox-tax-post_tag\";b:1;s:20:\"noindex-tax-post_tag\";b:1;s:21:\"title-tax-post_format\";s:52:\"%%term_title%% Archive %%page%% %%sep%% %%sitename%%\";s:24:\"metadesc-tax-post_format\";s:0:\"\";s:23:\"metakey-tax-post_format\";s:0:\"\";s:27:\"hideeditbox-tax-post_format\";b:1;s:23:\"noindex-tax-post_format\";b:1;s:9:\"title-app\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:12:\"metadesc-app\";s:0:\"\";s:11:\"metakey-app\";s:0:\"\";s:11:\"noindex-app\";b:0;s:12:\"showdate-app\";b:0;s:15:\"hideeditbox-app\";b:0;s:24:\"title-ckan-local-dataset\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:27:\"metadesc-ckan-local-dataset\";s:0:\"\";s:26:\"metakey-ckan-local-dataset\";s:0:\"\";s:26:\"noindex-ckan-local-dataset\";b:0;s:27:\"showdate-ckan-local-dataset\";b:0;s:30:\"hideeditbox-ckan-local-dataset\";b:1;s:22:\"title-ckan-local-group\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:25:\"metadesc-ckan-local-group\";s:0:\"\";s:24:\"metakey-ckan-local-group\";s:0:\"\";s:24:\"noindex-ckan-local-group\";b:0;s:25:\"showdate-ckan-local-group\";b:0;s:28:\"hideeditbox-ckan-local-group\";b:1;s:20:\"title-ckan-local-org\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:23:\"metadesc-ckan-local-org\";s:0:\"\";s:22:\"metakey-ckan-local-org\";s:0:\"\";s:22:\"noindex-ckan-local-org\";b:0;s:23:\"showdate-ckan-local-org\";b:0;s:26:\"hideeditbox-ckan-local-org\";b:1;s:26:\"title-ckan-local-harvester\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:29:\"metadesc-ckan-local-harvester\";s:0:\"\";s:28:\"metakey-ckan-local-harvester\";s:0:\"\";s:28:\"noindex-ckan-local-harvester\";b:0;s:29:\"showdate-ckan-local-harvester\";b:0;s:32:\"hideeditbox-ckan-local-harvester\";b:1;s:19:\"title-ptarchive-app\";s:50:\"%%pt_plural%% Archiv %%page%% %%sep%% %%sitename%%\";s:22:\"metadesc-ptarchive-app\";s:0:\"\";s:21:\"metakey-ptarchive-app\";s:0:\"\";s:21:\"bctitle-ptarchive-app\";s:0:\"\";s:21:\"noindex-ptarchive-app\";b:0;s:25:\"title-tax-ckan-keyword-de\";s:53:\"%%term_title%% Archives %%page%% %%sep%% %%sitename%%\";s:28:\"metadesc-tax-ckan-keyword-de\";s:0:\"\";s:27:\"metakey-tax-ckan-keyword-de\";s:0:\"\";s:31:\"hideeditbox-tax-ckan-keyword-de\";b:0;s:27:\"noindex-tax-ckan-keyword-de\";b:0;s:25:\"title-tax-ckan-keyword-en\";s:53:\"%%term_title%% Archives %%page%% %%sep%% %%sitename%%\";s:28:\"metadesc-tax-ckan-keyword-en\";s:0:\"\";s:27:\"metakey-tax-ckan-keyword-en\";s:0:\"\";s:31:\"hideeditbox-tax-ckan-keyword-en\";b:0;s:27:\"noindex-tax-ckan-keyword-en\";b:0;s:25:\"title-tax-ckan-keyword-fr\";s:53:\"%%term_title%% Archives %%page%% %%sep%% %%sitename%%\";s:28:\"metadesc-tax-ckan-keyword-fr\";s:0:\"\";s:27:\"metakey-tax-ckan-keyword-fr\";s:0:\"\";s:31:\"hideeditbox-tax-ckan-keyword-fr\";b:0;s:27:\"noindex-tax-ckan-keyword-fr\";b:0;s:25:\"title-tax-ckan-keyword-it\";s:53:\"%%term_title%% Archives %%page%% %%sep%% %%sitename%%\";s:28:\"metadesc-tax-ckan-keyword-it\";s:0:\"\";s:27:\"metakey-tax-ckan-keyword-it\";s:0:\"\";s:31:\"hideeditbox-tax-ckan-keyword-it\";b:0;s:27:\"noindex-tax-ckan-keyword-it\";b:0;s:24:\"title-tax-ckan-mediatype\";s:53:\"%%term_title%% Archives %%page%% %%sep%% %%sitename%%\";s:27:\"metadesc-tax-ckan-mediatype\";s:0:\"\";s:26:\"metakey-tax-ckan-mediatype\";s:0:\"\";s:30:\"hideeditbox-tax-ckan-mediatype\";b:0;s:26:\"noindex-tax-ckan-mediatype\";b:0;}','yes');
INSERT INTO `ogdch_options` VALUES (479,'wpseo_social','a:21:{s:9:\"fb_admins\";a:0:{}s:12:\"fbconnectkey\";s:32:\"def8ea9dabc6d01b1b1da6aa2672f652\";s:13:\"facebook_site\";s:0:\"\";s:13:\"instagram_url\";s:0:\"\";s:12:\"linkedin_url\";s:0:\"\";s:11:\"myspace_url\";s:0:\"\";s:16:\"og_default_image\";s:0:\"\";s:18:\"og_frontpage_title\";s:0:\"\";s:17:\"og_frontpage_desc\";s:0:\"\";s:18:\"og_frontpage_image\";s:0:\"\";s:9:\"opengraph\";b:1;s:10:\"googleplus\";b:0;s:13:\"pinterest_url\";s:0:\"\";s:15:\"pinterestverify\";s:0:\"\";s:14:\"plus-publisher\";s:0:\"\";s:7:\"twitter\";b:1;s:12:\"twitter_site\";s:0:\"\";s:17:\"twitter_card_type\";s:7:\"summary\";s:11:\"youtube_url\";s:0:\"\";s:15:\"google_plus_url\";s:0:\"\";s:10:\"fbadminapp\";s:0:\"\";}','yes');
INSERT INTO `ogdch_options` VALUES (480,'wpseo_rss','a:2:{s:9:\"rssbefore\";s:0:\"\";s:8:\"rssafter\";s:58:\"Der Beitrag %%POSTLINK%% erschien zuerst auf %%BLOGLINK%%.\";}','yes');
INSERT INTO `ogdch_options` VALUES (481,'wpseo_internallinks','a:16:{s:20:\"breadcrumbs-404crumb\";s:32:\"Fehler 404: Seite nicht gefunden\";s:23:\"breadcrumbs-blog-remove\";b:0;s:20:\"breadcrumbs-boldlast\";b:0;s:25:\"breadcrumbs-archiveprefix\";s:11:\"Archiv für\";s:18:\"breadcrumbs-enable\";b:0;s:16:\"breadcrumbs-home\";s:4:\"Home\";s:18:\"breadcrumbs-prefix\";s:0:\"\";s:24:\"breadcrumbs-searchprefix\";s:22:\"Sie haben gesucht nach\";s:15:\"breadcrumbs-sep\";s:7:\"&raquo;\";s:23:\"post_types-post-maintax\";i:0;s:23:\"post_types-page-maintax\";i:0;s:29:\"post_types-attachment-maintax\";i:0;s:22:\"post_types-app-maintax\";i:0;s:31:\"post_types-ckan-dataset-maintax\";i:0;s:35:\"taxonomy-ckan_organisation-ptparent\";i:0;s:28:\"taxonomy-ckan_group-ptparent\";i:0;}','yes');
INSERT INTO `ogdch_options` VALUES (482,'wpseo_xml','a:19:{s:22:\"disable_author_sitemap\";b:0;s:22:\"disable_author_noposts\";b:0;s:16:\"enablexmlsitemap\";b:1;s:16:\"entries-per-page\";i:1000;s:38:\"user_role-administrator-not_in_sitemap\";b:0;s:31:\"user_role-editor-not_in_sitemap\";b:0;s:31:\"user_role-author-not_in_sitemap\";b:0;s:36:\"user_role-contributor-not_in_sitemap\";b:0;s:35:\"user_role-subscriber-not_in_sitemap\";b:0;s:30:\"post_types-post-not_in_sitemap\";b:0;s:30:\"post_types-page-not_in_sitemap\";b:0;s:36:\"post_types-attachment-not_in_sitemap\";b:1;s:34:\"taxonomies-category-not_in_sitemap\";b:0;s:34:\"taxonomies-post_tag-not_in_sitemap\";b:1;s:37:\"taxonomies-post_format-not_in_sitemap\";b:0;s:29:\"post_types-app-not_in_sitemap\";b:0;s:38:\"post_types-ckan-dataset-not_in_sitemap\";b:0;s:43:\"taxonomies-ckan_organisation-not_in_sitemap\";b:1;s:36:\"taxonomies-ckan_group-not_in_sitemap\";b:1;}','yes');
INSERT INTO `ogdch_options` VALUES (488,'theme_mods_wp-ogdch-theme','a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:16:{s:15:\"main_navigation\";i:135;s:16:\"about_navigation\";i:0;s:15:\"data_navigation\";i:0;s:20:\"developer_navigation\";i:0;s:20:\"main_navigation___en\";i:136;s:20:\"main_navigation___it\";i:137;s:20:\"main_navigation___fr\";i:138;s:21:\"about_navigation___en\";i:0;s:21:\"about_navigation___it\";i:0;s:21:\"about_navigation___fr\";i:0;s:20:\"data_navigation___en\";i:0;s:20:\"data_navigation___it\";i:0;s:20:\"data_navigation___fr\";i:0;s:25:\"developer_navigation___en\";i:0;s:25:\"developer_navigation___it\";i:0;s:25:\"developer_navigation___fr\";i:0;}s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1465487926;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:5:{i:0;s:10:\"archives-2\";i:1;s:6:\"meta-2\";i:2;s:8:\"search-2\";i:3;s:12:\"categories-2\";i:4;s:14:\"recent-posts-2\";}s:18:\"orphaned_widgets_1\";a:1:{i:0;s:17:\"recent-comments-2\";}}}}','yes');
INSERT INTO `ogdch_options` VALUES (490,'auto_core_update_notified','a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:22:\"juerg.hunziker@liip.ch\";s:7:\"version\";s:5:\"4.2.3\";s:9:\"timestamp\";i:1438073767;}','yes');
INSERT INTO `ogdch_options` VALUES (519,'page_for_posts','0','yes');
INSERT INTO `ogdch_options` VALUES (520,'finished_splitting_shared_terms','1','yes');
INSERT INTO `ogdch_options` VALUES (544,'can_compress_scripts','1','yes');
INSERT INTO `ogdch_options` VALUES (760,'WPLANG','de_CH','yes');
INSERT INTO `ogdch_options` VALUES (783,'nf_convert_notifications_complete','1','yes');
INSERT INTO `ogdch_options` VALUES (784,'nf_convert_subs_step','complete','yes');
INSERT INTO `ogdch_options` VALUES (785,'nf_upgrade_notice','closed','yes');
INSERT INTO `ogdch_options` VALUES (786,'nf_update_email_settings_complete','1','yes');
INSERT INTO `ogdch_options` VALUES (787,'nf_email_fav_updated','1','yes');
INSERT INTO `ogdch_options` VALUES (788,'nf_convert_forms_complete','1','yes');
INSERT INTO `ogdch_options` VALUES (789,'nf_database_migrations','1','yes');
INSERT INTO `ogdch_options` VALUES (790,'ninja_forms_settings','a:23:{s:11:\"date_format\";s:5:\"d.m.Y\";s:15:\"currency_symbol\";s:3:\"CHF\";s:14:\"recaptcha_lang\";s:2:\"en\";s:13:\"req_div_label\";s:102:\"Alle Felder, welche mit <span class=\"ninja-forms-req-symbol\">*</span> markiert sind, sind erforderlich\";s:16:\"req_field_symbol\";s:18:\"<strong>*</strong>\";s:15:\"req_error_label\";s:46:\"Bitte füllen Sie alle Felder mit einem * aus.\";s:15:\"req_field_error\";s:28:\"Dieses Feld ist erforderlich\";s:10:\"spam_error\";s:46:\"Bitte die Anti-Spam Frage korrekt beantworten.\";s:14:\"honeypot_error\";s:32:\"Bitte das Spam-Feld leer lassen.\";s:18:\"timed_submit_error\";s:58:\"Bitte kurz warten, bis Sie das Formular versenden können.\";s:16:\"javascript_error\";s:66:\"Bitte JavaScript aktivieren, um das Formular versenden zu können.\";s:13:\"invalid_email\";s:44:\"Bitte eine gültige E-Mail-Adresse eingeben.\";s:13:\"process_label\";s:14:\"Wird versendet\";s:17:\"password_mismatch\";s:39:\"Die Passwörter stimmen nicht überein.\";s:10:\"preview_id\";i:315;s:7:\"version\";s:6:\"2.9.47\";s:19:\"fix_form_email_from\";i:1;s:18:\"fix_field_reply_to\";i:1;s:18:\"recaptcha_site_key\";s:0:\"\";s:20:\"recaptcha_secret_key\";s:0:\"\";s:19:\"delete_on_uninstall\";s:1:\"0\";s:21:\"disable_admin_notices\";s:1:\"0\";s:22:\"version_2_2_25_rte_fix\";i:1;}','yes');
INSERT INTO `ogdch_options` VALUES (791,'nf_admin_notice','a:3:{s:16:\"one_week_support\";a:3:{s:5:\"start\";s:10:\"10/29/2015\";s:3:\"int\";i:7;s:9:\"dismissed\";i:1;}s:15:\"two_week_review\";a:3:{s:5:\"start\";s:9:\"11/5/2015\";s:3:\"int\";i:14;s:9:\"dismissed\";i:1;}s:10:\"three_info\";a:3:{s:5:\"start\";s:8:\"6/8/2016\";s:3:\"int\";i:0;s:9:\"dismissed\";i:1;}}','yes');
INSERT INTO `ogdch_options` VALUES (820,'nf_version_upgraded_from','2.9.31','yes');
INSERT INTO `ogdch_options` VALUES (835,'_wp_session_expires_fecf609bb5c4713134062807bb9bc896','1449677665','no');
INSERT INTO `ogdch_options` VALUES (836,'ninja_forms_load_deprecated','1','yes');
INSERT INTO `ogdch_options` VALUES (837,'widget_ninja_forms_widget','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `ogdch_options` VALUES (839,'wo_options','a:14:{s:7:\"enabled\";i:1;s:16:\"client_id_length\";i:30;s:17:\"auth_code_enabled\";i:1;s:20:\"client_creds_enabled\";i:0;s:18:\"user_creds_enabled\";i:0;s:22:\"refresh_tokens_enabled\";i:0;s:16:\"implicit_enabled\";i:0;s:26:\"require_exact_redirect_uri\";i:0;s:13:\"enforce_state\";i:0;s:22:\"refresh_token_lifetime\";i:864000;s:21:\"access_token_lifetime\";i:86400;s:18:\"use_openid_connect\";i:0;s:11:\"id_lifetime\";i:3600;s:17:\"id_token_lifetime\";i:3600;}','yes');
INSERT INTO `ogdch_options` VALUES (840,'wpoauth_version','3.1.97','yes');
INSERT INTO `ogdch_options` VALUES (841,'rewrite_rules','a:233:{s:20:\"(de|en|it|fr)/app/?$\";s:40:\"index.php?lang=$matches[1]&post_type=app\";s:50:\"(de|en|it|fr)/app/feed/(feed|rdf|rss|rss2|atom)/?$\";s:57:\"index.php?lang=$matches[1]&post_type=app&feed=$matches[2]\";s:45:\"(de|en|it|fr)/app/(feed|rdf|rss|rss2|atom)/?$\";s:57:\"index.php?lang=$matches[1]&post_type=app&feed=$matches[2]\";s:37:\"(de|en|it|fr)/app/page/([0-9]{1,})/?$\";s:58:\"index.php?lang=$matches[1]&post_type=app&paged=$matches[2]\";s:11:\"^oauth/(.+)\";s:27:\"index.php?oauth=$matches[1]\";s:17:\"^.well-known/(.+)\";s:32:\"index.php?well-known=$matches[1]\";s:21:\"^wpoauthincludes/(.+)\";s:37:\"index.php?wpoauthincludes=$matches[1]\";s:61:\"(de|en|it|fr)/category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[2]&feed=$matches[3]\";s:56:\"(de|en|it|fr)/category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[2]&feed=$matches[3]\";s:49:\"(de|en|it|fr)/category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[2]&paged=$matches[3]\";s:31:\"(de|en|it|fr)/category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[2]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:58:\"(de|en|it|fr)/tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[2]&feed=$matches[3]\";s:53:\"(de|en|it|fr)/tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[2]&feed=$matches[3]\";s:46:\"(de|en|it|fr)/tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[2]&paged=$matches[3]\";s:28:\"(de|en|it|fr)/tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[2]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:59:\"(de|en|it|fr)/type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:67:\"index.php?lang=$matches[1]&post_format=$matches[2]&feed=$matches[3]\";s:54:\"(de|en|it|fr)/type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:67:\"index.php?lang=$matches[1]&post_format=$matches[2]&feed=$matches[3]\";s:47:\"(de|en|it|fr)/type/([^/]+)/page/?([0-9]{1,})/?$\";s:68:\"index.php?lang=$matches[1]&post_format=$matches[2]&paged=$matches[3]\";s:29:\"(de|en|it|fr)/type/([^/]+)/?$\";s:50:\"index.php?lang=$matches[1]&post_format=$matches[2]\";s:45:\"(de|en|it|fr)/app/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[2]\";s:55:\"(de|en|it|fr)/app/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[2]&tb=1\";s:75:\"(de|en|it|fr)/app/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:70:\"(de|en|it|fr)/app/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:70:\"(de|en|it|fr)/app/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[2]&cpage=$matches[3]\";s:38:\"(de|en|it|fr)/app/([^/]+)/trackback/?$\";s:30:\"index.php?app=$matches[2]&tb=1\";s:58:\"(de|en|it|fr)/app/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?app=$matches[2]&feed=$matches[3]\";s:53:\"(de|en|it|fr)/app/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?app=$matches[2]&feed=$matches[3]\";s:46:\"(de|en|it|fr)/app/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?app=$matches[2]&paged=$matches[3]\";s:53:\"(de|en|it|fr)/app/([^/]+)/comment-page-([0-9]{1,})/?$\";s:43:\"index.php?app=$matches[2]&cpage=$matches[3]\";s:38:\"(de|en|it|fr)/app/([^/]+)(/[0-9]+)?/?$\";s:42:\"index.php?app=$matches[2]&page=$matches[3]\";s:34:\"(de|en|it|fr)/app/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[2]\";s:44:\"(de|en|it|fr)/app/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[2]&tb=1\";s:64:\"(de|en|it|fr)/app/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:59:\"(de|en|it|fr)/app/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:59:\"(de|en|it|fr)/app/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[2]&cpage=$matches[3]\";s:31:\"app/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:41:\"app/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:61:\"app/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:56:\"app/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:56:\"app/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:24:\"app/([^/]+)/trackback/?$\";s:30:\"index.php?app=$matches[1]&tb=1\";s:44:\"app/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?app=$matches[1]&feed=$matches[2]\";s:39:\"app/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?app=$matches[1]&feed=$matches[2]\";s:32:\"app/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?app=$matches[1]&paged=$matches[2]\";s:39:\"app/([^/]+)/comment-page-([0-9]{1,})/?$\";s:43:\"index.php?app=$matches[1]&cpage=$matches[2]\";s:24:\"app/([^/]+)(/[0-9]+)?/?$\";s:42:\"index.php?app=$matches[1]&page=$matches[2]\";s:20:\"app/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:30:\"app/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:50:\"app/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:45:\"app/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:45:\"app/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:56:\"ckan-keyword-de/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:54:\"index.php?ckan-keyword-de=$matches[1]&feed=$matches[2]\";s:51:\"ckan-keyword-de/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:54:\"index.php?ckan-keyword-de=$matches[1]&feed=$matches[2]\";s:44:\"ckan-keyword-de/([^/]+)/page/?([0-9]{1,})/?$\";s:55:\"index.php?ckan-keyword-de=$matches[1]&paged=$matches[2]\";s:26:\"ckan-keyword-de/([^/]+)/?$\";s:37:\"index.php?ckan-keyword-de=$matches[1]\";s:56:\"ckan-keyword-en/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:54:\"index.php?ckan-keyword-en=$matches[1]&feed=$matches[2]\";s:51:\"ckan-keyword-en/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:54:\"index.php?ckan-keyword-en=$matches[1]&feed=$matches[2]\";s:44:\"ckan-keyword-en/([^/]+)/page/?([0-9]{1,})/?$\";s:55:\"index.php?ckan-keyword-en=$matches[1]&paged=$matches[2]\";s:26:\"ckan-keyword-en/([^/]+)/?$\";s:37:\"index.php?ckan-keyword-en=$matches[1]\";s:56:\"ckan-keyword-fr/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:54:\"index.php?ckan-keyword-fr=$matches[1]&feed=$matches[2]\";s:51:\"ckan-keyword-fr/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:54:\"index.php?ckan-keyword-fr=$matches[1]&feed=$matches[2]\";s:44:\"ckan-keyword-fr/([^/]+)/page/?([0-9]{1,})/?$\";s:55:\"index.php?ckan-keyword-fr=$matches[1]&paged=$matches[2]\";s:26:\"ckan-keyword-fr/([^/]+)/?$\";s:37:\"index.php?ckan-keyword-fr=$matches[1]\";s:56:\"ckan-keyword-it/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:54:\"index.php?ckan-keyword-it=$matches[1]&feed=$matches[2]\";s:51:\"ckan-keyword-it/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:54:\"index.php?ckan-keyword-it=$matches[1]&feed=$matches[2]\";s:44:\"ckan-keyword-it/([^/]+)/page/?([0-9]{1,})/?$\";s:55:\"index.php?ckan-keyword-it=$matches[1]&paged=$matches[2]\";s:26:\"ckan-keyword-it/([^/]+)/?$\";s:37:\"index.php?ckan-keyword-it=$matches[1]\";s:55:\"ckan-mediatype/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:53:\"index.php?ckan-mediatype=$matches[1]&feed=$matches[2]\";s:50:\"ckan-mediatype/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:53:\"index.php?ckan-mediatype=$matches[1]&feed=$matches[2]\";s:43:\"ckan-mediatype/([^/]+)/page/?([0-9]{1,})/?$\";s:54:\"index.php?ckan-mediatype=$matches[1]&paged=$matches[2]\";s:25:\"ckan-mediatype/([^/]+)/?$\";s:36:\"index.php?ckan-mediatype=$matches[1]\";s:35:\"dataset/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:45:\"dataset/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:65:\"dataset/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"dataset/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"dataset/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:28:\"dataset/([^/]+)/trackback/?$\";s:45:\"index.php?ckan-local-dataset=$matches[1]&tb=1\";s:36:\"dataset/([^/]+)/page/?([0-9]{1,})/?$\";s:58:\"index.php?ckan-local-dataset=$matches[1]&paged=$matches[2]\";s:43:\"dataset/([^/]+)/comment-page-([0-9]{1,})/?$\";s:58:\"index.php?ckan-local-dataset=$matches[1]&cpage=$matches[2]\";s:28:\"dataset/([^/]+)(/[0-9]+)?/?$\";s:57:\"index.php?ckan-local-dataset=$matches[1]&page=$matches[2]\";s:24:\"dataset/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:34:\"dataset/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:54:\"dataset/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"dataset/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"dataset/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"group/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:43:\"group/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:63:\"group/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:58:\"group/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:58:\"group/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:26:\"group/([^/]+)/trackback/?$\";s:43:\"index.php?ckan-local-group=$matches[1]&tb=1\";s:34:\"group/([^/]+)/page/?([0-9]{1,})/?$\";s:56:\"index.php?ckan-local-group=$matches[1]&paged=$matches[2]\";s:41:\"group/([^/]+)/comment-page-([0-9]{1,})/?$\";s:56:\"index.php?ckan-local-group=$matches[1]&cpage=$matches[2]\";s:26:\"group/([^/]+)(/[0-9]+)?/?$\";s:55:\"index.php?ckan-local-group=$matches[1]&page=$matches[2]\";s:22:\"group/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:32:\"group/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:52:\"group/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:47:\"group/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:47:\"group/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:40:\"organization/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:50:\"organization/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:70:\"organization/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:65:\"organization/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:65:\"organization/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"organization/([^/]+)/trackback/?$\";s:41:\"index.php?ckan-local-org=$matches[1]&tb=1\";s:41:\"organization/([^/]+)/page/?([0-9]{1,})/?$\";s:54:\"index.php?ckan-local-org=$matches[1]&paged=$matches[2]\";s:48:\"organization/([^/]+)/comment-page-([0-9]{1,})/?$\";s:54:\"index.php?ckan-local-org=$matches[1]&cpage=$matches[2]\";s:33:\"organization/([^/]+)(/[0-9]+)?/?$\";s:53:\"index.php?ckan-local-org=$matches[1]&page=$matches[2]\";s:29:\"organization/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:39:\"organization/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:59:\"organization/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:54:\"organization/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:54:\"organization/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:48:\"ckan-local-harvester/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:58:\"ckan-local-harvester/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:78:\"ckan-local-harvester/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:73:\"ckan-local-harvester/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:73:\"ckan-local-harvester/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:41:\"ckan-local-harvester/([^/]+)/trackback/?$\";s:47:\"index.php?ckan-local-harvester=$matches[1]&tb=1\";s:49:\"ckan-local-harvester/([^/]+)/page/?([0-9]{1,})/?$\";s:60:\"index.php?ckan-local-harvester=$matches[1]&paged=$matches[2]\";s:56:\"ckan-local-harvester/([^/]+)/comment-page-([0-9]{1,})/?$\";s:60:\"index.php?ckan-local-harvester=$matches[1]&cpage=$matches[2]\";s:41:\"ckan-local-harvester/([^/]+)(/[0-9]+)?/?$\";s:59:\"index.php?ckan-local-harvester=$matches[1]&page=$matches[2]\";s:37:\"ckan-local-harvester/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:47:\"ckan-local-harvester/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:67:\"ckan-local-harvester/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:62:\"ckan-local-harvester/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:62:\"ckan-local-harvester/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:34:\"nf_sub/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:44:\"nf_sub/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:64:\"nf_sub/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"nf_sub/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"nf_sub/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:27:\"nf_sub/([^/]+)/trackback/?$\";s:33:\"index.php?nf_sub=$matches[1]&tb=1\";s:35:\"nf_sub/([^/]+)/page/?([0-9]{1,})/?$\";s:46:\"index.php?nf_sub=$matches[1]&paged=$matches[2]\";s:42:\"nf_sub/([^/]+)/comment-page-([0-9]{1,})/?$\";s:46:\"index.php?nf_sub=$matches[1]&cpage=$matches[2]\";s:27:\"nf_sub/([^/]+)(/[0-9]+)?/?$\";s:45:\"index.php?nf_sub=$matches[1]&page=$matches[2]\";s:23:\"nf_sub/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:33:\"nf_sub/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:53:\"nf_sub/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:48:\"nf_sub/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:48:\"nf_sub/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:46:\"(de|en|it|fr)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?lang=$matches[1]&&feed=$matches[2]\";s:41:\"(de|en|it|fr)/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?lang=$matches[1]&&feed=$matches[2]\";s:34:\"(de|en|it|fr)/page/?([0-9]{1,})/?$\";s:45:\"index.php?lang=$matches[1]&&paged=$matches[2]\";s:16:\"(de|en|it|fr)/?$\";s:26:\"index.php?lang=$matches[1]\";s:55:\"(de|en|it|fr)/comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:59:\"index.php?lang=$matches[1]&&feed=$matches[2]&withcomments=1\";s:50:\"(de|en|it|fr)/comments/(feed|rdf|rss|rss2|atom)/?$\";s:59:\"index.php?lang=$matches[1]&&feed=$matches[2]&withcomments=1\";s:58:\"(de|en|it|fr)/search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:57:\"index.php?lang=$matches[1]&s=$matches[2]&feed=$matches[3]\";s:53:\"(de|en|it|fr)/search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:57:\"index.php?lang=$matches[1]&s=$matches[2]&feed=$matches[3]\";s:46:\"(de|en|it|fr)/search/(.+)/page/?([0-9]{1,})/?$\";s:58:\"index.php?lang=$matches[1]&s=$matches[2]&paged=$matches[3]\";s:28:\"(de|en|it|fr)/search/(.+)/?$\";s:40:\"index.php?lang=$matches[1]&s=$matches[2]\";s:61:\"(de|en|it|fr)/author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:67:\"index.php?lang=$matches[1]&author_name=$matches[2]&feed=$matches[3]\";s:56:\"(de|en|it|fr)/author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:67:\"index.php?lang=$matches[1]&author_name=$matches[2]&feed=$matches[3]\";s:49:\"(de|en|it|fr)/author/([^/]+)/page/?([0-9]{1,})/?$\";s:68:\"index.php?lang=$matches[1]&author_name=$matches[2]&paged=$matches[3]\";s:31:\"(de|en|it|fr)/author/([^/]+)/?$\";s:50:\"index.php?lang=$matches[1]&author_name=$matches[2]\";s:83:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&feed=$matches[5]\";s:78:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&feed=$matches[5]\";s:71:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:98:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&paged=$matches[5]\";s:53:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:80:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]\";s:70:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:81:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&feed=$matches[4]\";s:65:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:81:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&feed=$matches[4]\";s:58:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:82:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&paged=$matches[4]\";s:40:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/?$\";s:64:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]\";s:57:\"(de|en|it|fr)/([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:60:\"index.php?lang=$matches[1]&year=$matches[2]&feed=$matches[3]\";s:52:\"(de|en|it|fr)/([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:60:\"index.php?lang=$matches[1]&year=$matches[2]&feed=$matches[3]\";s:45:\"(de|en|it|fr)/([0-9]{4})/page/?([0-9]{1,})/?$\";s:61:\"index.php?lang=$matches[1]&year=$matches[2]&paged=$matches[3]\";s:27:\"(de|en|it|fr)/([0-9]{4})/?$\";s:43:\"index.php?lang=$matches[1]&year=$matches[2]\";s:41:\"(de|en|it|fr)/.?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[2]\";s:51:\"(de|en|it|fr)/.?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[2]&tb=1\";s:71:\"(de|en|it|fr)/.?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:66:\"(de|en|it|fr)/.?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:66:\"(de|en|it|fr)/.?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[2]&cpage=$matches[3]\";s:34:\"(de|en|it|fr)/(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[2]&tb=1\";s:54:\"(de|en|it|fr)/(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[2]&feed=$matches[3]\";s:49:\"(de|en|it|fr)/(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[2]&feed=$matches[3]\";s:42:\"(de|en|it|fr)/(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[2]&paged=$matches[3]\";s:49:\"(de|en|it|fr)/(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[2]&cpage=$matches[3]\";s:34:\"(de|en|it|fr)/(.?.+?)(/[0-9]+)?/?$\";s:47:\"index.php?pagename=$matches[2]&page=$matches[3]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:20:\"(.?.+?)(/[0-9]+)?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:41:\"(de|en|it|fr)/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[2]\";s:51:\"(de|en|it|fr)/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[2]&tb=1\";s:71:\"(de|en|it|fr)/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:66:\"(de|en|it|fr)/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:66:\"(de|en|it|fr)/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[2]&cpage=$matches[3]\";s:34:\"(de|en|it|fr)/([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[2]&tb=1\";s:54:\"(de|en|it|fr)/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[2]&feed=$matches[3]\";s:49:\"(de|en|it|fr)/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[2]&feed=$matches[3]\";s:42:\"(de|en|it|fr)/([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[2]&paged=$matches[3]\";s:49:\"(de|en|it|fr)/([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[2]&cpage=$matches[3]\";s:34:\"(de|en|it|fr)/([^/]+)(/[0-9]+)?/?$\";s:43:\"index.php?name=$matches[2]&page=$matches[3]\";s:30:\"(de|en|it|fr)/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[2]\";s:40:\"(de|en|it|fr)/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[2]&tb=1\";s:60:\"(de|en|it|fr)/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:55:\"(de|en|it|fr)/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:55:\"(de|en|it|fr)/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[2]&cpage=$matches[3]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:20:\"([^/]+)(/[0-9]+)?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";}','yes');
INSERT INTO `ogdch_options` VALUES (842,'pt_wp_sso_settings','a:2:{s:10:\"secret_key\";s:17:\">/^w4[rhfGMkT{QfD\";s:13:\"discourse_url\";s:21:\"http://discourse.dev/\";}','yes');
INSERT INTO `ogdch_options` VALUES (843,'discourse_version','0.7.0','yes');
INSERT INTO `ogdch_options` VALUES (844,'discourse','a:19:{s:3:\"url\";s:26:\"http://discourse.ogdch.dev\";s:7:\"api-key\";s:64:\"cc485f113876bc53fafc9628c09dbbcde26ccd826ee9d1c532249cdfaa9c2df9\";s:16:\"publish-username\";s:4:\"ckan\";s:16:\"publish-category\";s:1:\"1\";s:12:\"auto-publish\";i:1;s:10:\"auto-track\";i:1;s:18:\"allowed_post_types\";a:1:{i:0;s:4:\"post\";}s:22:\"use-discourse-comments\";i:1;s:25:\"existing-comments-heading\";s:0:\"\";s:12:\"max-comments\";s:1:\"5\";s:11:\"min-replies\";s:1:\"1\";s:9:\"min-score\";s:2:\"30\";s:15:\"min-trust-level\";s:1:\"1\";s:24:\"bypass-trust-level-score\";s:2:\"50\";s:21:\"custom-excerpt-length\";s:2:\"55\";s:22:\"custom-datetime-format\";s:0:\"\";s:10:\"enable-sso\";i:1;s:10:\"login-path\";s:0:\"\";s:10:\"sso-secret\";s:17:\">/^w4[rhfGMkT{QfD\";}','yes');
/*!40000 ALTER TABLE `ogdch_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ogdch_postmeta`
--

DROP TABLE IF EXISTS `ogdch_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ogdch_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2291 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogdch_postmeta`
--

LOCK TABLES `ogdch_postmeta` WRITE;
/*!40000 ALTER TABLE `ogdch_postmeta` DISABLE KEYS */;
INSERT INTO `ogdch_postmeta` VALUES (431,2,'_edit_lock','1444982213:1');
INSERT INTO `ogdch_postmeta` VALUES (433,97,'_edit_last','4');
INSERT INTO `ogdch_postmeta` VALUES (435,97,'_edit_lock','1447946851:1');
INSERT INTO `ogdch_postmeta` VALUES (464,2,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (533,118,'_edit_last','4');
INSERT INTO `ogdch_postmeta` VALUES (536,118,'_edit_lock','1443028110:4');
INSERT INTO `ogdch_postmeta` VALUES (537,119,'_edit_last','4');
INSERT INTO `ogdch_postmeta` VALUES (540,119,'_edit_lock','1447666649:1');
INSERT INTO `ogdch_postmeta` VALUES (611,142,'_ckandataset_reference','caa92e13-a975-4644-9e85-c3c752b46297');
INSERT INTO `ogdch_postmeta` VALUES (612,142,'_ckandataset_last_request','Wed, 03 Jun 2015 12:51:07 GMT');
INSERT INTO `ogdch_postmeta` VALUES (613,142,'_ckandataset_response','{\"help\": \"http://ckan.ogdch.dev/api/3/action/help_show?name=package_show\", \"success\": true, \"result\": {\"license_title\": \"Andere (Namensnennung)\", \"maintainer\": \"Bart\", \"relationships_as_object\": [], \"private\": false, \"maintainer_email\": \"\", \"num_tags\": 2, \"id\": \"caa92e13-a975-4644-9e85-c3c752b46297\", \"metadata_created\": \"2015-05-29T08:28:09.353559\", \"metadata_modified\": \"2015-06-01T07:02:16.173898\", \"author\": \"Odi\", \"author_email\": \"\", \"state\": \"active\", \"version\": \"\", \"creator_user_id\": \"5e19d724-c5e4-45eb-80ed-f2c88bac251a\", \"type\": \"dataset\", \"resources\": [{\"cache_last_updated\": null, \"package_id\": \"caa92e13-a975-4644-9e85-c3c752b46297\", \"webstore_last_updated\": null, \"id\": \"a55dc132-87d2-44c1-8697-82beb6b659f3\", \"size\": null, \"state\": \"active\", \"hash\": \"\", \"description\": \"\", \"format\": \"application/x-sql\", \"tracking_summary\": {\"total\": 0, \"recent\": 0}, \"last_modified\": null, \"url_type\": \"upload\", \"mimetype\": null, \"cache_url\": null, \"name\": \"\", \"created\": \"2015-05-29T08:28:27.321641\", \"url\": \"http://ckan.ogdch.dev/dataset/caa92e13-a975-4644-9e85-c3c752b46297/resource/a55dc132-87d2-44c1-8697-82beb6b659f3/download/cms.sql\", \"webstore_url\": null, \"mimetype_inner\": null, \"position\": 0, \"revision_id\": \"4232699e-e86a-4dd1-8631-df8137c7afc2\", \"resource_type\": null}], \"num_resources\": 1, \"tags\": [{\"vocabulary_id\": null, \"state\": \"active\", \"display_name\": \"hallo\", \"id\": \"f669d671-2b07-4501-ac04-bd152a8ddd7e\", \"name\": \"hallo\"}, {\"vocabulary_id\": null, \"state\": \"active\", \"display_name\": \"velo\", \"id\": \"d929d0c2-90ed-4ee9-84b7-d3f50594abc9\", \"name\": \"velo\"}], \"tracking_summary\": {\"total\": 0, \"recent\": 0}, \"groups\": [{\"display_name\": \"Super-Kategorie\", \"description\": \"\", \"image_display_url\": \"\", \"title\": \"Super-Kategorie\", \"id\": \"21794856-051d-4169-85d0-1566156b17b7\", \"name\": \"super-kategorie\"}], \"license_id\": \"other-at\", \"relationships_as_subject\": [], \"organization\": {\"description\": \"\", \"created\": \"2015-06-01T07:00:57.392442\", \"title\": \"Liip AG\", \"name\": \"liip-ag\", \"is_organization\": true, \"state\": \"active\", \"image_url\": \"\", \"revision_id\": \"ed653b80-563c-4460-825d-ed121f893d5d\", \"type\": \"organization\", \"id\": \"562584e5-b61d-41ec-9ac4-95444bbc7295\", \"approval_status\": \"approved\"}, \"name\": \"ich-bin-ein-datensatz\", \"isopen\": true, \"url\": \"\", \"notes\": \"\", \"owner_org\": \"562584e5-b61d-41ec-9ac4-95444bbc7295\", \"extras\": [{\"key\": \"Coolnessfaktor\", \"value\": \"12\"}], \"title\": \"Ich bin ein Datensatz\", \"revision_id\": \"84c32792-4722-406a-923c-08d248ee601b\"}}');
INSERT INTO `ogdch_postmeta` VALUES (617,142,'_edit_lock','1433340196:1');
INSERT INTO `ogdch_postmeta` VALUES (627,146,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (628,146,'_edit_lock','1433341321:1');
INSERT INTO `ogdch_postmeta` VALUES (735,164,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (737,164,'_edit_lock','1465810393:1');
INSERT INTO `ogdch_postmeta` VALUES (739,165,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (741,165,'_edit_lock','1465823166:1');
INSERT INTO `ogdch_postmeta` VALUES (743,166,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (746,166,'_edit_lock','1440509110:1');
INSERT INTO `ogdch_postmeta` VALUES (748,167,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (752,167,'_edit_lock','1440509116:1');
INSERT INTO `ogdch_postmeta` VALUES (789,172,'_menu_item_type','post_type');
INSERT INTO `ogdch_postmeta` VALUES (790,172,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (791,172,'_menu_item_object_id','164');
INSERT INTO `ogdch_postmeta` VALUES (792,172,'_menu_item_object','page');
INSERT INTO `ogdch_postmeta` VALUES (793,172,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (794,172,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (795,172,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (796,172,'_menu_item_url','');
INSERT INTO `ogdch_postmeta` VALUES (861,180,'_menu_item_type','post_type');
INSERT INTO `ogdch_postmeta` VALUES (862,180,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (863,180,'_menu_item_object_id','165');
INSERT INTO `ogdch_postmeta` VALUES (864,180,'_menu_item_object','page');
INSERT INTO `ogdch_postmeta` VALUES (865,180,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (866,180,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (867,180,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (868,180,'_menu_item_url','');
INSERT INTO `ogdch_postmeta` VALUES (897,184,'_menu_item_type','post_type');
INSERT INTO `ogdch_postmeta` VALUES (898,184,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (899,184,'_menu_item_object_id','166');
INSERT INTO `ogdch_postmeta` VALUES (900,184,'_menu_item_object','page');
INSERT INTO `ogdch_postmeta` VALUES (901,184,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (902,184,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (903,184,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (904,184,'_menu_item_url','');
INSERT INTO `ogdch_postmeta` VALUES (933,188,'_menu_item_type','post_type');
INSERT INTO `ogdch_postmeta` VALUES (934,188,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (935,188,'_menu_item_object_id','167');
INSERT INTO `ogdch_postmeta` VALUES (936,188,'_menu_item_object','page');
INSERT INTO `ogdch_postmeta` VALUES (937,188,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (938,188,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (939,188,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (940,188,'_menu_item_url','');
INSERT INTO `ogdch_postmeta` VALUES (969,192,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (970,192,'_edit_lock','1449131223:1');
INSERT INTO `ogdch_postmeta` VALUES (971,192,'_ckan_local_group_title_en','Population');
INSERT INTO `ogdch_postmeta` VALUES (972,192,'_ckan_local_group_title_de','Bevölkerung');
INSERT INTO `ogdch_postmeta` VALUES (973,192,'_ckan_local_group_title_fr','Population');
INSERT INTO `ogdch_postmeta` VALUES (974,192,'_ckan_local_group_title_it','Popolazione');
INSERT INTO `ogdch_postmeta` VALUES (975,192,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/population');
INSERT INTO `ogdch_postmeta` VALUES (976,192,'_ckan_local_group_ckan_id','64d3b89b-ff79-477e-8fb4-9cfc388b0f58');
INSERT INTO `ogdch_postmeta` VALUES (977,192,'_ckan_local_group_ckan_name','population');
INSERT INTO `ogdch_postmeta` VALUES (978,193,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (979,193,'_edit_lock','1449131296:1');
INSERT INTO `ogdch_postmeta` VALUES (980,193,'_ckan_local_group_ckan_id','27b314a5-57b6-4c4e-9c9f-6923365eaecc');
INSERT INTO `ogdch_postmeta` VALUES (981,193,'_ckan_local_group_ckan_name','territory');
INSERT INTO `ogdch_postmeta` VALUES (982,193,'_ckan_local_group_title_en','Territory and environment');
INSERT INTO `ogdch_postmeta` VALUES (983,193,'_ckan_local_group_title_de','Raum und Umwelt');
INSERT INTO `ogdch_postmeta` VALUES (984,193,'_ckan_local_group_title_fr','Territoire et environnement');
INSERT INTO `ogdch_postmeta` VALUES (985,193,'_ckan_local_group_title_it','Territorio e ambiente');
INSERT INTO `ogdch_postmeta` VALUES (986,193,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/territory');
INSERT INTO `ogdch_postmeta` VALUES (987,194,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (988,194,'_edit_lock','1449231920:1');
INSERT INTO `ogdch_postmeta` VALUES (989,194,'_ckan_local_org_ckan_id','73124d1e-c2aa-4d20-a42d-fa71b8946e93');
INSERT INTO `ogdch_postmeta` VALUES (990,194,'_ckan_local_org_ckan_name','swisstopo');
INSERT INTO `ogdch_postmeta` VALUES (991,194,'_ckan_local_org_title_en','Swisstopo EN');
INSERT INTO `ogdch_postmeta` VALUES (992,194,'_ckan_local_org_title_de','Swisstopo DE');
INSERT INTO `ogdch_postmeta` VALUES (993,194,'_ckan_local_org_title_fr','Swisstopo FR');
INSERT INTO `ogdch_postmeta` VALUES (994,194,'_ckan_local_org_title_it','Swisstopo IT');
INSERT INTO `ogdch_postmeta` VALUES (997,195,'_edit_lock','1446622859:1');
INSERT INTO `ogdch_postmeta` VALUES (998,195,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (999,195,'_app-showcase-app_url','http://topoapp.io');
INSERT INTO `ogdch_postmeta` VALUES (1000,195,'_app-showcase-app_author_name','Liip');
INSERT INTO `ogdch_postmeta` VALUES (1001,195,'_app-showcase-app_author_email','jazz@liip.ch');
INSERT INTO `ogdch_postmeta` VALUES (1002,195,'_app-showcase-app_version','1.0.0');
INSERT INTO `ogdch_postmeta` VALUES (1003,196,'_edit_lock','1446207511:1');
INSERT INTO `ogdch_postmeta` VALUES (1004,196,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1005,196,'_app-showcase-app_url','http://topoapp.io');
INSERT INTO `ogdch_postmeta` VALUES (1006,196,'_app-showcase-app_author_name','Liip');
INSERT INTO `ogdch_postmeta` VALUES (1007,196,'_app-showcase-app_author_email','jazz@liip.ch');
INSERT INTO `ogdch_postmeta` VALUES (1008,196,'_app-showcase-app_version','1.0.0');
INSERT INTO `ogdch_postmeta` VALUES (1009,197,'_edit_lock','1446207617:1');
INSERT INTO `ogdch_postmeta` VALUES (1010,197,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1011,197,'_app-showcase-app_url','http://topoapp.io');
INSERT INTO `ogdch_postmeta` VALUES (1012,197,'_app-showcase-app_author_name','Liip');
INSERT INTO `ogdch_postmeta` VALUES (1013,197,'_app-showcase-app_author_email','jazz@liip.ch');
INSERT INTO `ogdch_postmeta` VALUES (1014,197,'_app-showcase-app_version','1.0.0');
INSERT INTO `ogdch_postmeta` VALUES (1015,198,'_edit_lock','1446207623:1');
INSERT INTO `ogdch_postmeta` VALUES (1016,198,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1017,198,'_app-showcase-app_url','http://topoapp.io');
INSERT INTO `ogdch_postmeta` VALUES (1018,198,'_app-showcase-app_author_name','Liip');
INSERT INTO `ogdch_postmeta` VALUES (1019,198,'_app-showcase-app_author_email','jazz@liip.ch');
INSERT INTO `ogdch_postmeta` VALUES (1020,198,'_app-showcase-app_version','1.0.0');
INSERT INTO `ogdch_postmeta` VALUES (1021,199,'_edit_lock','1449131334:1');
INSERT INTO `ogdch_postmeta` VALUES (1022,199,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1023,199,'_ckan_local_group_ckan_id','33ab70dd-e2da-464a-ae5f-b166f16d9e2c');
INSERT INTO `ogdch_postmeta` VALUES (1024,199,'_ckan_local_group_ckan_name','work');
INSERT INTO `ogdch_postmeta` VALUES (1025,199,'_ckan_local_group_title_en','Work and income');
INSERT INTO `ogdch_postmeta` VALUES (1026,199,'_ckan_local_group_title_de','Arbeit, Erwerb');
INSERT INTO `ogdch_postmeta` VALUES (1027,199,'_ckan_local_group_title_fr','Travail, rémunération');
INSERT INTO `ogdch_postmeta` VALUES (1028,199,'_ckan_local_group_title_it','Lavoro e reddito');
INSERT INTO `ogdch_postmeta` VALUES (1029,199,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/work');
INSERT INTO `ogdch_postmeta` VALUES (1030,200,'_edit_lock','1449131116:1');
INSERT INTO `ogdch_postmeta` VALUES (1031,200,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1032,200,'_ckan_local_group_ckan_id','7d52132f-7119-41ab-b2b8-e62d69a834ce');
INSERT INTO `ogdch_postmeta` VALUES (1033,200,'_ckan_local_group_ckan_name','construction');
INSERT INTO `ogdch_postmeta` VALUES (1034,200,'_ckan_local_group_title_de','Bau- und Wohnungswesen');
INSERT INTO `ogdch_postmeta` VALUES (1035,200,'_ckan_local_group_title_fr','Construction, logement');
INSERT INTO `ogdch_postmeta` VALUES (1036,200,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/construction');
INSERT INTO `ogdch_postmeta` VALUES (1037,201,'_edit_lock','1449131139:1');
INSERT INTO `ogdch_postmeta` VALUES (1038,201,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1039,201,'_ckan_local_group_ckan_id','afcb4a2a-b4b0-4d7c-984a-9078e964be49');
INSERT INTO `ogdch_postmeta` VALUES (1040,201,'_ckan_local_group_ckan_name','education');
INSERT INTO `ogdch_postmeta` VALUES (1041,201,'_ckan_local_group_title_en','Education and science');
INSERT INTO `ogdch_postmeta` VALUES (1042,201,'_ckan_local_group_title_de','Bildung, Wissenschaft');
INSERT INTO `ogdch_postmeta` VALUES (1043,201,'_ckan_local_group_title_fr','Education, science');
INSERT INTO `ogdch_postmeta` VALUES (1044,201,'_ckan_local_group_title_it','Formazione e scienza');
INSERT INTO `ogdch_postmeta` VALUES (1045,201,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/education');
INSERT INTO `ogdch_postmeta` VALUES (1046,202,'_edit_lock','1449131147:1');
INSERT INTO `ogdch_postmeta` VALUES (1047,202,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1048,202,'_ckan_local_group_ckan_id','42f56f74-074e-4cbb-b91b-deeb1fd58c56');
INSERT INTO `ogdch_postmeta` VALUES (1049,202,'_ckan_local_group_ckan_name','energy');
INSERT INTO `ogdch_postmeta` VALUES (1050,202,'_ckan_local_group_title_en','Energy');
INSERT INTO `ogdch_postmeta` VALUES (1051,202,'_ckan_local_group_title_de','Energie');
INSERT INTO `ogdch_postmeta` VALUES (1052,202,'_ckan_local_group_title_fr','Energie');
INSERT INTO `ogdch_postmeta` VALUES (1053,202,'_ckan_local_group_title_it','Energia');
INSERT INTO `ogdch_postmeta` VALUES (1054,202,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/energy');
INSERT INTO `ogdch_postmeta` VALUES (1055,203,'_edit_lock','1449131158:1');
INSERT INTO `ogdch_postmeta` VALUES (1056,203,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1057,203,'_ckan_local_group_ckan_id','79cbe120-e9c6-4249-b934-58ca980606d7');
INSERT INTO `ogdch_postmeta` VALUES (1058,203,'_ckan_local_group_ckan_name','finances');
INSERT INTO `ogdch_postmeta` VALUES (1059,203,'_ckan_local_group_title_en','Finances');
INSERT INTO `ogdch_postmeta` VALUES (1060,203,'_ckan_local_group_title_de','Finanzen');
INSERT INTO `ogdch_postmeta` VALUES (1061,203,'_ckan_local_group_title_fr','Finances');
INSERT INTO `ogdch_postmeta` VALUES (1062,203,'_ckan_local_group_title_it','Finanze');
INSERT INTO `ogdch_postmeta` VALUES (1063,203,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/finances');
INSERT INTO `ogdch_postmeta` VALUES (1064,204,'_edit_lock','1449131166:1');
INSERT INTO `ogdch_postmeta` VALUES (1065,204,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1066,204,'_ckan_local_group_ckan_id','a20e9d52-0d20-413c-a8ad-9ffd4523bec6');
INSERT INTO `ogdch_postmeta` VALUES (1067,204,'_ckan_local_group_ckan_name','geography');
INSERT INTO `ogdch_postmeta` VALUES (1068,204,'_ckan_local_group_title_de','Geographie');
INSERT INTO `ogdch_postmeta` VALUES (1069,204,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/geography');
INSERT INTO `ogdch_postmeta` VALUES (1070,205,'_edit_lock','1449131188:1');
INSERT INTO `ogdch_postmeta` VALUES (1071,205,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1072,205,'_ckan_local_group_ckan_id','28641aa8-b97d-49ed-85bf-c19eb0f729d3');
INSERT INTO `ogdch_postmeta` VALUES (1073,205,'_ckan_local_group_ckan_name','legislation');
INSERT INTO `ogdch_postmeta` VALUES (1074,205,'_ckan_local_group_title_en','Legislation');
INSERT INTO `ogdch_postmeta` VALUES (1075,205,'_ckan_local_group_title_de','Gesetzgebung');
INSERT INTO `ogdch_postmeta` VALUES (1076,205,'_ckan_local_group_title_fr','Législation');
INSERT INTO `ogdch_postmeta` VALUES (1077,205,'_ckan_local_group_title_it','Legislazione');
INSERT INTO `ogdch_postmeta` VALUES (1078,205,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/legislation');
INSERT INTO `ogdch_postmeta` VALUES (1079,206,'_edit_lock','1449131174:1');
INSERT INTO `ogdch_postmeta` VALUES (1080,206,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1081,206,'_ckan_local_group_ckan_id','90848388-d0b6-4b97-a686-e93b40832e1e');
INSERT INTO `ogdch_postmeta` VALUES (1082,206,'_ckan_local_group_ckan_name','health');
INSERT INTO `ogdch_postmeta` VALUES (1083,206,'_ckan_local_group_title_en','Health');
INSERT INTO `ogdch_postmeta` VALUES (1084,206,'_ckan_local_group_title_de','Gesundheit');
INSERT INTO `ogdch_postmeta` VALUES (1085,206,'_ckan_local_group_title_fr','Santé');
INSERT INTO `ogdch_postmeta` VALUES (1086,206,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/health');
INSERT INTO `ogdch_postmeta` VALUES (1087,207,'_edit_lock','1449131325:1');
INSERT INTO `ogdch_postmeta` VALUES (1088,207,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1089,207,'_ckan_local_group_ckan_id','dc8b567c-fed8-4696-847b-f85510f93d71');
INSERT INTO `ogdch_postmeta` VALUES (1090,207,'_ckan_local_group_ckan_name','trade');
INSERT INTO `ogdch_postmeta` VALUES (1091,207,'_ckan_local_group_title_de','Handel');
INSERT INTO `ogdch_postmeta` VALUES (1092,207,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/trade');
INSERT INTO `ogdch_postmeta` VALUES (1093,208,'_edit_lock','1449131181:1');
INSERT INTO `ogdch_postmeta` VALUES (1094,208,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1095,208,'_ckan_local_group_ckan_id','168c842c-fd1f-4180-91ce-1aecaac8f282');
INSERT INTO `ogdch_postmeta` VALUES (1096,208,'_ckan_local_group_ckan_name','industry');
INSERT INTO `ogdch_postmeta` VALUES (1097,208,'_ckan_local_group_title_en','Industry and services');
INSERT INTO `ogdch_postmeta` VALUES (1098,208,'_ckan_local_group_title_de','Industrie, Dienstleistungen');
INSERT INTO `ogdch_postmeta` VALUES (1099,208,'_ckan_local_group_title_fr','Industrie, services');
INSERT INTO `ogdch_postmeta` VALUES (1100,208,'_ckan_local_group_title_it','Industria, servizi');
INSERT INTO `ogdch_postmeta` VALUES (1101,208,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/industry');
INSERT INTO `ogdch_postmeta` VALUES (1102,209,'_edit_lock','1449131126:1');
INSERT INTO `ogdch_postmeta` VALUES (1103,209,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1104,209,'_ckan_local_group_ckan_id','2cd03703-e1e3-4031-bd3c-4d0e82d3d7c1');
INSERT INTO `ogdch_postmeta` VALUES (1105,209,'_ckan_local_group_ckan_name','crime');
INSERT INTO `ogdch_postmeta` VALUES (1106,209,'_ckan_local_group_title_en','Crime, criminal justice');
INSERT INTO `ogdch_postmeta` VALUES (1107,209,'_ckan_local_group_title_de','Kriminalität, Strafrecht');
INSERT INTO `ogdch_postmeta` VALUES (1108,209,'_ckan_local_group_title_fr','Criminalité, droit pénal');
INSERT INTO `ogdch_postmeta` VALUES (1109,209,'_ckan_local_group_title_it','Criminalità, diritto penale');
INSERT INTO `ogdch_postmeta` VALUES (1110,209,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/crime');
INSERT INTO `ogdch_postmeta` VALUES (1111,210,'_edit_lock','1449131133:1');
INSERT INTO `ogdch_postmeta` VALUES (1112,210,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1113,210,'_ckan_local_group_ckan_id','0d77b36f-1de6-40b3-9915-be91ee469f63');
INSERT INTO `ogdch_postmeta` VALUES (1114,210,'_ckan_local_group_ckan_name','culture');
INSERT INTO `ogdch_postmeta` VALUES (1115,210,'_ckan_local_group_title_de','Kultur, Medien, Informationsgesellschaft, Sport');
INSERT INTO `ogdch_postmeta` VALUES (1116,210,'_ckan_local_group_title_fr','Culture, médias, société de l\'information, sport');
INSERT INTO `ogdch_postmeta` VALUES (1117,210,'_ckan_local_group_title_it','Cultura, media, società dell\'informazione, sport');
INSERT INTO `ogdch_postmeta` VALUES (1118,210,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/culture');
INSERT INTO `ogdch_postmeta` VALUES (1119,211,'_edit_lock','1449131106:1');
INSERT INTO `ogdch_postmeta` VALUES (1120,211,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1121,211,'_ckan_local_group_ckan_id','c7521678-de76-4731-9075-25d1d6150ecf');
INSERT INTO `ogdch_postmeta` VALUES (1122,211,'_ckan_local_group_ckan_name','agriculture');
INSERT INTO `ogdch_postmeta` VALUES (1123,211,'_ckan_local_group_title_en','Agriculture, forestry');
INSERT INTO `ogdch_postmeta` VALUES (1124,211,'_ckan_local_group_title_de','Land- und Forstwirtschaft');
INSERT INTO `ogdch_postmeta` VALUES (1125,211,'_ckan_local_group_title_fr','Agriculture, sylviculture');
INSERT INTO `ogdch_postmeta` VALUES (1126,211,'_ckan_local_group_title_it','Agricoltura, selvicoltura');
INSERT INTO `ogdch_postmeta` VALUES (1127,211,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/agriculture');
INSERT INTO `ogdch_postmeta` VALUES (1128,212,'_edit_lock','1449131195:1');
INSERT INTO `ogdch_postmeta` VALUES (1129,212,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1130,212,'_ckan_local_group_ckan_id','8c2a33d5-475d-48dd-87b6-7ce5eb2033fa');
INSERT INTO `ogdch_postmeta` VALUES (1131,212,'_ckan_local_group_ckan_name','mobility');
INSERT INTO `ogdch_postmeta` VALUES (1132,212,'_ckan_local_group_title_en','Mobility and Transport');
INSERT INTO `ogdch_postmeta` VALUES (1133,212,'_ckan_local_group_title_de','Mobilität und Verkehr');
INSERT INTO `ogdch_postmeta` VALUES (1134,212,'_ckan_local_group_title_fr','Mobilité et transports');
INSERT INTO `ogdch_postmeta` VALUES (1135,212,'_ckan_local_group_title_it','Mobilità e trasporti');
INSERT INTO `ogdch_postmeta` VALUES (1136,212,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/mobility');
INSERT INTO `ogdch_postmeta` VALUES (1137,213,'_edit_lock','1449131249:1');
INSERT INTO `ogdch_postmeta` VALUES (1138,213,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1139,213,'_ckan_local_group_title_de','Öffentliche Ordnung und Sicherheit');
INSERT INTO `ogdch_postmeta` VALUES (1140,213,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/public-order');
INSERT INTO `ogdch_postmeta` VALUES (1141,213,'_ckan_local_group_ckan_id','620fdda8-a92d-421b-89ad-4ef1b57a9458');
INSERT INTO `ogdch_postmeta` VALUES (1142,213,'_ckan_local_group_ckan_name','public-order');
INSERT INTO `ogdch_postmeta` VALUES (1143,214,'_edit_lock','1449131208:1');
INSERT INTO `ogdch_postmeta` VALUES (1144,214,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1145,214,'_ckan_local_group_ckan_id','9beba14c-eab8-426e-89ae-757bc2e6445e');
INSERT INTO `ogdch_postmeta` VALUES (1146,214,'_ckan_local_group_ckan_name','politics');
INSERT INTO `ogdch_postmeta` VALUES (1147,214,'_ckan_local_group_title_de','Politik');
INSERT INTO `ogdch_postmeta` VALUES (1148,214,'_ckan_local_group_title_fr','Politique');
INSERT INTO `ogdch_postmeta` VALUES (1149,214,'_ckan_local_group_title_it','Politica');
INSERT INTO `ogdch_postmeta` VALUES (1150,214,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/politics');
INSERT INTO `ogdch_postmeta` VALUES (1151,216,'_edit_lock','1449131238:1');
INSERT INTO `ogdch_postmeta` VALUES (1152,216,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1153,216,'_ckan_local_group_ckan_id','1deb7a82-612f-46ce-9c62-89c7c0b38ddf');
INSERT INTO `ogdch_postmeta` VALUES (1154,216,'_ckan_local_group_ckan_name','prices');
INSERT INTO `ogdch_postmeta` VALUES (1155,216,'_ckan_local_group_title_en','Prices');
INSERT INTO `ogdch_postmeta` VALUES (1156,216,'_ckan_local_group_title_de','Preise');
INSERT INTO `ogdch_postmeta` VALUES (1157,216,'_ckan_local_group_title_fr','Prix');
INSERT INTO `ogdch_postmeta` VALUES (1158,216,'_ckan_local_group_title_it','Prezzi');
INSERT INTO `ogdch_postmeta` VALUES (1159,216,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/prices');
INSERT INTO `ogdch_postmeta` VALUES (1160,217,'_edit_lock','1449131269:1');
INSERT INTO `ogdch_postmeta` VALUES (1161,217,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1162,217,'_ckan_local_group_ckan_id','011e8933-7b86-412c-8fe6-752060d8e103');
INSERT INTO `ogdch_postmeta` VALUES (1163,217,'_ckan_local_group_ckan_name','social-security');
INSERT INTO `ogdch_postmeta` VALUES (1164,217,'_ckan_local_group_title_en','Social security');
INSERT INTO `ogdch_postmeta` VALUES (1165,217,'_ckan_local_group_title_de','Soziale Sicherheit');
INSERT INTO `ogdch_postmeta` VALUES (1166,217,'_ckan_local_group_title_fr','Protection sociale');
INSERT INTO `ogdch_postmeta` VALUES (1167,217,'_ckan_local_group_title_it','Sicurezza sociale');
INSERT INTO `ogdch_postmeta` VALUES (1168,217,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/social-security');
INSERT INTO `ogdch_postmeta` VALUES (1169,218,'_edit_lock','1449131281:1');
INSERT INTO `ogdch_postmeta` VALUES (1170,218,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1171,218,'_ckan_local_group_ckan_id','e5d8e87e-aa10-42f3-a7c2-1f45ee5707c2');
INSERT INTO `ogdch_postmeta` VALUES (1172,218,'_ckan_local_group_ckan_name','statistical-basis');
INSERT INTO `ogdch_postmeta` VALUES (1173,218,'_ckan_local_group_title_en','Statistical basis');
INSERT INTO `ogdch_postmeta` VALUES (1174,218,'_ckan_local_group_title_de','Statistische Grundlagen');
INSERT INTO `ogdch_postmeta` VALUES (1175,218,'_ckan_local_group_title_fr','Bases statistiques');
INSERT INTO `ogdch_postmeta` VALUES (1176,218,'_ckan_local_group_title_it','Basi statistiche');
INSERT INTO `ogdch_postmeta` VALUES (1177,218,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/statistical-basis');
INSERT INTO `ogdch_postmeta` VALUES (1178,219,'_edit_lock','1449131314:1');
INSERT INTO `ogdch_postmeta` VALUES (1179,219,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1180,219,'_ckan_local_group_ckan_id','6aace7ef-f167-40c9-a0d7-87e7e2681c07');
INSERT INTO `ogdch_postmeta` VALUES (1181,219,'_ckan_local_group_ckan_name','tourism');
INSERT INTO `ogdch_postmeta` VALUES (1182,219,'_ckan_local_group_title_en','Tourism');
INSERT INTO `ogdch_postmeta` VALUES (1183,219,'_ckan_local_group_title_de','Tourismus');
INSERT INTO `ogdch_postmeta` VALUES (1184,219,'_ckan_local_group_title_fr','Tourisme');
INSERT INTO `ogdch_postmeta` VALUES (1185,219,'_ckan_local_group_title_it','Turismo');
INSERT INTO `ogdch_postmeta` VALUES (1186,219,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/tourism');
INSERT INTO `ogdch_postmeta` VALUES (1187,220,'_edit_lock','1449131077:1');
INSERT INTO `ogdch_postmeta` VALUES (1188,220,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1189,220,'_ckan_local_group_ckan_id','afc7c340-9bdb-4767-bbcb-70094a1d0dcc');
INSERT INTO `ogdch_postmeta` VALUES (1190,220,'_ckan_local_group_ckan_name','administration');
INSERT INTO `ogdch_postmeta` VALUES (1191,220,'_ckan_local_group_title_en','Administration');
INSERT INTO `ogdch_postmeta` VALUES (1192,220,'_ckan_local_group_title_de','Verwaltung');
INSERT INTO `ogdch_postmeta` VALUES (1193,220,'_ckan_local_group_title_fr','Administration');
INSERT INTO `ogdch_postmeta` VALUES (1194,220,'_ckan_local_group_title_it','Amministrazione');
INSERT INTO `ogdch_postmeta` VALUES (1195,220,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/administration');
INSERT INTO `ogdch_postmeta` VALUES (1196,221,'_edit_lock','1449131201:1');
INSERT INTO `ogdch_postmeta` VALUES (1197,221,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1198,221,'_ckan_local_group_ckan_id','5389c3f2-2f64-436b-9fac-2d1fc342f7b5');
INSERT INTO `ogdch_postmeta` VALUES (1199,221,'_ckan_local_group_ckan_name','national-economy');
INSERT INTO `ogdch_postmeta` VALUES (1200,221,'_ckan_local_group_title_en','National economy');
INSERT INTO `ogdch_postmeta` VALUES (1201,221,'_ckan_local_group_title_de','Volkswirtschaft');
INSERT INTO `ogdch_postmeta` VALUES (1202,221,'_ckan_local_group_title_fr','Economie nationale');
INSERT INTO `ogdch_postmeta` VALUES (1203,221,'_ckan_local_group_title_it','Economia');
INSERT INTO `ogdch_postmeta` VALUES (1204,221,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/national-economy');
INSERT INTO `ogdch_postmeta` VALUES (1283,233,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (1284,233,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1285,233,'_menu_item_object_id','233');
INSERT INTO `ogdch_postmeta` VALUES (1286,233,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (1287,233,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1288,233,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1289,233,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1290,233,'_menu_item_url','/de/dataset');
INSERT INTO `ogdch_postmeta` VALUES (1292,234,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (1293,234,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1294,234,'_menu_item_object_id','234');
INSERT INTO `ogdch_postmeta` VALUES (1295,234,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (1296,234,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1297,234,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1298,234,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1299,234,'_menu_item_url','/de/organization');
INSERT INTO `ogdch_postmeta` VALUES (1310,236,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (1311,236,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1312,236,'_menu_item_object_id','236');
INSERT INTO `ogdch_postmeta` VALUES (1313,236,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (1314,236,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1315,236,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1316,236,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1317,236,'_menu_item_url','/de/app');
INSERT INTO `ogdch_postmeta` VALUES (1319,237,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (1320,237,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1321,237,'_menu_item_object_id','237');
INSERT INTO `ogdch_postmeta` VALUES (1322,237,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (1323,237,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1324,237,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1325,237,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1326,237,'_menu_item_url','/en/dataset');
INSERT INTO `ogdch_postmeta` VALUES (1328,238,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (1329,238,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1330,238,'_menu_item_object_id','238');
INSERT INTO `ogdch_postmeta` VALUES (1331,238,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (1332,238,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1333,238,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1334,238,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1335,238,'_menu_item_url','/en/organization');
INSERT INTO `ogdch_postmeta` VALUES (1337,239,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (1338,239,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1339,239,'_menu_item_object_id','239');
INSERT INTO `ogdch_postmeta` VALUES (1340,239,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (1341,239,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1342,239,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1343,239,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1344,239,'_menu_item_url','/en/app/');
INSERT INTO `ogdch_postmeta` VALUES (1346,240,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (1347,240,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1348,240,'_menu_item_object_id','240');
INSERT INTO `ogdch_postmeta` VALUES (1349,240,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (1350,240,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1351,240,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1352,240,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1353,240,'_menu_item_url','/fr/dataset');
INSERT INTO `ogdch_postmeta` VALUES (1355,241,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (1356,241,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1357,241,'_menu_item_object_id','241');
INSERT INTO `ogdch_postmeta` VALUES (1358,241,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (1359,241,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1360,241,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1361,241,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1362,241,'_menu_item_url','/fr/organization');
INSERT INTO `ogdch_postmeta` VALUES (1364,242,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (1365,242,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1366,242,'_menu_item_object_id','242');
INSERT INTO `ogdch_postmeta` VALUES (1367,242,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (1368,242,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1369,242,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1370,242,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1371,242,'_menu_item_url','/fr/app/');
INSERT INTO `ogdch_postmeta` VALUES (1373,243,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (1374,243,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1375,243,'_menu_item_object_id','243');
INSERT INTO `ogdch_postmeta` VALUES (1376,243,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (1377,243,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1378,243,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1379,243,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1380,243,'_menu_item_url','/it/dataset');
INSERT INTO `ogdch_postmeta` VALUES (1382,244,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (1383,244,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1384,244,'_menu_item_object_id','244');
INSERT INTO `ogdch_postmeta` VALUES (1385,244,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (1386,244,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1387,244,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1388,244,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1389,244,'_menu_item_url','/it/organization');
INSERT INTO `ogdch_postmeta` VALUES (1391,245,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (1392,245,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1393,245,'_menu_item_object_id','245');
INSERT INTO `ogdch_postmeta` VALUES (1394,245,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (1395,245,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1396,245,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1397,245,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1398,245,'_menu_item_url','/it/app/');
INSERT INTO `ogdch_postmeta` VALUES (1472,246,'_edit_lock','1449231868:1');
INSERT INTO `ogdch_postmeta` VALUES (1473,246,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1474,246,'_ckan_local_org_ckan_id','7dbaad15-597f-499c-9a72-95de38b95cad');
INSERT INTO `ogdch_postmeta` VALUES (1475,246,'_ckan_local_org_ckan_name','bundesarchiv');
INSERT INTO `ogdch_postmeta` VALUES (1476,246,'_ckan_local_org_title_en','Federal Archives');
INSERT INTO `ogdch_postmeta` VALUES (1477,246,'_ckan_local_org_title_de','Bundesarchiv');
INSERT INTO `ogdch_postmeta` VALUES (1478,246,'_ckan_local_org_title_fr','Archives fédérales');
INSERT INTO `ogdch_postmeta` VALUES (1479,246,'_ckan_local_org_title_it','Archivio federale');
INSERT INTO `ogdch_postmeta` VALUES (1480,214,'_ckan_local_group_title_en','Politics');
INSERT INTO `ogdch_postmeta` VALUES (1481,213,'_ckan_local_group_title_en','Public order and security');
INSERT INTO `ogdch_postmeta` VALUES (1482,213,'_ckan_local_group_title_fr','Ordre et sécurité publics');
INSERT INTO `ogdch_postmeta` VALUES (1483,213,'_ckan_local_group_title_it','Ordine pubblico e sicurezza pubblica');
INSERT INTO `ogdch_postmeta` VALUES (1484,210,'_ckan_local_group_title_en','Culture, media, information society, sport');
INSERT INTO `ogdch_postmeta` VALUES (1485,207,'_ckan_local_group_title_en','Trade');
INSERT INTO `ogdch_postmeta` VALUES (1486,207,'_ckan_local_group_title_fr','Commerce');
INSERT INTO `ogdch_postmeta` VALUES (1487,207,'_ckan_local_group_title_it','Commercio');
INSERT INTO `ogdch_postmeta` VALUES (1488,206,'_ckan_local_group_title_it','Sanità');
INSERT INTO `ogdch_postmeta` VALUES (1489,204,'_ckan_local_group_title_en','Geography');
INSERT INTO `ogdch_postmeta` VALUES (1490,204,'_ckan_local_group_title_fr','Géographie');
INSERT INTO `ogdch_postmeta` VALUES (1491,204,'_ckan_local_group_title_it','Geografia');
INSERT INTO `ogdch_postmeta` VALUES (1492,200,'_ckan_local_group_title_en','Construction and housing');
INSERT INTO `ogdch_postmeta` VALUES (1493,200,'_ckan_local_group_title_it','Costruzione e abitazione');
INSERT INTO `ogdch_postmeta` VALUES (1515,247,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1517,247,'_edit_lock','1447428784:1');
INSERT INTO `ogdch_postmeta` VALUES (1519,248,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1521,248,'_edit_lock','1446645837:1');
INSERT INTO `ogdch_postmeta` VALUES (1523,249,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1526,249,'_edit_lock','1446645845:1');
INSERT INTO `ogdch_postmeta` VALUES (1530,250,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1534,250,'_edit_lock','1465487844:1');
INSERT INTO `ogdch_postmeta` VALUES (1825,195,'_app-showcase-app_icon_id','290');
INSERT INTO `ogdch_postmeta` VALUES (1826,195,'_app-showcase-app_icon','http://ogdch.dev/content/uploads/2015/09/liip.png');
INSERT INTO `ogdch_postmeta` VALUES (1827,196,'_app-showcase-app_icon_id','290');
INSERT INTO `ogdch_postmeta` VALUES (1828,196,'_app-showcase-app_icon','http://ogdch.dev/content/uploads/2015/09/liip.png');
INSERT INTO `ogdch_postmeta` VALUES (1829,197,'_app-showcase-app_icon_id','290');
INSERT INTO `ogdch_postmeta` VALUES (1830,197,'_app-showcase-app_icon','http://ogdch.dev/content/uploads/2015/09/liip.png');
INSERT INTO `ogdch_postmeta` VALUES (1831,198,'_app-showcase-app_icon_id','290');
INSERT INTO `ogdch_postmeta` VALUES (1832,198,'_app-showcase-app_icon','http://ogdch.dev/content/uploads/2015/09/liip.png');
INSERT INTO `ogdch_postmeta` VALUES (1833,284,'_ckan_local_dataset_ckan_id','ac9396cd-09a8-41d6-9d9a-acbd5a2f15e0');
INSERT INTO `ogdch_postmeta` VALUES (1834,284,'_ckan_local_dataset_ckan_name','railway-noise-night');
INSERT INTO `ogdch_postmeta` VALUES (1835,284,'_ckan_local_dataset_identifier','a:2:{s:19:\"original_identifier\";s:3:\"325\";s:12:\"organisation\";s:9:\"swisstopo\";}');
INSERT INTO `ogdch_postmeta` VALUES (1836,284,'_ckan_local_dataset_issued','1366934400');
INSERT INTO `ogdch_postmeta` VALUES (1837,284,'_ckan_local_dataset_modified','1430006400');
INSERT INTO `ogdch_postmeta` VALUES (1839,284,'_ckan_local_dataset_keywords','a:4:{s:2:\"de\";a:2:{i:0;s:9:\"Eisenbahn\";i:1;s:5:\"Nacht\";}s:2:\"fr\";a:2:{i:0;s:13:\"Chemin-de-fer\";i:1;s:4:\"Nuit\";}s:2:\"it\";a:2:{i:0;s:8:\"Ferrovia\";i:1;s:5:\"Noche\";}s:2:\"en\";a:2:{i:0;s:8:\"Railroad\";i:1;s:5:\"Night\";}}');
INSERT INTO `ogdch_postmeta` VALUES (1843,284,'_ckan_local_dataset_accrual_periodicity','http://purl.org/cld/freq/daily');
INSERT INTO `ogdch_postmeta` VALUES (1844,284,'_ckan_local_dataset_title_en','Railway noise night');
INSERT INTO `ogdch_postmeta` VALUES (1845,284,'_ckan_local_dataset_description_en','The map shows how the population is exposed by the noise pollution of the rail system.');
INSERT INTO `ogdch_postmeta` VALUES (1846,284,'_ckan_local_dataset_title_de','Eisenbahnlärm Nacht');
INSERT INTO `ogdch_postmeta` VALUES (1847,284,'_ckan_local_dataset_description_de','Die Karte zeigt, welcher Lärmbelastung die Bevölkerung durch den Schienenverkehr ausgesetzt ist.');
INSERT INTO `ogdch_postmeta` VALUES (1848,284,'_ckan_local_dataset_title_fr','Bruit ferroviaire nuit');
INSERT INTO `ogdch_postmeta` VALUES (1849,284,'_ckan_local_dataset_description_fr','La carte montre que la pollution sonore est suspendu par le système de rail, la population.');
INSERT INTO `ogdch_postmeta` VALUES (1850,284,'_ckan_local_dataset_title_it','Rumore ferroviario notte');
INSERT INTO `ogdch_postmeta` VALUES (1851,284,'_ckan_local_dataset_description_it','La mappa mostra che l\'inquinamento acustico è sospeso dal sistema ferroviario, la popolazione.');
INSERT INTO `ogdch_postmeta` VALUES (1852,284,'_ckan_local_dataset_publishers','a:2:{i:0;a:1:{s:5:\"label\";s:41:\"Bundesamt für Landestopografie swisstopo\";}i:1;a:1:{s:5:\"label\";s:21:\"Bundesamt für Umwelt\";}}');
INSERT INTO `ogdch_postmeta` VALUES (1853,284,'_ckan_local_dataset_contact_points','a:2:{i:0;a:2:{s:4:\"name\";s:20:\"Abteilung Lärm BAFU\";s:5:\"email\";s:19:\"noise@bafu.admin.ch\";}i:1;a:2:{s:4:\"name\";s:13:\"Heinz Müller\";s:5:\"email\";s:19:\"heinz@bafu.admin.ch\";}}');
INSERT INTO `ogdch_postmeta` VALUES (1854,284,'_ckan_local_dataset_relations','a:1:{i:0;a:2:{s:5:\"label\";s:17:\"Webseite des BAFU\";s:3:\"url\";s:49:\"http://www.bafu.admin.ch/laerm/index.html?lang=de\";}}');
INSERT INTO `ogdch_postmeta` VALUES (1855,284,'_ckan_local_dataset_temporals','a:2:{i:0;a:2:{s:10:\"start_date\";i:-2046124800;s:8:\"end_date\";i:1357344000;}i:1;a:2:{s:10:\"start_date\";i:1362096000;s:8:\"end_date\";i:1420416000;}}');
INSERT INTO `ogdch_postmeta` VALUES (1856,284,'_ckan_local_dataset_see_alsos','a:1:{i:0;a:1:{s:18:\"dataset_identifier\";s:13:\"326@swisstopo\";}}');
INSERT INTO `ogdch_postmeta` VALUES (1857,284,'_ckan_local_dataset_distributions','a:1:{i:0;a:11:{s:10:\"identifier\";s:29:\"ch.bafu.laerm-bahnlaerm_nacht\";s:8:\"title_en\";s:35:\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\";s:14:\"description_en\";s:61:\"The information is based on comprehensive model calculations.\";s:8:\"title_de\";s:35:\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\";s:14:\"description_de\";s:62:\"Die Angaben basieren auf flächendeckenden Modellberechnungen.\";s:9:\"languages\";a:2:{i:0;s:2:\"en\";i:1;s:2:\"de\";}s:6:\"issued\";i:1368230400;s:8:\"modified\";i:1430006400;s:6:\"rights\";s:59:\"NonCommercialAllowed-CommercialAllowed-ReferenceNotRequired\";s:10:\"access_url\";s:24:\"http://wms.geo.admin.ch/\";s:9:\"byte_size\";s:4:\"1024\";}}');
INSERT INTO `ogdch_postmeta` VALUES (1858,284,'_edit_lock','1449231812:1');
INSERT INTO `ogdch_postmeta` VALUES (1859,284,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1860,285,'_edit_lock','1465376291:1');
INSERT INTO `ogdch_postmeta` VALUES (1861,285,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1862,285,'_ckan_local_dataset_ckan_id','52368b85-350c-450e-a18e-f2fb6fa7ae7a');
INSERT INTO `ogdch_postmeta` VALUES (1863,285,'_ckan_local_dataset_ckan_name','baustellen');
INSERT INTO `ogdch_postmeta` VALUES (1864,285,'_ckan_local_dataset_identifier','a:2:{s:19:\"original_identifier\";s:3:\"123\";s:12:\"organisation\";s:12:\"bundesarchiv\";}');
INSERT INTO `ogdch_postmeta` VALUES (1865,285,'_ckan_local_dataset_title_en','Building Sites');
INSERT INTO `ogdch_postmeta` VALUES (1866,285,'_ckan_local_dataset_description_en','Description EN');
INSERT INTO `ogdch_postmeta` VALUES (1867,285,'_ckan_local_dataset_title_de','Baustellen');
INSERT INTO `ogdch_postmeta` VALUES (1868,285,'_ckan_local_dataset_description_de','Beschreibung DE');
INSERT INTO `ogdch_postmeta` VALUES (1869,285,'_ckan_local_dataset_title_fr','Baustellen');
INSERT INTO `ogdch_postmeta` VALUES (1870,285,'_ckan_local_dataset_description_fr','Description FR');
INSERT INTO `ogdch_postmeta` VALUES (1871,285,'_ckan_local_dataset_title_it','Chantiers');
INSERT INTO `ogdch_postmeta` VALUES (1872,285,'_ckan_local_dataset_description_it','Description IT');
INSERT INTO `ogdch_postmeta` VALUES (1873,285,'_ckan_local_dataset_issued','1441670400');
INSERT INTO `ogdch_postmeta` VALUES (1874,285,'_ckan_local_dataset_modified','1441756800');
INSERT INTO `ogdch_postmeta` VALUES (1875,285,'_ckan_local_dataset_publishers','a:1:{i:0;a:1:{s:5:\"label\";s:12:\"Bundesarchiv\";}}');
INSERT INTO `ogdch_postmeta` VALUES (1876,285,'_ckan_local_dataset_contact_points','a:1:{i:0;a:2:{s:4:\"name\";s:6:\"Pierre\";s:5:\"email\";s:13:\"pierre@bar.ch\";}}');
INSERT INTO `ogdch_postmeta` VALUES (1878,285,'_ckan_local_dataset_accrual_periodicity','http://purl.org/cld/freq/completelyIrregular');
INSERT INTO `ogdch_postmeta` VALUES (1879,285,'_ckan_local_dataset_distributions','a:1:{i:0;a:10:{s:8:\"title_en\";s:19:\"Building Sites 2014\";s:14:\"description_en\";s:14:\"Description EN\";s:8:\"title_de\";s:15:\"Baustellen 2014\";s:14:\"description_de\";s:15:\"Beschreibung DE\";s:9:\"languages\";a:2:{i:0;s:2:\"en\";i:1;s:2:\"de\";}s:6:\"issued\";i:1441843200;s:8:\"modified\";i:1442275200;s:6:\"rights\";s:66:\"NonCommercialAllowed-CommercialWithPermission-ReferenceNotRequired\";s:10:\"access_url\";s:18:\"http://download.ch\";s:12:\"download_url\";s:18:\"http://download.ch\";}}');
INSERT INTO `ogdch_postmeta` VALUES (1880,286,'_menu_item_type','post_type');
INSERT INTO `ogdch_postmeta` VALUES (1881,286,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1882,286,'_menu_item_object_id','2');
INSERT INTO `ogdch_postmeta` VALUES (1883,286,'_menu_item_object','page');
INSERT INTO `ogdch_postmeta` VALUES (1884,286,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1885,286,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1886,286,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1887,286,'_menu_item_url','');
INSERT INTO `ogdch_postmeta` VALUES (1889,287,'_menu_item_type','post_type');
INSERT INTO `ogdch_postmeta` VALUES (1890,287,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1891,287,'_menu_item_object_id','97');
INSERT INTO `ogdch_postmeta` VALUES (1892,287,'_menu_item_object','page');
INSERT INTO `ogdch_postmeta` VALUES (1893,287,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1894,287,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1895,287,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1896,287,'_menu_item_url','');
INSERT INTO `ogdch_postmeta` VALUES (1898,288,'_menu_item_type','post_type');
INSERT INTO `ogdch_postmeta` VALUES (1899,288,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1900,288,'_menu_item_object_id','119');
INSERT INTO `ogdch_postmeta` VALUES (1901,288,'_menu_item_object','page');
INSERT INTO `ogdch_postmeta` VALUES (1902,288,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1903,288,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1904,288,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1905,288,'_menu_item_url','');
INSERT INTO `ogdch_postmeta` VALUES (1907,289,'_menu_item_type','post_type');
INSERT INTO `ogdch_postmeta` VALUES (1908,289,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1909,289,'_menu_item_object_id','118');
INSERT INTO `ogdch_postmeta` VALUES (1910,289,'_menu_item_object','page');
INSERT INTO `ogdch_postmeta` VALUES (1911,289,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1912,289,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1913,289,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1914,289,'_menu_item_url','');
INSERT INTO `ogdch_postmeta` VALUES (1916,195,'_app-showcase-app_relations','a:1:{i:0;a:1:{s:10:\"dataset_id\";s:13:\"325@swisstopo\";}}');
INSERT INTO `ogdch_postmeta` VALUES (1917,196,'_app-showcase-app_relations','a:1:{i:0;a:1:{s:10:\"dataset_id\";s:13:\"325@swisstopo\";}}');
INSERT INTO `ogdch_postmeta` VALUES (1918,197,'_app-showcase-app_relations','a:1:{i:0;a:1:{s:10:\"dataset_id\";s:13:\"325@swisstopo\";}}');
INSERT INTO `ogdch_postmeta` VALUES (1919,198,'_app-showcase-app_relations','a:1:{i:0;a:1:{s:10:\"dataset_id\";s:13:\"325@swisstopo\";}}');
INSERT INTO `ogdch_postmeta` VALUES (1932,2,'_wp_page_template','default');
INSERT INTO `ogdch_postmeta` VALUES (1959,290,'_wp_attached_file','2015/09/liip.png');
INSERT INTO `ogdch_postmeta` VALUES (1960,290,'_wp_attachment_metadata','a:4:{s:5:\"width\";i:360;s:6:\"height\";i:360;s:4:\"file\";s:16:\"2015/09/liip.png\";s:10:\"image_meta\";a:11:{s:8:\"aperture\";i:0;s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";i:0;s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";i:0;s:3:\"iso\";i:0;s:13:\"shutter_speed\";i:0;s:5:\"title\";s:0:\"\";s:11:\"orientation\";i:0;}}');
INSERT INTO `ogdch_postmeta` VALUES (1964,97,'_wp_page_template','default');
INSERT INTO `ogdch_postmeta` VALUES (1965,118,'_wp_page_template','default');
INSERT INTO `ogdch_postmeta` VALUES (1966,119,'_wp_page_template','default');
INSERT INTO `ogdch_postmeta` VALUES (1967,221,'_wp_old_slug','volkswirtschaft');
INSERT INTO `ogdch_postmeta` VALUES (1968,220,'_wp_old_slug','verwaltung');
INSERT INTO `ogdch_postmeta` VALUES (1969,219,'_wp_old_slug','tourismus');
INSERT INTO `ogdch_postmeta` VALUES (1970,218,'_wp_old_slug','statistische-grundlagen');
INSERT INTO `ogdch_postmeta` VALUES (1971,217,'_wp_old_slug','soziale-sicherheit');
INSERT INTO `ogdch_postmeta` VALUES (1972,216,'_wp_old_slug','preise');
INSERT INTO `ogdch_postmeta` VALUES (1973,214,'_wp_old_slug','politik');
INSERT INTO `ogdch_postmeta` VALUES (1974,213,'_wp_old_slug','sicherheit');
INSERT INTO `ogdch_postmeta` VALUES (1975,212,'_wp_old_slug','mobilitaet');
INSERT INTO `ogdch_postmeta` VALUES (1976,211,'_wp_old_slug','landwirtschaft');
INSERT INTO `ogdch_postmeta` VALUES (1977,210,'_wp_old_slug','kultur');
INSERT INTO `ogdch_postmeta` VALUES (1978,209,'_wp_old_slug','kriminalitaet');
INSERT INTO `ogdch_postmeta` VALUES (1979,208,'_wp_old_slug','industrie');
INSERT INTO `ogdch_postmeta` VALUES (1980,207,'_wp_old_slug','handel');
INSERT INTO `ogdch_postmeta` VALUES (1981,206,'_wp_old_slug','gesundheit');
INSERT INTO `ogdch_postmeta` VALUES (1982,205,'_wp_old_slug','gesetzgebung');
INSERT INTO `ogdch_postmeta` VALUES (1983,204,'_wp_old_slug','geographie');
INSERT INTO `ogdch_postmeta` VALUES (1984,203,'_wp_old_slug','finanzen');
INSERT INTO `ogdch_postmeta` VALUES (1985,202,'_wp_old_slug','energie');
INSERT INTO `ogdch_postmeta` VALUES (1986,201,'_wp_old_slug','bildung');
INSERT INTO `ogdch_postmeta` VALUES (1987,200,'_wp_old_slug','bauwesen');
INSERT INTO `ogdch_postmeta` VALUES (1988,199,'_wp_old_slug','arbeit');
INSERT INTO `ogdch_postmeta` VALUES (1989,193,'_wp_old_slug','raum');
INSERT INTO `ogdch_postmeta` VALUES (1990,192,'_wp_old_slug','bevoelkerung');
INSERT INTO `ogdch_postmeta` VALUES (1991,285,'_ckan_local_dataset_themes','a:2:{i:0;s:10:\"population\";i:1;s:9:\"territory\";}');
INSERT INTO `ogdch_postmeta` VALUES (1992,284,'_ckan_local_dataset_themes','a:2:{i:0;s:10:\"population\";i:1;s:9:\"territory\";}');
INSERT INTO `ogdch_postmeta` VALUES (1993,291,'_edit_lock','1449231903:1');
INSERT INTO `ogdch_postmeta` VALUES (1994,291,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1995,291,'_ckan_local_org_ckan_id','091dde3d-99db-4da3-a2c5-b41741c18502');
INSERT INTO `ogdch_postmeta` VALUES (1996,291,'_ckan_local_org_ckan_name','sub-organization');
INSERT INTO `ogdch_postmeta` VALUES (1997,291,'_ckan_local_org_title_en','Sub-Organization');
INSERT INTO `ogdch_postmeta` VALUES (1998,291,'_ckan_local_org_title_de','Sub-Organization');
INSERT INTO `ogdch_postmeta` VALUES (1999,291,'_ckan_local_org_title_fr','Sub-Organization');
INSERT INTO `ogdch_postmeta` VALUES (2000,291,'_ckan_local_org_title_it','Sub-Organization');
INSERT INTO `ogdch_postmeta` VALUES (2001,291,'_ckan_local_org_parent','swisstopo');
INSERT INTO `ogdch_postmeta` VALUES (2002,291,'_ckan_local_org_image_id','290');
INSERT INTO `ogdch_postmeta` VALUES (2003,291,'_ckan_local_org_image','http://ogdch.dev/content/uploads/2015/09/liip.png');
INSERT INTO `ogdch_postmeta` VALUES (2045,284,'_ckan_local_dataset_spatial','');
INSERT INTO `ogdch_postmeta` VALUES (2046,284,'_ckan_local_dataset_coverage','');
INSERT INTO `ogdch_postmeta` VALUES (2047,297,'_ckan_local_dataset_ckan_id','2d6dadf3-b6f6-4df4-8a6f-06dd43f284e4');
INSERT INTO `ogdch_postmeta` VALUES (2048,297,'_ckan_local_dataset_ckan_name','national-boundaries');
INSERT INTO `ogdch_postmeta` VALUES (2049,297,'_ckan_local_dataset_identifier','a:2:{s:19:\"original_identifier\";s:15:\"swissBOUNDARIES\";s:12:\"organisation\";s:9:\"swisstopo\";}');
INSERT INTO `ogdch_postmeta` VALUES (2050,297,'_ckan_local_dataset_issued','1366934400');
INSERT INTO `ogdch_postmeta` VALUES (2051,297,'_ckan_local_dataset_modified','1430006400');
INSERT INTO `ogdch_postmeta` VALUES (2052,297,'_ckan_local_dataset_themes','a:1:{i:0;s:9:\"territory\";}');
INSERT INTO `ogdch_postmeta` VALUES (2053,297,'_ckan_local_dataset_keywords','a:4:{s:2:\"de\";a:2:{i:0;s:12:\"Landesgrenze\";i:1;s:20:\"Verwaltungseinheiten\";}s:2:\"fr\";a:2:{i:0;s:22:\"Frontières nationales\";i:1;s:23:\"Unités administratives\";}s:2:\"it\";a:2:{i:0;s:19:\"Frontiere nazionali\";i:1;s:20:\"Unita amministrative\";}s:2:\"en\";a:2:{i:0;s:19:\"National boundaries\";i:1;s:20:\"Administrative units\";}}');
INSERT INTO `ogdch_postmeta` VALUES (2055,297,'_ckan_local_dataset_spatial','');
INSERT INTO `ogdch_postmeta` VALUES (2056,297,'_ckan_local_dataset_coverage','');
INSERT INTO `ogdch_postmeta` VALUES (2057,297,'_ckan_local_dataset_accrual_periodicity','http://purl.org/cld/freq/annual');
INSERT INTO `ogdch_postmeta` VALUES (2058,297,'_ckan_local_dataset_title_en','National boundaries');
INSERT INTO `ogdch_postmeta` VALUES (2059,297,'_ckan_local_dataset_description_en','swissBOUNDARIES national boundaries constitute the borders of Switzerland and the principality of Liechtenstein.');
INSERT INTO `ogdch_postmeta` VALUES (2060,297,'_ckan_local_dataset_title_de','Landesgrenzen');
INSERT INTO `ogdch_postmeta` VALUES (2061,297,'_ckan_local_dataset_description_de','swissBOUNDARIES3D Landesgrenzen umfasst die Landesgrenzen der Schweiz und des Fürstentums Liechtenstein.');
INSERT INTO `ogdch_postmeta` VALUES (2062,297,'_ckan_local_dataset_title_fr','Frontières nationales');
INSERT INTO `ogdch_postmeta` VALUES (2063,297,'_ckan_local_dataset_description_fr','swissBOUNDARIES3D frontières nationales comprend la frontière de la Suisse et de la Principauté de Liechtenstein.');
INSERT INTO `ogdch_postmeta` VALUES (2064,297,'_ckan_local_dataset_title_it','Frontiere nazionali');
INSERT INTO `ogdch_postmeta` VALUES (2065,297,'_ckan_local_dataset_description_it','swissBOUNDARIES3D frontiere nazionali contiene la frontiera della Svizzera e del Principato del Liechtenstein.');
INSERT INTO `ogdch_postmeta` VALUES (2066,297,'_ckan_local_dataset_publishers','a:1:{i:0;a:1:{s:5:\"label\";s:41:\"Bundesamt für Landestopografie swisstopo\";}}');
INSERT INTO `ogdch_postmeta` VALUES (2067,297,'_ckan_local_dataset_contact_points','a:1:{i:0;a:2:{s:4:\"name\";s:39:\"geodata Bundesamt für Landestopografie\";s:5:\"email\";s:20:\"geodata@swisstopo.ch\";}}');
INSERT INTO `ogdch_postmeta` VALUES (2068,297,'_ckan_local_dataset_relations','a:1:{i:0;a:2:{s:5:\"label\";s:24:\"Webseite swissBOUNDARIES\";s:3:\"url\";s:98:\"http://www.swisstopo.admin.ch/internet/swisstopo/de/home/products/landscape/swissBOUNDARIES3D.html\";}}');
INSERT INTO `ogdch_postmeta` VALUES (2069,297,'_ckan_local_dataset_temporals','a:1:{i:0;a:2:{s:10:\"start_date\";i:1420070400;s:8:\"end_date\";i:1451520000;}}');
INSERT INTO `ogdch_postmeta` VALUES (2070,297,'_ckan_local_dataset_see_alsos','a:1:{i:0;a:1:{s:18:\"dataset_identifier\";s:16:\"123@bundesarchiv\";}}');
INSERT INTO `ogdch_postmeta` VALUES (2071,297,'_ckan_local_dataset_distributions','a:2:{i:0;a:17:{s:10:\"identifier\";s:30:\"swissboundaries3d-land-flaeche\";s:8:\"title_en\";s:0:\"\";s:14:\"description_en\";s:0:\"\";s:8:\"title_de\";s:0:\"\";s:14:\"description_de\";s:0:\"\";s:8:\"title_fr\";s:0:\"\";s:14:\"description_fr\";s:0:\"\";s:8:\"title_it\";s:0:\"\";s:14:\"description_it\";s:0:\"\";s:9:\"languages\";b:0;s:6:\"issued\";i:1419984000;s:8:\"modified\";b:0;s:6:\"rights\";s:59:\"NonCommercialAllowed-CommercialAllowed-ReferenceNotRequired\";s:10:\"access_url\";s:99:\"http://data.geo.admin.ch.s3.amazonaws.com/ch.swisstopo.swissboundaries3d-land-flaeche.fill/data.zip\";s:12:\"download_url\";s:99:\"http://data.geo.admin.ch.s3.amazonaws.com/ch.swisstopo.swissboundaries3d-land-flaeche.fill/data.zip\";s:9:\"byte_size\";s:6:\"209870\";s:10:\"media_type\";s:15:\"application/zip\";}i:1;a:9:{s:8:\"title_en\";s:6:\"ReadMe\";s:8:\"title_de\";s:6:\"ReadMe\";s:8:\"title_fr\";s:6:\"ReadMe\";s:8:\"title_it\";s:6:\"ReadMe\";s:6:\"issued\";i:1419984000;s:6:\"rights\";s:59:\"NonCommercialAllowed-CommercialAllowed-ReferenceNotRequired\";s:10:\"access_url\";s:101:\"http://data.geo.admin.ch.s3.amazonaws.com/ch.swisstopo.swissboundaries3d-land-flaeche.fill/readme.txt\";s:12:\"download_url\";s:101:\"http://data.geo.admin.ch.s3.amazonaws.com/ch.swisstopo.swissboundaries3d-land-flaeche.fill/readme.txt\";s:9:\"byte_size\";s:4:\"1389\";}}');
INSERT INTO `ogdch_postmeta` VALUES (2072,297,'_edit_lock','1449231773:1');
INSERT INTO `ogdch_postmeta` VALUES (2073,297,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (2074,195,'_thumbnail_id','290');
INSERT INTO `ogdch_postmeta` VALUES (2075,196,'_thumbnail_id','290');
INSERT INTO `ogdch_postmeta` VALUES (2076,197,'_thumbnail_id','290');
INSERT INTO `ogdch_postmeta` VALUES (2077,198,'_thumbnail_id','290');
INSERT INTO `ogdch_postmeta` VALUES (2084,247,'_wp_page_template','default');
INSERT INTO `ogdch_postmeta` VALUES (2103,300,'_edit_lock','1449231832:1');
INSERT INTO `ogdch_postmeta` VALUES (2104,300,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (2105,300,'_ckan_local_org_ckan_id','244099c1-a313-48cb-861b-55f2d42ccb7d');
INSERT INTO `ogdch_postmeta` VALUES (2106,300,'_ckan_local_org_ckan_name','bibliothek-am-guisanplatz');
INSERT INTO `ogdch_postmeta` VALUES (2107,300,'_ckan_local_org_title_en','The Library Am Guisanplatz');
INSERT INTO `ogdch_postmeta` VALUES (2108,300,'_ckan_local_org_title_de','Bibliothek am Guisanplatz');
INSERT INTO `ogdch_postmeta` VALUES (2109,300,'_ckan_local_org_title_fr','Bibliothèque Am Guisanplatz');
INSERT INTO `ogdch_postmeta` VALUES (2110,300,'_ckan_local_org_title_it','Biblioteca Am Guisanplatz');
INSERT INTO `ogdch_postmeta` VALUES (2111,301,'_edit_lock','1449231887:1');
INSERT INTO `ogdch_postmeta` VALUES (2112,301,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (2113,301,'_ckan_local_org_ckan_id','51941490-5ade-4d06-b708-ff04279ce550');
INSERT INTO `ogdch_postmeta` VALUES (2114,301,'_ckan_local_org_ckan_name','schweizerische-nationalbibliothek');
INSERT INTO `ogdch_postmeta` VALUES (2115,301,'_ckan_local_org_title_en','Swiss National Library');
INSERT INTO `ogdch_postmeta` VALUES (2116,301,'_ckan_local_org_description_en','Collects all Swiss publications since 1848. The Swiss Literary Archives, the Cabinet of Prints and Drawings and the Centre Dürrenmatt also belong to the National Library.');
INSERT INTO `ogdch_postmeta` VALUES (2117,301,'_ckan_local_org_title_de','Schweizerische Nationalbibliothek');
INSERT INTO `ogdch_postmeta` VALUES (2118,301,'_ckan_local_org_description_de','Sammelt alle Schweizer Publikationen seit 1848. Ebenfalls zur Nationalbibliothek gehören das Schweizerische Literaturarchiv, die Graphische Sammlung und das Centre Dürrenmatt.');
INSERT INTO `ogdch_postmeta` VALUES (2119,301,'_ckan_local_org_title_fr','Bibliothèque nationale suisse');
INSERT INTO `ogdch_postmeta` VALUES (2120,301,'_ckan_local_org_description_fr','Collecte l’ensemble des publications suisses depuis 1848. Les Archives littéraires suisses, le Cabinet des estampes et le Centre Dürrenmatt font également partie de la Bibliothèque nationale.');
INSERT INTO `ogdch_postmeta` VALUES (2121,301,'_ckan_local_org_title_it','Biblioteca nazionale svizzera');
INSERT INTO `ogdch_postmeta` VALUES (2122,301,'_ckan_local_org_description_it','Colleziona tutte le pubblicazioni a partire dal 1848. Alla Biblioteca nazionale sono accorpati l\'Archivio svizzero di letteratura, il Gabinetto delle stampe e il Centre Dürrenmatt.');
INSERT INTO `ogdch_postmeta` VALUES (2123,302,'_edit_lock','1449231844:1');
INSERT INTO `ogdch_postmeta` VALUES (2124,302,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (2125,302,'_ckan_local_org_ckan_id','1caae51a-0ab6-4bee-8104-5716bbbf43ba');
INSERT INTO `ogdch_postmeta` VALUES (2126,302,'_ckan_local_org_ckan_name','bundesamt-fur-gesundheit');
INSERT INTO `ogdch_postmeta` VALUES (2127,302,'_ckan_local_org_title_en','Bundesamt für Gesundheit');
INSERT INTO `ogdch_postmeta` VALUES (2128,302,'_ckan_local_org_title_de','Bundesamt für Gesundheit');
INSERT INTO `ogdch_postmeta` VALUES (2129,302,'_ckan_local_org_title_fr','Bundesamt für Gesundheit');
INSERT INTO `ogdch_postmeta` VALUES (2130,302,'_ckan_local_org_title_it','Bundesamt für Gesundheit');
INSERT INTO `ogdch_postmeta` VALUES (2131,303,'_edit_lock','1449231875:1');
INSERT INTO `ogdch_postmeta` VALUES (2132,303,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (2133,303,'_ckan_local_org_ckan_id','07bf374b-0883-4b03-9f40-25d1048a1611');
INSERT INTO `ogdch_postmeta` VALUES (2134,303,'_ckan_local_org_ckan_name','schweizerische-bundesbahnen-sbb');
INSERT INTO `ogdch_postmeta` VALUES (2135,303,'_ckan_local_org_title_en','Swiss Federal Railways');
INSERT INTO `ogdch_postmeta` VALUES (2136,303,'_ckan_local_org_title_de','Schweizerische Bundesbahnen (SBB)');
INSERT INTO `ogdch_postmeta` VALUES (2137,303,'_ckan_local_org_title_fr','Chemins de fer fédéraux suisses (CFF)');
INSERT INTO `ogdch_postmeta` VALUES (2138,303,'_ckan_local_org_title_it','Ferrovie federali svizzere (FFS)');
INSERT INTO `ogdch_postmeta` VALUES (2139,304,'_edit_lock','1449231860:1');
INSERT INTO `ogdch_postmeta` VALUES (2140,304,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (2141,304,'_ckan_local_org_ckan_id','47bc53e3-f6b2-46c9-a4eb-4889fc1d3105');
INSERT INTO `ogdch_postmeta` VALUES (2142,304,'_ckan_local_org_ckan_name','bundesamt-fur-statistik');
INSERT INTO `ogdch_postmeta` VALUES (2143,304,'_ckan_local_org_title_en','Swiss Federal Statistical Office');
INSERT INTO `ogdch_postmeta` VALUES (2144,304,'_ckan_local_org_description_en','Publishes information on the situation and trends in Switzerland in many different areas of life. It provides the quantitative information needed to understand the present and to plan for the future.');
INSERT INTO `ogdch_postmeta` VALUES (2145,304,'_ckan_local_org_title_de','Bundesamt für Statistik');
INSERT INTO `ogdch_postmeta` VALUES (2146,304,'_ckan_local_org_description_de','Orientiert über den Stand und die Entwicklung der Schweiz in zahlreichen Lebensbereichen. Es liefert die quantitativen Informationen, um die Gegenwart zu verstehen und die Zukunft zu planen.');
INSERT INTO `ogdch_postmeta` VALUES (2147,304,'_ckan_local_org_title_fr','Office fédéral de la statistique');
INSERT INTO `ogdch_postmeta` VALUES (2148,304,'_ckan_local_org_description_fr','Fournit des informations sur l’état et l’évolution de la Suisse dans de nombreux domaines. Les informations qu’il produit servent à comprendre le présent et à planifier l’avenir.');
INSERT INTO `ogdch_postmeta` VALUES (2149,304,'_ckan_local_org_title_it','Ufficio federale di statistica');
INSERT INTO `ogdch_postmeta` VALUES (2150,304,'_ckan_local_org_description_it','Fornisce informazioni sullo stato e sull’evoluzione della Svizzera nei più svariati settori che permettono di capire il presente e pianificare il futuro.');
INSERT INTO `ogdch_postmeta` VALUES (2151,246,'_ckan_local_org_description_en','The Swiss Federal Archives (SFA) are the Confederation\'s service and competence centre for lasting information management. They appraise, secure, describe and provide access to archive-worthy records of the Swiss Confederation.');
INSERT INTO `ogdch_postmeta` VALUES (2152,246,'_ckan_local_org_description_de','Das Schweizerische Bundesarchiv ist das Dienstleistungs- und Kompetenzzentrum des Bundes für nachhaltiges Informationsmanagement. Es bewertet, sichert, erschliesst und vermittelt archivwürdige Unterlagen der Schweizerischen Eidgenossenschaft.');
INSERT INTO `ogdch_postmeta` VALUES (2153,246,'_ckan_local_org_description_fr','En tant que centre de prestations et de compétences de la Confédération pour une gestion durable de l\'information, les Archives fédérales suisses évaluent, prennent en charge, mettent en valeur et communiquent tous les documents de la Confédération suisse qui ont une valeur archivistique. ');
INSERT INTO `ogdch_postmeta` VALUES (2154,246,'_ckan_local_org_description_it','L\'Archivio federale svizzero è il centro di servizio e competenza della Confederazione per la gestione a lungo termine delle informazioni. In questa funzione è incaricato di valutare, salvaguardare, catalogare e rendere accessibili i documenti di valore archivistico della Confederazione Svizzera.');
INSERT INTO `ogdch_postmeta` VALUES (2155,246,'_ckan_local_org_image','http://www.bar.admin.ch/org/index.html?lang=fr&image=NHzLpZeg7t,lnp6I0NTU042l2Z6ln1ae2IZn4Z2qZpnO2Yuq2Z6gpJCDdHx3fmym162bpYbqjKbXpJ6eiKidoIyf4w--');
INSERT INTO `ogdch_postmeta` VALUES (2160,248,'_wp_page_template','default');
INSERT INTO `ogdch_postmeta` VALUES (2161,249,'_wp_page_template','default');
INSERT INTO `ogdch_postmeta` VALUES (2162,250,'_wp_page_template','default');
INSERT INTO `ogdch_postmeta` VALUES (2163,305,'_edit_lock','1447840369:1');
INSERT INTO `ogdch_postmeta` VALUES (2164,305,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (2165,306,'_edit_lock','1447839954:1');
INSERT INTO `ogdch_postmeta` VALUES (2166,306,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (2167,307,'_edit_lock','1447840081:1');
INSERT INTO `ogdch_postmeta` VALUES (2168,307,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (2169,308,'_edit_lock','1447840064:1');
INSERT INTO `ogdch_postmeta` VALUES (2170,308,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (2171,309,'_edit_lock','1465376248:1');
INSERT INTO `ogdch_postmeta` VALUES (2172,309,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (2173,309,'_ckan_local_harvester_ckan_id','ffd3c0ce-1f16-4254-aea4-664029574fa8');
INSERT INTO `ogdch_postmeta` VALUES (2174,309,'_ckan_local_harvester_ckan_name','geocat-harvester');
INSERT INTO `ogdch_postmeta` VALUES (2175,309,'_ckan_local_harvester_ckan_synced','1');
INSERT INTO `ogdch_postmeta` VALUES (2176,309,'_ckan_local_harvester_url','http://www.geocat.ch/geonetwork/srv/eng/csw');
INSERT INTO `ogdch_postmeta` VALUES (2177,309,'_ckan_local_harvester_source_type','geocat_harvester');
INSERT INTO `ogdch_postmeta` VALUES (2178,309,'_ckan_local_harvester_organisation','swisstopo');
INSERT INTO `ogdch_postmeta` VALUES (2179,309,'_ckan_local_harvester_update_frequency','MANUAL');
INSERT INTO `ogdch_postmeta` VALUES (2180,309,'_ckan_local_harvester_config','{\"cql\": \"csw:AnyText Like \'%Eisenbahn%\'\", \"rights\": \"NonCommercialAllowed-CommercialWithPermission-ReferenceRequired\"}');
INSERT INTO `ogdch_postmeta` VALUES (2205,310,'_edit_lock','1449073754:1');
INSERT INTO `ogdch_postmeta` VALUES (2206,310,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (2207,311,'_edit_lock','1449073777:1');
INSERT INTO `ogdch_postmeta` VALUES (2208,311,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (2209,312,'_edit_lock','1449073889:1');
INSERT INTO `ogdch_postmeta` VALUES (2210,312,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (2211,313,'_edit_lock','1449073921:1');
INSERT INTO `ogdch_postmeta` VALUES (2212,313,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (2213,220,'_ckan_local_group_ckan_synced','1');
INSERT INTO `ogdch_postmeta` VALUES (2214,211,'_ckan_local_group_ckan_synced','1');
INSERT INTO `ogdch_postmeta` VALUES (2215,200,'_ckan_local_group_ckan_synced','1');
INSERT INTO `ogdch_postmeta` VALUES (2216,209,'_ckan_local_group_ckan_synced','1');
INSERT INTO `ogdch_postmeta` VALUES (2217,210,'_ckan_local_group_ckan_synced','1');
INSERT INTO `ogdch_postmeta` VALUES (2218,201,'_ckan_local_group_ckan_synced','1');
INSERT INTO `ogdch_postmeta` VALUES (2219,202,'_ckan_local_group_ckan_synced','1');
INSERT INTO `ogdch_postmeta` VALUES (2220,203,'_ckan_local_group_ckan_synced','1');
INSERT INTO `ogdch_postmeta` VALUES (2221,204,'_ckan_local_group_ckan_synced','1');
INSERT INTO `ogdch_postmeta` VALUES (2222,206,'_ckan_local_group_ckan_synced','1');
INSERT INTO `ogdch_postmeta` VALUES (2223,208,'_ckan_local_group_ckan_synced','1');
INSERT INTO `ogdch_postmeta` VALUES (2224,205,'_ckan_local_group_ckan_synced','1');
INSERT INTO `ogdch_postmeta` VALUES (2225,212,'_ckan_local_group_ckan_synced','1');
INSERT INTO `ogdch_postmeta` VALUES (2226,221,'_ckan_local_group_ckan_synced','1');
INSERT INTO `ogdch_postmeta` VALUES (2227,214,'_ckan_local_group_ckan_synced','1');
INSERT INTO `ogdch_postmeta` VALUES (2228,192,'_ckan_local_group_ckan_synced','1');
INSERT INTO `ogdch_postmeta` VALUES (2229,216,'_ckan_local_group_ckan_synced','1');
INSERT INTO `ogdch_postmeta` VALUES (2230,213,'_ckan_local_group_ckan_synced','1');
INSERT INTO `ogdch_postmeta` VALUES (2231,217,'_ckan_local_group_ckan_synced','1');
INSERT INTO `ogdch_postmeta` VALUES (2232,218,'_ckan_local_group_ckan_synced','1');
INSERT INTO `ogdch_postmeta` VALUES (2233,193,'_ckan_local_group_ckan_synced','1');
INSERT INTO `ogdch_postmeta` VALUES (2234,219,'_ckan_local_group_ckan_synced','1');
INSERT INTO `ogdch_postmeta` VALUES (2235,207,'_ckan_local_group_ckan_synced','1');
INSERT INTO `ogdch_postmeta` VALUES (2236,199,'_ckan_local_group_ckan_synced','1');
INSERT INTO `ogdch_postmeta` VALUES (2237,314,'_edit_lock','1449231679:1');
INSERT INTO `ogdch_postmeta` VALUES (2238,314,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (2239,314,'_ckan_local_org_ckan_id','04cc43a8-d075-4f7d-911b-e48a95b404b5');
INSERT INTO `ogdch_postmeta` VALUES (2240,314,'_ckan_local_org_ckan_name','bundesamt-fur-chungelihaltig-bfhupf');
INSERT INTO `ogdch_postmeta` VALUES (2241,314,'_ckan_local_org_ckan_synced','1');
INSERT INTO `ogdch_postmeta` VALUES (2242,314,'_ckan_local_org_title_en','Bundesamt für Chüngelihaltig (BfHüpf)');
INSERT INTO `ogdch_postmeta` VALUES (2243,314,'_ckan_local_org_title_de','Bundesamt für Chüngelihaltig (BfHüpf)');
INSERT INTO `ogdch_postmeta` VALUES (2244,314,'_ckan_local_org_title_fr','Bundesamt für Chüngelihaltig (BfHüpf)');
INSERT INTO `ogdch_postmeta` VALUES (2245,314,'_ckan_local_org_title_it','Bundesamt für Chüngelihaltig (BfHüpf)');
INSERT INTO `ogdch_postmeta` VALUES (2247,297,'_ckan_local_dataset_ckan_synced','1');
INSERT INTO `ogdch_postmeta` VALUES (2248,285,'_ckan_local_dataset_ckan_synced','1');
INSERT INTO `ogdch_postmeta` VALUES (2249,284,'_ckan_local_dataset_ckan_synced','1');
INSERT INTO `ogdch_postmeta` VALUES (2250,300,'_ckan_local_org_ckan_synced','1');
INSERT INTO `ogdch_postmeta` VALUES (2251,302,'_ckan_local_org_ckan_synced','1');
INSERT INTO `ogdch_postmeta` VALUES (2252,304,'_ckan_local_org_ckan_synced','1');
INSERT INTO `ogdch_postmeta` VALUES (2253,246,'_ckan_local_org_ckan_synced','1');
INSERT INTO `ogdch_postmeta` VALUES (2254,303,'_ckan_local_org_ckan_synced','1');
INSERT INTO `ogdch_postmeta` VALUES (2255,301,'_ckan_local_org_ckan_synced','1');
INSERT INTO `ogdch_postmeta` VALUES (2256,291,'_ckan_local_org_ckan_synced','1');
INSERT INTO `ogdch_postmeta` VALUES (2257,194,'_ckan_local_org_ckan_synced','1');
INSERT INTO `ogdch_postmeta` VALUES (2258,317,'_edit_lock','1465823166:1');
INSERT INTO `ogdch_postmeta` VALUES (2259,317,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (2266,165,'_wp_page_template','default');
INSERT INTO `ogdch_postmeta` VALUES (2273,319,'_edit_lock','1465823061:1');
INSERT INTO `ogdch_postmeta` VALUES (2274,319,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (2276,319,'publish_post_category','1');
INSERT INTO `ogdch_postmeta` VALUES (2277,319,'publish_to_discourse','0');
INSERT INTO `ogdch_postmeta` VALUES (2278,317,'publish_post_category','1');
INSERT INTO `ogdch_postmeta` VALUES (2279,317,'publish_to_discourse','0');
INSERT INTO `ogdch_postmeta` VALUES (2280,165,'publish_to_discourse','0');
INSERT INTO `ogdch_postmeta` VALUES (2281,164,'publish_to_discourse','0');
INSERT INTO `ogdch_postmeta` VALUES (2282,164,'_wp_page_template','default');
INSERT INTO `ogdch_postmeta` VALUES (2283,166,'publish_to_discourse','0');
INSERT INTO `ogdch_postmeta` VALUES (2284,166,'_wp_page_template','default');
INSERT INTO `ogdch_postmeta` VALUES (2285,167,'publish_to_discourse','0');
INSERT INTO `ogdch_postmeta` VALUES (2286,167,'_wp_page_template','default');
INSERT INTO `ogdch_postmeta` VALUES (2287,321,'_edit_lock','1465981225:1');
INSERT INTO `ogdch_postmeta` VALUES (2288,321,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (2290,321,'publish_to_discourse','0');
/*!40000 ALTER TABLE `ogdch_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ogdch_posts`
--

DROP TABLE IF EXISTS `ogdch_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ogdch_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=322 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogdch_posts`
--

LOCK TABLES `ogdch_posts` WRITE;
/*!40000 ALTER TABLE `ogdch_posts` DISABLE KEYS */;
INSERT INTO `ogdch_posts` VALUES (2,1,'2015-06-03 06:50:11','2015-05-21 13:32:37','<h2>Text Styles</h2>\r\n<h2>heading 2</h2>\r\n<h3>heading 3</h3>\r\n<h4>heading 4</h4>\r\n<pre>&lt;a href=\"test\"&gt;Preformatted text&lt;/a&gt;</pre>\r\n<h2>Text Formatting</h2>\r\nInhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch\r\n\r\n<strong>Bold Text</strong>\r\n\r\n<em>Italic text</em>\r\n\r\n<del>strikethrough</del>\r\n\r\n<span style=\"text-decoration: underline;\">underlined</span>\r\n<p style=\"text-align: left;\">left aligned</p>\r\n<p style=\"text-align: center;\">centered</p>\r\n<p style=\"text-align: right;\">right aligned</p>\r\n<p style=\"text-align: justify;\">justified bla bla bla justified bla bla bla justified bla bla bla justified bla bla bla justified bla bla bla justified bla bla bla justified bla bla bla justified bla bla bla justified bla bla bla justified bla bla bla justified bla bla bla justified bla bla bla justified bla bla bla justified bla bla bla justified bla bla bla justified bla bla bla justified bla bla bla justified bla bla bla justified bla bla bla justified bla bla bla</p>\r\n<a href=\"http://google.ch\">Link</a>\r\n<p style=\"padding-left: 30px;\">Indented Text</p>\r\n<p style=\"padding-left: 60px;\">More indented Text</p>\r\n\r\n<h2>Lists</h2>\r\n<ul>\r\n	<li>list1</li>\r\n	<li>list2</li>\r\n</ul>\r\n<ol>\r\n	<li>numbered1</li>\r\n	<li>numbered2</li>\r\n</ol>\r\n<blockquote>quote\r\n\r\nquote</blockquote>\r\n<h2>Horizontal Line</h2>\r\n\r\n<hr />\r\n\r\n<h2>Images</h2>\r\n&nbsp;\r\n\r\n[caption id=\"attachment_291\" align=\"aligncenter\" width=\"134\"]<a href=\"http://ogdch.dev/content/uploads/2015/09/liip.png\"><img class=\"wp-image-291\" src=\"http://ogdch.dev/content/uploads/2015/09/liip.png\" alt=\"liip\" width=\"134\" height=\"134\" /></a> Centered Image[/caption]\r\n\r\n<a href=\"http://ogdch.dev/content/uploads/2015/09/liip.png\"><img class=\"alignleft wp-image-291\" src=\"http://ogdch.dev/content/uploads/2015/09/liip.png\" alt=\"liip\" width=\"146\" height=\"146\" /></a>\r\n\r\nLeft aligned Image\r\n\r\nwithout caption\r\n\r\nText zum bild\r\n\r\nmore text\r\n\r\n[caption id=\"attachment_291\" align=\"alignright\" width=\"149\"]<a href=\"http://ogdch.dev/content/uploads/2015/09/liip.png\"><img class=\"wp-image-291\" src=\"http://ogdch.dev/content/uploads/2015/09/liip.png\" alt=\"liip\" width=\"149\" height=\"149\" /></a> Right aligned image[/caption]\r\n<p style=\"text-align: right;\">Text zum bild</p>\r\n<p style=\"text-align: right;\">text zum bild</p>\r\n<p style=\"text-align: right;\">more text</p>\r\n<p style=\"text-align: right;\">more text</p>','Über das Portal','','publish','open','open','','about','','','2015-09-29 14:50:40','2015-09-29 12:50:40','',0,'http://ogdch.dev/?page_id=2',0,'page','',0);
INSERT INTO `ogdch_posts` VALUES (17,1,'2015-05-26 12:29:35','2015-05-26 12:29:35','a:18:{i:0;a:2:{i:0;s:42:\"%%sitename%% %%page%% %%sep%% %%sitedesc%%\";i:1;s:42:\"%%sitename%% %%page%% %%sep%% %%sitedesc%%\";}i:1;a:2:{i:0;s:41:\"%%name%%, Autor auf %%sitename%% %%page%%\";i:1;s:41:\"%%name%%, Autor auf %%sitename%% %%page%%\";}i:2;a:2:{i:0;s:38:\"%%date%% %%page%% %%sep%% %%sitename%%\";i:1;s:38:\"%%date%% %%page%% %%sep%% %%sitename%%\";}i:3;a:2:{i:0;s:67:\"Du hast nach %%searchphrase%% gesucht %%page%% %%sep%% %%sitename%%\";i:1;s:67:\"Du hast nach %%searchphrase%% gesucht %%page%% %%sep%% %%sitename%%\";}i:4;a:2:{i:0;s:41:\"Seite nicht gefunden %%sep%% %%sitename%%\";i:1;s:41:\"Seite nicht gefunden %%sep%% %%sitename%%\";}i:5;a:2:{i:0;s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";i:1;s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";}i:6;a:2:{i:0;s:52:\"%%term_title%% Archive %%page%% %%sep%% %%sitename%%\";i:1;s:52:\"%%term_title%% Archive %%page%% %%sep%% %%sitename%%\";}i:7;a:2:{i:0;s:32:\"Fehler 404: Seite nicht gefunden\";i:1;s:32:\"Fehler 404: Seite nicht gefunden\";}i:8;a:2:{i:0;s:11:\"Archiv für\";i:1;s:11:\"Archiv für\";}i:9;a:2:{i:0;s:4:\"Home\";i:1;s:4:\"Home\";}i:10;a:2:{i:0;s:22:\"Sie haben gesucht nach\";i:1;s:20:\"Du hast gesucht nach\";}i:11;a:2:{i:0;s:7:\"&raquo;\";i:1;s:7:\"&raquo;\";}i:12;a:2:{i:0;s:58:\"Der Beitrag %%POSTLINK%% erschien zuerst auf %%BLOGLINK%%.\";i:1;s:58:\"Der Beitrag %%POSTLINK%% erschien zuerst auf %%BLOGLINK%%.\";}i:13;a:2:{i:0;s:14:\"opendata.swiss\";i:1;s:14:\"opendata.swiss\";}i:14;a:2:{i:0;s:32:\"Open Government Data Switzerland\";i:1;s:32:\"Open Government Data Switzerland\";}i:15;a:2:{i:0;s:6:\"j. F Y\";i:1;s:5:\"d.m.Y\";}i:16;a:2:{i:0;s:3:\"H:i\";i:1;s:3:\"H:i\";}i:17;a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}}','polylang_mo_2','','private','open','open','','polylang_mo_2','','','2015-11-13 13:29:07','2015-11-13 12:29:07','',0,'http://ogdch.dev/?post_type=polylang_mo&#038;p=17',0,'polylang_mo','',0);
INSERT INTO `ogdch_posts` VALUES (18,1,'2015-05-26 12:29:45','2015-05-26 12:29:45','a:18:{i:0;a:2:{i:0;s:42:\"%%sitename%% %%page%% %%sep%% %%sitedesc%%\";i:1;s:42:\"%%sitename%% %%page%% %%sep%% %%sitedesc%%\";}i:1;a:2:{i:0;s:41:\"%%name%%, Autor auf %%sitename%% %%page%%\";i:1;s:41:\"%%name%%, Author on %%sitename%% %%page%%\";}i:2;a:2:{i:0;s:38:\"%%date%% %%page%% %%sep%% %%sitename%%\";i:1;s:38:\"%%date%% %%page%% %%sep%% %%sitename%%\";}i:3;a:2:{i:0;s:67:\"Du hast nach %%searchphrase%% gesucht %%page%% %%sep%% %%sitename%%\";i:1;s:63:\"You searched for %%searchphrase%% %%page%% %%sep%% %%sitename%%\";}i:4;a:2:{i:0;s:41:\"Seite nicht gefunden %%sep%% %%sitename%%\";i:1;s:35:\"Page not found %%sep%% %%sitename%%\";}i:5;a:2:{i:0;s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";i:1;s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";}i:6;a:2:{i:0;s:52:\"%%term_title%% Archive %%page%% %%sep%% %%sitename%%\";i:1;s:53:\"%%term_title%% Archives %%page%% %%sep%% %%sitename%%\";}i:7;a:2:{i:0;s:32:\"Fehler 404: Seite nicht gefunden\";i:1;s:25:\"Error 404: Page not found\";}i:8;a:2:{i:0;s:11:\"Archiv für\";i:1;s:12:\"Archives for\";}i:9;a:2:{i:0;s:4:\"Home\";i:1;s:4:\"Home\";}i:10;a:2:{i:0;s:22:\"Sie haben gesucht nach\";i:1;s:16:\"You searched for\";}i:11;a:2:{i:0;s:7:\"&raquo;\";i:1;s:7:\"&raquo;\";}i:12;a:2:{i:0;s:58:\"Der Beitrag %%POSTLINK%% erschien zuerst auf %%BLOGLINK%%.\";i:1;s:58:\"The post %%POSTLINK%% was first published on %%BLOGLINK%%.\";}i:13;a:2:{i:0;s:14:\"opendata.swiss\";i:1;s:14:\"opendata.swiss\";}i:14;a:2:{i:0;s:32:\"Open Government Data Switzerland\";i:1;s:32:\"Open Government Data Switzerland\";}i:15;a:2:{i:0;s:6:\"j. F Y\";i:1;s:6:\"j. F Y\";}i:16;a:2:{i:0;s:3:\"H:i\";i:1;s:3:\"H:i\";}i:17;a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}}','polylang_mo_5','','private','open','open','','polylang_mo_5','','','2015-11-13 13:29:07','2015-11-13 12:29:07','',0,'http://ogdch.dev/?post_type=polylang_mo&#038;p=18',0,'polylang_mo','',0);
INSERT INTO `ogdch_posts` VALUES (19,1,'2015-05-26 12:29:50','2015-05-26 12:29:50','a:18:{i:0;a:2:{i:0;s:42:\"%%sitename%% %%page%% %%sep%% %%sitedesc%%\";i:1;s:42:\"%%sitename%% %%page%% %%sep%% %%sitedesc%%\";}i:1;a:2:{i:0;s:41:\"%%name%%, Autor auf %%sitename%% %%page%%\";i:1;s:41:\"%%name%%, Autor auf %%sitename%% %%page%%\";}i:2;a:2:{i:0;s:38:\"%%date%% %%page%% %%sep%% %%sitename%%\";i:1;s:38:\"%%date%% %%page%% %%sep%% %%sitename%%\";}i:3;a:2:{i:0;s:67:\"Du hast nach %%searchphrase%% gesucht %%page%% %%sep%% %%sitename%%\";i:1;s:67:\"Du hast nach %%searchphrase%% gesucht %%page%% %%sep%% %%sitename%%\";}i:4;a:2:{i:0;s:41:\"Seite nicht gefunden %%sep%% %%sitename%%\";i:1;s:41:\"Seite nicht gefunden %%sep%% %%sitename%%\";}i:5;a:2:{i:0;s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";i:1;s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";}i:6;a:2:{i:0;s:52:\"%%term_title%% Archive %%page%% %%sep%% %%sitename%%\";i:1;s:52:\"%%term_title%% Archive %%page%% %%sep%% %%sitename%%\";}i:7;a:2:{i:0;s:32:\"Fehler 404: Seite nicht gefunden\";i:1;s:32:\"Fehler 404: Seite nicht gefunden\";}i:8;a:2:{i:0;s:11:\"Archiv für\";i:1;s:11:\"Archiv für\";}i:9;a:2:{i:0;s:4:\"Home\";i:1;s:4:\"Home\";}i:10;a:2:{i:0;s:22:\"Sie haben gesucht nach\";i:1;s:22:\"Sie haben gesucht nach\";}i:11;a:2:{i:0;s:7:\"&raquo;\";i:1;s:7:\"&raquo;\";}i:12;a:2:{i:0;s:58:\"Der Beitrag %%POSTLINK%% erschien zuerst auf %%BLOGLINK%%.\";i:1;s:58:\"Der Beitrag %%POSTLINK%% erschien zuerst auf %%BLOGLINK%%.\";}i:13;a:2:{i:0;s:14:\"opendata.swiss\";i:1;s:14:\"opendata.swiss\";}i:14;a:2:{i:0;s:32:\"Open Government Data Switzerland\";i:1;s:32:\"Open Government Data Switzerland\";}i:15;a:2:{i:0;s:6:\"j. F Y\";i:1;s:6:\"j. F Y\";}i:16;a:2:{i:0;s:3:\"H:i\";i:1;s:3:\"H:i\";}i:17;a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}}','polylang_mo_9','','private','open','open','','polylang_mo_9','','','2015-11-13 13:29:07','2015-11-13 12:29:07','',0,'http://ogdch.dev/?post_type=polylang_mo&#038;p=19',0,'polylang_mo','',0);
INSERT INTO `ogdch_posts` VALUES (20,1,'2015-05-26 12:29:54','2015-05-26 12:29:54','a:18:{i:0;a:2:{i:0;s:42:\"%%sitename%% %%page%% %%sep%% %%sitedesc%%\";i:1;s:42:\"%%sitename%% %%page%% %%sep%% %%sitedesc%%\";}i:1;a:2:{i:0;s:41:\"%%name%%, Autor auf %%sitename%% %%page%%\";i:1;s:41:\"%%name%%, Autor auf %%sitename%% %%page%%\";}i:2;a:2:{i:0;s:38:\"%%date%% %%page%% %%sep%% %%sitename%%\";i:1;s:38:\"%%date%% %%page%% %%sep%% %%sitename%%\";}i:3;a:2:{i:0;s:67:\"Du hast nach %%searchphrase%% gesucht %%page%% %%sep%% %%sitename%%\";i:1;s:67:\"Du hast nach %%searchphrase%% gesucht %%page%% %%sep%% %%sitename%%\";}i:4;a:2:{i:0;s:41:\"Seite nicht gefunden %%sep%% %%sitename%%\";i:1;s:41:\"Seite nicht gefunden %%sep%% %%sitename%%\";}i:5;a:2:{i:0;s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";i:1;s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";}i:6;a:2:{i:0;s:52:\"%%term_title%% Archive %%page%% %%sep%% %%sitename%%\";i:1;s:52:\"%%term_title%% Archive %%page%% %%sep%% %%sitename%%\";}i:7;a:2:{i:0;s:32:\"Fehler 404: Seite nicht gefunden\";i:1;s:32:\"Fehler 404: Seite nicht gefunden\";}i:8;a:2:{i:0;s:11:\"Archiv für\";i:1;s:11:\"Archiv für\";}i:9;a:2:{i:0;s:4:\"Home\";i:1;s:4:\"Home\";}i:10;a:2:{i:0;s:22:\"Sie haben gesucht nach\";i:1;s:22:\"Sie haben gesucht nach\";}i:11;a:2:{i:0;s:7:\"&raquo;\";i:1;s:7:\"&raquo;\";}i:12;a:2:{i:0;s:58:\"Der Beitrag %%POSTLINK%% erschien zuerst auf %%BLOGLINK%%.\";i:1;s:58:\"Der Beitrag %%POSTLINK%% erschien zuerst auf %%BLOGLINK%%.\";}i:13;a:2:{i:0;s:14:\"opendata.swiss\";i:1;s:14:\"opendata.swiss\";}i:14;a:2:{i:0;s:32:\"Open Government Data Switzerland\";i:1;s:32:\"Open Government Data Switzerland\";}i:15;a:2:{i:0;s:6:\"j. F Y\";i:1;s:6:\"j. F Y\";}i:16;a:2:{i:0;s:3:\"H:i\";i:1;s:3:\"H:i\";}i:17;a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}}','polylang_mo_13','','private','open','open','','polylang_mo_13','','','2015-11-13 13:29:07','2015-11-13 12:29:07','',0,'http://ogdch.dev/?post_type=polylang_mo&#038;p=20',0,'polylang_mo','',0);
INSERT INTO `ogdch_posts` VALUES (97,1,'2015-06-03 06:50:11','2015-06-02 13:01:41','Content EN','About','','publish','open','open','','about','','','2015-09-23 19:10:37','2015-09-23 17:10:37','',0,'http://ogdch.dev/?page_id=97',0,'page','',0);
INSERT INTO `ogdch_posts` VALUES (98,1,'2015-06-02 13:01:41','2015-06-02 13:01:41','YEAH USA','Sample US','','inherit','open','open','','97-revision-v1','','','2015-06-02 13:01:41','2015-06-02 13:01:41','',97,'http://ogdch.dev/2015/06/02/97-revision-v1/',0,'revision','',0);
INSERT INTO `ogdch_posts` VALUES (102,1,'2015-06-02 13:05:39','2015-06-02 13:05:39','This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\r\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my blog. I live in Los Angeles, have a great dog named Jack, and I like piña coladas. (And gettin\' caught in the rain.)</blockquote>\r\n...or something like this:\r\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\r\nAs a new WordPress user, you should go to <a href=\"http://ogdch.dev/cms/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!','Eine Seite','','inherit','open','open','','2-revision-v1','','','2015-06-02 13:05:39','2015-06-02 13:05:39','',2,'http://ogdch.dev/2015/06/02/2-revision-v1/',0,'revision','',0);
INSERT INTO `ogdch_posts` VALUES (118,1,'2015-06-03 06:50:11','2015-06-03 06:50:03','Content IT','Informazioni','','publish','open','open','','about','','','2015-09-23 19:10:52','2015-09-23 17:10:52','',0,'http://ogdch.dev/?page_id=118',0,'page','',0);
INSERT INTO `ogdch_posts` VALUES (119,1,'2015-06-03 06:50:11','2015-06-03 06:50:11','Content FR','À propos','','publish','open','open','','about','','','2015-09-23 19:11:02','2015-09-23 17:11:02','',0,'http://ogdch.dev/?page_id=119',0,'page','',0);
INSERT INTO `ogdch_posts` VALUES (120,1,'2015-06-03 06:50:03','2015-06-03 06:50:03','','Seite it','','inherit','open','open','','118-revision-v1','','','2015-06-03 06:50:03','2015-06-03 06:50:03','',118,'http://ogdch.dev/2015/06/03/118-revision-v1/',0,'revision','',0);
INSERT INTO `ogdch_posts` VALUES (121,1,'2015-06-03 06:50:11','2015-06-03 06:50:11','','Seite FR','','inherit','open','open','','119-revision-v1','','','2015-06-03 06:50:11','2015-06-03 06:50:11','',119,'http://ogdch.dev/2015/06/03/119-revision-v1/',0,'revision','',0);
INSERT INTO `ogdch_posts` VALUES (142,1,'2015-06-03 12:51:07','2015-06-03 12:51:07','','Mein Datensatz','','publish','open','open','','mein-datensatz-2','','','2015-06-03 12:51:07','2015-06-03 12:51:07','',0,'http:/dataset/mein-datensatz-2/',0,'ckan-dataset','',1);
INSERT INTO `ogdch_posts` VALUES (146,1,'2015-06-03 14:24:23','2015-06-03 14:24:23','','ewqfqfewfqw','','publish','open','open','','ewqfqfewfqw','','','2015-06-03 14:24:23','2015-06-03 14:24:23','',0,'http://ogdch.dev/?post_type=ckan-dataset&#038;p=146',0,'ckan-dataset','',0);
INSERT INTO `ogdch_posts` VALUES (164,1,'2015-08-25 13:27:36','2015-08-25 13:27:23','<ul>\r\n	<li>Hello</li>\r\n	<li>World!</li>\r\n</ul>','FAQ','','publish','open','open','','faq','','','2016-06-13 11:35:33','2016-06-13 09:35:33','',0,'http://ogdch.dev/?page_id=164',0,'page','',1);
INSERT INTO `ogdch_posts` VALUES (165,1,'2015-08-25 13:27:36','2015-08-25 13:27:28','English FAQ','FAQ','','publish','open','open','','faq','','','2016-06-13 15:08:16','2016-06-13 13:08:16','',0,'http://ogdch.dev/?page_id=165',0,'page','',0);
INSERT INTO `ogdch_posts` VALUES (166,1,'2015-08-25 13:27:36','2015-08-25 13:27:32','','FAQ','','publish','open','open','','faq','','','2015-08-25 13:27:32','2015-08-25 13:27:32','',0,'http://ogdch.dev/?page_id=166',0,'page','',0);
INSERT INTO `ogdch_posts` VALUES (167,1,'2015-08-25 13:27:36','2015-08-25 13:27:36','','FAQ','','publish','open','open','','faq','','','2015-08-25 13:27:36','2015-08-25 13:27:36','',0,'http://ogdch.dev/?page_id=167',0,'page','',0);
INSERT INTO `ogdch_posts` VALUES (172,1,'2015-08-25 13:28:47','2015-08-25 13:28:47',' ','','','publish','open','closed','','172','','','2015-11-03 23:00:37','2015-11-03 22:00:37','',0,'http://ogdch.dev/?p=172',5,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (180,1,'2015-08-25 13:29:40','2015-08-25 13:29:40',' ','','','publish','open','closed','','180','','','2015-10-27 16:09:03','2015-10-27 15:09:03','',0,'http://ogdch.dev/?p=180',5,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (184,1,'2015-08-25 13:30:05','2015-08-25 13:30:05',' ','','','publish','open','closed','','184','','','2015-10-27 16:10:52','2015-10-27 15:10:52','',0,'http://ogdch.dev/?p=184',5,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (188,1,'2015-08-25 13:30:42','2015-08-25 13:30:42',' ','','','publish','open','closed','','188','','','2015-10-27 16:10:06','2015-10-27 15:10:06','',0,'http://ogdch.dev/?p=188',5,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (192,1,'2015-08-25 13:46:47','2015-08-25 13:46:47','','Population','','publish','closed','closed','','population','','','2015-12-03 09:29:16','2015-12-03 08:29:16','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=192',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (193,1,'2015-08-25 13:48:07','2015-08-25 13:48:07','','Territory','','publish','closed','closed','','territory','','','2015-12-03 09:30:32','2015-12-03 08:30:32','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=193',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (194,1,'2015-08-25 13:48:42','2015-08-25 13:48:42','','Swisstopo','','publish','closed','closed','','swisstopo','','','2015-12-04 13:27:36','2015-12-04 12:27:36','',0,'http://ogdch.dev/?post_type=ckan-local-org&#038;p=194',0,'ckan-local-org','',0);
INSERT INTO `ogdch_posts` VALUES (195,1,'2015-08-25 13:54:54','2015-08-25 13:53:35','Beschreibung DE','TopoApp','','publish','closed','closed','','topoapp','','','2015-11-04 08:40:58','2015-11-04 07:40:58','',0,'http://ogdch.dev/?post_type=app&#038;p=195',0,'app','',0);
INSERT INTO `ogdch_posts` VALUES (196,1,'2015-08-25 13:54:54','2015-08-25 13:54:05','Description EN','TopoApp','','publish','closed','closed','','topoapp','','','2015-10-30 13:20:48','2015-10-30 12:20:48','',0,'http://ogdch.dev/?post_type=app&#038;p=196',0,'app','',0);
INSERT INTO `ogdch_posts` VALUES (197,1,'2015-08-25 13:54:54','2015-08-25 13:54:31','Description IT','TopoApp','','publish','closed','closed','','topoapp','','','2015-10-30 13:21:08','2015-10-30 12:21:08','',0,'http://ogdch.dev/?post_type=app&#038;p=197',0,'app','',0);
INSERT INTO `ogdch_posts` VALUES (198,1,'2015-08-25 13:54:54','2015-08-25 13:54:54','Description FR','TopoApp','','publish','closed','closed','','topoapp','','','2015-10-30 13:21:23','2015-10-30 12:21:23','',0,'http://ogdch.dev/?post_type=app&#038;p=198',0,'app','',0);
INSERT INTO `ogdch_posts` VALUES (199,1,'2015-08-25 13:57:39','2015-08-25 13:57:39','','Work','','publish','closed','closed','','work','','','2015-12-03 09:31:15','2015-12-03 08:31:15','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=199',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (200,1,'2015-08-25 13:58:13','2015-08-25 13:58:13','','Construction','','publish','closed','closed','','construction','','','2015-12-03 09:27:34','2015-12-03 08:27:34','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=200',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (201,1,'2015-08-25 13:58:47','2015-08-25 13:58:47','','Education','','publish','closed','closed','','education','','','2015-12-03 09:28:01','2015-12-03 08:28:01','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=201',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (202,1,'2015-08-25 13:59:26','2015-08-25 13:59:26','','Energy','','publish','closed','closed','','energy','','','2015-12-03 09:28:10','2015-12-03 08:28:10','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=202',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (203,1,'2015-08-25 13:59:54','2015-08-25 13:59:54','','Finances','','publish','closed','closed','','finances','','','2015-12-03 09:28:17','2015-12-03 08:28:17','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=203',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (204,1,'2015-08-25 14:00:19','2015-08-25 14:00:19','','Geography','','publish','closed','closed','','geography','','','2015-12-03 09:28:27','2015-12-03 08:28:27','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=204',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (205,1,'2015-08-25 14:00:47','2015-08-25 14:00:47','','Legislation','','publish','closed','closed','','legislation','','','2015-12-03 09:28:50','2015-12-03 08:28:50','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=205',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (206,1,'2015-08-25 14:01:17','2015-08-25 14:01:17','','Health','','publish','closed','closed','','health','','','2015-12-03 09:28:35','2015-12-03 08:28:35','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=206',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (207,1,'2015-08-25 14:01:43','2015-08-25 14:01:43','','Trade','','publish','closed','closed','','trade','','','2015-12-03 09:31:05','2015-12-03 08:31:05','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=207',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (208,1,'2015-08-25 14:02:21','2015-08-25 14:02:21','','Industry','','publish','closed','closed','','industry','','','2015-12-03 09:28:43','2015-12-03 08:28:43','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=208',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (209,1,'2015-08-25 14:03:08','2015-08-25 14:03:08','','Crime','','publish','closed','closed','','crime','','','2015-12-03 09:27:46','2015-12-03 08:27:46','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=209',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (210,1,'2015-08-25 14:03:55','2015-08-25 14:03:55','','Culture','','publish','closed','closed','','culture','','','2015-12-03 09:27:54','2015-12-03 08:27:54','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=210',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (211,1,'2015-08-25 14:09:55','2015-08-25 14:09:55','','Agriculture','','publish','closed','closed','','agriculture','','','2015-12-03 09:27:07','2015-12-03 08:27:07','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=211',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (212,1,'2015-08-25 14:10:44','2015-08-25 14:10:44','','Mobility','','publish','closed','closed','','mobility','','','2015-12-03 09:28:57','2015-12-03 08:28:57','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=212',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (213,1,'2015-08-25 14:11:08','2015-08-25 14:11:08','','Public order','','publish','closed','closed','','public-order','','','2015-12-03 09:29:47','2015-12-03 08:29:47','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=213',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (214,1,'2015-08-25 14:13:29','2015-08-25 14:13:29','','Politics','','publish','closed','closed','','politics','','','2015-12-03 09:29:10','2015-12-03 08:29:10','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=214',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (216,1,'2015-08-25 14:13:55','2015-08-25 14:13:55','','Prices','','publish','closed','closed','','prices','','','2015-12-03 09:29:33','2015-12-03 08:29:33','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=216',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (217,1,'2015-08-25 14:14:28','2015-08-25 14:14:28','','Social security','','publish','closed','closed','','social-security','','','2015-12-03 09:29:58','2015-12-03 08:29:58','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=217',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (218,1,'2015-08-25 14:15:06','2015-08-25 14:15:06','','Statistical basis','','publish','closed','closed','','statistical-basis','','','2015-12-03 09:30:20','2015-12-03 08:30:20','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=218',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (219,1,'2015-08-25 14:15:31','2015-08-25 14:15:31','','Tourism','','publish','closed','closed','','tourism','','','2015-12-03 09:30:50','2015-12-03 08:30:50','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=219',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (220,1,'2015-08-25 14:15:55','2015-08-25 14:15:55','','Administration','','publish','closed','closed','','administration','','','2015-12-03 09:26:46','2015-12-03 08:26:46','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=220',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (221,1,'2015-08-25 14:16:25','2015-08-25 14:16:25','','National economy','','publish','closed','closed','','national-economy','','','2015-12-03 09:29:04','2015-12-03 08:29:04','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=221',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (233,1,'2015-08-25 15:56:06','2015-08-25 15:56:06','','Daten','','publish','open','closed','','datensatze','','','2015-11-03 23:00:37','2015-11-03 22:00:37','',0,'http://ogdch.dev/?p=233',1,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (234,1,'2015-08-25 16:00:54','2015-08-25 16:00:54','','Organisationen','','publish','open','closed','','gruppen','','','2015-11-03 23:00:37','2015-11-03 22:00:37','',0,'http://ogdch.dev/?p=234',2,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (236,1,'2015-08-25 16:00:54','2015-08-25 16:00:54','','Anwendungen','','publish','open','closed','','apps','','','2015-11-03 23:00:37','2015-11-03 22:00:37','',0,'http://ogdch.dev/?p=236',3,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (237,1,'2015-08-25 16:02:12','2015-08-25 16:02:12','','Data','','publish','open','closed','','datasets','','','2015-10-27 16:09:03','2015-10-27 15:09:03','',0,'http://ogdch.dev/?p=237',1,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (238,1,'2015-08-25 16:02:13','2015-08-25 16:02:13','','Organizations','','publish','open','closed','','groups','','','2015-10-27 16:09:03','2015-10-27 15:09:03','',0,'http://ogdch.dev/?p=238',2,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (239,1,'2015-08-25 16:02:13','2015-08-25 16:02:13','','Applications','','publish','open','closed','','apps-2','','','2015-10-27 16:09:03','2015-10-27 15:09:03','',0,'http://ogdch.dev/?p=239',3,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (240,1,'2015-08-25 16:03:13','2015-08-25 16:03:13','','Données','','publish','open','closed','','jeux-de-donnees','','','2015-10-27 16:10:06','2015-10-27 15:10:06','',0,'http://ogdch.dev/?p=240',1,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (241,1,'2015-08-25 16:03:13','2015-08-25 16:03:13','','Organisations','','publish','open','closed','','groupes','','','2015-10-27 16:10:06','2015-10-27 15:10:06','',0,'http://ogdch.dev/?p=241',2,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (242,1,'2015-08-25 16:03:13','2015-08-25 16:03:13','','Applications','','publish','open','closed','','apps-3','','','2015-10-27 16:10:06','2015-10-27 15:10:06','',0,'http://ogdch.dev/?p=242',3,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (243,1,'2015-08-25 16:04:07','2015-08-25 16:04:07','','Dati','','publish','open','closed','','dataset','','','2015-10-27 16:10:52','2015-10-27 15:10:52','',0,'http://ogdch.dev/?p=243',1,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (244,1,'2015-08-25 16:04:07','2015-08-25 16:04:07','','Organizzazioni','','publish','open','closed','','gruppi','','','2015-10-27 16:10:52','2015-10-27 15:10:52','',0,'http://ogdch.dev/?p=244',2,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (245,1,'2015-08-25 16:04:07','2015-08-25 16:04:07','','Applicazioni','','publish','open','closed','','apps-4','','','2015-10-27 16:10:52','2015-10-27 15:10:52','',0,'http://ogdch.dev/?p=245',3,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (246,1,'2015-09-14 11:36:04','2015-09-14 11:36:04','','Bundesarchiv','','publish','closed','closed','','bundesarchiv','','','2015-12-04 13:26:49','2015-12-04 12:26:49','',0,'http://ogdch.dev/?post_type=ckan-local-org&#038;p=246',0,'ckan-local-org','',0);
INSERT INTO `ogdch_posts` VALUES (247,1,'2015-09-21 21:17:55','2015-09-21 21:17:00','[ninja_forms id=5]','Kontakt','','publish','closed','closed','','contact','','','2015-11-13 16:13:27','2015-11-13 15:13:27','',0,'http://ogdch.dev/?page_id=247',0,'page','',0);
INSERT INTO `ogdch_posts` VALUES (248,1,'2015-09-21 21:17:55','2015-09-21 21:17:15','[ninja_forms id=1]','Contact','','publish','closed','closed','','contact','','','2015-11-04 15:06:19','2015-11-04 14:06:19','',0,'http://ogdch.dev/?page_id=248',0,'page','',0);
INSERT INTO `ogdch_posts` VALUES (249,1,'2015-09-21 21:17:55','2015-09-21 21:17:33','[ninja_forms id=1]','Contatto','','publish','closed','closed','','contact','','','2015-11-04 15:06:26','2015-11-04 14:06:26','',0,'http://ogdch.dev/?page_id=249',0,'page','',0);
INSERT INTO `ogdch_posts` VALUES (250,1,'2015-09-21 21:17:55','2015-09-21 21:17:55','[ninja_forms id=1]','Contact','','publish','closed','closed','','contact','','','2015-11-04 15:06:34','2015-11-04 14:06:34','',0,'http://ogdch.dev/?page_id=250',0,'page','',0);
INSERT INTO `ogdch_posts` VALUES (284,1,'2013-04-26 01:00:00','2013-04-26 01:00:00','','Railway noise night','','publish','closed','closed','','railway-noise-night','','','2015-12-04 13:25:46','2015-12-04 12:25:46','',0,'http://ogdch.dev/?post_type=ckan-local-dataset&#038;p=284',0,'ckan-local-dataset','',0);
INSERT INTO `ogdch_posts` VALUES (285,1,'2015-09-22 15:20:00','2015-09-22 13:20:00','','Baustellen','','publish','closed','closed','','baustellen','','','2015-12-04 13:25:30','2015-12-04 12:25:30','',0,'http://ogdch.dev/?post_type=ckan-local-dataset&#038;p=285',0,'ckan-local-dataset','',0);
INSERT INTO `ogdch_posts` VALUES (286,1,'2015-09-23 18:02:09','2015-09-23 16:02:09',' ','','','publish','closed','closed','','286','','','2015-11-03 23:00:37','2015-11-03 22:00:37','',0,'http://ogdch.dev/?p=286',4,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (287,1,'2015-09-23 18:02:42','2015-09-23 16:02:42',' ','','','publish','closed','closed','','287','','','2015-10-27 16:09:03','2015-10-27 15:09:03','',0,'http://ogdch.dev/?p=287',4,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (288,1,'2015-09-23 18:03:18','2015-09-23 16:03:18',' ','','','publish','closed','closed','','288','','','2015-10-27 16:10:06','2015-10-27 15:10:06','',0,'http://ogdch.dev/?p=288',4,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (289,1,'2015-09-23 18:03:51','2015-09-23 16:03:51',' ','','','publish','closed','closed','','289','','','2015-10-27 16:10:52','2015-10-27 15:10:52','',0,'http://ogdch.dev/?p=289',4,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (290,1,'2015-09-29 14:25:33','2015-09-29 12:25:33','','liip','','inherit','open','closed','','liip','','','2015-09-29 14:25:33','2015-09-29 12:25:33','',0,'http://ogdch.dev/content/uploads/2015/09/liip.png',0,'attachment','image/png',0);
INSERT INTO `ogdch_posts` VALUES (291,1,'2015-10-12 11:50:14','2015-10-12 09:50:14','','Sub-Organization','','publish','closed','closed','','sub-organization','','','2015-12-04 13:27:17','2015-12-04 12:27:17','',0,'http://ogdch.dev/?post_type=ckan-local-org&#038;p=291',0,'ckan-local-org','',0);
INSERT INTO `ogdch_posts` VALUES (297,1,'2015-11-03 09:28:12','2015-11-03 08:28:12','','National boundaries','','publish','closed','closed','','national-boundaries','','','2015-12-04 13:24:55','2015-12-04 12:24:55','',0,'http://ogdch.dev/?post_type=ckan-local-dataset&#038;p=297',0,'ckan-local-dataset','',0);
INSERT INTO `ogdch_posts` VALUES (300,1,'2015-11-04 16:09:08','2015-11-04 15:09:08','','Bibliothek am Guisanplatz','','publish','closed','closed','','bibliothek-am-guisanplatz','','','2015-12-04 13:26:11','2015-12-04 12:26:11','',0,'http://ogdch.dev/?post_type=ckan-local-org&#038;p=300',0,'ckan-local-org','',0);
INSERT INTO `ogdch_posts` VALUES (301,1,'2015-11-04 16:10:59','2015-11-04 15:10:59','','Schweizerische Nationalbibliothek','','publish','closed','closed','','schweizerische-nationalbibliothek','','','2015-12-04 13:27:07','2015-12-04 12:27:07','',0,'http://ogdch.dev/?post_type=ckan-local-org&#038;p=301',0,'ckan-local-org','',0);
INSERT INTO `ogdch_posts` VALUES (302,1,'2015-11-04 16:13:09','2015-11-04 15:13:09','','Bundesamt für Gesundheit','','publish','closed','closed','','bundesamt-fur-gesundheit','','','2015-12-04 13:26:21','2015-12-04 12:26:21','',0,'http://ogdch.dev/?post_type=ckan-local-org&#038;p=302',0,'ckan-local-org','',0);
INSERT INTO `ogdch_posts` VALUES (303,1,'2015-11-04 16:14:00','2015-11-04 15:14:00','','Schweizerische Bundesbahnen (SBB)','','publish','closed','closed','','schweizerische-bundesbahnen-sbb','','','2015-12-04 13:26:56','2015-12-04 12:26:56','',0,'http://ogdch.dev/?post_type=ckan-local-org&#038;p=303',0,'ckan-local-org','',0);
INSERT INTO `ogdch_posts` VALUES (304,1,'2015-11-04 16:15:08','2015-11-04 15:15:08','','Bundesamt für Statistik','','publish','closed','closed','','bundesamt-fur-statistik','','','2015-12-04 13:26:34','2015-12-04 12:26:34','',0,'http://ogdch.dev/?post_type=ckan-local-org&#038;p=304',0,'ckan-local-org','',0);
INSERT INTO `ogdch_posts` VALUES (305,1,'2015-11-18 10:47:58','2015-11-18 09:47:58','','Nutzungsbedigungen','','publish','closed','closed','','terms-of-use','','','2015-11-18 10:50:34','2015-11-18 09:50:34','',0,'http://ogdch.dev/?page_id=305',0,'page','',0);
INSERT INTO `ogdch_posts` VALUES (306,1,'2015-11-18 10:47:58','2015-11-18 09:48:15','','Terms of use','','publish','closed','closed','','terms-of-use','','','2015-11-18 10:48:15','2015-11-18 09:48:15','',0,'http://ogdch.dev/?page_id=306',0,'page','',0);
INSERT INTO `ogdch_posts` VALUES (307,1,'2015-11-18 10:47:58','2015-11-18 09:49:09','','Condizioni d\'uso','','publish','closed','closed','','terms-of-use','','','2015-11-18 10:50:21','2015-11-18 09:50:21','',0,'http://ogdch.dev/?page_id=307',0,'page','',0);
INSERT INTO `ogdch_posts` VALUES (308,1,'2015-11-18 10:47:58','2015-11-18 09:49:53','','Conditions d\'utilisation','','publish','closed','closed','','terms-of-use','','','2015-11-18 10:50:04','2015-11-18 09:50:04','',0,'http://ogdch.dev/?page_id=308',0,'page','',0);
INSERT INTO `ogdch_posts` VALUES (309,1,'2015-11-24 21:15:32','2015-11-24 20:15:32','','Geocat Harvester','','publish','closed','closed','','geocat-harvester','','','2015-11-24 21:15:32','2015-11-24 20:15:32','',0,'http://ogdch.dev/?post_type=ckan-local-harvester&#038;p=309',0,'ckan-local-harvester','',0);
INSERT INTO `ogdch_posts` VALUES (310,1,'2015-12-02 17:34:06','2015-12-02 16:31:17','','Rechtliche Hinweise','','publish','closed','closed','','legal-framework','','','2015-12-02 17:31:36','2015-12-02 16:31:36','',0,'http://ogdch.dev/?page_id=310',0,'page','',0);
INSERT INTO `ogdch_posts` VALUES (311,1,'2015-12-02 17:34:06','2015-12-02 16:31:58','','Legal framework','','publish','closed','closed','','legal-framework','','','2015-12-02 17:31:58','2015-12-02 16:31:58','',0,'http://ogdch.dev/?page_id=311',0,'page','',0);
INSERT INTO `ogdch_posts` VALUES (312,1,'2015-12-02 17:34:06','2015-12-02 16:33:22','','Quadro giuridico','','publish','closed','closed','','legal-framework','','','2015-12-02 17:33:51','2015-12-02 16:33:51','',0,'http://ogdch.dev/?page_id=312',0,'page','',0);
INSERT INTO `ogdch_posts` VALUES (313,1,'2015-12-02 17:34:06','2015-12-02 16:34:06','','Cadre juridique','','publish','closed','closed','','legal-framework','','','2015-12-02 17:34:17','2015-12-02 16:34:17','',0,'http://ogdch.dev/?page_id=313',0,'page','',0);
INSERT INTO `ogdch_posts` VALUES (314,1,'2015-12-04 13:23:26','2015-12-04 12:23:26','','Bundesamt für Chüngelihaltig (BfHüpf)','','publish','closed','closed','','bundesamt-fur-chungelihaltig-bfhupf','','','2015-12-04 13:23:26','2015-12-04 12:23:26','',0,'http://ogdch.dev/?post_type=ckan-local-org&#038;p=314',0,'ckan-local-org','',0);
INSERT INTO `ogdch_posts` VALUES (315,1,'2015-12-09 16:48:19','0000-00-00 00:00:00','This is a preview of how this form will appear on your website','ninja_forms_preview_page','','draft','closed','closed','','','','','2015-12-09 16:48:19','0000-00-00 00:00:00','',0,'http://ogdch.dev/?page_id=315',0,'page','',0);
INSERT INTO `ogdch_posts` VALUES (316,1,'2016-06-09 18:11:16','0000-00-00 00:00:00','','Automatisch gespeicherter Entwurf','','auto-draft','open','open','','','','','2016-06-09 18:11:16','0000-00-00 00:00:00','',0,'http://ogdch.dev/?p=316',0,'post','',0);
INSERT INTO `ogdch_posts` VALUES (317,1,'2016-06-13 15:06:34','2016-06-13 13:06:34','<ul>\r\n	<li>What?</li>\r\n	<li>Yes!</li>\r\n</ul>','FAQ','','publish','open','open','','faq','','','2016-06-13 11:34:47','2016-06-13 09:34:47','',0,'http://ogdch.dev/?p=317',0,'post','',0);
INSERT INTO `ogdch_posts` VALUES (318,1,'2016-06-13 11:35:28','2016-06-13 09:35:28','<ul>\r\n	<li>Hello</li>\r\n	<li>World!</li>\r\n</ul>','FAQ','','inherit','closed','closed','','164-autosave-v1','','','2016-06-13 11:35:28','2016-06-13 09:35:28','',164,'http://ogdch.dev/164-autosave-v1/',0,'revision','',0);
INSERT INTO `ogdch_posts` VALUES (319,1,'2016-06-13 15:06:34','2016-06-13 13:06:34','English FAQ!','','','publish','open','open','','319','','','2016-06-13 15:06:34','2016-06-13 13:06:34','',0,'http://ogdch.dev/?p=319',0,'post','',0);
INSERT INTO `ogdch_posts` VALUES (320,1,'2016-06-15 10:23:44','0000-00-00 00:00:00','','Automatisch gespeicherter Entwurf','','auto-draft','closed','closed','','','','','2016-06-15 10:23:44','0000-00-00 00:00:00','',0,'http://ogdch.dev/?page_id=320',0,'page','',0);
INSERT INTO `ogdch_posts` VALUES (321,1,'2016-06-15 10:24:12','2016-06-15 08:24:12','Glossar','Glossar','','publish','closed','closed','','glossar','','','2016-06-15 10:24:12','2016-06-15 08:24:12','',0,'http://ogdch.dev/?page_id=321',0,'page','',0);
/*!40000 ALTER TABLE `ogdch_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ogdch_term_relationships`
--

DROP TABLE IF EXISTS `ogdch_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ogdch_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogdch_term_relationships`
--

LOCK TABLES `ogdch_term_relationships` WRITE;
/*!40000 ALTER TABLE `ogdch_term_relationships` DISABLE KEYS */;
INSERT INTO `ogdch_term_relationships` VALUES (1,3,0);
INSERT INTO `ogdch_term_relationships` VALUES (1,4,0);
INSERT INTO `ogdch_term_relationships` VALUES (2,2,0);
INSERT INTO `ogdch_term_relationships` VALUES (2,71,0);
INSERT INTO `ogdch_term_relationships` VALUES (7,4,0);
INSERT INTO `ogdch_term_relationships` VALUES (7,6,0);
INSERT INTO `ogdch_term_relationships` VALUES (11,4,0);
INSERT INTO `ogdch_term_relationships` VALUES (11,10,0);
INSERT INTO `ogdch_term_relationships` VALUES (15,4,0);
INSERT INTO `ogdch_term_relationships` VALUES (15,14,0);
INSERT INTO `ogdch_term_relationships` VALUES (37,42,0);
INSERT INTO `ogdch_term_relationships` VALUES (38,43,0);
INSERT INTO `ogdch_term_relationships` VALUES (91,2,0);
INSERT INTO `ogdch_term_relationships` VALUES (92,13,0);
INSERT INTO `ogdch_term_relationships` VALUES (93,5,0);
INSERT INTO `ogdch_term_relationships` VALUES (94,9,0);
INSERT INTO `ogdch_term_relationships` VALUES (97,3,0);
INSERT INTO `ogdch_term_relationships` VALUES (97,5,0);
INSERT INTO `ogdch_term_relationships` VALUES (97,71,0);
INSERT INTO `ogdch_term_relationships` VALUES (97,98,0);
INSERT INTO `ogdch_term_relationships` VALUES (99,3,0);
INSERT INTO `ogdch_term_relationships` VALUES (99,100,0);
INSERT INTO `ogdch_term_relationships` VALUES (101,3,0);
INSERT INTO `ogdch_term_relationships` VALUES (101,102,0);
INSERT INTO `ogdch_term_relationships` VALUES (103,3,0);
INSERT INTO `ogdch_term_relationships` VALUES (103,5,0);
INSERT INTO `ogdch_term_relationships` VALUES (103,104,0);
INSERT INTO `ogdch_term_relationships` VALUES (104,2,0);
INSERT INTO `ogdch_term_relationships` VALUES (105,3,0);
INSERT INTO `ogdch_term_relationships` VALUES (105,9,0);
INSERT INTO `ogdch_term_relationships` VALUES (105,106,0);
INSERT INTO `ogdch_term_relationships` VALUES (107,3,0);
INSERT INTO `ogdch_term_relationships` VALUES (107,108,0);
INSERT INTO `ogdch_term_relationships` VALUES (109,3,0);
INSERT INTO `ogdch_term_relationships` VALUES (109,110,0);
INSERT INTO `ogdch_term_relationships` VALUES (111,3,0);
INSERT INTO `ogdch_term_relationships` VALUES (111,112,0);
INSERT INTO `ogdch_term_relationships` VALUES (113,3,0);
INSERT INTO `ogdch_term_relationships` VALUES (113,114,0);
INSERT INTO `ogdch_term_relationships` VALUES (115,3,0);
INSERT INTO `ogdch_term_relationships` VALUES (115,116,0);
INSERT INTO `ogdch_term_relationships` VALUES (117,3,0);
INSERT INTO `ogdch_term_relationships` VALUES (117,118,0);
INSERT INTO `ogdch_term_relationships` VALUES (118,9,0);
INSERT INTO `ogdch_term_relationships` VALUES (118,71,0);
INSERT INTO `ogdch_term_relationships` VALUES (119,13,0);
INSERT INTO `ogdch_term_relationships` VALUES (119,71,0);
INSERT INTO `ogdch_term_relationships` VALUES (119,112,0);
INSERT INTO `ogdch_term_relationships` VALUES (122,3,0);
INSERT INTO `ogdch_term_relationships` VALUES (122,123,0);
INSERT INTO `ogdch_term_relationships` VALUES (124,3,0);
INSERT INTO `ogdch_term_relationships` VALUES (124,125,0);
INSERT INTO `ogdch_term_relationships` VALUES (126,3,0);
INSERT INTO `ogdch_term_relationships` VALUES (126,127,0);
INSERT INTO `ogdch_term_relationships` VALUES (128,123,0);
INSERT INTO `ogdch_term_relationships` VALUES (140,2,0);
INSERT INTO `ogdch_term_relationships` VALUES (141,5,0);
INSERT INTO `ogdch_term_relationships` VALUES (141,103,0);
INSERT INTO `ogdch_term_relationships` VALUES (142,2,0);
INSERT INTO `ogdch_term_relationships` VALUES (142,103,0);
INSERT INTO `ogdch_term_relationships` VALUES (142,121,0);
INSERT INTO `ogdch_term_relationships` VALUES (143,9,0);
INSERT INTO `ogdch_term_relationships` VALUES (143,103,0);
INSERT INTO `ogdch_term_relationships` VALUES (154,3,0);
INSERT INTO `ogdch_term_relationships` VALUES (154,155,0);
INSERT INTO `ogdch_term_relationships` VALUES (156,3,0);
INSERT INTO `ogdch_term_relationships` VALUES (156,157,0);
INSERT INTO `ogdch_term_relationships` VALUES (158,3,0);
INSERT INTO `ogdch_term_relationships` VALUES (158,159,0);
INSERT INTO `ogdch_term_relationships` VALUES (160,3,0);
INSERT INTO `ogdch_term_relationships` VALUES (160,161,0);
INSERT INTO `ogdch_term_relationships` VALUES (162,3,0);
INSERT INTO `ogdch_term_relationships` VALUES (162,163,0);
INSERT INTO `ogdch_term_relationships` VALUES (164,2,0);
INSERT INTO `ogdch_term_relationships` VALUES (164,3,0);
INSERT INTO `ogdch_term_relationships` VALUES (164,134,0);
INSERT INTO `ogdch_term_relationships` VALUES (164,165,0);
INSERT INTO `ogdch_term_relationships` VALUES (165,5,0);
INSERT INTO `ogdch_term_relationships` VALUES (165,134,0);
INSERT INTO `ogdch_term_relationships` VALUES (166,3,0);
INSERT INTO `ogdch_term_relationships` VALUES (166,9,0);
INSERT INTO `ogdch_term_relationships` VALUES (166,134,0);
INSERT INTO `ogdch_term_relationships` VALUES (166,167,0);
INSERT INTO `ogdch_term_relationships` VALUES (167,13,0);
INSERT INTO `ogdch_term_relationships` VALUES (167,134,0);
INSERT INTO `ogdch_term_relationships` VALUES (168,3,0);
INSERT INTO `ogdch_term_relationships` VALUES (168,169,0);
INSERT INTO `ogdch_term_relationships` VALUES (170,3,0);
INSERT INTO `ogdch_term_relationships` VALUES (170,171,0);
INSERT INTO `ogdch_term_relationships` VALUES (172,135,0);
INSERT INTO `ogdch_term_relationships` VALUES (180,136,0);
INSERT INTO `ogdch_term_relationships` VALUES (184,137,0);
INSERT INTO `ogdch_term_relationships` VALUES (188,138,0);
INSERT INTO `ogdch_term_relationships` VALUES (195,2,0);
INSERT INTO `ogdch_term_relationships` VALUES (195,139,0);
INSERT INTO `ogdch_term_relationships` VALUES (196,5,0);
INSERT INTO `ogdch_term_relationships` VALUES (196,139,0);
INSERT INTO `ogdch_term_relationships` VALUES (197,9,0);
INSERT INTO `ogdch_term_relationships` VALUES (197,139,0);
INSERT INTO `ogdch_term_relationships` VALUES (198,13,0);
INSERT INTO `ogdch_term_relationships` VALUES (198,139,0);
INSERT INTO `ogdch_term_relationships` VALUES (233,135,0);
INSERT INTO `ogdch_term_relationships` VALUES (234,135,0);
INSERT INTO `ogdch_term_relationships` VALUES (236,135,0);
INSERT INTO `ogdch_term_relationships` VALUES (237,136,0);
INSERT INTO `ogdch_term_relationships` VALUES (238,136,0);
INSERT INTO `ogdch_term_relationships` VALUES (239,136,0);
INSERT INTO `ogdch_term_relationships` VALUES (240,138,0);
INSERT INTO `ogdch_term_relationships` VALUES (241,138,0);
INSERT INTO `ogdch_term_relationships` VALUES (242,138,0);
INSERT INTO `ogdch_term_relationships` VALUES (243,137,0);
INSERT INTO `ogdch_term_relationships` VALUES (244,137,0);
INSERT INTO `ogdch_term_relationships` VALUES (245,137,0);
INSERT INTO `ogdch_term_relationships` VALUES (247,2,0);
INSERT INTO `ogdch_term_relationships` VALUES (247,142,0);
INSERT INTO `ogdch_term_relationships` VALUES (248,5,0);
INSERT INTO `ogdch_term_relationships` VALUES (248,142,0);
INSERT INTO `ogdch_term_relationships` VALUES (249,9,0);
INSERT INTO `ogdch_term_relationships` VALUES (249,142,0);
INSERT INTO `ogdch_term_relationships` VALUES (250,13,0);
INSERT INTO `ogdch_term_relationships` VALUES (250,142,0);
INSERT INTO `ogdch_term_relationships` VALUES (283,2,0);
INSERT INTO `ogdch_term_relationships` VALUES (284,154,0);
INSERT INTO `ogdch_term_relationships` VALUES (284,156,0);
INSERT INTO `ogdch_term_relationships` VALUES (284,158,0);
INSERT INTO `ogdch_term_relationships` VALUES (284,160,0);
INSERT INTO `ogdch_term_relationships` VALUES (284,162,0);
INSERT INTO `ogdch_term_relationships` VALUES (284,164,0);
INSERT INTO `ogdch_term_relationships` VALUES (284,166,0);
INSERT INTO `ogdch_term_relationships` VALUES (284,168,0);
INSERT INTO `ogdch_term_relationships` VALUES (284,172,0);
INSERT INTO `ogdch_term_relationships` VALUES (284,173,0);
INSERT INTO `ogdch_term_relationships` VALUES (284,174,0);
INSERT INTO `ogdch_term_relationships` VALUES (284,175,0);
INSERT INTO `ogdch_term_relationships` VALUES (284,176,0);
INSERT INTO `ogdch_term_relationships` VALUES (284,177,0);
INSERT INTO `ogdch_term_relationships` VALUES (284,178,0);
INSERT INTO `ogdch_term_relationships` VALUES (284,179,0);
INSERT INTO `ogdch_term_relationships` VALUES (285,170,0);
INSERT INTO `ogdch_term_relationships` VALUES (286,135,0);
INSERT INTO `ogdch_term_relationships` VALUES (287,136,0);
INSERT INTO `ogdch_term_relationships` VALUES (288,138,0);
INSERT INTO `ogdch_term_relationships` VALUES (289,137,0);
INSERT INTO `ogdch_term_relationships` VALUES (297,180,0);
INSERT INTO `ogdch_term_relationships` VALUES (297,181,0);
INSERT INTO `ogdch_term_relationships` VALUES (297,182,0);
INSERT INTO `ogdch_term_relationships` VALUES (297,183,0);
INSERT INTO `ogdch_term_relationships` VALUES (297,184,0);
INSERT INTO `ogdch_term_relationships` VALUES (297,185,0);
INSERT INTO `ogdch_term_relationships` VALUES (297,186,0);
INSERT INTO `ogdch_term_relationships` VALUES (297,187,0);
INSERT INTO `ogdch_term_relationships` VALUES (305,2,0);
INSERT INTO `ogdch_term_relationships` VALUES (305,188,0);
INSERT INTO `ogdch_term_relationships` VALUES (306,5,0);
INSERT INTO `ogdch_term_relationships` VALUES (306,188,0);
INSERT INTO `ogdch_term_relationships` VALUES (307,9,0);
INSERT INTO `ogdch_term_relationships` VALUES (307,188,0);
INSERT INTO `ogdch_term_relationships` VALUES (308,13,0);
INSERT INTO `ogdch_term_relationships` VALUES (308,188,0);
INSERT INTO `ogdch_term_relationships` VALUES (310,2,0);
INSERT INTO `ogdch_term_relationships` VALUES (310,193,0);
INSERT INTO `ogdch_term_relationships` VALUES (311,5,0);
INSERT INTO `ogdch_term_relationships` VALUES (311,193,0);
INSERT INTO `ogdch_term_relationships` VALUES (312,9,0);
INSERT INTO `ogdch_term_relationships` VALUES (312,193,0);
INSERT INTO `ogdch_term_relationships` VALUES (313,13,0);
INSERT INTO `ogdch_term_relationships` VALUES (313,193,0);
INSERT INTO `ogdch_term_relationships` VALUES (315,2,0);
INSERT INTO `ogdch_term_relationships` VALUES (316,2,0);
INSERT INTO `ogdch_term_relationships` VALUES (317,1,0);
INSERT INTO `ogdch_term_relationships` VALUES (317,2,0);
INSERT INTO `ogdch_term_relationships` VALUES (317,194,0);
INSERT INTO `ogdch_term_relationships` VALUES (319,5,0);
INSERT INTO `ogdch_term_relationships` VALUES (319,7,0);
INSERT INTO `ogdch_term_relationships` VALUES (319,194,0);
INSERT INTO `ogdch_term_relationships` VALUES (320,2,0);
INSERT INTO `ogdch_term_relationships` VALUES (321,2,0);
/*!40000 ALTER TABLE `ogdch_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ogdch_term_taxonomy`
--

DROP TABLE IF EXISTS `ogdch_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ogdch_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogdch_term_taxonomy`
--

LOCK TABLES `ogdch_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `ogdch_term_taxonomy` DISABLE KEYS */;
INSERT INTO `ogdch_term_taxonomy` VALUES (1,1,'category','',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (2,2,'language','a:3:{s:6:\"locale\";s:5:\"de_CH\";s:3:\"rtl\";i:0;s:9:\"flag_code\";s:2:\"ch\";}',0,7);
INSERT INTO `ogdch_term_taxonomy` VALUES (3,3,'term_language','',0,24);
INSERT INTO `ogdch_term_taxonomy` VALUES (4,4,'term_translations','a:4:{s:2:\"de\";i:1;s:2:\"en\";i:7;s:2:\"it\";i:11;s:2:\"fr\";i:15;}',0,4);
INSERT INTO `ogdch_term_taxonomy` VALUES (5,5,'language','a:3:{s:6:\"locale\";s:5:\"en_US\";s:3:\"rtl\";i:0;s:9:\"flag_code\";s:2:\"us\";}',0,6);
INSERT INTO `ogdch_term_taxonomy` VALUES (6,6,'term_language','',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (7,7,'category','',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (9,9,'language','a:3:{s:6:\"locale\";s:5:\"it_IT\";s:3:\"rtl\";i:0;s:9:\"flag_code\";s:2:\"it\";}',0,6);
INSERT INTO `ogdch_term_taxonomy` VALUES (10,10,'term_language','',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (11,11,'category','',0,0);
INSERT INTO `ogdch_term_taxonomy` VALUES (13,13,'language','a:3:{s:6:\"locale\";s:5:\"fr_FR\";s:3:\"rtl\";i:0;s:9:\"flag_code\";s:2:\"fr\";}',0,6);
INSERT INTO `ogdch_term_taxonomy` VALUES (14,14,'term_language','',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (15,15,'category','',0,0);
INSERT INTO `ogdch_term_taxonomy` VALUES (28,28,'post_translations','a:4:{s:2:\"en\";i:73;s:2:\"de\";i:71;s:2:\"it\";i:74;s:2:\"fr\";i:72;}',0,0);
INSERT INTO `ogdch_term_taxonomy` VALUES (29,29,'post_translations','a:4:{s:2:\"de\";i:75;s:2:\"fr\";i:76;s:2:\"en\";i:77;s:2:\"it\";i:78;}',0,0);
INSERT INTO `ogdch_term_taxonomy` VALUES (32,32,'post_translations','a:4:{s:2:\"de\";i:87;s:2:\"fr\";i:88;s:2:\"en\";i:89;s:2:\"it\";i:90;}',0,0);
INSERT INTO `ogdch_term_taxonomy` VALUES (42,42,'term_translations','a:1:{s:2:\"de\";i:37;}',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (43,43,'term_translations','a:1:{s:2:\"de\";i:38;}',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (71,71,'post_translations','a:4:{s:2:\"de\";i:2;s:2:\"en\";i:97;s:2:\"it\";i:118;s:2:\"fr\";i:119;}',0,4);
INSERT INTO `ogdch_term_taxonomy` VALUES (97,97,'ckan_groups','',0,0);
INSERT INTO `ogdch_term_taxonomy` VALUES (98,98,'term_translations','a:1:{s:2:\"de\";i:97;}',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (99,99,'ckan_groups','Pflanzenschutz ist extrem wichtig',0,0);
INSERT INTO `ogdch_term_taxonomy` VALUES (100,100,'term_translations','a:1:{s:2:\"de\";i:99;}',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (101,101,'ckan_groups','',0,0);
INSERT INTO `ogdch_term_taxonomy` VALUES (102,102,'term_translations','a:1:{s:2:\"de\";i:101;}',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (103,103,'ckan_organisation','',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (104,104,'term_translations','a:1:{s:2:\"de\";i:103;}',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (105,105,'ckan_organisation','',0,0);
INSERT INTO `ogdch_term_taxonomy` VALUES (106,106,'term_translations','a:1:{s:2:\"de\";i:105;}',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (107,107,'ckan_organisation','',103,0);
INSERT INTO `ogdch_term_taxonomy` VALUES (108,108,'term_translations','a:1:{s:2:\"de\";i:107;}',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (109,109,'ckan_organisation','yeahhh fff----lllll',0,0);
INSERT INTO `ogdch_term_taxonomy` VALUES (110,110,'term_translations','a:1:{s:2:\"de\";i:109;}',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (111,111,'ckan_organisation','we make sharpoint possible',105,0);
INSERT INTO `ogdch_term_taxonomy` VALUES (112,112,'term_translations','a:1:{s:2:\"de\";i:111;}',0,2);
INSERT INTO `ogdch_term_taxonomy` VALUES (113,113,'ckan_organisation','',111,0);
INSERT INTO `ogdch_term_taxonomy` VALUES (114,114,'term_translations','a:1:{s:2:\"de\";i:113;}',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (115,115,'ckan_organisation','',113,0);
INSERT INTO `ogdch_term_taxonomy` VALUES (116,116,'term_translations','a:1:{s:2:\"de\";i:115;}',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (117,117,'ckan_organisation','',111,0);
INSERT INTO `ogdch_term_taxonomy` VALUES (118,118,'term_translations','a:1:{s:2:\"de\";i:117;}',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (121,121,'post_translations','a:1:{s:2:\"de\";i:142;}',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (122,122,'ckan_group','',0,0);
INSERT INTO `ogdch_term_taxonomy` VALUES (123,123,'term_translations','a:1:{s:2:\"de\";i:122;}',0,2);
INSERT INTO `ogdch_term_taxonomy` VALUES (124,124,'ckan_group','Pflanzenschutz ist extrem wichtig',0,0);
INSERT INTO `ogdch_term_taxonomy` VALUES (125,125,'term_translations','a:1:{s:2:\"de\";i:124;}',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (126,126,'ckan_group','',0,0);
INSERT INTO `ogdch_term_taxonomy` VALUES (127,127,'term_translations','a:1:{s:2:\"de\";i:126;}',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (134,134,'post_translations','a:4:{s:2:\"en\";i:165;s:2:\"de\";i:164;s:2:\"it\";i:166;s:2:\"fr\";i:167;}',0,4);
INSERT INTO `ogdch_term_taxonomy` VALUES (135,135,'nav_menu','',0,5);
INSERT INTO `ogdch_term_taxonomy` VALUES (136,136,'nav_menu','',0,5);
INSERT INTO `ogdch_term_taxonomy` VALUES (137,137,'nav_menu','',0,5);
INSERT INTO `ogdch_term_taxonomy` VALUES (138,138,'nav_menu','',0,5);
INSERT INTO `ogdch_term_taxonomy` VALUES (139,139,'post_translations','a:4:{s:2:\"de\";i:195;s:2:\"en\";i:196;s:2:\"it\";i:197;s:2:\"fr\";i:198;}',0,4);
INSERT INTO `ogdch_term_taxonomy` VALUES (142,142,'post_translations','a:4:{s:2:\"de\";i:247;s:2:\"en\";i:248;s:2:\"it\";i:249;s:2:\"fr\";i:250;}',0,4);
INSERT INTO `ogdch_term_taxonomy` VALUES (154,154,'post_tag','',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (155,155,'term_translations','a:1:{s:2:\"de\";i:154;}',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (156,156,'post_tag','',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (157,157,'term_translations','a:1:{s:2:\"de\";i:156;}',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (158,158,'post_tag','',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (159,159,'term_translations','a:1:{s:2:\"de\";i:158;}',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (160,160,'post_tag','',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (161,161,'term_translations','a:1:{s:2:\"de\";i:160;}',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (162,162,'post_tag','',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (163,163,'term_translations','a:1:{s:2:\"de\";i:162;}',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (164,164,'post_tag','',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (165,165,'term_translations','a:1:{s:2:\"de\";i:164;}',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (166,166,'post_tag','',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (167,167,'term_translations','a:1:{s:2:\"de\";i:166;}',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (168,168,'post_tag','',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (169,169,'term_translations','a:1:{s:2:\"de\";i:168;}',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (170,170,'post_tag','',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (171,171,'term_translations','a:1:{s:2:\"de\";i:170;}',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (172,172,'ckan-keyword-de','',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (173,173,'ckan-keyword-de','',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (174,174,'ckan-keyword-fr','',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (175,175,'ckan-keyword-fr','',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (176,176,'ckan-keyword-it','',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (177,177,'ckan-keyword-it','',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (178,178,'ckan-keyword-en','',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (179,179,'ckan-keyword-en','',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (180,180,'ckan-keyword-de','',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (181,181,'ckan-keyword-de','',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (182,182,'ckan-keyword-fr','',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (183,183,'ckan-keyword-fr','',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (184,184,'ckan-keyword-it','',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (185,185,'ckan-keyword-it','',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (186,186,'ckan-keyword-en','',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (187,187,'ckan-keyword-en','',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (188,188,'post_translations','a:4:{s:2:\"de\";i:305;s:2:\"en\";i:306;s:2:\"it\";i:307;s:2:\"fr\";i:308;}',0,4);
INSERT INTO `ogdch_term_taxonomy` VALUES (189,189,'ckan-mediatype','',0,0);
INSERT INTO `ogdch_term_taxonomy` VALUES (190,190,'ckan-mediatype','',0,0);
INSERT INTO `ogdch_term_taxonomy` VALUES (191,191,'ckan-mediatype','',0,0);
INSERT INTO `ogdch_term_taxonomy` VALUES (192,192,'ckan-mediatype','',0,0);
INSERT INTO `ogdch_term_taxonomy` VALUES (193,193,'post_translations','a:4:{s:2:\"fr\";i:313;s:2:\"de\";i:310;s:2:\"en\";i:311;s:2:\"it\";i:312;}',0,4);
INSERT INTO `ogdch_term_taxonomy` VALUES (194,194,'post_translations','a:2:{s:2:\"en\";i:319;s:2:\"de\";i:317;}',0,2);
/*!40000 ALTER TABLE `ogdch_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ogdch_terms`
--

DROP TABLE IF EXISTS `ogdch_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ogdch_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogdch_terms`
--

LOCK TABLES `ogdch_terms` WRITE;
/*!40000 ALTER TABLE `ogdch_terms` DISABLE KEYS */;
INSERT INTO `ogdch_terms` VALUES (1,'Uncategorized','uncategorized',0);
INSERT INTO `ogdch_terms` VALUES (2,'Deutsch','de',0);
INSERT INTO `ogdch_terms` VALUES (3,'Deutsch','pll_de',0);
INSERT INTO `ogdch_terms` VALUES (4,'pll_5564672f3106e','pll_5564672f3106e',0);
INSERT INTO `ogdch_terms` VALUES (5,'English','en',0);
INSERT INTO `ogdch_terms` VALUES (6,'English','pll_en',0);
INSERT INTO `ogdch_terms` VALUES (7,'Allgemein','allgemein-en',0);
INSERT INTO `ogdch_terms` VALUES (9,'Italiano','it',0);
INSERT INTO `ogdch_terms` VALUES (10,'Italiano','pll_it',0);
INSERT INTO `ogdch_terms` VALUES (11,'Allgemein','allgemein-it',0);
INSERT INTO `ogdch_terms` VALUES (13,'Français','fr',0);
INSERT INTO `ogdch_terms` VALUES (14,'Français','pll_fr',0);
INSERT INTO `ogdch_terms` VALUES (15,'Allgemein','allgemein-fr',0);
INSERT INTO `ogdch_terms` VALUES (28,'pll_55687075ce1aa','pll_55687075ce1aa',0);
INSERT INTO `ogdch_terms` VALUES (29,'pll_5568729a9d3cb','pll_5568729a9d3cb',0);
INSERT INTO `ogdch_terms` VALUES (32,'pll_556c4af5edcdf','pll_556c4af5edcdf',0);
INSERT INTO `ogdch_terms` VALUES (42,'pll_556da258877ed','pll_556da258877ed',0);
INSERT INTO `ogdch_terms` VALUES (43,'pll_556da25887892','pll_556da25887892',0);
INSERT INTO `ogdch_terms` VALUES (71,'pll_556da935aac79','pll_556da935aac79',0);
INSERT INTO `ogdch_terms` VALUES (97,'Autos','autos',0);
INSERT INTO `ogdch_terms` VALUES (98,'pll_556ebfdf27ed6','pll_556ebfdf27ed6',0);
INSERT INTO `ogdch_terms` VALUES (99,'Pflanzenschutz','pflanzenschutz',0);
INSERT INTO `ogdch_terms` VALUES (100,'pll_556ebfdf41e0a','pll_556ebfdf41e0a',0);
INSERT INTO `ogdch_terms` VALUES (101,'Super-Kategorie','super-kategorie',0);
INSERT INTO `ogdch_terms` VALUES (102,'pll_556ebfdf59f93','pll_556ebfdf59f93',0);
INSERT INTO `ogdch_terms` VALUES (103,'Liip AG','liip-ag',0);
INSERT INTO `ogdch_terms` VALUES (104,'pll_556ebfe4bfd69','pll_556ebfe4bfd69',0);
INSERT INTO `ogdch_terms` VALUES (105,'Migros','migros',0);
INSERT INTO `ogdch_terms` VALUES (106,'pll_556ebfe4d7f7c','pll_556ebfe4d7f7c',0);
INSERT INTO `ogdch_terms` VALUES (107,'Namics','namics',0);
INSERT INTO `ogdch_terms` VALUES (108,'pll_556ebfe4f02fd','pll_556ebfe4f02fd',0);
INSERT INTO `ogdch_terms` VALUES (109,'Odi2','odi2',0);
INSERT INTO `ogdch_terms` VALUES (110,'pll_556ebfe51317d','pll_556ebfe51317d',0);
INSERT INTO `ogdch_terms` VALUES (111,'Unic','unic',0);
INSERT INTO `ogdch_terms` VALUES (112,'pll_556ebfe52cfdc','pll_556ebfe52cfdc',0);
INSERT INTO `ogdch_terms` VALUES (113,'Unic Dev','unic-dev',0);
INSERT INTO `ogdch_terms` VALUES (114,'pll_556ec74c7dbb6','pll_556ec74c7dbb6',0);
INSERT INTO `ogdch_terms` VALUES (115,'Unic Dev2','unic-dev2',0);
INSERT INTO `ogdch_terms` VALUES (116,'pll_556ec74c976ff','pll_556ec74c976ff',0);
INSERT INTO `ogdch_terms` VALUES (117,'Unic HR','unic-hr',0);
INSERT INTO `ogdch_terms` VALUES (118,'pll_556ec74cb06a3','pll_556ec74cb06a3',0);
INSERT INTO `ogdch_terms` VALUES (121,'pll_556ef83b8f024','pll_556ef83b8f024',0);
INSERT INTO `ogdch_terms` VALUES (122,'Autos','autos',0);
INSERT INTO `ogdch_terms` VALUES (123,'pll_556ffd507f12c','pll_556ffd507f12c',0);
INSERT INTO `ogdch_terms` VALUES (124,'Pflanzenschutz','pflanzenschutz',0);
INSERT INTO `ogdch_terms` VALUES (125,'pll_556ffd5098be9','pll_556ffd5098be9',0);
INSERT INTO `ogdch_terms` VALUES (126,'Super-Kategorie','super-kategorie',0);
INSERT INTO `ogdch_terms` VALUES (127,'pll_556ffd50b048b','pll_556ffd50b048b',0);
INSERT INTO `ogdch_terms` VALUES (134,'pll_55dc6d40488ce','pll_55dc6d40488ce',0);
INSERT INTO `ogdch_terms` VALUES (135,'MainNavigation DE','mainnavigation-de',0);
INSERT INTO `ogdch_terms` VALUES (136,'MainNavigation EN','mainnavigation-en',0);
INSERT INTO `ogdch_terms` VALUES (137,'MainNavigation IT','mainnavigation-it',0);
INSERT INTO `ogdch_terms` VALUES (138,'MainNavigation FR','mainnavigation-fr',0);
INSERT INTO `ogdch_terms` VALUES (139,'pll_55dc737d7783b','pll_55dc737d7783b',0);
INSERT INTO `ogdch_terms` VALUES (142,'pll_560073db54b9a','pll_560073db54b9a',0);
INSERT INTO `ogdch_terms` VALUES (154,'Eisenbahn','eisenbahn',0);
INSERT INTO `ogdch_terms` VALUES (155,'pll_560154a83e18b','pll_560154a83e18b',0);
INSERT INTO `ogdch_terms` VALUES (156,'Chemin-de-fer','chemin-de-fer',0);
INSERT INTO `ogdch_terms` VALUES (157,'pll_560154a8451e0','pll_560154a8451e0',0);
INSERT INTO `ogdch_terms` VALUES (158,'Ferrovia','ferrovia',0);
INSERT INTO `ogdch_terms` VALUES (159,'pll_560154a84bad4','pll_560154a84bad4',0);
INSERT INTO `ogdch_terms` VALUES (160,'Railroad','railroad',0);
INSERT INTO `ogdch_terms` VALUES (161,'pll_560154a86118d','pll_560154a86118d',0);
INSERT INTO `ogdch_terms` VALUES (162,'Nacht','nacht',0);
INSERT INTO `ogdch_terms` VALUES (163,'pll_560154a872339','pll_560154a872339',0);
INSERT INTO `ogdch_terms` VALUES (164,'Nuit','nuit',0);
INSERT INTO `ogdch_terms` VALUES (165,'pll_560154a87a0a3','pll_560154a87a0a3',0);
INSERT INTO `ogdch_terms` VALUES (166,'Noche','noche',0);
INSERT INTO `ogdch_terms` VALUES (167,'pll_560154a88169e','pll_560154a88169e',0);
INSERT INTO `ogdch_terms` VALUES (168,'Night','night',0);
INSERT INTO `ogdch_terms` VALUES (169,'pll_560154a888a11','pll_560154a888a11',0);
INSERT INTO `ogdch_terms` VALUES (170,'bau','bau',0);
INSERT INTO `ogdch_terms` VALUES (171,'pll_56015580a284e','pll_56015580a284e',0);
INSERT INTO `ogdch_terms` VALUES (172,'Eisenbahn','eisenbahn',0);
INSERT INTO `ogdch_terms` VALUES (173,'Nacht','nacht',0);
INSERT INTO `ogdch_terms` VALUES (174,'Chemin-de-fer','chemin-de-fer',0);
INSERT INTO `ogdch_terms` VALUES (175,'Nuit','nuit',0);
INSERT INTO `ogdch_terms` VALUES (176,'Ferrovia','ferrovia',0);
INSERT INTO `ogdch_terms` VALUES (177,'Noche','noche',0);
INSERT INTO `ogdch_terms` VALUES (178,'Railroad','railroad',0);
INSERT INTO `ogdch_terms` VALUES (179,'Night','night',0);
INSERT INTO `ogdch_terms` VALUES (180,'Landesgrenze','landesgrenze',0);
INSERT INTO `ogdch_terms` VALUES (181,'Verwaltungseinheiten','verwaltungseinheiten',0);
INSERT INTO `ogdch_terms` VALUES (182,'Frontières nationales','frontieres-nationales',0);
INSERT INTO `ogdch_terms` VALUES (183,'Unités administratives','unites-administratives',0);
INSERT INTO `ogdch_terms` VALUES (184,'Frontiere nazionali','frontiere-nazionali',0);
INSERT INTO `ogdch_terms` VALUES (185,'Unita amministrative','unita-amministrative',0);
INSERT INTO `ogdch_terms` VALUES (186,'National boundaries','national-boundaries',0);
INSERT INTO `ogdch_terms` VALUES (187,'Administrative units','administrative-units',0);
INSERT INTO `ogdch_terms` VALUES (188,'pll_564c495fa37c2','pll_564c495fa37c2',0);
INSERT INTO `ogdch_terms` VALUES (189,'application/zip','applicationzip',0);
INSERT INTO `ogdch_terms` VALUES (190,'text/csv','textcsv',0);
INSERT INTO `ogdch_terms` VALUES (191,'text/xml','textxml',0);
INSERT INTO `ogdch_terms` VALUES (192,'application/pdf','applicationpdf',0);
INSERT INTO `ogdch_terms` VALUES (193,'pll_565f1cfea1219','pll_565f1cfea1219',0);
INSERT INTO `ogdch_terms` VALUES (194,'pll_575eafdac4f8c','pll_575eafdac4f8c',0);
/*!40000 ALTER TABLE `ogdch_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ogdch_usermeta`
--

DROP TABLE IF EXISTS `ogdch_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ogdch_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogdch_usermeta`
--

LOCK TABLES `ogdch_usermeta` WRITE;
/*!40000 ALTER TABLE `ogdch_usermeta` DISABLE KEYS */;
INSERT INTO `ogdch_usermeta` VALUES (1,1,'nickname','liip');
INSERT INTO `ogdch_usermeta` VALUES (2,1,'first_name','');
INSERT INTO `ogdch_usermeta` VALUES (3,1,'last_name','');
INSERT INTO `ogdch_usermeta` VALUES (4,1,'description','');
INSERT INTO `ogdch_usermeta` VALUES (5,1,'rich_editing','true');
INSERT INTO `ogdch_usermeta` VALUES (6,1,'comment_shortcuts','false');
INSERT INTO `ogdch_usermeta` VALUES (7,1,'admin_color','fresh');
INSERT INTO `ogdch_usermeta` VALUES (8,1,'use_ssl','0');
INSERT INTO `ogdch_usermeta` VALUES (9,1,'show_admin_bar_front','true');
INSERT INTO `ogdch_usermeta` VALUES (10,1,'ogdch_capabilities','a:1:{s:13:\"administrator\";b:1;}');
INSERT INTO `ogdch_usermeta` VALUES (11,1,'ogdch_user_level','10');
INSERT INTO `ogdch_usermeta` VALUES (12,1,'dismissed_wp_pointers','wp360_locks,wp390_widgets,wp410_dfw,pll_lgt');
INSERT INTO `ogdch_usermeta` VALUES (13,1,'show_welcome_panel','0');
INSERT INTO `ogdch_usermeta` VALUES (15,1,'ogdch_dashboard_quick_press_last_post_id','316');
INSERT INTO `ogdch_usermeta` VALUES (16,1,'pll_filter_content','');
INSERT INTO `ogdch_usermeta` VALUES (17,1,'ogdch_user-settings','posts_list_mode=list&libraryContent=browse&mfold=o&advImgDetails=show&uploader=1&hidetb=1&editor=tinymce');
INSERT INTO `ogdch_usermeta` VALUES (18,1,'ogdch_user-settings-time','1449073784');
INSERT INTO `ogdch_usermeta` VALUES (19,1,'managenav-menuscolumnshidden','a:4:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";}');
INSERT INTO `ogdch_usermeta` VALUES (20,1,'metaboxhidden_nav-menus','a:7:{i:0;s:19:\"pll_lang_switch_box\";i:1;s:8:\"add-post\";i:2;s:7:\"add-app\";i:3;s:22:\"add-ckan-local-dataset\";i:4;s:20:\"add-ckan-local-group\";i:5;s:18:\"add-ckan-local-org\";i:6;s:12:\"add-post_tag\";}');
INSERT INTO `ogdch_usermeta` VALUES (21,1,'nav_menu_recently_edited','135');
INSERT INTO `ogdch_usermeta` VALUES (22,1,'closedpostboxes_ckan-dataset','a:1:{i:0;s:16:\"ckan-dataset-box\";}');
INSERT INTO `ogdch_usermeta` VALUES (23,1,'metaboxhidden_ckan-dataset','a:1:{i:0;s:7:\"slugdiv\";}');
INSERT INTO `ogdch_usermeta` VALUES (24,1,'closedpostboxes_post','a:0:{}');
INSERT INTO `ogdch_usermeta` VALUES (25,1,'metaboxhidden_post','a:5:{i:0;s:11:\"postexcerpt\";i:1;s:13:\"trackbacksdiv\";i:2;s:10:\"postcustom\";i:3;s:7:\"slugdiv\";i:4;s:9:\"authordiv\";}');
INSERT INTO `ogdch_usermeta` VALUES (26,1,'_yoast_wpseo_profile_updated','1447418306');
INSERT INTO `ogdch_usermeta` VALUES (27,1,'wpseo_ignore_tour','1');
INSERT INTO `ogdch_usermeta` VALUES (28,1,'wpseo_seen_tagline_notice','seen');
INSERT INTO `ogdch_usermeta` VALUES (29,1,'wpseo_seen_about_version','2.3.5');
INSERT INTO `ogdch_usermeta` VALUES (30,1,'ckan-backend_organisation','swisstopo');
INSERT INTO `ogdch_usermeta` VALUES (31,1,'user_lang','0');
INSERT INTO `ogdch_usermeta` VALUES (32,1,'description_en','');
INSERT INTO `ogdch_usermeta` VALUES (33,1,'description_it','');
INSERT INTO `ogdch_usermeta` VALUES (34,1,'description_fr','');
INSERT INTO `ogdch_usermeta` VALUES (35,2,'nickname','alain');
INSERT INTO `ogdch_usermeta` VALUES (36,2,'first_name','Alain');
INSERT INTO `ogdch_usermeta` VALUES (37,2,'last_name','Data Owner');
INSERT INTO `ogdch_usermeta` VALUES (38,2,'description','');
INSERT INTO `ogdch_usermeta` VALUES (39,2,'rich_editing','true');
INSERT INTO `ogdch_usermeta` VALUES (40,2,'comment_shortcuts','false');
INSERT INTO `ogdch_usermeta` VALUES (41,2,'admin_color','fresh');
INSERT INTO `ogdch_usermeta` VALUES (42,2,'use_ssl','0');
INSERT INTO `ogdch_usermeta` VALUES (43,2,'show_admin_bar_front','true');
INSERT INTO `ogdch_usermeta` VALUES (44,2,'ogdch_capabilities','a:1:{s:10:\"data_owner\";b:1;}');
INSERT INTO `ogdch_usermeta` VALUES (45,2,'ogdch_user_level','0');
INSERT INTO `ogdch_usermeta` VALUES (46,2,'ckan-backend_organisation','swisstopo');
INSERT INTO `ogdch_usermeta` VALUES (47,2,'dismissed_wp_pointers','wp360_locks,wp390_widgets');
INSERT INTO `ogdch_usermeta` VALUES (48,3,'nickname','priska');
INSERT INTO `ogdch_usermeta` VALUES (49,3,'first_name','Priska');
INSERT INTO `ogdch_usermeta` VALUES (50,3,'last_name','Datenlieferantin');
INSERT INTO `ogdch_usermeta` VALUES (51,3,'description','');
INSERT INTO `ogdch_usermeta` VALUES (52,3,'rich_editing','true');
INSERT INTO `ogdch_usermeta` VALUES (53,3,'comment_shortcuts','false');
INSERT INTO `ogdch_usermeta` VALUES (54,3,'admin_color','fresh');
INSERT INTO `ogdch_usermeta` VALUES (55,3,'use_ssl','0');
INSERT INTO `ogdch_usermeta` VALUES (56,3,'show_admin_bar_front','true');
INSERT INTO `ogdch_usermeta` VALUES (57,3,'ogdch_capabilities','a:1:{s:14:\"datenlieferant\";b:1;}');
INSERT INTO `ogdch_usermeta` VALUES (58,3,'ogdch_user_level','0');
INSERT INTO `ogdch_usermeta` VALUES (59,3,'ckan-backend_organisation','swisstopo');
INSERT INTO `ogdch_usermeta` VALUES (60,3,'dismissed_wp_pointers','wp360_locks,wp390_widgets');
INSERT INTO `ogdch_usermeta` VALUES (61,4,'nickname','simon');
INSERT INTO `ogdch_usermeta` VALUES (62,4,'first_name','Simon');
INSERT INTO `ogdch_usermeta` VALUES (63,4,'last_name','Content Manager');
INSERT INTO `ogdch_usermeta` VALUES (64,4,'description','');
INSERT INTO `ogdch_usermeta` VALUES (65,4,'rich_editing','true');
INSERT INTO `ogdch_usermeta` VALUES (66,4,'comment_shortcuts','false');
INSERT INTO `ogdch_usermeta` VALUES (67,4,'admin_color','fresh');
INSERT INTO `ogdch_usermeta` VALUES (68,4,'use_ssl','0');
INSERT INTO `ogdch_usermeta` VALUES (69,4,'show_admin_bar_front','true');
INSERT INTO `ogdch_usermeta` VALUES (70,4,'ogdch_capabilities','a:1:{s:15:\"content_manager\";b:1;}');
INSERT INTO `ogdch_usermeta` VALUES (71,4,'ogdch_user_level','0');
INSERT INTO `ogdch_usermeta` VALUES (72,4,'ckan-backend_organisation','bundesarchiv');
INSERT INTO `ogdch_usermeta` VALUES (73,4,'dismissed_wp_pointers','wp360_locks,wp390_widgets');
INSERT INTO `ogdch_usermeta` VALUES (74,2,'user_lang','0');
INSERT INTO `ogdch_usermeta` VALUES (75,2,'description_en','');
INSERT INTO `ogdch_usermeta` VALUES (76,2,'description_it','');
INSERT INTO `ogdch_usermeta` VALUES (77,2,'description_fr','');
INSERT INTO `ogdch_usermeta` VALUES (78,1,'closedpostboxes_ckan-local-group','a:0:{}');
INSERT INTO `ogdch_usermeta` VALUES (79,1,'metaboxhidden_ckan-local-group','a:1:{i:0;s:7:\"slugdiv\";}');
INSERT INTO `ogdch_usermeta` VALUES (80,1,'closedpostboxes_nav-menus','a:0:{}');
INSERT INTO `ogdch_usermeta` VALUES (81,1,'closedpostboxes_nav-menus','a:0:{}');
INSERT INTO `ogdch_usermeta` VALUES (85,4,'nav_menu_recently_edited','135');
INSERT INTO `ogdch_usermeta` VALUES (86,4,'managenav-menuscolumnshidden','a:4:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";}');
INSERT INTO `ogdch_usermeta` VALUES (87,4,'metaboxhidden_nav-menus','a:7:{i:0;s:19:\"pll_lang_switch_box\";i:1;s:8:\"add-post\";i:2;s:7:\"add-app\";i:3;s:22:\"add-ckan-local-dataset\";i:4;s:20:\"add-ckan-local-group\";i:5;s:18:\"add-ckan-local-org\";i:6;s:12:\"add-post_tag\";}');
INSERT INTO `ogdch_usermeta` VALUES (88,5,'nickname','pierre');
INSERT INTO `ogdch_usermeta` VALUES (89,5,'first_name','Pierre');
INSERT INTO `ogdch_usermeta` VALUES (90,5,'last_name','Application Manager');
INSERT INTO `ogdch_usermeta` VALUES (91,5,'description','');
INSERT INTO `ogdch_usermeta` VALUES (92,5,'rich_editing','true');
INSERT INTO `ogdch_usermeta` VALUES (93,5,'comment_shortcuts','false');
INSERT INTO `ogdch_usermeta` VALUES (94,5,'admin_color','fresh');
INSERT INTO `ogdch_usermeta` VALUES (95,5,'use_ssl','0');
INSERT INTO `ogdch_usermeta` VALUES (96,5,'show_admin_bar_front','true');
INSERT INTO `ogdch_usermeta` VALUES (97,5,'ogdch_capabilities','a:1:{s:13:\"administrator\";b:1;}');
INSERT INTO `ogdch_usermeta` VALUES (98,5,'ogdch_user_level','10');
INSERT INTO `ogdch_usermeta` VALUES (99,5,'ckan-backend_organisation','bundesarchiv');
INSERT INTO `ogdch_usermeta` VALUES (100,5,'dismissed_wp_pointers','pll_lgt');
INSERT INTO `ogdch_usermeta` VALUES (101,5,'user_lang','0');
INSERT INTO `ogdch_usermeta` VALUES (102,5,'description_en','');
INSERT INTO `ogdch_usermeta` VALUES (103,5,'description_it','');
INSERT INTO `ogdch_usermeta` VALUES (104,5,'description_fr','');
INSERT INTO `ogdch_usermeta` VALUES (106,4,'user_lang','0');
INSERT INTO `ogdch_usermeta` VALUES (107,4,'description_en','');
INSERT INTO `ogdch_usermeta` VALUES (108,4,'description_it','');
INSERT INTO `ogdch_usermeta` VALUES (109,4,'description_fr','');
INSERT INTO `ogdch_usermeta` VALUES (110,6,'nickname','laura');
INSERT INTO `ogdch_usermeta` VALUES (111,6,'first_name','Laura');
INSERT INTO `ogdch_usermeta` VALUES (112,6,'last_name','Demo Userin');
INSERT INTO `ogdch_usermeta` VALUES (113,6,'description','');
INSERT INTO `ogdch_usermeta` VALUES (114,6,'rich_editing','true');
INSERT INTO `ogdch_usermeta` VALUES (115,6,'comment_shortcuts','false');
INSERT INTO `ogdch_usermeta` VALUES (116,6,'admin_color','fresh');
INSERT INTO `ogdch_usermeta` VALUES (117,6,'use_ssl','0');
INSERT INTO `ogdch_usermeta` VALUES (118,6,'show_admin_bar_front','true');
INSERT INTO `ogdch_usermeta` VALUES (119,6,'ogdch_capabilities','a:1:{s:15:\"content_manager\";b:1;}');
INSERT INTO `ogdch_usermeta` VALUES (120,6,'ogdch_user_level','0');
INSERT INTO `ogdch_usermeta` VALUES (121,6,'ckan-backend_organisation','swisstopo');
INSERT INTO `ogdch_usermeta` VALUES (122,6,'dismissed_wp_pointers','');
INSERT INTO `ogdch_usermeta` VALUES (123,6,'user_lang','0');
INSERT INTO `ogdch_usermeta` VALUES (124,6,'description_en','');
INSERT INTO `ogdch_usermeta` VALUES (125,6,'description_it','');
INSERT INTO `ogdch_usermeta` VALUES (126,6,'description_fr','');
INSERT INTO `ogdch_usermeta` VALUES (128,4,'pll_filter_content','en');
INSERT INTO `ogdch_usermeta` VALUES (129,5,'session_tokens','a:1:{s:64:\"d23c2e842128c81c94f9baa4b1e4756ad5a2946262864b1fe779b10ae9aa10ee\";a:4:{s:10:\"expiration\";i:1443201631;s:2:\"ip\";s:12:\"192.168.56.1\";s:2:\"ua\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36\";s:5:\"login\";i:1443028831;}}');
INSERT INTO `ogdch_usermeta` VALUES (131,1,'wpseo_dismissed_gsc_notice','1');
INSERT INTO `ogdch_usermeta` VALUES (133,5,'_yoast_wpseo_profile_updated','1447418306');
INSERT INTO `ogdch_usermeta` VALUES (237,1,'manageedit-nf_subcolumnshidden','a:2:{i:0;s:14:\"form_1_field_8\";i:1;s:14:\"form_1_field_3\";}');
INSERT INTO `ogdch_usermeta` VALUES (242,1,'session_tokens','a:3:{s:64:\"521c8ff6bd0e8ca788cbab87a754a9bdf99e5ae767a2fc4016a015a3e9b664a9\";a:4:{s:10:\"expiration\";i:1465996841;s:2:\"ip\";s:12:\"192.168.56.1\";s:2:\"ua\";s:76:\"Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:47.0) Gecko/20100101 Firefox/47.0\";s:5:\"login\";i:1465824041;}s:64:\"1fe19174fd7ce9963a000539f996ebb5f07d90c4611fee0cdf64e02af715bcc8\";a:4:{s:10:\"expiration\";i:1466087977;s:2:\"ip\";s:12:\"192.168.56.1\";s:2:\"ua\";s:76:\"Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:47.0) Gecko/20100101 Firefox/47.0\";s:5:\"login\";i:1465915177;}s:64:\"958653846ec0ec4e5243bb5193ed9d0ce8d59b5269c0da27343fd692c341eb5f\";a:4:{s:10:\"expiration\";i:1466150975;s:2:\"ip\";s:12:\"192.168.56.1\";s:2:\"ua\";s:76:\"Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:47.0) Gecko/20100101 Firefox/47.0\";s:5:\"login\";i:1465978175;}}');
/*!40000 ALTER TABLE `ogdch_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ogdch_users`
--

DROP TABLE IF EXISTS `ogdch_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ogdch_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogdch_users`
--

LOCK TABLES `ogdch_users` WRITE;
/*!40000 ALTER TABLE `ogdch_users` DISABLE KEYS */;
INSERT INTO `ogdch_users` VALUES (1,'liip','$P$BF6lW0I8vsXG25z1/F3y1gTkNvkfe71','liip','jazz@liip.ch','','2015-05-21 13:32:37','',0,'liip');
INSERT INTO `ogdch_users` VALUES (2,'alain','$P$BeplCsXxohgYGHfvitWSbaOo.o0mMJ0','alain','alain@dataown.er','','2015-08-25 13:50:21','',0,'Alain Data Owner');
INSERT INTO `ogdch_users` VALUES (3,'priska','$P$BUdW0xnDRa1ayH6/qXlFsFinisgaeC0','priska','priska@datenlieferant.in','','2015-08-25 13:50:55','',0,'Priska Datenlieferantin');
INSERT INTO `ogdch_users` VALUES (4,'simon','$P$BGwXQNQnCPIGRynfedzR3TNgcDDYop/','simon','simon@contentmanag.er','','2015-08-25 13:51:54','',0,'Simon Content Manager');
INSERT INTO `ogdch_users` VALUES (5,'pierre','$P$B22FA1NHm26kPKhqb4gD2Ktejq66LZ/','pierre','pierre@applicationmanag.er','','2015-09-14 11:34:28','',0,'Pierre Application Manager');
INSERT INTO `ogdch_users` VALUES (6,'laura','$P$BBSZ0RgCY3KghLfbn6.waoeCCBP5gy/','laura','laura@demouser.in','','2015-09-22 13:15:07','',0,'Laura Demo Userin');
/*!40000 ALTER TABLE `ogdch_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-15  9:00:31
