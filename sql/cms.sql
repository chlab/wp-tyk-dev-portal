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
-- Table structure for table `odpch_commentmeta`
--

DROP TABLE IF EXISTS `odpch_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odpch_commentmeta` (
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
-- Dumping data for table `odpch_commentmeta`
--

LOCK TABLES `odpch_commentmeta` WRITE;
/*!40000 ALTER TABLE `odpch_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `odpch_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odpch_comments`
--

DROP TABLE IF EXISTS `odpch_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odpch_comments` (
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
-- Dumping data for table `odpch_comments`
--

LOCK TABLES `odpch_comments` WRITE;
/*!40000 ALTER TABLE `odpch_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `odpch_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odpch_links`
--

DROP TABLE IF EXISTS `odpch_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odpch_links` (
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
-- Dumping data for table `odpch_links`
--

LOCK TABLES `odpch_links` WRITE;
/*!40000 ALTER TABLE `odpch_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `odpch_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odpch_nf_objectmeta`
--

DROP TABLE IF EXISTS `odpch_nf_objectmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odpch_nf_objectmeta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) NOT NULL,
  `meta_value` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odpch_nf_objectmeta`
--

LOCK TABLES `odpch_nf_objectmeta` WRITE;
/*!40000 ALTER TABLE `odpch_nf_objectmeta` DISABLE KEYS */;
INSERT INTO `odpch_nf_objectmeta` VALUES (1,1,'date_updated','2016-07-06');
INSERT INTO `odpch_nf_objectmeta` VALUES (2,1,'form_title','Contact Form');
INSERT INTO `odpch_nf_objectmeta` VALUES (3,1,'show_title','0');
INSERT INTO `odpch_nf_objectmeta` VALUES (4,1,'save_subs','1');
INSERT INTO `odpch_nf_objectmeta` VALUES (5,1,'logged_in','0');
INSERT INTO `odpch_nf_objectmeta` VALUES (6,1,'append_page','');
INSERT INTO `odpch_nf_objectmeta` VALUES (7,1,'ajax','0');
INSERT INTO `odpch_nf_objectmeta` VALUES (8,1,'clear_complete','1');
INSERT INTO `odpch_nf_objectmeta` VALUES (9,1,'hide_complete','1');
INSERT INTO `odpch_nf_objectmeta` VALUES (10,1,'success_msg','Your form has been successfully submitted.');
INSERT INTO `odpch_nf_objectmeta` VALUES (11,1,'email_from','');
INSERT INTO `odpch_nf_objectmeta` VALUES (12,1,'email_type','html');
INSERT INTO `odpch_nf_objectmeta` VALUES (13,1,'user_email_msg','Thank you so much for contacting us. We will get back to you shortly.');
INSERT INTO `odpch_nf_objectmeta` VALUES (14,1,'user_email_fields','0');
INSERT INTO `odpch_nf_objectmeta` VALUES (15,1,'admin_email_msg','');
INSERT INTO `odpch_nf_objectmeta` VALUES (16,1,'admin_email_fields','1');
INSERT INTO `odpch_nf_objectmeta` VALUES (17,1,'admin_attach_csv','0');
INSERT INTO `odpch_nf_objectmeta` VALUES (18,1,'email_from_name','');
INSERT INTO `odpch_nf_objectmeta` VALUES (19,2,'date_updated','2014-09-09');
INSERT INTO `odpch_nf_objectmeta` VALUES (20,2,'active','1');
INSERT INTO `odpch_nf_objectmeta` VALUES (21,2,'name','Email User');
INSERT INTO `odpch_nf_objectmeta` VALUES (22,2,'type','email');
INSERT INTO `odpch_nf_objectmeta` VALUES (23,2,'email_format','html');
INSERT INTO `odpch_nf_objectmeta` VALUES (24,2,'attach_csv','1');
INSERT INTO `odpch_nf_objectmeta` VALUES (25,2,'from_name','');
INSERT INTO `odpch_nf_objectmeta` VALUES (26,2,'from_address','');
INSERT INTO `odpch_nf_objectmeta` VALUES (27,2,'reply_to','');
INSERT INTO `odpch_nf_objectmeta` VALUES (28,2,'to','field_2');
INSERT INTO `odpch_nf_objectmeta` VALUES (29,2,'cc','');
INSERT INTO `odpch_nf_objectmeta` VALUES (30,2,'bcc','');
INSERT INTO `odpch_nf_objectmeta` VALUES (31,2,'email_subject','Thank you for contacting us!');
INSERT INTO `odpch_nf_objectmeta` VALUES (32,2,'email_message','Thank you so much for contacting us. We will get back to you shortly.');
INSERT INTO `odpch_nf_objectmeta` VALUES (33,2,'redirect_url','');
INSERT INTO `odpch_nf_objectmeta` VALUES (34,2,'success_message_loc','ninja_forms_display_before_fields');
INSERT INTO `odpch_nf_objectmeta` VALUES (35,2,'success_msg','');
INSERT INTO `odpch_nf_objectmeta` VALUES (36,3,'date_updated','2014-09-09');
INSERT INTO `odpch_nf_objectmeta` VALUES (37,3,'active','1');
INSERT INTO `odpch_nf_objectmeta` VALUES (38,3,'name','Success Message');
INSERT INTO `odpch_nf_objectmeta` VALUES (39,3,'type','success_message');
INSERT INTO `odpch_nf_objectmeta` VALUES (40,3,'email_format','html');
INSERT INTO `odpch_nf_objectmeta` VALUES (41,3,'attach_csv','0');
INSERT INTO `odpch_nf_objectmeta` VALUES (42,3,'from_name','');
INSERT INTO `odpch_nf_objectmeta` VALUES (43,3,'from_address','');
INSERT INTO `odpch_nf_objectmeta` VALUES (44,3,'reply_to','');
INSERT INTO `odpch_nf_objectmeta` VALUES (45,3,'to','');
INSERT INTO `odpch_nf_objectmeta` VALUES (46,3,'cc','');
INSERT INTO `odpch_nf_objectmeta` VALUES (47,3,'bcc','');
INSERT INTO `odpch_nf_objectmeta` VALUES (48,3,'email_subject','');
INSERT INTO `odpch_nf_objectmeta` VALUES (49,3,'email_message','');
INSERT INTO `odpch_nf_objectmeta` VALUES (50,3,'redirect_url','');
INSERT INTO `odpch_nf_objectmeta` VALUES (51,3,'success_message_loc','ninja_forms_display_after_fields');
INSERT INTO `odpch_nf_objectmeta` VALUES (52,3,'success_msg','Your form has been successfully submitted.');
INSERT INTO `odpch_nf_objectmeta` VALUES (53,3,'text_message_number','');
INSERT INTO `odpch_nf_objectmeta` VALUES (54,3,'text_message_carrier','0');
INSERT INTO `odpch_nf_objectmeta` VALUES (55,3,'text_message_message','');
INSERT INTO `odpch_nf_objectmeta` VALUES (56,4,'date_updated','2014-09-09');
INSERT INTO `odpch_nf_objectmeta` VALUES (57,4,'active','1');
INSERT INTO `odpch_nf_objectmeta` VALUES (58,4,'name','Email Admin');
INSERT INTO `odpch_nf_objectmeta` VALUES (59,4,'type','email');
INSERT INTO `odpch_nf_objectmeta` VALUES (60,4,'email_format','html');
INSERT INTO `odpch_nf_objectmeta` VALUES (61,4,'attach_csv','1');
INSERT INTO `odpch_nf_objectmeta` VALUES (62,4,'from_name','');
INSERT INTO `odpch_nf_objectmeta` VALUES (63,4,'from_address','');
INSERT INTO `odpch_nf_objectmeta` VALUES (64,4,'reply_to','field_2');
INSERT INTO `odpch_nf_objectmeta` VALUES (65,4,'to','');
INSERT INTO `odpch_nf_objectmeta` VALUES (66,4,'cc','');
INSERT INTO `odpch_nf_objectmeta` VALUES (67,4,'bcc','');
INSERT INTO `odpch_nf_objectmeta` VALUES (68,4,'email_subject','Ninja Form Submission');
INSERT INTO `odpch_nf_objectmeta` VALUES (69,4,'email_message','[ninja_forms_all_fields]');
INSERT INTO `odpch_nf_objectmeta` VALUES (70,4,'redirect_url','');
INSERT INTO `odpch_nf_objectmeta` VALUES (71,4,'success_message_loc','ninja_forms_display_before_fields');
INSERT INTO `odpch_nf_objectmeta` VALUES (72,4,'success_msg','');
INSERT INTO `odpch_nf_objectmeta` VALUES (73,4,'text_message_number','');
INSERT INTO `odpch_nf_objectmeta` VALUES (74,4,'text_message_carrier','0');
INSERT INTO `odpch_nf_objectmeta` VALUES (75,4,'text_message_message','');
/*!40000 ALTER TABLE `odpch_nf_objectmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odpch_nf_objects`
--

DROP TABLE IF EXISTS `odpch_nf_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odpch_nf_objects` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odpch_nf_objects`
--

LOCK TABLES `odpch_nf_objects` WRITE;
/*!40000 ALTER TABLE `odpch_nf_objects` DISABLE KEYS */;
INSERT INTO `odpch_nf_objects` VALUES (1,'form');
INSERT INTO `odpch_nf_objects` VALUES (2,'notification');
INSERT INTO `odpch_nf_objects` VALUES (3,'notification');
INSERT INTO `odpch_nf_objects` VALUES (4,'notification');
/*!40000 ALTER TABLE `odpch_nf_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odpch_nf_relationships`
--

DROP TABLE IF EXISTS `odpch_nf_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odpch_nf_relationships` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `child_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  `child_type` varchar(255) NOT NULL,
  `parent_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odpch_nf_relationships`
--

LOCK TABLES `odpch_nf_relationships` WRITE;
/*!40000 ALTER TABLE `odpch_nf_relationships` DISABLE KEYS */;
INSERT INTO `odpch_nf_relationships` VALUES (1,2,1,'notification','form');
INSERT INTO `odpch_nf_relationships` VALUES (2,3,1,'notification','form');
INSERT INTO `odpch_nf_relationships` VALUES (3,4,1,'notification','form');
/*!40000 ALTER TABLE `odpch_nf_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odpch_ninja_forms_fav_fields`
--

DROP TABLE IF EXISTS `odpch_ninja_forms_fav_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odpch_ninja_forms_fav_fields` (
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
-- Dumping data for table `odpch_ninja_forms_fav_fields`
--

LOCK TABLES `odpch_ninja_forms_fav_fields` WRITE;
/*!40000 ALTER TABLE `odpch_ninja_forms_fav_fields` DISABLE KEYS */;
INSERT INTO `odpch_ninja_forms_fav_fields` VALUES (2,0,'_list',0,'a:10:{s:5:\"label\";s:14:\"State Dropdown\";s:9:\"label_pos\";s:4:\"left\";s:9:\"list_type\";s:8:\"dropdown\";s:10:\"multi_size\";s:1:\"5\";s:15:\"list_show_value\";s:1:\"1\";s:4:\"list\";a:1:{s:7:\"options\";a:51:{i:0;a:3:{s:5:\"label\";s:7:\"Alabama\";s:5:\"value\";s:2:\"AL\";s:8:\"selected\";s:1:\"0\";}i:1;a:3:{s:5:\"label\";s:6:\"Alaska\";s:5:\"value\";s:2:\"AK\";s:8:\"selected\";s:1:\"0\";}i:2;a:3:{s:5:\"label\";s:7:\"Arizona\";s:5:\"value\";s:2:\"AZ\";s:8:\"selected\";s:1:\"0\";}i:3;a:3:{s:5:\"label\";s:8:\"Arkansas\";s:5:\"value\";s:2:\"AR\";s:8:\"selected\";s:1:\"0\";}i:4;a:3:{s:5:\"label\";s:10:\"California\";s:5:\"value\";s:2:\"CA\";s:8:\"selected\";s:1:\"0\";}i:5;a:3:{s:5:\"label\";s:8:\"Colorado\";s:5:\"value\";s:2:\"CO\";s:8:\"selected\";s:1:\"0\";}i:6;a:3:{s:5:\"label\";s:11:\"Connecticut\";s:5:\"value\";s:2:\"CT\";s:8:\"selected\";s:1:\"0\";}i:7;a:3:{s:5:\"label\";s:8:\"Delaware\";s:5:\"value\";s:2:\"DE\";s:8:\"selected\";s:1:\"0\";}i:8;a:3:{s:5:\"label\";s:20:\"District of Columbia\";s:5:\"value\";s:2:\"DC\";s:8:\"selected\";s:1:\"0\";}i:9;a:3:{s:5:\"label\";s:7:\"Florida\";s:5:\"value\";s:2:\"FL\";s:8:\"selected\";s:1:\"0\";}i:10;a:3:{s:5:\"label\";s:7:\"Georgia\";s:5:\"value\";s:2:\"GA\";s:8:\"selected\";s:1:\"0\";}i:11;a:3:{s:5:\"label\";s:6:\"Hawaii\";s:5:\"value\";s:2:\"HI\";s:8:\"selected\";s:1:\"0\";}i:12;a:3:{s:5:\"label\";s:5:\"Idaho\";s:5:\"value\";s:2:\"ID\";s:8:\"selected\";s:1:\"0\";}i:13;a:3:{s:5:\"label\";s:8:\"Illinois\";s:5:\"value\";s:2:\"IL\";s:8:\"selected\";s:1:\"0\";}i:14;a:3:{s:5:\"label\";s:7:\"Indiana\";s:5:\"value\";s:2:\"IN\";s:8:\"selected\";s:1:\"0\";}i:15;a:3:{s:5:\"label\";s:4:\"Iowa\";s:5:\"value\";s:2:\"IA\";s:8:\"selected\";s:1:\"0\";}i:16;a:3:{s:5:\"label\";s:6:\"Kansas\";s:5:\"value\";s:2:\"KS\";s:8:\"selected\";s:1:\"0\";}i:17;a:3:{s:5:\"label\";s:8:\"Kentucky\";s:5:\"value\";s:2:\"KY\";s:8:\"selected\";s:1:\"0\";}i:18;a:3:{s:5:\"label\";s:9:\"Louisiana\";s:5:\"value\";s:2:\"LA\";s:8:\"selected\";s:1:\"0\";}i:19;a:3:{s:5:\"label\";s:5:\"Maine\";s:5:\"value\";s:2:\"ME\";s:8:\"selected\";s:1:\"0\";}i:20;a:3:{s:5:\"label\";s:8:\"Maryland\";s:5:\"value\";s:2:\"MD\";s:8:\"selected\";s:1:\"0\";}i:21;a:3:{s:5:\"label\";s:13:\"Massachusetts\";s:5:\"value\";s:2:\"MA\";s:8:\"selected\";s:1:\"0\";}i:22;a:3:{s:5:\"label\";s:8:\"Michigan\";s:5:\"value\";s:2:\"MI\";s:8:\"selected\";s:1:\"0\";}i:23;a:3:{s:5:\"label\";s:9:\"Minnesota\";s:5:\"value\";s:2:\"MN\";s:8:\"selected\";s:1:\"0\";}i:24;a:3:{s:5:\"label\";s:11:\"Mississippi\";s:5:\"value\";s:2:\"MS\";s:8:\"selected\";s:1:\"0\";}i:25;a:3:{s:5:\"label\";s:8:\"Missouri\";s:5:\"value\";s:2:\"MO\";s:8:\"selected\";s:1:\"0\";}i:26;a:3:{s:5:\"label\";s:7:\"Montana\";s:5:\"value\";s:2:\"MT\";s:8:\"selected\";s:1:\"0\";}i:27;a:3:{s:5:\"label\";s:8:\"Nebraska\";s:5:\"value\";s:2:\"NE\";s:8:\"selected\";s:1:\"0\";}i:28;a:3:{s:5:\"label\";s:6:\"Nevada\";s:5:\"value\";s:2:\"NV\";s:8:\"selected\";s:1:\"0\";}i:29;a:3:{s:5:\"label\"3s:13:\"New Hampshire\";s:5:\"value\";s:2:\"NH\";s:8:\"selected\";s:1:\"0\";}i:30;a:3:{s:5:\"label\";s:10:\"New Jersey\";s:5:\"value\";s:2:\"NJ\";s:8:\"selected\";s:1:\"0\";}i:31;a:3:{s:5:\"label\";s:10:\"New Mexico\";s:5:\"value\";s:2:\"NM\";s:8:\"selected\";s:1:\"0\";}i:32;a:3:{s:5:\"label\";s:8:\"New York\";s:5:\"value\";s:2:\"NY\";s:8:\"selected\";s:1:\"0\";}i:33;a:3:{s:5:\"label\";s:14:\"North Carolina\";s:5:\"value\";s:2:\"NC\";s:8:\"selected\";s:1:\"0\";}i:34;a:3:{s:5:\"label\";s:12:\"North Dakota\";s:5:\"value\";s:2:\"ND\";s:8:\"selected\";s:1:\"0\";}i:35;a:3:{s:5:\"label\";s:4:\"Ohio\";s:5:\"value\";s:2:\"OH\";s:8:\"selected\";s:1:\"0\";}i:36;a:3:{s:5:\"label\";s:8:\"Oklahoma\";s:5:\"value\";s:2:\"OK\";s:8:\"selected\";s:1:\"0\";}i:37;a:3:{s:5:\"label\";s:6:\"Oregon\";s:5:\"value\";s:2:\"OR\";s:8:\"selected\";s:1:\"0\";}i:38;a:3:{s:5:\"label\";s:12:\"Pennsylvania\";s:5:\"value\";s:2:\"PA\";s:8:\"selected\";s:1:\"0\";}i:39;a:3:{s:5:\"label\";s:12:\"Rhode Island\";s:5:\"value\";s:2:\"RI\";s:8:\"selected\";s:1:\"0\";}i:40;a:3:{s:5:\"label\";s:14:\"South Carolina\";s:5:\"value\";s:2:\"SC\";s:8:\"selected\";s:1:\"0\";}i:41;a:3:{s:5:\"label\";s:12:\"South Dakota\";s:5:\"value\";s:2:\"SD\";s:8:\"selected\";s:1:\"0\";}i:42;a:3:{s:5:\"label\";s:9:\"Tennessee\";s:5:\"value\";s:2:\"TN\";s:8:\"selected\";s:1:\"0\";}i:43;a:3:{s:5:\"label\";s:5:\"Texas\";s:5:\"value\";s:2:\"TX\";s:8:\"selected\";s:1:\"0\";}i:44;a:3:{s:5:\"label\";s:4:\"Utah\";s:5:\"value\";s:2:\"UT\";s:8:\"selected\";s:1:\"0\";}i:45;a:3:{s:5:\"label\";s:7:\"Vermont\";s:5:\"value\";s:2:\"VT\";s:8:\"selected\";s:1:\"0\";}i:46;a:3:{s:5:\"label\";s:8:\"Virginia\";s:5:\"value\";s:2:\"VA\";s:8:\"selected\";s:1:\"0\";}i:47;a:3:{s:5:\"label\";s:10:\"Washington\";s:5:\"value\";s:2:\"WA\";s:8:\"selected\";s:1:\"0\";}i:48;a:3:{s:5:\"label\";s:13:\"West Virginia\";s:5:\"value\";s:2:\"WV\";s:8:\"selected\";s:1:\"0\";}i:49;a:3:{s:5:\"label\";s:9:\"Wisconsin\";s:5:\"value\";s:2:\"WI\";s:8:\"selected\";s:1:\"0\";}i:50;a:3:{s:5:\"label\";s:7:\"Wyoming\";s:5:\"value\";s:2:\"WY\";s:8:\"selected\";s:1:\"0\";}}}s:3:\"req\";s:1:\"0\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";}','State Dropdown');
INSERT INTO `odpch_ninja_forms_fav_fields` VALUES (3,0,'_spam',0,'a:6:{s:9:\"label_pos\";s:4:\"left\";s:5:\"label\";s:18:\"Anti-Spam Question\";s:6:\"answer\";s:16:\"Anti-Spam Answer\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";}','Anti-Spam');
INSERT INTO `odpch_ninja_forms_fav_fields` VALUES (4,0,'_submit',0,'a:4:{s:5:\"label\";s:6:\"Submit\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";}','Submit');
INSERT INTO `odpch_ninja_forms_fav_fields` VALUES (5,0,'_tax',0,'a:11:{s:5:\"label\";s:3:\"Tax\";s:9:\"label_pos\";s:5:\"above\";s:13:\"default_value\";s:0:\"\";s:19:\"payment_field_group\";s:1:\"1\";s:11:\"payment_tax\";s:1:\"1\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:11:\"conditional\";s:0:\"\";s:11:\"calc_option\";s:1:\"0\";s:4:\"calc\";s:0:\"\";}','Tax');
INSERT INTO `odpch_ninja_forms_fav_fields` VALUES (6,0,'_text',0,'a:19:{s:5:\"label\";s:10:\"First Name\";s:9:\"label_pos\";s:5:\"above\";s:13:\"default_value\";s:0:\"\";s:4:\"mask\";s:0:\"\";s:10:\"datepicker\";s:1:\"0\";s:5:\"email\";s:1:\"0\";s:10:\"send_email\";s:1:\"0\";s:10:\"from_email\";s:1:\"0\";s:10:\"first_name\";s:1:\"1\";s:9:\"last_name\";s:1:\"0\";s:9:\"from_name\";s:1:\"0\";s:21:\"user_info_field_group\";s:1:\"1\";s:3:\"req\";s:1:\"0\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:17:\"calc_auto_include\";s:1:\"0\";s:11:\"calc_option\";s:1:\"0\";s:11:\"conditional\";s:0:\"\";}','First Name');
INSERT INTO `odpch_ninja_forms_fav_fields` VALUES (7,0,'_text',0,'a:19:{s:5:\"label\";s:9:\"Last Name\";s:9:\"label_pos\";s:5:\"above\";s:13:\"default_value\";s:0:\"\";s:4:\"mask\";s:0:\"\";s:10:\"datepicker\";s:1:\"0\";s:5:\"email\";s:1:\"0\";s:10:\"send_email\";s:1:\"0\";s:10:\"from_email\";s:1:\"0\";s:10:\"first_name\";s:1:\"0\";s:9:\"last_name\";s:1:\"1\";s:9:\"from_name\";s:1:\"0\";s:21:\"user_info_field_group\";s:1:\"1\";s:3:\"req\";s:1:\"0\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:17:\"calc_auto_include\";s:1:\"0\";s:11:\"calc_option\";s:1:\"0\";s:11:\"conditional\";s:0:\"\";}','Last Name');
INSERT INTO `odpch_ninja_forms_fav_fields` VALUES (8,0,'_text',0,'a:23:{s:5:\"label\";s:9:\"Address 1\";s:9:\"label_pos\";s:5:\"above\";s:13:\"default_value\";s:0:\"\";s:4:\"mask\";s:0:\"\";s:10:\"datepicker\";s:1:\"0\";s:5:\"email\";s:1:\"0\";s:10:\"send_email\";s:1:\"0\";s:10:\"from_email\";s:1:\"0\";s:10:\"first_name\";s:1:\"0\";s:9:\"last_name\";s:1:\"0\";s:9:\"from_name\";s:1:\"0\";s:14:\"user_address_1\";s:1:\"1\";s:14:\"user_address_2\";s:1:\"0\";s:9:\"user_city\";s:1:\"0\";s:8:\"user_zip\";s:1:\"0\";s:21:\"user_info_field_group\";s:1:\"1\";s:3:\"req\";s:1:\"0\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:17:\"calc_auto_include\";s:1:\"0\";s:11:\"calc_option\";s:1:\"0\";s:11:\"conditional\";s:0:\"\";}','Address 1');
INSERT INTO `odpch_ninja_forms_fav_fields` VALUES (9,0,'_text',0,'a:23:{s:5:\"label\";s:9:\"Address 2\";s:9:\"label_pos\";s:5:\"above\";s:13:\"default_value\";s:0:\"\";s:4:\"mask\";s:0:\"\";s:10:\"datepicker\";s:1:\"0\";s:5:\"email\";s:1:\"0\";s:10:\"send_email\";s:1:\"0\";s:10:\"from_email\";s:1:\"0\";s:10:\"first_name\";s:1:\"0\";s:9:\"last_name\";s:1:\"0\";s:9:\"from_name\";s:1:\"0\";s:14:\"user_address_1\";s:1:\"0\";s:14:\"user_address_2\";s:1:\"1\";s:9:\"user_city\";s:1:\"0\";s:8:\"user_zip\";s:1:\"0\";s:21:\"user_info_field_group\";s:1:\"1\";s:3:\"req\";s:1:\"0\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:17:\"calc_auto_include\";s:1:\"0\";s:11:\"calc_option\";s:1:\"0\";s:11:\"conditional\";s:0:\"\";}','Address 2');
INSERT INTO `odpch_ninja_forms_fav_fields` VALUES (10,0,'_text',0,'a:23:{s:5:\"label\";s:4:\"City\";s:9:\"label_pos\";s:5:\"above\";s:13:\"default_value\";s:0:\"\";s:4:\"mask\";s:0:\"\";s:10:\"datepicker\";s:1:\"0\";s:5:\"email\";s:1:\"0\";s:10:\"send_email\";s:1:\"0\";s:10:\"from_email\";s:1:\"0\";s:10:\"first_name\";s:1:\"0\";s:9:\"last_name\";s:1:\"0\";s:9:\"from_name\";s:1:\"0\";s:14:\"user_address_1\";s:1:\"0\";s:14:\"user_address_2\";s:1:\"0\";s:9:\"user_city\";s:1:\"1\";s:8:\"user_zip\";s:1:\"0\";s:21:\"user_info_field_group\";s:1:\"1\";s:3:\"req\";s:1:\"0\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:17:\"calc_auto_include\";s:1:\"0\";s:11:\"calc_option\";s:1:\"0\";s:11:\"conditional\";s:0:\"\";}','City');
INSERT INTO `odpch_ninja_forms_fav_fields` VALUES (11,0,'_list',0,'a:16:{s:5:\"label\";s:5:\"State\";s:9:\"label_pos\";s:5:\"above\";s:10:\"multi_size\";s:1:\"5\";s:15:\"list_show_value\";s:1:\"1\";s:4:\"list\";a:1:{s:7:\"options\";a:51:{i:0;a:4:{s:5:\"label\";s:7:\"Alabama\";s:5:\"value\";s:2:\"AL\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:1;a:4:{s:5:\"label\";s:6:\"Alaska\";s:5:\"value\";s:2:\"AK\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:2;a:4:{s:5:\"label\";s:7:\"Arizona\";s:5:\"value\";s:2:\"AZ\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:3;a:4:{s:5:\"label\";s:8:\"Arkansas\";s:5:\"value\";s:2:\"AR\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:4;a:4:{s:5:\"label\";s:10:\"California\";s:5:\"value\";s:2:\"CA\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:5;a:4:{s:5:\"label\";s:8:\"Colorado\";s:5:\"value\";s:2:\"CO\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:6;a:4:{s:5:\"label\";s:11:\"Connecticut\";s:5:\"value\";s:2:\"CT\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:7;a:4:{s:5:\"label\";s:8:\"Delaware\";s:5:\"value\";s:2:\"DE\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:8;a:4:{s:5:\"label\";s:20:\"District of Columbia\";s:5:\"value\";s:2:\"DC\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:9;a:4:{s:5:\"label\";s:7:\"Florida\";s:5:\"value\";s:2:\"FL\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:10;a:4:{s:5:\"label\";s:7:\"Georgia\";s:5:\"value\";s:2:\"GA\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:11;a:4:{s:5:\"label\";s:6:\"Hawaii\";s:5:\"value\";s:2:\"HI\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:12;a:4:{s:5:\"label\";s:5:\"Idaho\";s:5:\"value\";s:2:\"ID\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:13;a:4:{s:5:\"label\";s:8:\"Illinois\";s:5:\"value\";s:2:\"IL\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:14;a:4:{s:5:\"label\";s:7:\"Indiana\";s:5:\"value\";s:2:\"IN\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:15;a:4:{s:5:\"label\";s:4:\"Iowa\";s:5:\"value\";s:2:\"IA\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:16;a:4:{s:5:\"label\";s:6:\"Kansas\";s:5:\"value\";s:2:\"KS\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:17;a:4:{s:5:\"label\";s:8:\"Kentucky\";s:5:\"value\";s:2:\"KY\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:18;a:4:{s:5:\"label\";s:9:\"Louisiana\";s:5:\"value\";s:2:\"LA\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:19;a:4:{s:5:\"label\";s:5:\"Maine\";s:5:\"value\";s:2:\"ME\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:20;a:4:{s:5:\"label\";s:8:\"Maryland\";s:5:\"value\";s:2:\"MD\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:21;a:4:{s:5:\"label\";s:13:\"Massachusetts\";s:5:\"value\";s:2:\"MA\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:22;a:4:{s:5:\"label\";s:8:\"Michigan\";s:5:\"value\";s:2:\"MI\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:23;a:4:{s:5:\"label\";s:9:\"Minnesota\";s:5:\"value\";s:2:\"MN\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:24;a:4:{s:5:\"label\";s:11:\"Mississippi\";s:5:\"value\";s:2:\"MS\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:25;a:4:{s:5:\"label\";s:8:\"Missouri\";s:5:\"value\";s:2:\"MO\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:26;a:4:{s:5:\"label\";s:7:\"Montana\";s:5:\"value\";s:2:\"MT\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:27;a:4:{s:5:\"label\";s:8:\"Nebraska\";s:5:\"value\";s:2:\"NE\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:28;a:4:{s:5:\"label\";s:6:\"Nevada\";s:5:\"value\";s:2:\"NV\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:29;a:4:{s:5:\"label\";s:13:\"New Hampshire\";s:5:\"value\";s:2:\"NH\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:30;a:4:{s:5:\"label\";s:10:\"New Jersey\";s:5:\"value\";s:2:\"NJ\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:31;a:4:{s:5:\"label\";s:10:\"New Mexico\";s:5:\"value\";s:2:\"NM\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:32;a:4:{s:5:\"label\";s:8:\"New York\";s:5:\"value\";s:2:\"NY\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:33;a:4:{s:5:\"label\";s:14:\"North Carolina\";s:5:\"value\";s:2:\"NC\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:34;a:4:{s:5:\"label\";s:12:\"North Dakota\";s:5:\"value\";s:2:\"ND\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:35;a:4:{s:5:\"label\";s:4:\"Ohio\";s:5:\"value\";s:2:\"OH\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:36;a:4:{s:5:\"label\";s:8:\"Oklahoma\";s:5:\"value\";s:2:\"OK\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:37;a:4:{s:5:\"label\";s:6:\"Oregon\";s:5:\"value\";s:2:\"OR\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:38;a:4:{s:5:\"label\";s:12:\"Pennsylvania\";s:5:\"value\";s:2:\"PA\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:39;a:4:{s:5:\"label\";s:12:\"Rhode Island\";s:5:\"value\";s:2:\"RI\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:40;a:4:{s:5:\"label\";s:14:\"South Carolina\";s:5:\"value\";s:2:\"SC\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:41;a:4:{s:5:\"label\";s:12:\"South Dakota\";s:5:\"value\";s:2:\"SD\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:42;a:4:{s:5:\"label\";s:9:\"Tennessee\";s:5:\"value\";s:2:\"TN\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:43;a:4:{s:5:\"label\";s:5:\"Texas\";s:5:\"value\";s:2:\"TX\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:44;a:4:{s:5:\"label\";s:4:\"Utah\";s:5:\"value\";s:2:\"UT\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:45;a:4:{s:5:\"label\";s:7:\"Vermont\";s:5:\"value\";s:2:\"VT\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:46;a:4:{s:5:\"label\";s:8:\"Virginia\";s:5:\"value\";s:2:\"VA\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:47;a:4:{s:5:\"label\";s:10:\"Washington\";s:5:\"value\";s:2:\"WA\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:48;a:4:{s:5:\"label\";s:13:\"West Virginia\";s:5:\"value\";s:2:\"WV\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:49;a:4:{s:5:\"label\";s:9:\"Wisconsin\";s:5:\"value\";s:2:\"WI\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}i:50;a:4:{s:5:\"label\";s:7:\"Wyoming\";s:5:\"value\";s:2:\"WY\";s:4:\"calc\";s:0:\"\";s:8:\"selected\";s:1:\"0\";}}}s:9:\"list_type\";s:8:\"dropdown\";s:10:\"user_state\";s:1:\"1\";s:21:\"user_info_field_group\";s:1:\"1\";s:13:\"populate_term\";s:0:\"\";s:3:\"req\";s:1:\"0\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:17:\"calc_auto_include\";s:1:\"0\";s:11:\"calc_option\";s:1:\"0\";s:11:\"conditional\";s:0:\"\";}','State');
INSERT INTO `odpch_ninja_forms_fav_fields` VALUES (12,0,'_text',0,'a:23:{s:5:\"label\";s:15:\"Zip / Post Code\";s:9:\"label_pos\";s:5:\"above\";s:13:\"default_value\";s:0:\"\";s:4:\"mask\";s:0:\"\";s:10:\"datepicker\";s:1:\"0\";s:5:\"email\";s:1:\"0\";s:10:\"send_email\";s:1:\"0\";s:10:\"from_email\";s:1:\"0\";s:10:\"first_name\";s:1:\"0\";s:9:\"last_name\";s:1:\"0\";s:9:\"from_name\";s:1:\"0\";s:14:\"user_address_1\";s:1:\"0\";s:14:\"user_address_2\";s:1:\"0\";s:9:\"user_city\";s:1:\"0\";s:8:\"user_zip\";s:1:\"1\";s:21:\"user_info_field_group\";s:1:\"1\";s:3:\"req\";s:1:\"0\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:17:\"calc_auto_include\";s:1:\"0\";s:11:\"calc_option\";s:1:\"0\";s:11:\"conditional\";s:0:\"\";}','Zip / Post Code');
INSERT INTO `odpch_ninja_forms_fav_fields` VALUES (13,0,'_country',0,'a:10:{s:5:\"label\";s:7:\"Country\";s:9:\"label_pos\";s:5:\"above\";s:13:\"default_value\";s:2:\"US\";s:21:\"user_info_field_group\";s:1:\"1\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:17:\"calc_auto_include\";s:1:\"0\";s:11:\"calc_option\";s:1:\"0\";s:11:\"conditional\";s:0:\"\";}','Country');
INSERT INTO `odpch_ninja_forms_fav_fields` VALUES (14,0,'_text',0,'a:25:{s:5:\"label\";s:5:\"Email\";s:9:\"label_pos\";s:5:\"above\";s:13:\"default_value\";s:0:\"\";s:4:\"mask\";s:0:\"\";s:10:\"datepicker\";s:1:\"0\";s:5:\"email\";s:1:\"1\";s:10:\"send_email\";s:1:\"0\";s:10:\"from_email\";s:1:\"0\";s:10:\"first_name\";s:1:\"0\";s:9:\"last_name\";s:1:\"0\";s:9:\"from_name\";s:1:\"0\";s:14:\"user_address_1\";s:1:\"0\";s:14:\"user_address_2\";s:1:\"0\";s:9:\"user_city\";s:1:\"0\";s:8:\"user_zip\";s:1:\"0\";s:10:\"user_phone\";s:1:\"0\";s:10:\"user_email\";s:1:\"1\";s:21:\"user_info_field_group\";s:1:\"1\";s:3:\"req\";s:1:\"0\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:17:\"calc_auto_include\";s:1:\"0\";s:11:\"calc_option\";s:1:\"0\";s:11:\"conditional\";s:0:\"\";}','Email');
INSERT INTO `odpch_ninja_forms_fav_fields` VALUES (15,0,'_text',0,'a:25:{s:5:\"label\";s:5:\"Phone\";s:9:\"label_pos\";s:5:\"above\";s:13:\"default_value\";s:0:\"\";s:4:\"mask\";s:14:\"(999) 999-9999\";s:10:\"datepicker\";s:1:\"0\";s:5:\"email\";s:1:\"0\";s:10:\"send_email\";s:1:\"0\";s:10:\"from_email\";s:1:\"0\";s:10:\"first_name\";s:1:\"0\";s:9:\"last_name\";s:1:\"0\";s:9:\"from_name\";s:1:\"0\";s:14:\"user_address_1\";s:1:\"0\";s:14:\"user_address_2\";s:1:\"0\";s:9:\"user_city\";s:1:\"0\";s:8:\"user_zip\";s:1:\"0\";s:10:\"user_phone\";s:1:\"1\";s:10:\"user_email\";s:1:\"0\";s:21:\"user_info_field_group\";s:1:\"1\";s:3:\"req\";s:1:\"0\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:17:\"calc_auto_include\";s:1:\"0\";s:11:\"calc_option\";s:1:\"0\";s:11:\"conditional\";s:0:\"\";}','Phone');
INSERT INTO `odpch_ninja_forms_fav_fields` VALUES (16,0,'_calc',0,'a:20:{s:9:\"calc_name\";s:9:\"sub_total\";s:13:\"default_value\";s:0:\"\";s:17:\"calc_display_type\";s:4:\"text\";s:5:\"label\";s:9:\"Sub Total\";s:9:\"label_pos\";s:5:\"above\";s:26:\"calc_display_text_disabled\";s:1:\"1\";s:17:\"calc_display_html\";s:26:\"<p>[ninja_forms_calc]</p>\n\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:11:\"calc_method\";s:4:\"auto\";s:4:\"calc\";s:0:\"\";s:7:\"calc_eq\";s:0:\"\";s:19:\"payment_field_group\";s:1:\"1\";s:13:\"payment_total\";s:1:\"0\";s:17:\"payment_sub_total\";s:1:\"1\";s:11:\"calc_places\";s:1:\"2\";s:17:\"calc_auto_include\";s:1:\"0\";s:11:\"calc_option\";s:1:\"0\";s:11:\"conditional\";s:0:\"\";}','Sub Total');
INSERT INTO `odpch_ninja_forms_fav_fields` VALUES (17,0,'_calc',0,'a:20:{s:9:\"calc_name\";s:5:\"total\";s:13:\"default_value\";s:0:\"\";s:17:\"calc_display_type\";s:4:\"text\";s:5:\"label\";s:5:\"Total\";s:9:\"label_pos\";s:5:\"above\";s:26:\"calc_display_text_disabled\";s:1:\"1\";s:17:\"calc_display_html\";s:26:\"<p>[ninja_forms_calc]</p>\n\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:11:\"calc_method\";s:4:\"auto\";s:4:\"calc\";a:5:{i:0;a:2:{s:2:\"op\";s:3:\"add\";s:5:\"field\";s:2:\"70\";}i:1;a:2:{s:2:\"op\";s:3:\"add\";s:5:\"field\";s:2:\"69\";}i:2;a:2:{s:2:\"op\";s:3:\"add\";s:5:\"field\";s:2:\"15\";}i:3;a:2:{s:2:\"op\";s:3:\"add\";s:5:\"field\";s:2:\"61\";}i:4;a:2:{s:2:\"op\";s:3:\"add\";s:5:\"field\";s:2:\"70\";}}s:7:\"calc_eq\";s:5:\"5 + 5\";s:19:\"payment_field_group\";s:1:\"1\";s:13:\"payment_total\";s:1:\"1\";s:17:\"payment_sub_total\";s:1:\"0\";s:11:\"calc_places\";s:1:\"2\";s:17:\"calc_auto_include\";s:1:\"0\";s:11:\"calc_option\";s:1:\"0\";s:11:\"conditional\";s:0:\"\";}','Total');
INSERT INTO `odpch_ninja_forms_fav_fields` VALUES (92,0,'_credit_card',0,'a:6:{s:5:\"label\";s:11:\"Credit Card\";s:19:\"payment_field_group\";s:1:\"1\";s:3:\"req\";s:1:\"0\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:11:\"conditional\";s:0:\"\";}','Credit Card');
/*!40000 ALTER TABLE `odpch_ninja_forms_fav_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odpch_ninja_forms_fields`
--

DROP TABLE IF EXISTS `odpch_ninja_forms_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odpch_ninja_forms_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  `data` longtext NOT NULL,
  `fav_id` int(11) DEFAULT NULL,
  `def_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odpch_ninja_forms_fields`
--

LOCK TABLES `odpch_ninja_forms_fields` WRITE;
/*!40000 ALTER TABLE `odpch_ninja_forms_fields` DISABLE KEYS */;
INSERT INTO `odpch_ninja_forms_fields` VALUES (1,1,'_text',0,'a:24:{s:5:\"label\";s:4:\"Name\";s:9:\"label_pos\";s:5:\"above\";s:13:\"default_value\";s:0:\"\";s:4:\"mask\";s:0:\"\";s:10:\"datepicker\";s:1:\"0\";s:5:\"email\";s:1:\"0\";s:10:\"first_name\";s:0:\"\";s:9:\"last_name\";s:0:\"\";s:9:\"from_name\";s:1:\"0\";s:14:\"user_address_1\";s:0:\"\";s:14:\"user_address_2\";s:0:\"\";s:9:\"user_city\";s:0:\"\";s:8:\"user_zip\";s:0:\"\";s:10:\"user_phone\";s:0:\"\";s:10:\"user_email\";s:0:\"\";s:21:\"user_info_field_group\";s:0:\"\";s:3:\"req\";s:1:\"1\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:9:\"show_desc\";s:1:\"0\";s:8:\"desc_pos\";s:4:\"none\";s:9:\"desc_text\";s:0:\"\";s:17:\"calc_auto_include\";s:1:\"0\";}',0,0);
INSERT INTO `odpch_ninja_forms_fields` VALUES (2,1,'_text',1,'a:28:{s:5:\"label\";s:5:\"Email\";s:9:\"label_pos\";s:5:\"above\";s:13:\"default_value\";s:0:\"\";s:4:\"mask\";s:0:\"\";s:10:\"datepicker\";s:1:\"0\";s:5:\"email\";s:1:\"1\";s:10:\"first_name\";s:1:\"0\";s:9:\"last_name\";s:1:\"0\";s:9:\"from_name\";s:1:\"0\";s:14:\"user_address_1\";s:1:\"0\";s:14:\"user_address_2\";s:1:\"0\";s:9:\"user_city\";s:1:\"0\";s:8:\"user_zip\";s:1:\"0\";s:10:\"user_phone\";s:1:\"0\";s:10:\"user_email\";s:1:\"1\";s:21:\"user_info_field_group\";s:1:\"1\";s:3:\"req\";s:1:\"1\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:17:\"calc_auto_include\";s:1:\"0\";s:11:\"calc_option\";s:1:\"0\";s:11:\"conditional\";s:0:\"\";s:26:\"user_info_field_group_name\";s:0:\"\";s:28:\"user_info_field_group_custom\";s:0:\"\";s:9:\"show_desc\";s:1:\"0\";s:8:\"desc_pos\";s:4:\"none\";s:9:\"desc_text\";s:0:\"\";}',0,14);
INSERT INTO `odpch_ninja_forms_fields` VALUES (3,1,'_textarea',2,'a:14:{s:5:\"label\";s:7:\"Message\";s:9:\"label_pos\";s:5:\"above\";s:13:\"default_value\";s:0:\"\";s:12:\"textarea_rte\";s:1:\"0\";s:14:\"textarea_media\";s:1:\"0\";s:18:\"disable_rte_mobile\";s:1:\"0\";s:3:\"req\";s:1:\"1\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:9:\"show_desc\";s:1:\"0\";s:8:\"desc_pos\";s:4:\"none\";s:9:\"desc_text\";s:0:\"\";s:17:\"calc_auto_include\";s:1:\"0\";}',0,0);
INSERT INTO `odpch_ninja_forms_fields` VALUES (4,1,'_submit',4,'a:7:{s:5:\"label\";s:4:\"Send\";s:5:\"class\";s:0:\"\";s:9:\"show_help\";s:1:\"0\";s:9:\"help_text\";s:0:\"\";s:9:\"show_desc\";s:1:\"0\";s:8:\"desc_pos\";s:4:\"none\";s:9:\"desc_text\";s:0:\"\";}',0,0);
/*!40000 ALTER TABLE `odpch_ninja_forms_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odpch_oauth_access_tokens`
--

DROP TABLE IF EXISTS `odpch_oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odpch_oauth_access_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `access_token` varchar(4000) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odpch_oauth_access_tokens`
--

LOCK TABLES `odpch_oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `odpch_oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `odpch_oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odpch_oauth_authorization_codes`
--

DROP TABLE IF EXISTS `odpch_oauth_authorization_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odpch_oauth_authorization_codes` (
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
-- Dumping data for table `odpch_oauth_authorization_codes`
--

LOCK TABLES `odpch_oauth_authorization_codes` WRITE;
/*!40000 ALTER TABLE `odpch_oauth_authorization_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `odpch_oauth_authorization_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odpch_oauth_clients`
--

DROP TABLE IF EXISTS `odpch_oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odpch_oauth_clients` (
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
-- Dumping data for table `odpch_oauth_clients`
--

LOCK TABLES `odpch_oauth_clients` WRITE;
/*!40000 ALTER TABLE `odpch_oauth_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `odpch_oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odpch_oauth_jwt`
--

DROP TABLE IF EXISTS `odpch_oauth_jwt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odpch_oauth_jwt` (
  `client_id` varchar(80) NOT NULL,
  `subject` varchar(80) DEFAULT NULL,
  `public_key` varchar(2000) NOT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odpch_oauth_jwt`
--

LOCK TABLES `odpch_oauth_jwt` WRITE;
/*!40000 ALTER TABLE `odpch_oauth_jwt` DISABLE KEYS */;
/*!40000 ALTER TABLE `odpch_oauth_jwt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odpch_oauth_public_keys`
--

DROP TABLE IF EXISTS `odpch_oauth_public_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odpch_oauth_public_keys` (
  `client_id` varchar(80) NOT NULL DEFAULT '',
  `public_key` varchar(2000) DEFAULT NULL,
  `private_key` varchar(2000) DEFAULT NULL,
  `encryption_algorithm` varchar(100) DEFAULT 'RS256',
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odpch_oauth_public_keys`
--

LOCK TABLES `odpch_oauth_public_keys` WRITE;
/*!40000 ALTER TABLE `odpch_oauth_public_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `odpch_oauth_public_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odpch_oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `odpch_oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odpch_oauth_refresh_tokens` (
  `refresh_token` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`refresh_token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odpch_oauth_refresh_tokens`
--

LOCK TABLES `odpch_oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `odpch_oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `odpch_oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odpch_oauth_scopes`
--

DROP TABLE IF EXISTS `odpch_oauth_scopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odpch_oauth_scopes` (
  `scope` varchar(80) NOT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`scope`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odpch_oauth_scopes`
--

LOCK TABLES `odpch_oauth_scopes` WRITE;
/*!40000 ALTER TABLE `odpch_oauth_scopes` DISABLE KEYS */;
/*!40000 ALTER TABLE `odpch_oauth_scopes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odpch_options`
--

DROP TABLE IF EXISTS `odpch_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odpch_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odpch_options`
--

LOCK TABLES `odpch_options` WRITE;
/*!40000 ALTER TABLE `odpch_options` DISABLE KEYS */;
INSERT INTO `odpch_options` VALUES (1,'siteurl','http://ogdch.dev/cms','yes');
INSERT INTO `odpch_options` VALUES (2,'home','http://ogdch.dev/cms','yes');
INSERT INTO `odpch_options` VALUES (3,'blogname','ODPCH','yes');
INSERT INTO `odpch_options` VALUES (4,'blogdescription','Open Data Plattform öV Schweiz','yes');
INSERT INTO `odpch_options` VALUES (5,'users_can_register','1','yes');
INSERT INTO `odpch_options` VALUES (6,'admin_email','be-dev@liip.ch','yes');
INSERT INTO `odpch_options` VALUES (7,'start_of_week','1','yes');
INSERT INTO `odpch_options` VALUES (8,'use_balanceTags','0','yes');
INSERT INTO `odpch_options` VALUES (9,'use_smilies','1','yes');
INSERT INTO `odpch_options` VALUES (10,'require_name_email','1','yes');
INSERT INTO `odpch_options` VALUES (11,'comments_notify','1','yes');
INSERT INTO `odpch_options` VALUES (12,'posts_per_rss','10','yes');
INSERT INTO `odpch_options` VALUES (13,'rss_use_excerpt','0','yes');
INSERT INTO `odpch_options` VALUES (14,'mailserver_url','mail.example.com','yes');
INSERT INTO `odpch_options` VALUES (15,'mailserver_login','login@example.com','yes');
INSERT INTO `odpch_options` VALUES (16,'mailserver_pass','password','yes');
INSERT INTO `odpch_options` VALUES (17,'mailserver_port','110','yes');
INSERT INTO `odpch_options` VALUES (18,'default_category','1','yes');
INSERT INTO `odpch_options` VALUES (19,'default_comment_status','open','yes');
INSERT INTO `odpch_options` VALUES (20,'default_ping_status','open','yes');
INSERT INTO `odpch_options` VALUES (21,'default_pingback_flag','0','yes');
INSERT INTO `odpch_options` VALUES (22,'posts_per_page','10','yes');
INSERT INTO `odpch_options` VALUES (23,'date_format','j. F Y','yes');
INSERT INTO `odpch_options` VALUES (24,'time_format','G:i','yes');
INSERT INTO `odpch_options` VALUES (25,'links_updated_date_format','j. F Y G:i','yes');
INSERT INTO `odpch_options` VALUES (26,'comment_moderation','0','yes');
INSERT INTO `odpch_options` VALUES (27,'moderation_notify','1','yes');
INSERT INTO `odpch_options` VALUES (28,'permalink_structure','/%postname%/','yes');
INSERT INTO `odpch_options` VALUES (30,'hack_file','0','yes');
INSERT INTO `odpch_options` VALUES (31,'blog_charset','UTF-8','yes');
INSERT INTO `odpch_options` VALUES (32,'moderation_keys','','no');
INSERT INTO `odpch_options` VALUES (33,'active_plugins','a:11:{i:0;s:21:\"polylang/polylang.php\";i:1;s:47:\"bootstrap-ninja-forms/bootstrap-ninja-forms.php\";i:2;s:19:\"members/members.php\";i:3;s:27:\"ninja-forms/ninja-forms.php\";i:4;s:28:\"oauth2-provider/wp-oauth.php\";i:5;s:17:\"polylang-slug.php\";i:6;s:23:\"ppress/profilepress.php\";i:7;s:29:\"shortcode-ui/shortcode-ui.php\";i:8;s:39:\"syntaxhighlighter/syntaxhighlighter.php\";i:9;s:33:\"tyk-dev-portal/tyk_dev_portal.php\";i:10;s:29:\"wp-discourse/wp-discourse.php\";}','yes');
INSERT INTO `odpch_options` VALUES (34,'category_base','','yes');
INSERT INTO `odpch_options` VALUES (35,'ping_sites','http://rpc.pingomatic.com/','yes');
INSERT INTO `odpch_options` VALUES (36,'comment_max_links','2','yes');
INSERT INTO `odpch_options` VALUES (37,'gmt_offset','','yes');
INSERT INTO `odpch_options` VALUES (38,'default_email_category','1','yes');
INSERT INTO `odpch_options` VALUES (39,'recently_edited','','no');
INSERT INTO `odpch_options` VALUES (40,'template','twentyfifteen','yes');
INSERT INTO `odpch_options` VALUES (41,'stylesheet','twentyfifteen-child','yes');
INSERT INTO `odpch_options` VALUES (42,'comment_whitelist','1','yes');
INSERT INTO `odpch_options` VALUES (43,'blacklist_keys','','no');
INSERT INTO `odpch_options` VALUES (44,'comment_registration','0','yes');
INSERT INTO `odpch_options` VALUES (45,'html_type','text/html','yes');
INSERT INTO `odpch_options` VALUES (46,'use_trackback','0','yes');
INSERT INTO `odpch_options` VALUES (47,'default_role','subscriber','yes');
INSERT INTO `odpch_options` VALUES (48,'db_version','37854','yes');
INSERT INTO `odpch_options` VALUES (49,'uploads_use_yearmonth_folders','1','yes');
INSERT INTO `odpch_options` VALUES (50,'upload_path','','yes');
INSERT INTO `odpch_options` VALUES (51,'blog_public','0','yes');
INSERT INTO `odpch_options` VALUES (52,'default_link_category','2','yes');
INSERT INTO `odpch_options` VALUES (53,'show_on_front','posts','yes');
INSERT INTO `odpch_options` VALUES (54,'tag_base','','yes');
INSERT INTO `odpch_options` VALUES (55,'show_avatars','1','yes');
INSERT INTO `odpch_options` VALUES (56,'avatar_rating','G','yes');
INSERT INTO `odpch_options` VALUES (57,'upload_url_path','','yes');
INSERT INTO `odpch_options` VALUES (58,'thumbnail_size_w','150','yes');
INSERT INTO `odpch_options` VALUES (59,'thumbnail_size_h','150','yes');
INSERT INTO `odpch_options` VALUES (60,'thumbnail_crop','1','yes');
INSERT INTO `odpch_options` VALUES (61,'medium_size_w','300','yes');
INSERT INTO `odpch_options` VALUES (62,'medium_size_h','300','yes');
INSERT INTO `odpch_options` VALUES (63,'avatar_default','mystery','yes');
INSERT INTO `odpch_options` VALUES (64,'large_size_w','1024','yes');
INSERT INTO `odpch_options` VALUES (65,'large_size_h','1024','yes');
INSERT INTO `odpch_options` VALUES (66,'image_default_link_type','none','yes');
INSERT INTO `odpch_options` VALUES (67,'image_default_size','','yes');
INSERT INTO `odpch_options` VALUES (68,'image_default_align','','yes');
INSERT INTO `odpch_options` VALUES (69,'close_comments_for_old_posts','0','yes');
INSERT INTO `odpch_options` VALUES (70,'close_comments_days_old','14','yes');
INSERT INTO `odpch_options` VALUES (71,'thread_comments','1','yes');
INSERT INTO `odpch_options` VALUES (72,'thread_comments_depth','5','yes');
INSERT INTO `odpch_options` VALUES (73,'page_comments','0','yes');
INSERT INTO `odpch_options` VALUES (74,'comments_per_page','50','yes');
INSERT INTO `odpch_options` VALUES (75,'default_comments_page','newest','yes');
INSERT INTO `odpch_options` VALUES (76,'comment_order','asc','yes');
INSERT INTO `odpch_options` VALUES (77,'sticky_posts','a:0:{}','yes');
INSERT INTO `odpch_options` VALUES (78,'widget_categories','a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `odpch_options` VALUES (79,'widget_text','a:0:{}','yes');
INSERT INTO `odpch_options` VALUES (80,'widget_rss','a:0:{}','yes');
INSERT INTO `odpch_options` VALUES (81,'uninstall_plugins','a:2:{s:38:\"ninja-forms/deprecated/ninja-forms.php\";s:21:\"ninja_forms_uninstall\";s:27:\"ninja-forms/ninja-forms.php\";a:2:{i:0;s:8:\"Freemius\";i:1;s:22:\"_uninstall_plugin_hook\";}}','no');
INSERT INTO `odpch_options` VALUES (82,'timezone_string','Europe/Berlin','yes');
INSERT INTO `odpch_options` VALUES (83,'page_for_posts','0','yes');
INSERT INTO `odpch_options` VALUES (84,'page_on_front','0','yes');
INSERT INTO `odpch_options` VALUES (85,'default_post_format','0','yes');
INSERT INTO `odpch_options` VALUES (86,'link_manager_enabled','0','yes');
INSERT INTO `odpch_options` VALUES (87,'finished_splitting_shared_terms','1','yes');
INSERT INTO `odpch_options` VALUES (88,'site_icon','0','yes');
INSERT INTO `odpch_options` VALUES (89,'medium_large_size_w','768','yes');
INSERT INTO `odpch_options` VALUES (90,'medium_large_size_h','0','yes');
INSERT INTO `odpch_options` VALUES (91,'initial_db_version','37854','yes');
INSERT INTO `odpch_options` VALUES (92,'odpch_user_roles','a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:66:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:10:\"list_roles\";b:1;s:12:\"create_roles\";b:1;s:12:\"delete_roles\";b:1;s:10:\"edit_roles\";b:1;s:16:\"restrict_content\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}','yes');
INSERT INTO `odpch_options` VALUES (93,'WPLANG','de_CH','yes');
INSERT INTO `odpch_options` VALUES (94,'widget_search','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `odpch_options` VALUES (95,'widget_recent-posts','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `odpch_options` VALUES (96,'widget_recent-comments','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `odpch_options` VALUES (97,'widget_archives','a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `odpch_options` VALUES (98,'widget_meta','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `odpch_options` VALUES (99,'sidebars_widgets','a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:13:\"array_version\";i:3;}','yes');
INSERT INTO `odpch_options` VALUES (100,'widget_pages','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `odpch_options` VALUES (101,'widget_calendar','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `odpch_options` VALUES (102,'widget_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `odpch_options` VALUES (103,'widget_nav_menu','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `odpch_options` VALUES (104,'cron','a:7:{i:1467812332;a:1:{s:19:\"wo_daily_tasks_hook\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1467816819;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1467816831;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1467843826;a:1:{s:29:\"wp_session_garbage_collection\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1467877113;a:2:{s:20:\"nf_maybe_delete_form\";a:1:{s:32:\"fe0b93ca214a68210e7bc5a7b10fd4b9\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:1:{s:7:\"form_id\";i:1;}}}s:24:\"ninja_forms_daily_action\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1467879878;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}','yes');
INSERT INTO `odpch_options` VALUES (105,'can_compress_scripts','1','no');
INSERT INTO `odpch_options` VALUES (106,'recently_activated','a:1:{s:21:\"json-api/json-api.php\";i:1467793357;}','yes');
INSERT INTO `odpch_options` VALUES (107,'polylang','a:13:{s:7:\"browser\";i:1;s:7:\"rewrite\";i:1;s:12:\"hide_default\";i:0;s:10:\"force_lang\";i:1;s:13:\"redirect_lang\";i:0;s:13:\"media_support\";i:1;s:4:\"sync\";a:0:{}s:10:\"post_types\";a:0:{}s:10:\"taxonomies\";a:0:{}s:7:\"domains\";a:0:{}s:7:\"version\";s:5:\"1.9.3\";s:16:\"previous_version\";s:6:\"1.7.12\";s:12:\"default_lang\";s:2:\"de\";}','yes');
INSERT INTO `odpch_options` VALUES (108,'widget_polylang','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `odpch_options` VALUES (109,'ninja_forms_load_deprecated','1','yes');
INSERT INTO `odpch_options` VALUES (110,'ninja_forms_freemius','1','yes');
INSERT INTO `odpch_options` VALUES (111,'nf_convert_notifications_complete','1','yes');
INSERT INTO `odpch_options` VALUES (112,'nf_convert_subs_step','complete','yes');
INSERT INTO `odpch_options` VALUES (113,'nf_upgrade_notice','closed','yes');
INSERT INTO `odpch_options` VALUES (114,'nf_update_email_settings_complete','1','yes');
INSERT INTO `odpch_options` VALUES (115,'nf_email_fav_updated','1','yes');
INSERT INTO `odpch_options` VALUES (116,'nf_convert_forms_complete','1','yes');
INSERT INTO `odpch_options` VALUES (117,'nf_database_migrations','1','yes');
INSERT INTO `odpch_options` VALUES (118,'ninja_forms_settings','a:18:{s:11:\"date_format\";s:5:\"d/m/Y\";s:15:\"currency_symbol\";s:1:\"$\";s:14:\"recaptcha_lang\";s:2:\"en\";s:13:\"req_div_label\";s:80:\"Fields marked with an <span class=\"ninja-forms-req-symbol\">*</span> are required\";s:16:\"req_field_symbol\";s:18:\"<strong>*</strong>\";s:15:\"req_error_label\";s:48:\"Please ensure all required fields are completed.\";s:15:\"req_field_error\";s:24:\"This is a required field\";s:10:\"spam_error\";s:47:\"Please answer the anti-spam question correctly.\";s:14:\"honeypot_error\";s:34:\"Please leave the spam field blank.\";s:18:\"timed_submit_error\";s:31:\"Please wait to submit the form.\";s:16:\"javascript_error\";s:54:\"You cannot submit the form without Javascript enabled.\";s:13:\"invalid_email\";s:35:\"Please enter a valid email address.\";s:13:\"process_label\";s:10:\"Processing\";s:17:\"password_mismatch\";s:36:\"The passwords provided do not match.\";s:10:\"preview_id\";i:4;s:7:\"version\";s:6:\"2.9.51\";s:19:\"fix_form_email_from\";i:1;s:18:\"fix_field_reply_to\";i:1;}','yes');
INSERT INTO `odpch_options` VALUES (119,'ninja_forms_version','2.9.47','yes');
INSERT INTO `odpch_options` VALUES (120,'fs_active_plugins','O:8:\"stdClass\":2:{s:7:\"plugins\";a:1:{s:24:\"ninja-forms/lib/Freemius\";O:8:\"stdClass\":3:{s:7:\"version\";s:7:\"1.1.7.4\";s:9:\"timestamp\";i:1467790713;s:11:\"plugin_path\";s:27:\"ninja-forms/ninja-forms.php\";}}s:6:\"newest\";O:8:\"stdClass\":5:{s:11:\"plugin_path\";s:27:\"ninja-forms/ninja-forms.php\";s:8:\"sdk_path\";s:24:\"ninja-forms/lib/Freemius\";s:7:\"version\";s:7:\"1.1.7.4\";s:13:\"in_activation\";b:0;s:9:\"timestamp\";i:1467790713;}}','yes');
INSERT INTO `odpch_options` VALUES (121,'fs_accounts','a:5:{s:11:\"plugin_data\";a:1:{s:11:\"ninja-forms\";a:13:{s:16:\"plugin_main_file\";O:8:\"stdClass\":1:{s:4:\"path\";s:62:\"/var/www/ogdch.dev/content/plugins/ninja-forms/ninja-forms.php\";}s:17:\"install_timestamp\";i:1467790713;s:16:\"sdk_last_version\";N;s:11:\"sdk_version\";s:7:\"1.1.7.4\";s:16:\"sdk_upgrade_mode\";b:1;s:18:\"sdk_downgrade_mode\";b:0;s:19:\"plugin_last_version\";N;s:14:\"plugin_version\";s:6:\"2.9.47\";s:19:\"plugin_upgrade_mode\";b:1;s:21:\"plugin_downgrade_mode\";b:0;s:17:\"connectivity_test\";a:6:{s:12:\"is_connected\";b:1;s:4:\"host\";s:9:\"ogdch.dev\";s:9:\"server_ip\";s:12:\"192.168.56.1\";s:9:\"is_active\";b:1;s:9:\"timestamp\";i:1467790713;s:7:\"version\";s:6:\"2.9.47\";}s:18:\"sticky_optin_added\";b:1;s:12:\"is_anonymous\";a:3:{s:2:\"is\";b:1;s:9:\"timestamp\";i:1467803979;s:7:\"version\";s:6:\"2.9.47\";}}}s:13:\"file_slug_map\";a:1:{s:27:\"ninja-forms/ninja-forms.php\";s:11:\"ninja-forms\";}s:7:\"plugins\";a:1:{s:11:\"ninja-forms\";O:9:\"FS_Plugin\":15:{s:16:\"parent_plugin_id\";N;s:5:\"title\";s:11:\"Ninja Forms\";s:4:\"slug\";s:11:\"ninja-forms\";s:4:\"file\";s:27:\"ninja-forms/ninja-forms.php\";s:7:\"version\";s:6:\"2.9.47\";s:11:\"auto_update\";N;s:4:\"info\";N;s:10:\"is_premium\";b:0;s:7:\"is_live\";b:1;s:10:\"public_key\";s:32:\"pk_f2f84038951d45fc8e4ff9747da6d\";s:10:\"secret_key\";N;s:2:\"id\";s:3:\"209\";s:7:\"updated\";N;s:7:\"created\";N;s:22:\"\0FS_Entity\0_is_updated\";b:0;}}s:9:\"unique_id\";s:32:\"782fd59e4b9219ab7559fb392b27cfd0\";s:13:\"admin_notices\";a:1:{s:11:\"ninja-forms\";a:0:{}}}','yes');
INSERT INTO `odpch_options` VALUES (122,'widget_ninja_forms_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `odpch_options` VALUES (123,'nf_admin_notice','a:2:{s:10:\"three_info\";a:3:{s:5:\"start\";s:8:\"7/6/2016\";s:3:\"int\";i:0;s:9:\"dismissed\";i:1;}s:16:\"one_week_support\";a:2:{s:5:\"start\";s:9:\"7/13/2016\";s:3:\"int\";i:7;}}','yes');
INSERT INTO `odpch_options` VALUES (124,'rewrite_rules','a:148:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:11:\"^oauth/(.+)\";s:27:\"index.php?oauth=$matches[1]\";s:17:\"^.well-known/(.+)\";s:32:\"index.php?well-known=$matches[1]\";s:21:\"^wpoauthincludes/(.+)\";s:37:\"index.php?wpoauthincludes=$matches[1]\";s:61:\"(de|en|fr|it)/category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:69:\"index.php?lang=$matches[1]&category_name=$matches[2]&feed=$matches[3]\";s:56:\"(de|en|fr|it)/category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:69:\"index.php?lang=$matches[1]&category_name=$matches[2]&feed=$matches[3]\";s:37:\"(de|en|fr|it)/category/(.+?)/embed/?$\";s:63:\"index.php?lang=$matches[1]&category_name=$matches[2]&embed=true\";s:49:\"(de|en|fr|it)/category/(.+?)/page/?([0-9]{1,})/?$\";s:70:\"index.php?lang=$matches[1]&category_name=$matches[2]&paged=$matches[3]\";s:31:\"(de|en|fr|it)/category/(.+?)/?$\";s:52:\"index.php?lang=$matches[1]&category_name=$matches[2]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:58:\"(de|en|fr|it)/tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:59:\"index.php?lang=$matches[1]&tag=$matches[2]&feed=$matches[3]\";s:53:\"(de|en|fr|it)/tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:59:\"index.php?lang=$matches[1]&tag=$matches[2]&feed=$matches[3]\";s:34:\"(de|en|fr|it)/tag/([^/]+)/embed/?$\";s:53:\"index.php?lang=$matches[1]&tag=$matches[2]&embed=true\";s:46:\"(de|en|fr|it)/tag/([^/]+)/page/?([0-9]{1,})/?$\";s:60:\"index.php?lang=$matches[1]&tag=$matches[2]&paged=$matches[3]\";s:28:\"(de|en|fr|it)/tag/([^/]+)/?$\";s:42:\"index.php?lang=$matches[1]&tag=$matches[2]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:59:\"(de|en|fr|it)/type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:67:\"index.php?lang=$matches[1]&post_format=$matches[2]&feed=$matches[3]\";s:54:\"(de|en|fr|it)/type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:67:\"index.php?lang=$matches[1]&post_format=$matches[2]&feed=$matches[3]\";s:35:\"(de|en|fr|it)/type/([^/]+)/embed/?$\";s:61:\"index.php?lang=$matches[1]&post_format=$matches[2]&embed=true\";s:47:\"(de|en|fr|it)/type/([^/]+)/page/?([0-9]{1,})/?$\";s:68:\"index.php?lang=$matches[1]&post_format=$matches[2]&paged=$matches[3]\";s:29:\"(de|en|fr|it)/type/([^/]+)/?$\";s:50:\"index.php?lang=$matches[1]&post_format=$matches[2]\";s:34:\"nf_sub/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:44:\"nf_sub/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:64:\"nf_sub/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"nf_sub/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"nf_sub/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:40:\"nf_sub/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:23:\"nf_sub/([^/]+)/embed/?$\";s:39:\"index.php?nf_sub=$matches[1]&embed=true\";s:27:\"nf_sub/([^/]+)/trackback/?$\";s:33:\"index.php?nf_sub=$matches[1]&tb=1\";s:35:\"nf_sub/([^/]+)/page/?([0-9]{1,})/?$\";s:46:\"index.php?nf_sub=$matches[1]&paged=$matches[2]\";s:42:\"nf_sub/([^/]+)/comment-page-([0-9]{1,})/?$\";s:46:\"index.php?nf_sub=$matches[1]&cpage=$matches[2]\";s:31:\"nf_sub/([^/]+)(?:/([0-9]+))?/?$\";s:45:\"index.php?nf_sub=$matches[1]&page=$matches[2]\";s:23:\"nf_sub/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:33:\"nf_sub/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:53:\"nf_sub/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:48:\"nf_sub/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:48:\"nf_sub/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:29:\"nf_sub/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:46:\"(de|en|fr|it)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?lang=$matches[1]&&feed=$matches[2]\";s:41:\"(de|en|fr|it)/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?lang=$matches[1]&&feed=$matches[2]\";s:22:\"(de|en|fr|it)/embed/?$\";s:38:\"index.php?lang=$matches[1]&&embed=true\";s:34:\"(de|en|fr|it)/page/?([0-9]{1,})/?$\";s:45:\"index.php?lang=$matches[1]&&paged=$matches[2]\";s:16:\"(de|en|fr|it)/?$\";s:26:\"index.php?lang=$matches[1]\";s:55:\"(de|en|fr|it)/comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:59:\"index.php?lang=$matches[1]&&feed=$matches[2]&withcomments=1\";s:50:\"(de|en|fr|it)/comments/(feed|rdf|rss|rss2|atom)/?$\";s:59:\"index.php?lang=$matches[1]&&feed=$matches[2]&withcomments=1\";s:31:\"(de|en|fr|it)/comments/embed/?$\";s:38:\"index.php?lang=$matches[1]&&embed=true\";s:58:\"(de|en|fr|it)/search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:57:\"index.php?lang=$matches[1]&s=$matches[2]&feed=$matches[3]\";s:53:\"(de|en|fr|it)/search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:57:\"index.php?lang=$matches[1]&s=$matches[2]&feed=$matches[3]\";s:34:\"(de|en|fr|it)/search/(.+)/embed/?$\";s:51:\"index.php?lang=$matches[1]&s=$matches[2]&embed=true\";s:46:\"(de|en|fr|it)/search/(.+)/page/?([0-9]{1,})/?$\";s:58:\"index.php?lang=$matches[1]&s=$matches[2]&paged=$matches[3]\";s:28:\"(de|en|fr|it)/search/(.+)/?$\";s:40:\"index.php?lang=$matches[1]&s=$matches[2]\";s:61:\"(de|en|fr|it)/author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:67:\"index.php?lang=$matches[1]&author_name=$matches[2]&feed=$matches[3]\";s:56:\"(de|en|fr|it)/author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:67:\"index.php?lang=$matches[1]&author_name=$matches[2]&feed=$matches[3]\";s:37:\"(de|en|fr|it)/author/([^/]+)/embed/?$\";s:61:\"index.php?lang=$matches[1]&author_name=$matches[2]&embed=true\";s:49:\"(de|en|fr|it)/author/([^/]+)/page/?([0-9]{1,})/?$\";s:68:\"index.php?lang=$matches[1]&author_name=$matches[2]&paged=$matches[3]\";s:31:\"(de|en|fr|it)/author/([^/]+)/?$\";s:50:\"index.php?lang=$matches[1]&author_name=$matches[2]\";s:83:\"(de|en|fr|it)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&feed=$matches[5]\";s:78:\"(de|en|fr|it)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&feed=$matches[5]\";s:59:\"(de|en|fr|it)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:91:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&embed=true\";s:71:\"(de|en|fr|it)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:98:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&paged=$matches[5]\";s:53:\"(de|en|fr|it)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:80:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]\";s:70:\"(de|en|fr|it)/([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:81:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&feed=$matches[4]\";s:65:\"(de|en|fr|it)/([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:81:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&feed=$matches[4]\";s:46:\"(de|en|fr|it)/([0-9]{4})/([0-9]{1,2})/embed/?$\";s:75:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&embed=true\";s:58:\"(de|en|fr|it)/([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:82:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&paged=$matches[4]\";s:40:\"(de|en|fr|it)/([0-9]{4})/([0-9]{1,2})/?$\";s:64:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]\";s:57:\"(de|en|fr|it)/([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:60:\"index.php?lang=$matches[1]&year=$matches[2]&feed=$matches[3]\";s:52:\"(de|en|fr|it)/([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:60:\"index.php?lang=$matches[1]&year=$matches[2]&feed=$matches[3]\";s:33:\"(de|en|fr|it)/([0-9]{4})/embed/?$\";s:54:\"index.php?lang=$matches[1]&year=$matches[2]&embed=true\";s:45:\"(de|en|fr|it)/([0-9]{4})/page/?([0-9]{1,})/?$\";s:61:\"index.php?lang=$matches[1]&year=$matches[2]&paged=$matches[3]\";s:27:\"(de|en|fr|it)/([0-9]{4})/?$\";s:43:\"index.php?lang=$matches[1]&year=$matches[2]\";s:41:\"(de|en|fr|it)/.?.+?/attachment/([^/]+)/?$\";s:49:\"index.php?lang=$matches[1]&attachment=$matches[2]\";s:51:\"(de|en|fr|it)/.?.+?/attachment/([^/]+)/trackback/?$\";s:54:\"index.php?lang=$matches[1]&attachment=$matches[2]&tb=1\";s:71:\"(de|en|fr|it)/.?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:66:\"(de|en|fr|it)/.?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:66:\"(de|en|fr|it)/.?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:67:\"index.php?lang=$matches[1]&attachment=$matches[2]&cpage=$matches[3]\";s:47:\"(de|en|fr|it)/.?.+?/attachment/([^/]+)/embed/?$\";s:60:\"index.php?lang=$matches[1]&attachment=$matches[2]&embed=true\";s:30:\"(de|en|fr|it)/(.?.+?)/embed/?$\";s:58:\"index.php?lang=$matches[1]&pagename=$matches[2]&embed=true\";s:34:\"(de|en|fr|it)/(.?.+?)/trackback/?$\";s:52:\"index.php?lang=$matches[1]&pagename=$matches[2]&tb=1\";s:54:\"(de|en|fr|it)/(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?lang=$matches[1]&pagename=$matches[2]&feed=$matches[3]\";s:49:\"(de|en|fr|it)/(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?lang=$matches[1]&pagename=$matches[2]&feed=$matches[3]\";s:42:\"(de|en|fr|it)/(.?.+?)/page/?([0-9]{1,})/?$\";s:65:\"index.php?lang=$matches[1]&pagename=$matches[2]&paged=$matches[3]\";s:49:\"(de|en|fr|it)/(.?.+?)/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?lang=$matches[1]&pagename=$matches[2]&cpage=$matches[3]\";s:38:\"(de|en|fr|it)/(.?.+?)(?:/([0-9]+))?/?$\";s:64:\"index.php?lang=$matches[1]&pagename=$matches[2]&page=$matches[3]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:41:\"(de|en|fr|it)/[^/]+/attachment/([^/]+)/?$\";s:49:\"index.php?lang=$matches[1]&attachment=$matches[2]\";s:51:\"(de|en|fr|it)/[^/]+/attachment/([^/]+)/trackback/?$\";s:54:\"index.php?lang=$matches[1]&attachment=$matches[2]&tb=1\";s:71:\"(de|en|fr|it)/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:66:\"(de|en|fr|it)/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:66:\"(de|en|fr|it)/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:67:\"index.php?lang=$matches[1]&attachment=$matches[2]&cpage=$matches[3]\";s:47:\"(de|en|fr|it)/[^/]+/attachment/([^/]+)/embed/?$\";s:60:\"index.php?lang=$matches[1]&attachment=$matches[2]&embed=true\";s:30:\"(de|en|fr|it)/([^/]+)/embed/?$\";s:54:\"index.php?lang=$matches[1]&name=$matches[2]&embed=true\";s:34:\"(de|en|fr|it)/([^/]+)/trackback/?$\";s:48:\"index.php?lang=$matches[1]&name=$matches[2]&tb=1\";s:54:\"(de|en|fr|it)/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:60:\"index.php?lang=$matches[1]&name=$matches[2]&feed=$matches[3]\";s:49:\"(de|en|fr|it)/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:60:\"index.php?lang=$matches[1]&name=$matches[2]&feed=$matches[3]\";s:42:\"(de|en|fr|it)/([^/]+)/page/?([0-9]{1,})/?$\";s:61:\"index.php?lang=$matches[1]&name=$matches[2]&paged=$matches[3]\";s:49:\"(de|en|fr|it)/([^/]+)/comment-page-([0-9]{1,})/?$\";s:61:\"index.php?lang=$matches[1]&name=$matches[2]&cpage=$matches[3]\";s:38:\"(de|en|fr|it)/([^/]+)(?:/([0-9]+))?/?$\";s:60:\"index.php?lang=$matches[1]&name=$matches[2]&page=$matches[3]\";s:30:\"(de|en|fr|it)/[^/]+/([^/]+)/?$\";s:49:\"index.php?lang=$matches[1]&attachment=$matches[2]\";s:40:\"(de|en|fr|it)/[^/]+/([^/]+)/trackback/?$\";s:54:\"index.php?lang=$matches[1]&attachment=$matches[2]&tb=1\";s:60:\"(de|en|fr|it)/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:55:\"(de|en|fr|it)/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&attachment=$matches[2]&feed=$matches[3]\";s:55:\"(de|en|fr|it)/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:67:\"index.php?lang=$matches[1]&attachment=$matches[2]&cpage=$matches[3]\";s:36:\"(de|en|fr|it)/[^/]+/([^/]+)/embed/?$\";s:60:\"index.php?lang=$matches[1]&attachment=$matches[2]&embed=true\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}','yes');
INSERT INTO `odpch_options` VALUES (125,'wo_options','a:14:{s:7:\"enabled\";i:1;s:16:\"client_id_length\";i:30;s:17:\"auth_code_enabled\";i:1;s:20:\"client_creds_enabled\";i:0;s:18:\"user_creds_enabled\";i:0;s:22:\"refresh_tokens_enabled\";i:0;s:16:\"implicit_enabled\";i:0;s:26:\"require_exact_redirect_uri\";i:0;s:13:\"enforce_state\";i:0;s:22:\"refresh_token_lifetime\";i:864000;s:21:\"access_token_lifetime\";i:86400;s:18:\"use_openid_connect\";i:0;s:11:\"id_lifetime\";i:3600;s:17:\"id_token_lifetime\";i:3600;}','yes');
INSERT INTO `odpch_options` VALUES (126,'wpoauth_version','3.1.97','yes');
INSERT INTO `odpch_options` VALUES (127,'discourse_version','0.7.0','yes');
INSERT INTO `odpch_options` VALUES (128,'discourse','a:21:{s:3:\"url\";s:0:\"\";s:7:\"api-key\";s:0:\"\";s:10:\"enable-sso\";i:0;s:10:\"sso-secret\";s:0:\"\";s:16:\"publish-username\";s:6:\"system\";s:16:\"publish-category\";s:0:\"\";s:12:\"auto-publish\";i:0;s:18:\"allowed_post_types\";a:1:{i:0;s:4:\"post\";}s:10:\"auto-track\";i:1;s:12:\"max-comments\";i:5;s:22:\"use-discourse-comments\";i:0;s:22:\"show-existing-comments\";i:0;s:9:\"min-score\";i:30;s:11:\"min-replies\";i:1;s:15:\"min-trust-level\";i:1;s:21:\"custom-excerpt-length\";i:55;s:24:\"bypass-trust-level-score\";i:50;s:10:\"debug-mode\";i:0;s:17:\"full-post-content\";i:0;s:25:\"only-show-moderator-liked\";i:0;s:10:\"login-path\";s:0:\"\";}','yes');
INSERT INTO `odpch_options` VALUES (129,'pp_settings_data','a:5:{s:21:\"set_lost_password_url\";s:1:\"7\";s:13:\"set_login_url\";s:1:\"5\";s:20:\"set_registration_url\";s:1:\"6\";s:15:\"set_log_out_url\";s:1:\"5\";s:18:\"set_login_redirect\";s:1:\"8\";}','yes');
INSERT INTO `odpch_options` VALUES (130,'pp_plugin_lite_activated','true','yes');
INSERT INTO `odpch_options` VALUES (131,'pp_db_lite_ver','3','no');
INSERT INTO `odpch_options` VALUES (132,'theme_mods_twentyfifteen','a:1:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1467793457;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}}','yes');
INSERT INTO `odpch_options` VALUES (133,'current_theme','ODPCH temporär','yes');
INSERT INTO `odpch_options` VALUES (134,'theme_mods_twentyfifteen-child','a:1:{i:0;b:0;}','yes');
INSERT INTO `odpch_options` VALUES (135,'theme_switched','','yes');
INSERT INTO `odpch_options` VALUES (138,'category_children','a:0:{}','yes');
/*!40000 ALTER TABLE `odpch_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odpch_postmeta`
--

DROP TABLE IF EXISTS `odpch_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odpch_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odpch_postmeta`
--

LOCK TABLES `odpch_postmeta` WRITE;
/*!40000 ALTER TABLE `odpch_postmeta` DISABLE KEYS */;
INSERT INTO `odpch_postmeta` VALUES (2,8,'_edit_last','1');
INSERT INTO `odpch_postmeta` VALUES (3,8,'_wp_page_template','page-dashboard.php');
INSERT INTO `odpch_postmeta` VALUES (5,8,'_edit_lock','1467803728:1');
INSERT INTO `odpch_postmeta` VALUES (13,8,'publish_to_discourse','0');
INSERT INTO `odpch_postmeta` VALUES (20,13,'_edit_last','1');
INSERT INTO `odpch_postmeta` VALUES (21,13,'_edit_lock','1467804062:1');
INSERT INTO `odpch_postmeta` VALUES (22,13,'_wp_page_template','default');
INSERT INTO `odpch_postmeta` VALUES (24,13,'publish_to_discourse','0');
INSERT INTO `odpch_postmeta` VALUES (27,14,'_edit_last','1');
INSERT INTO `odpch_postmeta` VALUES (28,14,'_edit_lock','1467804601:1');
INSERT INTO `odpch_postmeta` VALUES (29,14,'_wp_page_template','default');
INSERT INTO `odpch_postmeta` VALUES (30,14,'publish_to_discourse','0');
INSERT INTO `odpch_postmeta` VALUES (31,15,'_edit_last','1');
INSERT INTO `odpch_postmeta` VALUES (32,15,'_wp_page_template','default');
INSERT INTO `odpch_postmeta` VALUES (34,15,'_edit_lock','1467804618:1');
INSERT INTO `odpch_postmeta` VALUES (35,15,'publish_to_discourse','0');
INSERT INTO `odpch_postmeta` VALUES (61,21,'_edit_lock','1467810561:1');
INSERT INTO `odpch_postmeta` VALUES (62,21,'_edit_last','1');
INSERT INTO `odpch_postmeta` VALUES (63,22,'_wp_attached_file','2016/07/SBB-Logo.png');
INSERT INTO `odpch_postmeta` VALUES (64,22,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:1016;s:6:\"height\";i:185;s:4:\"file\";s:20:\"2016/07/SBB-Logo.png\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"SBB-Logo-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:19:\"SBB-Logo-300x55.png\";s:5:\"width\";i:300;s:6:\"height\";i:55;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:20:\"SBB-Logo-768x140.png\";s:5:\"width\";i:768;s:6:\"height\";i:140;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"post-thumbnail\";a:4:{s:4:\"file\";s:20:\"SBB-Logo-825x185.png\";s:5:\"width\";i:825;s:6:\"height\";i:185;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `odpch_postmeta` VALUES (65,21,'_wp_page_template','default');
INSERT INTO `odpch_postmeta` VALUES (70,21,'_syntaxhighlighter_encoded','1');
INSERT INTO `odpch_postmeta` VALUES (78,24,'_edit_lock','1467810560:1');
INSERT INTO `odpch_postmeta` VALUES (79,24,'_edit_last','1');
INSERT INTO `odpch_postmeta` VALUES (80,24,'_wp_page_template','default');
INSERT INTO `odpch_postmeta` VALUES (90,7,'_edit_lock','1467810083:1');
INSERT INTO `odpch_postmeta` VALUES (95,29,'_edit_last','1');
INSERT INTO `odpch_postmeta` VALUES (97,29,'publish_to_discourse','0');
INSERT INTO `odpch_postmeta` VALUES (98,29,'_edit_lock','1467810548:1');
INSERT INTO `odpch_postmeta` VALUES (112,21,'publish_to_discourse','0');
INSERT INTO `odpch_postmeta` VALUES (113,24,'_syntaxhighlighter_encoded','1');
INSERT INTO `odpch_postmeta` VALUES (114,24,'publish_to_discourse','0');
/*!40000 ALTER TABLE `odpch_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odpch_posts`
--

DROP TABLE IF EXISTS `odpch_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odpch_posts` (
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odpch_posts`
--

LOCK TABLES `odpch_posts` WRITE;
/*!40000 ALTER TABLE `odpch_posts` DISABLE KEYS */;
INSERT INTO `odpch_posts` VALUES (3,1,'2016-07-05 16:53:47','0000-00-00 00:00:00','','Automatisch gespeicherter Entwurf','','auto-draft','open','open','','','','','2016-07-05 16:53:47','0000-00-00 00:00:00','',0,'http://ogdch.dev/?p=3',0,'post','',0);
INSERT INTO `odpch_posts` VALUES (5,1,'2016-07-06 09:47:39','2016-07-06 07:47:39','[profilepress-login id=\"1\"]','Log In','','publish','closed','closed','','log-in','','','2016-07-06 09:47:39','2016-07-06 07:47:39','',0,'http://ogdch.dev/?page_id=5',0,'page','',0);
INSERT INTO `odpch_posts` VALUES (6,1,'2016-07-06 09:47:39','2016-07-06 07:47:39','[profilepress-registration id=\"1\"]','Sign Up','','publish','closed','closed','','sign-up','','','2016-07-06 09:47:39','2016-07-06 07:47:39','',0,'http://ogdch.dev/?page_id=6',0,'page','',0);
INSERT INTO `odpch_posts` VALUES (7,1,'2016-07-06 09:47:39','2016-07-06 07:47:39','[profilepress-password-reset id=\"1\"]','Reset Password','','publish','closed','closed','','reset-password','','','2016-07-06 09:47:39','2016-07-06 07:47:39','',0,'http://ogdch.dev/?page_id=7',0,'page','',0);
INSERT INTO `odpch_posts` VALUES (8,1,'2016-07-06 10:24:46','2016-07-06 08:24:46','','Dashboard','','publish','closed','closed','','developerportal','','','2016-07-06 11:10:17','2016-07-06 09:10:17','',0,'http://ogdch.dev/?page_id=8',0,'page','',0);
INSERT INTO `odpch_posts` VALUES (9,1,'2016-07-06 10:41:04','2016-07-06 08:41:04','a:0:{}','polylang_mo_2','','private','closed','closed','','polylang_mo_2','','','2016-07-06 10:41:04','2016-07-06 08:41:04','',0,'http://ogdch.dev/?post_type=polylang_mo&p=9',0,'polylang_mo','',0);
INSERT INTO `odpch_posts` VALUES (10,1,'2016-07-06 10:41:21','2016-07-06 08:41:21','a:0:{}','polylang_mo_5','','private','closed','closed','','polylang_mo_5','','','2016-07-06 10:41:21','2016-07-06 08:41:21','',0,'http://ogdch.dev/?post_type=polylang_mo&p=10',0,'polylang_mo','',0);
INSERT INTO `odpch_posts` VALUES (11,1,'2016-07-06 10:41:33','2016-07-06 08:41:33','a:0:{}','polylang_mo_9','','private','closed','closed','','polylang_mo_9','','','2016-07-06 10:41:33','2016-07-06 08:41:33','',0,'http://ogdch.dev/?post_type=polylang_mo&p=11',0,'polylang_mo','',0);
INSERT INTO `odpch_posts` VALUES (12,1,'2016-07-06 10:42:11','2016-07-06 08:42:11','a:0:{}','polylang_mo_13','','private','closed','closed','','polylang_mo_13','','','2016-07-06 10:42:11','2016-07-06 08:42:11','',0,'http://ogdch.dev/?post_type=polylang_mo&p=12',0,'polylang_mo','',0);
INSERT INTO `odpch_posts` VALUES (13,1,'2016-07-06 13:23:08','2016-07-06 11:23:08','[ninja_forms id=1]','Kontakt','','publish','closed','closed','','contact','','','2016-07-06 13:23:22','2016-07-06 11:23:22','',0,'http://ogdch.dev/?page_id=13',0,'page','',0);
INSERT INTO `odpch_posts` VALUES (14,1,'2016-07-06 13:32:14','2016-07-06 11:32:14','','Über das Portal','','publish','closed','closed','','about','','','2016-07-06 13:32:14','2016-07-06 11:32:14','',0,'http://ogdch.dev/?page_id=14',0,'page','',0);
INSERT INTO `odpch_posts` VALUES (15,1,'2016-07-06 13:32:33','2016-07-06 11:32:33','','Glossar','','publish','closed','closed','','glossar','','','2016-07-06 13:32:40','2016-07-06 11:32:40','',0,'http://ogdch.dev/?page_id=15',0,'page','',0);
INSERT INTO `odpch_posts` VALUES (21,1,'2016-07-06 14:35:56','2016-07-06 12:35:56','Text\r\n\r\nBild:\r\n\r\n<img class=\"alignnone size-medium wp-image-22\" src=\"http://ogdch.dev/content/uploads/2016/07/SBB-Logo-300x55.png\" alt=\"SBB-Logo\" width=\"300\" height=\"55\" />\r\n\r\nXML Code:\r\n[xml]\r\n&lt;note&gt;\r\n    &lt;to&gt;Tove&lt;/to&gt;\r\n    &lt;from&gt;Jani&lt;/from&gt;\r\n    &lt;heading&gt;Reminder&lt;/heading&gt;\r\n    &lt;body&gt;Don\'t forget me this weekend!&lt;/body&gt;\r\n&lt;/note&gt;\r\n[/xml]\r\n','Abfahrts-/Ankunftsanzeiger','','publish','closed','closed','','abfahrts-ankunftsanzeiger','','','2016-07-06 15:10:40','2016-07-06 13:10:40','',0,'http://ogdch.dev/?page_id=21',0,'page','',0);
INSERT INTO `odpch_posts` VALUES (22,1,'2016-07-06 14:31:23','2016-07-06 12:31:23','','SBB-Logo','','inherit','open','closed','','sbb-logo','','','2016-07-06 14:31:23','2016-07-06 12:31:23','',21,'http://ogdch.dev/content/uploads/2016/07/SBB-Logo.png',0,'attachment','image/png',0);
INSERT INTO `odpch_posts` VALUES (23,1,'2016-07-06 14:41:17','2016-07-06 12:41:17','Text\r\n\r\nBild:\r\n\r\n<img class=\"alignnone size-medium wp-image-22\" src=\"http://ogdch.dev/content/uploads/2016/07/SBB-Logo-300x55.png\" alt=\"SBB-Logo\" width=\"300\" height=\"55\" />\r\n\r\n[php]\r\n&lt;?php\r\nphpinfo();\r\n?&gt;\r\n[/php]\r\n\r\n[html]\r\n&lt;note&gt;\r\n    &lt;to&gt;Tove&lt;/to&gt;\r\n    &lt;from&gt;Jani&lt;/from&gt;\r\n    &lt;heading&gt;Reminder&lt;/heading&gt;\r\n    &lt;body&gt;Don\'t forget me this weekend!&lt;/body&gt;\r\n&lt;/note&gt;\r\n[/html]\r\n','Abfahrts-/Ankunftsanzeiger','','inherit','closed','closed','','21-autosave-v1','','','2016-07-06 14:41:17','2016-07-06 12:41:17','',21,'http://ogdch.dev/21-autosave-v1/',0,'revision','',0);
INSERT INTO `odpch_posts` VALUES (24,1,'2016-07-06 14:53:42','2016-07-06 12:53:42','Text\r\n\r\nBild:\r\n\r\n<img class=\"alignnone size-medium wp-image-22\" src=\"http://ogdch.dev/content/uploads/2016/07/SBB-Logo-300x55.png\" alt=\"SBB-Logo\" width=\"300\" height=\"55\" />\r\n\r\nXML Code:\r\n[xml]\r\n&lt;note&gt;\r\n    &lt;to&gt;Tove&lt;/to&gt;\r\n    &lt;from&gt;Jani&lt;/from&gt;\r\n    &lt;heading&gt;Reminder&lt;/heading&gt;\r\n    &lt;body&gt;Don\'t forget me this weekend!&lt;/body&gt;\r\n&lt;/note&gt;\r\n[/xml]\r\n','Fahrtprognose','','publish','closed','closed','','fahrtprognose','','','2016-07-06 15:11:41','2016-07-06 13:11:41','',0,'http://ogdch.dev/?page_id=24',0,'page','',0);
INSERT INTO `odpch_posts` VALUES (29,1,'2016-07-06 15:09:06','2016-07-06 13:09:06','<h2>Daten</h2>\r\n<a href=\"/de/organization\">Organisationen\r\n</a><a href=\"/de/dataset\">Datensätze</a>\r\n<h1><span class=\"item-title\">Dokumentation</span></h1>\r\n<span class=\"item-title\"><a href=\"/de/glossar\">Glossar\r\n</a></span><a href=\"/de/abfahrts-ankunftsanzeiger/\">Abfahrts-/Ankunftsanzeiger</a>\r\n<a href=\"/de/fahrtprognose/\">Fahrtprognose</a>\r\n<h2>Über</h2>\r\n<a href=\"/de/about/\">Über das Portal</a>\r\n<a href=\"/de/contact/\">Kontakt</a>','Wilkommen auf der Open Data Plattform öV Schweiz','','publish','open','open','','wilkommen-auf-der-open-data-plattform-oev-schweiz','','','2016-07-06 15:09:06','2016-07-06 13:09:06','',0,'http://ogdch.dev/?p=29',0,'post','',0);
/*!40000 ALTER TABLE `odpch_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odpch_pp_login_builder`
--

DROP TABLE IF EXISTS `odpch_pp_login_builder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odpch_pp_login_builder` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `structure` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `css` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odpch_pp_login_builder`
--

LOCK TABLES `odpch_pp_login_builder` WRITE;
/*!40000 ALTER TABLE `odpch_pp_login_builder` DISABLE KEYS */;
INSERT INTO `odpch_pp_login_builder` VALUES (1,'FlatUI Login Theme','<div class=\"login-form\">\r\n\r\n<div class=\"form-group\">\r\n[login-username placeholder=\"username\" class=\"form-control login-field\" id=\"login-name\"]\r\n<label class=\"login-field-icon fui-user\" for=\"login-name\"></label>\r\n</div>\r\n\r\n<div class=\"form-group\">\r\n[login-password placeholder=\"password\" class=\"form-control login-field\" id=\"login-pass\"]\r\n<label class=\"login-field-icon fui-lock\" for=\"login-pass\"></label>\r\n</div>\r\n\r\n<div class=\"form-group\">\r\n[login-remember class=\"flat-checkbox\" id=\"remember-me\"]\r\n<label for=\"remember-me\" class=\"css-label lite-cyan-check\">Remember me</label>\r\n</div>\r\n\r\n[login-submit value=\"Sign In\" class=\"btn btn-primary btn-lg btn-block\"]\r\n\r\n\r\n<div class=\"form-group\"><br/>\r\n[link-registration class=\"reg\" label=\"Register\"] | [link-lost-password class=\"lostp\" label=\"Forgot Password?\"]\r\n</div>\r\n</div>\r\n','/* css class for the login generated errors */\r\n\r\n.profilepress-login-status {\r\n\r\n    background-color: #34495e;\r\n    color: #ffffff;\r\n    border: medium none;\r\n    border-radius: 4px;\r\n    font-size: 15px;\r\n    font-weight: normal;\r\n    line-height: 1.4;\r\n    padding: 8px 5px;\r\n    margin:4px 0;\r\n    transition: border 0.25s linear 0s, color 0.25s linear 0s, background-color 0.25s linear 0s;\r\n}\r\n\r\n.profilepress-login-status a {\r\n  color: #ea9629 !important;\r\n}\r\n\r\n/*\r\nThis login form uses the FlatUI css stylesheet that ships with the plugin hence this look.\r\nIt\'s actually very pretty when implemented.\r\n*/','2016-07-06');
INSERT INTO `odpch_pp_login_builder` VALUES (2,'Fzbuk Login Theme','<div class=\"fzbuk-login-form-wrap\">\r\n\r\n	<h1>Sign In</h1>\r\n\r\n	<div class=\"fzbuk-login-form\">\r\n\r\n		<label>\r\n			[login-username placeholder=\"Username\" id=\"fzbuk-username\"]\r\n		</label>\r\n\r\n		<label>\r\n			[login-password placeholder=\"Password\" id=\"fzbuk-password\"]\r\n		</label>\r\n\r\n		[login-submit value=\"Login\"]\r\n\r\n	</div>\r\n	<h5>[link-lost-password class=\"lostp\" label=\"Forgot Password?\"]</h5>\r\n</div>\r\n','@import url(http://fonts.googleapis.com/css?family=Lato:400,700);\r\n\r\n/* css class for the login generated errors */\r\n.profilepress-login-status {\r\n  -webkit-box-sizing: border-box;\r\n  -moz-box-sizing: border-box;\r\n  box-sizing: border-box;\r\n  color: #fff;\r\n  background: #5170ad;\r\n  background: -moz-radial-gradient(center, ellipse cover, #5170ad 0%, #355493 100%);\r\n  background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%, #5170ad), color-stop(100%, #355493));\r\n  background: -webkit-radial-gradient(center, ellipse cover, #5170ad 0%, #355493 100%);\r\n  background: -o-radial-gradient(center, ellipse cover, #5170ad 0%, #355493 100%);\r\n  background: -ms-radial-gradient(center, ellipse cover, #5170ad 0%, #355493 100%);\r\n  background: radial-gradient(ellipse at center, #5170ad 0%, #355493 100%);\r\n  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=\'#5170ad\', endColorstr=\'#355493\',GradientType=1 );\r\n  border: 1px solid #2d416d;\r\n  box-shadow: 0 1px #5670A4 inset, 0 0 10px 5px rgba(0, 0, 0, 0.1);\r\n  border-radius: 5px;\r\n  position: relative;\r\n  width: 360px;\r\n  text-align: center;\r\n  margin: 10px auto;\r\n  padding: 10px;\r\n}\r\n\r\n.profilepress-login-status a {\r\ncolor: #ea9629 !important;\r\nfont-weight:bold;\r\n}\r\n\r\n\r\n\r\n.fzbuk-login-form label {\r\n  display: block;\r\n  margin: 0 !important;\r\n}\r\n\r\n.fzbuk-login-form-wrap {\r\n  -webkit-box-sizing: border-box;\r\n  -moz-box-sizing: border-box;\r\n  box-sizing: border-box;\r\n  background: #5170ad;\r\n  background: -moz-radial-gradient(center, ellipse cover, #5170ad 0%, #355493 100%);\r\n  background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%, #5170ad), color-stop(100%, #355493));\r\n  background: -webkit-radial-gradient(center, ellipse cover, #5170ad 0%, #355493 100%);\r\n  background: -o-radial-gradient(center, ellipse cover, #5170ad 0%, #355493 100%);\r\n  background: -ms-radial-gradient(center, ellipse cover, #5170ad 0%, #355493 100%);\r\n  background: radial-gradient(ellipse at center, #5170ad 0%, #355493 100%);\r\n  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=\'#5170ad\', endColorstr=\'#355493\',GradientType=1 );\r\n  border: 1px solid #2d416d;\r\n  box-shadow: 0 1px #5670A4 inset, 0 0 10px 5px rgba(0, 0, 0, 0.1);\r\n  border-radius: 5px;\r\n  position: relative;\r\n  width: 360px;\r\n  margin: 10px auto;\r\n  padding: 50px 30px 0 30px;\r\n  text-align: center;\r\n}\r\n.fzbuk-login-form-wrap:before {\r\n  display: block;\r\n  content: \'\';\r\n  width: 58px;\r\n  height: 19px;\r\n  top: 10px;\r\n  left: 10px;\r\n  position: absolute;\r\n}\r\n.fzbuk-login-form-wrap > h1 {\r\n  margin: 0 0 50px 0;\r\n  padding: 0;\r\n  font-size: 26px;\r\n  color: #fff;\r\n}\r\n.fzbuk-login-form-wrap > h5 {\r\n  color: #303030;\r\n  margin-top: 40px;\r\n}\r\n.fzbuk-login-form-wrap > h5 > a {\r\n  font-size: 14px;\r\n  color: #fff;\r\n  text-decoration: none;\r\n  font-weight: 400;\r\n}\r\n\r\n.fzbuk-login-form input[type=\"text\"], .fzbuk-login-form input[type=\"password\"] {\r\n  -webkit-box-sizing: border-box;\r\n  -moz-box-sizing: border-box;\r\n  box-sizing: border-box;\r\n  width: 100% !important;\r\n  border: 1px solid #314d89;\r\n  outline: none !important;\r\n  padding: 12px 20px !important;\r\n  color: #afafaf !important;\r\n  font-weight: 400 !important;\r\n  font-family: \"Lato\", sans-serif !important;\r\n  cursor: text !important;\r\n}\r\n.fzbuk-login-form input[type=\"text\"] {\r\n  border-bottom: none;\r\n  border-radius: 4px 4px 0 0;\r\n  padding-bottom: 13px;\r\n  box-shadow: 0 -1px 0 #E0E0E0 inset, 0 1px 2px rgba(0, 0, 0, 0.23) inset;\r\n}\r\n.fzbuk-login-form input[type=\"password\"] {\r\n  border-top: none;\r\n  border-radius: 0 0 4px 4px;\r\n  box-shadow: 0 -1px 2px rgba(0, 0, 0, 0.23) inset, 0 1px 2px rgba(255, 255, 255, 0.1);\r\n}\r\n.fzbuk-login-form input[type=\"submit\"] {\r\n  font-family: \"Lato\", sans-serif;\r\n  background: #e0e0e0;\r\n  background: -moz-linear-gradient(top, #e0e0e0 0%, #cecece 100%);\r\n  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #e0e0e0), color-stop(100%, #cecece));\r\n  background: -webkit-linear-gradient(top, #e0e0e0 0%, #cecece 100%);\r\n  background: -o-linear-gradient(top, #e0e0e0 0%, #cecece 100%);\r\n  background: -ms-linear-gradient(top, #e0e0e0 0%, #cecece 100%);\r\n  background: linear-gradient(to bottom, #e0e0e0 0%, #cecece 100%);\r\n  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=\'#e0e0e0\', endColorstr=\'#cecece\',GradientType=0 );\r\n  display: block;\r\n  margin: 20px auto 0 auto;\r\n  width: 100%;\r\n  border: none;\r\n  border-radius: 3px;\r\n  padding: 8px;\r\n  font-size: 17px;\r\n  color: #636363;\r\n  text-shadow: 0 1px 0 rgba(255, 255, 255, 0.45);\r\n  font-weight: 700;\r\n  box-shadow: 0 1px 3px 1px rgba(0, 0, 0, 0.17), 0 1px 0 rgba(255, 255, 255, 0.36) inset;\r\n}\r\n.fzbuk-login-form input[type=\"submit\"]:hover {\r\n  background: #DDD;\r\n}\r\n.fzbuk-login-form input[type=\"submit\"]:active {\r\n  padding-top: 9px;\r\n  padding-bottom: 7px;\r\n  background: #C9C9C9;\r\n}\r\n\r\n::-webkit-input-placeholder {\r\n    color:    #999;\r\n}\r\n:-moz-placeholder {\r\n    color:    #999;\r\n}\r\n::-moz-placeholder {\r\n    color:    #999;\r\n}\r\n:-ms-input-placeholder {\r\n    color:    #999;\r\n}\r\n','2016-07-06');
INSERT INTO `odpch_pp_login_builder` VALUES (3,'Jakhu Login Theme','<div class=\"jakhu-login-form\">\r\n\r\n	<div class=\"jakhu-header\">\r\n		<h1>Sign In</h1>\r\n		<span>Fill out the form below to login.</span>\r\n	</div>\r\n\r\n\r\n	<div class=\"jakhu-content\">\r\n		[login-username placeholder=\"Username\" class=\"jakhu-input jakhu-username\"]\r\n\r\n		[login-password placeholder=\"Password\" class=\"jakhu-input jakhu-password\"]\r\n	</div>\r\n\r\n	<div class=\"jakhu-footer\">\r\n		[login-submit value=\"Sign In\" class=\"jakhu-button\"]\r\n\r\n		[link-registration class=\"jakhu-login\" label=\"Sign Up\"]\r\n\r\n		<br/>\r\n\r\n		<div style=\"float: right; text-decoration: underline;\">\r\n			[link-lost-password class=\"jakhu-password-reset\" label=\"Forgot Password?\"]\r\n		</div>\r\n	</div>\r\n</div>','@import url(http://fonts.googleapis.com/css?family=Bree+Serif);\r\n\r\n/* css class for the login generated errors */\r\n.profilepress-login-status {\r\n    width: 300px;\r\n	position: static;\r\n	margin: 10px auto;\r\n	padding: 6px;\r\n	background: #f3f3f3;\r\n	border: 1px solid #fff;\r\n	border-radius: 5px;\r\n	box-shadow: 0 1px 3px rgba(0,0,0,0.5);\r\n	-moz-box-shadow: 0 1px 3px rgba(0,0,0,0.5);\r\n	-webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.5);\r\n}\r\n\r\n.profilepress-login-status a {\r\n  color: #ea9629 !important;\r\n}\r\n\r\n\r\n.jakhu-login-form .jakhu-header span::selection {\r\n	color: #fff;\r\n	background: #f676b2; /* Safari */\r\n}\r\n\r\n.jakhu-login-form .jakhu-header span::-moz-selection {\r\n	color: #fff;\r\n	background: #f676b2; /* Firefox */\r\n}\r\n\r\n.jakhu-login-form {\r\n	width: 300px;\r\n	position: static;\r\n	margin: auto;\r\n	background: #f3f3f3;\r\n	border: 1px solid #fff;\r\n	border-radius: 5px;\r\n\r\n	box-shadow: 0 1px 3px rgba(0,0,0,0.5);\r\n	-moz-box-shadow: 0 1px 3px rgba(0,0,0,0.5);\r\n	-webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.5);\r\n}\r\n\r\n.jakhu-login-form .jakhu-header {\r\n	padding: 40px 30px 30px 30px;\r\n}\r\n\r\n.jakhu-login-form .jakhu-header h1 {\r\n	font-family: \'Bree Serif\', serif;\r\n	font-weight: 300;\r\n	font-size: 28px;\r\n	line-height:34px;\r\n	color: #414848;\r\n	text-shadow: 1px 1px 0 rgba(256,256,256,1.0);\r\n	margin-bottom: 10px;\r\n}\r\n\r\n.jakhu-login-form .jakhu-header span {\r\n	font-size: 13px;\r\n	line-height: 16px;\r\n	color: #678889;\r\n	text-shadow: 1px 1px 0 rgba(256,256,256,1.0);\r\n	font-family: \"HelveticaNeue-Light\", \"Helvetica Neue Light\", \"Helvetica Neue\", Helvetica, Arial, \"Lucida Grande\", sans-serif;\r\n	font-weight:300;\r\n}\r\n\r\n.jakhu-login-form .jakhu-content {\r\n	padding: 0 30px 25px 30px;\r\n}\r\n\r\n/* Input field */\r\n.jakhu-login-form .jakhu-content .jakhu-input {\r\n	width: 240px;\r\n	padding: 15px 25px;\r\n	font-family: \"HelveticaNeue-Light\", \"Helvetica Neue Light\", \"Helvetica Neue\", Helvetica, Arial, \"Lucida Grande\", sans-serif;\r\n	font-weight: 400;\r\n	font-size: 14px;\r\n	color: #9d9e9e;\r\n	text-shadow: 1px 1px 0 rgba(256,256,256,1.0);\r\n	background: #fff;\r\n	border: 1px solid #fff;\r\n	border-radius: 5px;\r\n	box-shadow: inset 0 1px 3px rgba(0,0,0,0.50);\r\n	-moz-box-shadow: inset 0 1px 3px rgba(0,0,0,0.50);\r\n	-webkit-box-shadow: inset 0 1px 3px rgba(0,0,0,0.50);\r\n}\r\n\r\n.jakhu-login-form .jakhu-content .jakhu-password{\r\n	margin-top: 25px;\r\n}\r\n\r\n.jakhu-login-form .jakhu-content .jakhu-input:hover {\r\n	background: #dfe9ec;\r\n	color: #414848;\r\n}\r\n\r\n.jakhu-login-form .jakhu-content .jakhu-input:focus {\r\n	background: #dfe9ec;\r\n	color: #414848;\r\n\r\n	box-shadow: inset 0 1px 2px rgba(0,0,0,0.25);\r\n	-moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.25);\r\n	-webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.25);\r\n}\r\n\r\n.jakhu-login-form .jakhu-footer {\r\n	padding: 25px 30px 40px 30px;\r\n	overflow: auto;\r\n\r\n	background: #d4dedf;\r\n	border-top: 1px solid #fff;\r\n\r\n	box-shadow: inset 0 1px 0 rgba(0,0,0,0.15);\r\n	-moz-box-shadow: inset 0 1px 0 rgba(0,0,0,0.15);\r\n	-webkit-box-shadow: inset 0 1px 0 rgba(0,0,0,0.15);\r\n}\r\n\r\n/* Login button */\r\n.jakhu-login-form .jakhu-footer .jakhu-button {\r\n	float:right;\r\n	padding: 11px 25px;\r\n	font-family: \'Bree Serif\', serif;\r\n	font-weight: 300;\r\n	font-size: 18px;\r\n	color: #fff;\r\n	text-shadow: 0 1px 0 rgba(0,0,0,0.25);\r\n	background: #56c2e1;\r\n	border: 1px solid #46b3d3;\r\n	border-radius: 5px;\r\n	cursor: pointer;\r\n\r\n	box-shadow: inset 0 0 2px rgba(256,256,256,0.75);\r\n	-moz-box-shadow: inset 0 0 2px rgba(256,256,256,0.75);\r\n	-webkit-box-shadow: inset 0 0 2px rgba(256,256,256,0.75);\r\n}\r\n\r\n.jakhu-login-form .jakhu-footer .jakhu-button:hover {\r\n	background: #3f9db8;\r\n	border: 1px solid rgba(256,256,256,0.75);\r\n	box-shadow: inset 0 1px 3px rgba(0,0,0,0.5);\r\n	-moz-box-shadow: inset 0 1px 3px rgba(0,0,0,0.5);\r\n	-webkit-box-shadow: inset 0 1px 3px rgba(0,0,0,0.5);\r\n}\r\n\r\n.jakhu-login-form .jakhu-footer .jakhu-button:focus {\r\n	bottom: -1px;\r\n	background: #56c2e1;\r\n	box-shadow: inset 0 1px 6px rgba(256,256,256,0.75);\r\n	-moz-box-shadow: inset 0 1px 6px rgba(256,256,256,0.75);\r\n	-webkit-box-shadow: inset 0 1px 6px rgba(256,256,256,0.75);\r\n}\r\n\r\n/* Registration link */\r\n.jakhu-login-form .jakhu-footer .jakhu-login {\r\n	display: block;\r\n	float: right;\r\n	padding: 10px;\r\n	margin-right: 20px;\r\n	text-decoration: none;\r\n	background: none;\r\n	border: none;\r\n	cursor: pointer;\r\n	font-family: \'Bree Serif\', serif;\r\n	font-weight: 300;\r\n	font-size: 20px;\r\n	color: #414848;\r\n	text-shadow: 0 1px 0 rgba(256,256,256,0.5);\r\n}\r\n\r\n/* password reset link */\r\n.jakhu-login-form .jakhu-footer .jakhu-password-reset {\r\n	display: block;\r\n	text-align:center\r\n	padding: 10px;\r\n	text-decoration: none;\r\n	background: none;\r\n	border: none;\r\n	cursor: pointer;\r\n	font-family: \'Bree Serif\', serif;\r\n	font-weight: 300;\r\n	font-size: 18px;\r\n	color: #414848;\r\n	margin-top: 40px;\r\n	text-shadow: 0 1px 0 rgba(256,256,256,0.5);\r\n}\r\n\r\n\r\n.jakhu-login a {\r\n text-decoration: none;\r\n}\r\n\r\n.jakhu-login-form .jakhu-footer .jakhu-login:hover {\r\n	color: #3f9db8;\r\n}\r\n\r\n.jakhu-login-form .jakhu-footer .jakhu-login:focus {\r\n	position: relative;\r\n	bottom: -1px;\r\n}\r\n\r\n.jakhu-content input {\r\n  -webkit-box-sizing: border-box;\r\n  -moz-box-sizing: border-box;\r\n  box-sizing: border-box;\r\n}','2016-07-06');
/*!40000 ALTER TABLE `odpch_pp_login_builder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odpch_pp_password_reset_builder`
--

DROP TABLE IF EXISTS `odpch_pp_password_reset_builder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odpch_pp_password_reset_builder` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `structure` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `handler_structure` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `css` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `success_password_reset` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odpch_pp_password_reset_builder`
--

LOCK TABLES `odpch_pp_password_reset_builder` WRITE;
/*!40000 ALTER TABLE `odpch_pp_password_reset_builder` DISABLE KEYS */;
INSERT INTO `odpch_pp_password_reset_builder` VALUES (1,'FlatUI Password Reset','<div class=\"login-form\">\r\n\r\n<p>\r\nPlease enter your username or email address.\r\nYou will receive a link to create a new password via email.</p>\r\n\r\n<div class=\"form-group\">\r\n[user-login id=\"login\" placeholder=\"Username or E-mail:\" class=\"form-control login-field\"]\r\n<label class=\"login-field-icon fui-user\" for=\"login\"></label>\r\n</div>\r\n\r\n\r\n<p>\r\n[reset-submit value=\"Reset Password\" class=\"btn btn-primary btn-lg btn-block\" id=\"submit-button\"]\r\n</p>\r\n\r\n</div>','<div class=\"pp-reset-password-form\">\r\n	<h3>Enter your new password below.</h3>\r\n	<label for=\"password1\">New password<span class=\"req\">*</span></label>\r\n	[enter-password id=\"password1\" required autocomplete=\"off\"]\r\n\r\n	<label for=\"password2\">Re-enter new password<span class=\"req\">*</span></label>\r\n	[re-enter-password id=\"password2\" required autocomplete=\"off\"]\r\n\r\n	[password-reset-submit class=\"pp-reset-button pp-reset-button-block\" value=\"Save\"]\r\n</div>','/* css class for the password reset form generated errors */\r\n\r\n.profilepress-reset-status {\r\n\r\n    background-color: #34495e;\r\n    color: #ffffff;\r\n    border: medium none;\r\n    border-radius: 4px;\r\n    font-size: 15px;\r\n    font-weight: normal;\r\n    line-height: 1.4;\r\n    padding: 8px 5px;\r\n    margin: 4px 0;\r\n    transition: border 0.25s linear 0s, color 0.25s linear 0s, background-color 0.25s linear 0s;\r\n}\r\n\r\n/*\r\nThis form uses the FlatUI css stylesheet that ships with the plugin hence this look.\r\nIt\'s actually very pretty when implemented.\r\n*/','<div class=\"profilepress-reset-status\">Check your email for further instructions.</div>','2016-07-06');
INSERT INTO `odpch_pp_password_reset_builder` VALUES (2,'Fzbuk Password Reset','<div class=\"fzbuk-login-form-wrap\">\r\n	<h1>Forgot Password?</h1>\r\n\r\n	<div class=\"fzbuk-login-form\">\r\n\r\n		<label>\r\n			[user-login id=\"login\" placeholder=\"Username or E-mail:\"]\r\n		</label>\r\n\r\n		[reset-submit value=\"Reset Password\"]\r\n\r\n	</div>\r\n	<h5>Back to [link-login label=\"Login\"]</h5>\r\n</div>\r\n','<div class=\"pp-reset-password-form\">\r\n	<h3>Enter your new password below.</h3>\r\n	<label for=\"password1\">New password<span class=\"req\">*</span></label>\r\n	[enter-password id=\"password1\" required autocomplete=\"off\"]\r\n\r\n	<label for=\"password2\">Re-enter new password<span class=\"req\">*</span></label>\r\n	[re-enter-password id=\"password2\" required autocomplete=\"off\"]\r\n\r\n	[password-reset-submit class=\"pp-reset-button pp-reset-button-block\" value=\"Save\"]\r\n</div>','/* css class for the password reset form generated errors */\r\n\r\n.profilepress-reset-status {\r\n-webkit-box-sizing: border-box;\r\n  -moz-box-sizing: border-box;\r\n  box-sizing: border-box;\r\n  color: #fff;\r\n  background: #5170ad;\r\n  background: -moz-radial-gradient(center, ellipse cover, #5170ad 0%, #355493 100%);\r\n  background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%, #5170ad), color-stop(100%, #355493));\r\n  background: -webkit-radial-gradient(center, ellipse cover, #5170ad 0%, #355493 100%);\r\n  background: -o-radial-gradient(center, ellipse cover, #5170ad 0%, #355493 100%);\r\n  background: -ms-radial-gradient(center, ellipse cover, #5170ad 0%, #355493 100%);\r\n  background: radial-gradient(ellipse at center, #5170ad 0%, #355493 100%);\r\n  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=\'#5170ad\', endColorstr=\'#355493\',GradientType=1 );\r\n  border: 1px solid #2d416d;\r\n  box-shadow: 0 1px #5670A4 inset, 0 0 10px 5px rgba(0, 0, 0, 0.1);\r\n  border-radius: 5px;\r\n  position: relative;\r\n  width: 360px;\r\n  text-align: center;\r\n  margin: 10px auto;\r\n  padding: 10px;\r\n}\r\n\r\n\r\n.fzbuk-login-form-wrap {\r\n\r\n-webkit-box-sizing: border-box;\r\n  -moz-box-sizing: border-box;\r\n  box-sizing: border-box;\r\n\r\n  background: #5170ad;\r\n  background: -moz-radial-gradient(center, ellipse cover, #5170ad 0%, #355493 100%);\r\n  background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%, #5170ad), color-stop(100%, #355493));\r\n  background: -webkit-radial-gradient(center, ellipse cover, #5170ad 0%, #355493 100%);\r\n  background: -o-radial-gradient(center, ellipse cover, #5170ad 0%, #355493 100%);\r\n  background: -ms-radial-gradient(center, ellipse cover, #5170ad 0%, #355493 100%);\r\n  background: radial-gradient(ellipse at center, #5170ad 0%, #355493 100%);\r\n  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=\'#5170ad\', endColorstr=\'#355493\',GradientType=1 );\r\n  border: 1px solid #2d416d;\r\n  box-shadow: 0 1px #5670A4 inset, 0 0 10px 5px rgba(0, 0, 0, 0.1);\r\n  border-radius: 5px;\r\n  position: relative;\r\n  width: 360px;\r\n  height: 300px;\r\n  margin: 10px auto;\r\n  padding: 50px 30px 0 30px;\r\n  text-align: center;\r\n}\r\n.fzbuk-login-form-wrap:before {\r\n  display: block;\r\n  content: \'\';\r\n  width: 58px;\r\n  height: 19px;\r\n  top: 10px;\r\n  left: 10px;\r\n  position: absolute;\r\n}\r\n.fzbuk-login-form-wrap > h1 {\r\n  font-size: 15px;\r\n  margin: 0 0 50px 0;\r\n  padding: 0;\r\n  font-size: 26px;\r\n  color: #fff;\r\n}\r\n.fzbuk-login-form-wrap > h5 {\r\n  color: #303030;\r\n  margin-top: 20px;\r\n  font-size: 15px;\r\n}\r\n.fzbuk-login-form-wrap > h5 > a {\r\n  font-size: 15px;\r\n  color: #fff;\r\n  text-decoration: none;\r\n  font-weight: 400;\r\n}\r\n\r\n.fzbuk-login-form input[type=\"text\"], .fzbuk-login-form input[type=\"password\"], .fzbuk-login-form input[type=\"email\"] {\r\n  width: 100%;\r\n  border: 1px solid #314d89;\r\n  outline: none;\r\n  padding: 12px 20px;\r\n  color: #afafaf;\r\n  font-weight: 400;\r\n  font-family: \"Lato\", sans-serif;\r\n  cursor: text;\r\n}\r\n\r\n.fzbuk-login-form label {\r\ndisplay: block;\r\n}\r\n\r\n.fzbuk-login-form input[type=\"text\"]  {\r\n  -webkit-box-sizing: border-box;\r\n  -moz-box-sizing: border-box;\r\n  box-sizing: border-box;\r\n  border-bottom: none;\r\n  border-radius: 4px 4px 0 0;\r\n  padding-bottom: 13px;\r\n  box-shadow: 0 -1px 0 #E0E0E0 inset, 0 1px 2px rgba(0, 0, 0, 0.23) inset;\r\n}\r\n\r\n.fzbuk-login-form input[type=\"submit\"] {\r\n  font-family: \"Lato\", sans-serif;\r\n  font-weight: 400;\r\n  background: #e0e0e0;\r\n  background: -moz-linear-gradient(top, #e0e0e0 0%, #cecece 100%);\r\n  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #e0e0e0), color-stop(100%, #cecece));\r\n  background: -webkit-linear-gradient(top, #e0e0e0 0%, #cecece 100%);\r\n  background: -o-linear-gradient(top, #e0e0e0 0%, #cecece 100%);\r\n  background: -ms-linear-gradient(top, #e0e0e0 0%, #cecece 100%);\r\n  background: linear-gradient(to bottom, #e0e0e0 0%, #cecece 100%);\r\n  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=\'#e0e0e0\', endColorstr=\'#cecece\',GradientType=0 );\r\n  display: block;\r\n  margin: 20px auto 0 auto;\r\n  width: 100%;\r\n  border: none;\r\n  border-radius: 3px;\r\n  padding: 8px;\r\n  font-size: 17px;\r\n  color: #636363;\r\n  text-shadow: 0 1px 0 rgba(255, 255, 255, 0.45);\r\n  font-weight: 700;\r\n  box-shadow: 0 1px 3px 1px rgba(0, 0, 0, 0.17), 0 1px 0 rgba(255, 255, 255, 0.36) inset;\r\n}\r\n.fzbuk-login-form input[type=\"submit\"]:hover {\r\n  background: #DDD;\r\n}\r\n.fzbuk-login-form input[type=\"submit\"]:active {\r\n  padding-top: 9px;\r\n  padding-bottom: 7px;\r\n  background: #C9C9C9;\r\n}','<div class=\"profilepress-reset-status\">Check your e-mail for further instruction.</div>','2016-07-06');
INSERT INTO `odpch_pp_password_reset_builder` VALUES (3,'Jakhu Password Reset','<div class=\"jakhu-login-form\">\r\n\r\n	<div class=\"jakhu-header\">\r\n		<h1>Forgot Password?</h1>\r\n		<span>Please enter your username or email address.\r\nYou will receive a link to create a new password via email.</span>\r\n	</div>\r\n\r\n	<div class=\"jakhu-content\">\r\n\r\n		[user-login id=\"login\" placeholder=\"Username or E-mail\" class=\"jakhu-input jakhu-username\"]\r\n	</div>\r\n\r\n	<div class=\"jakhu-footer\">\r\n		[reset-submit value=\"Reset Password\" class=\"jakhu-button\"]\r\n\r\n		<br/><br/>\r\n\r\n		<div style=\"float: right; text-decoration: underline;\">\r\n			[link-login class=\"jakhu-login\" label=\"Back to Login?\"]\r\n		</div>\r\n	</div>\r\n\r\n</div>\r\n','<div class=\"pp-reset-password-form\">\r\n	<h3>Enter your new password below.</h3>\r\n	<label for=\"password1\">New password<span class=\"req\">*</span></label>\r\n	[enter-password id=\"password1\" required autocomplete=\"off\"]\r\n\r\n	<label for=\"password2\">Re-enter new password<span class=\"req\">*</span></label>\r\n	[re-enter-password id=\"password2\" required autocomplete=\"off\"]\r\n\r\n	[password-reset-submit class=\"pp-reset-button pp-reset-button-block\" value=\"Save\"]\r\n</div>','@import url(http://fonts.googleapis.com/css?family=Bree+Serif);\r\n\r\n/* css class for the password reset form generated errors */\r\n.profilepress-reset-status {\r\n    width: 300px;\r\n	position: static;\r\n	z-index:5;\r\n	margin: 10px 0;\r\n	padding: 6px;\r\n	background: #f3f3f3;\r\n	border: 1px solid #fff;\r\n	border-radius: 5px;\r\n	box-shadow: 0 1px 3px rgba(0,0,0,0.5);\r\n	-moz-box-shadow: 0 1px 3px rgba(0,0,0,0.5);\r\n	-webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.5);\r\n}\r\n\r\n\r\n.jakhu-login-form .jakhu-header span::selection {\r\n	color: #fff;\r\n	background: #f676b2; /* Safari */\r\n}\r\n\r\n.jakhu-login-form .jakhu-header span::-moz-selection {\r\n	color: #fff;\r\n	background: #f676b2; /* Firefox */\r\n}\r\n\r\n.jakhu-login-form {\r\n	width: 300px;\r\n	position: static;\r\n	z-index:5;\r\n\r\n	background: #f3f3f3;\r\n	border: 1px solid #fff;\r\n	border-radius: 5px;\r\n\r\n	box-shadow: 0 1px 3px rgba(0,0,0,0.5);\r\n	-moz-box-shadow: 0 1px 3px rgba(0,0,0,0.5);\r\n	-webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.5);\r\n}\r\n\r\n.jakhu-login-form .jakhu-header {\r\n	padding: 40px 30px 30px 30px;\r\n}\r\n\r\n.jakhu-login-form .jakhu-header h1 {\r\n	font-family: \'Bree Serif\', serif;\r\n	font-weight: 300;\r\n	font-size: 28px;\r\n	line-height:34px;\r\n	color: #414848;\r\n	text-shadow: 1px 1px 0 rgba(256,256,256,1.0);\r\n	margin-bottom: 10px;\r\n}\r\n\r\n.jakhu-login-form .jakhu-header span {\r\n	font-size: 13px;\r\n	line-height: 16px;\r\n	color: #678889;\r\n	text-shadow: 1px 1px 0 rgba(256,256,256,1.0);\r\n	font-family: \"HelveticaNeue-Light\", \"Helvetica Neue Light\", \"Helvetica Neue\", Helvetica, Arial, \"Lucida Grande\", sans-serif;\r\n	font-weight:300;\r\n}\r\n\r\n.jakhu-login-form .jakhu-content {\r\n	padding: 0 30px 25px 30px;\r\n}\r\n\r\n/* Input field */\r\n.jakhu-login-form .jakhu-content .jakhu-input {\r\n	width: 240px;\r\n	padding: 15px 25px;\r\n	font-family: \"HelveticaNeue-Light\", \"Helvetica Neue Light\", \"Helvetica Neue\", Helvetica, Arial, \"Lucida Grande\", sans-serif;\r\n	font-weight: 400;\r\n	font-size: 14px;\r\n	color: #9d9e9e;\r\n	text-shadow: 1px 1px 0 rgba(256,256,256,1.0);\r\n\r\n	background: #fff;\r\n	border: 1px solid #fff;\r\n	border-radius: 5px;\r\n\r\n	box-shadow: inset 0 1px 3px rgba(0,0,0,0.50);\r\n	-moz-box-shadow: inset 0 1px 3px rgba(0,0,0,0.50);\r\n	-webkit-box-shadow: inset 0 1px 3px rgba(0,0,0,0.50);\r\n}\r\n\r\n/* Second and Third input fourth fifth field */\r\n.jakhu-login-form .jakhu-content .jakhu-password{\r\n	margin-top: 25px;\r\n}\r\n\r\n.jakhu-login-form .jakhu-content .jakhu-input:hover {\r\n	background: #dfe9ec;\r\n	color: #414848;\r\n}\r\n\r\n.jakhu-login-form .jakhu-content .jakhu-input:focus {\r\n	background: #dfe9ec;\r\n	color: #414848;\r\n\r\n	box-shadow: inset 0 1px 2px rgba(0,0,0,0.25);\r\n	-moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.25);\r\n	-webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.25);\r\n}\r\n\r\n/* Animation */\r\n.jakhu-input, .jakhu-user-icon, .jakhu-email-icon, .jakhu-pass-icon, .jakhu-button, .jakhu-login {\r\n	transition: all 0.5s;\r\n	-moz-transition: all 0.5s;\r\n	-webkit-transition: all 0.5s;\r\n	-o-transition: all 0.5s;\r\n	-ms-transition: all 0.5s;\r\n}\r\n\r\n.jakhu-login-form .jakhu-footer {\r\n	padding: 25px 30px 40px 30px;\r\n	overflow: auto;\r\n	background: #d4dedf;\r\n	border-top: 1px solid #fff;\r\n	box-shadow: inset 0 1px 0 rgba(0,0,0,0.15);\r\n	-moz-box-shadow: inset 0 1px 0 rgba(0,0,0,0.15);\r\n	-webkit-box-shadow: inset 0 1px 0 rgba(0,0,0,0.15);\r\n}\r\n\r\n/* Login button */\r\n.jakhu-login-form .jakhu-footer .jakhu-button {\r\n	float:right;\r\n	padding: 11px 25px;\r\n	font-family: \'Bree Serif\', serif;\r\n	font-weight: 300;\r\n	font-size: 18px;\r\n	color: #fff;\r\n	text-shadow: 0 1px 0 rgba(0,0,0,0.25);\r\n	background: #56c2e1;\r\n	border: 1px solid #46b3d3;\r\n	border-radius: 5px;\r\n	cursor: pointer;\r\n	box-shadow: inset 0 0 2px rgba(256,256,256,0.75);\r\n	-moz-box-shadow: inset 0 0 2px rgba(256,256,256,0.75);\r\n	-webkit-box-shadow: inset 0 0 2px rgba(256,256,256,0.75);\r\n}\r\n\r\n.jakhu-login-form .jakhu-footer .jakhu-button:hover {\r\n	background: #3f9db8;\r\n	border: 1px solid rgba(256,256,256,0.75);\r\n	box-shadow: inset 0 1px 3px rgba(0,0,0,0.5);\r\n	-moz-box-shadow: inset 0 1px 3px rgba(0,0,0,0.5);\r\n	-webkit-box-shadow: inset 0 1px 3px rgba(0,0,0,0.5);\r\n}\r\n\r\n.jakhu-login-form .jakhu-footer .jakhu-button:focus {\r\n	bottom: -1px;\r\n	background: #56c2e1;\r\n	box-shadow: inset 0 1px 6px rgba(256,256,256,0.75);\r\n	-moz-box-shadow: inset 0 1px 6px rgba(256,256,256,0.75);\r\n	-webkit-box-shadow: inset 0 1px 6px rgba(256,256,256,0.75);\r\n}\r\n\r\n/* Registration link */\r\n.jakhu-login-form .jakhu-footer .jakhu-login {\r\n	display: block;\r\n	float: right;\r\n	padding: 10px;\r\n	margin-right: 20px;\r\n	text-decoration: none;\r\n	background: none;\r\n	border: none;\r\n	cursor: pointer;\r\n	font-family: \'Bree Serif\', serif;\r\n	font-weight: 300;\r\n	font-size: 20px;\r\n	color: #414848;\r\n	text-shadow: 0 1px 0 rgba(256,256,256,0.5);\r\n}\r\n\r\n/* Back to login link */\r\n.jakhu-login-form .jakhu-footer .jakhu-back-login {\r\n	display: block;\r\n	text-align:center\r\n	padding: 10px;\r\n	text-decoration: none;\r\n	background: none;\r\n	border: none;\r\n	cursor: pointer;\r\n	font-family: \'Bree Serif\', serif;\r\n	font-weight: 300;\r\n	font-size: 18px;\r\n	color: #414848;\r\n	margin-top: 20px;\r\n	text-shadow: 0 1px 0 rgba(256,256,256,0.5);\r\n}\r\n\r\n\r\n.jakhu-login a {\r\n text-decoration: none;\r\n}\r\n\r\n.jakhu-login-form .jakhu-footer .jakhu-login:hover {\r\n	color: #3f9db8;\r\n}\r\n\r\n.jakhu-login-form .jakhu-footer .jakhu-login:focus {\r\n	position: relative;\r\n	bottom: -1px;\r\n}\r\n\r\n.jakhu-content input {\r\n  -webkit-box-sizing: border-box;\r\n  -moz-box-sizing: border-box;\r\n  box-sizing: border-box;\r\n}','<div class=\"profilepress-reset-status\">Check your email for further instructions.</div>','2016-07-06');
/*!40000 ALTER TABLE `odpch_pp_password_reset_builder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odpch_pp_registration_builder`
--

DROP TABLE IF EXISTS `odpch_pp_registration_builder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odpch_pp_registration_builder` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `structure` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `css` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `success_registration` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odpch_pp_registration_builder`
--

LOCK TABLES `odpch_pp_registration_builder` WRITE;
/*!40000 ALTER TABLE `odpch_pp_registration_builder` DISABLE KEYS */;
INSERT INTO `odpch_pp_registration_builder` VALUES (1,'FlatUI Registration Theme','<div class=\"login-form\">\r\n    <div class=\"form-group\">[reg-username id=\"reg-username\" placeholder=\"Username\" class=\"form-control login-field\"]\r\n        <label class=\"login-field-icon fui-user\" for=\"reg-username\"></label></div>\r\n    <div class=\"form-group\">[reg-password id=\"reg-password\" placeholder=\"Password\" class=\"form-control login-field\"]\r\n        <label class=\"login-field-icon fui-lock\" for=\"reg-password\"></label></div>\r\n    <div class=\"form-group\">[reg-email id=\"reg-email\" placeholder=\"Email\" class=\"form-control login-field\"]\r\n        <label class=\"login-field-icon fui-mail\" for=\"reg-email\"></label></div>\r\n    <div class=\"form-group\">[reg-first-name class=\"form-control login-field\" id=\"reg-firstname\" placeholder=\"First Name\"]\r\n        <label class=\"login-field-icon fui-user\" for=\"reg-firstname\"></label></div>\r\n    <div class=\"form-group\">[reg-last-name class=\"form-control login-field\" id=\"reg-lastname\" placeholder=\"Last Name\" required]\r\n        <label class=\"login-field-icon fui-user\" for=\"reg-lastname\"></label></div>\r\n    <div class=\"form-group\">[reg-submit value=\"Register\" class=\"btn btn-primary btn-lg btn-block\" id=\"submit-button\"]</div>\r\n    <div class=\"form-group\" style=\"text-align:center\">Have an account? [link-login label=\"Login\"]</div>\r\n</div>\r\n','/* css class for the registration form generated errors */\r\n\r\n.profilepress-reg-status {\r\n  border-radius: 6px;\r\n  font-size: 17px;\r\n  line-height: 1.471;\r\n  padding: 10px 19px;\r\n  background-color: #e74c3c;\r\n  color: #ffffff;\r\n  font-weight: normal;\r\n  transition: border 0.25s linear 0s, color 0.25s linear 0s, background-color 0.25s linear 0s;\r\n  display: block;\r\n  text-align: center;\r\n  vertical-align: middle;\r\n  margin: 5px 0;\r\n}\r\n\r\n.profilepress-reg-status a {\r\n  color: #fff;\r\n  font-weight: bold;\r\n}\r\n\r\n.profilepress-reg-label {\r\n  padding: 1px 8px 2px 3px;\r\n}\r\n\r\n/*\r\nThis form uses the FlatUI css stylesheet that ships with the plugin hence this look.\r\nIt\'s actually very pretty when implemented.\r\n*/','<div class=\"profilepress-reg-status\">Registration Successful</div>','2016-07-06');
INSERT INTO `odpch_pp_registration_builder` VALUES (2,'Fzbuk Registration Theme','<div class=\"fzbuk-login-form-wrap\">\r\n	<h1>Sign Up</h1>\r\n\r\n	<div class=\"fzbuk-login-form\">\r\n		<label>\r\n			[reg-username placeholder=\"Username\"]\r\n		</label>\r\n\r\n		<label>\r\n			[reg-email placeholder=\"Email Address\" class=\"fzbuk-input-middle\"]\r\n		</label>\r\n\r\n		<label>\r\n			[reg-password placeholder=\"Password\"]\r\n		</label>\r\n\r\n		[reg-submit value=\"Register\"]\r\n\r\n	</div>\r\n	<h5>Have an Account? [link-login label=\"Login\"]</h5>\r\n</div>\r\n','/* css class for the registration form generated errors */\r\n\r\n.profilepress-reg-status {\r\n -webkit-box-sizing: border-box;\r\n  -moz-box-sizing: border-box;\r\n  box-sizing: border-box;\r\n  color: #fff;\r\n  background: #5170ad;\r\n  background: -moz-radial-gradient(center, ellipse cover, #5170ad 0%, #355493 100%);\r\n  background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%, #5170ad), color-stop(100%, #355493));\r\n  background: -webkit-radial-gradient(center, ellipse cover, #5170ad 0%, #355493 100%);\r\n  background: -o-radial-gradient(center, ellipse cover, #5170ad 0%, #355493 100%);\r\n  background: -ms-radial-gradient(center, ellipse cover, #5170ad 0%, #355493 100%);\r\n  background: radial-gradient(ellipse at center, #5170ad 0%, #355493 100%);\r\n  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=\'#5170ad\', endColorstr=\'#355493\',GradientType=1 );\r\n  border: 1px solid #2d416d;\r\n  box-shadow: 0 1px #5670A4 inset, 0 0 10px 5px rgba(0, 0, 0, 0.1);\r\n  border-radius: 5px;\r\n  position: relative;\r\n  text-align: center;\r\n  width: 360px;\r\n  margin: 10px auto;\r\n  padding: 10px;\r\n}\r\n\r\n.fzbuk-login-form-wrap {\r\n  background: #5170ad;\r\n  background: -moz-radial-gradient(center, ellipse cover, #5170ad 0%, #355493 100%);\r\n  background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%, #5170ad), color-stop(100%, #355493));\r\n  background: -webkit-radial-gradient(center, ellipse cover, #5170ad 0%, #355493 100%);\r\n  background: -o-radial-gradient(center, ellipse cover, #5170ad 0%, #355493 100%);\r\n  background: -ms-radial-gradient(center, ellipse cover, #5170ad 0%, #355493 100%);\r\n  background: radial-gradient(ellipse at center, #5170ad 0%, #355493 100%);\r\n  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=\'#5170ad\', endColorstr=\'#355493\',GradientType=1 );\r\n  border: 1px solid #2d416d;\r\n  box-shadow: 0 1px #5670A4 inset, 0 0 10px 5px rgba(0, 0, 0, 0.1);\r\n  border-radius: 5px;\r\n  position: relative;\r\n  width: 360px;\r\n  margin: 10px auto;\r\n  padding: 50px 30px 0 30px;\r\n  text-align: center;\r\n}\r\n\r\n.fzbuk-login-form-wrap:before {\r\n  display: block;\r\n  content: \"\";\r\n  width: 58px;\r\n  height: 19px;\r\n  top: 10px;\r\n  left: 10px;\r\n  position: absolute;\r\n}\r\n.fzbuk-login-form-wrap > h1 {\r\n  margin: 0 0 50px 0;\r\n  padding: 0;\r\n  font-size: 26px;\r\n  color: #fff;\r\n}\r\n.fzbuk-login-form-wrap > h5 {\r\n  color: #303030;\r\n  margin-top: 20px;\r\n  font-size: 15px;\r\n}\r\n.fzbuk-login-form-wrap > h5 > a {\r\n  font-size: 15px;\r\n  color: #fff !important;\r\n  text-decoration: none;\r\n  font-weight: 400;\r\n}\r\n\r\n.fzbuk-login-form input[type=\"text\"], .fzbuk-login-form input[type=\"password\"], .fzbuk-login-form input[type=\"email\"] {\r\n  -webkit-box-sizing: border-box;\r\n  -moz-box-sizing: border-box;\r\n  box-sizing: border-box;\r\n  width: 100%;\r\n  border: 1px solid #314d89;\r\n  outline: none;\r\n  padding: 12px 20px;\r\n  color: #afafaf;\r\n  font-weight: 400;\r\n  font-family: \"Lato\", sans-serif;\r\n  cursor: text;\r\n}\r\n\r\n.fzbuk-login-form label {\r\n  display: block;\r\n  margin: 0 !important;\r\n}\r\n\r\ninput.fzbuk-input-middle {\r\n  border-bottom: medium none !important;\r\n  border-radius: unset !important;\r\n  box-shadow: unset !important;\r\n  border-top: medium none !important;\r\n  width: 100% !important;\r\n  padding: 12px 20px !important;\r\n  color: #afafaf !important;\r\n  font-weight: 400 !important;\r\n  font-family: \"Lato\", sans-serif;\r\n  cursor: text !important;\r\n}\r\n\r\n\r\n.fzbuk-login-form input[type=\"email\"], .fzbuk-login-form input[type=\"text\"]  {\r\n  border-bottom: none;\r\n  border-radius: 4px 4px 0 0;\r\n  padding-bottom: 13px;\r\n  box-shadow: 0 -1px 0 #E0E0E0 inset, 0 1px 2px rgba(0, 0, 0, 0.23) inset;\r\n}\r\n.fzbuk-login-form input[type=\"password\"] {\r\n  border-top: 1px solid #eee;\r\n  border-radius: 0 0 4px 4px;\r\n  box-shadow: 0 -1px 2px rgba(0, 0, 0, 0.23) inset, 0 1px 2px rgba(255, 255, 255, 0.1);\r\n}\r\n.fzbuk-login-form input[type=\"submit\"] {\r\n  font-family: \"Lato\", sans-serif;\r\n  background: #e0e0e0;\r\n  background: -moz-linear-gradient(top, #e0e0e0 0%, #cecece 100%);\r\n  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #e0e0e0), color-stop(100%, #cecece));\r\n  background: -webkit-linear-gradient(top, #e0e0e0 0%, #cecece 100%);\r\n  background: -o-linear-gradient(top, #e0e0e0 0%, #cecece 100%);\r\n  background: -ms-linear-gradient(top, #e0e0e0 0%, #cecece 100%);\r\n  background: linear-gradient(to bottom, #e0e0e0 0%, #cecece 100%);\r\n  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=\'#e0e0e0\', endColorstr=\'#cecece\',GradientType=0 );\r\n  display: block;\r\n  margin: 20px auto 0 auto;\r\n  width: 100%;\r\n  border: none;\r\n  border-radius: 3px;\r\n  padding: 8px;\r\n  font-size: 17px;\r\n  color: #636363;\r\n  text-shadow: 0 1px 0 rgba(255, 255, 255, 0.45);\r\n  font-weight: 700;\r\n  box-shadow: 0 1px 3px 1px rgba(0, 0, 0, 0.17), 0 1px 0 rgba(255, 255, 255, 0.36) inset;\r\n}\r\n.fzbuk-login-form input[type=\"submit\"]:hover {\r\n  background: #DDD;\r\n}\r\n.fzbuk-login-form input[type=\"submit\"]:active {\r\n  padding-top: 9px;\r\n  padding-bottom: 7px;\r\n  background: #C9C9C9;\r\n}\r\n','<div class=\"profilepress-reg-status\">Registration Successful.</div>','2016-07-06');
INSERT INTO `odpch_pp_registration_builder` VALUES (3,'Jakhu Registration Theme','<div class=\"jakhu-login-form\">\r\n\r\n	<div class=\"jakhu-header\">\r\n		<h1>Sign Up</h1><span>Fill out the form to create an account.</span>\r\n	</div>\r\n\r\n	<div class=\"jakhu-content\">\r\n		[reg-username placeholder=\"Username\" class=\"jakhu-input jakhu-username\"]\r\n\r\n		[reg-email placeholder=\"Email\" class=\"jakhu-input jakhu-email\"]\r\n\r\n		[reg-password placeholder=\"Password\" class=\"jakhu-input jakhu-password\"]\r\n\r\n		[reg-first-name class=\"jakhu-input jakhu-first-name\" placeholder=\"First Name\" required]\r\n\r\n		[reg-last-name class=\"jakhu-input jakhu-last-name\" placeholder=\"Last Name\" required]\r\n\r\n	</div>\r\n	<div class=\"jakhu-footer\">\r\n		[reg-submit value=\"Register\" class=\"jakhu-button\"]\r\n\r\n		[link-login class=\"jakhu-login\" label=\"Login\"]\r\n	</div>\r\n\r\n</div>\r\n','@import url(http://fonts.googleapis.com/css?family=Bree+Serif);\r\n\r\n/* css class for the registration form generated errors */\r\n.profilepress-reg-status {\r\n    width: 350px;\r\n	position: static;\r\n	z-index:5;\r\n	margin: 10px 0;\r\n	padding: 6px;\r\n	background: #f3f3f3;\r\n	border: 1px solid #fff;\r\n	border-radius: 5px;\r\n	box-shadow: 0 1px 3px rgba(0,0,0,0.5);\r\n	-moz-box-shadow: 0 1px 3px rgba(0,0,0,0.5);\r\n	-webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.5);\r\n}\r\n\r\n.jakhu-login-form .jakhu-header span::selection {\r\n	color: #fff;\r\n	background: #f676b2; /* Safari */\r\n}\r\n\r\n.jakhu-login-form .jakhu-header span::-moz-selection {\r\n	color: #fff;\r\n	background: #f676b2; /* Firefox */\r\n}\r\n\r\n.jakhu-login-form {\r\n	width: 350px;\r\n	position: static;\r\n	z-index:5;\r\n\r\n	background: #f3f3f3;\r\n	border: 1px solid #fff;\r\n	border-radius: 5px;\r\n\r\n	box-shadow: 0 1px 3px rgba(0,0,0,0.5);\r\n	-moz-box-shadow: 0 1px 3px rgba(0,0,0,0.5);\r\n	-webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.5);\r\n}\r\n\r\n.jakhu-login-form .jakhu-header {\r\n	padding: 40px 30px 30px 30px;\r\n}\r\n\r\n.jakhu-login-form .jakhu-header h1 {\r\n	font-family: \'Bree Serif\', serif;\r\n	font-weight: 300;\r\n	font-size: 28px;\r\n	line-height:34px;\r\n	color: #414848;\r\n	text-shadow: 1px 1px 0 rgba(256,256,256,1.0);\r\n	margin-bottom: 10px;\r\n}\r\n\r\n.jakhu-login-form .jakhu-header span {\r\n	font-size: 13px;\r\n	line-height: 16px;\r\n	color: #678889;\r\n	text-shadow: 1px 1px 0 rgba(256,256,256,1.0);\r\n	font-family: \"HelveticaNeue-Light\", \"Helvetica Neue Light\", \"Helvetica Neue\", Helvetica, Arial, \"Lucida Grande\", sans-serif;\r\n	font-weight:300;\r\n}\r\n\r\n.jakhu-login-form .jakhu-content {\r\n	padding: 0 30px 25px 30px;\r\n}\r\n\r\n/* Input field */\r\n.jakhu-login-form .jakhu-content .jakhu-input {\r\n	width: 240px;\r\n	padding: 15px 25px;\r\n	font-family: \"HelveticaNeue-Light\", \"Helvetica Neue Light\", \"Helvetica Neue\", Helvetica, Arial, \"Lucida Grande\", sans-serif;\r\n	font-weight: 400;\r\n	font-size: 14px;\r\n	color: #9d9e9e;\r\n	text-shadow: 1px 1px 0 rgba(256,256,256,1.0);\r\n\r\n	background: #fff;\r\n	border: 1px solid #fff;\r\n	border-radius: 5px;\r\n\r\n	box-shadow: inset 0 1px 3px rgba(0,0,0,0.50);\r\n	-moz-box-shadow: inset 0 1px 3px rgba(0,0,0,0.50);\r\n	-webkit-box-shadow: inset 0 1px 3px rgba(0,0,0,0.50);\r\n}\r\n\r\n/* Second and Third input fourth fifth field */\r\n.jakhu-login-form .jakhu-content .jakhu-password, .jakhu-login-form .jakhu-content .jakhu-email, .jakhu-login-form .jakhu-content .jakhu-pass-icon, .jakhu-login-form .jakhu-content .jakhu-first-name, .jakhu-login-form .jakhu-content .jakhu-last-name {\r\n	margin-top: 25px;\r\n}\r\n\r\n.jakhu-login-form .jakhu-content .jakhu-input:hover {\r\n	background: #dfe9ec;\r\n	color: #414848;\r\n}\r\n\r\n.jakhu-login-form .jakhu-content .jakhu-input:focus {\r\n	background: #dfe9ec;\r\n	color: #414848;\r\n\r\n	box-shadow: inset 0 1px 2px rgba(0,0,0,0.25);\r\n	-moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.25);\r\n	-webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.25);\r\n}\r\n\r\n\r\n/* Animation */\r\n.jakhu-input, .jakhu-user-icon, .jakhu-email-icon, .jakhu-pass-icon, .jakhu-button, .jakhu-login {\r\n	transition: all 0.5s;\r\n	-moz-transition: all 0.5s;\r\n	-webkit-transition: all 0.5s;\r\n	-o-transition: all 0.5s;\r\n	-ms-transition: all 0.5s;\r\n}\r\n\r\n.jakhu-login-form .jakhu-footer {\r\n	padding: 25px 30px 40px 30px;\r\n	overflow: auto;\r\n\r\n	background: #d4dedf;\r\n	border-top: 1px solid #fff;\r\n\r\n	box-shadow: inset 0 1px 0 rgba(0,0,0,0.15);\r\n	-moz-box-shadow: inset 0 1px 0 rgba(0,0,0,0.15);\r\n	-webkit-box-shadow: inset 0 1px 0 rgba(0,0,0,0.15);\r\n}\r\n\r\n/* Register button */\r\n.jakhu-login-form .jakhu-footer .jakhu-button {\r\n	float:right;\r\n	padding: 11px 25px;\r\n\r\n	font-family: \'Bree Serif\', serif;\r\n	font-weight: 300;\r\n	font-size: 18px;\r\n	color: #fff;\r\n	text-shadow: 0 1px 0 rgba(0,0,0,0.25);\r\n\r\n	background: #56c2e1;\r\n	border: 1px solid #46b3d3;\r\n	border-radius: 5px;\r\n	cursor: pointer;\r\n\r\n	box-shadow: inset 0 0 2px rgba(256,256,256,0.75);\r\n	-moz-box-shadow: inset 0 0 2px rgba(256,256,256,0.75);\r\n	-webkit-box-shadow: inset 0 0 2px rgba(256,256,256,0.75);\r\n}\r\n\r\n.jakhu-login-form .jakhu-footer .jakhu-button:hover {\r\n	background: #3f9db8;\r\n	border: 1px solid rgba(256,256,256,0.75);\r\n\r\n	box-shadow: inset 0 1px 3px rgba(0,0,0,0.5);\r\n	-moz-box-shadow: inset 0 1px 3px rgba(0,0,0,0.5);\r\n	-webkit-box-shadow: inset 0 1px 3px rgba(0,0,0,0.5);\r\n}\r\n\r\n.jakhu-login-form .jakhu-footer .jakhu-button:focus {\r\n	bottom: -1px;\r\n	background: #56c2e1;\r\n	box-shadow: inset 0 1px 6px rgba(256,256,256,0.75);\r\n	-moz-box-shadow: inset 0 1px 6px rgba(256,256,256,0.75);\r\n	-webkit-box-shadow: inset 0 1px 6px rgba(256,256,256,0.75);\r\n}\r\n\r\n/* Login link */\r\n.jakhu-login-form .jakhu-footer .jakhu-login {\r\n	display: block;\r\n	float: right;\r\n	padding: 10px;\r\n	margin-right: 20px;\r\n	text-decoration: none;\r\n	background: none;\r\n	border: none;\r\n	cursor: pointer;\r\n	font-family: \'Bree Serif\', serif;\r\n	font-weight: 300;\r\n	font-size: 20px;\r\n	color: #414848;\r\n	text-shadow: 0 1px 0 rgba(256,256,256,0.5);\r\n}\r\n\r\n.jakhu-login a {\r\n text-decoration: none;\r\n}\r\n\r\n.jakhu-login-form .jakhu-footer .jakhu-login:hover {\r\n	color: #3f9db8;\r\n}\r\n\r\n.jakhu-login-form .jakhu-footer .jakhu-login:focus {\r\n	position: relative;\r\n	bottom: -1px;\r\n}\r\n\r\n.jakhu-content input {\r\n  -webkit-box-sizing: border-box;\r\n  -moz-box-sizing: border-box;\r\n  box-sizing: border-box;\r\n}\r\n','<div class=\"profilepress-reg-status\">Registration Successful</div>','2016-07-06');
/*!40000 ALTER TABLE `odpch_pp_registration_builder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odpch_term_relationships`
--

DROP TABLE IF EXISTS `odpch_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odpch_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odpch_term_relationships`
--

LOCK TABLES `odpch_term_relationships` WRITE;
/*!40000 ALTER TABLE `odpch_term_relationships` DISABLE KEYS */;
INSERT INTO `odpch_term_relationships` VALUES (1,3,0);
INSERT INTO `odpch_term_relationships` VALUES (1,4,0);
INSERT INTO `odpch_term_relationships` VALUES (5,2,0);
INSERT INTO `odpch_term_relationships` VALUES (6,2,0);
INSERT INTO `odpch_term_relationships` VALUES (7,2,0);
INSERT INTO `odpch_term_relationships` VALUES (7,4,0);
INSERT INTO `odpch_term_relationships` VALUES (7,6,0);
INSERT INTO `odpch_term_relationships` VALUES (8,2,0);
INSERT INTO `odpch_term_relationships` VALUES (11,4,0);
INSERT INTO `odpch_term_relationships` VALUES (11,10,0);
INSERT INTO `odpch_term_relationships` VALUES (13,2,0);
INSERT INTO `odpch_term_relationships` VALUES (14,2,0);
INSERT INTO `odpch_term_relationships` VALUES (15,2,0);
INSERT INTO `odpch_term_relationships` VALUES (15,4,0);
INSERT INTO `odpch_term_relationships` VALUES (15,14,0);
INSERT INTO `odpch_term_relationships` VALUES (21,2,0);
INSERT INTO `odpch_term_relationships` VALUES (22,2,0);
INSERT INTO `odpch_term_relationships` VALUES (24,2,0);
INSERT INTO `odpch_term_relationships` VALUES (29,1,0);
INSERT INTO `odpch_term_relationships` VALUES (29,2,0);
/*!40000 ALTER TABLE `odpch_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odpch_term_taxonomy`
--

DROP TABLE IF EXISTS `odpch_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odpch_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odpch_term_taxonomy`
--

LOCK TABLES `odpch_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `odpch_term_taxonomy` DISABLE KEYS */;
INSERT INTO `odpch_term_taxonomy` VALUES (1,1,'category','',0,1);
INSERT INTO `odpch_term_taxonomy` VALUES (2,2,'language','a:3:{s:6:\"locale\";s:5:\"de_CH\";s:3:\"rtl\";i:0;s:9:\"flag_code\";s:2:\"ch\";}',0,11);
INSERT INTO `odpch_term_taxonomy` VALUES (3,3,'term_language','',0,1);
INSERT INTO `odpch_term_taxonomy` VALUES (4,4,'term_translations','a:4:{s:2:\"de\";i:1;s:2:\"en\";i:7;s:2:\"fr\";i:11;s:2:\"it\";i:15;}',0,4);
INSERT INTO `odpch_term_taxonomy` VALUES (5,5,'language','a:3:{s:6:\"locale\";s:5:\"en_US\";s:3:\"rtl\";i:0;s:9:\"flag_code\";s:2:\"us\";}',0,0);
INSERT INTO `odpch_term_taxonomy` VALUES (6,6,'term_language','',0,1);
INSERT INTO `odpch_term_taxonomy` VALUES (7,7,'category','',0,0);
INSERT INTO `odpch_term_taxonomy` VALUES (9,9,'language','a:3:{s:6:\"locale\";s:5:\"fr_FR\";s:3:\"rtl\";i:0;s:9:\"flag_code\";s:2:\"fr\";}',0,0);
INSERT INTO `odpch_term_taxonomy` VALUES (10,10,'term_language','',0,1);
INSERT INTO `odpch_term_taxonomy` VALUES (11,11,'category','',0,0);
INSERT INTO `odpch_term_taxonomy` VALUES (13,13,'language','a:3:{s:6:\"locale\";s:5:\"it_IT\";s:3:\"rtl\";i:0;s:9:\"flag_code\";s:2:\"it\";}',0,0);
INSERT INTO `odpch_term_taxonomy` VALUES (14,14,'term_language','',0,1);
INSERT INTO `odpch_term_taxonomy` VALUES (15,15,'category','',0,0);
/*!40000 ALTER TABLE `odpch_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odpch_termmeta`
--

DROP TABLE IF EXISTS `odpch_termmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odpch_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odpch_termmeta`
--

LOCK TABLES `odpch_termmeta` WRITE;
/*!40000 ALTER TABLE `odpch_termmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `odpch_termmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odpch_terms`
--

DROP TABLE IF EXISTS `odpch_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odpch_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odpch_terms`
--

LOCK TABLES `odpch_terms` WRITE;
/*!40000 ALTER TABLE `odpch_terms` DISABLE KEYS */;
INSERT INTO `odpch_terms` VALUES (1,'Allgemein','allgemein',0);
INSERT INTO `odpch_terms` VALUES (2,'Deutsch','de',0);
INSERT INTO `odpch_terms` VALUES (3,'Deutsch','pll_de',0);
INSERT INTO `odpch_terms` VALUES (4,'pll_577cc420a8246','pll_577cc420a8246',0);
INSERT INTO `odpch_terms` VALUES (5,'English','en',0);
INSERT INTO `odpch_terms` VALUES (6,'English','pll_en',0);
INSERT INTO `odpch_terms` VALUES (7,'Allgemein','allgemein-en',0);
INSERT INTO `odpch_terms` VALUES (9,'Français','fr',0);
INSERT INTO `odpch_terms` VALUES (10,'Français','pll_fr',0);
INSERT INTO `odpch_terms` VALUES (11,'Allgemein','allgemein-fr',0);
INSERT INTO `odpch_terms` VALUES (13,'Italiano','it',0);
INSERT INTO `odpch_terms` VALUES (14,'Italiano','pll_it',0);
INSERT INTO `odpch_terms` VALUES (15,'Allgemein','allgemein-it',0);
/*!40000 ALTER TABLE `odpch_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odpch_usermeta`
--

DROP TABLE IF EXISTS `odpch_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odpch_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odpch_usermeta`
--

LOCK TABLES `odpch_usermeta` WRITE;
/*!40000 ALTER TABLE `odpch_usermeta` DISABLE KEYS */;
INSERT INTO `odpch_usermeta` VALUES (1,1,'nickname','liip');
INSERT INTO `odpch_usermeta` VALUES (2,1,'first_name','');
INSERT INTO `odpch_usermeta` VALUES (3,1,'last_name','');
INSERT INTO `odpch_usermeta` VALUES (4,1,'description','');
INSERT INTO `odpch_usermeta` VALUES (5,1,'rich_editing','true');
INSERT INTO `odpch_usermeta` VALUES (6,1,'comment_shortcuts','false');
INSERT INTO `odpch_usermeta` VALUES (7,1,'admin_color','fresh');
INSERT INTO `odpch_usermeta` VALUES (8,1,'use_ssl','0');
INSERT INTO `odpch_usermeta` VALUES (9,1,'show_admin_bar_front','true');
INSERT INTO `odpch_usermeta` VALUES (10,1,'odpch_capabilities','a:1:{s:13:\"administrator\";b:1;}');
INSERT INTO `odpch_usermeta` VALUES (11,1,'odpch_user_level','10');
INSERT INTO `odpch_usermeta` VALUES (12,1,'dismissed_wp_pointers','pll_lgt');
INSERT INTO `odpch_usermeta` VALUES (13,1,'show_welcome_panel','1');
INSERT INTO `odpch_usermeta` VALUES (14,1,'session_tokens','a:1:{s:64:\"19104e19002e9e0f7b7bbea4711bf22a05d41cd1f603f42ad466a6cc5764cb17\";a:4:{s:10:\"expiration\";i:1467903224;s:2:\"ip\";s:12:\"192.168.56.1\";s:2:\"ua\";s:76:\"Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:47.0) Gecko/20100101 Firefox/47.0\";s:5:\"login\";i:1467730424;}}');
INSERT INTO `odpch_usermeta` VALUES (15,1,'odpch_user-settings','posts_list_mode=list&libraryContent=browse&mfold=o&advImgDetails=show&uploader=1&hidetb=1&editor=html');
INSERT INTO `odpch_usermeta` VALUES (16,1,'odpch_user-settings-time','1467810607');
INSERT INTO `odpch_usermeta` VALUES (17,1,'odpch_dashboard_quick_press_last_post_id','3');
INSERT INTO `odpch_usermeta` VALUES (18,2,'nickname','fabio');
INSERT INTO `odpch_usermeta` VALUES (19,2,'first_name','Fabio');
INSERT INTO `odpch_usermeta` VALUES (20,2,'last_name','Anderegg');
INSERT INTO `odpch_usermeta` VALUES (21,2,'description','');
INSERT INTO `odpch_usermeta` VALUES (22,2,'rich_editing','true');
INSERT INTO `odpch_usermeta` VALUES (23,2,'comment_shortcuts','false');
INSERT INTO `odpch_usermeta` VALUES (24,2,'admin_color','fresh');
INSERT INTO `odpch_usermeta` VALUES (25,2,'use_ssl','0');
INSERT INTO `odpch_usermeta` VALUES (26,2,'show_admin_bar_front','true');
INSERT INTO `odpch_usermeta` VALUES (27,2,'odpch_capabilities','a:1:{s:10:\"subscriber\";b:1;}');
INSERT INTO `odpch_usermeta` VALUES (28,2,'odpch_user_level','0');
INSERT INTO `odpch_usermeta` VALUES (30,2,'closedpostboxes_dashboard','a:0:{}');
INSERT INTO `odpch_usermeta` VALUES (31,2,'metaboxhidden_dashboard','a:0:{}');
INSERT INTO `odpch_usermeta` VALUES (32,2,'session_tokens','a:1:{s:64:\"7817ba47cd4e087d2a70c1d461cb60b77da6371cfb06759e253bf9b0093d6c4a\";a:4:{s:10:\"expiration\";i:1469016410;s:2:\"ip\";s:12:\"192.168.56.1\";s:2:\"ua\";s:76:\"Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:47.0) Gecko/20100101 Firefox/47.0\";s:5:\"login\";i:1467806810;}}');
/*!40000 ALTER TABLE `odpch_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odpch_users`
--

DROP TABLE IF EXISTS `odpch_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odpch_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odpch_users`
--

LOCK TABLES `odpch_users` WRITE;
/*!40000 ALTER TABLE `odpch_users` DISABLE KEYS */;
INSERT INTO `odpch_users` VALUES (1,'liip','$P$BX5Fb2voZi4IrZ8VtMgv4/BGE4qTkc.','liip','be-dev@liip.ch','','2016-07-05 14:53:21','',0,'liip');
INSERT INTO `odpch_users` VALUES (2,'fabio','$P$BsdCsZSZjqpW1pTMj9hsqInspKURkC0','fabio','fabio.anderegg@liip.ch','','2016-07-06 11:56:54','',0,'Fabio Anderegg');
/*!40000 ALTER TABLE `odpch_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-06 13:21:05
