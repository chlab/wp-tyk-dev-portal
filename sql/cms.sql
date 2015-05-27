-- Adminer 4.2.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `ogdch_commentmeta`;
CREATE TABLE `ogdch_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `ogdch_comments`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ogdch_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1,	1,	'Mr WordPress',	'',	'https://wordpress.org/',	'',	'2015-05-21 13:32:37',	'2015-05-21 13:32:37',	'Hi, this is a comment.\nTo delete a comment, just log in and view the post&#039;s comments. There you will have the option to edit or delete them.',	0,	'1',	'',	'',	0,	0);

DROP TABLE IF EXISTS `ogdch_links`;
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


DROP TABLE IF EXISTS `ogdch_options`;
CREATE TABLE `ogdch_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ogdch_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1,	'siteurl',	'http://ogdch.dev/cms',	'yes'),
(2,	'home',	'http://ogdch.dev/cms',	'yes'),
(3,	'blogname',	'OGDCH',	'yes'),
(4,	'blogdescription',	'Just another WordPress site',	'yes'),
(5,	'users_can_register',	'0',	'yes'),
(6,	'admin_email',	'juerg.hunziker@liip.ch',	'yes'),
(7,	'start_of_week',	'1',	'yes'),
(8,	'use_balanceTags',	'0',	'yes'),
(9,	'use_smilies',	'1',	'yes'),
(10,	'require_name_email',	'1',	'yes'),
(11,	'comments_notify',	'1',	'yes'),
(12,	'posts_per_rss',	'10',	'yes'),
(13,	'rss_use_excerpt',	'0',	'yes'),
(14,	'mailserver_url',	'mail.example.com',	'yes'),
(15,	'mailserver_login',	'login@example.com',	'yes'),
(16,	'mailserver_pass',	'password',	'yes'),
(17,	'mailserver_port',	'110',	'yes'),
(18,	'default_category',	'1',	'yes'),
(19,	'default_comment_status',	'open',	'yes'),
(20,	'default_ping_status',	'open',	'yes'),
(21,	'default_pingback_flag',	'0',	'yes'),
(22,	'posts_per_page',	'10',	'yes'),
(23,	'date_format',	'F j, Y',	'yes'),
(24,	'time_format',	'g:i a',	'yes'),
(25,	'links_updated_date_format',	'F j, Y g:i a',	'yes'),
(26,	'comment_moderation',	'0',	'yes'),
(27,	'moderation_notify',	'1',	'yes'),
(28,	'permalink_structure',	'/%year%/%monthnum%/%day%/%postname%/',	'yes'),
(29,	'gzipcompression',	'0',	'yes'),
(30,	'hack_file',	'0',	'yes'),
(31,	'blog_charset',	'UTF-8',	'yes'),
(32,	'moderation_keys',	'',	'no'),
(33,	'active_plugins',	'a:4:{i:0;s:21:\"polylang/polylang.php\";i:1;s:31:\"query-monitor/query-monitor.php\";i:2;s:13:\"cmb2/init.php\";i:3;s:19:\"members/members.php\";}',	'yes'),
(34,	'category_base',	'',	'yes'),
(35,	'ping_sites',	'http://rpc.pingomatic.com/',	'yes'),
(36,	'advanced_edit',	'0',	'yes'),
(37,	'comment_max_links',	'2',	'yes'),
(38,	'gmt_offset',	'0',	'yes'),
(39,	'default_email_category',	'1',	'yes'),
(40,	'recently_edited',	'',	'no'),
(41,	'template',	'twentyfifteen',	'yes'),
(42,	'stylesheet',	'twentyfifteen',	'yes'),
(43,	'comment_whitelist',	'1',	'yes'),
(44,	'blacklist_keys',	'',	'no'),
(45,	'comment_registration',	'0',	'yes'),
(46,	'html_type',	'text/html',	'yes'),
(47,	'use_trackback',	'0',	'yes'),
(48,	'default_role',	'subscriber',	'yes'),
(49,	'db_version',	'31535',	'yes'),
(50,	'uploads_use_yearmonth_folders',	'1',	'yes'),
(51,	'upload_path',	'',	'yes'),
(52,	'blog_public',	'0',	'yes'),
(53,	'default_link_category',	'2',	'yes'),
(54,	'show_on_front',	'posts',	'yes'),
(55,	'tag_base',	'',	'yes'),
(56,	'show_avatars',	'1',	'yes'),
(57,	'avatar_rating',	'G',	'yes'),
(58,	'upload_url_path',	'',	'yes'),
(59,	'thumbnail_size_w',	'150',	'yes'),
(60,	'thumbnail_size_h',	'150',	'yes'),
(61,	'thumbnail_crop',	'1',	'yes'),
(62,	'medium_size_w',	'300',	'yes'),
(63,	'medium_size_h',	'300',	'yes'),
(64,	'avatar_default',	'mystery',	'yes'),
(65,	'large_size_w',	'1024',	'yes'),
(66,	'large_size_h',	'1024',	'yes'),
(67,	'image_default_link_type',	'file',	'yes'),
(68,	'image_default_size',	'',	'yes'),
(69,	'image_default_align',	'',	'yes'),
(70,	'close_comments_for_old_posts',	'0',	'yes'),
(71,	'close_comments_days_old',	'14',	'yes'),
(72,	'thread_comments',	'1',	'yes'),
(73,	'thread_comments_depth',	'5',	'yes'),
(74,	'page_comments',	'0',	'yes'),
(75,	'comments_per_page',	'50',	'yes'),
(76,	'default_comments_page',	'newest',	'yes'),
(77,	'comment_order',	'asc',	'yes'),
(78,	'sticky_posts',	'a:0:{}',	'yes'),
(79,	'widget_categories',	'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}',	'yes'),
(80,	'widget_text',	'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}',	'yes'),
(81,	'widget_rss',	'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}',	'yes'),
(82,	'uninstall_plugins',	'a:0:{}',	'no'),
(83,	'timezone_string',	'',	'yes'),
(84,	'page_for_posts',	'0',	'yes'),
(85,	'page_on_front',	'0',	'yes'),
(86,	'default_post_format',	'0',	'yes'),
(87,	'link_manager_enabled',	'0',	'yes'),
(88,	'initial_db_version',	'32453',	'yes'),
(89,	'ogdch_user_roles',	'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:68:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:9:\"add_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:10:\"list_roles\";b:1;s:12:\"create_roles\";b:1;s:12:\"delete_roles\";b:1;s:10:\"edit_roles\";b:1;s:16:\"restrict_content\";b:1;s:18:\"view_query_monitor\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}',	'yes'),
(90,	'widget_search',	'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}',	'yes'),
(91,	'widget_recent-posts',	'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}',	'yes'),
(92,	'widget_recent-comments',	'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}',	'yes'),
(93,	'widget_archives',	'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}',	'yes'),
(94,	'widget_meta',	'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}',	'yes'),
(95,	'sidebars_widgets',	'a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:13:\"array_version\";i:3;}',	'yes'),
(97,	'cron',	'a:4:{i:1432669740;a:1:{s:20:\"wp_maybe_auto_update\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1432690357;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1432733881;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}',	'yes'),
(134,	'db_upgraded',	'',	'yes'),
(142,	'recently_activated',	'a:1:{s:39:\"Custom-Meta-Boxes/custom-meta-boxes.php\";i:1432645351;}',	'yes'),
(143,	'can_compress_scripts',	'0',	'yes'),
(147,	'members_db_version',	'2',	'yes'),
(148,	'members_settings',	'a:8:{s:12:\"role_manager\";i:1;s:19:\"content_permissions\";i:0;s:25:\"content_permissions_error\";s:85:\"<p class=\"restricted\">Sorry, but you do not have permission to view this content.</p>\";s:17:\"login_form_widget\";i:0;s:12:\"users_widget\";i:0;s:12:\"private_blog\";i:0;s:12:\"private_feed\";i:0;s:18:\"private_feed_error\";s:80:\"<p class=\"restricted\">You must be logged into the site to view this content.</p>\";}',	'yes'),
(151,	'polylang',	'a:12:{s:7:\"browser\";i:1;s:7:\"rewrite\";i:1;s:12:\"hide_default\";i:0;s:10:\"force_lang\";i:1;s:13:\"redirect_lang\";i:0;s:13:\"media_support\";i:1;s:4:\"sync\";a:11:{i:0;s:10:\"taxonomies\";i:1;s:9:\"post_meta\";i:2;s:14:\"comment_status\";i:3;s:11:\"ping_status\";i:4;s:12:\"sticky_posts\";i:5;s:9:\"post_date\";i:6;s:11:\"post_format\";i:7;s:11:\"post_parent\";i:8;s:17:\"_wp_page_template\";i:9;s:10:\"menu_order\";i:10;s:13:\"_thumbnail_id\";}s:10:\"post_types\";a:2:{i:0;s:3:\"app\";i:1;s:12:\"ckan-dataset\";}s:10:\"taxonomies\";a:0:{}s:7:\"domains\";a:0:{}s:7:\"version\";s:5:\"1.7.5\";s:12:\"default_lang\";s:2:\"de\";}',	'yes'),
(158,	'category_children',	'a:0:{}',	'yes'),
(161,	'rewrite_rules',	'a:194:{s:21:\"(de|en|it|fr)/apps/?$\";s:40:\"index.php?lang=$matches[1]&post_type=app\";s:51:\"(de|en|it|fr)/apps/feed/(feed|rdf|rss|rss2|atom)/?$\";s:57:\"index.php?lang=$matches[1]&post_type=app&feed=$matches[2]\";s:46:\"(de|en|it|fr)/apps/(feed|rdf|rss|rss2|atom)/?$\";s:57:\"index.php?lang=$matches[1]&post_type=app&feed=$matches[2]\";s:38:\"(de|en|it|fr)/apps/page/([0-9]{1,})/?$\";s:58:\"index.php?lang=$matches[1]&post_type=app&paged=$matches[2]\";s:24:\"(de|en|it|fr)/dataset/?$\";s:49:\"index.php?lang=$matches[1]&post_type=ckan-dataset\";s:54:\"(de|en|it|fr)/dataset/feed/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&post_type=ckan-dataset&feed=$matches[2]\";s:49:\"(de|en|it|fr)/dataset/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?lang=$matches[1]&post_type=ckan-dataset&feed=$matches[2]\";s:41:\"(de|en|it|fr)/dataset/page/([0-9]{1,})/?$\";s:67:\"index.php?lang=$matches[1]&post_type=ckan-dataset&paged=$matches[2]\";s:61:\"(de|en|it|fr)/category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[2]&feed=$matches[3]\";s:56:\"(de|en|it|fr)/category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[2]&feed=$matches[3]\";s:49:\"(de|en|it|fr)/category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[2]&paged=$matches[3]\";s:31:\"(de|en|it|fr)/category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[2]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:58:\"(de|en|it|fr)/tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[2]&feed=$matches[3]\";s:53:\"(de|en|it|fr)/tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[2]&feed=$matches[3]\";s:46:\"(de|en|it|fr)/tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[2]&paged=$matches[3]\";s:28:\"(de|en|it|fr)/tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[2]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:59:\"(de|en|it|fr)/type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:67:\"index.php?lang=$matches[1]&post_format=$matches[2]&feed=$matches[3]\";s:54:\"(de|en|it|fr)/type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:67:\"index.php?lang=$matches[1]&post_format=$matches[2]&feed=$matches[3]\";s:47:\"(de|en|it|fr)/type/([^/]+)/page/?([0-9]{1,})/?$\";s:68:\"index.php?lang=$matches[1]&post_format=$matches[2]&paged=$matches[3]\";s:29:\"(de|en|it|fr)/type/([^/]+)/?$\";s:50:\"index.php?lang=$matches[1]&post_format=$matches[2]\";s:46:\"(de|en|it|fr)/apps/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[2]\";s:56:\"(de|en|it|fr)/apps/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[2]&tb=1\";s:76:\"(de|en|it|fr)/apps/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:71:\"(de|en|it|fr)/apps/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:71:\"(de|en|it|fr)/apps/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[2]&cpage=$matches[3]\";s:39:\"(de|en|it|fr)/apps/([^/]+)/trackback/?$\";s:30:\"index.php?app=$matches[2]&tb=1\";s:59:\"(de|en|it|fr)/apps/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?app=$matches[2]&feed=$matches[3]\";s:54:\"(de|en|it|fr)/apps/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?app=$matches[2]&feed=$matches[3]\";s:47:\"(de|en|it|fr)/apps/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?app=$matches[2]&paged=$matches[3]\";s:54:\"(de|en|it|fr)/apps/([^/]+)/comment-page-([0-9]{1,})/?$\";s:43:\"index.php?app=$matches[2]&cpage=$matches[3]\";s:39:\"(de|en|it|fr)/apps/([^/]+)(/[0-9]+)?/?$\";s:42:\"index.php?app=$matches[2]&page=$matches[3]\";s:35:\"(de|en|it|fr)/apps/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[2]\";s:45:\"(de|en|it|fr)/apps/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[2]&tb=1\";s:65:\"(de|en|it|fr)/apps/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:60:\"(de|en|it|fr)/apps/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:60:\"(de|en|it|fr)/apps/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[2]&cpage=$matches[3]\";s:32:\"apps/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:42:\"apps/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:62:\"apps/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:57:\"apps/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:57:\"apps/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:25:\"apps/([^/]+)/trackback/?$\";s:30:\"index.php?app=$matches[1]&tb=1\";s:45:\"apps/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?app=$matches[1]&feed=$matches[2]\";s:40:\"apps/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?app=$matches[1]&feed=$matches[2]\";s:33:\"apps/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?app=$matches[1]&paged=$matches[2]\";s:40:\"apps/([^/]+)/comment-page-([0-9]{1,})/?$\";s:43:\"index.php?app=$matches[1]&cpage=$matches[2]\";s:25:\"apps/([^/]+)(/[0-9]+)?/?$\";s:42:\"index.php?app=$matches[1]&page=$matches[2]\";s:21:\"apps/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:31:\"apps/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:51:\"apps/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:46:\"apps/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:46:\"apps/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:49:\"(de|en|it|fr)/dataset/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[2]\";s:59:\"(de|en|it|fr)/dataset/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[2]&tb=1\";s:79:\"(de|en|it|fr)/dataset/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:74:\"(de|en|it|fr)/dataset/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:74:\"(de|en|it|fr)/dataset/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[2]&cpage=$matches[3]\";s:42:\"(de|en|it|fr)/dataset/([^/]+)/trackback/?$\";s:39:\"index.php?ckan-dataset=$matches[2]&tb=1\";s:62:\"(de|en|it|fr)/dataset/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:51:\"index.php?ckan-dataset=$matches[2]&feed=$matches[3]\";s:57:\"(de|en|it|fr)/dataset/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:51:\"index.php?ckan-dataset=$matches[2]&feed=$matches[3]\";s:50:\"(de|en|it|fr)/dataset/([^/]+)/page/?([0-9]{1,})/?$\";s:52:\"index.php?ckan-dataset=$matches[2]&paged=$matches[3]\";s:57:\"(de|en|it|fr)/dataset/([^/]+)/comment-page-([0-9]{1,})/?$\";s:52:\"index.php?ckan-dataset=$matches[2]&cpage=$matches[3]\";s:42:\"(de|en|it|fr)/dataset/([^/]+)(/[0-9]+)?/?$\";s:51:\"index.php?ckan-dataset=$matches[2]&page=$matches[3]\";s:38:\"(de|en|it|fr)/dataset/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[2]\";s:48:\"(de|en|it|fr)/dataset/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[2]&tb=1\";s:68:\"(de|en|it|fr)/dataset/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:63:\"(de|en|it|fr)/dataset/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:63:\"(de|en|it|fr)/dataset/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[2]&cpage=$matches[3]\";s:35:\"dataset/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:45:\"dataset/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:65:\"dataset/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"dataset/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"dataset/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:28:\"dataset/([^/]+)/trackback/?$\";s:39:\"index.php?ckan-dataset=$matches[1]&tb=1\";s:48:\"dataset/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:51:\"index.php?ckan-dataset=$matches[1]&feed=$matches[2]\";s:43:\"dataset/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:51:\"index.php?ckan-dataset=$matches[1]&feed=$matches[2]\";s:36:\"dataset/([^/]+)/page/?([0-9]{1,})/?$\";s:52:\"index.php?ckan-dataset=$matches[1]&paged=$matches[2]\";s:43:\"dataset/([^/]+)/comment-page-([0-9]{1,})/?$\";s:52:\"index.php?ckan-dataset=$matches[1]&cpage=$matches[2]\";s:28:\"dataset/([^/]+)(/[0-9]+)?/?$\";s:51:\"index.php?ckan-dataset=$matches[1]&page=$matches[2]\";s:24:\"dataset/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:34:\"dataset/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:54:\"dataset/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"dataset/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"dataset/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:46:\"(de|en|it|fr)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?lang=$matches[1]&&feed=$matches[2]\";s:41:\"(de|en|it|fr)/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?lang=$matches[1]&&feed=$matches[2]\";s:34:\"(de|en|it|fr)/page/?([0-9]{1,})/?$\";s:45:\"index.php?lang=$matches[1]&&paged=$matches[2]\";s:16:\"(de|en|it|fr)/?$\";s:26:\"index.php?lang=$matches[1]\";s:55:\"(de|en|it|fr)/comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:59:\"index.php?lang=$matches[1]&&feed=$matches[2]&withcomments=1\";s:50:\"(de|en|it|fr)/comments/(feed|rdf|rss|rss2|atom)/?$\";s:59:\"index.php?lang=$matches[1]&&feed=$matches[2]&withcomments=1\";s:58:\"(de|en|it|fr)/search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:57:\"index.php?lang=$matches[1]&s=$matches[2]&feed=$matches[3]\";s:53:\"(de|en|it|fr)/search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:57:\"index.php?lang=$matches[1]&s=$matches[2]&feed=$matches[3]\";s:46:\"(de|en|it|fr)/search/(.+)/page/?([0-9]{1,})/?$\";s:58:\"index.php?lang=$matches[1]&s=$matches[2]&paged=$matches[3]\";s:28:\"(de|en|it|fr)/search/(.+)/?$\";s:40:\"index.php?lang=$matches[1]&s=$matches[2]\";s:61:\"(de|en|it|fr)/author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:67:\"index.php?lang=$matches[1]&author_name=$matches[2]&feed=$matches[3]\";s:56:\"(de|en|it|fr)/author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:67:\"index.php?lang=$matches[1]&author_name=$matches[2]&feed=$matches[3]\";s:49:\"(de|en|it|fr)/author/([^/]+)/page/?([0-9]{1,})/?$\";s:68:\"index.php?lang=$matches[1]&author_name=$matches[2]&paged=$matches[3]\";s:31:\"(de|en|it|fr)/author/([^/]+)/?$\";s:50:\"index.php?lang=$matches[1]&author_name=$matches[2]\";s:83:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&feed=$matches[5]\";s:78:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&feed=$matches[5]\";s:71:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&paged=$matches[5]\";s:53:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[2]&monthnum=$matches[3]&day=$matches[4]\";s:70:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[2]&monthnum=$matches[3]&feed=$matches[4]\";s:65:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[2]&monthnum=$matches[3]&feed=$matches[4]\";s:58:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[2]&monthnum=$matches[3]&paged=$matches[4]\";s:40:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[2]&monthnum=$matches[3]\";s:57:\"(de|en|it|fr)/([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[2]&feed=$matches[3]\";s:52:\"(de|en|it|fr)/([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[2]&feed=$matches[3]\";s:45:\"(de|en|it|fr)/([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[2]&paged=$matches[3]\";s:27:\"(de|en|it|fr)/([0-9]{4})/?$\";s:26:\"index.php?year=$matches[2]\";s:72:\"(de|en|it|fr)/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[2]\";s:82:\"(de|en|it|fr)/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[2]&tb=1\";s:102:\"(de|en|it|fr)/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:97:\"(de|en|it|fr)/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:97:\"(de|en|it|fr)/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[2]&cpage=$matches[3]\";s:71:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&name=$matches[5]&tb=1\";s:91:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&name=$matches[5]&feed=$matches[6]\";s:86:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&name=$matches[5]&feed=$matches[6]\";s:79:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&name=$matches[5]&paged=$matches[6]\";s:86:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&name=$matches[5]&cpage=$matches[6]\";s:71:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(/[0-9]+)?/?$\";s:97:\"index.php?year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&name=$matches[5]&page=$matches[6]\";s:61:\"(de|en|it|fr)/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[2]\";s:71:\"(de|en|it|fr)/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[2]&tb=1\";s:91:\"(de|en|it|fr)/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:86:\"(de|en|it|fr)/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:86:\"(de|en|it|fr)/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[2]&cpage=$matches[3]\";s:78:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&cpage=$matches[5]\";s:65:\"(de|en|it|fr)/([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[2]&monthnum=$matches[3]&cpage=$matches[4]\";s:52:\"(de|en|it|fr)/([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[2]&cpage=$matches[3]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(/[0-9]+)?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:41:\"(de|en|it|fr)/.?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[2]\";s:51:\"(de|en|it|fr)/.?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[2]&tb=1\";s:71:\"(de|en|it|fr)/.?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:66:\"(de|en|it|fr)/.?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[2]&feed=$matches[3]\";s:66:\"(de|en|it|fr)/.?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[2]&cpage=$matches[3]\";s:34:\"(de|en|it|fr)/(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[2]&tb=1\";s:54:\"(de|en|it|fr)/(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[2]&feed=$matches[3]\";s:49:\"(de|en|it|fr)/(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[2]&feed=$matches[3]\";s:42:\"(de|en|it|fr)/(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[2]&paged=$matches[3]\";s:49:\"(de|en|it|fr)/(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[2]&cpage=$matches[3]\";s:34:\"(de|en|it|fr)/(.?.+?)(/[0-9]+)?/?$\";s:47:\"index.php?pagename=$matches[2]&page=$matches[3]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:20:\"(.?.+?)(/[0-9]+)?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}',	'yes'),
(162,	'widget_nav_menu',	'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}',	'yes'),
(163,	'widget_calendar',	'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}',	'yes'),
(165,	'widget_tag_cloud',	'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}',	'yes'),
(166,	'widget_pages',	'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}',	'yes'),
(167,	'widget_polylang',	'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}',	'yes'),
(169,	'auto_updater.lock',	'1432647158',	'no');

DROP TABLE IF EXISTS `ogdch_postmeta`;
CREATE TABLE `ogdch_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ogdch_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1,	2,	'_wp_page_template',	'default');

DROP TABLE IF EXISTS `ogdch_posts`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ogdch_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1,	1,	'2015-05-21 13:32:37',	'2015-05-21 13:32:37',	'Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!',	'Hello world!',	'',	'publish',	'open',	'open',	'',	'hello-world',	'',	'',	'2015-05-21 13:32:37',	'2015-05-21 13:32:37',	'',	0,	'http://ogdch.dev/?p=1',	0,	'post',	'',	1),
(2,	1,	'2015-05-21 13:32:37',	'2015-05-21 13:32:37',	'This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my blog. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href=\"http://ogdch.dev/cms/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!',	'Sample Page',	'',	'publish',	'open',	'open',	'',	'sample-page',	'',	'',	'2015-05-21 13:32:37',	'2015-05-21 13:32:37',	'',	0,	'http://ogdch.dev/?page_id=2',	0,	'page',	'',	0),
(3,	1,	'2015-05-21 13:32:45',	'0000-00-00 00:00:00',	'',	'Auto Draft',	'',	'auto-draft',	'open',	'open',	'',	'',	'',	'',	'2015-05-21 13:32:45',	'0000-00-00 00:00:00',	'',	0,	'http://ogdch.dev/?p=3',	0,	'post',	'',	0),
(17,	1,	'2015-05-26 12:29:35',	'2015-05-26 12:29:35',	'a:1:{i:0;a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}}',	'polylang_mo_2',	'',	'publish',	'open',	'open',	'',	'polylang_mo_2',	'',	'',	'2015-05-26 12:29:35',	'2015-05-26 12:29:35',	'',	0,	'http://ogdch.dev/?post_type=polylang_mo&p=17',	0,	'polylang_mo',	'',	0),
(18,	1,	'2015-05-26 12:29:45',	'2015-05-26 12:29:45',	'a:1:{i:0;a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}}',	'polylang_mo_5',	'',	'publish',	'open',	'open',	'',	'polylang_mo_5',	'',	'',	'2015-05-26 12:29:45',	'2015-05-26 12:29:45',	'',	0,	'http://ogdch.dev/?post_type=polylang_mo&p=18',	0,	'polylang_mo',	'',	0),
(19,	1,	'2015-05-26 12:29:50',	'2015-05-26 12:29:50',	'a:1:{i:0;a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}}',	'polylang_mo_9',	'',	'publish',	'open',	'open',	'',	'polylang_mo_9',	'',	'',	'2015-05-26 12:29:50',	'2015-05-26 12:29:50',	'',	0,	'http://ogdch.dev/?post_type=polylang_mo&p=19',	0,	'polylang_mo',	'',	0),
(20,	1,	'2015-05-26 12:29:54',	'2015-05-26 12:29:54',	'a:1:{i:0;a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}}',	'polylang_mo_13',	'',	'publish',	'open',	'open',	'',	'polylang_mo_13',	'',	'',	'2015-05-26 12:29:54',	'2015-05-26 12:29:54',	'',	0,	'http://ogdch.dev/?post_type=polylang_mo&p=20',	0,	'polylang_mo',	'',	0);

DROP TABLE IF EXISTS `ogdch_terms`;
CREATE TABLE `ogdch_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ogdch_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1,	'Uncategorized',	'uncategorized',	0),
(2,	'Deutsch',	'de',	0),
(3,	'Deutsch',	'pll_de',	0),
(4,	'pll_5564672f3106e',	'pll_5564672f3106e',	0),
(5,	'English',	'en',	0),
(6,	'English',	'pll_en',	0),
(7,	'Allgemein',	'allgemein-en',	0),
(9,	'Italiano',	'it',	0),
(10,	'Italiano',	'pll_it',	0),
(11,	'Allgemein',	'allgemein-it',	0),
(13,	'Français',	'fr',	0),
(14,	'Français',	'pll_fr',	0),
(15,	'Allgemein',	'allgemein-fr',	0);

DROP TABLE IF EXISTS `ogdch_term_relationships`;
CREATE TABLE `ogdch_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ogdch_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1,	1,	0),
(1,	2,	0),
(1,	3,	0),
(1,	4,	0),
(2,	2,	0),
(7,	4,	0),
(7,	6,	0),
(11,	4,	0),
(11,	10,	0),
(15,	4,	0),
(15,	14,	0);

DROP TABLE IF EXISTS `ogdch_term_taxonomy`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ogdch_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1,	1,	'category',	'',	0,	1),
(2,	2,	'language',	'a:2:{s:6:\"locale\";s:5:\"de_CH\";s:3:\"rtl\";i:0;}',	0,	2),
(3,	3,	'term_language',	'',	0,	1),
(4,	4,	'term_translations',	'a:4:{s:2:\"de\";i:1;s:2:\"en\";i:7;s:2:\"it\";i:11;s:2:\"fr\";i:15;}',	0,	4),
(5,	5,	'language',	'a:2:{s:6:\"locale\";s:5:\"en_US\";s:3:\"rtl\";i:0;}',	0,	0),
(6,	6,	'term_language',	'',	0,	1),
(7,	7,	'category',	'',	0,	0),
(9,	9,	'language',	'a:2:{s:6:\"locale\";s:5:\"it_IT\";s:3:\"rtl\";i:0;}',	0,	0),
(10,	10,	'term_language',	'',	0,	1),
(11,	11,	'category',	'',	0,	0),
(13,	13,	'language',	'a:2:{s:6:\"locale\";s:5:\"fr_FR\";s:3:\"rtl\";i:0;}',	0,	0),
(14,	14,	'term_language',	'',	0,	1),
(15,	15,	'category',	'',	0,	0);

DROP TABLE IF EXISTS `ogdch_usermeta`;
CREATE TABLE `ogdch_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ogdch_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1,	1,	'nickname',	'liip'),
(2,	1,	'first_name',	''),
(3,	1,	'last_name',	''),
(4,	1,	'description',	''),
(5,	1,	'rich_editing',	'true'),
(6,	1,	'comment_shortcuts',	'false'),
(7,	1,	'admin_color',	'fresh'),
(8,	1,	'use_ssl',	'0'),
(9,	1,	'show_admin_bar_front',	'true'),
(10,	1,	'ogdch_capabilities',	'a:1:{s:13:\"administrator\";b:1;}'),
(11,	1,	'ogdch_user_level',	'10'),
(12,	1,	'dismissed_wp_pointers',	'wp360_locks,wp390_widgets,wp410_dfw'),
(13,	1,	'show_welcome_panel',	'1'),
(14,	1,	'session_tokens',	'a:2:{s:64:\"ffeacd8f8ec841165bb1f775d453c348a3e751487ea1e982d96adb7d5077a38c\";a:4:{s:10:\"expiration\";i:1433424764;s:2:\"ip\";s:12:\"192.168.56.1\";s:2:\"ua\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.65 Safari/537.36\";s:5:\"login\";i:1432215164;}s:64:\"27f2830cba79b52e105d22580b1f7c8c2c736e47b0c5cc15e5073887f8ca6fbc\";a:4:{s:10:\"expiration\";i:1432813412;s:2:\"ip\";s:12:\"192.168.56.1\";s:2:\"ua\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.65 Safari/537.36\";s:5:\"login\";i:1432640612;}}'),
(15,	1,	'ogdch_dashboard_quick_press_last_post_id',	'3'),
(16,	1,	'pll_filter_content',	'');

DROP TABLE IF EXISTS `ogdch_users`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ogdch_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1,	'liip',	'$P$BF6lW0I8vsXG25z1/F3y1gTkNvkfe71',	'liip',	'juerg.hunziker@liip.ch',	'',	'2015-05-21 13:32:37',	'',	0,	'liip');

-- 2015-05-26 14:13:02
