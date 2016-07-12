<?php

define('ODPCH_PLUGIN_DIR', './web/ogdch.dev/content/plugins');
define('ODPCH_THEME', 'twentyfifteen-child');

require_once dirname( __FILE__ ) . '/../web/ogdch.dev/wp-unittest-config.php';

// load wordpress test functions
$_tests_dir = getenv( 'WP_TESTS_DIR' );
if ( ! $_tests_dir ) {
	$_tests_dir = '/tmp/wordpress-tests-lib';
}
require_once $_tests_dir . '/includes/functions.php';


// load our environment
function _manually_load_environment() {
	switch_theme( ODPCH_THEME );

	$plugins_to_activate = array(
		ODPCH_PLUGIN_DIR . '/tyk-dev-portal/tyk_dev_portal.php'
	);

	update_option( 'active_plugins', $plugins_to_activate );
	// include the file to activate plugin
	foreach ($plugins_to_activate as $plugin) {
		require_once $plugin;
	}
}

tests_add_filter( 'muplugins_loaded', '_manually_load_environment' );

require $_tests_dir . '/includes/bootstrap.php';
