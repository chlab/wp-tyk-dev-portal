<?php

// ===================================================
// DB config
// ===================================================

define( 'DB_NAME', 'cms' );
define( 'DB_USER', 'cms' );
define( 'DB_PASSWORD', 'kcnsh72g' );
define( 'DB_HOST', '10.0.119.15' );


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
//define( 'WPCACHEHOME', dirname( __FILE__ ) . '/content/plugins/wp-super-cache/' );

// ===================================================
// Object-Cache
// ===================================================

$redis_server = array( 'host' => '127.0.0.1', 'port' => 6379 );

// ===================================================
// Define Siteurl
// ===================================================

define( 'WP_HOME', 'http://ogdch.begasoft.ch' );
define( 'WP_SITEURL', 'http://ogdch.begasoft.ch/cms' );


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
// Twitter
// ===================================================

define( 'TWITTER_CONSUMER_KEY', 'azoAPMSiArNEoGVHaWCnwDzC3' );
define( 'TWITTER_CONSUMER_SECRET', 'j8t6MZUgLUJIzX0vVJO8eaqA3XwTuuUzoHrDn5hGGl4xLfkLka' );
define( 'TWITTER_OAUTH_ACCESS_TOKEN', '36353406-DNRA5h95NMVSj9ch6kEU797ZVJKAWmK0gj3AnikNY' );
define( 'TWITTER_OAUTH_ACCESS_TOKEN_SECRET', 'wZ3efba9OBiWSjH6pMq988BiXssohog8G3pVrHZt3jwv6' );

// ===================================================
// CKAN
// ===================================================

define( 'CKAN_API_ENDPOINT', 'http://ogdch.begasoft.ch/api/3/' );
define( 'CKAN_SEARCH_API_ENDPOINT', 'http://ogdch.begasoft.ch/api/3/action/package_search' );
define( 'CKAN_API_KEY', 'a3cdeb1f-6130-4a94-839e-f82393c1c393' ); // adminsuer key

$language_priority = array(
	1 => 'en',
	2 => 'de',
	3 => 'fr',
	4 => 'it'
);

// ===================================================
// WP Behavior
// ===================================================

define( 'MEDIA_TRASH', false );
