<?php

// ===================================================
// DB config
// ===================================================

define( 'DB_NAME', 'cms' );
define( 'DB_USER', 'cms' );
define( 'DB_PASSWORD', 'kiqa7sb4' );
define( 'DB_HOST', 'localhost' );


// ===================================================
// Various Dev Settings
// ===================================================

define( 'WP_LOCAL_DEV', false );
define( 'WP_DEBUG', false );
define( 'WP_DEBUG_LOG', false );
define( 'WP_DEBUG_DISPLAY', false );
define( 'SCRIPT_DEBUG', false );
define( 'SAVEQUERIES', false );
define( 'FS_METHOD', 'direct' );


// ===================================================
// Cache
// ===================================================

define( 'WP_CACHE', false );


// ===================================================
// Object-Cache
// ===================================================

$redis_server = array( 'host' => '127.0.0.1', 'port' => 6379 );


// ===================================================
// Define Siteurl
// ===================================================

define( 'WP_HOME', 'http://ogdch-test.clients.liip.ch' );
define( 'WP_SITEURL', 'http://ogdch-test.clients.liip.ch/cms' );


// ===================================================
// Define path & url for Content
// ===================================================

define( 'WP_CONTENT_DIR', dirname( __FILE__ ) . '/content' );
define( 'WP_CONTENT_URL', WP_HOME . '/content' );


// ===================================================
// Define path & url for Uploads and Plugins
// ===================================================

define( 'WP_PLUGIN_DIR', dirname( __FILE__ ) . '/content/plugins' );
define( 'WP_PLUGIN_URL', WP_HOME . '/content/plugins' );


// ===================================================
// Set path to MU Plugins
// ===================================================

define( 'WPMU_PLUGIN_DIR', dirname( __FILE__ ) . '/content/mu-plugins' );
define( 'WPMU_PLUGIN_URL', WP_HOME . '/content/mu-plugins' );


// ===================================================
// CKAN
// ===================================================

define( 'CKAN_API_ENDPOINT', 'http://ogdch-test.clients.liip.ch/api/3/action/' );
define( 'CKAN_API_KEY', 'a3cdeb1f-6130-4a94-839e-f82393c1c393' ); // adminsuer key

$language_priority = array(
	1 => 'en',
	2 => 'de',
	3 => 'fr',
	4 => 'it'
);


// ===================================================
// Piwik
// ===================================================

define( 'PIWIK_URL', 'ogdch-piwik-test.clients.liip.ch' );
define( 'PIWIK_SITEID', 1 );


// ===================================================
// WP Behavior
// ===================================================

define( 'MEDIA_TRASH', false );
