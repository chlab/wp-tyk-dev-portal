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
  `comment_author` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `link_notes` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=535 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogdch_options`
--

LOCK TABLES `ogdch_options` WRITE;
/*!40000 ALTER TABLE `ogdch_options` DISABLE KEYS */;
INSERT INTO `ogdch_options` VALUES (1,'siteurl','http://ogdch.dev/cms','yes');
INSERT INTO `ogdch_options` VALUES (2,'home','http://ogdch.dev/cms','yes');
INSERT INTO `ogdch_options` VALUES (3,'blogname','OGDCH','yes');
INSERT INTO `ogdch_options` VALUES (4,'blogdescription','Just another WordPress site','yes');
INSERT INTO `ogdch_options` VALUES (5,'users_can_register','0','yes');
INSERT INTO `ogdch_options` VALUES (6,'admin_email','juerg.hunziker@liip.ch','yes');
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
INSERT INTO `ogdch_options` VALUES (23,'date_format','F j, Y','yes');
INSERT INTO `ogdch_options` VALUES (24,'time_format','g:i a','yes');
INSERT INTO `ogdch_options` VALUES (25,'links_updated_date_format','F j, Y g:i a','yes');
INSERT INTO `ogdch_options` VALUES (26,'comment_moderation','','yes');
INSERT INTO `ogdch_options` VALUES (27,'moderation_notify','','yes');
INSERT INTO `ogdch_options` VALUES (28,'permalink_structure','/%postname%/','yes');
INSERT INTO `ogdch_options` VALUES (29,'gzipcompression','0','yes');
INSERT INTO `ogdch_options` VALUES (30,'hack_file','0','yes');
INSERT INTO `ogdch_options` VALUES (31,'blog_charset','UTF-8','yes');
INSERT INTO `ogdch_options` VALUES (32,'moderation_keys','','no');
INSERT INTO `ogdch_options` VALUES (33,'active_plugins','a:9:{i:0;s:31:\"query-monitor/query-monitor.php\";i:1;s:21:\"polylang/polylang.php\";i:2;s:13:\"cmb2/init.php\";i:3;s:19:\"members/members.php\";i:4;s:17:\"polylang-slug.php\";i:5;s:47:\"regenerate-thumbnails/regenerate-thumbnails.php\";i:6;s:51:\"rewrite-rules-inspector/rewrite-rules-inspector.php\";i:7;s:32:\"wp-app-showcase/app-showcase.php\";i:8;s:32:\"wp-ckan-backend/ckan-backend.php\";}','yes');
INSERT INTO `ogdch_options` VALUES (34,'category_base','','yes');
INSERT INTO `ogdch_options` VALUES (35,'ping_sites','http://rpc.pingomatic.com/','yes');
INSERT INTO `ogdch_options` VALUES (36,'advanced_edit','0','yes');
INSERT INTO `ogdch_options` VALUES (37,'comment_max_links','2','yes');
INSERT INTO `ogdch_options` VALUES (38,'gmt_offset','0','yes');
INSERT INTO `ogdch_options` VALUES (39,'default_email_category','15','yes');
INSERT INTO `ogdch_options` VALUES (40,'recently_edited','','no');
INSERT INTO `ogdch_options` VALUES (41,'template','wp-ogdch-theme','yes');
INSERT INTO `ogdch_options` VALUES (42,'stylesheet','wp-ogdch-theme','yes');
INSERT INTO `ogdch_options` VALUES (43,'comment_whitelist','','yes');
INSERT INTO `ogdch_options` VALUES (44,'blacklist_keys','','no');
INSERT INTO `ogdch_options` VALUES (45,'comment_registration','','yes');
INSERT INTO `ogdch_options` VALUES (46,'html_type','text/html','yes');
INSERT INTO `ogdch_options` VALUES (47,'use_trackback','0','yes');
INSERT INTO `ogdch_options` VALUES (48,'default_role','subscriber','yes');
INSERT INTO `ogdch_options` VALUES (49,'db_version','33055','yes');
INSERT INTO `ogdch_options` VALUES (50,'uploads_use_yearmonth_folders','1','yes');
INSERT INTO `ogdch_options` VALUES (51,'upload_path','','yes');
INSERT INTO `ogdch_options` VALUES (52,'blog_public','0','yes');
INSERT INTO `ogdch_options` VALUES (53,'default_link_category','0','yes');
INSERT INTO `ogdch_options` VALUES (54,'show_on_front','page','yes');
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
INSERT INTO `ogdch_options` VALUES (83,'timezone_string','','yes');
INSERT INTO `ogdch_options` VALUES (85,'page_on_front','0','yes');
INSERT INTO `ogdch_options` VALUES (86,'default_post_format','0','yes');
INSERT INTO `ogdch_options` VALUES (87,'link_manager_enabled','0','yes');
INSERT INTO `ogdch_options` VALUES (88,'initial_db_version','32453','yes');
INSERT INTO `ogdch_options` VALUES (89,'ogdch_user_roles','a:8:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:114:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:9:\"add_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:10:\"list_roles\";b:1;s:12:\"create_roles\";b:1;s:12:\"delete_roles\";b:1;s:10:\"edit_roles\";b:1;s:16:\"restrict_content\";b:1;s:13:\"edit_datasets\";b:1;s:20:\"edit_others_datasets\";b:1;s:16:\"publish_datasets\";b:1;s:21:\"read_private_datasets\";b:1;s:15:\"delete_datasets\";b:1;s:23:\"delete_private_datasets\";b:1;s:25:\"delete_published_datasets\";b:1;s:22:\"delete_others_datasets\";b:1;s:21:\"edit_private_datasets\";b:1;s:23:\"edit_published_datasets\";b:1;s:15:\"create_datasets\";b:1;s:16:\"disable_datasets\";b:1;s:11:\"edit_groups\";b:1;s:18:\"edit_others_groups\";b:1;s:14:\"publish_groups\";b:1;s:19:\"read_private_groups\";b:1;s:13:\"delete_groups\";b:1;s:21:\"delete_private_groups\";b:1;s:23:\"delete_published_groups\";b:1;s:20:\"delete_others_groups\";b:1;s:19:\"edit_private_groups\";b:1;s:21:\"edit_published_groups\";b:1;s:13:\"create_groups\";b:1;s:18:\"edit_organisations\";b:1;s:25:\"edit_others_organisations\";b:1;s:21:\"publish_organisations\";b:1;s:26:\"read_private_organisations\";b:1;s:20:\"delete_organisations\";b:1;s:28:\"delete_private_organisations\";b:1;s:30:\"delete_published_organisations\";b:1;s:27:\"delete_others_organisations\";b:1;s:26:\"edit_private_organisations\";b:1;s:28:\"edit_published_organisations\";b:1;s:20:\"create_organisations\";b:1;s:9:\"edit_apps\";b:1;s:16:\"edit_others_apps\";b:1;s:12:\"publish_apps\";b:1;s:17:\"read_private_apps\";b:1;s:11:\"delete_apps\";b:1;s:19:\"delete_private_apps\";b:1;s:21:\"delete_published_apps\";b:1;s:18:\"delete_others_apps\";b:1;s:17:\"edit_private_apps\";b:1;s:19:\"edit_published_apps\";b:1;s:11:\"create_apps\";b:1;s:22:\"edit_user_organisation\";b:1;s:18:\"view_query_monitor\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:14:\"datenlieferant\";a:2:{s:4:\"name\";s:14:\"Datenlieferant\";s:12:\"capabilities\";a:9:{s:4:\"read\";b:1;s:12:\"upload_files\";b:1;s:15:\"create_datasets\";b:1;s:13:\"edit_datasets\";b:1;s:21:\"edit_private_datasets\";b:1;s:23:\"edit_published_datasets\";b:1;s:16:\"publish_datasets\";b:1;s:21:\"read_private_datasets\";b:1;s:10:\"edit_posts\";b:1;}}s:10:\"data-owner\";a:2:{s:4:\"name\";s:10:\"Data Owner\";s:12:\"capabilities\";a:13:{s:4:\"read\";b:1;s:12:\"upload_files\";b:1;s:15:\"create_datasets\";b:1;s:13:\"edit_datasets\";b:1;s:21:\"edit_private_datasets\";b:1;s:23:\"edit_published_datasets\";b:1;s:16:\"publish_datasets\";b:1;s:21:\"read_private_datasets\";b:1;s:18:\"edit_organisations\";b:1;s:26:\"edit_private_organisations\";b:1;s:28:\"edit_published_organisations\";b:1;s:26:\"read_private_organisations\";b:1;s:10:\"edit_posts\";b:1;}}s:15:\"content-manager\";a:2:{s:4:\"name\";s:15:\"Content Manager\";s:12:\"capabilities\";a:25:{s:4:\"read\";b:1;s:12:\"upload_files\";b:1;s:18:\"edit_theme_options\";b:1;s:11:\"create_apps\";b:1;s:11:\"delete_apps\";b:1;s:18:\"delete_others_apps\";b:1;s:19:\"delete_private_apps\";b:1;s:21:\"delete_published_apps\";b:1;s:9:\"edit_apps\";b:1;s:16:\"edit_others_apps\";b:1;s:17:\"edit_private_apps\";b:1;s:19:\"edit_published_apps\";b:1;s:12:\"publish_apps\";b:1;s:17:\"read_private_apps\";b:1;s:19:\"delete_others_pages\";b:1;s:12:\"delete_pages\";b:1;s:20:\"delete_private_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:17:\"edit_others_pages\";b:1;s:10:\"edit_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:18:\"read_private_pages\";b:1;s:10:\"edit_posts\";b:1;}}}','yes');
INSERT INTO `ogdch_options` VALUES (90,'widget_search','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `ogdch_options` VALUES (91,'widget_recent-posts','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `ogdch_options` VALUES (92,'widget_recent-comments','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `ogdch_options` VALUES (93,'widget_archives','a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `ogdch_options` VALUES (94,'widget_meta','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `ogdch_options` VALUES (95,'sidebars_widgets','a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:18:\"orphaned_widgets_1\";a:1:{i:0;s:17:\"recent-comments-2\";}s:13:\"array_version\";i:3;}','yes');
INSERT INTO `ogdch_options` VALUES (97,'cron','a:6:{i:1441024981;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1441027957;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1441028281;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1441050540;a:1:{s:20:\"wp_maybe_auto_update\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}s:20:\"wp_batch_split_terms\";a:360:{i:1440604886;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440604905;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440604906;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440604910;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440604914;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440604942;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605025;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605029;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605032;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605068;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605201;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605296;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605300;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605301;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605351;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605397;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605398;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605399;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605400;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605401;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605415;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605421;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605422;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605423;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605424;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605452;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605453;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605466;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605467;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605544;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605545;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605546;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605547;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605558;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605559;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605560;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605567;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605568;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605569;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605591;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605677;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605678;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605679;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605680;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605681;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605727;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605768;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440605973;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440606016;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440606050;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440606115;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440606196;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440606278;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440606279;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440606458;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440606460;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440606478;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440606487;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440606514;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440606566;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440606720;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440607220;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440607237;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440607239;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440607242;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440607243;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440607248;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440607249;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440607250;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440607267;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440607368;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440607369;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440607370;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440607371;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440607373;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440607375;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440607380;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440607382;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440607383;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440607386;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440607402;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440607519;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440607533;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440607549;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440607575;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440607591;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440607710;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440607831;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440607951;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440608005;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440608008;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440608009;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440660653;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440660779;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440660900;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440661024;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440661131;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440661155;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440661170;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440661185;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440661196;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440661197;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440661200;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440661203;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440661204;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440661206;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440661207;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440661208;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440661223;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440661238;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440661300;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440661301;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440661304;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440661306;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440661309;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440661311;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440661316;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440661324;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440661339;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440661400;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440661462;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440661583;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440770243;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1440798293;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441002633;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441002642;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441002706;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441002831;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441002956;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441003090;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441003221;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441003342;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441003464;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441003584;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441003706;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441003827;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441003948;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441004069;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441004192;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441004312;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441004374;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441004442;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441004562;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441004683;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441004812;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441004943;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441005353;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441005354;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441005355;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441005356;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441005357;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441005395;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441005396;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441005397;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441005398;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441005415;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441005479;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441005494;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441005594;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441005610;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441005698;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441005715;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441005834;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441005962;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441005976;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441005993;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441006002;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441006003;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441006019;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441006144;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441006268;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441006356;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441006372;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441006493;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441006614;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441006735;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441006856;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441010683;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441010712;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441010715;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441010716;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441010721;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441010726;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441010728;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441010732;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441010734;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441010736;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441010741;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441010742;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441010747;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441010758;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441010773;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441010778;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441010819;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441010824;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441010835;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441010838;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441010906;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441010955;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011033;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011076;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011149;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011150;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011153;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011164;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011165;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011171;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011178;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011179;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011194;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011287;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011315;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011398;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011400;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011401;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011403;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011404;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011411;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011420;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011423;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011435;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011444;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011447;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011463;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011479;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011493;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011495;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011508;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011524;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011644;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011659;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011719;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011764;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011814;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011829;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011832;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011835;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011841;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011847;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011857;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011873;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011874;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011875;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011936;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011973;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441011997;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012057;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012096;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012114;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012116;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012118;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012121;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012122;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012125;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012147;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012183;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012186;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012208;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012247;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012280;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012340;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012368;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012460;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012488;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012552;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012555;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012557;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012559;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012560;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012561;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012562;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012563;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012564;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012580;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012588;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012589;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012604;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012620;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012623;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012642;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012658;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012672;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012685;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012687;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012703;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012762;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012765;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012766;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012772;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012774;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012779;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012780;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012802;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012805;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012812;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012815;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012816;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012825;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012838;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012839;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012842;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012849;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012850;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012854;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012855;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012863;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012923;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441012983;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013044;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013104;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013214;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013215;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013218;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013225;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013226;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013227;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013228;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013232;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013293;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013354;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013428;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013438;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013441;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013442;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013443;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013444;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013445;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013446;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013461;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013487;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013488;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013489;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013496;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013497;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013512;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013527;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013546;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013561;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013588;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013603;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013618;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013738;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013773;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013774;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013775;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013776;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013777;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013779;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013780;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013795;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013818;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013828;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013831;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013863;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013874;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013885;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013888;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013892;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013896;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}i:1441013915;a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}}s:7:\"version\";i:2;}','yes');
INSERT INTO `ogdch_options` VALUES (134,'db_upgraded','','yes');
INSERT INTO `ogdch_options` VALUES (142,'recently_activated','a:2:{s:24:\"wordpress-seo/wp-seo.php\";i:1440508955;s:45:\"wpml-comment-merging/wpml-comment-merging.php\";i:1440508949;}','yes');
INSERT INTO `ogdch_options` VALUES (147,'members_db_version','2','yes');
INSERT INTO `ogdch_options` VALUES (148,'members_settings','a:8:{s:12:\"role_manager\";i:1;s:19:\"content_permissions\";i:0;s:25:\"content_permissions_error\";s:85:\"<p class=\"restricted\">Sorry, but you do not have permission to view this content.</p>\";s:17:\"login_form_widget\";i:0;s:12:\"users_widget\";i:0;s:12:\"private_blog\";i:0;s:12:\"private_feed\";i:0;s:18:\"private_feed_error\";s:80:\"<p class=\"restricted\">You must be logged into the site to view this content.</p>\";}','yes');
INSERT INTO `ogdch_options` VALUES (151,'polylang','a:14:{s:7:\"browser\";i:1;s:7:\"rewrite\";i:1;s:12:\"hide_default\";i:0;s:10:\"force_lang\";i:1;s:13:\"redirect_lang\";i:0;s:13:\"media_support\";i:1;s:4:\"sync\";a:11:{i:0;s:10:\"taxonomies\";i:1;s:9:\"post_meta\";i:2;s:14:\"comment_status\";i:3;s:11:\"ping_status\";i:4;s:12:\"sticky_posts\";i:5;s:9:\"post_date\";i:6;s:11:\"post_format\";i:7;s:11:\"post_parent\";i:8;s:17:\"_wp_page_template\";i:9;s:10:\"menu_order\";i:10;s:13:\"_thumbnail_id\";}s:10:\"post_types\";a:1:{i:0;s:3:\"app\";}s:10:\"taxonomies\";a:2:{i:0;s:17:\"ckan_organisation\";i:1;s:10:\"ckan_group\";}s:7:\"domains\";a:0:{}s:7:\"version\";s:5:\"1.7.9\";s:12:\"default_lang\";s:2:\"de\";s:9:\"nav_menus\";a:2:{s:5:\"ogdch\";a:1:{s:18:\"service_navigation\";a:0:{}}s:14:\"wp-ogdch-theme\";a:1:{s:15:\"main_navigation\";a:4:{s:2:\"de\";i:135;s:2:\"en\";i:136;s:2:\"it\";i:137;s:2:\"fr\";i:138;}}}s:16:\"previous_version\";s:5:\"1.7.8\";}','yes');
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
INSERT INTO `ogdch_options` VALUES (476,'wpseo','a:20:{s:14:\"blocking_files\";a:0:{}s:26:\"ignore_blog_public_warning\";b:1;s:31:\"ignore_meta_description_warning\";b:0;s:20:\"ignore_page_comments\";b:0;s:16:\"ignore_permalink\";b:0;s:15:\"ms_defaults_set\";b:0;s:23:\"theme_description_found\";s:0:\"\";s:21:\"theme_has_description\";b:0;s:7:\"version\";s:5:\"2.3.4\";s:11:\"alexaverify\";s:0:\"\";s:12:\"company_logo\";s:0:\"\";s:12:\"company_name\";s:0:\"\";s:17:\"company_or_person\";s:0:\"\";s:20:\"disableadvanced_meta\";b:1;s:12:\"googleverify\";s:0:\"\";s:8:\"msverify\";s:0:\"\";s:11:\"person_name\";s:0:\"\";s:12:\"website_name\";s:0:\"\";s:22:\"alternate_website_name\";s:0:\"\";s:12:\"yandexverify\";s:0:\"\";}','yes');
INSERT INTO `ogdch_options` VALUES (477,'wpseo_permalinks','a:13:{s:15:\"cleanpermalinks\";b:0;s:24:\"cleanpermalink-extravars\";s:0:\"\";s:29:\"cleanpermalink-googlecampaign\";b:0;s:31:\"cleanpermalink-googlesitesearch\";b:0;s:15:\"cleanreplytocom\";b:0;s:10:\"cleanslugs\";b:1;s:14:\"hide-feedlinks\";b:0;s:12:\"hide-rsdlink\";b:0;s:14:\"hide-shortlink\";b:0;s:16:\"hide-wlwmanifest\";b:0;s:18:\"redirectattachment\";b:0;s:17:\"stripcategorybase\";b:0;s:13:\"trailingslash\";b:0;}','yes');
INSERT INTO `ogdch_options` VALUES (478,'wpseo_titles','a:86:{s:10:\"title_test\";i:0;s:17:\"forcerewritetitle\";b:1;s:9:\"separator\";s:8:\"sc-mdash\";s:5:\"noodp\";b:0;s:6:\"noydir\";b:0;s:15:\"usemetakeywords\";b:1;s:16:\"title-home-wpseo\";s:42:\"%%sitename%% %%page%% %%sep%% %%sitedesc%%\";s:18:\"title-author-wpseo\";s:41:\"%%name%%, Autor auf %%sitename%% %%page%%\";s:19:\"title-archive-wpseo\";s:38:\"%%date%% %%page%% %%sep%% %%sitename%%\";s:18:\"title-search-wpseo\";s:67:\"Du hast nach %%searchphrase%% gesucht %%page%% %%sep%% %%sitename%%\";s:15:\"title-404-wpseo\";s:41:\"Seite nicht gefunden %%sep%% %%sitename%%\";s:19:\"metadesc-home-wpseo\";s:0:\"\";s:21:\"metadesc-author-wpseo\";s:0:\"\";s:22:\"metadesc-archive-wpseo\";s:0:\"\";s:18:\"metakey-home-wpseo\";s:0:\"\";s:20:\"metakey-author-wpseo\";s:0:\"\";s:22:\"noindex-subpages-wpseo\";b:0;s:20:\"noindex-author-wpseo\";b:1;s:21:\"noindex-archive-wpseo\";b:1;s:14:\"disable-author\";b:1;s:12:\"disable-date\";b:0;s:10:\"title-post\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:13:\"metadesc-post\";s:0:\"\";s:12:\"metakey-post\";s:0:\"\";s:12:\"noindex-post\";b:0;s:13:\"showdate-post\";b:0;s:16:\"hideeditbox-post\";b:0;s:10:\"title-page\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:13:\"metadesc-page\";s:0:\"\";s:12:\"metakey-page\";s:0:\"\";s:12:\"noindex-page\";b:0;s:13:\"showdate-page\";b:0;s:16:\"hideeditbox-page\";b:0;s:16:\"title-attachment\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:19:\"metadesc-attachment\";s:0:\"\";s:18:\"metakey-attachment\";s:0:\"\";s:18:\"noindex-attachment\";b:0;s:19:\"showdate-attachment\";b:0;s:22:\"hideeditbox-attachment\";b:1;s:18:\"title-tax-category\";s:52:\"%%term_title%% Archive %%page%% %%sep%% %%sitename%%\";s:21:\"metadesc-tax-category\";s:0:\"\";s:20:\"metakey-tax-category\";s:0:\"\";s:24:\"hideeditbox-tax-category\";b:1;s:20:\"noindex-tax-category\";b:1;s:18:\"title-tax-post_tag\";s:52:\"%%term_title%% Archive %%page%% %%sep%% %%sitename%%\";s:21:\"metadesc-tax-post_tag\";s:0:\"\";s:20:\"metakey-tax-post_tag\";s:0:\"\";s:24:\"hideeditbox-tax-post_tag\";b:1;s:20:\"noindex-tax-post_tag\";b:1;s:21:\"title-tax-post_format\";s:52:\"%%term_title%% Archive %%page%% %%sep%% %%sitename%%\";s:24:\"metadesc-tax-post_format\";s:0:\"\";s:23:\"metakey-tax-post_format\";s:0:\"\";s:27:\"hideeditbox-tax-post_format\";b:1;s:23:\"noindex-tax-post_format\";b:1;s:9:\"title-app\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:12:\"metadesc-app\";s:0:\"\";s:11:\"metakey-app\";s:0:\"\";s:11:\"noindex-app\";b:0;s:12:\"showdate-app\";b:0;s:15:\"hideeditbox-app\";b:0;s:18:\"title-ckan-dataset\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:21:\"metadesc-ckan-dataset\";s:0:\"\";s:20:\"metakey-ckan-dataset\";s:0:\"\";s:20:\"noindex-ckan-dataset\";b:0;s:21:\"showdate-ckan-dataset\";b:0;s:24:\"hideeditbox-ckan-dataset\";b:0;s:19:\"title-ptarchive-app\";s:50:\"%%pt_plural%% Archiv %%page%% %%sep%% %%sitename%%\";s:22:\"metadesc-ptarchive-app\";s:0:\"\";s:21:\"metakey-ptarchive-app\";s:0:\"\";s:21:\"bctitle-ptarchive-app\";s:0:\"\";s:21:\"noindex-ptarchive-app\";b:0;s:28:\"title-ptarchive-ckan-dataset\";s:50:\"%%pt_plural%% Archiv %%page%% %%sep%% %%sitename%%\";s:31:\"metadesc-ptarchive-ckan-dataset\";s:0:\"\";s:30:\"metakey-ptarchive-ckan-dataset\";s:0:\"\";s:30:\"bctitle-ptarchive-ckan-dataset\";s:0:\"\";s:30:\"noindex-ptarchive-ckan-dataset\";b:0;s:27:\"title-tax-ckan_organisation\";s:52:\"%%term_title%% Archive %%page%% %%sep%% %%sitename%%\";s:30:\"metadesc-tax-ckan_organisation\";s:0:\"\";s:29:\"metakey-tax-ckan_organisation\";s:0:\"\";s:33:\"hideeditbox-tax-ckan_organisation\";b:1;s:29:\"noindex-tax-ckan_organisation\";b:1;s:20:\"title-tax-ckan_group\";s:52:\"%%term_title%% Archive %%page%% %%sep%% %%sitename%%\";s:23:\"metadesc-tax-ckan_group\";s:0:\"\";s:22:\"metakey-tax-ckan_group\";s:0:\"\";s:26:\"hideeditbox-tax-ckan_group\";b:1;s:22:\"noindex-tax-ckan_group\";b:1;}','yes');
INSERT INTO `ogdch_options` VALUES (479,'wpseo_social','a:21:{s:9:\"fb_admins\";a:0:{}s:12:\"fbconnectkey\";s:32:\"def8ea9dabc6d01b1b1da6aa2672f652\";s:13:\"facebook_site\";s:0:\"\";s:13:\"instagram_url\";s:0:\"\";s:12:\"linkedin_url\";s:0:\"\";s:11:\"myspace_url\";s:0:\"\";s:16:\"og_default_image\";s:0:\"\";s:18:\"og_frontpage_title\";s:0:\"\";s:17:\"og_frontpage_desc\";s:0:\"\";s:18:\"og_frontpage_image\";s:0:\"\";s:9:\"opengraph\";b:1;s:10:\"googleplus\";b:0;s:13:\"pinterest_url\";s:0:\"\";s:15:\"pinterestverify\";s:0:\"\";s:14:\"plus-publisher\";s:0:\"\";s:7:\"twitter\";b:1;s:12:\"twitter_site\";s:0:\"\";s:17:\"twitter_card_type\";s:7:\"summary\";s:11:\"youtube_url\";s:0:\"\";s:15:\"google_plus_url\";s:0:\"\";s:10:\"fbadminapp\";s:0:\"\";}','yes');
INSERT INTO `ogdch_options` VALUES (480,'wpseo_rss','a:2:{s:9:\"rssbefore\";s:0:\"\";s:8:\"rssafter\";s:58:\"Der Beitrag %%POSTLINK%% erschien zuerst auf %%BLOGLINK%%.\";}','yes');
INSERT INTO `ogdch_options` VALUES (481,'wpseo_internallinks','a:16:{s:20:\"breadcrumbs-404crumb\";s:32:\"Fehler 404: Seite nicht gefunden\";s:23:\"breadcrumbs-blog-remove\";b:0;s:20:\"breadcrumbs-boldlast\";b:0;s:25:\"breadcrumbs-archiveprefix\";s:11:\"Archiv für\";s:18:\"breadcrumbs-enable\";b:0;s:16:\"breadcrumbs-home\";s:4:\"Home\";s:18:\"breadcrumbs-prefix\";s:0:\"\";s:24:\"breadcrumbs-searchprefix\";s:22:\"Sie haben gesucht nach\";s:15:\"breadcrumbs-sep\";s:7:\"&raquo;\";s:23:\"post_types-post-maintax\";i:0;s:23:\"post_types-page-maintax\";i:0;s:29:\"post_types-attachment-maintax\";i:0;s:22:\"post_types-app-maintax\";i:0;s:31:\"post_types-ckan-dataset-maintax\";i:0;s:35:\"taxonomy-ckan_organisation-ptparent\";i:0;s:28:\"taxonomy-ckan_group-ptparent\";i:0;}','yes');
INSERT INTO `ogdch_options` VALUES (482,'wpseo_xml','a:19:{s:22:\"disable_author_sitemap\";b:0;s:22:\"disable_author_noposts\";b:0;s:16:\"enablexmlsitemap\";b:1;s:16:\"entries-per-page\";i:1000;s:38:\"user_role-administrator-not_in_sitemap\";b:0;s:31:\"user_role-editor-not_in_sitemap\";b:0;s:31:\"user_role-author-not_in_sitemap\";b:0;s:36:\"user_role-contributor-not_in_sitemap\";b:0;s:35:\"user_role-subscriber-not_in_sitemap\";b:0;s:30:\"post_types-post-not_in_sitemap\";b:0;s:30:\"post_types-page-not_in_sitemap\";b:0;s:36:\"post_types-attachment-not_in_sitemap\";b:1;s:34:\"taxonomies-category-not_in_sitemap\";b:0;s:34:\"taxonomies-post_tag-not_in_sitemap\";b:1;s:37:\"taxonomies-post_format-not_in_sitemap\";b:0;s:29:\"post_types-app-not_in_sitemap\";b:0;s:38:\"post_types-ckan-dataset-not_in_sitemap\";b:0;s:43:\"taxonomies-ckan_organisation-not_in_sitemap\";b:1;s:36:\"taxonomies-ckan_group-not_in_sitemap\";b:1;}','yes');
INSERT INTO `ogdch_options` VALUES (488,'theme_mods_wp-ogdch-theme','a:2:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:15:\"main_navigation\";i:135;}}','yes');
INSERT INTO `ogdch_options` VALUES (490,'auto_core_update_notified','a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:22:\"juerg.hunziker@liip.ch\";s:7:\"version\";s:5:\"4.2.3\";s:9:\"timestamp\";i:1438073767;}','yes');
INSERT INTO `ogdch_options` VALUES (519,'page_for_posts','0','yes');
INSERT INTO `ogdch_options` VALUES (520,'finished_splitting_shared_terms','1','yes');
INSERT INTO `ogdch_options` VALUES (522,'can_compress_scripts','1','yes');
INSERT INTO `ogdch_options` VALUES (528,'rewrite_rules','a:182:{s:20:\"(de|en|it|fr)/app/?$\";s:40:\"index.php?lang=$matches[1]&post_type=app\";s:50:\"(de|en|it|fr)/app/feed/(feed|rdf|rss|rss2|atom)/?$\";s:57:\"index.php?lang=$matches[1]&post_type=app&feed=$matches[2]\";s:45:\"(de|en|it|fr)/app/(feed|rdf|rss|rss2|atom)/?$\";s:57:\"index.php?lang=$matches[1]&post_type=app&feed=$matches[2]\";s:37:\"(de|en|it|fr)/app/page/([0-9]{1,})/?$\";s:58:\"index.php?lang=$matches[1]&post_type=app&paged=$matches[2]\";s:61:\"(de|en|it|fr)/category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[2]&feed=$matches[3]\";s:56:\"(de|en|it|fr)/category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[2]&feed=$matches[3]\";s:49:\"(de|en|it|fr)/category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[2]&paged=$matches[3]\";s:31:\"(de|en|it|fr)/category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[2]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:58:\"(de|en|it|fr)/tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[2]&feed=$matches[3]\";s:53:\"(de|en|it|fr)/tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[2]&feed=$matches[3]\";s:46:\"(de|en|it|fr)/tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[2]&paged=$matches[3]\";s:28:\"(de|en|it|fr)/tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[2]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:59:\"(de|en|it|fr)/type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:67:\"index.php?lang=$matches[1]&post_format=$matches[2]&feed=$matches[3]\";s:54:\"(de|en|it|fr)/type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:67:\"index.php?lang=$matches[1]&post_format=$matches[2]&feed=$matches[3]\";s:47:\"(de|en|it|fr)/type/([^/]+)/page/?([0-9]{1,})/?$\";s:68:\"index.php?lang=$matches[1]&post_format=$matches[2]&paged=$matches[3]\";s:29:\"(de|en|it|fr)/type/([^/]+)/?$\";s:50:\"index.php?lang=$matches[1]&post_format=$matches[2]\";s:45:\"(de|en|it|fr)/app/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[2]\";s:55:\"(de|en|it|fr)/app/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[2]&tb=1\";s:75:\"(de|en|it|fr)/app/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:70:\"(de|en|it|fr)/app/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:70:\"(de|en|it|fr)/app/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[2]&cpage=$matches[3]\";s:38:\"(de|en|it|fr)/app/([^/]+)/trackback/?$\";s:30:\"index.php?app=$matches[2]&tb=1\";s:58:\"(de|en|it|fr)/app/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?app=$matches[2]&feed=$matches[3]\";s:53:\"(de|en|it|fr)/app/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?app=$matches[2]&feed=$matches[3]\";s:46:\"(de|en|it|fr)/app/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?app=$matches[2]&paged=$matches[3]\";s:53:\"(de|en|it|fr)/app/([^/]+)/comment-page-([0-9]{1,})/?$\";s:43:\"index.php?app=$matches[2]&cpage=$matches[3]\";s:38:\"(de|en|it|fr)/app/([^/]+)(/[0-9]+)?/?$\";s:42:\"index.php?app=$matches[2]&page=$matches[3]\";s:34:\"(de|en|it|fr)/app/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[2]\";s:44:\"(de|en|it|fr)/app/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[2]&tb=1\";s:64:\"(de|en|it|fr)/app/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:59:\"(de|en|it|fr)/app/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:59:\"(de|en|it|fr)/app/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[2]&cpage=$matches[3]\";s:31:\"app/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:41:\"app/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:61:\"app/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:56:\"app/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:56:\"app/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:24:\"app/([^/]+)/trackback/?$\";s:30:\"index.php?app=$matches[1]&tb=1\";s:44:\"app/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?app=$matches[1]&feed=$matches[2]\";s:39:\"app/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?app=$matches[1]&feed=$matches[2]\";s:32:\"app/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?app=$matches[1]&paged=$matches[2]\";s:39:\"app/([^/]+)/comment-page-([0-9]{1,})/?$\";s:43:\"index.php?app=$matches[1]&cpage=$matches[2]\";s:24:\"app/([^/]+)(/[0-9]+)?/?$\";s:42:\"index.php?app=$matches[1]&page=$matches[2]\";s:20:\"app/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:30:\"app/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:50:\"app/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:45:\"app/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:45:\"app/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:46:\"ckan-local-dataset/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:56:\"ckan-local-dataset/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:76:\"ckan-local-dataset/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:71:\"ckan-local-dataset/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:71:\"ckan-local-dataset/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:39:\"ckan-local-dataset/([^/]+)/trackback/?$\";s:45:\"index.php?ckan-local-dataset=$matches[1]&tb=1\";s:47:\"ckan-local-dataset/([^/]+)/page/?([0-9]{1,})/?$\";s:58:\"index.php?ckan-local-dataset=$matches[1]&paged=$matches[2]\";s:54:\"ckan-local-dataset/([^/]+)/comment-page-([0-9]{1,})/?$\";s:58:\"index.php?ckan-local-dataset=$matches[1]&cpage=$matches[2]\";s:39:\"ckan-local-dataset/([^/]+)(/[0-9]+)?/?$\";s:57:\"index.php?ckan-local-dataset=$matches[1]&page=$matches[2]\";s:35:\"ckan-local-dataset/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:45:\"ckan-local-dataset/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:65:\"ckan-local-dataset/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"ckan-local-dataset/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"ckan-local-dataset/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:44:\"ckan-local-group/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:54:\"ckan-local-group/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:74:\"ckan-local-group/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:69:\"ckan-local-group/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:69:\"ckan-local-group/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:37:\"ckan-local-group/([^/]+)/trackback/?$\";s:43:\"index.php?ckan-local-group=$matches[1]&tb=1\";s:45:\"ckan-local-group/([^/]+)/page/?([0-9]{1,})/?$\";s:56:\"index.php?ckan-local-group=$matches[1]&paged=$matches[2]\";s:52:\"ckan-local-group/([^/]+)/comment-page-([0-9]{1,})/?$\";s:56:\"index.php?ckan-local-group=$matches[1]&cpage=$matches[2]\";s:37:\"ckan-local-group/([^/]+)(/[0-9]+)?/?$\";s:55:\"index.php?ckan-local-group=$matches[1]&page=$matches[2]\";s:33:\"ckan-local-group/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:43:\"ckan-local-group/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:63:\"ckan-local-group/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:58:\"ckan-local-group/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:58:\"ckan-local-group/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:42:\"ckan-local-org/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:52:\"ckan-local-org/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:72:\"ckan-local-org/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:67:\"ckan-local-org/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:67:\"ckan-local-org/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:35:\"ckan-local-org/([^/]+)/trackback/?$\";s:41:\"index.php?ckan-local-org=$matches[1]&tb=1\";s:43:\"ckan-local-org/([^/]+)/page/?([0-9]{1,})/?$\";s:54:\"index.php?ckan-local-org=$matches[1]&paged=$matches[2]\";s:50:\"ckan-local-org/([^/]+)/comment-page-([0-9]{1,})/?$\";s:54:\"index.php?ckan-local-org=$matches[1]&cpage=$matches[2]\";s:35:\"ckan-local-org/([^/]+)(/[0-9]+)?/?$\";s:53:\"index.php?ckan-local-org=$matches[1]&page=$matches[2]\";s:31:\"ckan-local-org/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:41:\"ckan-local-org/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:61:\"ckan-local-org/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:56:\"ckan-local-org/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:56:\"ckan-local-org/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:46:\"(de|en|it|fr)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?lang=$matches[1]&&feed=$matches[2]\";s:41:\"(de|en|it|fr)/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?lang=$matches[1]&&feed=$matches[2]\";s:34:\"(de|en|it|fr)/page/?([0-9]{1,})/?$\";s:45:\"index.php?lang=$matches[1]&&paged=$matches[2]\";s:16:\"(de|en|it|fr)/?$\";s:26:\"index.php?lang=$matches[1]\";s:55:\"(de|en|it|fr)/comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:59:\"index.php?lang=$matches[1]&&feed=$matches[2]&withcomments=1\";s:50:\"(de|en|it|fr)/comments/(feed|rdf|rss|rss2|atom)/?$\";s:59:\"index.php?lang=$matches[1]&&feed=$matches[2]&withcomments=1\";s:58:\"(de|en|it|fr)/search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:57:\"index.php?lang=$matches[1]&s=$matches[2]&feed=$matches[3]\";s:53:\"(de|en|it|fr)/search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:57:\"index.php?lang=$matches[1]&s=$matches[2]&feed=$matches[3]\";s:46:\"(de|en|it|fr)/search/(.+)/page/?([0-9]{1,})/?$\";s:58:\"index.php?lang=$matches[1]&s=$matches[2]&paged=$matches[3]\";s:28:\"(de|en|it|fr)/search/(.+)/?$\";s:40:\"index.php?lang=$matches[1]&s=$matches[2]\";s:61:\"(de|en|it|fr)/author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:67:\"index.php?lang=$matches[1]&author_name=$matches[2]&feed=$matches[3]\";s:56:\"(de|en|it|fr)/author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:67:\"index.php?lang=$matches[1]&author_name=$matches[2]&feed=$matches[3]\";s:49:\"(de|en|it|fr)/author/([^/]+)/page/?([0-9]{1,})/?$\";s:68:\"index.php?lang=$matches[1]&author_name=$matches[2]&paged=$matches[3]\";s:31:\"(de|en|it|fr)/author/([^/]+)/?$\";s:50:\"index.php?lang=$matches[1]&author_name=$matches[2]\";s:83:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&feed=$matches[5]\";s:78:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&feed=$matches[5]\";s:71:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:98:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&paged=$matches[5]\";s:53:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:80:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]\";s:70:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:81:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&feed=$matches[4]\";s:65:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:81:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&feed=$matches[4]\";s:58:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:82:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]&paged=$matches[4]\";s:40:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/?$\";s:64:\"index.php?lang=$matches[1]&year=$matches[2]&monthnum=$matches[3]\";s:57:\"(de|en|it|fr)/([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:60:\"index.php?lang=$matches[1]&year=$matches[2]&feed=$matches[3]\";s:52:\"(de|en|it|fr)/([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:60:\"index.php?lang=$matches[1]&year=$matches[2]&feed=$matches[3]\";s:45:\"(de|en|it|fr)/([0-9]{4})/page/?([0-9]{1,})/?$\";s:61:\"index.php?lang=$matches[1]&year=$matches[2]&paged=$matches[3]\";s:27:\"(de|en|it|fr)/([0-9]{4})/?$\";s:43:\"index.php?lang=$matches[1]&year=$matches[2]\";s:41:\"(de|en|it|fr)/.?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[2]\";s:51:\"(de|en|it|fr)/.?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[2]&tb=1\";s:71:\"(de|en|it|fr)/.?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:66:\"(de|en|it|fr)/.?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:66:\"(de|en|it|fr)/.?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[2]&cpage=$matches[3]\";s:34:\"(de|en|it|fr)/(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[2]&tb=1\";s:54:\"(de|en|it|fr)/(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[2]&feed=$matches[3]\";s:49:\"(de|en|it|fr)/(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[2]&feed=$matches[3]\";s:42:\"(de|en|it|fr)/(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[2]&paged=$matches[3]\";s:49:\"(de|en|it|fr)/(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[2]&cpage=$matches[3]\";s:34:\"(de|en|it|fr)/(.?.+?)(/[0-9]+)?/?$\";s:47:\"index.php?pagename=$matches[2]&page=$matches[3]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:20:\"(.?.+?)(/[0-9]+)?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:41:\"(de|en|it|fr)/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[2]\";s:51:\"(de|en|it|fr)/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[2]&tb=1\";s:71:\"(de|en|it|fr)/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:66:\"(de|en|it|fr)/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:66:\"(de|en|it|fr)/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[2]&cpage=$matches[3]\";s:34:\"(de|en|it|fr)/([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[2]&tb=1\";s:54:\"(de|en|it|fr)/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[2]&feed=$matches[3]\";s:49:\"(de|en|it|fr)/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[2]&feed=$matches[3]\";s:42:\"(de|en|it|fr)/([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[2]&paged=$matches[3]\";s:49:\"(de|en|it|fr)/([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[2]&cpage=$matches[3]\";s:34:\"(de|en|it|fr)/([^/]+)(/[0-9]+)?/?$\";s:43:\"index.php?name=$matches[2]&page=$matches[3]\";s:30:\"(de|en|it|fr)/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[2]\";s:40:\"(de|en|it|fr)/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[2]&tb=1\";s:60:\"(de|en|it|fr)/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:55:\"(de|en|it|fr)/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:55:\"(de|en|it|fr)/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[2]&cpage=$matches[3]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:20:\"([^/]+)(/[0-9]+)?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";}','yes');
INSERT INTO `ogdch_options` VALUES (533,'theme_mods_twentyfifteen','a:1:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1441014093;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}}','yes');
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
) ENGINE=InnoDB AUTO_INCREMENT=1472 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogdch_postmeta`
--

LOCK TABLES `ogdch_postmeta` WRITE;
/*!40000 ALTER TABLE `ogdch_postmeta` DISABLE KEYS */;
INSERT INTO `ogdch_postmeta` VALUES (431,2,'_edit_lock','1440508856:1');
INSERT INTO `ogdch_postmeta` VALUES (433,97,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (435,97,'_edit_lock','1433409272:1');
INSERT INTO `ogdch_postmeta` VALUES (464,2,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (533,118,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (536,118,'_edit_lock','1433409287:1');
INSERT INTO `ogdch_postmeta` VALUES (537,119,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (540,119,'_edit_lock','1433409303:1');
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
INSERT INTO `ogdch_postmeta` VALUES (657,2,'_wp_page_template','default');
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
INSERT INTO `ogdch_postmeta` VALUES (688,97,'_wp_page_template','default');
INSERT INTO `ogdch_postmeta` VALUES (689,118,'_wp_page_template','default');
INSERT INTO `ogdch_postmeta` VALUES (690,119,'_wp_page_template','default');
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
INSERT INTO `ogdch_postmeta` VALUES (753,168,'_menu_item_type','post_type');
INSERT INTO `ogdch_postmeta` VALUES (754,168,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (755,168,'_menu_item_object_id','164');
INSERT INTO `ogdch_postmeta` VALUES (756,168,'_menu_item_object','page');
INSERT INTO `ogdch_postmeta` VALUES (757,168,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (758,168,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (759,168,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (760,168,'_menu_item_url','');
INSERT INTO `ogdch_postmeta` VALUES (761,168,'_menu_item_orphaned','1440509288');
INSERT INTO `ogdch_postmeta` VALUES (780,171,'_menu_item_type','post_type');
INSERT INTO `ogdch_postmeta` VALUES (781,171,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (782,171,'_menu_item_object_id','2');
INSERT INTO `ogdch_postmeta` VALUES (783,171,'_menu_item_object','page');
INSERT INTO `ogdch_postmeta` VALUES (784,171,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (785,171,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (786,171,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (787,171,'_menu_item_url','');
INSERT INTO `ogdch_postmeta` VALUES (788,171,'_menu_item_orphaned','1440509288');
INSERT INTO `ogdch_postmeta` VALUES (789,172,'_menu_item_type','post_type');
INSERT INTO `ogdch_postmeta` VALUES (790,172,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (791,172,'_menu_item_object_id','164');
INSERT INTO `ogdch_postmeta` VALUES (792,172,'_menu_item_object','page');
INSERT INTO `ogdch_postmeta` VALUES (793,172,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (794,172,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (795,172,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (796,172,'_menu_item_url','');
INSERT INTO `ogdch_postmeta` VALUES (816,175,'_menu_item_type','post_type');
INSERT INTO `ogdch_postmeta` VALUES (817,175,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (818,175,'_menu_item_object_id','2');
INSERT INTO `ogdch_postmeta` VALUES (819,175,'_menu_item_object','page');
INSERT INTO `ogdch_postmeta` VALUES (820,175,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (821,175,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (822,175,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (823,175,'_menu_item_url','');
INSERT INTO `ogdch_postmeta` VALUES (825,176,'_menu_item_type','post_type');
INSERT INTO `ogdch_postmeta` VALUES (826,176,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (827,176,'_menu_item_object_id','164');
INSERT INTO `ogdch_postmeta` VALUES (828,176,'_menu_item_object','page');
INSERT INTO `ogdch_postmeta` VALUES (829,176,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (830,176,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (831,176,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (832,176,'_menu_item_url','');
INSERT INTO `ogdch_postmeta` VALUES (833,176,'_menu_item_orphaned','1440509352');
INSERT INTO `ogdch_postmeta` VALUES (852,179,'_menu_item_type','post_type');
INSERT INTO `ogdch_postmeta` VALUES (853,179,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (854,179,'_menu_item_object_id','2');
INSERT INTO `ogdch_postmeta` VALUES (855,179,'_menu_item_object','page');
INSERT INTO `ogdch_postmeta` VALUES (856,179,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (857,179,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (858,179,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (859,179,'_menu_item_url','');
INSERT INTO `ogdch_postmeta` VALUES (860,179,'_menu_item_orphaned','1440509352');
INSERT INTO `ogdch_postmeta` VALUES (861,180,'_menu_item_type','post_type');
INSERT INTO `ogdch_postmeta` VALUES (862,180,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (863,180,'_menu_item_object_id','165');
INSERT INTO `ogdch_postmeta` VALUES (864,180,'_menu_item_object','page');
INSERT INTO `ogdch_postmeta` VALUES (865,180,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (866,180,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (867,180,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (868,180,'_menu_item_url','');
INSERT INTO `ogdch_postmeta` VALUES (888,183,'_menu_item_type','post_type');
INSERT INTO `ogdch_postmeta` VALUES (889,183,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (890,183,'_menu_item_object_id','97');
INSERT INTO `ogdch_postmeta` VALUES (891,183,'_menu_item_object','page');
INSERT INTO `ogdch_postmeta` VALUES (892,183,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (893,183,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (894,183,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (895,183,'_menu_item_url','');
INSERT INTO `ogdch_postmeta` VALUES (897,184,'_menu_item_type','post_type');
INSERT INTO `ogdch_postmeta` VALUES (898,184,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (899,184,'_menu_item_object_id','166');
INSERT INTO `ogdch_postmeta` VALUES (900,184,'_menu_item_object','page');
INSERT INTO `ogdch_postmeta` VALUES (901,184,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (902,184,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (903,184,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (904,184,'_menu_item_url','');
INSERT INTO `ogdch_postmeta` VALUES (924,187,'_menu_item_type','post_type');
INSERT INTO `ogdch_postmeta` VALUES (925,187,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (926,187,'_menu_item_object_id','118');
INSERT INTO `ogdch_postmeta` VALUES (927,187,'_menu_item_object','page');
INSERT INTO `ogdch_postmeta` VALUES (928,187,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (929,187,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (930,187,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (931,187,'_menu_item_url','');
INSERT INTO `ogdch_postmeta` VALUES (933,188,'_menu_item_type','post_type');
INSERT INTO `ogdch_postmeta` VALUES (934,188,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (935,188,'_menu_item_object_id','167');
INSERT INTO `ogdch_postmeta` VALUES (936,188,'_menu_item_object','page');
INSERT INTO `ogdch_postmeta` VALUES (937,188,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (938,188,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (939,188,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (940,188,'_menu_item_url','');
INSERT INTO `ogdch_postmeta` VALUES (960,191,'_menu_item_type','post_type');
INSERT INTO `ogdch_postmeta` VALUES (961,191,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (962,191,'_menu_item_object_id','119');
INSERT INTO `ogdch_postmeta` VALUES (963,191,'_menu_item_object','page');
INSERT INTO `ogdch_postmeta` VALUES (964,191,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (965,191,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (966,191,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (967,191,'_menu_item_url','');
INSERT INTO `ogdch_postmeta` VALUES (969,192,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (970,192,'_edit_lock','1440510313:1');
INSERT INTO `ogdch_postmeta` VALUES (971,192,'_ckan_local_group_title_en','Population');
INSERT INTO `ogdch_postmeta` VALUES (972,192,'_ckan_local_group_title_de','Bevölkerung');
INSERT INTO `ogdch_postmeta` VALUES (973,192,'_ckan_local_group_title_fr','Population');
INSERT INTO `ogdch_postmeta` VALUES (974,192,'_ckan_local_group_title_it','Popolazione');
INSERT INTO `ogdch_postmeta` VALUES (975,192,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/Bevoelkerung');
INSERT INTO `ogdch_postmeta` VALUES (976,192,'_ckan_local_group_ckan_id','64d3b89b-ff79-477e-8fb4-9cfc388b0f58');
INSERT INTO `ogdch_postmeta` VALUES (977,192,'_ckan_local_group_ckan_name','bevoelkerung');
INSERT INTO `ogdch_postmeta` VALUES (978,193,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (979,193,'_edit_lock','1440510347:1');
INSERT INTO `ogdch_postmeta` VALUES (980,193,'_ckan_local_group_ckan_id','27b314a5-57b6-4c4e-9c9f-6923365eaecc');
INSERT INTO `ogdch_postmeta` VALUES (981,193,'_ckan_local_group_ckan_name','raum');
INSERT INTO `ogdch_postmeta` VALUES (982,193,'_ckan_local_group_title_en','Space');
INSERT INTO `ogdch_postmeta` VALUES (983,193,'_ckan_local_group_title_de','Raum');
INSERT INTO `ogdch_postmeta` VALUES (984,193,'_ckan_local_group_title_fr','Espace');
INSERT INTO `ogdch_postmeta` VALUES (985,193,'_ckan_local_group_title_it','Spazio');
INSERT INTO `ogdch_postmeta` VALUES (986,193,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/Raum');
INSERT INTO `ogdch_postmeta` VALUES (987,194,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (988,194,'_edit_lock','1440510383:1');
INSERT INTO `ogdch_postmeta` VALUES (989,194,'_ckan_local_org_ckan_id','73124d1e-c2aa-4d20-a42d-fa71b8946e93');
INSERT INTO `ogdch_postmeta` VALUES (990,194,'_ckan_local_org_ckan_name','swisstopo');
INSERT INTO `ogdch_postmeta` VALUES (991,194,'_ckan_local_org_title_en','Swisstopo EN');
INSERT INTO `ogdch_postmeta` VALUES (992,194,'_ckan_local_org_title_de','Swisstopo DE');
INSERT INTO `ogdch_postmeta` VALUES (993,194,'_ckan_local_org_title_fr','Swisstopo FR');
INSERT INTO `ogdch_postmeta` VALUES (994,194,'_ckan_local_org_title_it','Swisstopo IT');
INSERT INTO `ogdch_postmeta` VALUES (997,195,'_edit_lock','1440510673:1');
INSERT INTO `ogdch_postmeta` VALUES (998,195,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (999,195,'_app-showcase-app_url','http://topoapp.io');
INSERT INTO `ogdch_postmeta` VALUES (1000,195,'_app-showcase-app_author_name','Swisstopo');
INSERT INTO `ogdch_postmeta` VALUES (1001,195,'_app-showcase-app_author_email','swiss@to.po');
INSERT INTO `ogdch_postmeta` VALUES (1002,195,'_app-showcase-app_version','1.0.0');
INSERT INTO `ogdch_postmeta` VALUES (1003,196,'_edit_lock','1440510703:1');
INSERT INTO `ogdch_postmeta` VALUES (1004,196,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1005,196,'_app-showcase-app_url','http://topoapp.io');
INSERT INTO `ogdch_postmeta` VALUES (1006,196,'_app-showcase-app_author_name','Swisstopo');
INSERT INTO `ogdch_postmeta` VALUES (1007,196,'_app-showcase-app_author_email','swiss@to.po');
INSERT INTO `ogdch_postmeta` VALUES (1008,196,'_app-showcase-app_version','1.0.0');
INSERT INTO `ogdch_postmeta` VALUES (1009,197,'_edit_lock','1440510728:1');
INSERT INTO `ogdch_postmeta` VALUES (1010,197,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1011,197,'_app-showcase-app_url','http://topoapp.io');
INSERT INTO `ogdch_postmeta` VALUES (1012,197,'_app-showcase-app_author_name','Swisstopo');
INSERT INTO `ogdch_postmeta` VALUES (1013,197,'_app-showcase-app_author_email','swiss@to.po');
INSERT INTO `ogdch_postmeta` VALUES (1014,197,'_app-showcase-app_version','1.0.0');
INSERT INTO `ogdch_postmeta` VALUES (1015,198,'_edit_lock','1440510758:1');
INSERT INTO `ogdch_postmeta` VALUES (1016,198,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1017,198,'_app-showcase-app_url','http://topoapp.io');
INSERT INTO `ogdch_postmeta` VALUES (1018,198,'_app-showcase-app_author_name','Swisstopo');
INSERT INTO `ogdch_postmeta` VALUES (1019,198,'_app-showcase-app_author_email','swiss@to.po');
INSERT INTO `ogdch_postmeta` VALUES (1020,198,'_app-showcase-app_version','1.0.0');
INSERT INTO `ogdch_postmeta` VALUES (1021,199,'_edit_lock','1440511069:1');
INSERT INTO `ogdch_postmeta` VALUES (1022,199,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1023,199,'_ckan_local_group_ckan_id','33ab70dd-e2da-464a-ae5f-b166f16d9e2c');
INSERT INTO `ogdch_postmeta` VALUES (1024,199,'_ckan_local_group_ckan_name','arbeit');
INSERT INTO `ogdch_postmeta` VALUES (1025,199,'_ckan_local_group_title_en','Work and income');
INSERT INTO `ogdch_postmeta` VALUES (1026,199,'_ckan_local_group_title_de','Arbeit, Erwerb');
INSERT INTO `ogdch_postmeta` VALUES (1027,199,'_ckan_local_group_title_fr','Travail, rémunération');
INSERT INTO `ogdch_postmeta` VALUES (1028,199,'_ckan_local_group_title_it','Lavoro e reddito');
INSERT INTO `ogdch_postmeta` VALUES (1029,199,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/Arbeit');
INSERT INTO `ogdch_postmeta` VALUES (1030,200,'_edit_lock','1440510956:1');
INSERT INTO `ogdch_postmeta` VALUES (1031,200,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1032,200,'_ckan_local_group_ckan_id','7d52132f-7119-41ab-b2b8-e62d69a834ce');
INSERT INTO `ogdch_postmeta` VALUES (1033,200,'_ckan_local_group_ckan_name','bauwesen');
INSERT INTO `ogdch_postmeta` VALUES (1034,200,'_ckan_local_group_title_de','Bau- und Wohnungswesen');
INSERT INTO `ogdch_postmeta` VALUES (1035,200,'_ckan_local_group_title_fr','Construction, logement');
INSERT INTO `ogdch_postmeta` VALUES (1036,200,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/Bauwesen');
INSERT INTO `ogdch_postmeta` VALUES (1037,201,'_edit_lock','1440510988:1');
INSERT INTO `ogdch_postmeta` VALUES (1038,201,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1039,201,'_ckan_local_group_ckan_id','afcb4a2a-b4b0-4d7c-984a-9078e964be49');
INSERT INTO `ogdch_postmeta` VALUES (1040,201,'_ckan_local_group_ckan_name','bildung');
INSERT INTO `ogdch_postmeta` VALUES (1041,201,'_ckan_local_group_title_en','Education and science');
INSERT INTO `ogdch_postmeta` VALUES (1042,201,'_ckan_local_group_title_de','Bildung, Wissenschaft');
INSERT INTO `ogdch_postmeta` VALUES (1043,201,'_ckan_local_group_title_fr','Education, science');
INSERT INTO `ogdch_postmeta` VALUES (1044,201,'_ckan_local_group_title_it','Formazione e scienza');
INSERT INTO `ogdch_postmeta` VALUES (1045,201,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/Bildung');
INSERT INTO `ogdch_postmeta` VALUES (1046,202,'_edit_lock','1440511030:1');
INSERT INTO `ogdch_postmeta` VALUES (1047,202,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1048,202,'_ckan_local_group_ckan_id','42f56f74-074e-4cbb-b91b-deeb1fd58c56');
INSERT INTO `ogdch_postmeta` VALUES (1049,202,'_ckan_local_group_ckan_name','energie');
INSERT INTO `ogdch_postmeta` VALUES (1050,202,'_ckan_local_group_title_en','Energy');
INSERT INTO `ogdch_postmeta` VALUES (1051,202,'_ckan_local_group_title_de','Energie');
INSERT INTO `ogdch_postmeta` VALUES (1052,202,'_ckan_local_group_title_fr','Energie');
INSERT INTO `ogdch_postmeta` VALUES (1053,202,'_ckan_local_group_title_it','Energia');
INSERT INTO `ogdch_postmeta` VALUES (1054,202,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/Energie');
INSERT INTO `ogdch_postmeta` VALUES (1055,203,'_edit_lock','1440511197:1');
INSERT INTO `ogdch_postmeta` VALUES (1056,203,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1057,203,'_ckan_local_group_ckan_id','79cbe120-e9c6-4249-b934-58ca980606d7');
INSERT INTO `ogdch_postmeta` VALUES (1058,203,'_ckan_local_group_ckan_name','finanzen');
INSERT INTO `ogdch_postmeta` VALUES (1059,203,'_ckan_local_group_title_en','Finances');
INSERT INTO `ogdch_postmeta` VALUES (1060,203,'_ckan_local_group_title_de','Finanzen');
INSERT INTO `ogdch_postmeta` VALUES (1061,203,'_ckan_local_group_title_fr','Finances');
INSERT INTO `ogdch_postmeta` VALUES (1062,203,'_ckan_local_group_title_it','Finanze');
INSERT INTO `ogdch_postmeta` VALUES (1063,203,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/Finanzen');
INSERT INTO `ogdch_postmeta` VALUES (1064,204,'_edit_lock','1440511082:1');
INSERT INTO `ogdch_postmeta` VALUES (1065,204,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1066,204,'_ckan_local_group_ckan_id','a20e9d52-0d20-413c-a8ad-9ffd4523bec6');
INSERT INTO `ogdch_postmeta` VALUES (1067,204,'_ckan_local_group_ckan_name','geographie');
INSERT INTO `ogdch_postmeta` VALUES (1068,204,'_ckan_local_group_title_de','Geographie');
INSERT INTO `ogdch_postmeta` VALUES (1069,204,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/Geographie');
INSERT INTO `ogdch_postmeta` VALUES (1070,205,'_edit_lock','1440511110:1');
INSERT INTO `ogdch_postmeta` VALUES (1071,205,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1072,205,'_ckan_local_group_ckan_id','28641aa8-b97d-49ed-85bf-c19eb0f729d3');
INSERT INTO `ogdch_postmeta` VALUES (1073,205,'_ckan_local_group_ckan_name','gesetzgebung');
INSERT INTO `ogdch_postmeta` VALUES (1074,205,'_ckan_local_group_title_en','Legislation');
INSERT INTO `ogdch_postmeta` VALUES (1075,205,'_ckan_local_group_title_de','Gesetzgebung');
INSERT INTO `ogdch_postmeta` VALUES (1076,205,'_ckan_local_group_title_fr','Legislation');
INSERT INTO `ogdch_postmeta` VALUES (1077,205,'_ckan_local_group_title_it','Legislazione');
INSERT INTO `ogdch_postmeta` VALUES (1078,205,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/Gesetzgebung');
INSERT INTO `ogdch_postmeta` VALUES (1079,206,'_edit_lock','1440511281:1');
INSERT INTO `ogdch_postmeta` VALUES (1080,206,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1081,206,'_ckan_local_group_ckan_id','90848388-d0b6-4b97-a686-e93b40832e1e');
INSERT INTO `ogdch_postmeta` VALUES (1082,206,'_ckan_local_group_ckan_name','gesundheit');
INSERT INTO `ogdch_postmeta` VALUES (1083,206,'_ckan_local_group_title_en','Health');
INSERT INTO `ogdch_postmeta` VALUES (1084,206,'_ckan_local_group_title_de','Gesundheit');
INSERT INTO `ogdch_postmeta` VALUES (1085,206,'_ckan_local_group_title_fr','Santé');
INSERT INTO `ogdch_postmeta` VALUES (1086,206,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/Gesundheit');
INSERT INTO `ogdch_postmeta` VALUES (1087,207,'_edit_lock','1440511166:1');
INSERT INTO `ogdch_postmeta` VALUES (1088,207,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1089,207,'_ckan_local_group_ckan_id','dc8b567c-fed8-4696-847b-f85510f93d71');
INSERT INTO `ogdch_postmeta` VALUES (1090,207,'_ckan_local_group_ckan_name','handel');
INSERT INTO `ogdch_postmeta` VALUES (1091,207,'_ckan_local_group_title_de','Handel');
INSERT INTO `ogdch_postmeta` VALUES (1092,207,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/Handel');
INSERT INTO `ogdch_postmeta` VALUES (1093,208,'_edit_lock','1440511209:1');
INSERT INTO `ogdch_postmeta` VALUES (1094,208,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1095,208,'_ckan_local_group_ckan_id','168c842c-fd1f-4180-91ce-1aecaac8f282');
INSERT INTO `ogdch_postmeta` VALUES (1096,208,'_ckan_local_group_ckan_name','industrie');
INSERT INTO `ogdch_postmeta` VALUES (1097,208,'_ckan_local_group_title_en','Industry and services');
INSERT INTO `ogdch_postmeta` VALUES (1098,208,'_ckan_local_group_title_de','Industrie, Dienstleistungen');
INSERT INTO `ogdch_postmeta` VALUES (1099,208,'_ckan_local_group_title_fr','Industrie, services');
INSERT INTO `ogdch_postmeta` VALUES (1100,208,'_ckan_local_group_title_it','Industria, servizi');
INSERT INTO `ogdch_postmeta` VALUES (1101,208,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/Industrie');
INSERT INTO `ogdch_postmeta` VALUES (1102,209,'_edit_lock','1440511263:1');
INSERT INTO `ogdch_postmeta` VALUES (1103,209,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1104,209,'_ckan_local_group_ckan_id','2cd03703-e1e3-4031-bd3c-4d0e82d3d7c1');
INSERT INTO `ogdch_postmeta` VALUES (1105,209,'_ckan_local_group_ckan_name','kriminalitaet');
INSERT INTO `ogdch_postmeta` VALUES (1106,209,'_ckan_local_group_title_en','Crime, criminal justice');
INSERT INTO `ogdch_postmeta` VALUES (1107,209,'_ckan_local_group_title_de','Kriminalität, Strafrecht');
INSERT INTO `ogdch_postmeta` VALUES (1108,209,'_ckan_local_group_title_fr','Criminalité, droit pénal');
INSERT INTO `ogdch_postmeta` VALUES (1109,209,'_ckan_local_group_title_it','Criminalità, diritto penale');
INSERT INTO `ogdch_postmeta` VALUES (1110,209,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/Kriminalitaet');
INSERT INTO `ogdch_postmeta` VALUES (1111,210,'_edit_lock','1440511301:1');
INSERT INTO `ogdch_postmeta` VALUES (1112,210,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1113,210,'_ckan_local_group_ckan_id','0d77b36f-1de6-40b3-9915-be91ee469f63');
INSERT INTO `ogdch_postmeta` VALUES (1114,210,'_ckan_local_group_ckan_name','kultur');
INSERT INTO `ogdch_postmeta` VALUES (1115,210,'_ckan_local_group_title_de','Kultur, Medien, Informationsgesellschaft, Sport');
INSERT INTO `ogdch_postmeta` VALUES (1116,210,'_ckan_local_group_title_fr','Culture, médias, société de l\'information, sport');
INSERT INTO `ogdch_postmeta` VALUES (1117,210,'_ckan_local_group_title_it','Cultura, media, società dell\'informazione, sport');
INSERT INTO `ogdch_postmeta` VALUES (1118,210,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/Kultur');
INSERT INTO `ogdch_postmeta` VALUES (1119,211,'_edit_lock','1440511674:1');
INSERT INTO `ogdch_postmeta` VALUES (1120,211,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1121,211,'_ckan_local_group_ckan_id','c7521678-de76-4731-9075-25d1d6150ecf');
INSERT INTO `ogdch_postmeta` VALUES (1122,211,'_ckan_local_group_ckan_name','landwirtschaft');
INSERT INTO `ogdch_postmeta` VALUES (1123,211,'_ckan_local_group_title_en','Agriculture, forestry');
INSERT INTO `ogdch_postmeta` VALUES (1124,211,'_ckan_local_group_title_de','Land- und Forstwirtschaft');
INSERT INTO `ogdch_postmeta` VALUES (1125,211,'_ckan_local_group_title_fr','Agriculture, sylviculture');
INSERT INTO `ogdch_postmeta` VALUES (1126,211,'_ckan_local_group_title_it','Agricoltura, selvicoltura');
INSERT INTO `ogdch_postmeta` VALUES (1127,211,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/Landwirtschaft');
INSERT INTO `ogdch_postmeta` VALUES (1128,212,'_edit_lock','1440511705:1');
INSERT INTO `ogdch_postmeta` VALUES (1129,212,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1130,212,'_ckan_local_group_ckan_id','8c2a33d5-475d-48dd-87b6-7ce5eb2033fa');
INSERT INTO `ogdch_postmeta` VALUES (1131,212,'_ckan_local_group_ckan_name','mobilitaet');
INSERT INTO `ogdch_postmeta` VALUES (1132,212,'_ckan_local_group_title_en','Mobility and Transport');
INSERT INTO `ogdch_postmeta` VALUES (1133,212,'_ckan_local_group_title_de','Mobilität und Verkehr');
INSERT INTO `ogdch_postmeta` VALUES (1134,212,'_ckan_local_group_title_fr','Mobilité et transports');
INSERT INTO `ogdch_postmeta` VALUES (1135,212,'_ckan_local_group_title_it','Mobilità e trasporti');
INSERT INTO `ogdch_postmeta` VALUES (1136,212,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/Mobilitaet');
INSERT INTO `ogdch_postmeta` VALUES (1137,213,'_edit_lock','1440511846:1');
INSERT INTO `ogdch_postmeta` VALUES (1138,213,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1139,213,'_ckan_local_group_title_de','Öffentliche Ordnung und Sicherheit');
INSERT INTO `ogdch_postmeta` VALUES (1140,213,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/Sicherheit');
INSERT INTO `ogdch_postmeta` VALUES (1141,213,'_ckan_local_group_ckan_id','620fdda8-a92d-421b-89ad-4ef1b57a9458');
INSERT INTO `ogdch_postmeta` VALUES (1142,213,'_ckan_local_group_ckan_name','sicherheit');
INSERT INTO `ogdch_postmeta` VALUES (1143,214,'_edit_lock','1440511870:1');
INSERT INTO `ogdch_postmeta` VALUES (1144,214,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1145,214,'_ckan_local_group_ckan_id','9beba14c-eab8-426e-89ae-757bc2e6445e');
INSERT INTO `ogdch_postmeta` VALUES (1146,214,'_ckan_local_group_ckan_name','politik');
INSERT INTO `ogdch_postmeta` VALUES (1147,214,'_ckan_local_group_title_de','Politik');
INSERT INTO `ogdch_postmeta` VALUES (1148,214,'_ckan_local_group_title_fr','Politique');
INSERT INTO `ogdch_postmeta` VALUES (1149,214,'_ckan_local_group_title_it','Politica');
INSERT INTO `ogdch_postmeta` VALUES (1150,214,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/Politik');
INSERT INTO `ogdch_postmeta` VALUES (1151,216,'_edit_lock','1440511897:1');
INSERT INTO `ogdch_postmeta` VALUES (1152,216,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1153,216,'_ckan_local_group_ckan_id','1deb7a82-612f-46ce-9c62-89c7c0b38ddf');
INSERT INTO `ogdch_postmeta` VALUES (1154,216,'_ckan_local_group_ckan_name','preise');
INSERT INTO `ogdch_postmeta` VALUES (1155,216,'_ckan_local_group_title_en','Prices');
INSERT INTO `ogdch_postmeta` VALUES (1156,216,'_ckan_local_group_title_de','Preise');
INSERT INTO `ogdch_postmeta` VALUES (1157,216,'_ckan_local_group_title_fr','Prix');
INSERT INTO `ogdch_postmeta` VALUES (1158,216,'_ckan_local_group_title_it','Prezzi');
INSERT INTO `ogdch_postmeta` VALUES (1159,216,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/Preise');
INSERT INTO `ogdch_postmeta` VALUES (1160,217,'_edit_lock','1440511933:1');
INSERT INTO `ogdch_postmeta` VALUES (1161,217,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1162,217,'_ckan_local_group_ckan_id','011e8933-7b86-412c-8fe6-752060d8e103');
INSERT INTO `ogdch_postmeta` VALUES (1163,217,'_ckan_local_group_ckan_name','soziale-sicherheit');
INSERT INTO `ogdch_postmeta` VALUES (1164,217,'_ckan_local_group_title_en','Social security');
INSERT INTO `ogdch_postmeta` VALUES (1165,217,'_ckan_local_group_title_de','Soziale Sicherheit');
INSERT INTO `ogdch_postmeta` VALUES (1166,217,'_ckan_local_group_title_fr','Protection sociale');
INSERT INTO `ogdch_postmeta` VALUES (1167,217,'_ckan_local_group_title_it','Sicurezza sociale');
INSERT INTO `ogdch_postmeta` VALUES (1168,217,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/Soziale-Sicherheit');
INSERT INTO `ogdch_postmeta` VALUES (1169,218,'_edit_lock','1440511966:1');
INSERT INTO `ogdch_postmeta` VALUES (1170,218,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1171,218,'_ckan_local_group_ckan_id','e5d8e87e-aa10-42f3-a7c2-1f45ee5707c2');
INSERT INTO `ogdch_postmeta` VALUES (1172,218,'_ckan_local_group_ckan_name','statistische-grundlagen');
INSERT INTO `ogdch_postmeta` VALUES (1173,218,'_ckan_local_group_title_en','Statistical basis');
INSERT INTO `ogdch_postmeta` VALUES (1174,218,'_ckan_local_group_title_de','Statistische Grundlagen');
INSERT INTO `ogdch_postmeta` VALUES (1175,218,'_ckan_local_group_title_fr','Bases statistiques');
INSERT INTO `ogdch_postmeta` VALUES (1176,218,'_ckan_local_group_title_it','Basi statistiche');
INSERT INTO `ogdch_postmeta` VALUES (1177,218,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/Statistische-Grundlagen');
INSERT INTO `ogdch_postmeta` VALUES (1178,219,'_edit_lock','1440511991:1');
INSERT INTO `ogdch_postmeta` VALUES (1179,219,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1180,219,'_ckan_local_group_ckan_id','6aace7ef-f167-40c9-a0d7-87e7e2681c07');
INSERT INTO `ogdch_postmeta` VALUES (1181,219,'_ckan_local_group_ckan_name','tourismus');
INSERT INTO `ogdch_postmeta` VALUES (1182,219,'_ckan_local_group_title_en','Tourism');
INSERT INTO `ogdch_postmeta` VALUES (1183,219,'_ckan_local_group_title_de','Tourismus');
INSERT INTO `ogdch_postmeta` VALUES (1184,219,'_ckan_local_group_title_fr','Tourisme');
INSERT INTO `ogdch_postmeta` VALUES (1185,219,'_ckan_local_group_title_it','Turismo');
INSERT INTO `ogdch_postmeta` VALUES (1186,219,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/Tourismus');
INSERT INTO `ogdch_postmeta` VALUES (1187,220,'_edit_lock','1440512019:1');
INSERT INTO `ogdch_postmeta` VALUES (1188,220,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1189,220,'_ckan_local_group_ckan_id','afc7c340-9bdb-4767-bbcb-70094a1d0dcc');
INSERT INTO `ogdch_postmeta` VALUES (1190,220,'_ckan_local_group_ckan_name','verwaltung');
INSERT INTO `ogdch_postmeta` VALUES (1191,220,'_ckan_local_group_title_en','Administration');
INSERT INTO `ogdch_postmeta` VALUES (1192,220,'_ckan_local_group_title_de','Verwaltung');
INSERT INTO `ogdch_postmeta` VALUES (1193,220,'_ckan_local_group_title_fr','Administration');
INSERT INTO `ogdch_postmeta` VALUES (1194,220,'_ckan_local_group_title_it','Amministrazione');
INSERT INTO `ogdch_postmeta` VALUES (1195,220,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/Verwaltung');
INSERT INTO `ogdch_postmeta` VALUES (1196,221,'_edit_lock','1440512044:1');
INSERT INTO `ogdch_postmeta` VALUES (1197,221,'_edit_last','1');
INSERT INTO `ogdch_postmeta` VALUES (1198,221,'_ckan_local_group_ckan_id','5389c3f2-2f64-436b-9fac-2d1fc342f7b5');
INSERT INTO `ogdch_postmeta` VALUES (1199,221,'_ckan_local_group_ckan_name','volkswirtschaft');
INSERT INTO `ogdch_postmeta` VALUES (1200,221,'_ckan_local_group_title_en','National economy');
INSERT INTO `ogdch_postmeta` VALUES (1201,221,'_ckan_local_group_title_de','Volkswirtschaft');
INSERT INTO `ogdch_postmeta` VALUES (1202,221,'_ckan_local_group_title_fr','Economie nationale');
INSERT INTO `ogdch_postmeta` VALUES (1203,221,'_ckan_local_group_title_it','Economia');
INSERT INTO `ogdch_postmeta` VALUES (1204,221,'_ckan_local_group_rdf_uri','http://opendata.swiss/themes/Volkswirtschaft');
INSERT INTO `ogdch_postmeta` VALUES (1205,222,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (1206,222,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1207,222,'_menu_item_object_id','222');
INSERT INTO `ogdch_postmeta` VALUES (1208,222,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (1209,222,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1210,222,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1211,222,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1212,222,'_menu_item_url','http://app');
INSERT INTO `ogdch_postmeta` VALUES (1213,222,'_menu_item_orphaned','1440512672');
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
INSERT INTO `ogdch_postmeta` VALUES (1299,234,'_menu_item_url','/de/group');
INSERT INTO `ogdch_postmeta` VALUES (1301,235,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (1302,235,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1303,235,'_menu_item_object_id','235');
INSERT INTO `ogdch_postmeta` VALUES (1304,235,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (1305,235,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1306,235,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1307,235,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1308,235,'_menu_item_url','/de/app/');
INSERT INTO `ogdch_postmeta` VALUES (1309,235,'_menu_item_orphaned','1440518432');
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
INSERT INTO `ogdch_postmeta` VALUES (1335,238,'_menu_item_url','/en/group');
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
INSERT INTO `ogdch_postmeta` VALUES (1362,241,'_menu_item_url','/fr/group');
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
INSERT INTO `ogdch_postmeta` VALUES (1389,244,'_menu_item_url','/it/group');
INSERT INTO `ogdch_postmeta` VALUES (1391,245,'_menu_item_type','custom');
INSERT INTO `ogdch_postmeta` VALUES (1392,245,'_menu_item_menu_item_parent','0');
INSERT INTO `ogdch_postmeta` VALUES (1393,245,'_menu_item_object_id','245');
INSERT INTO `ogdch_postmeta` VALUES (1394,245,'_menu_item_object','custom');
INSERT INTO `ogdch_postmeta` VALUES (1395,245,'_menu_item_target','');
INSERT INTO `ogdch_postmeta` VALUES (1396,245,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `ogdch_postmeta` VALUES (1397,245,'_menu_item_xfn','');
INSERT INTO `ogdch_postmeta` VALUES (1398,245,'_menu_item_url','/it/app/');
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
  `post_title` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogdch_posts`
--

LOCK TABLES `ogdch_posts` WRITE;
/*!40000 ALTER TABLE `ogdch_posts` DISABLE KEYS */;
INSERT INTO `ogdch_posts` VALUES (2,1,'2015-06-03 06:50:11','2015-05-21 13:32:37','This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\r\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my blog. I live in Los Angeles, have a great dog named Jack, and I like piña coladas. (And gettin\' caught in the rain.)</blockquote>\r\n...or something like this:\r\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\r\nAs a new WordPress user, you should go to <a href=\"http://ogdch.dev/cms/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!','Sample Page German','','publish','open','open','','sample-page','','','2015-08-25 13:23:17','2015-08-25 13:23:17','',0,'http://ogdch.dev/?page_id=2',0,'page','',0);
INSERT INTO `ogdch_posts` VALUES (17,1,'2015-05-26 12:29:35','2015-05-26 12:29:35','a:1:{i:0;a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}}','polylang_mo_2','','publish','open','open','','polylang_mo_2','','','2015-05-26 12:29:35','2015-05-26 12:29:35','',0,'http://ogdch.dev/?post_type=polylang_mo&p=17',0,'polylang_mo','',0);
INSERT INTO `ogdch_posts` VALUES (18,1,'2015-05-26 12:29:45','2015-05-26 12:29:45','a:1:{i:0;a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}}','polylang_mo_5','','publish','open','open','','polylang_mo_5','','','2015-05-26 12:29:45','2015-05-26 12:29:45','',0,'http://ogdch.dev/?post_type=polylang_mo&p=18',0,'polylang_mo','',0);
INSERT INTO `ogdch_posts` VALUES (19,1,'2015-05-26 12:29:50','2015-05-26 12:29:50','a:1:{i:0;a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}}','polylang_mo_9','','publish','open','open','','polylang_mo_9','','','2015-05-26 12:29:50','2015-05-26 12:29:50','',0,'http://ogdch.dev/?post_type=polylang_mo&p=19',0,'polylang_mo','',0);
INSERT INTO `ogdch_posts` VALUES (20,1,'2015-05-26 12:29:54','2015-05-26 12:29:54','a:1:{i:0;a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}}','polylang_mo_13','','publish','open','open','','polylang_mo_13','','','2015-05-26 12:29:54','2015-05-26 12:29:54','',0,'http://ogdch.dev/?post_type=polylang_mo&p=20',0,'polylang_mo','',0);
INSERT INTO `ogdch_posts` VALUES (97,1,'2015-06-03 06:50:11','2015-06-02 13:01:41','YEAH USA','Sample Site English','','publish','open','open','','sample-site-english','','','2015-06-04 09:16:55','2015-06-04 09:16:55','',0,'http://ogdch.dev/?page_id=97',0,'page','',0);
INSERT INTO `ogdch_posts` VALUES (98,1,'2015-06-02 13:01:41','2015-06-02 13:01:41','YEAH USA','Sample US','','inherit','open','open','','97-revision-v1','','','2015-06-02 13:01:41','2015-06-02 13:01:41','',97,'http://ogdch.dev/2015/06/02/97-revision-v1/',0,'revision','',0);
INSERT INTO `ogdch_posts` VALUES (102,1,'2015-06-02 13:05:39','2015-06-02 13:05:39','This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\r\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my blog. I live in Los Angeles, have a great dog named Jack, and I like piña coladas. (And gettin\' caught in the rain.)</blockquote>\r\n...or something like this:\r\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\r\nAs a new WordPress user, you should go to <a href=\"http://ogdch.dev/cms/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!','Eine Seite','','inherit','open','open','','2-revision-v1','','','2015-06-02 13:05:39','2015-06-02 13:05:39','',2,'http://ogdch.dev/2015/06/02/2-revision-v1/',0,'revision','',0);
INSERT INTO `ogdch_posts` VALUES (118,1,'2015-06-03 06:50:11','2015-06-03 06:50:03','','Sample Site Italian','','publish','open','open','','sample-site-italian','','','2015-06-04 09:17:10','2015-06-04 09:17:10','',0,'http://ogdch.dev/?page_id=118',0,'page','',0);
INSERT INTO `ogdch_posts` VALUES (119,1,'2015-06-03 06:50:11','2015-06-03 06:50:11','','Sample Site French','','publish','open','open','','sample-site-french','','','2015-06-04 09:17:26','2015-06-04 09:17:26','',0,'http://ogdch.dev/?page_id=119',0,'page','',0);
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
INSERT INTO `ogdch_posts` VALUES (168,1,'2015-08-25 13:28:08','0000-00-00 00:00:00',' ','','','draft','open','open','','','','','2015-08-25 13:28:08','0000-00-00 00:00:00','',0,'http://ogdch.dev/?p=168',1,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (171,1,'2015-08-25 13:28:08','0000-00-00 00:00:00',' ','','','draft','open','open','','','','','2015-08-25 13:28:08','0000-00-00 00:00:00','',0,'http://ogdch.dev/?p=171',1,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (172,1,'2015-08-25 13:28:47','2015-08-25 13:28:47',' ','','','publish','open','open','','172','','','2015-08-25 16:00:54','2015-08-25 16:00:54','',0,'http://ogdch.dev/?p=172',4,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (175,1,'2015-08-25 13:28:47','2015-08-25 13:28:47',' ','','','publish','open','open','','175','','','2015-08-25 16:00:54','2015-08-25 16:00:54','',0,'http://ogdch.dev/?p=175',5,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (176,1,'2015-08-25 13:29:12','0000-00-00 00:00:00',' ','','','draft','open','open','','','','','2015-08-25 13:29:12','0000-00-00 00:00:00','',0,'http://ogdch.dev/?p=176',1,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (179,1,'2015-08-25 13:29:12','0000-00-00 00:00:00',' ','','','draft','open','open','','','','','2015-08-25 13:29:12','0000-00-00 00:00:00','',0,'http://ogdch.dev/?p=179',1,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (180,1,'2015-08-25 13:29:40','2015-08-25 13:29:40',' ','','','publish','open','open','','180','','','2015-08-25 16:02:13','2015-08-25 16:02:13','',0,'http://ogdch.dev/?p=180',4,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (183,1,'2015-08-25 13:29:40','2015-08-25 13:29:40',' ','','','publish','open','open','','183','','','2015-08-25 16:02:13','2015-08-25 16:02:13','',0,'http://ogdch.dev/?p=183',5,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (184,1,'2015-08-25 13:30:05','2015-08-25 13:30:05',' ','','','publish','open','open','','184','','','2015-08-25 16:04:07','2015-08-25 16:04:07','',0,'http://ogdch.dev/?p=184',4,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (187,1,'2015-08-25 13:30:05','2015-08-25 13:30:05',' ','','','publish','open','open','','187','','','2015-08-25 16:04:07','2015-08-25 16:04:07','',0,'http://ogdch.dev/?p=187',5,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (188,1,'2015-08-25 13:30:42','2015-08-25 13:30:42',' ','','','publish','open','open','','188','','','2015-08-25 16:03:13','2015-08-25 16:03:13','',0,'http://ogdch.dev/?p=188',4,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (191,1,'2015-08-25 13:30:42','2015-08-25 13:30:42',' ','','','publish','open','open','','191','','','2015-08-25 16:03:13','2015-08-25 16:03:13','',0,'http://ogdch.dev/?p=191',5,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (192,1,'2015-08-25 13:46:47','2015-08-25 13:46:47','','Bevoelkerung','','publish','closed','closed','','bevoelkerung','','','2015-08-25 13:47:22','2015-08-25 13:47:22','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=192',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (193,1,'2015-08-25 13:48:07','2015-08-25 13:48:07','','Raum','','publish','closed','closed','','raum','','','2015-08-25 13:48:07','2015-08-25 13:48:07','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=193',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (194,1,'2015-08-25 13:48:42','2015-08-25 13:48:42','','Swisstopo','','publish','closed','closed','','swisstopo','','','2015-08-25 13:48:42','2015-08-25 13:48:42','',0,'http://ogdch.dev/?post_type=ckan-local-org&#038;p=194',0,'ckan-local-org','',0);
INSERT INTO `ogdch_posts` VALUES (195,1,'2015-08-25 13:54:54','2015-08-25 13:53:35','Beschreibung DE','TopoApp','','publish','closed','closed','','topoapp','','','2015-08-25 13:53:35','2015-08-25 13:53:35','',0,'http://ogdch.dev/?post_type=app&#038;p=195',0,'app','',0);
INSERT INTO `ogdch_posts` VALUES (196,1,'2015-08-25 13:54:54','2015-08-25 13:54:05','Description EN','TopoApp','','publish','closed','closed','','topoapp','','','2015-08-25 13:54:05','2015-08-25 13:54:05','',0,'http://ogdch.dev/?post_type=app&#038;p=196',0,'app','',0);
INSERT INTO `ogdch_posts` VALUES (197,1,'2015-08-25 13:54:54','2015-08-25 13:54:31','Description IT','TopoApp','','publish','closed','closed','','topoapp','','','2015-08-25 13:54:31','2015-08-25 13:54:31','',0,'http://ogdch.dev/?post_type=app&#038;p=197',0,'app','',0);
INSERT INTO `ogdch_posts` VALUES (198,1,'2015-08-25 13:54:54','2015-08-25 13:54:54','Description FR','TopoApp','','publish','closed','closed','','topoapp','','','2015-08-25 13:54:54','2015-08-25 13:54:54','',0,'http://ogdch.dev/?post_type=app&#038;p=198',0,'app','',0);
INSERT INTO `ogdch_posts` VALUES (199,1,'2015-08-25 13:57:39','2015-08-25 13:57:39','','Arbeit','','publish','closed','closed','','arbeit','','','2015-08-25 13:57:39','2015-08-25 13:57:39','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=199',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (200,1,'2015-08-25 13:58:13','2015-08-25 13:58:13','','Bauwesen','','publish','closed','closed','','bauwesen','','','2015-08-25 13:58:13','2015-08-25 13:58:13','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=200',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (201,1,'2015-08-25 13:58:47','2015-08-25 13:58:47','','Bildung','','publish','closed','closed','','bildung','','','2015-08-25 13:58:47','2015-08-25 13:58:47','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=201',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (202,1,'2015-08-25 13:59:26','2015-08-25 13:59:26','','Energie','','publish','closed','closed','','energie','','','2015-08-25 13:59:26','2015-08-25 13:59:26','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=202',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (203,1,'2015-08-25 13:59:54','2015-08-25 13:59:54','','Finanzen','','publish','closed','closed','','finanzen','','','2015-08-25 13:59:54','2015-08-25 13:59:54','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=203',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (204,1,'2015-08-25 14:00:19','2015-08-25 14:00:19','','Geographie','','publish','closed','closed','','geographie','','','2015-08-25 14:00:19','2015-08-25 14:00:19','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=204',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (205,1,'2015-08-25 14:00:47','2015-08-25 14:00:47','','Gesetzgebung','','publish','closed','closed','','gesetzgebung','','','2015-08-25 14:00:47','2015-08-25 14:00:47','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=205',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (206,1,'2015-08-25 14:01:17','2015-08-25 14:01:17','','Gesundheit','','publish','closed','closed','','gesundheit','','','2015-08-25 14:01:17','2015-08-25 14:01:17','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=206',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (207,1,'2015-08-25 14:01:43','2015-08-25 14:01:43','','Handel','','publish','closed','closed','','handel','','','2015-08-25 14:01:43','2015-08-25 14:01:43','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=207',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (208,1,'2015-08-25 14:02:21','2015-08-25 14:02:21','','Industrie','','publish','closed','closed','','industrie','','','2015-08-25 14:02:21','2015-08-25 14:02:21','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=208',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (209,1,'2015-08-25 14:03:08','2015-08-25 14:03:08','','Kriminalitaet','','publish','closed','closed','','kriminalitaet','','','2015-08-25 14:03:08','2015-08-25 14:03:08','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=209',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (210,1,'2015-08-25 14:03:55','2015-08-25 14:03:55','','Kultur','','publish','closed','closed','','kultur','','','2015-08-25 14:03:55','2015-08-25 14:03:55','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=210',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (211,1,'2015-08-25 14:09:55','2015-08-25 14:09:55','','Landwirtschaft','','publish','closed','closed','','landwirtschaft','','','2015-08-25 14:09:55','2015-08-25 14:09:55','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=211',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (212,1,'2015-08-25 14:10:44','2015-08-25 14:10:44','','Mobilitaet','','publish','closed','closed','','mobilitaet','','','2015-08-25 14:10:44','2015-08-25 14:10:44','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=212',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (213,1,'2015-08-25 14:11:08','2015-08-25 14:11:08','','Sicherheit','','publish','closed','closed','','sicherheit','','','2015-08-25 14:12:42','2015-08-25 14:12:42','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=213',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (214,1,'2015-08-25 14:13:29','2015-08-25 14:13:29','','Politik','','publish','closed','closed','','politik','','','2015-08-25 14:13:29','2015-08-25 14:13:29','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=214',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (215,1,'2015-08-25 14:13:35','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2015-08-25 14:13:35','0000-00-00 00:00:00','',0,'http://ogdch.dev/?post_type=ckan-local-group&p=215',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (216,1,'2015-08-25 14:13:55','2015-08-25 14:13:55','','Preise','','publish','closed','closed','','preise','','','2015-08-25 14:13:55','2015-08-25 14:13:55','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=216',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (217,1,'2015-08-25 14:14:28','2015-08-25 14:14:28','','Soziale-Sicherheit','','publish','closed','closed','','soziale-sicherheit','','','2015-08-25 14:14:28','2015-08-25 14:14:28','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=217',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (218,1,'2015-08-25 14:15:06','2015-08-25 14:15:06','','Statistische-Grundlagen','','publish','closed','closed','','statistische-grundlagen','','','2015-08-25 14:15:06','2015-08-25 14:15:06','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=218',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (219,1,'2015-08-25 14:15:31','2015-08-25 14:15:31','','Tourismus','','publish','closed','closed','','tourismus','','','2015-08-25 14:15:31','2015-08-25 14:15:31','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=219',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (220,1,'2015-08-25 14:15:55','2015-08-25 14:15:55','','Verwaltung','','publish','closed','closed','','verwaltung','','','2015-08-25 14:15:55','2015-08-25 14:15:55','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=220',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (221,1,'2015-08-25 14:16:25','2015-08-25 14:16:25','','Volkswirtschaft','','publish','closed','closed','','volkswirtschaft','','','2015-08-25 14:16:25','2015-08-25 14:16:25','',0,'http://ogdch.dev/?post_type=ckan-local-group&#038;p=221',0,'ckan-local-group','',0);
INSERT INTO `ogdch_posts` VALUES (222,1,'2015-08-25 14:24:32','0000-00-00 00:00:00','','Menu Item','','draft','open','open','','','','','2015-08-25 14:24:32','0000-00-00 00:00:00','',0,'http://ogdch.dev/?p=222',1,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (231,1,'2015-08-25 15:16:00','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2015-08-25 15:16:00','0000-00-00 00:00:00','',0,'http://ogdch.dev/?post_type=ckan-local-dataset&p=231',0,'ckan-local-dataset','',0);
INSERT INTO `ogdch_posts` VALUES (232,1,'2015-08-25 15:47:25','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2015-08-25 15:47:25','0000-00-00 00:00:00','',0,'http://ogdch.dev/?p=232',0,'post','',0);
INSERT INTO `ogdch_posts` VALUES (233,1,'2015-08-25 15:56:06','2015-08-25 15:56:06','','Datensätze','','publish','open','open','','datensatze','','','2015-08-25 16:00:54','2015-08-25 16:00:54','',0,'http://ogdch.dev/?p=233',1,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (234,1,'2015-08-25 16:00:54','2015-08-25 16:00:54','','Gruppen','','publish','open','open','','gruppen','','','2015-08-25 16:00:54','2015-08-25 16:00:54','',0,'http://ogdch.dev/?p=234',2,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (235,1,'2015-08-25 16:00:32','0000-00-00 00:00:00','','Menu Item','','draft','open','open','','','','','2015-08-25 16:00:32','0000-00-00 00:00:00','',0,'http://ogdch.dev/?p=235',1,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (236,1,'2015-08-25 16:00:54','2015-08-25 16:00:54','','Apps','','publish','open','open','','apps','','','2015-08-25 16:00:54','2015-08-25 16:00:54','',0,'http://ogdch.dev/?p=236',3,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (237,1,'2015-08-25 16:02:12','2015-08-25 16:02:12','','Datasets','','publish','open','open','','datasets','','','2015-08-25 16:02:12','2015-08-25 16:02:12','',0,'http://ogdch.dev/?p=237',1,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (238,1,'2015-08-25 16:02:13','2015-08-25 16:02:13','','Groups','','publish','open','open','','groups','','','2015-08-25 16:02:13','2015-08-25 16:02:13','',0,'http://ogdch.dev/?p=238',2,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (239,1,'2015-08-25 16:02:13','2015-08-25 16:02:13','','Apps','','publish','open','open','','apps-2','','','2015-08-25 16:02:13','2015-08-25 16:02:13','',0,'http://ogdch.dev/?p=239',3,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (240,1,'2015-08-25 16:03:13','2015-08-25 16:03:13','','Jeux de données','','publish','open','open','','jeux-de-donnees','','','2015-08-25 16:03:13','2015-08-25 16:03:13','',0,'http://ogdch.dev/?p=240',1,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (241,1,'2015-08-25 16:03:13','2015-08-25 16:03:13','','Groupes','','publish','open','open','','groupes','','','2015-08-25 16:03:13','2015-08-25 16:03:13','',0,'http://ogdch.dev/?p=241',2,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (242,1,'2015-08-25 16:03:13','2015-08-25 16:03:13','','Apps','','publish','open','open','','apps-3','','','2015-08-25 16:03:13','2015-08-25 16:03:13','',0,'http://ogdch.dev/?p=242',3,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (243,1,'2015-08-25 16:04:07','2015-08-25 16:04:07','','Dataset','','publish','open','open','','dataset','','','2015-08-25 16:04:07','2015-08-25 16:04:07','',0,'http://ogdch.dev/?p=243',1,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (244,1,'2015-08-25 16:04:07','2015-08-25 16:04:07','','Gruppi','','publish','open','open','','gruppi','','','2015-08-25 16:04:07','2015-08-25 16:04:07','',0,'http://ogdch.dev/?p=244',2,'nav_menu_item','',0);
INSERT INTO `ogdch_posts` VALUES (245,1,'2015-08-25 16:04:07','2015-08-25 16:04:07','','Apps','','publish','open','open','','apps-4','','','2015-08-25 16:04:07','2015-08-25 16:04:07','',0,'http://ogdch.dev/?p=245',3,'nav_menu_item','',0);
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
INSERT INTO `ogdch_term_relationships` VALUES (154,9,0);
INSERT INTO `ogdch_term_relationships` VALUES (154,11,0);
INSERT INTO `ogdch_term_relationships` VALUES (154,131,0);
INSERT INTO `ogdch_term_relationships` VALUES (155,13,0);
INSERT INTO `ogdch_term_relationships` VALUES (155,15,0);
INSERT INTO `ogdch_term_relationships` VALUES (164,2,0);
INSERT INTO `ogdch_term_relationships` VALUES (164,134,0);
INSERT INTO `ogdch_term_relationships` VALUES (165,5,0);
INSERT INTO `ogdch_term_relationships` VALUES (165,134,0);
INSERT INTO `ogdch_term_relationships` VALUES (166,9,0);
INSERT INTO `ogdch_term_relationships` VALUES (166,134,0);
INSERT INTO `ogdch_term_relationships` VALUES (167,13,0);
INSERT INTO `ogdch_term_relationships` VALUES (167,134,0);
INSERT INTO `ogdch_term_relationships` VALUES (172,135,0);
INSERT INTO `ogdch_term_relationships` VALUES (175,135,0);
INSERT INTO `ogdch_term_relationships` VALUES (180,136,0);
INSERT INTO `ogdch_term_relationships` VALUES (183,136,0);
INSERT INTO `ogdch_term_relationships` VALUES (184,137,0);
INSERT INTO `ogdch_term_relationships` VALUES (187,137,0);
INSERT INTO `ogdch_term_relationships` VALUES (188,138,0);
INSERT INTO `ogdch_term_relationships` VALUES (191,138,0);
INSERT INTO `ogdch_term_relationships` VALUES (195,2,0);
INSERT INTO `ogdch_term_relationships` VALUES (195,139,0);
INSERT INTO `ogdch_term_relationships` VALUES (196,5,0);
INSERT INTO `ogdch_term_relationships` VALUES (196,139,0);
INSERT INTO `ogdch_term_relationships` VALUES (197,9,0);
INSERT INTO `ogdch_term_relationships` VALUES (197,139,0);
INSERT INTO `ogdch_term_relationships` VALUES (198,13,0);
INSERT INTO `ogdch_term_relationships` VALUES (198,139,0);
INSERT INTO `ogdch_term_relationships` VALUES (232,9,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogdch_term_taxonomy`
--

LOCK TABLES `ogdch_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `ogdch_term_taxonomy` DISABLE KEYS */;
INSERT INTO `ogdch_term_taxonomy` VALUES (1,1,'category','',0,3);
INSERT INTO `ogdch_term_taxonomy` VALUES (2,2,'language','a:2:{s:6:\"locale\";s:5:\"de_CH\";s:3:\"rtl\";i:0;}',0,6);
INSERT INTO `ogdch_term_taxonomy` VALUES (3,3,'term_language','',0,15);
INSERT INTO `ogdch_term_taxonomy` VALUES (4,4,'term_translations','a:4:{s:2:\"de\";i:1;s:2:\"en\";i:7;s:2:\"it\";i:11;s:2:\"fr\";i:15;}',0,4);
INSERT INTO `ogdch_term_taxonomy` VALUES (5,5,'language','a:2:{s:6:\"locale\";s:5:\"en_US\";s:3:\"rtl\";i:0;}',0,6);
INSERT INTO `ogdch_term_taxonomy` VALUES (6,6,'term_language','',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (7,7,'category','',0,3);
INSERT INTO `ogdch_term_taxonomy` VALUES (9,9,'language','a:2:{s:6:\"locale\";s:5:\"it_IT\";s:3:\"rtl\";i:0;}',0,6);
INSERT INTO `ogdch_term_taxonomy` VALUES (10,10,'term_language','',0,1);
INSERT INTO `ogdch_term_taxonomy` VALUES (11,11,'category','',0,3);
INSERT INTO `ogdch_term_taxonomy` VALUES (13,13,'language','a:2:{s:6:\"locale\";s:5:\"fr_FR\";s:3:\"rtl\";i:0;}',0,6);
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
INSERT INTO `ogdch_term_taxonomy` VALUES (139,139,'post_translations','a:4:{s:2:\"en\";i:196;s:2:\"de\";i:195;s:2:\"it\";i:197;s:2:\"fr\";i:198;}',0,4);
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
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
INSERT INTO `ogdch_usermeta` VALUES (14,1,'session_tokens','a:2:{s:64:\"3307667f1a7c72d4b02a886edd6c30b6e16dfcdfe6e0562bc70187ffd7457ae2\";a:4:{s:10:\"expiration\";i:1441175373;s:2:\"ip\";s:12:\"192.168.56.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36\";s:5:\"login\";i:1441002573;}s:64:\"2fd50f9141376c696069af87ca6f242ec2ec3c6f245be6337dafda177d1efa0b\";a:4:{s:10:\"expiration\";i:1441186614;s:2:\"ip\";s:12:\"192.168.56.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36\";s:5:\"login\";i:1441013814;}}');
INSERT INTO `ogdch_usermeta` VALUES (15,1,'ogdch_dashboard_quick_press_last_post_id','3');
INSERT INTO `ogdch_usermeta` VALUES (16,1,'pll_filter_content','');
INSERT INTO `ogdch_usermeta` VALUES (17,1,'ogdch_user-settings','posts_list_mode=list&libraryContent=upload&mfold=o');
INSERT INTO `ogdch_usermeta` VALUES (18,1,'ogdch_user-settings-time','1440508922');
INSERT INTO `ogdch_usermeta` VALUES (19,1,'managenav-menuscolumnshidden','a:4:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";}');
INSERT INTO `ogdch_usermeta` VALUES (20,1,'metaboxhidden_nav-menus','a:7:{i:0;s:19:\"pll_lang_switch_box\";i:1;s:8:\"add-post\";i:2;s:7:\"add-app\";i:3;s:22:\"add-ckan-local-dataset\";i:4;s:20:\"add-ckan-local-group\";i:5;s:18:\"add-ckan-local-org\";i:6;s:12:\"add-post_tag\";}');
INSERT INTO `ogdch_usermeta` VALUES (21,1,'nav_menu_recently_edited','137');
INSERT INTO `ogdch_usermeta` VALUES (22,1,'closedpostboxes_ckan-dataset','a:1:{i:0;s:16:\"ckan-dataset-box\";}');
INSERT INTO `ogdch_usermeta` VALUES (23,1,'metaboxhidden_ckan-dataset','a:1:{i:0;s:7:\"slugdiv\";}');
INSERT INTO `ogdch_usermeta` VALUES (24,1,'closedpostboxes_post','a:0:{}');
INSERT INTO `ogdch_usermeta` VALUES (25,1,'metaboxhidden_post','a:5:{i:0;s:11:\"postexcerpt\";i:1;s:13:\"trackbacksdiv\";i:2;s:10:\"postcustom\";i:3;s:7:\"slugdiv\";i:4;s:9:\"authordiv\";}');
INSERT INTO `ogdch_usermeta` VALUES (26,1,'_yoast_wpseo_profile_updated','1436165575');
INSERT INTO `ogdch_usermeta` VALUES (27,1,'wpseo_ignore_tour','1');
INSERT INTO `ogdch_usermeta` VALUES (28,1,'wpseo_seen_tagline_notice','seen');
INSERT INTO `ogdch_usermeta` VALUES (29,1,'wpseo_seen_about_version','2.3.2');
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
INSERT INTO `ogdch_usermeta` VALUES (44,2,'ogdch_capabilities','a:1:{s:10:\"data-owner\";b:1;}');
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
INSERT INTO `ogdch_usermeta` VALUES (70,4,'ogdch_capabilities','a:1:{s:15:\"content-manager\";b:1;}');
INSERT INTO `ogdch_usermeta` VALUES (71,4,'ogdch_user_level','0');
INSERT INTO `ogdch_usermeta` VALUES (72,4,'ckan-backend_organisation','swisstopo');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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

-- Dump completed on 2015-08-31  9:41:45
