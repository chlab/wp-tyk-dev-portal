<?php

class CkanBackendHelperTest extends WP_UnitTestCase {
	function test_construction_of_helper() {
		$helper = new Ckan_Backend_Helper();
		$this->assertInstacneOf( 'Ckan_Backend_Helper', $helper );
	}
}

