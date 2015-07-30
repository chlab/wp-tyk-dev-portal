<?php

require_once dirname( __FILE__ ) . '/../web/ogdch.dev/wp-unittest-config.php';

$_tests_dir = getenv( 'WP_TESTS_DIR' );
if ( ! $_tests_dir ) {
	$_tests_dir = '/tmp/wordpress-tests-lib';
}

require_once $_tests_dir . '/includes/functions.php';

function _manually_switch_theme() {
	switch_theme( 'wp-ogdch-theme' );
}

tests_add_filter( 'plugins_loaded', '_manually_switch_theme' );

function _manually_load_plugins() {
	require dirname( __FILE__ ) . '/../web/ogdch.dev/content/plugins/wp-ckan-backend/ckan-backend.php';
}
tests_add_filter( 'muplugins_loaded', '_manually_load_plugins' );

require $_tests_dir . '/includes/bootstrap.php';
