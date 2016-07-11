<?php

class EnvironmentTest extends WP_UnitTestCase {
	// assert that our theme is active
	function testTheme() {
		$theme = wp_get_theme();
		$this->assertEquals($theme->stylesheet, ODPCH_THEME);
	}

	// assert that our plugin is activated
	function assertPluginsActive() {
		$this->assertTrue(is_plugin_active( 'tyk-dev-portal/tyk_dev_portal.php' ));
	}
}