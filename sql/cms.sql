-- MySQL dump 10.14  Distrib 5.5.44-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: cms
-- ------------------------------------------------------
-- Server version	5.5.44-MariaDB

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogdch_comments`
--

LOCK TABLES `ogdch_comments` WRITE;
/*!40000 ALTER TABLE `ogdch_comments` DISABLE KEYS */;
INSERT INTO `ogdch_comments` VALUES (3,142,'liip','juerg.hunziker@liip.ch','','192.168.56.1','2015-06-03 13:02:29','2015-06-03 13:02:29','comment de',0,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36','',0,1);
INSERT INTO `ogdch_comments` VALUES (4,128,'liip','juerg.hunziker@liip.ch','','192.168.56.1','2015-06-03 13:13:25','2015-06-03 13:13:25','wfewefwf',0,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36','',0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogdch_nf_objectmeta`
--

LOCK TABLES `ogdch_nf_objectmeta` WRITE;
/*!40000 ALTER TABLE `ogdch_nf_objectmeta` DISABLE KEYS */;
INSERT INTO `ogdch_nf_objectmeta` VALUES (1,1,'date_updated','2015-10-23 06:47:15');
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
INSERT INTO `ogdch_nf_objectmeta` VALUES (24,2,'attach_csv','1');
INSERT INTO `ogdch_nf_objectmeta` VALUES (25,2,'from_name','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (26,2,'from_address','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (27,2,'reply_to','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (28,2,'to','field_2');
INSERT INTO `ogdch_nf_objectmeta` VALUES (29,2,'cc','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (30,2,'bcc','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (31,2,'email_subject','Thank you for contacting us!');
INSERT INTO `ogdch_nf_objectmeta` VALUES (32,2,'email_message','Thank you so much for contacting us. We will get back to you shortly.');
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
INSERT INTO `ogdch_nf_objectmeta` VALUES (62,4,'from_name','field_1');
INSERT INTO `ogdch_nf_objectmeta` VALUES (63,4,'from_address','field_2');
INSERT INTO `ogdch_nf_objectmeta` VALUES (64,4,'reply_to','field_2');
INSERT INTO `ogdch_nf_objectmeta` VALUES (65,4,'to','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (66,4,'cc','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (67,4,'bcc','');
INSERT INTO `ogdch_nf_objectmeta` VALUES (68,4,'email_subject','opendata.swiss Kontaktformular');
INSERT INTO `ogdch_nf_objectmeta` VALUES (69,4,'email_message','[ninja_forms_all_fields]');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogdch_nf_relationships`
--

LOCK TABLES `ogdch_nf_relationships` WRITE;
/*!40000 ALTER TABLE `ogdch_nf_relationships` DISABLE KEYS */;
INSERT INTO `ogdch_nf_relationships` VALUES (1,2,1,'notification','form');
INSERT INTO `ogdch_nf_relationships` VALUES (2,3,1,'notification','form');
INSERT INTO `ogdch_nf_relationships` VALUES (3,4,1,'notification','form');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogdch_ninja_forms_fields`
--

LOCK TABLES `ogdch_ninja_forms_fields` WRITE;
/*!40000 ALTER TABLE `ogdch_ninja_forms_fields` DISABLE KEYS */;
INSERT INTO `ogdch_ninja_forms_fields` VALUES (1,1,'_text',0,'a:36:{s:5:\"label\";s:4:\"Name\";s:9:\"label_pos\";s:5:\"above\";s:13:\"default_value\";s:0:\"\";s:4:\"mask\";s:0:\"\";s:10:\"datepicker\";s:1:\"0\";s:5:\"email\";s:1:\"0\";s:10:\"first_name\";s:0:\"\";s:9:\"last_name\";s:0:\"\";s:9:\"from_name\";s:1:\"0\";s:14:\"user_address_1\";s:0:\"\";s:14:\"user_address_2\";s:0:\"\";s:9:\"user_city\";s:0:\"\";s:8:\"user_zip\";s:0:\"\";s:10:\"user_phone\";s:0:\"\";s:10:\"user_email\";s:0:\"\";s:21:\"user_info_field_group\";s:0:\"\";s:3:\"req\";s:1:\"1\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:9:\"show_desc\";s:1:\"0\";s:8:\"desc_pos\";s:4:\"none\";s:9:\"desc_text\";s:0:\"\";s:17:\"calc_auto_include\";s:1:\"0\";s:11:\"placeholder\";s:0:\"\";s:13:\"disable_input\";s:1:\"0\";s:11:\"input_limit\";s:0:\"\";s:16:\"input_limit_type\";s:4:\"char\";s:15:\"input_limit_msg\";s:0:\"\";s:10:\"user_state\";s:1:\"0\";s:16:\"autocomplete_off\";s:1:\"0\";s:8:\"num_sort\";s:1:\"0\";s:18:\"default_value_type\";s:0:\"\";s:11:\"admin_label\";s:0:\"\";s:26:\"user_info_field_group_name\";s:0:\"\";s:28:\"user_info_field_group_custom\";s:0:\"\";}',0,0);
INSERT INTO `ogdch_ninja_forms_fields` VALUES (2,1,'_text',1,'a:38:{s:5:\"label\";s:5:\"Email\";s:9:\"label_pos\";s:5:\"above\";s:13:\"default_value\";s:0:\"\";s:4:\"mask\";s:0:\"\";s:10:\"datepicker\";s:1:\"0\";s:5:\"email\";s:1:\"1\";s:10:\"first_name\";s:1:\"0\";s:9:\"last_name\";s:1:\"0\";s:9:\"from_name\";s:1:\"0\";s:14:\"user_address_1\";s:1:\"0\";s:14:\"user_address_2\";s:1:\"0\";s:9:\"user_city\";s:1:\"0\";s:8:\"user_zip\";s:1:\"0\";s:10:\"user_phone\";s:1:\"0\";s:10:\"user_email\";s:1:\"1\";s:21:\"user_info_field_group\";s:1:\"1\";s:3:\"req\";s:1:\"1\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:17:\"calc_auto_include\";s:1:\"0\";s:11:\"calc_option\";s:1:\"0\";s:11:\"conditional\";s:0:\"\";s:26:\"user_info_field_group_name\";s:0:\"\";s:28:\"user_info_field_group_custom\";s:0:\"\";s:9:\"show_desc\";s:1:\"0\";s:8:\"desc_pos\";s:4:\"none\";s:9:\"desc_text\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:13:\"disable_input\";s:1:\"0\";s:11:\"input_limit\";s:0:\"\";s:16:\"input_limit_type\";s:4:\"char\";s:15:\"input_limit_msg\";s:0:\"\";s:10:\"user_state\";s:1:\"0\";s:16:\"autocomplete_off\";s:1:\"0\";s:8:\"num_sort\";s:1:\"0\";s:18:\"default_value_type\";s:0:\"\";s:11:\"admin_label\";s:0:\"\";}',0,14);
INSERT INTO `ogdch_ninja_forms_fields` VALUES (3,1,'_textarea',2,'a:19:{s:5:\"label\";s:7:\"Message\";s:9:\"label_pos\";s:5:\"above\";s:13:\"default_value\";s:0:\"\";s:12:\"textarea_rte\";s:1:\"0\";s:14:\"textarea_media\";s:1:\"0\";s:18:\"disable_rte_mobile\";s:1:\"0\";s:3:\"req\";s:1:\"1\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:9:\"show_desc\";s:1:\"0\";s:8:\"desc_pos\";s:4:\"none\";s:9:\"desc_text\";s:0:\"\";s:17:\"calc_auto_include\";s:1:\"0\";s:11:\"input_limit\";s:0:\"\";s:16:\"input_limit_type\";s:4:\"char\";s:15:\"input_limit_msg\";s:0:\"\";s:8:\"num_sort\";s:1:\"0\";s:11:\"admin_label\";s:0:\"\";}',0,0);
INSERT INTO `ogdch_ninja_forms_fields` VALUES (5,1,'_submit',3,'a:7:{s:5:\"label\";s:4:\"Send\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:9:\"show_desc\";s:1:\"0\";s:8:\"desc_pos\";s:4:\"none\";s:9:\"desc_text\";s:0:\"\";}',0,0);
/*!40000 ALTER TABLE `ogdch_ninja_forms_fields` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=795 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogdch_options`
--

LOCK TABLES `ogdch_options` WRITE;
/*!40000 ALTER TABLE `ogdch_options` DISABLE KEYS */;
INSERT INTO `ogdch_options` VALUES (1,'siteurl','http://ogdch.dev/cms','yes');
INSERT INTO `ogdch_options` VALUES (2,'home','http://ogdch.dev/cms','yes');
INSERT INTO `ogdch_options` VALUES (3,'blogname','opendata.swiss','yes');
INSERT INTO `ogdch_options` VALUES (4,'blogdescription','Open Government Data Switzerland','yes');
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
INSERT INTO `ogdch_options` VALUES (33,'active_plugins','a:13:{i:0;s:21:\"polylang/polylang.php\";i:1;s:31:\"query-monitor/query-monitor.php\";i:2;s:47:\"bootstrap-ninja-forms/bootstrap-ninja-forms.php\";i:3;s:13:\"cmb2/init.php\";i:4;s:19:\"members/members.php\";i:5;s:27:\"ninja-forms/ninja-forms.php\";i:6;s:17:\"polylang-slug.php\";i:7;s:47:\"regenerate-thumbnails/regenerate-thumbnails.php\";i:8;s:51:\"rewrite-rules-inspector/rewrite-rules-inspector.php\";i:9;s:24:\"wordpress-seo/wp-seo.php\";i:10;s:32:\"wp-app-showcase/app-showcase.php\";i:11;s:32:\"wp-ckan-backend/ckan-backend.php\";i:12;s:49:\"wp-custom-bulk-actions/wp-custom-bulk-actions.php\";}','yes');
INSERT INTO `ogdch_options` VALUES (34,'category_base','','yes');
INSERT INTO `ogdch_options` VALUES (35,'ping_sites','http://rpc.pingomatic.com/','yes');
INSERT INTO `ogdch_options` VALUES (36,'advanced_edit','0','yes');
INSERT INTO `ogdch_options` VALUES (37,'comment_max_links','2','yes');
INSERT INTO `ogdch_options` VALUES (38,'gmt_offset','','yes');
INSERT INTO `ogdch_options` VALUES (39,'default_email_category','15','yes');
INSERT INTO `ogdch_options` VALUES (40,'recently_edited','','no');
INSERT INTO `ogdch_options` VALUES (41,'template','wp-ogdch-theme','yes');
INSERT INTO `ogdch_options` VALUES (42,'stylesheet','wp-ogdch-theme','yes');
INSERT INTO `ogdch_options` VALUES (43,'comment_whitelist','','yes');
INSERT INTO `ogdch_options` VALUES (44,'blacklist_keys','','no');
INSERT INTO `ogdch_options` VALUES (45,'comment_registration','','yes');
INSERT INTO `ogdch_options` VALUES (46,'html_type','text/html','yes');
INSERT INTO `ogdch_options` VALUES (47,'use_trackback','0','yes');
INSERT INTO `ogdch_options` VALUES (48,'default_role','content_manager','yes');
INSERT INTO `ogdch_options` VALUES (49,'db_version','33056','yes');
INSERT INTO `ogdch_options` VALUES (50,'uploads_use_yearmonth_folders','1','yes');
INSERT INTO `ogdch_options` VALUES (51,'upload_path','','yes');
INSERT INTO `ogdch_options` VALUES (52,'blog_public','0','yes');
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
INSERT INTO `ogdch_options` VALUES (82,'uninstall_plugins','a:0:{}','no');
INSERT INTO `ogdch_options` VALUES (83,'timezone_string','Europe/Zurich','yes');
INSERT INTO `ogdch_options` VALUES (85,'page_on_front','0','yes');
INSERT INTO `ogdch_options` VALUES (86,'default_post_format','0','yes');
INSERT INTO `ogdch_options` VALUES (87,'link_manager_enabled','0','yes');
INSERT INTO `ogdch_options` VALUES (88,'initial_db_version','32453','yes');
INSERT INTO `ogdch_options` VALUES (89,'ogdch_user_roles','a:8:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:123:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:9:\"add_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:10:\"list_roles\";b:1;s:12:\"create_roles\";b:1;s:12:\"delete_roles\";b:1;s:10:\"edit_roles\";b:1;s:16:\"restrict_content\";b:1;s:13:\"edit_datasets\";b:1;s:20:\"edit_others_datasets\";b:1;s:16:\"publish_datasets\";b:1;s:21:\"read_private_datasets\";b:1;s:15:\"delete_datasets\";b:1;s:23:\"delete_private_datasets\";b:1;s:25:\"delete_published_datasets\";b:1;s:22:\"delete_others_datasets\";b:1;s:21:\"edit_private_datasets\";b:1;s:23:\"edit_published_datasets\";b:1;s:15:\"create_datasets\";b:1;s:16:\"disable_datasets\";b:1;s:11:\"edit_groups\";b:1;s:18:\"edit_others_groups\";b:1;s:14:\"publish_groups\";b:1;s:19:\"read_private_groups\";b:1;s:13:\"delete_groups\";b:1;s:21:\"delete_private_groups\";b:1;s:23:\"delete_published_groups\";b:1;s:20:\"delete_others_groups\";b:1;s:19:\"edit_private_groups\";b:1;s:21:\"edit_published_groups\";b:1;s:13:\"create_groups\";b:1;s:18:\"edit_organisations\";b:1;s:25:\"edit_others_organisations\";b:1;s:21:\"publish_organisations\";b:1;s:26:\"read_private_organisations\";b:1;s:20:\"delete_organisations\";b:1;s:28:\"delete_private_organisations\";b:1;s:30:\"delete_published_organisations\";b:1;s:27:\"delete_others_organisations\";b:1;s:26:\"edit_private_organisations\";b:1;s:28:\"edit_published_organisations\";b:1;s:20:\"create_organisations\";b:1;s:9:\"edit_apps\";b:1;s:16:\"edit_others_apps\";b:1;s:12:\"publish_apps\";b:1;s:17:\"read_private_apps\";b:1;s:11:\"delete_apps\";b:1;s:19:\"delete_private_apps\";b:1;s:21:\"delete_published_apps\";b:1;s:18:\"delete_others_apps\";b:1;s:17:\"edit_private_apps\";b:1;s:19:\"edit_published_apps\";b:1;s:11:\"create_apps\";b:1;s:22:\"edit_user_organisation\";b:1;s:18:\"manage_frequencies\";b:1;s:16:\"edit_frequencies\";b:1;s:18:\"delete_frequencies\";b:1;s:18:\"assign_frequencies\";b:1;s:15:\"wpseo_bulk_edit\";b:1;s:18:\"view_query_monitor\";b:1;s:11:\"manage_tags\";b:1;s:9:\"edit_tags\";b:1;s:11:\"delete_tags\";b:1;s:11:\"assign_tags\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:35:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:15:\"wpseo_bulk_edit\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:14:\"datenlieferant\";a:2:{s:4:\"name\";s:14:\"Datenlieferant\";s:12:\"capabilities\";a:13:{s:4:\"read\";b:1;s:12:\"upload_files\";b:1;s:15:\"create_datasets\";b:1;s:13:\"edit_datasets\";b:1;s:21:\"edit_private_datasets\";b:1;s:23:\"edit_published_datasets\";b:1;s:16:\"publish_datasets\";b:1;s:21:\"read_private_datasets\";b:1;s:11:\"manage_tags\";b:1;s:9:\"edit_tags\";b:1;s:11:\"delete_tags\";b:1;s:11:\"assign_tags\";b:1;s:10:\"edit_posts\";b:1;}}s:10:\"data_owner\";a:2:{s:4:\"name\";s:10:\"Data Owner\";s:12:\"capabilities\";a:23:{s:4:\"read\";b:1;s:12:\"upload_files\";b:1;s:15:\"create_datasets\";b:1;s:13:\"edit_datasets\";b:1;s:21:\"edit_private_datasets\";b:1;s:23:\"edit_published_datasets\";b:1;s:16:\"publish_datasets\";b:1;s:21:\"read_private_datasets\";b:1;s:18:\"edit_organisations\";b:1;s:26:\"edit_private_organisations\";b:1;s:28:\"edit_published_organisations\";b:1;s:26:\"read_private_organisations\";b:1;s:11:\"manage_tags\";b:1;s:9:\"edit_tags\";b:1;s:11:\"delete_tags\";b:1;s:11:\"assign_tags\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:10:\"list_users\";b:1;s:10:\"edit_users\";b:1;s:13:\"promote_users\";b:1;}}s:15:\"content_manager\";a:2:{s:4:\"name\";s:15:\"Content Manager\";s:12:\"capabilities\";a:28:{s:4:\"read\";b:1;s:12:\"upload_files\";b:1;s:18:\"edit_theme_options\";b:1;s:11:\"create_apps\";b:1;s:11:\"delete_apps\";b:1;s:18:\"delete_others_apps\";b:1;s:19:\"delete_private_apps\";b:1;s:21:\"delete_published_apps\";b:1;s:9:\"edit_apps\";b:1;s:16:\"edit_others_apps\";b:1;s:17:\"edit_private_apps\";b:1;s:19:\"edit_published_apps\";b:1;s:12:\"publish_apps\";b:1;s:17:\"read_private_apps\";b:1;s:19:\"delete_others_pages\";b:1;s:12:\"delete_pages\";b:1;s:20:\"delete_private_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:17:\"edit_others_pages\";b:1;s:10:\"edit_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:18:\"read_private_pages\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;}}}','yes');
INSERT INTO `ogdch_options` VALUES (90,'widget_search','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `ogdch_options` VALUES (91,'widget_recent-posts','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `ogdch_options` VALUES (92,'widget_recent-comments','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `ogdch_options` VALUES (93,'widget_archives','a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `ogdch_options` VALUES (94,'widget_meta','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `ogdch_options` VALUES (95,'sidebars_widgets','a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:18:\"orphaned_widgets_1\";a:1:{i:0;s:17:\"recent-comments-2\";}s:13:\"array_version\";i:3;}','yes');
INSERT INTO `ogdch_options` VALUES (97,'cron','a:7:{i:1446168757;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1446170952;a:1:{s:29:\"wp_session_garbage_collection\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1446191340;a:1:{s:20:\"wp_maybe_auto_update\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1446206926;a:1:{s:24:\"ninja_forms_daily_action\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1446208981;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1446212281;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}','yes');
INSERT INTO `ogdch_options` VALUES (134,'db_upgraded','','yes');
INSERT INTO `ogdch_options` VALUES (142,'recently_activated','a:0:{}','yes');
INSERT INTO `ogdch_options` VALUES (147,'members_db_version','2','yes');
INSERT INTO `ogdch_options` VALUES (148,'members_settings','a:8:{s:12:\"role_manager\";i:1;s:19:\"content_permissions\";i:0;s:25:\"content_permissions_error\";s:85:\"<p class=\"restricted\">Sorry, but you do not have permission to view this content.</p>\";s:17:\"login_form_widget\";i:0;s:12:\"users_widget\";i:0;s:12:\"private_blog\";i:0;s:12:\"private_feed\";i:0;s:18:\"private_feed_error\";s:80:\"<p class=\"restricted\">You must be logged into the site to view this content.</p>\";}','yes');
INSERT INTO `ogdch_options` VALUES (151,'polylang','a:14:{s:7:\"browser\";i:1;s:7:\"rewrite\";i:1;s:12:\"hide_default\";i:0;s:10:\"force_lang\";i:1;s:13:\"redirect_lang\";i:0;s:13:\"media_support\";i:0;s:4:\"sync\";a:11:{i:0;s:10:\"taxonomies\";i:1;s:9:\"post_meta\";i:2;s:14:\"comment_status\";i:3;s:11:\"ping_status\";i:4;s:12:\"sticky_posts\";i:5;s:9:\"post_date\";i:6;s:11:\"post_format\";i:7;s:11:\"post_parent\";i:8;s:17:\"_wp_page_template\";i:9;s:10:\"menu_order\";i:10;s:13:\"_thumbnail_id\";}s:10:\"post_types\";a:1:{i:0;s:3:\"app\";}s:10:\"taxonomies\";a:0:{}s:7:\"domains\";a:0:{}s:7:\"version\";s:6:\"1.7.11\";s:12:\"default_lang\";s:2:\"de\";s:9:\"nav_menus\";a:2:{s:5:\"ogdch\";a:1:{s:18:\"service_navigation\";a:0:{}}s:14:\"wp-ogdch-theme\";a:4:{s:15:\"main_navigation\";a:4:{s:2:\"de\";i:135;s:2:\"en\";i:136;s:2:\"it\";i:137;s:2:\"fr\";i:138;}s:16:\"about_navigation\";a:4:{s:2:\"de\";i:141;s:2:\"en\";i:143;s:2:\"it\";i:144;s:2:\"fr\";i:145;}s:15:\"data_navigation\";a:4:{s:2:\"de\";i:146;s:2:\"en\";i:147;s:2:\"it\";i:148;s:2:\"fr\";i:149;}s:20:\"developer_navigation\";a:4:{s:2:\"de\";i:150;s:2:\"en\";i:151;s:2:\"it\";i:152;s:2:\"fr\";i:153;}}}s:16:\"previous_version\";s:6:\"1.7.10\";}','yes');
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
INSERT INTO `ogdch_options` VALUES (186,'current_theme','OGD.CH','yes');
INSERT INTO `ogdch_options` VALUES (187,'theme_mods_ogdch','a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:18:\"service_navigation\";i:70;}s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1436165571;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:18:\"orphaned_widgets_1\";a:1:{i:0;s:17:\"recent-comments-2\";}}}}','yes');
INSERT INTO `ogdch_options` VALUES (188,'theme_switched','','yes');
INSERT INTO `ogdch_options` VALUES (331,'nav_menu_options','a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}','yes');
INSERT INTO `ogdch_options` VALUES (406,'ckan_groups_children','a:0:{}','yes');
INSERT INTO `ogdch_options` VALUES (440,'ckan_organisation_children','a:4:{i:103;a:1:{i:0;i:107;}i:105;a:1:{i:0;i:111;}i:111;a:2:{i:0;i:113;i:1;i:117;}i:113;a:1:{i:0;i:115;}}','yes');
INSERT INTO `ogdch_options` VALUES (474,'ckan_group_children','a:0:{}','yes');
INSERT INTO `ogdch_options` VALUES (476,'wpseo','a:20:{s:14:\"blocking_files\";a:0:{}s:26:\"ignore_blog_public_warning\";b:1;s:31:\"ignore_meta_description_warning\";b:1;s:20:\"ignore_page_comments\";b:0;s:16:\"ignore_permalink\";b:0;s:15:\"ms_defaults_set\";b:0;s:23:\"theme_description_found\";s:73:\"<meta name=\"description\" content=\"<?php bloginfo( \'description\' ); ?>\" />\";s:21:\"theme_has_description\";b:1;s:7:\"version\";s:5:\"2.3.5\";s:11:\"alexaverify\";s:0:\"\";s:12:\"company_logo\";s:0:\"\";s:12:\"company_name\";s:0:\"\";s:17:\"company_or_person\";s:0:\"\";s:20:\"disableadvanced_meta\";b:1;s:12:\"googleverify\";s:0:\"\";s:8:\"msverify\";s:0:\"\";s:11:\"person_name\";s:0:\"\";s:12:\"website_name\";s:0:\"\";s:22:\"alternate_website_name\";s:0:\"\";s:12:\"yandexverify\";s:0:\"\";}','yes');
INSERT INTO `ogdch_options` VALUES (477,'wpseo_permalinks','a:13:{s:15:\"cleanpermalinks\";b:0;s:24:\"cleanpermalink-extravars\";s:0:\"\";s:29:\"cleanpermalink-googlecampaign\";b:0;s:31:\"cleanpermalink-googlesitesearch\";b:0;s:15:\"cleanreplytocom\";b:0;s:10:\"cleanslugs\";b:1;s:14:\"hide-feedlinks\";b:0;s:12:\"hide-rsdlink\";b:0;s:14:\"hide-shortlink\";b:0;s:16:\"hide-wlwmanifest\";b:0;s:18:\"redirectattachment\";b:0;s:17:\"stripcategorybase\";b:0;s:13:\"trailingslash\";b:0;}','yes');
INSERT INTO `ogdch_options` VALUES (478,'wpseo_titles','a:86:{s:10:\"title_test\";i:0;s:17:\"forcerewritetitle\";b:1;s:9:\"separator\";s:8:\"sc-mdash\";s:5:\"noodp\";b:0;s:6:\"noydir\";b:0;s:15:\"usemetakeywords\";b:1;s:16:\"title-home-wpseo\";s:42:\"%%sitename%% %%page%% %%sep%% %%sitedesc%%\";s:18:\"title-author-wpseo\";s:41:\"%%name%%, Autor auf %%sitename%% %%page%%\";s:19:\"title-archive-wpseo\";s:38:\"%%date%% %%page%% %%sep%% %%sitename%%\";s:18:\"title-search-wpseo\";s:67:\"Du hast nach %%searchphrase%% gesucht %%page%% %%sep%% %%sitename%%\";s:15:\"title-404-wpseo\";s:41:\"Seite nicht gefunden %%sep%% %%sitename%%\";s:19:\"metadesc-home-wpseo\";s:0:\"\";s:21:\"metadesc-author-wpseo\";s:0:\"\";s:22:\"metadesc-archive-wpseo\";s:0:\"\";s:18:\"metakey-home-wpseo\";s:0:\"\";s:20:\"metakey-author-wpseo\";s:0:\"\";s:22:\"noindex-subpages-wpseo\";b:0;s:20:\"noindex-author-wpseo\";b:1;s:21:\"noindex-archive-wpseo\";b:1;s:14:\"disable-author\";b:1;s:12:\"disable-date\";b:0;s:10:\"title-post\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:13:\"metadesc-post\";s:0:\"\";s:12:\"metakey-post\";s:0:\"\";s:12:\"noindex-post\";b:0;s:13:\"showdate-post\";b:0;s:16:\"hideeditbox-post\";b:0;s:10:\"title-page\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:13:\"metadesc-page\";s:0:\"\";s:12:\"metakey-page\";s:0:\"\";s:12:\"noindex-page\";b:0;s:13:\"showdate-page\";b:0;s:16:\"hideeditbox-page\";b:0;s:16:\"title-attachment\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:19:\"metadesc-attachment\";s:0:\"\";s:18:\"metakey-attachment\";s:0:\"\";s:18:\"noindex-attachment\";b:0;s:19:\"showdate-attachment\";b:0;s:22:\"hideeditbox-attachment\";b:1;s:18:\"title-tax-category\";s:52:\"%%term_title%% Archive %%page%% %%sep%% %%sitename%%\";s:21:\"metadesc-tax-category\";s:0:\"\";s:20:\"metakey-tax-category\";s:0:\"\";s:24:\"hideeditbox-tax-category\";b:1;s:20:\"noindex-tax-category\";b:1;s:18:\"title-tax-post_tag\";s:52:\"%%term_title%% Archive %%page%% %%sep%% %%sitename%%\";s:21:\"metadesc-tax-post_tag\";s:0:\"\";s:20:\"metakey-tax-post_tag\";s:0:\"\";s:24:\"hideeditbox-tax-post_tag\";b:1;s:20:\"noindex-tax-post_tag\";b:1;s:21:\"title-tax-post_format\";s:52:\"%%term_title%% Archive %%page%% %%sep%% %%sitename%%\";s:24:\"metadesc-tax-post_format\";s:0:\"\";s:23:\"metakey-tax-post_format\";s:0:\"\";s:27:\"hideeditbox-tax-post_format\";b:1;s:23:\"noindex-tax-post_format\";b:1;s:9:\"title-app\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:12:\"metadesc-app\";s:0:\"\";s:11:\"metakey-app\";s:0:\"\";s:11:\"noindex-app\";b:0;s:12:\"showdate-app\";b:0;s:15:\"hideeditbox-app\";b:0;s:18:\"title-ckan-dataset\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:21:\"metadesc-ckan-dataset\";s:0:\"\";s:20:\"metakey-ckan-dataset\";s:0:\"\";s:20:\"noindex-ckan-dataset\";b:0;s:21:\"showdate-ckan-dataset\";b:0;s:24:\"hideeditbox-ckan-dataset\";b:0;s:19:\"title-ptarchive-app\";s:50:\"%%pt_plural%% Archiv %%page%% %%sep%% %%sitename%%\";s:22:\"metadesc-ptarchive-app\";s:0:\"\";s:21:\"metakey-ptarchive-app\";s:0:\"\";s:21:\"bctitle-ptarchive-app\";s:0:\"\";s:21:\"noindex-ptarchive-app\";b:0;s:28:\"title-ptarchive-ckan-dataset\";s:50:\"%%pt_plural%% Archiv %%page%% %%sep%% %%sitename%%\";s:31:\"metadesc-ptarchive-ckan-dataset\";s:0:\"\";s:30:\"metakey-ptarchive-ckan-dataset\";s:0:\"\";s:30:\"bctitle-ptarchive-ckan-dataset\";s:0:\"\";s:30:\"noindex-ptarchive-ckan-dataset\";b:0;s:27:\"title-tax-ckan_organisation\";s:52:\"%%term_title%% Archive %%page%% %%sep%% %%sitename%%\";s:30:\"metadesc-tax-ckan_organisation\";s:0:\"\";s:29:\"metakey-tax-ckan_organisation\";s:0:\"\";s:33:\"hideeditbox-tax-ckan_organisation\";b:1;s:29:\"noindex-tax-ckan_organisation\";b:1;s:20:\"title-tax-ckan_group\";s:52:\"%%term_title%% Archive %%page%% %%sep%% %%sitename%%\";s:23:\"metadesc-tax-ckan_group\";s:0:\"\";s:22:\"metakey-tax-ckan_group\";s:0:\"\";s:26:\"hideeditbox-tax-ckan_group\";b:1;s:22:\"noindex-tax-ckan_group\";b:1;}','yes');
INSERT INTO `ogdch_options` VALUES (479,'wpseo_social','a:21:{s:9:\"fb_admins\";a:0:{}s:12:\"fbconnectkey\";s:32:\"def8ea9dabc6d01b1b1da6aa2672f652\";s:13:\"facebook_site\";s:0:\"\";s:13:\"instagram_url\";s:0:\"\";s:12:\"linkedin_url\";s:0:\"\";s:11:\"myspace_url\";s:0:\"\";s:16:\"og_default_image\";s:0:\"\";s:18:\"og_frontpage_title\";s:0:\"\";s:17:\"og_frontpage_desc\";s:0:\"\";s:18:\"og_frontpage_image\";s:0:\"\";s:9:\"opengraph\";b:1;s:10:\"googleplus\";b:0;s:13:\"pinterest_url\";s:0:\"\";s:15:\"pinterestverify\";s:0:\"\";s:14:\"plus-publisher\";s:0:\"\";s:7:\"twitter\";b:1;s:12:\"twitter_site\";s:0:\"\";s:17:\"twitter_card_type\";s:7:\"summary\";s:11:\"youtube_url\";s:0:\"\";s:15:\"google_plus_url\";s:0:\"\";s:10:\"fbadminapp\";s:0:\"\";}','yes');
INSERT INTO `ogdch_options` VALUES (480,'wpseo_rss','a:2:{s:9:\"rssbefore\";s:0:\"\";s:8:\"rssafter\";s:58:\"Der Beitrag %%POSTLINK%% erschien zuerst auf %%BLOGLINK%%.\";}','yes');
INSERT INTO `ogdch_options` VALUES (481,'wpseo_internallinks','a:16:{s:20:\"breadcrumbs-404crumb\";s:32:\"Fehler 404: Seite nicht gefunden\";s:23:\"breadcrumbs-blog-remove\";b:0;s:20:\"breadcrumbs-boldlast\";b:0;s:25:\"breadcrumbs-archiveprefix\";s:11:\"Archiv für\";s:18:\"breadcrumbs-enable\";b:0;s:16:\"breadcrumbs-home\";s:4:\"Home\";s:18:\"breadcrumbs-prefix\";s:0:\"\";s:24:\"breadcrumbs-searchprefix\";s:22:\"Sie haben gesucht nach\";s:15:\"breadcrumbs-sep\";s:7:\"&raquo;\";s:23:\"post_types-post-maintax\";i:0;s:23:\"post_types-page-maintax\";i:0;s:29:\"post_types-attachment-maintax\";i:0;s:22:\"post_types-app-maintax\";i:0;s:31:\"post_types-ckan-dataset-maintax\";i:0;s:35:\"taxonomy-ckan_organisation-ptparent\";i:0;s:28:\"taxonomy-ckan_group-ptparent\";i:0;}','yes');
INSERT INTO `ogdch_options` VALUES (482,'wpseo_xml','a:19:{s:22:\"disable_author_sitemap\";b:0;s:22:\"disable_author_noposts\";b:0;s:16:\"enablexmlsitemap\";b:1;s:16:\"entries-per-page\";i:1000;s:38:\"user_role-administrator-not_in_sitemap\";b:0;s:31:\"user_role-editor-not_in_sitemap\";b:0;s:31:\"user_role-author-not_in_sitemap\";b:0;s:36:\"user_role-contributor-not_in_sitemap\";b:0;s:35:\"user_role-subscriber-not_in_sitemap\";b:0;s:30:\"post_types-post-not_in_sitemap\";b:0;s:30:\"post_types-page-not_in_sitemap\";b:0;s:36:\"post_types-attachment-not_in_sitemap\";b:1;s:34:\"taxonomies-category-not_in_sitemap\";b:0;s:34:\"taxonomies-post_tag-not_in_sitemap\";b:1;s:37:\"taxonomies-post_format-not_in_sitemap\";b:0;s:29:\"post_types-app-not_in_sitemap\";b:0;s:38:\"post_types-ckan-dataset-not_in_sitemap\";b:0;s:43:\"taxonomies-ckan_organisation-not_in_sitemap\";b:1;s:36:\"taxonomies-ckan_group-not_in_sitemap\";b:1;}','yes');
INSERT INTO `ogdch_options` VALUES (488,'theme_mods_wp-ogdch-theme','a:2:{i:0;b:0;s:18:\"nav_menu_locations\";a:4:{s:15:\"main_navigation\";i:135;s:16:\"about_navigation\";i:141;s:15:\"data_navigation\";i:146;s:20:\"developer_navigation\";i:150;}}','yes');
INSERT INTO `ogdch_options` VALUES (490,'auto_core_update_notified','a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:22:\"juerg.hunziker@liip.ch\";s:7:\"version\";s:5:\"4.2.3\";s:9:\"timestamp\";i:1438073767;}','yes');
INSERT INTO `ogdch_options` VALUES (519,'page_for_posts','0','yes');
INSERT INTO `ogdch_options` VALUES (520,'finished_splitting_shared_terms','1','yes');
INSERT INTO `ogdch_options` VALUES (544,'can_compress_scripts','1','yes');
INSERT INTO `ogdch_options` VALUES (760,'WPLANG','de_CH','yes');
INSERT INTO `ogdch_options` VALUES (782,'rewrite_rules','a:185:{s:20:\"(de|en|it|fr)/app/?$\";s:40:\"index.php?lang=$matches[1]&post_type=app\";s:50:\"(de|en|it|fr)/app/feed/(feed|rdf|rss|rss2|atom)/?$\";s:57:\"index.php?lang=$matches[1]&post_type=app&feed=$matches[2]\";s:45:\"(de|en|it|fr)/app/(feed|rdf|rss|rss2|atom)/?$\";s:57:\"index.php?lang=$matches[1]&post_type=app&feed=$matches[2]\";s:37:\"(de|en|it|fr)/app/page/([0-9]{1,})/?$\";s:58:\"index.php?lang=$matches[1]&post_type=app&paged=$matches[2]\";s:19:\"sitemap_index\\.xml$\";s:19:\"index.php?sitemap=1\";s:31:\"([^/]+?)-sitemap([0-9]+)?\\.xml$\";s:51:\"index.php?sitemap=$matches[1]&sitemap_n=$matches[2]\";s:24:\"([a-z]+)?-?sitemap\\.xsl$\";s:25:\"index.php?xsl=$matches[1]\";s:61:\"(de|en|it|fr)/category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[2]&feed=$matches[3]\";s:56:\"(de|en|it|fr)/category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[2]&feed=$matches[3]\";s:49:\"(de|en|it|fr)/category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[2]&paged=$matches[3]\";s:31:\"(de|en|it|fr)/category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[2]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:58:\"(de|en|it|fr)/tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[2]&feed=$matches[3]\";s:53:\"(de|en|it|fr)/tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[2]&feed=$matches[3]\";s:46:\"(de|en|it|fr)/tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[2]&paged=$matches[3]\";s:28:\"(de|en|it|fr)/tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[2]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:59:\"(de|en|it|fr)/type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:67:\"index.php?lang=$matches[1]&post_format=$matches[2]&feed=$matches[3]\";s:54:\"(de|en|it|fr)/type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:67:\"index.php?lang=$matches[1]&post_format=$matches[2]&feed=$matches[3]\";s:47:\"(de|en|it|fr)/type/([^/]+)/page/?([0-9]{1,})/?$\";s:68:\"index.php?lang=$matches[1]&post_format=$matches[2]&paged=$matches[3]\";s:29:\"(de|en|it|fr)/type/([^/]+)/?$\";s:50:\"index.php?lang=$matches[1]&post_format=$matches[2]\";s:45:\"(de|en|it|fr)/app/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[2]\";s:55:\"(de|en|it|fr)/app/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[2]&tb=1\";s:75:\"(de|en|it|fr)/app/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:70:\"(de|en|it|fr)/app/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:70:\"(de|en|it|fr)/app/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[2]&cpage=$matches[3]\";s:38:\"(de|en|it|fr)/app/([^/]+)/trackback/?$\";s:30:\"index.php?app=$matches[2]&tb=1\";s:58:\"(de|en|it|fr)/app/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?app=$matches[2]&feed=$matches[3]\";s:53:\"(de|en|it|fr)/app/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?app=$matches[2]&feed=$matches[3]\";s:46:\"(de|en|it|fr)/app/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?app=$matches[2]&paged=$matches[3]\";s:53:\"(de|en|it|fr)/app/([^/]+)/comment-page-([0-9]{1,})/?$\";s:43:\"index.php?app=$matches[2]&cpage=$matches[3]\";s:38:\"(de|en|it|fr)/app/([^/]+)(/[0-9]+)?/?$\";s:42:\"index.php?app=$matches[2]&page=$matches[3]\";s:34:\"(de|en|it|fr)/app/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[2]\";s:44:\"(de|en|it|fr)/app/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[2]&tb=1\";s:64:\"(de|en|it|fr)/app/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:59:\"(de|en|it|fr)/app/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:59:\"(de|en|it|fr)/app/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[2]&cpage=$matches[3]\";s:31:\"app/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:41:\"app/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:61:\"app/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:56:\"app/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:56:\"app/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:24:\"app/([^/]+)/trackback/?$\";s:30:\"index.php?app=$matches[1]&tb=1\";s:44:\"app/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?app=$matches[1]&feed=$matches[2]\";s:39:\"app/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?app=$matches[1]&feed=$matches[2]\";s:32:\"app/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?app=$matches[1]&paged=$matches[2]\";s:39:\"app/([^/]+)/comment-page-([0-9]{1,})/?$\";s:43:\"index.php?app=$matches[1]&cpage=$matches[2]\";s:24:\"app/([^/]+)(/[0-9]+)?/?$\";s:42:\"index.php?app=$matches[1]&page=$matches[2]\";s:20:\"app/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:30:\"app/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:50:\"app/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:45:\"app/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:45:\"app/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:35:\"dataset/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:45:\"dataset/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:65:\"dataset/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"dataset/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"dataset/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:28:\"dataset/([^/]+)/trackback/?$\";s:45:\"index.php?ckan-local-dataset=$matches[1]&tb=1\";s:36:\"dataset/([^/]+)/page/?([0-9]{1,})/?$\";s:58:\"index.php?ckan-local-dataset=$matches[1]&paged=$matches[2]\";s:43:\"dataset/([^/]+)/comment-page-([0-9]{1,})/?$\";s:58:\"index.php?ckan-local-dataset=$matches[1]&cpage=$matches[2]\";s:28:\"dataset/([^/]+)(/[0-9]+)?/?$\";s:57:\"index.php?ckan-local-dataset=$matches[1]&page=$matches[2]\";s:24:\"dataset/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:34:\"dataset/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:54:\"dataset/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"dataset/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"dataset/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"group/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:43:\"group/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:63:\"group/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:58:\"group/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:58:\"group/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:26:\"group/([^/]+)/trackback/?$\";s:43:\"index.php?ckan-local-group=$matches[1]&tb=1\";s:34:\"group/([^/]+)/page/?([0-9]{1,})/?$\";s:56:\"index.php?ckan-local-group=$matches[1]&paged=$matches[2]\";s:41:\"group/([^/]+)/comment-page-([0-9]{1,})/?$\";s:56:\"index.php?ckan-local-group=$matches[1]&cpage=$matches[2]\";s:26:\"group/([^/]+)(/[0-9]+)?/?$\";s:55:\"index.php?ckan-local-group=$matches[1]&page=$matches[2]\";s:22:\"group/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:32:\"group/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:52:\"group/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:47:\"group/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:47:\"group/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:40:\"organization/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:50:\"organization/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:70:\"organization/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:65:\"organization/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:65:\"organization/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"organization/([^/]+)/trackback/?$\";s:41:\"index.php?ckan-local-org=$matches[1]&tb=1\";s:41:\"organization/([^/]+)/page/?([0-9]{1,})/?$\";s:54:\"index.php?ckan-local-org=$matches[1]&paged=$matches[2]\";s:48:\"organization/([^/]+)/comment-page-([0-9]{1,})/?$\";s:54:\"index.php?ckan-local-org=$matches[1]&cpage=$matches[2]\";s:33:\"organization/([^/]+)(/[0-9]+)?/?$\";s:53:\"index.php?ckan-local-org=$matches[1]&page=$matches[2]\";s:29:\"organization/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:39:\"organization/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:59:\"organization/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:54:\"organization/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:54:\"organization/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:46:\"(de|en|it|fr)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?lang=$matches[1]&&feed=$matches[2]\";s:41:\"(de|en|it|fr)/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?lang=$matches[1]&&feed=$matches[2]\";s:34:\"(de|en|it|fr)/page/?([0-9]{1,})/?$\";s:45:\"index.php?lang=$matches[1]&&paged=$matches[2]\";s:16:\"(de|en|it|fr)/?$\";s:26:\"index.php?lang=$matches[1]\";s:55:\"(de|en|it|fr)/comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:59:\"index.php?lang=$matches[1]&&feed=$matches[2]&withcomments=1\";s:50:\"(de|en|it|fr)/comments/(feed|rdf|rss|rss2|atom)/?$\";s:59:\"index.php?lang=$matches[1]&&feed=$matches[2]&withcomments=1\";s:58:\"(de|en|it|fr)/search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:57:\"index.php?lang=$matches[1]&s=$matches[2]&feed=$matches[3]\";s:53:\"(de|en|it|fr)/search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:57:\"index.php?lang=$matches[1]&s=$matches[2]&feed=$matches[3]\";s:46:\"(de|en|it|fr)/search/(.+)/page/?([0-9]{1,})/?$\";s:58:\"index.php?lang=$matches[1]&s=$matches[2]&paged=$matches[3]\";s:28:\"(de|en|it|fr)/search/(.+)/?$\";s:40:\"index.php?lang=$matches[1]&s=$matches[2]\";s:61:\"(de|en|it|fr)/author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:67:\"index.php?lang=$matches[1]&author_name=$matches[2]&feed=$matches[3]\";s:56:\"(de|en|it|fr)/author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:67:\"index.php?lang=$matches[1]&author_name=$matches[2]&feed=$matches[3]\";s:49:\"(de|en|it|fr)/author/([^/]+)/page/?([0-9]{1,})/?$\";s:68:\"index.php?lang=$matches[1]&author_name=$matches[2]&paged=$matches[3]\";s:31:\"(de|en|it|fr)/author/([^/]+)/?$\";s:50:\"index.php?lang=$matches[1]&author_name=$matches[2]\";s:83:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&feed=$matches[5]\";s:78:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&feed=$matches[5]\";s:71:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:98:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&paged=$matches[5]\";s:53:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:80:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]\";s:70:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:81:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&feed=$matches[4]\";s:65:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:81:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&feed=$matches[4]\";s:58:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:82:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&paged=$matches[4]\";s:40:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/?$\";s:64:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]\";s:57:\"(de|en|it|fr)/([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:60:\"index.php?lang=$matches[1]&year=$matches[2]&feed=$matches[3]\";s:52:\"(de|en|it|fr)/([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:60:\"index.php?lang=$matches[1]&year=$matches[2]&feed=$matches[3]\";s:45:\"(de|en|it|fr)/([0-9]{4})/page/?([0-9]{1,})/?$\";s:61:\"index.php?lang=$matches[1]&year=$matches[2]&paged=$matches[3]\";s:27:\"(de|en|it|fr)/([0-9]{4})/?$\";s:43:\"index.php?lang=$matches[1]&year=$matches[2]\";s:41:\"(de|en|it|fr)/.?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[2]\";s:51:\"(de|en|it|fr)/.?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[2]&tb=1\";s:71:\"(de|en|it|fr)/.?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:66:\"(de|en|it|fr)/.?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:66:\"(de|en|it|fr)/.?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[2]&cpage=$matches[3]\";s:34:\"(de|en|it|fr)/(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[2]&tb=1\";s:54:\"(de|en|it|fr)/(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[2]&feed=$matches[3]\";s:49:\"(de|en|it|fr)/(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[2]&feed=$matches[3]\";s:42:\"(de|en|it|fr)/(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[2]&paged=$matches[3]\";s:49:\"(de|en|it|fr)/(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[2]&cpage=$matches[3]\";s:34:\"(de|en|it|fr)/(.?.+?)(/[0-9]+)?/?$\";s:47:\"index.php?pagename=$matches[2]&page=$matches[3]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:20:\"(.?.+?)(/[0-9]+)?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:41:\"(de|en|it|fr)/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[2]\";s:51:\"(de|en|it|fr)/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[2]&tb=1\";s:71:\"(de|en|it|fr)/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:66:\"(de|en|it|fr)/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:66:\"(de|en|it|fr)/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[2]&cpage=$matches[3]\";s:34:\"(de|en|it|fr)/([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[2]&tb=1\";s:54:\"(de|en|it|fr)/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[2]&feed=$matches[3]\";s:49:\"(de|en|it|fr)/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[2]&feed=$matches[3]\";s:42:\"(de|en|it|fr)/([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[2]&paged=$matches[3]\";s:49:\"(de|en|it|fr)/([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[2]&cpage=$matches[3]\";s:34:\"(de|en|it|fr)/([^/]+)(/[0-9]+)?/?$\";s:43:\"index.php?name=$matches[2]&page=$matches[3]\";s:30:\"(de|en|it|fr)/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[2]\";s:40:\"(de|en|it|fr)/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[2]&tb=1\";s:60:\"(de|en|it|fr)/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:55:\"(de|en|it|fr)/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:55:\"(de|en|it|fr)/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[2]&cpage=$matches[3]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:20:\"([^/]+)(/[0-9]+)?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";}','yes');
INSERT INTO `ogdch_options` VALUES (783,'nf_convert_notifications_complete','1','yes');
INSERT INTO `ogdch_options` VALUES (784,'nf_convert_subs_step','complete','yes');
INSERT INTO `ogdch_options` VALUES (785,'nf_upgrade_notice','closed','yes');
INSERT INTO `ogdch_options` VALUES (786,'nf_update_email_settings_complete','1','yes');
INSERT INTO `ogdch_options` VALUES (787,'nf_email_fav_updated','1','yes');
INSERT INTO `ogdch_options` VALUES (788,'nf_convert_forms_complete','1','yes');
INSERT INTO `ogdch_options` VALUES (789,'nf_database_migrations','1','yes');
INSERT INTO `ogdch_options` VALUES (790,'ninja_forms_settings','a:23:{s:11:\"date_format\";s:5:\"d.m.Y\";s:15:\"currency_symbol\";s:3:\"CHF\";s:14:\"recaptcha_lang\";s:2:\"en\";s:13:\"req_div_label\";s:0:\"\";s:16:\"req_field_symbol\";s:18:\"<strong>*</strong>\";s:15:\"req_error_label\";s:48:\"Please ensure all required fields are completed.\";s:15:\"req_field_error\";s:24:\"This is a required field\";s:10:\"spam_error\";s:47:\"Please answer the anti-spam question correctly.\";s:14:\"honeypot_error\";s:34:\"Please leave the spam field blank.\";s:18:\"timed_submit_error\";s:31:\"Please wait to submit the form.\";s:16:\"javascript_error\";s:54:\"You cannot submit the form without Javascript enabled.\";s:13:\"invalid_email\";s:35:\"Please enter a valid email address.\";s:13:\"process_label\";s:10:\"Processing\";s:17:\"password_mismatch\";s:36:\"The passwords provided do not match.\";s:10:\"preview_id\";i:292;s:7:\"version\";s:6:\"2.9.28\";s:19:\"fix_form_email_from\";i:1;s:18:\"fix_field_reply_to\";i:1;s:18:\"recaptcha_site_key\";s:0:\"\";s:20:\"recaptcha_secret_key\";s:0:\"\";s:19:\"delete_on_uninstall\";s:1:\"0\";s:21:\"disable_admin_notices\";s:1:\"0\";s:22:\"version_2_2_25_rte_fix\";i:1;}','yes');
INSERT INTO `ogdch_options` VALUES (791,'nf_admin_notice','a:2:{s:16:\"one_week_support\";a:3:{s:5:\"start\";s:10:\"10/29/2015\";s:3:\"int\";i:7;s:9:\"dismissed\";i:1;}s:15:\"two_week_review\";a:2:{s:5:\"start\";s:9:\"11/5/2015\";s:3:\"int\";i:14;}}','yes');
INSERT INTO `ogdch_options` VALUES (793,'theme_mods_twentyfifteen','a:1:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1446149907;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}}','yes');
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
) ENGINE=InnoDB AUTO_INCREMENT=2045 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogdch_postmeta`
--

LOCK TABLES `ogdch_postmeta` WRITE;
/*!40000 ALTER TABLE `ogdch_postmeta` DISABLE KEYS */;
INSERT INTO `ogdch_postmeta` VALUES (431,2,'_edit_lock','1444982213:1');
INSERT INTO `ogdch_postmeta` VALUES (433,97,'_edit_last','4');
INSERT INTO `ogdch_postmeta` VALUES (435,97,'_edit_lock','1443596972:1');
INSERT INTO `ogdch_postmeta` VALUES (464,2,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (533,118,'_edit_last','4');
INSERT INTO `ogdch_postmeta` VALUES (536,118,'_edit_lock','1443028110:4');
INSERT INTO `ogdch_postmeta` VALUES (537,119,'_edit_last','4');
INSERT INTO `ogdch_postmeta` VALUES (540,119,'_edit_lock','1443028311:4');
INSERT INTO `ogdch_postmeta` VALUES (577,126,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (578,126,'_edit_lock','1433314247:1');
INSERT INTO `ogdch_postmeta` VALUES (580,128,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (582,128,'_edit_lock','1433409244:1');
INSERT INTO `ogdch_postmeta` VALUES (583,130,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (584,130,'_edit_lock','1433314272:1');
INSERT INTO `ogdch_postmeta` VALUES (586,132,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (587,132,'_edit_lock','1433314283:1');
INSERT INTO `ogdch_postmeta` VALUES (611,142,'_ckandataset_reference','caa92e13-a975-4644-9e85-c3c752b46297');
INSERT INTO `ogdch_postmeta` VALUES (612,142,'_ckandataset_last_request','Wed, 03 Jun 2015 12:51:07 GMT');
INSERT INTO `ogdch_postmeta` VALUES (613,142,'_ckandataset_response','{\"help\": \"http://ckan.ogdch.dev/api/3/action/help_show?name=package_show\", \"success\": true, \"result\": {\"license_title\": \"Andere (Namensnennung)\", \"maintainer\": \"Bart\", \"relationships_as_object\": [], \"private\": false, \"maintainer_email\": \"\", \"num_tags\": 2, \"id\": \"caa92e13-a975-4644-9e85-c3c752b46297\", \"metadata_created\": \"2015-05-29T08:28:09.353559\", \"metadata_modified\": \"2015-06-01T07:02:16.173898\", \"author\": \"Odi\", \"author_email\": \"\", \"state\": \"active\", \"version\": \"\", \"creator_user_id\": \"5e19d724-c5e4-45eb-80ed-f2c88bac251a\", \"type\": \"dataset\", \"resources\": [{\"cache_last_updated\": null, \"package_id\": \"caa92e13-a975-4644-9e85-c3c752b46297\", \"webstore_last_updated\": null, \"id\": \"a55dc132-87d2-44c1-8697-82beb6b659f3\", \"size\": null, \"state\": \"active\", \"hash\": \"\", \"description\": \"\", \"format\": \"application/x-sql\", \"tracking_summary\": {\"total\": 0, \"recent\": 0}, \"last_modified\": null, \"url_type\": \"upload\", \"mimetype\": null, \"cache_url\": null, \"name\": \"\", \"created\": \"2015-05-29T08:28:27.321641\", \"url\": \"http://ckan.ogdch.dev/dataset/caa92e13-a975-4644-9e85-c3c752b46297/resource/a55dc132-87d2-44c1-8697-82beb6b659f3/download/cms.sql\", \"webstore_url\": null, \"mimetype_inner\": null, \"position\": 0, \"revision_id\": \"4232699e-e86a-4dd1-8631-df8137c7afc2\", \"resource_type\": null}], \"num_resources\": 1, \"tags\": [{\"vocabulary_id\": null, \"state\": \"active\", \"display_name\": \"hallo\", \"id\": \"f669d671-2b07-4501-ac04-bd152a8ddd7e\", \"name\": \"hallo\"}, {\"vocabulary_id\": null, \"state\": \"active\", \"display_name\": \"velo\", \"id\": \"d929d0c2-90ed-4ee9-84b7-d3f50594abc9\", \"name\": \"velo\"}], \"tracking_summary\": {\"total\": 0, \"recent\": 0}, \"groups\": [{\"display_name\": \"Super-Kategorie\", \"description\": \"\", \"image_display_url\": \"\", \"title\": \"Super-Kategorie\", \"id\": \"21794856-051d-4169-85d0-1566156b17b7\", \"name\": \"super-kategorie\"}], \"license_id\": \"other-at\", \"relationships_as_subject\": [], \"organization\": {\"description\": \"\", \"created\": \"2015-06-01T07:00:57.392442\", \"title\": \"Liip AG\", \"name\": \"liip-ag\", \"is_organization\": true, \"state\": \"active\", \"image_url\": \"\", \"revision_id\": \"ed653b80-563c-4460-825d-ed121f893d5d\", \"type\": \"organization\", \"id\": \"562584e5-b61d-41ec-9ac4-95444bbc7295\", \"approval_status\": \"approved\"}, \"name\": \"ich-bin-ein-datensatz\", \"isopen\": true, \"url\": \"\", \"notes\": \"\", \"owner_org\": \"562584e5-b61d-41ec-9ac4-95444bbc7295\", \"extras\": [{\"key\": \"Coolnessfaktor\", \"value\": \"12\"}], \"title\": \"Ich bin ein Datensatz\", \"revision_id\": \"84c32792-4722-406a-923c-08d248ee601b\"}}');
INSERT INTO `ogdch_postmeta` VALUES (617,142,'_edit_lock','1433340196:1');
INSERT INTO `ogdch_postmeta` VALUES (619,144,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (620,144,'_edit_lock','1433409602:1');
INSERT INTO `ogdch_postmeta` VALUES (627,146,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (628,146,'_edit_lock','1433341321:1');
INSERT INTO `ogdch_postmeta` VALUES (644,128,'_wp_old_slug','block-ch');
INSERT INTO `ogdch_postmeta` VALUES (645,149,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (646,149,'_edit_lock','1433409569:1');
INSERT INTO `ogdch_postmeta` VALUES (660,150,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (661,150,'_edit_lock','1433409351:1');
INSERT INTO `ogdch_postmeta` VALUES (664,149,'_wp_old_slug','text-alignment');
INSERT INTO `ogdch_postmeta` VALUES (665,151,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (666,151,'_edit_lock','1433409436:1');
INSERT INTO `ogdch_postmeta` VALUES (668,152,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (670,152,'_edit_lock','1433409450:1');
INSERT INTO `ogdch_postmeta` VALUES (672,144,'_wp_old_slug','ffugug');
INSERT INTO `ogdch_postmeta` VALUES (673,155,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (674,155,'_edit_lock','1433409612:1');
INSERT INTO `ogdch_postmeta` VALUES (675,154,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (676,154,'_edit_lock','1433409618:1');
INSERT INTO `ogdch_postmeta` VALUES (679,153,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (681,153,'_edit_lock','1433409607:1');
INSERT INTO `ogdch_postmeta` VALUES (735,164,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (737,164,'_edit_lock','1440509101:1');
INSERT INTO `ogdch_postmeta` VALUES (739,165,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (741,165,'_edit_lock','1440509105:1');
INSERT INTO `ogdch_postmeta` VALUES (743,166,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (746,166,'_edit_lock','1440509110:1');
INSERT INTO `ogdch_postmeta` VALUES (747,167,'_wp_page_template','default');
INSERT INTO `ogdch_postmeta` VALUES (748,167,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (749,164,'_wp_page_template','default');
INSERT INTO `ogdch_postmeta` VALUES (750,165,'_wp_page_template','default');
INSERT INTO `ogdch_postmeta` VALUES (751,166,'_wp_page_template','default');
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
INSERT INTO `ogdch_postmeta` VALUES (970,192,'_edit_lock','1444816358:1');
INSERT INTO `ogdch_postmeta` VALUES (971,192,'_ckan_local_group_title_en','Population');
INSERT INTO `ogdch_postmeta` VALUES (972,192,'_ckan_local_group_title_de','Bevölkerung');
INSERT INTO `ogdch_postmeta` VALUES (973,192,'_ckan_local_group_title_fr','Population');
INSERT INTO `ogdch_postmeta` VALUES (974,192,'_ckan_local_group_title_it','Popolazione');
INSERT INTO `ogdch_postmeta` VALUES (975,192,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/population');
INSERT INTO `ogdch_postmeta` VALUES (976,192,'_ckan_local_group_ckan_id','64d3b89b-ff79-477e-8fb4-9cfc388b0f58');
INSERT INTO `ogdch_postmeta` VALUES (977,192,'_ckan_local_group_ckan_name','population');
INSERT INTO `ogdch_postmeta` VALUES (978,193,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (979,193,'_edit_lock','1444816350:1');
INSERT INTO `ogdch_postmeta` VALUES (980,193,'_ckan_local_group_ckan_id','27b314a5-57b6-4c4e-9c9f-6923365eaecc');
INSERT INTO `ogdch_postmeta` VALUES (981,193,'_ckan_local_group_ckan_name','territory');
INSERT INTO `ogdch_postmeta` VALUES (982,193,'_ckan_local_group_title_en','Territory and environment');
INSERT INTO `ogdch_postmeta` VALUES (983,193,'_ckan_local_group_title_de','Raum und Umwelt');
INSERT INTO `ogdch_postmeta` VALUES (984,193,'_ckan_local_group_title_fr','Territoire et environnement');
INSERT INTO `ogdch_postmeta` VALUES (985,193,'_ckan_local_group_title_it','Territorio e ambiente');
INSERT INTO `ogdch_postmeta` VALUES (986,193,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/territory');
INSERT INTO `ogdch_postmeta` VALUES (987,194,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (988,194,'_edit_lock','1444816153:1');
INSERT INTO `ogdch_postmeta` VALUES (989,194,'_ckan_local_org_ckan_id','73124d1e-c2aa-4d20-a42d-fa71b8946e93');
INSERT INTO `ogdch_postmeta` VALUES (990,194,'_ckan_local_org_ckan_name','swisstopo');
INSERT INTO `ogdch_postmeta` VALUES (991,194,'_ckan_local_org_title_en','Swisstopo EN');
INSERT INTO `ogdch_postmeta` VALUES (992,194,'_ckan_local_org_title_de','Swisstopo DE');
INSERT INTO `ogdch_postmeta` VALUES (993,194,'_ckan_local_org_title_fr','Swisstopo FR');
INSERT INTO `ogdch_postmeta` VALUES (994,194,'_ckan_local_org_title_it','Swisstopo IT');
INSERT INTO `ogdch_postmeta` VALUES (997,195,'_edit_lock','1444717401:1');
INSERT INTO `ogdch_postmeta` VALUES (998,195,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (999,195,'_app-showcase-app_url','http://topoapp.io');
INSERT INTO `ogdch_postmeta` VALUES (1000,195,'_app-showcase-app_author_name','Liip');
INSERT INTO `ogdch_postmeta` VALUES (1001,195,'_app-showcase-app_author_email','jazz@liip.ch');
INSERT INTO `ogdch_postmeta` VALUES (1002,195,'_app-showcase-app_version','1.0.0');
INSERT INTO `ogdch_postmeta` VALUES (1003,196,'_edit_lock','1444717411:1');
INSERT INTO `ogdch_postmeta` VALUES (1004,196,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1005,196,'_app-showcase-app_url','http://topoapp.io');
INSERT INTO `ogdch_postmeta` VALUES (1006,196,'_app-showcase-app_author_name','Liip');
INSERT INTO `ogdch_postmeta` VALUES (1007,196,'_app-showcase-app_author_email','jazz@liip.ch');
INSERT INTO `ogdch_postmeta` VALUES (1008,196,'_app-showcase-app_version','1.0.0');
INSERT INTO `ogdch_postmeta` VALUES (1009,197,'_edit_lock','1444717421:1');
INSERT INTO `ogdch_postmeta` VALUES (1010,197,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1011,197,'_app-showcase-app_url','http://topoapp.io');
INSERT INTO `ogdch_postmeta` VALUES (1012,197,'_app-showcase-app_author_name','Liip');
INSERT INTO `ogdch_postmeta` VALUES (1013,197,'_app-showcase-app_author_email','jazz@liip.ch');
INSERT INTO `ogdch_postmeta` VALUES (1014,197,'_app-showcase-app_version','1.0.0');
INSERT INTO `ogdch_postmeta` VALUES (1015,198,'_edit_lock','1444717596:1');
INSERT INTO `ogdch_postmeta` VALUES (1016,198,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1017,198,'_app-showcase-app_url','http://topoapp.io');
INSERT INTO `ogdch_postmeta` VALUES (1018,198,'_app-showcase-app_author_name','Liip');
INSERT INTO `ogdch_postmeta` VALUES (1019,198,'_app-showcase-app_author_email','jazz@liip.ch');
INSERT INTO `ogdch_postmeta` VALUES (1020,198,'_app-showcase-app_version','1.0.0');
INSERT INTO `ogdch_postmeta` VALUES (1021,199,'_edit_lock','1444816342:1');
INSERT INTO `ogdch_postmeta` VALUES (1022,199,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1023,199,'_ckan_local_group_ckan_id','33ab70dd-e2da-464a-ae5f-b166f16d9e2c');
INSERT INTO `ogdch_postmeta` VALUES (1024,199,'_ckan_local_group_ckan_name','work');
INSERT INTO `ogdch_postmeta` VALUES (1025,199,'_ckan_local_group_title_en','Work and income');
INSERT INTO `ogdch_postmeta` VALUES (1026,199,'_ckan_local_group_title_de','Arbeit, Erwerb');
INSERT INTO `ogdch_postmeta` VALUES (1027,199,'_ckan_local_group_title_fr','Travail, rémunération');
INSERT INTO `ogdch_postmeta` VALUES (1028,199,'_ckan_local_group_title_it','Lavoro e reddito');
INSERT INTO `ogdch_postmeta` VALUES (1029,199,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/work');
INSERT INTO `ogdch_postmeta` VALUES (1030,200,'_edit_lock','1444816336:1');
INSERT INTO `ogdch_postmeta` VALUES (1031,200,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1032,200,'_ckan_local_group_ckan_id','7d52132f-7119-41ab-b2b8-e62d69a834ce');
INSERT INTO `ogdch_postmeta` VALUES (1033,200,'_ckan_local_group_ckan_name','construction');
INSERT INTO `ogdch_postmeta` VALUES (1034,200,'_ckan_local_group_title_de','Bau- und Wohnungswesen');
INSERT INTO `ogdch_postmeta` VALUES (1035,200,'_ckan_local_group_title_fr','Construction, logement');
INSERT INTO `ogdch_postmeta` VALUES (1036,200,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/construction');
INSERT INTO `ogdch_postmeta` VALUES (1037,201,'_edit_lock','1444816329:1');
INSERT INTO `ogdch_postmeta` VALUES (1038,201,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1039,201,'_ckan_local_group_ckan_id','afcb4a2a-b4b0-4d7c-984a-9078e964be49');
INSERT INTO `ogdch_postmeta` VALUES (1040,201,'_ckan_local_group_ckan_name','education');
INSERT INTO `ogdch_postmeta` VALUES (1041,201,'_ckan_local_group_title_en','Education and science');
INSERT INTO `ogdch_postmeta` VALUES (1042,201,'_ckan_local_group_title_de','Bildung, Wissenschaft');
INSERT INTO `ogdch_postmeta` VALUES (1043,201,'_ckan_local_group_title_fr','Education, science');
INSERT INTO `ogdch_postmeta` VALUES (1044,201,'_ckan_local_group_title_it','Formazione e scienza');
INSERT INTO `ogdch_postmeta` VALUES (1045,201,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/education');
INSERT INTO `ogdch_postmeta` VALUES (1046,202,'_edit_lock','1444816323:1');
INSERT INTO `ogdch_postmeta` VALUES (1047,202,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1048,202,'_ckan_local_group_ckan_id','42f56f74-074e-4cbb-b91b-deeb1fd58c56');
INSERT INTO `ogdch_postmeta` VALUES (1049,202,'_ckan_local_group_ckan_name','energy');
INSERT INTO `ogdch_postmeta` VALUES (1050,202,'_ckan_local_group_title_en','Energy');
INSERT INTO `ogdch_postmeta` VALUES (1051,202,'_ckan_local_group_title_de','Energie');
INSERT INTO `ogdch_postmeta` VALUES (1052,202,'_ckan_local_group_title_fr','Energie');
INSERT INTO `ogdch_postmeta` VALUES (1053,202,'_ckan_local_group_title_it','Energia');
INSERT INTO `ogdch_postmeta` VALUES (1054,202,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/energy');
INSERT INTO `ogdch_postmeta` VALUES (1055,203,'_edit_lock','1444816316:1');
INSERT INTO `ogdch_postmeta` VALUES (1056,203,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1057,203,'_ckan_local_group_ckan_id','79cbe120-e9c6-4249-b934-58ca980606d7');
INSERT INTO `ogdch_postmeta` VALUES (1058,203,'_ckan_local_group_ckan_name','finances');
INSERT INTO `ogdch_postmeta` VALUES (1059,203,'_ckan_local_group_title_en','Finances');
INSERT INTO `ogdch_postmeta` VALUES (1060,203,'_ckan_local_group_title_de','Finanzen');
INSERT INTO `ogdch_postmeta` VALUES (1061,203,'_ckan_local_group_title_fr','Finances');
INSERT INTO `ogdch_postmeta` VALUES (1062,203,'_ckan_local_group_title_it','Finanze');
INSERT INTO `ogdch_postmeta` VALUES (1063,203,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/finances');
INSERT INTO `ogdch_postmeta` VALUES (1064,204,'_edit_lock','1444816309:1');
INSERT INTO `ogdch_postmeta` VALUES (1065,204,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1066,204,'_ckan_local_group_ckan_id','a20e9d52-0d20-413c-a8ad-9ffd4523bec6');
INSERT INTO `ogdch_postmeta` VALUES (1067,204,'_ckan_local_group_ckan_name','geography');
INSERT INTO `ogdch_postmeta` VALUES (1068,204,'_ckan_local_group_title_de','Geographie');
INSERT INTO `ogdch_postmeta` VALUES (1069,204,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/geography');
INSERT INTO `ogdch_postmeta` VALUES (1070,205,'_edit_lock','1446018450:1');
INSERT INTO `ogdch_postmeta` VALUES (1071,205,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1072,205,'_ckan_local_group_ckan_id','28641aa8-b97d-49ed-85bf-c19eb0f729d3');
INSERT INTO `ogdch_postmeta` VALUES (1073,205,'_ckan_local_group_ckan_name','legislation');
INSERT INTO `ogdch_postmeta` VALUES (1074,205,'_ckan_local_group_title_en','Legislation');
INSERT INTO `ogdch_postmeta` VALUES (1075,205,'_ckan_local_group_title_de','Gesetzgebung');
INSERT INTO `ogdch_postmeta` VALUES (1076,205,'_ckan_local_group_title_fr','Législation');
INSERT INTO `ogdch_postmeta` VALUES (1077,205,'_ckan_local_group_title_it','Legislazione');
INSERT INTO `ogdch_postmeta` VALUES (1078,205,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/legislation');
INSERT INTO `ogdch_postmeta` VALUES (1079,206,'_edit_lock','1444816294:1');
INSERT INTO `ogdch_postmeta` VALUES (1080,206,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1081,206,'_ckan_local_group_ckan_id','90848388-d0b6-4b97-a686-e93b40832e1e');
INSERT INTO `ogdch_postmeta` VALUES (1082,206,'_ckan_local_group_ckan_name','health');
INSERT INTO `ogdch_postmeta` VALUES (1083,206,'_ckan_local_group_title_en','Health');
INSERT INTO `ogdch_postmeta` VALUES (1084,206,'_ckan_local_group_title_de','Gesundheit');
INSERT INTO `ogdch_postmeta` VALUES (1085,206,'_ckan_local_group_title_fr','Santé');
INSERT INTO `ogdch_postmeta` VALUES (1086,206,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/health');
INSERT INTO `ogdch_postmeta` VALUES (1087,207,'_edit_lock','1444816279:1');
INSERT INTO `ogdch_postmeta` VALUES (1088,207,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1089,207,'_ckan_local_group_ckan_id','dc8b567c-fed8-4696-847b-f85510f93d71');
INSERT INTO `ogdch_postmeta` VALUES (1090,207,'_ckan_local_group_ckan_name','trade');
INSERT INTO `ogdch_postmeta` VALUES (1091,207,'_ckan_local_group_title_de','Handel');
INSERT INTO `ogdch_postmeta` VALUES (1092,207,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/trade');
INSERT INTO `ogdch_postmeta` VALUES (1093,208,'_edit_lock','1444816271:1');
INSERT INTO `ogdch_postmeta` VALUES (1094,208,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1095,208,'_ckan_local_group_ckan_id','168c842c-fd1f-4180-91ce-1aecaac8f282');
INSERT INTO `ogdch_postmeta` VALUES (1096,208,'_ckan_local_group_ckan_name','industry');
INSERT INTO `ogdch_postmeta` VALUES (1097,208,'_ckan_local_group_title_en','Industry and services');
INSERT INTO `ogdch_postmeta` VALUES (1098,208,'_ckan_local_group_title_de','Industrie, Dienstleistungen');
INSERT INTO `ogdch_postmeta` VALUES (1099,208,'_ckan_local_group_title_fr','Industrie, services');
INSERT INTO `ogdch_postmeta` VALUES (1100,208,'_ckan_local_group_title_it','Industria, servizi');
INSERT INTO `ogdch_postmeta` VALUES (1101,208,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/industry');
INSERT INTO `ogdch_postmeta` VALUES (1102,209,'_edit_lock','1444816264:1');
INSERT INTO `ogdch_postmeta` VALUES (1103,209,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1104,209,'_ckan_local_group_ckan_id','2cd03703-e1e3-4031-bd3c-4d0e82d3d7c1');
INSERT INTO `ogdch_postmeta` VALUES (1105,209,'_ckan_local_group_ckan_name','crime');
INSERT INTO `ogdch_postmeta` VALUES (1106,209,'_ckan_local_group_title_en','Crime, criminal justice');
INSERT INTO `ogdch_postmeta` VALUES (1107,209,'_ckan_local_group_title_de','Kriminalität, Strafrecht');
INSERT INTO `ogdch_postmeta` VALUES (1108,209,'_ckan_local_group_title_fr','Criminalité, droit pénal');
INSERT INTO `ogdch_postmeta` VALUES (1109,209,'_ckan_local_group_title_it','Criminalità, diritto penale');
INSERT INTO `ogdch_postmeta` VALUES (1110,209,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/crime');
INSERT INTO `ogdch_postmeta` VALUES (1111,210,'_edit_lock','1444816258:1');
INSERT INTO `ogdch_postmeta` VALUES (1112,210,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1113,210,'_ckan_local_group_ckan_id','0d77b36f-1de6-40b3-9915-be91ee469f63');
INSERT INTO `ogdch_postmeta` VALUES (1114,210,'_ckan_local_group_ckan_name','culture');
INSERT INTO `ogdch_postmeta` VALUES (1115,210,'_ckan_local_group_title_de','Kultur, Medien, Informationsgesellschaft, Sport');
INSERT INTO `ogdch_postmeta` VALUES (1116,210,'_ckan_local_group_title_fr','Culture, médias, société de l\'information, sport');
INSERT INTO `ogdch_postmeta` VALUES (1117,210,'_ckan_local_group_title_it','Cultura, media, società dell\'informazione, sport');
INSERT INTO `ogdch_postmeta` VALUES (1118,210,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/culture');
INSERT INTO `ogdch_postmeta` VALUES (1119,211,'_edit_lock','1444816251:1');
INSERT INTO `ogdch_postmeta` VALUES (1120,211,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1121,211,'_ckan_local_group_ckan_id','c7521678-de76-4731-9075-25d1d6150ecf');
INSERT INTO `ogdch_postmeta` VALUES (1122,211,'_ckan_local_group_ckan_name','agriculture');
INSERT INTO `ogdch_postmeta` VALUES (1123,211,'_ckan_local_group_title_en','Agriculture, forestry');
INSERT INTO `ogdch_postmeta` VALUES (1124,211,'_ckan_local_group_title_de','Land- und Forstwirtschaft');
INSERT INTO `ogdch_postmeta` VALUES (1125,211,'_ckan_local_group_title_fr','Agriculture, sylviculture');
INSERT INTO `ogdch_postmeta` VALUES (1126,211,'_ckan_local_group_title_it','Agricoltura, selvicoltura');
INSERT INTO `ogdch_postmeta` VALUES (1127,211,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/agriculture');
INSERT INTO `ogdch_postmeta` VALUES (1128,212,'_edit_lock','1444816244:1');
INSERT INTO `ogdch_postmeta` VALUES (1129,212,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1130,212,'_ckan_local_group_ckan_id','8c2a33d5-475d-48dd-87b6-7ce5eb2033fa');
INSERT INTO `ogdch_postmeta` VALUES (1131,212,'_ckan_local_group_ckan_name','mobility');
INSERT INTO `ogdch_postmeta` VALUES (1132,212,'_ckan_local_group_title_en','Mobility and Transport');
INSERT INTO `ogdch_postmeta` VALUES (1133,212,'_ckan_local_group_title_de','Mobilität und Verkehr');
INSERT INTO `ogdch_postmeta` VALUES (1134,212,'_ckan_local_group_title_fr','Mobilité et transports');
INSERT INTO `ogdch_postmeta` VALUES (1135,212,'_ckan_local_group_title_it','Mobilità e trasporti');
INSERT INTO `ogdch_postmeta` VALUES (1136,212,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/mobility');
INSERT INTO `ogdch_postmeta` VALUES (1137,213,'_edit_lock','1444816233:1');
INSERT INTO `ogdch_postmeta` VALUES (1138,213,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1139,213,'_ckan_local_group_title_de','Öffentliche Ordnung und Sicherheit');
INSERT INTO `ogdch_postmeta` VALUES (1140,213,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/public-order');
INSERT INTO `ogdch_postmeta` VALUES (1141,213,'_ckan_local_group_ckan_id','620fdda8-a92d-421b-89ad-4ef1b57a9458');
INSERT INTO `ogdch_postmeta` VALUES (1142,213,'_ckan_local_group_ckan_name','public-order');
INSERT INTO `ogdch_postmeta` VALUES (1143,214,'_edit_lock','1444816227:1');
INSERT INTO `ogdch_postmeta` VALUES (1144,214,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1145,214,'_ckan_local_group_ckan_id','9beba14c-eab8-426e-89ae-757bc2e6445e');
INSERT INTO `ogdch_postmeta` VALUES (1146,214,'_ckan_local_group_ckan_name','politics');
INSERT INTO `ogdch_postmeta` VALUES (1147,214,'_ckan_local_group_title_de','Politik');
INSERT INTO `ogdch_postmeta` VALUES (1148,214,'_ckan_local_group_title_fr','Politique');
INSERT INTO `ogdch_postmeta` VALUES (1149,214,'_ckan_local_group_title_it','Politica');
INSERT INTO `ogdch_postmeta` VALUES (1150,214,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/politics');
INSERT INTO `ogdch_postmeta` VALUES (1151,216,'_edit_lock','1444816221:1');
INSERT INTO `ogdch_postmeta` VALUES (1152,216,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1153,216,'_ckan_local_group_ckan_id','1deb7a82-612f-46ce-9c62-89c7c0b38ddf');
INSERT INTO `ogdch_postmeta` VALUES (1154,216,'_ckan_local_group_ckan_name','prices');
INSERT INTO `ogdch_postmeta` VALUES (1155,216,'_ckan_local_group_title_en','Prices');
INSERT INTO `ogdch_postmeta` VALUES (1156,216,'_ckan_local_group_title_de','Preise');
INSERT INTO `ogdch_postmeta` VALUES (1157,216,'_ckan_local_group_title_fr','Prix');
INSERT INTO `ogdch_postmeta` VALUES (1158,216,'_ckan_local_group_title_it','Prezzi');
INSERT INTO `ogdch_postmeta` VALUES (1159,216,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/prices');
INSERT INTO `ogdch_postmeta` VALUES (1160,217,'_edit_lock','1444816213:1');
INSERT INTO `ogdch_postmeta` VALUES (1161,217,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1162,217,'_ckan_local_group_ckan_id','011e8933-7b86-412c-8fe6-752060d8e103');
INSERT INTO `ogdch_postmeta` VALUES (1163,217,'_ckan_local_group_ckan_name','social-security');
INSERT INTO `ogdch_postmeta` VALUES (1164,217,'_ckan_local_group_title_en','Social security');
INSERT INTO `ogdch_postmeta` VALUES (1165,217,'_ckan_local_group_title_de','Soziale Sicherheit');
INSERT INTO `ogdch_postmeta` VALUES (1166,217,'_ckan_local_group_title_fr','Protection sociale');
INSERT INTO `ogdch_postmeta` VALUES (1167,217,'_ckan_local_group_title_it','Sicurezza sociale');
INSERT INTO `ogdch_postmeta` VALUES (1168,217,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/social-security');
INSERT INTO `ogdch_postmeta` VALUES (1169,218,'_edit_lock','1444816205:1');
INSERT INTO `ogdch_postmeta` VALUES (1170,218,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1171,218,'_ckan_local_group_ckan_id','e5d8e87e-aa10-42f3-a7c2-1f45ee5707c2');
INSERT INTO `ogdch_postmeta` VALUES (1172,218,'_ckan_local_group_ckan_name','statistical-basis');
INSERT INTO `ogdch_postmeta` VALUES (1173,218,'_ckan_local_group_title_en','Statistical basis');
INSERT INTO `ogdch_postmeta` VALUES (1174,218,'_ckan_local_group_title_de','Statistische Grundlagen');
INSERT INTO `ogdch_postmeta` VALUES (1175,218,'_ckan_local_group_title_fr','Bases statistiques');
INSERT INTO `ogdch_postmeta` VALUES (1176,218,'_ckan_local_group_title_it','Basi statistiche');
INSERT INTO `ogdch_postmeta` VALUES (1177,218,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/statistical-basis');
INSERT INTO `ogdch_postmeta` VALUES (1178,219,'_edit_lock','1444816188:1');
INSERT INTO `ogdch_postmeta` VALUES (1179,219,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1180,219,'_ckan_local_group_ckan_id','6aace7ef-f167-40c9-a0d7-87e7e2681c07');
INSERT INTO `ogdch_postmeta` VALUES (1181,219,'_ckan_local_group_ckan_name','tourism');
INSERT INTO `ogdch_postmeta` VALUES (1182,219,'_ckan_local_group_title_en','Tourism');
INSERT INTO `ogdch_postmeta` VALUES (1183,219,'_ckan_local_group_title_de','Tourismus');
INSERT INTO `ogdch_postmeta` VALUES (1184,219,'_ckan_local_group_title_fr','Tourisme');
INSERT INTO `ogdch_postmeta` VALUES (1185,219,'_ckan_local_group_title_it','Turismo');
INSERT INTO `ogdch_postmeta` VALUES (1186,219,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/tourism');
INSERT INTO `ogdch_postmeta` VALUES (1187,220,'_edit_lock','1444816179:1');
INSERT INTO `ogdch_postmeta` VALUES (1188,220,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1189,220,'_ckan_local_group_ckan_id','afc7c340-9bdb-4767-bbcb-70094a1d0dcc');
INSERT INTO `ogdch_postmeta` VALUES (1190,220,'_ckan_local_group_ckan_name','administration');
INSERT INTO `ogdch_postmeta` VALUES (1191,220,'_ckan_local_group_title_en','Administration');
INSERT INTO `ogdch_postmeta` VALUES (1192,220,'_ckan_local_group_title_de','Verwaltung');
INSERT INTO `ogdch_postmeta` VALUES (1193,220,'_ckan_local_group_title_fr','Administration');
INSERT INTO `ogdch_postmeta` VALUES (1194,220,'_ckan_local_group_title_it','Amministrazione');
INSERT INTO `ogdch_postmeta` VALUES (1195,220,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/administration');
INSERT INTO `ogdch_postmeta` VALUES (1196,221,'_edit_lock','1444816165:1');
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
INSERT INTO `ogdch_postmeta` VALUES (1472,246,'_edit_lock','1444816131:1');
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
INSERT INTO `ogdch_postmeta` VALUES (1517,247,'_edit_lock','1445517272:1');
INSERT INTO `ogdch_postmeta` VALUES (1519,248,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1521,248,'_edit_lock','1442870093:1');
INSERT INTO `ogdch_postmeta` VALUES (1523,249,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1526,249,'_edit_lock','1442870126:1');
INSERT INTO `ogdch_postmeta` VALUES (1530,250,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1531,247,'_wp_page_template','default');
INSERT INTO `ogdch_postmeta` VALUES (1534,250,'_edit_lock','1442870135:1');
INSERT INTO `ogdch_postmeta` VALUES (1535,251,'_menu_item_type','post_type');
INSERT INTO `ogdch_postmeta` VALUES (1536,251,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1537,251,'_menu_item_object_id','2');
INSERT INTO `ogdch_postmeta` VALUES (1538,251,'_menu_item_object','page');
INSERT INTO `ogdch_postmeta` VALUES (1539,251,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1540,251,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1541,251,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1542,251,'_menu_item_url','');
INSERT INTO `ogdch_postmeta` VALUES (1544,252,'_menu_item_type','post_type');
INSERT INTO `ogdch_postmeta` VALUES (1545,252,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1546,252,'_menu_item_object_id','164');
INSERT INTO `ogdch_postmeta` VALUES (1547,252,'_menu_item_object','page');
INSERT INTO `ogdch_postmeta` VALUES (1548,252,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1549,252,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1550,252,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1551,252,'_menu_item_url','');
INSERT INTO `ogdch_postmeta` VALUES (1553,253,'_menu_item_type','post_type');
INSERT INTO `ogdch_postmeta` VALUES (1554,253,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1555,253,'_menu_item_object_id','247');
INSERT INTO `ogdch_postmeta` VALUES (1556,253,'_menu_item_object','page');
INSERT INTO `ogdch_postmeta` VALUES (1557,253,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1558,253,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1559,253,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1560,253,'_menu_item_url','');
INSERT INTO `ogdch_postmeta` VALUES (1562,254,'_menu_item_type','post_type');
INSERT INTO `ogdch_postmeta` VALUES (1563,254,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1564,254,'_menu_item_object_id','97');
INSERT INTO `ogdch_postmeta` VALUES (1565,254,'_menu_item_object','page');
INSERT INTO `ogdch_postmeta` VALUES (1566,254,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1567,254,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1568,254,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1569,254,'_menu_item_url','');
INSERT INTO `ogdch_postmeta` VALUES (1571,255,'_menu_item_type','post_type');
INSERT INTO `ogdch_postmeta` VALUES (1572,255,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1573,255,'_menu_item_object_id','165');
INSERT INTO `ogdch_postmeta` VALUES (1574,255,'_menu_item_object','page');
INSERT INTO `ogdch_postmeta` VALUES (1575,255,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1576,255,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1577,255,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1578,255,'_menu_item_url','');
INSERT INTO `ogdch_postmeta` VALUES (1580,256,'_menu_item_type','post_type');
INSERT INTO `ogdch_postmeta` VALUES (1581,256,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1582,256,'_menu_item_object_id','248');
INSERT INTO `ogdch_postmeta` VALUES (1583,256,'_menu_item_object','page');
INSERT INTO `ogdch_postmeta` VALUES (1584,256,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1585,256,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1586,256,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1587,256,'_menu_item_url','');
INSERT INTO `ogdch_postmeta` VALUES (1589,257,'_menu_item_type','post_type');
INSERT INTO `ogdch_postmeta` VALUES (1590,257,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1591,257,'_menu_item_object_id','118');
INSERT INTO `ogdch_postmeta` VALUES (1592,257,'_menu_item_object','page');
INSERT INTO `ogdch_postmeta` VALUES (1593,257,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1594,257,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1595,257,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1596,257,'_menu_item_url','');
INSERT INTO `ogdch_postmeta` VALUES (1598,258,'_menu_item_type','post_type');
INSERT INTO `ogdch_postmeta` VALUES (1599,258,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1600,258,'_menu_item_object_id','166');
INSERT INTO `ogdch_postmeta` VALUES (1601,258,'_menu_item_object','page');
INSERT INTO `ogdch_postmeta` VALUES (1602,258,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1603,258,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1604,258,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1605,258,'_menu_item_url','');
INSERT INTO `ogdch_postmeta` VALUES (1607,259,'_menu_item_type','post_type');
INSERT INTO `ogdch_postmeta` VALUES (1608,259,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1609,259,'_menu_item_object_id','249');
INSERT INTO `ogdch_postmeta` VALUES (1610,259,'_menu_item_object','page');
INSERT INTO `ogdch_postmeta` VALUES (1611,259,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1612,259,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1613,259,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1614,259,'_menu_item_url','');
INSERT INTO `ogdch_postmeta` VALUES (1616,260,'_menu_item_type','post_type');
INSERT INTO `ogdch_postmeta` VALUES (1617,260,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1618,260,'_menu_item_object_id','119');
INSERT INTO `ogdch_postmeta` VALUES (1619,260,'_menu_item_object','page');
INSERT INTO `ogdch_postmeta` VALUES (1620,260,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1621,260,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1622,260,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1623,260,'_menu_item_url','');
INSERT INTO `ogdch_postmeta` VALUES (1625,261,'_menu_item_type','post_type');
INSERT INTO `ogdch_postmeta` VALUES (1626,261,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1627,261,'_menu_item_object_id','167');
INSERT INTO `ogdch_postmeta` VALUES (1628,261,'_menu_item_object','page');
INSERT INTO `ogdch_postmeta` VALUES (1629,261,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1630,261,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1631,261,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1632,261,'_menu_item_url','');
INSERT INTO `ogdch_postmeta` VALUES (1634,262,'_menu_item_type','post_type');
INSERT INTO `ogdch_postmeta` VALUES (1635,262,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1636,262,'_menu_item_object_id','250');
INSERT INTO `ogdch_postmeta` VALUES (1637,262,'_menu_item_object','page');
INSERT INTO `ogdch_postmeta` VALUES (1638,262,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1639,262,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1640,262,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1641,262,'_menu_item_url','');
INSERT INTO `ogdch_postmeta` VALUES (1643,263,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (1644,263,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1645,263,'_menu_item_object_id','263');
INSERT INTO `ogdch_postmeta` VALUES (1646,263,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (1647,263,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1648,263,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1649,263,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1650,263,'_menu_item_url','/de/dataset');
INSERT INTO `ogdch_postmeta` VALUES (1652,264,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (1653,264,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1654,264,'_menu_item_object_id','264');
INSERT INTO `ogdch_postmeta` VALUES (1655,264,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (1656,264,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1657,264,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1658,264,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1659,264,'_menu_item_url','/de/organization');
INSERT INTO `ogdch_postmeta` VALUES (1661,265,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (1662,265,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1663,265,'_menu_item_object_id','265');
INSERT INTO `ogdch_postmeta` VALUES (1664,265,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (1665,265,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1666,265,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1667,265,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1668,265,'_menu_item_url','/de/group');
INSERT INTO `ogdch_postmeta` VALUES (1670,266,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (1671,266,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1672,266,'_menu_item_object_id','266');
INSERT INTO `ogdch_postmeta` VALUES (1673,266,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (1674,266,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1675,266,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1676,266,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1677,266,'_menu_item_url','/en/dataset');
INSERT INTO `ogdch_postmeta` VALUES (1679,267,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (1680,267,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1681,267,'_menu_item_object_id','267');
INSERT INTO `ogdch_postmeta` VALUES (1682,267,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (1683,267,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1684,267,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1685,267,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1686,267,'_menu_item_url','/en/organization');
INSERT INTO `ogdch_postmeta` VALUES (1688,268,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (1689,268,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1690,268,'_menu_item_object_id','268');
INSERT INTO `ogdch_postmeta` VALUES (1691,268,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (1692,268,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1693,268,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1694,268,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1695,268,'_menu_item_url','/en/group');
INSERT INTO `ogdch_postmeta` VALUES (1697,269,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (1698,269,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1699,269,'_menu_item_object_id','269');
INSERT INTO `ogdch_postmeta` VALUES (1700,269,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (1701,269,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1702,269,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1703,269,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1704,269,'_menu_item_url','/it/dataset');
INSERT INTO `ogdch_postmeta` VALUES (1706,270,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (1707,270,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1708,270,'_menu_item_object_id','270');
INSERT INTO `ogdch_postmeta` VALUES (1709,270,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (1710,270,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1711,270,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1712,270,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1713,270,'_menu_item_url','/it/organization');
INSERT INTO `ogdch_postmeta` VALUES (1715,271,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (1716,271,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1717,271,'_menu_item_object_id','271');
INSERT INTO `ogdch_postmeta` VALUES (1718,271,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (1719,271,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1720,271,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1721,271,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1722,271,'_menu_item_url','/it/group');
INSERT INTO `ogdch_postmeta` VALUES (1724,272,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (1725,272,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1726,272,'_menu_item_object_id','272');
INSERT INTO `ogdch_postmeta` VALUES (1727,272,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (1728,272,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1729,272,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1730,272,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1731,272,'_menu_item_url','/fr/dataset');
INSERT INTO `ogdch_postmeta` VALUES (1733,273,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (1734,273,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1735,273,'_menu_item_object_id','273');
INSERT INTO `ogdch_postmeta` VALUES (1736,273,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (1737,273,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1738,273,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1739,273,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1740,273,'_menu_item_url','/fr/organization');
INSERT INTO `ogdch_postmeta` VALUES (1742,274,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (1743,274,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1744,274,'_menu_item_object_id','274');
INSERT INTO `ogdch_postmeta` VALUES (1745,274,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (1746,274,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1747,274,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1748,274,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1749,274,'_menu_item_url','/fr/group');
INSERT INTO `ogdch_postmeta` VALUES (1751,275,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (1752,275,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1753,275,'_menu_item_object_id','275');
INSERT INTO `ogdch_postmeta` VALUES (1754,275,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (1755,275,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1756,275,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1757,275,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1758,275,'_menu_item_url','http://docs.ckan.org/en/latest/api/index.html');
INSERT INTO `ogdch_postmeta` VALUES (1760,276,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (1761,276,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1762,276,'_menu_item_object_id','276');
INSERT INTO `ogdch_postmeta` VALUES (1763,276,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (1764,276,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1765,276,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1766,276,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1767,276,'_menu_item_url','https://github.com/ogdch/ckanext-switzerland');
INSERT INTO `ogdch_postmeta` VALUES (1769,277,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (1770,277,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1771,277,'_menu_item_object_id','277');
INSERT INTO `ogdch_postmeta` VALUES (1772,277,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (1773,277,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1774,277,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1775,277,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1776,277,'_menu_item_url','http://docs.ckan.org/en/latest/api/index.html');
INSERT INTO `ogdch_postmeta` VALUES (1778,278,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (1779,278,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1780,278,'_menu_item_object_id','278');
INSERT INTO `ogdch_postmeta` VALUES (1781,278,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (1782,278,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1783,278,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1784,278,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1785,278,'_menu_item_url','https://github.com/ogdch/ckanext-switzerland');
INSERT INTO `ogdch_postmeta` VALUES (1787,279,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (1788,279,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1789,279,'_menu_item_object_id','279');
INSERT INTO `ogdch_postmeta` VALUES (1790,279,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (1791,279,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1792,279,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1793,279,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1794,279,'_menu_item_url','http://docs.ckan.org/en/latest/api/index.html');
INSERT INTO `ogdch_postmeta` VALUES (1796,280,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (1797,280,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1798,280,'_menu_item_object_id','280');
INSERT INTO `ogdch_postmeta` VALUES (1799,280,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (1800,280,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1801,280,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1802,280,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1803,280,'_menu_item_url','https://github.com/ogdch/ckanext-switzerland');
INSERT INTO `ogdch_postmeta` VALUES (1805,281,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (1806,281,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1807,281,'_menu_item_object_id','281');
INSERT INTO `ogdch_postmeta` VALUES (1808,281,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (1809,281,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1810,281,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1811,281,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1812,281,'_menu_item_url','http://docs.ckan.org/en/latest/api/index.html');
INSERT INTO `ogdch_postmeta` VALUES (1814,282,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (1815,282,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1816,282,'_menu_item_object_id','282');
INSERT INTO `ogdch_postmeta` VALUES (1817,282,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (1818,282,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1819,282,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1820,282,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1821,282,'_menu_item_url','https://github.com/ogdch/ckanext-switzerland');
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
INSERT INTO `ogdch_postmeta` VALUES (1839,284,'_ckan_local_dataset_keywords','a:8:{i:0;s:9:\"Eisenbahn\";i:1;s:13:\"Chemin-de-fer\";i:2;s:8:\"Ferrovia\";i:3;s:8:\"Railroad\";i:4;s:5:\"Nacht\";i:5;s:4:\"Nuit\";i:6;s:5:\"Noche\";i:7;s:5:\"Night\";}');
INSERT INTO `ogdch_postmeta` VALUES (1840,284,'_ckan_local_dataset_landing_page','http://www.bafu.admin.ch/laerm/index.html?lang=de');
INSERT INTO `ogdch_postmeta` VALUES (1843,284,'_ckan_local_dataset_accrual_periodicity','http://purl.org/cld/freq/daily');
INSERT INTO `ogdch_postmeta` VALUES (1844,284,'_ckan_local_dataset_title_en','Railway noise night');
INSERT INTO `ogdch_postmeta` VALUES (1845,284,'_ckan_local_dataset_description_en','The map shows how the population is exposed by the noise pollution of the rail system.');
INSERT INTO `ogdch_postmeta` VALUES (1846,284,'_ckan_local_dataset_title_de','Eisenbahnlärm Nacht');
INSERT INTO `ogdch_postmeta` VALUES (1847,284,'_ckan_local_dataset_description_de','Die Karte zeigt, welcher Lärmbelastung die Bevölkerung durch den Schienenverkehr ausgesetzt ist.');
INSERT INTO `ogdch_postmeta` VALUES (1848,284,'_ckan_local_dataset_title_fr','Bruit ferroviaire nuit');
INSERT INTO `ogdch_postmeta` VALUES (1849,284,'_ckan_local_dataset_description_fr','La carte montre que la pollution sonore est suspendu par le système de rail, la population.');
INSERT INTO `ogdch_postmeta` VALUES (1850,284,'_ckan_local_dataset_title_it','Rumore ferroviario notte');
INSERT INTO `ogdch_postmeta` VALUES (1851,284,'_ckan_local_dataset_description_it','La mappa mostra che l\'inquinamento acustico è sospeso dal sistema ferroviario, la popolazione.');
INSERT INTO `ogdch_postmeta` VALUES (1852,284,'_ckan_local_dataset_publishers','a:2:{i:0;a:2:{s:5:\"label\";s:41:\"Bundesamt für Landestopografie swisstopo\";s:17:\"termdat_reference\";s:27:\"Verweis auf TERMDAT-Eintrag\";}i:1;a:1:{s:5:\"label\";s:21:\"Bundesamt für Umwelt\";}}');
INSERT INTO `ogdch_postmeta` VALUES (1853,284,'_ckan_local_dataset_contact_points','a:2:{i:0;a:2:{s:4:\"name\";s:20:\"Abteilung Lärm BAFU\";s:5:\"email\";s:19:\"noise@bafu.admin.ch\";}i:1;a:2:{s:4:\"name\";s:13:\"Heinz Müller\";s:5:\"email\";s:19:\"heinz@bafu.admin.ch\";}}');
INSERT INTO `ogdch_postmeta` VALUES (1854,284,'_ckan_local_dataset_relations','a:1:{i:0;a:2:{s:3:\"url\";s:49:\"http://www.bafu.admin.ch/laerm/index.html?lang=de\";s:5:\"label\";s:17:\"Webseite des BAFU\";}}');
INSERT INTO `ogdch_postmeta` VALUES (1855,284,'_ckan_local_dataset_temporals','a:2:{i:0;a:2:{s:10:\"start_date\";i:-2046124800;s:8:\"end_date\";i:1357344000;}i:1;a:2:{s:10:\"start_date\";i:1362096000;s:8:\"end_date\";i:1420416000;}}');
INSERT INTO `ogdch_postmeta` VALUES (1856,284,'_ckan_local_dataset_see_alsos','a:1:{i:0;a:1:{s:18:\"dataset_identifier\";s:16:\"123@bundesarchiv\";}}');
INSERT INTO `ogdch_postmeta` VALUES (1857,284,'_ckan_local_dataset_distributions','a:1:{i:0;a:13:{s:8:\"title_en\";s:35:\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\";s:14:\"description_en\";s:61:\"The information is based on comprehensive model calculations.\";s:8:\"title_de\";s:35:\"WMS (ch.bafu.laerm-bahnlaerm_nacht)\";s:14:\"description_de\";s:62:\"Die Angaben basieren auf flächendeckenden Modellberechnungen.\";s:9:\"languages\";a:2:{i:0;s:2:\"en\";i:1;s:2:\"de\";}s:6:\"issued\";i:1368230400;s:8:\"modified\";i:1430006400;s:6:\"rights\";s:56:\"NonCommercialAllowed-CommercialAllowed-ReferenceRequired\";s:10:\"access_url\";s:24:\"http://wms.geo.admin.ch/\";s:12:\"download_url\";s:99:\"http://data.geo.admin.ch.s3.amazonaws.com/ch.swisstopo.swissboundaries3d-land-flaeche.fill/data.zip\";s:9:\"byte_size\";s:4:\"1024\";s:10:\"media_type\";s:9:\"text/html\";s:10:\"identifier\";s:29:\"ch.bafu.laerm-bahnlaerm_nacht\";}}');
INSERT INTO `ogdch_postmeta` VALUES (1858,284,'_edit_lock','1445517053:1');
INSERT INTO `ogdch_postmeta` VALUES (1859,284,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1860,285,'_edit_lock','1446018279:1');
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
INSERT INTO `ogdch_postmeta` VALUES (1916,195,'_app-showcase-app_relations','a:1:{i:0;a:1:{s:10:\"dataset_id\";s:19:\"railway-noise-night\";}}');
INSERT INTO `ogdch_postmeta` VALUES (1917,196,'_app-showcase-app_relations','a:1:{i:0;a:1:{s:10:\"dataset_id\";s:19:\"railway-noise-night\";}}');
INSERT INTO `ogdch_postmeta` VALUES (1918,197,'_app-showcase-app_relations','a:1:{i:0;a:1:{s:10:\"dataset_id\";s:19:\"railway-noise-night\";}}');
INSERT INTO `ogdch_postmeta` VALUES (1919,198,'_app-showcase-app_relations','a:1:{i:0;a:1:{s:10:\"dataset_id\";s:19:\"railway-noise-night\";}}');
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
INSERT INTO `ogdch_postmeta` VALUES (1992,284,'_ckan_local_dataset_themes','a:2:{i:0;s:10:\"population\";i:1;s:8:\"mobility\";}');
INSERT INTO `ogdch_postmeta` VALUES (1993,291,'_edit_lock','1444816144:1');
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
INSERT INTO `ogdch_postmeta` VALUES (2004,292,'_edit_lock','1445515634:1');
INSERT INTO `ogdch_postmeta` VALUES (2005,292,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (2006,248,'_wp_page_template','default');
INSERT INTO `ogdch_postmeta` VALUES (2007,249,'_wp_page_template','default');
INSERT INTO `ogdch_postmeta` VALUES (2008,250,'_wp_page_template','default');
INSERT INTO `ogdch_postmeta` VALUES (2009,293,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (2010,293,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (2011,293,'_menu_item_object_id','293');
INSERT INTO `ogdch_postmeta` VALUES (2012,293,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (2013,293,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (2014,293,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (2015,293,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (2016,293,'_menu_item_url','/de/app');
INSERT INTO `ogdch_postmeta` VALUES (2018,294,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (2019,294,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (2020,294,'_menu_item_object_id','294');
INSERT INTO `ogdch_postmeta` VALUES (2021,294,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (2022,294,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (2023,294,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (2024,294,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (2025,294,'_menu_item_url','/en/app');
INSERT INTO `ogdch_postmeta` VALUES (2027,295,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (2028,295,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (2029,295,'_menu_item_object_id','295');
INSERT INTO `ogdch_postmeta` VALUES (2030,295,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (2031,295,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (2032,295,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (2033,295,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (2034,295,'_menu_item_url','/fr/app');
INSERT INTO `ogdch_postmeta` VALUES (2036,296,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (2037,296,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (2038,296,'_menu_item_object_id','296');
INSERT INTO `ogdch_postmeta` VALUES (2039,296,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (2040,296,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (2041,296,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (2042,296,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (2043,296,'_menu_item_url','/it/app');
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
) ENGINE=InnoDB AUTO_INCREMENT=297 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogdch_posts`
--

LOCK TABLES `ogdch_posts` WRITE;
/*!40000 ALTER TABLE `ogdch_posts` DISABLE KEYS */;
INSERT INTO `ogdch_posts` VALUES (2,1,'2015-06-03 06:50:11','2015-05-21 13:32:37','<h2>Text Styles</h2>\r\n<h2>heading 2</h2>\r\n<h3>heading 3</h3>\r\n<h4>heading 4</h4>\r\n<pre>&lt;a href=\"test\"&gt;Preformatted text&lt;/a&gt;</pre>\r\n<h2>Text Formatting</h2>\r\nInhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch Inhalt Deutsch\r\n\r\n<strong>Bold Text</strong>\r\n\r\n<em>Italic text</em>\r\n\r\n<del>strikethrough</del>\r\n\r\n<span style=\"text-decoration: underline;\">underlined</span>\r\n<p style=\"text-align: left;\">left aligned</p>\r\n<p style=\"text-align: center;\">centered</p>\r\n<p style=\"text-align: right;\">right aligned</p>\r\n<p style=\"text-align: justify;\">justified bla bla bla justified bla bla bla justified bla bla bla justified bla bla bla justified bla bla bla justified bla bla bla justified bla bla bla justified bla bla bla justified bla bla bla justified bla bla bla justified bla bla bla justified bla bla bla justified bla bla bla justified bla bla bla justified bla bla bla justified bla bla bla justified bla bla bla justified bla bla bla justified bla bla bla justified bla bla bla</p>\r\n<a href=\"http://google.ch\">Link</a>\r\n<p style=\"padding-left: 30px;\">Indented Text</p>\r\n<p style=\"padding-left: 60px;\">More indented Text</p>\r\n\r\n<h2>Lists</h2>\r\n<ul>\r\n	<li>list1</li>\r\n	<li>list2</li>\r\n</ul>\r\n<ol>\r\n	<li>numbered1</li>\r\n	<li>numbered2</li>\r\n</ol>\r\n<blockquote>quote\r\n\r\nquote</blockquote>\r\n<h2>Horizontal Line</h2>\r\n\r\n<hr />\r\n\r\n<h2>Images</h2>\r\n&nbsp;\r\n\r\n[caption id=\"attachment_291\" align=\"aligncenter\" width=\"134\"]<a href=\"http://ogdch.dev/content/uploads/2015/09/liip.png\"><img class=\"wp-image-291\" src=\"http://ogdch.dev/content/uploads/2015/09/liip.png\" alt=\"liip\" width=\"134\" height=\"134\" /></a> Centered Image[/caption]\r\n\r\n<a href=\"http://ogdch.dev/content/uploads/2015/09/liip.png\"><img class=\"alignleft wp-image-291\" src=\"http://ogdch.dev/content/uploads/2015/09/liip.png\" alt=\"liip\" width=\"146\" height=\"146\" /></a>\r\n\r\nLeft aligned Image\r\n\r\nwithout caption\r\n\r\nText zum bild\r\n\r\nmore text\r\n\r\n[caption id=\"attachment_291\" align=\"alignright\" width=\"149\"]<a href=\"http://ogdch.dev/content/uploads/2015/09/liip.png\"><img class=\"wp-image-291\" src=\"http://ogdch.dev/content/uploads/2015/09/liip.png\" alt=\"liip\" width=\"149\" height=\"149\" /></a> Right aligned image[/caption]\r\n<p style=\"text-align: right;\">Text zum bild</p>\r\n<p style=\"text-align: right;\">text zum bild</p>\r\n<p style=\"text-align: right;\">more text</p>\r\n<p style=\"text-align: right;\">more text</p>','Über das Portal','','publish','open','open','','about','','','2015-09-29 14:50:40','2015-09-29 12:50:40','',0,'http://ogdch.dev/?page_id=2',0,'page','',0);
INSERT INTO `ogdch_posts` VALUES (17,1,'2015-05-26 12:29:35','2015-05-26 12:29:35','a:1:{i:0;a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}}','polylang_mo_2','','publish','open','open','','polylang_mo_2','','','2015-05-26 12:29:35','2015-05-26 12:29:35','',0,'http://ogdch.dev/?post_type=polylang_mo&p=17',0,'polylang_mo','',0);
INSERT INTO `ogdch_posts` VALUES (18,1,'2015-05-26 12:29:45','2015-05-26 12:29:45','a:1:{i:0;a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}}','polylang_mo_5','','publish','open','open','','polylang_mo_5','','','2015-05-26 12:29:45','2015-05-26 12:29:45','',0,'http://ogdch.dev/?post_type=polylang_mo&p=18',0,'polylang_mo','',0);
INSERT INTO `ogdch_posts` VALUES (19,1,'2015-05-26 12:29:50','2015-05-26 12:29:50','a:1:{i:0;a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}}','polylang_mo_9','','publish','open','open','','polylang_mo_9','','','2015-05-26 12:29:50','2015-05-26 12:29:50','',0,'http://ogdch.dev/?post_type=polylang_mo&p=19',0,'polylang_mo','',0);
INSERT INTO `ogdch_posts` VALUES (20,1,'2015-05-26 12:29:54','2015-05-26 12:29:54','a:1:{i:0;a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}}','polylang_mo_13','','publish','open','open','','polylang_mo_13','','','2015-05-26 12:29:54','2015-05-26 12:29:54','',0,'http://ogdch.dev/?post_type=polylang_mo&p=20',0,'polylang_mo','',0);
INSERT INTO `ogdch_posts` VALUES (97,1,'2015-06-03 06:50:11','2015-06-02 13:01:41','Content EN','About','','publish','open','open','','about','','','2015-09-23 19:10:37','2015-09-23 17:10:37','',0,'http://ogdch.dev/?page_id=97',0,'page','',0);
INSERT INTO `ogdch_posts` VALUES (98,1,'2015-06-02 13:01:41','2015-06-02 13:01:41','YEAH USA','Sample US','','inherit','open','open','','97-revision-v1','','','2015-06-02 13:01:41','2015-06-02 13:01:41','',97,'http://ogdch.dev/2015/06/02/97-revision-v1/',0,'revision','',0);
INSERT INTO `ogdch_posts` VALUES (102,1,'2015-06-02 13:05:39','2015-06-02 13:05:39','This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\r\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my blog. I live in Los Angeles, have a great dog named Jack, and I like piña coladas. (And gettin\' caught in the rain.)</blockquote>\r\n...or something like this:\r\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\r\nAs a new WordPress user, you should go to <a href=\"http://ogdch.dev/cms/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!','Eine Seite','','inherit','open','open','','2-revision-v1','','','2015-06-02 13:05:39','2015-06-02 13:05:39','',2,'http://ogdch.dev/2015/06/02/2-revision-v1/',0,'revision','',0);
INSERT INTO `ogdch_posts` VALUES (118,1,'2015-06-03 06:50:11','2015-06-03 06:50:03','Content IT','Informazioni','','publish','open','open','','about','','','2015-09-23 19:10:52','2015-09-23 17:10:52','',0,'http://ogdch.dev/?page_id=118',0,'page','',0);
INSERT INTO `ogdch_posts` VALUES (119,1,'2015-06-03 06:50:11','2015-06-03 06:50:11','Content FR','À propos','','publish','open','open','','about','','','2015-09-23 19:11:02','2015-09-23 17:11:02','',0,'http://ogdch.dev/?page_id=119',0,'page','',0);
INSERT INTO `ogdch_posts` VALUES (120,1,'2015-06-03 06:50:03','2015-06-03 06:50:03','','Seite it','','inherit','open','open','','118-revision-v1','','','2015-06-03 06:50:03','2015-06-03 06:50:03','',118,'http://ogdch.dev/2015/06/03/118-revision-v1/',0,'revision','',0);
INSERT INTO `ogdch_posts` VALUES (121,1,'2015-06-03 06:50:11','2015-06-03 06:50:11','','Seite FR','','inherit','open','open','','119-revision-v1','','','2015-06-03 06:50:11','2015-06-03 06:50:11','',119,'http://ogdch.dev/2015/06/03/119-revision-v1/',0,'revision','',0);
INSERT INTO `ogdch_posts` VALUES (126,1,'2015-06-03 06:53:46','2015-06-03 06:53:11','<p><strong>Pellentesque habitant morbi tristique</strong> senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. <em>Aenean ultricies mi vitae est.</em> Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, <code>commodo vitae</code>, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. <a href=\"#\">Donec non enim</a> in turpis pulvinar facilisis. Ut felis.</p>\r\n\r\n<h2>Header Level 2</h2>\r\n	       \r\n<ol>\r\n   <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>\r\n   <li>Aliquam tincidunt mauris eu risus.</li>\r\n</ol>\r\n\r\n<blockquote><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus magna. Cras in mi at felis aliquet congue. Ut a est eget ligula molestie gravida. Curabitur massa. Donec eleifend, libero at sagittis mollis, tellus est malesuada tellus, at luctus turpis elit sit amet quam. Vivamus pretium ornare est.</p></blockquote>\r\n\r\n<h3>Header Level 3</h3>\r\n\r\n<ul>\r\n   <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>\r\n   <li>Aliquam tincidunt mauris eu risus.</li>\r\n</ul>','Blog Beitrag FR','','publish','open','open','','blog-beitrag-fr','','','2015-06-03 06:53:11','2015-06-03 06:53:11','',0,'http://ogdch.dev/?p=126',0,'post','',0);
INSERT INTO `ogdch_posts` VALUES (127,1,'2015-06-03 06:53:11','2015-06-03 06:53:11','<p><strong>Pellentesque habitant morbi tristique</strong> senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. <em>Aenean ultricies mi vitae est.</em> Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, <code>commodo vitae</code>, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. <a href=\"#\">Donec non enim</a> in turpis pulvinar facilisis. Ut felis.</p>\r\n\r\n<h2>Header Level 2</h2>\r\n	       \r\n<ol>\r\n   <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>\r\n   <li>Aliquam tincidunt mauris eu risus.</li>\r\n</ol>\r\n\r\n<blockquote><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus magna. Cras in mi at felis aliquet congue. Ut a est eget ligula molestie gravida. Curabitur massa. Donec eleifend, libero at sagittis mollis, tellus est malesuada tellus, at luctus turpis elit sit amet quam. Vivamus pretium ornare est.</p></blockquote>\r\n\r\n<h3>Header Level 3</h3>\r\n\r\n<ul>\r\n   <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>\r\n   <li>Aliquam tincidunt mauris eu risus.</li>\r\n</ul>','Blog Beitrag FR','','inherit','open','open','','126-revision-v1','','','2015-06-03 06:53:11','2015-06-03 06:53:11','',126,'http://ogdch.dev/2015/06/03/126-revision-v1/',0,'revision','',0);
INSERT INTO `ogdch_posts` VALUES (128,1,'2015-06-03 06:53:46','2015-06-03 06:53:23','<h1>Header one</h1>\r\n<h2>Header two</h2>\r\n<h3>Header three</h3>\r\n<h4>Header four</h4>\r\n<h5>Header five</h5>\r\n<h6>Header six</h6>\r\n<!--more-->\r\n<h2>Blockquotes</h2>\r\nSingle line blockquote:\r\n<blockquote>Stay hungry. Stay foolish.</blockquote>\r\nMulti line blockquote with a cite reference:\r\n<blockquote>People think focus means saying yes to the thing you’ve got to focus on. But that’s not what it means at all. It means saying no to the hundred other good ideas that there are. You have to pick carefully. I’m actually as proud of the things we haven’t done as the things I have done. Innovation is saying no to 1,000 things. <cite>Steve Jobs – Apple Worldwide Developers’ Conference, 1997</cite></blockquote>\r\n<h2>Tables</h2>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<th>Employee</th>\r\n<th class=\"views\">Salary</th>\r\n<th></th>\r\n</tr>\r\n<tr class=\"odd\">\r\n<td><a href=\"http://john.do/\">John Saddington</a></td>\r\n<td>$1</td>\r\n<td>Because that’s all Steve Job’ needed for a salary.</td>\r\n</tr>\r\n<tr class=\"even\">\r\n<td><a href=\"http://tommcfarlin.com/\">Tom McFarlin</a></td>\r\n<td>$100K</td>\r\n<td>For all the blogging he does.</td>\r\n</tr>\r\n<tr class=\"odd\">\r\n<td><a href=\"http://jarederickson.com/\">Jared Erickson</a></td>\r\n<td>$100M</td>\r\n<td>Pictures are worth a thousand words, right? So Tom x 1,000.</td>\r\n</tr>\r\n<tr class=\"even\">\r\n<td><a href=\"http://chrisam.es/\">Chris Ames</a></td>\r\n<td>$100B</td>\r\n<td>With hair like that?! Enough said…</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h2>Definition Lists</h2>\r\n<dl><dt>Definition List Title</dt><dd>Definition list division.</dd><dt>Startup</dt><dd>A startup company or startup is a company or temporary organization designed to search for a repeatable and scalable business model.</dd><dt>#dowork</dt><dd>Coined by Rob Dyrdek and his personal body guard Christopher “Big Black” Boykins, “Do Work” works as a self motivator, to motivating your friends.</dd><dt>Do It Live</dt><dd>I’ll let Bill O’Reilly will <a title=\"We\'ll Do It Live\" href=\"https://www.youtube.com/watch?v=O_HyZ5aW76c\">explain</a> this one.</dd></dl>\r\n<h2>Unordered Lists (Nested)</h2>\r\n<ul>\r\n	<li>List item one\r\n<ul>\r\n	<li>List item one\r\n<ul>\r\n	<li>List item one</li>\r\n	<li>List item two</li>\r\n	<li>List item three</li>\r\n	<li>List item four</li>\r\n</ul>\r\n</li>\r\n	<li>List item two</li>\r\n	<li>List item three</li>\r\n	<li>List item four</li>\r\n</ul>\r\n</li>\r\n	<li>List item two</li>\r\n	<li>List item three</li>\r\n	<li>List item four</li>\r\n</ul>\r\n<h2>Ordered List (Nested)</h2>\r\n<ol>\r\n	<li>List item one\r\n<ol>\r\n	<li>List item one\r\n<ol>\r\n	<li>List item one</li>\r\n	<li>List item two</li>\r\n	<li>List item three</li>\r\n	<li>List item four</li>\r\n</ol>\r\n</li>\r\n	<li>List item two</li>\r\n	<li>List item three</li>\r\n	<li>List item four</li>\r\n</ol>\r\n</li>\r\n	<li>List item two</li>\r\n	<li>List item three</li>\r\n	<li>List item four</li>\r\n</ol>\r\n<h2>HTML Tags</h2>\r\nThese supported tags come from the WordPress.com code <a title=\"Code\" href=\"http://en.support.wordpress.com/code/\">FAQ</a>.\r\n\r\n<strong>Address Tag</strong>\r\n\r\n<address>1 Infinite Loop\r\nCupertino, CA 95014\r\nUnited States</address><strong>Anchor Tag (aka. Link)</strong>\r\n\r\nThis is an example of a <a title=\"Apple\" href=\"http://apple.com\">link</a>.\r\n\r\n<strong>Abbreviation Tag</strong>\r\n\r\nThe abbreviation <abbr title=\"Seriously\">srsly</abbr> stands for “seriously”.\r\n\r\n<strong>Acronym Tag</strong>\r\n\r\nThe acronym <acronym title=\"For The Win\">ftw</acronym> stands for “for the win”.\r\n\r\n<strong>Big Tag</strong>\r\n\r\nThese tests are a <big>big</big> deal, but this tag is no longer supported in HTML5.\r\n\r\n<strong>Cite Tag</strong>\r\n\r\n“Code is poetry.” –<cite>Automattic</cite>\r\n\r\n<strong>Code Tag</strong>\r\n\r\nYou will learn later on in these tests that <code>word-wrap: break-word;</code> will be your best friend.\r\n\r\n<strong>Delete Tag</strong>\r\n\r\nThis tag will let you <del>strikeout text</del>, but this tag is no longer supported in HTML5 (use the <code>&lt;strike&gt;</code> instead).\r\n\r\n<strong>Emphasize Tag</strong>\r\n\r\nThe emphasize tag should <em>italicize</em> text.\r\n\r\n<strong>Insert Tag</strong>\r\n\r\nThis tag should denote <ins>inserted</ins> text.\r\n\r\n<strong>Keyboard Tag</strong>\r\n\r\nThis scarsly known tag emulates <kbd>keyboard text</kbd>, which is usually styled like the <code>&lt;code&gt;</code> tag.\r\n\r\n<strong>Preformatted Tag</strong>\r\n\r\nThis tag styles large blocks of code.\r\n<pre>.post-title {\r\n	margin: 0 0 5px;\r\n	font-weight: bold;\r\n	font-size: 38px;\r\n	line-height: 1.2;\r\n}</pre>\r\n<strong>Quote Tag</strong>\r\n\r\n<q>Developers, developers, developers…</q> –Steve Ballmer\r\n\r\n<strong>Strong Tag</strong>\r\n\r\nThis tag shows <strong>bold<strong> text.</strong></strong>\r\n\r\n<strong>Subscript Tag</strong>\r\n\r\nGetting our science styling on with H<sub>2</sub>O, which should push the “2″ down.\r\n\r\n<strong>Superscript Tag</strong>\r\n\r\nStill sticking with science and Albert Einstein’s E = MC<sup>2</sup>, which should lift the “2″ up.\r\n\r\n<strong>Teletype Tag</strong>\r\n\r\nThis rarely used tag emulates <tt>teletype text</tt>, which is usually styled like the <code>&lt;code&gt;</code> tag.\r\n\r\n<strong>Variable Tag</strong>\r\n\r\nThis allows you to denote <var>variables</var>.','Html Test','','publish','open','open','','html-test','','','2015-06-04 09:12:30','2015-06-04 09:12:30','',0,'http://ogdch.dev/?p=128',0,'post','',1);
INSERT INTO `ogdch_posts` VALUES (129,1,'2015-06-03 06:53:23','2015-06-03 06:53:23','<p><strong>Pellentesque habitant morbi tristique</strong> senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. <em>Aenean ultricies mi vitae est.</em> Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, <code>commodo vitae</code>, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. <a href=\"#\">Donec non enim</a> in turpis pulvinar facilisis. Ut felis.</p>\r\n\r\n<h2>Header Level 2</h2>\r\n	       \r\n<ol>\r\n   <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>\r\n   <li>Aliquam tincidunt mauris eu risus.</li>\r\n</ol>\r\n\r\n<blockquote><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus magna. Cras in mi at felis aliquet congue. Ut a est eget ligula molestie gravida. Curabitur massa. Donec eleifend, libero at sagittis mollis, tellus est malesuada tellus, at luctus turpis elit sit amet quam. Vivamus pretium ornare est.</p></blockquote>\r\n\r\n<h3>Header Level 3</h3>\r\n\r\n<ul>\r\n   <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>\r\n   <li>Aliquam tincidunt mauris eu risus.</li>\r\n</ul>','Block CH','','inherit','open','open','','128-revision-v1','','','2015-06-03 06:53:23','2015-06-03 06:53:23','',128,'http://ogdch.dev/2015/06/03/128-revision-v1/',0,'revision','',0);
INSERT INTO `ogdch_posts` VALUES (130,1,'2015-06-03 06:53:46','2015-06-03 06:53:34','<p><strong>Pellentesque habitant morbi tristique</strong> senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. <em>Aenean ultricies mi vitae est.</em> Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, <code>commodo vitae</code>, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. <a href=\"#\">Donec non enim</a> in turpis pulvinar facilisis. Ut felis.</p>\r\n\r\n<h2>Header Level 2</h2>\r\n	       \r\n<ol>\r\n   <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>\r\n   <li>Aliquam tincidunt mauris eu risus.</li>\r\n</ol>\r\n\r\n<blockquote><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus magna. Cras in mi at felis aliquet congue. Ut a est eget ligula molestie gravida. Curabitur massa. Donec eleifend, libero at sagittis mollis, tellus est malesuada tellus, at luctus turpis elit sit amet quam. Vivamus pretium ornare est.</p></blockquote>\r\n\r\n<h3>Header Level 3</h3>\r\n\r\n<ul>\r\n   <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>\r\n   <li>Aliquam tincidunt mauris eu risus.</li>\r\n</ul>','Blog Post US','','publish','open','open','','blog-post-us','','','2015-06-03 06:53:34','2015-06-03 06:53:34','',0,'http://ogdch.dev/?p=130',0,'post','',0);
INSERT INTO `ogdch_posts` VALUES (131,1,'2015-06-03 06:53:34','2015-06-03 06:53:34','<p><strong>Pellentesque habitant morbi tristique</strong> senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. <em>Aenean ultricies mi vitae est.</em> Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, <code>commodo vitae</code>, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. <a href=\"#\">Donec non enim</a> in turpis pulvinar facilisis. Ut felis.</p>\r\n\r\n<h2>Header Level 2</h2>\r\n	       \r\n<ol>\r\n   <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>\r\n   <li>Aliquam tincidunt mauris eu risus.</li>\r\n</ol>\r\n\r\n<blockquote><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus magna. Cras in mi at felis aliquet congue. Ut a est eget ligula molestie gravida. Curabitur massa. Donec eleifend, libero at sagittis mollis, tellus est malesuada tellus, at luctus turpis elit sit amet quam. Vivamus pretium ornare est.</p></blockquote>\r\n\r\n<h3>Header Level 3</h3>\r\n\r\n<ul>\r\n   <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>\r\n   <li>Aliquam tincidunt mauris eu risus.</li>\r\n</ul>','Blog Post US','','inherit','open','open','','130-revision-v1','','','2015-06-03 06:53:34','2015-06-03 06:53:34','',130,'http://ogdch.dev/2015/06/03/130-revision-v1/',0,'revision','',0);
INSERT INTO `ogdch_posts` VALUES (132,1,'2015-06-03 06:53:46','2015-06-03 06:53:46','<p><strong>Pellentesque habitant morbi tristique</strong> senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. <em>Aenean ultricies mi vitae est.</em> Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, <code>commodo vitae</code>, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. <a href=\"#\">Donec non enim</a> in turpis pulvinar facilisis. Ut felis.</p>\r\n\r\n<h2>Header Level 2</h2>\r\n	       \r\n<ol>\r\n   <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>\r\n   <li>Aliquam tincidunt mauris eu risus.</li>\r\n</ol>\r\n\r\n<blockquote><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus magna. Cras in mi at felis aliquet congue. Ut a est eget ligula molestie gravida. Curabitur massa. Donec eleifend, libero at sagittis mollis, tellus est malesuada tellus, at luctus turpis elit sit amet quam. Vivamus pretium ornare est.</p></blockquote>\r\n\r\n<h3>Header Level 3</h3>\r\n\r\n<ul>\r\n   <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>\r\n   <li>Aliquam tincidunt mauris eu risus.</li>\r\n</ul>','Blog It','','publish','open','open','','blog-it','','','2015-06-03 06:53:46','2015-06-03 06:53:46','',0,'http://ogdch.dev/?p=132',0,'post','',0);
INSERT INTO `ogdch_posts` VALUES (133,1,'2015-06-03 06:53:46','2015-06-03 06:53:46','<p><strong>Pellentesque habitant morbi tristique</strong> senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. <em>Aenean ultricies mi vitae est.</em> Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, <code>commodo vitae</code>, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. <a href=\"#\">Donec non enim</a> in turpis pulvinar facilisis. Ut felis.</p>\r\n\r\n<h2>Header Level 2</h2>\r\n	       \r\n<ol>\r\n   <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>\r\n   <li>Aliquam tincidunt mauris eu risus.</li>\r\n</ol>\r\n\r\n<blockquote><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus magna. Cras in mi at felis aliquet congue. Ut a est eget ligula molestie gravida. Curabitur massa. Donec eleifend, libero at sagittis mollis, tellus est malesuada tellus, at luctus turpis elit sit amet quam. Vivamus pretium ornare est.</p></blockquote>\r\n\r\n<h3>Header Level 3</h3>\r\n\r\n<ul>\r\n   <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>\r\n   <li>Aliquam tincidunt mauris eu risus.</li>\r\n</ul>','Blog It','','inherit','open','open','','132-revision-v1','','','2015-06-03 06:53:46','2015-06-03 06:53:46','',132,'http://ogdch.dev/2015/06/03/132-revision-v1/',0,'revision','',0);
INSERT INTO `ogdch_posts` VALUES (142,1,'2015-06-03 12:51:07','2015-06-03 12:51:07','','Mein Datensatz','','publish','open','open','','mein-datensatz-2','','','2015-06-03 12:51:07','2015-06-03 12:51:07','',0,'http:/dataset/mein-datensatz-2/',0,'ckan-dataset','',1);
INSERT INTO `ogdch_posts` VALUES (144,1,'2015-06-04 09:21:47','2015-06-03 13:09:35','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas maximus egestas turpis. Nunc a ligula porta, auctor justo in, sodales ante. In at nulla ac massa mollis finibus in at nibh. Phasellus ut condimentum magna. Phasellus ut dui sem. Sed justo nulla, elementum vitae nibh eu, feugiat accumsan risus. Sed rhoncus sed elit et gravida. Sed convallis eros justo, eu tempus enim facilisis non. Nulla facilisi. Suspendisse lectus nulla, dapibus eu cursus sed, aliquam id ligula.<!--more-->\r\n\r\nQuisque sagittis lectus sed dolor feugiat, at accumsan dui vulputate. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Maecenas in laoreet odio. Curabitur cursus ac metus ac vulputate. Nulla ac ultricies metus, et tristique est. Nulla lobortis nibh in eleifend suscipit. Quisque varius pellentesque pellentesque. Vivamus in arcu et est porttitor mollis at at turpis. Vestibulum dapibus venenatis quam, vitae bibendum mi tincidunt ut. Donec consectetur dolor eget quam pellentesque, ut ornare eros convallis. Pellentesque accumsan quis enim ut porta. Sed viverra, ligula non egestas feugiat, quam diam scelerisque lorem, mollis feugiat elit lorem in ante.\r\n\r\nPraesent tristique elit nisi, ut aliquet dui porttitor in. Donec non dignissim leo. Ut feugiat dolor et ex pulvinar, sed imperdiet lectus commodo. Proin ut leo mollis diam commodo eleifend. Sed condimentum luctus euismod. Pellentesque eget nibh elit. Nulla facilisi. Aliquam non enim non leo hendrerit aliquet. Duis suscipit in quam quis accumsan.\r\n\r\nUt luctus metus nec nisi convallis volutpat. Aenean semper malesuada rhoncus. Phasellus porta a leo id porta. In rutrum pharetra tincidunt. Pellentesque sed enim vitae mauris ullamcorper ultrices. Nulla venenatis sapien a porttitor semper. Nulla blandit elementum nisi a bibendum. Praesent rutrum tristique ipsum a finibus. Fusce quis urna ligula. Phasellus eu tempus orci.\r\n\r\nFusce tristique lobortis justo quis feugiat. Duis non mi suscipit, venenatis nibh eu, scelerisque ligula. Aliquam ac placerat nibh, a ultricies tellus. Aenean ut aliquam nisl. Fusce aliquet dolor eu commodo vehicula. Sed consectetur consequat volutpat. Donec odio libero, mattis non dolor eu, maximus feugiat orci. Aenean ut arcu quis felis tincidunt blandit. Vivamus pretium nisi non diam finibus, non maximus magna pharetra. Vivamus scelerisque, nulla in scelerisque tempus, dolor urna placerat diam, a tincidunt est diam sit amet dui. Fusce volutpat mi ligula, id pretium ipsum tincidunt a. Mauris in rutrum ligula. Sed nec elementum mauris, non egestas augue. Praesent aliquet, felis vitae ultricies venenatis, risus nunc sollicitudin arcu, sit amet ultrices nunc felis non dolor. Donec nec massa ut nisi dictum pellentesque.\r\n\r\n<span style=\"line-height: 1.5;\">lient together.</span>','Bild Ausrichtungen','','publish','open','open','','image-alignment','','','2015-06-04 09:22:21','2015-06-04 09:22:21','',0,'http://ogdch.dev/?p=144',0,'post','',0);
INSERT INTO `ogdch_posts` VALUES (145,1,'2015-06-03 13:09:35','2015-06-03 13:09:35','gibhi','ffugug','','inherit','open','open','','144-revision-v1','','','2015-06-03 13:09:35','2015-06-03 13:09:35','',144,'http://ogdch.dev/2015/06/144-revision-v1/',0,'revision','',0);
INSERT INTO `ogdch_posts` VALUES (146,1,'2015-06-03 14:24:23','2015-06-03 14:24:23','','ewqfqfewfqw','','publish','open','open','','ewqfqfewfqw','','','2015-06-03 14:24:23','2015-06-03 14:24:23','',0,'http://ogdch.dev/?post_type=ckan-dataset&#038;p=146',0,'ckan-dataset','',0);
INSERT INTO `ogdch_posts` VALUES (148,1,'2015-06-04 09:05:28','2015-06-04 09:05:28','The foundation of these tests are derived from <a title=\"Theme Unit Test\" href=\"http://codex.wordpress.org/Theme_Unit_Test\" target=\"_blank\">WordPress’ Theme Unit Test Codex</a> data. It’s paired with lessons learned from over three years of theme and plugin support, and baffling corner cases, to create a potent cocktail of simulated, quirky user content.\r\n\r\nThe word “comprehensive” was purposely left off this description. It’s not. There will always be something new squarely scenario to test. That’s where you come in. <a title=\"Contact\" href=\"http://wptest.io/contact/\">Let us know</a> of a test we’re not covering. We’d love to squash it.\r\n\r\nLet’s make WordPress testing easier and resilient together.','Image Alignment','','inherit','open','open','','144-revision-v1','','','2015-06-04 09:05:28','2015-06-04 09:05:28','',144,'http://ogdch.dev/blog/2015/06/144-revision-v1/',0,'revision','',0);
INSERT INTO `ogdch_posts` VALUES (149,1,'2015-06-04 09:19:53','2015-06-04 09:11:43','<h3>Default</h3>\r\nThis is a paragraph. It should not have any alignment of any kind. It should just flow like you would normally expect. Nothing fancy. Just straight up text, free flowing, with love. Completely neutral and not picking a side or sitting on the fence. It just is. It just freaking is. It likes where it is. It does not feel compelled to pick a side. Leave him be. It will just be better that way. Trust me.<!--more-->\r\n<h3>Left Align</h3>\r\nThis is a paragraph. It is left aligned. Because of this, it is a bit more liberal in it’s views. It’s favorite color is green. Left align tends to be more eco-friendly, but it provides no concrete evidence that it really is. Even though it likes share the wealth evenly, it leaves the equal distribution up to justified alignment.\r\n<h3>Center Align</h3>\r\nThis is a paragraph. It is center aligned. Center is, but nature, a fence sitter. A flip flopper. It has a difficult time making up its mind. It wants to pick a side. Really, it does. It has the best intentions, but it tends to complicate matters more than help. The best you can do is try to win it over and hope for the best. I hear center align does take bribes.\r\n<h3>Right Align</h3>\r\nThis is a paragraph. It is right aligned. It is a bit more conservative in it’s views. It’s prefers to not be told what to do or how to do it. Right align totally owns a slew of guns and loves to head to the range for some practice. Which is cool and all. I mean, it’s a pretty good shot from at least four or five football fields away. Dead on. So boss.\r\n<h3>Justify Align</h3>\r\nThis is a paragraph. It is justify aligned. It gets really mad when people associate it with Justin Timberlake. Typically, justified is pretty straight laced. It likes everything to be in it’s place and not all cattywampus like the rest of the aligns. I am not saying that makes it better than the rest of the aligns, but it does tend to put off more of an elitist attitude.','Text Formatierungen','','publish','open','open','','text-formatierungen','','','2015-06-04 09:18:30','2015-06-04 09:18:30','',0,'http://ogdch.dev/?p=149',0,'post','',0);
INSERT INTO `ogdch_posts` VALUES (150,1,'2015-06-04 09:19:53','2015-06-04 09:18:13','<h3>Default</h3>\r\nThis is a paragraph. It should not have any alignment of any kind. It should just flow like you would normally expect. Nothing fancy. Just straight up text, free flowing, with love. Completely neutral and not picking a side or sitting on the fence. It just is. It just freaking is. It likes where it is. It does not feel compelled to pick a side. Leave him be. It will just be better that way. Trust me.<!--more-->\r\n<h3>Left Align</h3>\r\nThis is a paragraph. It is left aligned. Because of this, it is a bit more liberal in it’s views. It’s favorite color is green. Left align tends to be more eco-friendly, but it provides no concrete evidence that it really is. Even though it likes share the wealth evenly, it leaves the equal distribution up to justified alignment.\r\n<h3>Center Align</h3>\r\nThis is a paragraph. It is center aligned. Center is, but nature, a fence sitter. A flip flopper. It has a difficult time making up its mind. It wants to pick a side. Really, it does. It has the best intentions, but it tends to complicate matters more than help. The best you can do is try to win it over and hope for the best. I hear center align does take bribes.\r\n<h3>Right Align</h3>\r\nThis is a paragraph. It is right aligned. It is a bit more conservative in it’s views. It’s prefers to not be told what to do or how to do it. Right align totally owns a slew of guns and loves to head to the range for some practice. Which is cool and all. I mean, it’s a pretty good shot from at least four or five football fields away. Dead on. So boss.\r\n<h3>Justify Align</h3>\r\nThis is a paragraph. It is justify aligned. It gets really mad when people associate it with Justin Timberlake. Typically, justified is pretty straight laced. It likes everything to be in it’s place and not all cattywampus like the rest of the aligns. I am not saying that makes it better than the rest of the aligns, but it does tend to put off more of an elitist attitude.','Text Alignment','','publish','open','open','','text-alignment','','','2015-06-04 09:18:13','2015-06-04 09:18:13','',0,'http://ogdch.dev/?p=150',0,'post','',0);
INSERT INTO `ogdch_posts` VALUES (151,1,'2015-06-04 09:19:53','2015-06-04 09:19:23','<h3>Default</h3>\r\nThis is a paragraph. It should not have any alignment of any kind. It should just flow like you would normally expect. Nothing fancy. Just straight up text, free flowing, with love. Completely neutral and not picking a side or sitting on the fence. It just is. It just freaking is. It likes where it is. It does not feel compelled to pick a side. Leave him be. It will just be better that way. Trust me.<!--more-->\r\n<h3>Left Align</h3>\r\nThis is a paragraph. It is left aligned. Because of this, it is a bit more liberal in it’s views. It’s favorite color is green. Left align tends to be more eco-friendly, but it provides no concrete evidence that it really is. Even though it likes share the wealth evenly, it leaves the equal distribution up to justified alignment.\r\n<h3>Center Align</h3>\r\nThis is a paragraph. It is center aligned. Center is, but nature, a fence sitter. A flip flopper. It has a difficult time making up its mind. It wants to pick a side. Really, it does. It has the best intentions, but it tends to complicate matters more than help. The best you can do is try to win it over and hope for the best. I hear center align does take bribes.\r\n<h3>Right Align</h3>\r\nThis is a paragraph. It is right aligned. It is a bit more conservative in it’s views. It’s prefers to not be told what to do or how to do it. Right align totally owns a slew of guns and loves to head to the range for some practice. Which is cool and all. I mean, it’s a pretty good shot from at least four or five football fields away. Dead on. So boss.\r\n<h3>Justify Align</h3>\r\nThis is a paragraph. It is justify aligned. It gets really mad when people associate it with Justin Timberlake. Typically, justified is pretty straight laced. It likes everything to be in it’s place and not all cattywampus like the rest of the aligns. I am not saying that makes it better than the rest of the aligns, but it does tend to put off more of an elitist attitude.\r\n\r\nen','formattazione del testo','','publish','open','open','','formattazione-del-testo','','','2015-06-04 09:19:23','2015-06-04 09:19:23','',0,'http://ogdch.dev/?p=151',0,'post','',0);
INSERT INTO `ogdch_posts` VALUES (152,1,'2015-06-04 09:19:53','2015-06-04 09:19:53','<h3>Default</h3>\r\nThis is a paragraph. It should not have any alignment of any kind. It should just flow like you would normally expect. Nothing fancy. Just straight up text, free flowing, with love. Completely neutral and not picking a side or sitting on the fence. It just is. It just freaking is. It likes where it is. It does not feel compelled to pick a side. Leave him be. It will just be better that way. Trust me.<!--more-->\r\n<h3>Left Align</h3>\r\nThis is a paragraph. It is left aligned. Because of this, it is a bit more liberal in it’s views. It’s favorite color is green. Left align tends to be more eco-friendly, but it provides no concrete evidence that it really is. Even though it likes share the wealth evenly, it leaves the equal distribution up to justified alignment.\r\n<h3>Center Align</h3>\r\nThis is a paragraph. It is center aligned. Center is, but nature, a fence sitter. A flip flopper. It has a difficult time making up its mind. It wants to pick a side. Really, it does. It has the best intentions, but it tends to complicate matters more than help. The best you can do is try to win it over and hope for the best. I hear center align does take bribes.\r\n<h3>Right Align</h3>\r\nThis is a paragraph. It is right aligned. It is a bit more conservative in it’s views. It’s prefers to not be told what to do or how to do it. Right align totally owns a slew of guns and loves to head to the range for some practice. Which is cool and all. I mean, it’s a pretty good shot from at least four or five football fields away. Dead on. So boss.\r\n<h3>Justify Align</h3>\r\nThis is a paragraph. It is justify aligned. It gets really mad when people associate it with Justin Timberlake. Typically, justified is pretty straight laced. It likes everything to be in it’s place and not all cattywampus like the rest of the aligns. I am not saying that makes it better than the rest of the aligns, but it does tend to put off more of an elitist attitude.','le formatage du texte','','publish','open','open','','le-formatage-du-texte','','','2015-06-04 09:19:53','2015-06-04 09:19:53','',0,'http://ogdch.dev/?p=152',0,'post','',0);
INSERT INTO `ogdch_posts` VALUES (153,1,'2015-06-04 09:21:51','2015-06-04 09:22:05','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas maximus egestas turpis. Nunc a ligula porta, auctor justo in, sodales ante. In at nulla ac massa mollis finibus in at nibh. Phasellus ut condimentum magna. Phasellus ut dui sem. Sed justo nulla, elementum vitae nibh eu, feugiat accumsan risus. Sed rhoncus sed elit et gravida. Sed convallis eros justo, eu tempus enim facilisis non. Nulla facilisi. Suspendisse lectus nulla, dapibus eu cursus sed, aliquam id ligula.<!--more-->\r\n\r\nQuisque sagittis lectus sed dolor feugiat, at accumsan dui vulputate. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Maecenas in laoreet odio. Curabitur cursus ac metus ac vulputate. Nulla ac ultricies metus, et tristique est. Nulla lobortis nibh in eleifend suscipit. Quisque varius pellentesque pellentesque. Vivamus in arcu et est porttitor mollis at at turpis. Vestibulum dapibus venenatis quam, vitae bibendum mi tincidunt ut. Donec consectetur dolor eget quam pellentesque, ut ornare eros convallis. Pellentesque accumsan quis enim ut porta. Sed viverra, ligula non egestas feugiat, quam diam scelerisque lorem, mollis feugiat elit lorem in ante.\r\n\r\nPraesent tristique elit nisi, ut aliquet dui porttitor in. Donec non dignissim leo. Ut feugiat dolor et ex pulvinar, sed imperdiet lectus commodo. Proin ut leo mollis diam commodo eleifend. Sed condimentum luctus euismod. Pellentesque eget nibh elit. Nulla facilisi. Aliquam non enim non leo hendrerit aliquet. Duis suscipit in quam quis accumsan.\r\n\r\nUt luctus metus nec nisi convallis volutpat. Aenean semper malesuada rhoncus. Phasellus porta a leo id porta. In rutrum pharetra tincidunt. Pellentesque sed enim vitae mauris ullamcorper ultrices. Nulla venenatis sapien a porttitor semper. Nulla blandit elementum nisi a bibendum. Praesent rutrum tristique ipsum a finibus. Fusce quis urna ligula. Phasellus eu tempus orci.\r\n\r\nFusce tristique lobortis justo quis feugiat. Duis non mi suscipit, venenatis nibh eu, scelerisque ligula. Aliquam ac placerat nibh, a ultricies tellus. Aenean ut aliquam nisl. Fusce aliquet dolor eu commodo vehicula. Sed consectetur consequat volutpat. Donec odio libero, mattis non dolor eu, maximus feugiat orci. Aenean ut arcu quis felis tincidunt blandit. Vivamus pretium nisi non diam finibus, non maximus magna pharetra. Vivamus scelerisque, nulla in scelerisque tempus, dolor urna placerat diam, a tincidunt est diam sit amet dui. Fusce volutpat mi ligula, id pretium ipsum tincidunt a. Mauris in rutrum ligula. Sed nec elementum mauris, non egestas augue. Praesent aliquet, felis vitae ultricies venenatis, risus nunc sollicitudin arcu, sit amet ultrices nunc felis non dolor. Donec nec massa ut nisi dictum pellentesque.','Image Test','','publish','open','open','','image-test','','','2015-06-04 09:22:31','2015-06-04 09:22:31','',0,'http://ogdch.dev/?p=153',0,'post','',0);
INSERT INTO `ogdch_posts` VALUES (154,1,'2015-06-04 09:21:47','2015-06-04 09:21:47','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas maximus egestas turpis. Nunc a ligula porta, auctor justo in, sodales ante. In at nulla ac massa mollis finibus in at nibh. Phasellus ut condimentum magna. Phasellus ut dui sem. Sed justo nulla, elementum vitae nibh eu, feugiat accumsan risus. Sed rhoncus sed elit et gravida. Sed convallis eros justo, eu tempus enim facilisis non. Nulla facilisi. Suspendisse lectus nulla, dapibus eu cursus sed, aliquam id ligula.<!--more-->\r\n\r\nQuisque sagittis lectus sed dolor feugiat, at accumsan dui vulputate. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Maecenas in laoreet odio. Curabitur cursus ac metus ac vulputate. Nulla ac ultricies metus, et tristique est. Nulla lobortis nibh in eleifend suscipit. Quisque varius pellentesque pellentesque. Vivamus in arcu et est porttitor mollis at at turpis. Vestibulum dapibus venenatis quam, vitae bibendum mi tincidunt ut. Donec consectetur dolor eget quam pellentesque, ut ornare eros convallis. Pellentesque accumsan quis enim ut porta. Sed viverra, ligula non egestas feugiat, quam diam scelerisque lorem, mollis feugiat elit lorem in ante.\r\n\r\nPraesent tristique elit nisi, ut aliquet dui porttitor in. Donec non dignissim leo. Ut feugiat dolor et ex pulvinar, sed imperdiet lectus commodo. Proin ut leo mollis diam commodo eleifend. Sed condimentum luctus euismod. Pellentesque eget nibh elit. Nulla facilisi. Aliquam non enim non leo hendrerit aliquet. Duis suscipit in quam quis accumsan.\r\n\r\nUt luctus metus nec nisi convallis volutpat. Aenean semper malesuada rhoncus. Phasellus porta a leo id porta. In rutrum pharetra tincidunt. Pellentesque sed enim vitae mauris ullamcorper ultrices. Nulla venenatis sapien a porttitor semper. Nulla blandit elementum nisi a bibendum. Praesent rutrum tristique ipsum a finibus. Fusce quis urna ligula. Phasellus eu tempus orci.\r\n\r\nFusce tristique lobortis justo quis feugiat. Duis non mi suscipit, venenatis nibh eu, scelerisque ligula. Aliquam ac placerat nibh, a ultricies tellus. Aenean ut aliquam nisl. Fusce aliquet dolor eu commodo vehicula. Sed consectetur consequat volutpat. Donec odio libero, mattis non dolor eu, maximus feugiat orci. Aenean ut arcu quis felis tincidunt blandit. Vivamus pretium nisi non diam finibus, non maximus magna pharetra. Vivamus scelerisque, nulla in scelerisque tempus, dolor urna placerat diam, a tincidunt est diam sit amet dui. Fusce volutpat mi ligula, id pretium ipsum tincidunt a. Mauris in rutrum ligula. Sed nec elementum mauris, non egestas augue. Praesent aliquet, felis vitae ultricies venenatis, risus nunc sollicitudin arcu, sit amet ultrices nunc felis non dolor. Donec nec massa ut nisi dictum pellentesque.','Allineamento Immagine','','publish','open','open','','allineamento-immagine','','','2015-06-04 09:22:41','2015-06-04 09:22:41','',0,'http://ogdch.dev/?p=154',0,'post','',0);
INSERT INTO `ogdch_posts` VALUES (155,1,'2015-06-04 09:21:51','2015-06-04 09:21:51','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas maximus egestas turpis. Nunc a ligula porta, auctor justo in, sodales ante. In at nulla ac massa mollis finibus in at nibh. Phasellus ut condimentum magna. Phasellus ut dui sem. Sed justo nulla, elementum vitae nibh eu, feugiat accumsan risus. Sed rhoncus sed elit et gravida. Sed convallis eros justo, eu tempus enim facilisis non. Nulla facilisi. Suspendisse lectus nulla, dapibus eu cursus sed, aliquam id ligula.<!--more-->\r\n\r\nQuisque sagittis lectus sed dolor feugiat, at accumsan dui vulputate. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Maecenas in laoreet odio. Curabitur cursus ac metus ac vulputate. Nulla ac ultricies metus, et tristique est. Nulla lobortis nibh in eleifend suscipit. Quisque varius pellentesque pellentesque. Vivamus in arcu et est porttitor mollis at at turpis. Vestibulum dapibus venenatis quam, vitae bibendum mi tincidunt ut. Donec consectetur dolor eget quam pellentesque, ut ornare eros convallis. Pellentesque accumsan quis enim ut porta. Sed viverra, ligula non egestas feugiat, quam diam scelerisque lorem, mollis feugiat elit lorem in ante.\r\n\r\nPraesent tristique elit nisi, ut aliquet dui porttitor in. Donec non dignissim leo. Ut feugiat dolor et ex pulvinar, sed imperdiet lectus commodo. Proin ut leo mollis diam commodo eleifend. Sed condimentum luctus euismod. Pellentesque eget nibh elit. Nulla facilisi. Aliquam non enim non leo hendrerit aliquet. Duis suscipit in quam quis accumsan.\r\n\r\nUt luctus metus nec nisi convallis volutpat. Aenean semper malesuada rhoncus. Phasellus porta a leo id porta. In rutrum pharetra tincidunt. Pellentesque sed enim vitae mauris ullamcorper ultrices. Nulla venenatis sapien a porttitor semper. Nulla blandit elementum nisi a bibendum. Praesent rutrum tristique ipsum a finibus. Fusce quis urna ligula. Phasellus eu tempus orci.\r\n\r\nFusce tristique lobortis justo quis feugiat. Duis non mi suscipit, venenatis nibh eu, scelerisque ligula. Aliquam ac placerat nibh, a ultricies tellus. Aenean ut aliquam nisl. Fusce aliquet dolor eu commodo vehicula. Sed consectetur consequat volutpat. Donec odio libero, mattis non dolor eu, maximus feugiat orci. Aenean ut arcu quis felis tincidunt blandit. Vivamus pretium nisi non diam finibus, non maximus magna pharetra. Vivamus scelerisque, nulla in scelerisque tempus, dolor urna placerat diam, a tincidunt est diam sit amet dui. Fusce volutpat mi ligula, id pretium ipsum tincidunt a. Mauris in rutrum ligula. Sed nec elementum mauris, non egestas augue. Praesent aliquet, felis vitae ultricies venenatis, risus nunc sollicitudin arcu, sit amet ultrices nunc felis non dolor. Donec nec massa ut nisi dictum pellentesque.','Alignement de l\'image','','publish','open','open','','alignement-de-limage','','','2015-06-04 09:22:36','2015-06-04 09:22:36','',0,'http://ogdch.dev/?p=155',0,'post','',0);
INSERT INTO `ogdch_posts` VALUES (164,1,'2015-08-25 13:27:36','2015-08-25 13:27:23','','FAQ','','publish','open','open','','faq','','','2015-08-25 13:27:23','2015-08-25 13:27:23','',0,'http://ogdch.dev/?page_id=164',0,'page','',0);
INSERT INTO `ogdch_posts` VALUES (165,1,'2015-08-25 13:27:36','2015-08-25 13:27:28','','FAQ','','publish','open','open','','faq','','','2015-08-25 13:27:28','2015-08-25 13:27:28','',0,'http://ogdch.dev/?page_id=165',0,'page','',0);
INSERT INTO `ogdch_posts` VALUES (166,1,'2015-08-25 13:27:36','2015-08-25 13:27:32','','FAQ','','publish','open','open','','faq','','','2015-08-25 13:27:32','2015-08-25 13:27:32','',0,'http://ogdch.dev/?page_id=166',0,'page','',0);
INSERT INTO `ogdch_posts` VALUES (167,1,'2015-08-25 13:27:36','2015-08-25 13:27:36','','FAQ','','publish','open','open','','faq','','','2015-08-25 13:27:36','2015-08-25 13:27:36','',0,'http://ogdch.dev/?page_id=167',0,'page','',0);
INSERT INTO `ogdch_posts` VALUES (172,1,'2015-08-25 13:28:47','2015-08-25 13:28:47',' ','','','publish','open','closed','','172','','','2015-10-27 16:11:48','2015-10-27 15:11:48','',0,'http://ogdch.dev/?p=172',5,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (180,1,'2015-08-25 13:29:40','2015-08-25 13:29:40',' ','','','publish','open','closed','','180','','','2015-10-27 16:09:03','2015-10-27 15:09:03','',0,'http://ogdch.dev/?p=180',5,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (184,1,'2015-08-25 13:30:05','2015-08-25 13:30:05',' ','','','publish','open','closed','','184','','','2015-10-27 16:10:52','2015-10-27 15:10:52','',0,'http://ogdch.dev/?p=184',5,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (188,1,'2015-08-25 13:30:42','2015-08-25 13:30:42',' ','','','publish','open','closed','','188','','','2015-10-27 16:10:06','2015-10-27 15:10:06','',0,'http://ogdch.dev/?p=188',5,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (192,1,'2015-08-25 13:46:47','2015-08-25 13:46:47','','Population','','publish','closed','closed','','population','','','2015-10-14 11:55:00','2015-10-14 09:55:00','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=192',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (193,1,'2015-08-25 13:48:07','2015-08-25 13:48:07','','Territory','','publish','closed','closed','','territory','','','2015-10-14 11:54:51','2015-10-14 09:54:51','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=193',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (194,1,'2015-08-25 13:48:42','2015-08-25 13:48:42','','Swisstopo','','publish','closed','closed','','swisstopo','','','2015-10-14 11:51:33','2015-10-14 09:51:33','',0,'http://ogdch.dev/?post_type=ckan-local-org&#038;p=194',0,'ckan-local-org','',0);
INSERT INTO `ogdch_posts` VALUES (195,1,'2015-08-25 13:54:54','2015-08-25 13:53:35','Beschreibung DE','TopoApp','','publish','closed','closed','','topoapp','','','2015-10-13 08:25:43','2015-10-13 06:25:43','',0,'http://ogdch.dev/?post_type=app&#038;p=195',0,'app','',0);
INSERT INTO `ogdch_posts` VALUES (196,1,'2015-08-25 13:54:54','2015-08-25 13:54:05','Description EN','TopoApp','','publish','closed','closed','','topoapp','','','2015-10-13 08:25:53','2015-10-13 06:25:53','',0,'http://ogdch.dev/?post_type=app&#038;p=196',0,'app','',0);
INSERT INTO `ogdch_posts` VALUES (197,1,'2015-08-25 13:54:54','2015-08-25 13:54:31','Description IT','TopoApp','','publish','closed','closed','','topoapp','','','2015-10-13 08:26:03','2015-10-13 06:26:03','',0,'http://ogdch.dev/?post_type=app&#038;p=197',0,'app','',0);
INSERT INTO `ogdch_posts` VALUES (198,1,'2015-08-25 13:54:54','2015-08-25 13:54:54','Description FR','TopoApp','','publish','closed','closed','','topoapp','','','2015-10-13 08:26:17','2015-10-13 06:26:17','',0,'http://ogdch.dev/?post_type=app&#038;p=198',0,'app','',0);
INSERT INTO `ogdch_posts` VALUES (199,1,'2015-08-25 13:57:39','2015-08-25 13:57:39','','Work','','publish','closed','closed','','work','','','2015-10-14 11:54:45','2015-10-14 09:54:45','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=199',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (200,1,'2015-08-25 13:58:13','2015-08-25 13:58:13','','Construction','','publish','closed','closed','','construction','','','2015-10-14 11:54:38','2015-10-14 09:54:38','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=200',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (201,1,'2015-08-25 13:58:47','2015-08-25 13:58:47','','Education','','publish','closed','closed','','education','','','2015-10-14 11:54:31','2015-10-14 09:54:31','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=201',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (202,1,'2015-08-25 13:59:26','2015-08-25 13:59:26','','Energy','','publish','closed','closed','','energy','','','2015-10-14 11:54:25','2015-10-14 09:54:25','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=202',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (203,1,'2015-08-25 13:59:54','2015-08-25 13:59:54','','Finances','','publish','closed','closed','','finances','','','2015-10-14 11:54:18','2015-10-14 09:54:18','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=203',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (204,1,'2015-08-25 14:00:19','2015-08-25 14:00:19','','Geography','','publish','closed','closed','','geography','','','2015-10-14 11:54:12','2015-10-14 09:54:12','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=204',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (205,1,'2015-08-25 14:00:47','2015-08-25 14:00:47','','Legislation','','publish','closed','closed','','legislation','','','2015-10-28 08:47:17','2015-10-28 07:47:17','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=205',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (206,1,'2015-08-25 14:01:17','2015-08-25 14:01:17','','Health','','publish','closed','closed','','health','','','2015-10-14 11:53:49','2015-10-14 09:53:49','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=206',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (207,1,'2015-08-25 14:01:43','2015-08-25 14:01:43','','Trade','','publish','closed','closed','','trade','','','2015-10-14 11:53:40','2015-10-14 09:53:40','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=207',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (208,1,'2015-08-25 14:02:21','2015-08-25 14:02:21','','Industry','','publish','closed','closed','','industry','','','2015-10-14 11:53:33','2015-10-14 09:53:33','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=208',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (209,1,'2015-08-25 14:03:08','2015-08-25 14:03:08','','Crime','','publish','closed','closed','','crime','','','2015-10-14 11:53:27','2015-10-14 09:53:27','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=209',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (210,1,'2015-08-25 14:03:55','2015-08-25 14:03:55','','Culture','','publish','closed','closed','','culture','','','2015-10-14 11:53:20','2015-10-14 09:53:20','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=210',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (211,1,'2015-08-25 14:09:55','2015-08-25 14:09:55','','Agriculture','','publish','closed','closed','','agriculture','','','2015-10-14 11:53:13','2015-10-14 09:53:13','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=211',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (212,1,'2015-08-25 14:10:44','2015-08-25 14:10:44','','Mobility','','publish','closed','closed','','mobility','','','2015-10-14 11:53:02','2015-10-14 09:53:02','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=212',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (213,1,'2015-08-25 14:11:08','2015-08-25 14:11:08','','Public order','','publish','closed','closed','','public-order','','','2015-10-14 11:52:56','2015-10-14 09:52:56','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=213',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (214,1,'2015-08-25 14:13:29','2015-08-25 14:13:29','','Politics','','publish','closed','closed','','politics','','','2015-10-14 11:52:49','2015-10-14 09:52:49','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=214',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (216,1,'2015-08-25 14:13:55','2015-08-25 14:13:55','','Prices','','publish','closed','closed','','prices','','','2015-10-14 11:52:42','2015-10-14 09:52:42','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=216',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (217,1,'2015-08-25 14:14:28','2015-08-25 14:14:28','','Social security','','publish','closed','closed','','social-security','','','2015-10-14 11:52:34','2015-10-14 09:52:34','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=217',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (218,1,'2015-08-25 14:15:06','2015-08-25 14:15:06','','Statistical basis','','publish','closed','closed','','statistical-basis','','','2015-10-14 11:52:26','2015-10-14 09:52:26','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=218',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (219,1,'2015-08-25 14:15:31','2015-08-25 14:15:31','','Tourism','','publish','closed','closed','','tourism','','','2015-10-14 11:52:09','2015-10-14 09:52:09','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=219',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (220,1,'2015-08-25 14:15:55','2015-08-25 14:15:55','','Administration','','publish','closed','closed','','administration','','','2015-10-14 11:51:58','2015-10-14 09:51:58','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=220',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (221,1,'2015-08-25 14:16:25','2015-08-25 14:16:25','','National economy','','publish','closed','closed','','national-economy','','','2015-10-14 11:51:45','2015-10-14 09:51:45','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=221',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (233,1,'2015-08-25 15:56:06','2015-08-25 15:56:06','','Daten','','publish','open','closed','','datensatze','','','2015-10-27 16:11:48','2015-10-27 15:11:48','',0,'http://ogdch.dev/?p=233',1,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (234,1,'2015-08-25 16:00:54','2015-08-25 16:00:54','','Organisationen','','publish','open','closed','','gruppen','','','2015-10-27 16:11:48','2015-10-27 15:11:48','',0,'http://ogdch.dev/?p=234',2,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (236,1,'2015-08-25 16:00:54','2015-08-25 16:00:54','','Applikationen','','publish','open','closed','','apps','','','2015-10-27 16:11:48','2015-10-27 15:11:48','',0,'http://ogdch.dev/?p=236',3,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (237,1,'2015-08-25 16:02:12','2015-08-25 16:02:12','','Data','','publish','open','closed','','datasets','','','2015-10-27 16:09:03','2015-10-27 15:09:03','',0,'http://ogdch.dev/?p=237',1,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (238,1,'2015-08-25 16:02:13','2015-08-25 16:02:13','','Organizations','','publish','open','closed','','groups','','','2015-10-27 16:09:03','2015-10-27 15:09:03','',0,'http://ogdch.dev/?p=238',2,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (239,1,'2015-08-25 16:02:13','2015-08-25 16:02:13','','Applications','','publish','open','closed','','apps-2','','','2015-10-27 16:09:03','2015-10-27 15:09:03','',0,'http://ogdch.dev/?p=239',3,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (240,1,'2015-08-25 16:03:13','2015-08-25 16:03:13','','Données','','publish','open','closed','','jeux-de-donnees','','','2015-10-27 16:10:06','2015-10-27 15:10:06','',0,'http://ogdch.dev/?p=240',1,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (241,1,'2015-08-25 16:03:13','2015-08-25 16:03:13','','Organisations','','publish','open','closed','','groupes','','','2015-10-27 16:10:06','2015-10-27 15:10:06','',0,'http://ogdch.dev/?p=241',2,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (242,1,'2015-08-25 16:03:13','2015-08-25 16:03:13','','Applications','','publish','open','closed','','apps-3','','','2015-10-27 16:10:06','2015-10-27 15:10:06','',0,'http://ogdch.dev/?p=242',3,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (243,1,'2015-08-25 16:04:07','2015-08-25 16:04:07','','Dati','','publish','open','closed','','dataset','','','2015-10-27 16:10:52','2015-10-27 15:10:52','',0,'http://ogdch.dev/?p=243',1,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (244,1,'2015-08-25 16:04:07','2015-08-25 16:04:07','','Organizzazioni','','publish','open','closed','','gruppi','','','2015-10-27 16:10:52','2015-10-27 15:10:52','',0,'http://ogdch.dev/?p=244',2,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (245,1,'2015-08-25 16:04:07','2015-08-25 16:04:07','','Applicazioni','','publish','open','closed','','apps-4','','','2015-10-27 16:10:52','2015-10-27 15:10:52','',0,'http://ogdch.dev/?p=245',3,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (246,1,'2015-09-14 11:36:04','2015-09-14 11:36:04','','Bundesarchiv','','publish','closed','closed','','bundesarchiv','','','2015-10-14 11:51:05','2015-10-14 09:51:05','',0,'http://ogdch.dev/?post_type=ckan-local-org&#038;p=246',0,'ckan-local-org','',0);
INSERT INTO `ogdch_posts` VALUES (247,1,'2015-09-21 21:17:55','2015-09-21 21:17:00','[ninja_forms id=1]','Kontakt','','publish','closed','closed','','contact','','','2015-10-22 14:35:39','2015-10-22 12:35:39','',0,'http://ogdch.dev/?page_id=247',0,'page','',0);
INSERT INTO `ogdch_posts` VALUES (248,1,'2015-09-21 21:17:55','2015-09-21 21:17:15','','Contact','','publish','closed','closed','','contact','','','2015-09-21 21:17:15','2015-09-21 21:17:15','',0,'http://ogdch.dev/?page_id=248',0,'page','',0);
INSERT INTO `ogdch_posts` VALUES (249,1,'2015-09-21 21:17:55','2015-09-21 21:17:33','','Contatto','','publish','closed','closed','','contact','','','2015-09-21 21:17:39','2015-09-21 21:17:39','',0,'http://ogdch.dev/?page_id=249',0,'page','',0);
INSERT INTO `ogdch_posts` VALUES (250,1,'2015-09-21 21:17:55','2015-09-21 21:17:55','','Contact','','publish','closed','closed','','contact','','','2015-09-21 21:17:55','2015-09-21 21:17:55','',0,'http://ogdch.dev/?page_id=250',0,'page','',0);
INSERT INTO `ogdch_posts` VALUES (251,1,'2015-09-21 21:18:21','2015-09-21 21:18:21',' ','','','publish','closed','closed','','251','','','2015-09-21 21:18:21','2015-09-21 21:18:21','',0,'http://ogdch.dev/?p=251',1,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (252,1,'2015-09-21 21:18:21','2015-09-21 21:18:21',' ','','','publish','closed','closed','','252','','','2015-09-21 21:18:21','2015-09-21 21:18:21','',0,'http://ogdch.dev/?p=252',2,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (253,1,'2015-09-21 21:18:21','2015-09-21 21:18:21',' ','','','publish','closed','closed','','253','','','2015-09-21 21:18:21','2015-09-21 21:18:21','',0,'http://ogdch.dev/?p=253',3,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (254,1,'2015-09-21 21:18:48','2015-09-21 21:18:48',' ','','','publish','closed','closed','','254','','','2015-09-21 21:18:48','2015-09-21 21:18:48','',0,'http://ogdch.dev/?p=254',1,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (255,1,'2015-09-21 21:18:48','2015-09-21 21:18:48',' ','','','publish','closed','closed','','255','','','2015-09-21 21:18:48','2015-09-21 21:18:48','',0,'http://ogdch.dev/?p=255',2,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (256,1,'2015-09-21 21:18:48','2015-09-21 21:18:48',' ','','','publish','closed','closed','','256','','','2015-09-21 21:18:48','2015-09-21 21:18:48','',0,'http://ogdch.dev/?p=256',3,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (257,1,'2015-09-21 21:19:30','2015-09-21 21:19:30',' ','','','publish','closed','closed','','257','','','2015-09-21 21:19:30','2015-09-21 21:19:30','',0,'http://ogdch.dev/?p=257',1,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (258,1,'2015-09-21 21:19:30','2015-09-21 21:19:30',' ','','','publish','closed','closed','','258','','','2015-09-21 21:19:30','2015-09-21 21:19:30','',0,'http://ogdch.dev/?p=258',2,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (259,1,'2015-09-21 21:19:30','2015-09-21 21:19:30',' ','','','publish','closed','closed','','259','','','2015-09-21 21:19:30','2015-09-21 21:19:30','',0,'http://ogdch.dev/?p=259',3,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (260,1,'2015-09-21 21:19:48','2015-09-21 21:19:48',' ','','','publish','closed','closed','','260','','','2015-09-21 21:19:48','2015-09-21 21:19:48','',0,'http://ogdch.dev/?p=260',1,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (261,1,'2015-09-21 21:19:48','2015-09-21 21:19:48',' ','','','publish','closed','closed','','261','','','2015-09-21 21:19:48','2015-09-21 21:19:48','',0,'http://ogdch.dev/?p=261',2,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (262,1,'2015-09-21 21:19:48','2015-09-21 21:19:48',' ','','','publish','closed','closed','','262','','','2015-09-21 21:19:48','2015-09-21 21:19:48','',0,'http://ogdch.dev/?p=262',3,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (263,1,'2015-09-21 21:24:14','2015-09-21 21:24:14','','Daten','','publish','closed','closed','','datensatze-2','','','2015-10-27 16:14:05','2015-10-27 15:14:05','',0,'http://ogdch.dev/?p=263',1,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (264,1,'2015-09-21 21:24:14','2015-09-21 21:24:14','','Organisationen','','publish','closed','closed','','publisher','','','2015-10-27 16:14:05','2015-10-27 15:14:05','',0,'http://ogdch.dev/?p=264',2,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (265,1,'2015-09-21 21:24:14','2015-09-21 21:24:14','','Kategorien','','publish','closed','closed','','apps-5','','','2015-10-27 16:14:05','2015-10-27 15:14:05','',0,'http://ogdch.dev/?p=265',3,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (266,1,'2015-09-21 21:25:41','2015-09-21 21:25:41','','Data','','publish','closed','closed','','datasets-2','','','2015-10-27 16:14:14','2015-10-27 15:14:14','',0,'http://ogdch.dev/?p=266',1,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (267,1,'2015-09-21 21:25:41','2015-09-21 21:25:41','','Organizations','','publish','closed','closed','','publishers','','','2015-10-27 16:14:14','2015-10-27 15:14:14','',0,'http://ogdch.dev/?p=267',2,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (268,1,'2015-09-21 21:25:41','2015-09-21 21:25:41','','Categories','','publish','closed','closed','','apps-6','','','2015-10-27 16:14:14','2015-10-27 15:14:14','',0,'http://ogdch.dev/?p=268',3,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (269,1,'2015-09-21 21:28:38','2015-09-21 21:28:38','','Dati','','publish','closed','closed','','dataseti','','','2015-10-27 16:14:38','2015-10-27 15:14:38','',0,'http://ogdch.dev/?p=269',1,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (270,1,'2015-09-21 21:30:04','2015-09-21 21:30:04','','Organizzazioni','','publish','closed','closed','','editore','','','2015-10-27 16:14:38','2015-10-27 15:14:38','',0,'http://ogdch.dev/?p=270',2,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (271,1,'2015-09-21 21:30:04','2015-09-21 21:30:04','','Categorie','','publish','closed','closed','','apps-7','','','2015-10-27 16:14:38','2015-10-27 15:14:38','',0,'http://ogdch.dev/?p=271',3,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (272,1,'2015-09-21 21:32:25','2015-09-21 21:32:25','','Données','','publish','closed','closed','','jeux-de-donnees-2','','','2015-10-27 16:13:56','2015-10-27 15:13:56','',0,'http://ogdch.dev/?p=272',1,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (273,1,'2015-09-21 21:32:25','2015-09-21 21:32:25','','Organisations','','publish','closed','closed','','editeur','','','2015-10-27 16:13:56','2015-10-27 15:13:56','',0,'http://ogdch.dev/?p=273',2,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (274,1,'2015-09-21 21:32:25','2015-09-21 21:32:25','','Catégories','','publish','closed','closed','','apps-8','','','2015-10-27 16:13:56','2015-10-27 15:13:56','',0,'http://ogdch.dev/?p=274',3,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (275,1,'2015-09-21 21:37:46','2015-09-21 21:37:46','','API','','publish','closed','closed','','api','','','2015-10-27 16:15:16','2015-10-27 15:15:16','',0,'http://ogdch.dev/?p=275',2,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (276,1,'2015-09-21 21:37:46','2015-09-21 21:37:46','','Quellcode','','publish','closed','closed','','quellcode','','','2015-10-27 16:15:16','2015-10-27 15:15:16','',0,'http://ogdch.dev/?p=276',3,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (277,1,'2015-09-22 06:40:19','2015-09-22 06:40:19','','API','','publish','closed','closed','','api-2','','','2015-10-27 16:15:39','2015-10-27 15:15:39','',0,'http://ogdch.dev/?p=277',2,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (278,1,'2015-09-22 06:40:19','2015-09-22 06:40:19','','Source','','publish','closed','closed','','source','','','2015-10-27 16:15:39','2015-10-27 15:15:39','',0,'http://ogdch.dev/?p=278',3,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (279,1,'2015-09-22 06:41:20','2015-09-22 06:41:20','','API','','publish','closed','closed','','api-3','','','2015-10-27 16:17:01','2015-10-27 15:17:01','',0,'http://ogdch.dev/?p=279',2,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (280,1,'2015-09-22 06:41:20','2015-09-22 06:41:20','','Fonte','','publish','closed','closed','','fonte','','','2015-10-27 16:17:01','2015-10-27 15:17:01','',0,'http://ogdch.dev/?p=280',3,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (281,1,'2015-09-22 06:41:47','2015-09-22 06:41:47','','API','','publish','closed','closed','','api-4','','','2015-10-27 16:16:37','2015-10-27 15:16:37','',0,'http://ogdch.dev/?p=281',2,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (282,1,'2015-09-22 06:41:47','2015-09-22 06:41:47','','Source','','publish','closed','closed','','source-2','','','2015-10-27 16:16:37','2015-10-27 15:16:37','',0,'http://ogdch.dev/?p=282',3,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (284,1,'2015-09-22 15:16:35','2015-09-22 13:16:35','','Railway noise night','','publish','closed','closed','','railway-noise-night','','','2015-10-14 12:02:14','2015-10-14 10:02:14','',0,'http://ogdch.dev/?post_type=ckan-local-dataset&#038;p=284',0,'ckan-local-dataset','',0);
INSERT INTO `ogdch_posts` VALUES (285,1,'2015-09-22 15:20:00','2015-09-22 13:20:00','','Baustellen','','publish','closed','closed','','baustellen','','','2015-10-14 11:55:07','2015-10-14 09:55:07','',0,'http://ogdch.dev/?post_type=ckan-local-dataset&#038;p=285',0,'ckan-local-dataset','',0);
INSERT INTO `ogdch_posts` VALUES (286,1,'2015-09-23 18:02:09','2015-09-23 16:02:09',' ','','','publish','closed','closed','','286','','','2015-10-27 16:11:48','2015-10-27 15:11:48','',0,'http://ogdch.dev/?p=286',4,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (287,1,'2015-09-23 18:02:42','2015-09-23 16:02:42',' ','','','publish','closed','closed','','287','','','2015-10-27 16:09:03','2015-10-27 15:09:03','',0,'http://ogdch.dev/?p=287',4,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (288,1,'2015-09-23 18:03:18','2015-09-23 16:03:18',' ','','','publish','closed','closed','','288','','','2015-10-27 16:10:06','2015-10-27 15:10:06','',0,'http://ogdch.dev/?p=288',4,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (289,1,'2015-09-23 18:03:51','2015-09-23 16:03:51',' ','','','publish','closed','closed','','289','','','2015-10-27 16:10:52','2015-10-27 15:10:52','',0,'http://ogdch.dev/?p=289',4,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (290,1,'2015-09-29 14:25:33','2015-09-29 12:25:33','','liip','','inherit','open','closed','','liip','','','2015-09-29 14:25:33','2015-09-29 12:25:33','',0,'http://ogdch.dev/content/uploads/2015/09/liip.png',0,'attachment','image/png',0);
INSERT INTO `ogdch_posts` VALUES (291,1,'2015-10-12 11:50:14','2015-10-12 09:50:14','','Sub-Organization','','publish','closed','closed','','sub-organization','','','2015-10-14 11:51:24','2015-10-14 09:51:24','',0,'http://ogdch.dev/?post_type=ckan-local-org&#038;p=291',0,'ckan-local-org','',0);
INSERT INTO `ogdch_posts` VALUES (292,1,'2015-10-22 14:09:32','0000-00-00 00:00:00','This is a preview of how this form will appear on your website','Form Preview Page','','draft','closed','closed','','','','','2015-10-22 14:09:32','2015-10-22 12:09:32','',0,'http://ogdch.dev/?page_id=292',0,'page','',0);
INSERT INTO `ogdch_posts` VALUES (293,1,'2015-10-27 16:15:16','2015-10-27 15:15:16','','Anwendungen','','publish','closed','closed','','anwendungen','','','2015-10-27 16:15:16','2015-10-27 15:15:16','',0,'http://ogdch.dev/?p=293',1,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (294,1,'2015-10-27 16:15:39','2015-10-27 15:15:39','','Applications','','publish','closed','closed','','applications','','','2015-10-27 16:15:39','2015-10-27 15:15:39','',0,'http://ogdch.dev/?p=294',1,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (295,1,'2015-10-27 16:16:37','2015-10-27 15:16:37','','Applications','','publish','closed','closed','','applications-2','','','2015-10-27 16:16:37','2015-10-27 15:16:37','',0,'http://ogdch.dev/?p=295',1,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (296,1,'2015-10-27 16:17:01','2015-10-27 15:17:01','','Applicazioni','','publish','closed','closed','','applicazioni','','','2015-10-27 16:17:01','2015-10-27 15:17:01','',0,'http://ogdch.dev/?p=296',1,'nav_menu_item','',0);
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
INSERT INTO `ogdch_term_relationships` VALUES (126,13,0);
INSERT INTO `ogdch_term_relationships` VALUES (126,15,0);
INSERT INTO `ogdch_term_relationships` VALUES (126,91,0);
INSERT INTO `ogdch_term_relationships` VALUES (126,127,0);
INSERT INTO `ogdch_term_relationships` VALUES (128,1,0);
INSERT INTO `ogdch_term_relationships` VALUES (128,2,0);
INSERT INTO `ogdch_term_relationships` VALUES (128,91,0);
INSERT INTO `ogdch_term_relationships` VALUES (128,123,0);
INSERT INTO `ogdch_term_relationships` VALUES (130,5,0);
INSERT INTO `ogdch_term_relationships` VALUES (130,7,0);
INSERT INTO `ogdch_term_relationships` VALUES (130,91,0);
INSERT INTO `ogdch_term_relationships` VALUES (132,9,0);
INSERT INTO `ogdch_term_relationships` VALUES (132,11,0);
INSERT INTO `ogdch_term_relationships` VALUES (132,91,0);
INSERT INTO `ogdch_term_relationships` VALUES (140,2,0);
INSERT INTO `ogdch_term_relationships` VALUES (141,5,0);
INSERT INTO `ogdch_term_relationships` VALUES (141,103,0);
INSERT INTO `ogdch_term_relationships` VALUES (142,2,0);
INSERT INTO `ogdch_term_relationships` VALUES (142,103,0);
INSERT INTO `ogdch_term_relationships` VALUES (142,121,0);
INSERT INTO `ogdch_term_relationships` VALUES (143,9,0);
INSERT INTO `ogdch_term_relationships` VALUES (143,103,0);
INSERT INTO `ogdch_term_relationships` VALUES (144,1,0);
INSERT INTO `ogdch_term_relationships` VALUES (144,2,0);
INSERT INTO `ogdch_term_relationships` VALUES (144,131,0);
INSERT INTO `ogdch_term_relationships` VALUES (149,1,0);
INSERT INTO `ogdch_term_relationships` VALUES (149,2,0);
INSERT INTO `ogdch_term_relationships` VALUES (149,130,0);
INSERT INTO `ogdch_term_relationships` VALUES (150,5,0);
INSERT INTO `ogdch_term_relationships` VALUES (150,7,0);
INSERT INTO `ogdch_term_relationships` VALUES (150,130,0);
INSERT INTO `ogdch_term_relationships` VALUES (151,9,0);
INSERT INTO `ogdch_term_relationships` VALUES (151,11,0);
INSERT INTO `ogdch_term_relationships` VALUES (151,130,0);
INSERT INTO `ogdch_term_relationships` VALUES (152,13,0);
INSERT INTO `ogdch_term_relationships` VALUES (152,15,0);
INSERT INTO `ogdch_term_relationships` VALUES (152,130,0);
INSERT INTO `ogdch_term_relationships` VALUES (153,5,0);
INSERT INTO `ogdch_term_relationships` VALUES (153,7,0);
INSERT INTO `ogdch_term_relationships` VALUES (154,3,0);
INSERT INTO `ogdch_term_relationships` VALUES (154,9,0);
INSERT INTO `ogdch_term_relationships` VALUES (154,11,0);
INSERT INTO `ogdch_term_relationships` VALUES (154,131,0);
INSERT INTO `ogdch_term_relationships` VALUES (154,155,0);
INSERT INTO `ogdch_term_relationships` VALUES (155,13,0);
INSERT INTO `ogdch_term_relationships` VALUES (155,15,0);
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
INSERT INTO `ogdch_term_relationships` VALUES (251,141,0);
INSERT INTO `ogdch_term_relationships` VALUES (252,141,0);
INSERT INTO `ogdch_term_relationships` VALUES (253,141,0);
INSERT INTO `ogdch_term_relationships` VALUES (254,143,0);
INSERT INTO `ogdch_term_relationships` VALUES (255,143,0);
INSERT INTO `ogdch_term_relationships` VALUES (256,143,0);
INSERT INTO `ogdch_term_relationships` VALUES (257,144,0);
INSERT INTO `ogdch_term_relationships` VALUES (258,144,0);
INSERT INTO `ogdch_term_relationships` VALUES (259,144,0);
INSERT INTO `ogdch_term_relationships` VALUES (260,145,0);
INSERT INTO `ogdch_term_relationships` VALUES (261,145,0);
INSERT INTO `ogdch_term_relationships` VALUES (262,145,0);
INSERT INTO `ogdch_term_relationships` VALUES (263,146,0);
INSERT INTO `ogdch_term_relationships` VALUES (264,146,0);
INSERT INTO `ogdch_term_relationships` VALUES (265,146,0);
INSERT INTO `ogdch_term_relationships` VALUES (266,147,0);
INSERT INTO `ogdch_term_relationships` VALUES (267,147,0);
INSERT INTO `ogdch_term_relationships` VALUES (268,147,0);
INSERT INTO `ogdch_term_relationships` VALUES (269,148,0);
INSERT INTO `ogdch_term_relationships` VALUES (270,148,0);
INSERT INTO `ogdch_term_relationships` VALUES (271,148,0);
INSERT INTO `ogdch_term_relationships` VALUES (272,149,0);
INSERT INTO `ogdch_term_relationships` VALUES (273,149,0);
INSERT INTO `ogdch_term_relationships` VALUES (274,149,0);
INSERT INTO `ogdch_term_relationships` VALUES (275,150,0);
INSERT INTO `ogdch_term_relationships` VALUES (276,150,0);
INSERT INTO `ogdch_term_relationships` VALUES (277,151,0);
INSERT INTO `ogdch_term_relationships` VALUES (278,151,0);
INSERT INTO `ogdch_term_relationships` VALUES (279,152,0);
INSERT INTO `ogdch_term_relationships` VALUES (280,152,0);
INSERT INTO `ogdch_term_relationships` VALUES (281,153,0);
INSERT INTO `ogdch_term_relationships` VALUES (282,153,0);
INSERT INTO `ogdch_term_relationships` VALUES (283,2,0);
INSERT INTO `ogdch_term_relationships` VALUES (284,154,0);
INSERT INTO `ogdch_term_relationships` VALUES (284,156,0);
INSERT INTO `ogdch_term_relationships` VALUES (284,158,0);
INSERT INTO `ogdch_term_relationships` VALUES (284,160,0);
INSERT INTO `ogdch_term_relationships` VALUES (284,162,0);
INSERT INTO `ogdch_term_relationships` VALUES (284,164,0);
INSERT INTO `ogdch_term_relationships` VALUES (284,166,0);
INSERT INTO `ogdch_term_relationships` VALUES (284,168,0);
INSERT INTO `ogdch_term_relationships` VALUES (285,170,0);
INSERT INTO `ogdch_term_relationships` VALUES (286,135,0);
INSERT INTO `ogdch_term_relationships` VALUES (287,136,0);
INSERT INTO `ogdch_term_relationships` VALUES (288,138,0);
INSERT INTO `ogdch_term_relationships` VALUES (289,137,0);
INSERT INTO `ogdch_term_relationships` VALUES (292,2,0);
INSERT INTO `ogdch_term_relationships` VALUES (293,150,0);
INSERT INTO `ogdch_term_relationships` VALUES (294,151,0);
INSERT INTO `ogdch_term_relationships` VALUES (295,153,0);
INSERT INTO `ogdch_term_relationships` VALUES (296,152,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogdch_term_taxonomy`
--

LOCK TABLES `ogdch_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `ogdch_term_taxonomy` DISABLE KEYS */;
INSERT INTO `ogdch_term_taxonomy` VALUES (1,1,'category','',0,3);
INSERT INTO `ogdch_term_taxonomy` VALUES (2,2,'language','a:2:{s:6:\"locale\";s:5:\"de_CH\";s:3:\"rtl\";i:0;}',0,7);
INSERT INTO `ogdch_term_taxonomy` VALUES (3,3,'term_language','',0,24);
INSERT INTO `ogdch_term_taxonomy` VALUES (4,4,'term_translations','a:4:{s:2:\"de\";i:1;s:2:\"en\";i:7;s:2:\"it\";i:11;s:2:\"fr\";i:15;}',0,4);
INSERT INTO `ogdch_term_taxonomy` VALUES (5,5,'language','a:2:{s:6:\"locale\";s:5:\"en_US\";s:3:\"rtl\";i:0;}',0,7);
INSERT INTO `ogdch_term_taxonomy` VALUES (6,6,'term_language','',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (7,7,'category','',0,3);
INSERT INTO `ogdch_term_taxonomy` VALUES (9,9,'language','a:2:{s:6:\"locale\";s:5:\"it_IT\";s:3:\"rtl\";i:0;}',0,7);
INSERT INTO `ogdch_term_taxonomy` VALUES (10,10,'term_language','',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (11,11,'category','',0,3);
INSERT INTO `ogdch_term_taxonomy` VALUES (13,13,'language','a:2:{s:6:\"locale\";s:5:\"fr_FR\";s:3:\"rtl\";i:0;}',0,7);
INSERT INTO `ogdch_term_taxonomy` VALUES (14,14,'term_language','',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (15,15,'category','',0,3);
INSERT INTO `ogdch_term_taxonomy` VALUES (28,28,'post_translations','a:4:{s:2:\"en\";i:73;s:2:\"de\";i:71;s:2:\"it\";i:74;s:2:\"fr\";i:72;}',0,0);
INSERT INTO `ogdch_term_taxonomy` VALUES (29,29,'post_translations','a:4:{s:2:\"de\";i:75;s:2:\"fr\";i:76;s:2:\"en\";i:77;s:2:\"it\";i:78;}',0,0);
INSERT INTO `ogdch_term_taxonomy` VALUES (32,32,'post_translations','a:4:{s:2:\"de\";i:87;s:2:\"fr\";i:88;s:2:\"en\";i:89;s:2:\"it\";i:90;}',0,0);
INSERT INTO `ogdch_term_taxonomy` VALUES (42,42,'term_translations','a:1:{s:2:\"de\";i:37;}',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (43,43,'term_translations','a:1:{s:2:\"de\";i:38;}',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (71,71,'post_translations','a:4:{s:2:\"de\";i:2;s:2:\"en\";i:97;s:2:\"it\";i:118;s:2:\"fr\";i:119;}',0,4);
INSERT INTO `ogdch_term_taxonomy` VALUES (91,91,'post_translations','a:4:{s:2:\"de\";i:128;s:2:\"en\";i:130;s:2:\"it\";i:132;s:2:\"fr\";i:126;}',0,4);
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
INSERT INTO `ogdch_term_taxonomy` VALUES (130,130,'post_translations','a:4:{s:2:\"de\";i:149;s:2:\"en\";i:150;s:2:\"it\";i:151;s:2:\"fr\";i:152;}',0,4);
INSERT INTO `ogdch_term_taxonomy` VALUES (131,131,'post_translations','a:2:{s:2:\"it\";i:154;s:2:\"de\";i:144;}',0,2);
INSERT INTO `ogdch_term_taxonomy` VALUES (134,134,'post_translations','a:4:{s:2:\"en\";i:165;s:2:\"de\";i:164;s:2:\"it\";i:166;s:2:\"fr\";i:167;}',0,4);
INSERT INTO `ogdch_term_taxonomy` VALUES (135,135,'nav_menu','',0,5);
INSERT INTO `ogdch_term_taxonomy` VALUES (136,136,'nav_menu','',0,5);
INSERT INTO `ogdch_term_taxonomy` VALUES (137,137,'nav_menu','',0,5);
INSERT INTO `ogdch_term_taxonomy` VALUES (138,138,'nav_menu','',0,5);
INSERT INTO `ogdch_term_taxonomy` VALUES (139,139,'post_translations','a:4:{s:2:\"fr\";i:198;s:2:\"de\";i:195;s:2:\"en\";i:196;s:2:\"it\";i:197;}',0,4);
INSERT INTO `ogdch_term_taxonomy` VALUES (141,141,'nav_menu','',0,3);
INSERT INTO `ogdch_term_taxonomy` VALUES (142,142,'post_translations','a:4:{s:2:\"de\";i:247;s:2:\"en\";i:248;s:2:\"it\";i:249;s:2:\"fr\";i:250;}',0,4);
INSERT INTO `ogdch_term_taxonomy` VALUES (143,143,'nav_menu','',0,3);
INSERT INTO `ogdch_term_taxonomy` VALUES (144,144,'nav_menu','',0,3);
INSERT INTO `ogdch_term_taxonomy` VALUES (145,145,'nav_menu','',0,3);
INSERT INTO `ogdch_term_taxonomy` VALUES (146,146,'nav_menu','',0,3);
INSERT INTO `ogdch_term_taxonomy` VALUES (147,147,'nav_menu','',0,3);
INSERT INTO `ogdch_term_taxonomy` VALUES (148,148,'nav_menu','',0,3);
INSERT INTO `ogdch_term_taxonomy` VALUES (149,149,'nav_menu','',0,3);
INSERT INTO `ogdch_term_taxonomy` VALUES (150,150,'nav_menu','',0,3);
INSERT INTO `ogdch_term_taxonomy` VALUES (151,151,'nav_menu','',0,3);
INSERT INTO `ogdch_term_taxonomy` VALUES (152,152,'nav_menu','',0,3);
INSERT INTO `ogdch_term_taxonomy` VALUES (153,153,'nav_menu','',0,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
INSERT INTO `ogdch_terms` VALUES (91,'pll_556ea463ed282','pll_556ea463ed282',0);
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
INSERT INTO `ogdch_terms` VALUES (130,'pll_557017d5a9923','pll_557017d5a9923',0);
INSERT INTO `ogdch_terms` VALUES (131,'pll_557018aba5ef5','pll_557018aba5ef5',0);
INSERT INTO `ogdch_terms` VALUES (134,'pll_55dc6d40488ce','pll_55dc6d40488ce',0);
INSERT INTO `ogdch_terms` VALUES (135,'MainNavigation DE','mainnavigation-de',0);
INSERT INTO `ogdch_terms` VALUES (136,'MainNavigation EN','mainnavigation-en',0);
INSERT INTO `ogdch_terms` VALUES (137,'MainNavigation IT','mainnavigation-it',0);
INSERT INTO `ogdch_terms` VALUES (138,'MainNavigation FR','mainnavigation-fr',0);
INSERT INTO `ogdch_terms` VALUES (139,'pll_55dc737d7783b','pll_55dc737d7783b',0);
INSERT INTO `ogdch_terms` VALUES (141,'AboutNavigation DE','aboutnavigation-de',0);
INSERT INTO `ogdch_terms` VALUES (142,'pll_560073db54b9a','pll_560073db54b9a',0);
INSERT INTO `ogdch_terms` VALUES (143,'AboutNavigation EN','aboutnavigation-en',0);
INSERT INTO `ogdch_terms` VALUES (144,'AboutNavigation IT','aboutnavigation-it',0);
INSERT INTO `ogdch_terms` VALUES (145,'AboutNavigation FR','aboutnavigation-fr',0);
INSERT INTO `ogdch_terms` VALUES (146,'DataNavigation DE','datanavigation-de',0);
INSERT INTO `ogdch_terms` VALUES (147,'DataNavigation EN','datanavigation-en',0);
INSERT INTO `ogdch_terms` VALUES (148,'DataNavigation IT','datanavigation-it',0);
INSERT INTO `ogdch_terms` VALUES (149,'DataNavigation FR','datanavigation-fr',0);
INSERT INTO `ogdch_terms` VALUES (150,'DeveloperNavigation DE','developernavigation-de',0);
INSERT INTO `ogdch_terms` VALUES (151,'DeveloperNavigation EN','developernavigation-en',0);
INSERT INTO `ogdch_terms` VALUES (152,'DeveloperNavigation IT','developernavigation-it',0);
INSERT INTO `ogdch_terms` VALUES (153,'DeveloperNavigation FR','developernavigation-fr',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
INSERT INTO `ogdch_usermeta` VALUES (15,1,'ogdch_dashboard_quick_press_last_post_id','3');
INSERT INTO `ogdch_usermeta` VALUES (16,1,'pll_filter_content','de');
INSERT INTO `ogdch_usermeta` VALUES (17,1,'ogdch_user-settings','posts_list_mode=list&libraryContent=browse&mfold=o&advImgDetails=show&uploader=1&hidetb=1&editor=tinymce');
INSERT INTO `ogdch_usermeta` VALUES (18,1,'ogdch_user-settings-time','1444982352');
INSERT INTO `ogdch_usermeta` VALUES (19,1,'managenav-menuscolumnshidden','a:4:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";}');
INSERT INTO `ogdch_usermeta` VALUES (20,1,'metaboxhidden_nav-menus','a:7:{i:0;s:19:\"pll_lang_switch_box\";i:1;s:8:\"add-post\";i:2;s:7:\"add-app\";i:3;s:22:\"add-ckan-local-dataset\";i:4;s:20:\"add-ckan-local-group\";i:5;s:18:\"add-ckan-local-org\";i:6;s:12:\"add-post_tag\";}');
INSERT INTO `ogdch_usermeta` VALUES (21,1,'nav_menu_recently_edited','152');
INSERT INTO `ogdch_usermeta` VALUES (22,1,'closedpostboxes_ckan-dataset','a:1:{i:0;s:16:\"ckan-dataset-box\";}');
INSERT INTO `ogdch_usermeta` VALUES (23,1,'metaboxhidden_ckan-dataset','a:1:{i:0;s:7:\"slugdiv\";}');
INSERT INTO `ogdch_usermeta` VALUES (24,1,'closedpostboxes_post','a:0:{}');
INSERT INTO `ogdch_usermeta` VALUES (25,1,'metaboxhidden_post','a:5:{i:0;s:11:\"postexcerpt\";i:1;s:13:\"trackbacksdiv\";i:2;s:10:\"postcustom\";i:3;s:7:\"slugdiv\";i:4;s:9:\"authordiv\";}');
INSERT INTO `ogdch_usermeta` VALUES (26,1,'_yoast_wpseo_profile_updated','1446149907');
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
INSERT INTO `ogdch_usermeta` VALUES (130,1,'session_tokens','a:1:{s:64:\"99b3a7474e2b1c91a2779b0e5e1b3b4187c5bf8f43f0ea95af349254c2722f07\";a:4:{s:10:\"expiration\";i:1446322688;s:2:\"ip\";s:12:\"192.168.56.1\";s:2:\"ua\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36\";s:5:\"login\";i:1446149888;}}');
INSERT INTO `ogdch_usermeta` VALUES (131,1,'wpseo_dismissed_gsc_notice','1');
INSERT INTO `ogdch_usermeta` VALUES (133,5,'_yoast_wpseo_profile_updated','1446149907');
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

-- Dump completed on 2015-10-29 20:18:56
