<?php

class OptionsTest extends WP_UnitTestCase {
	function test_of_get_option_with_new_option() {
		$option = of_get_option( 'test_option', 'default value' );
		$this->assertEquals( 'default value', $option );
	}

	function test_of_get_option_with_existing_option() {
		add_option( 'optionsframework', array( 'id' => 'livejobs_b2c' ) );
		add_option( 'livejobs_b2c', array( 'footer_text' => 'Test Footer' ) );

		$option = of_get_option( 'footer_text', 'Default Footer' );
		$this->assertEquals( 'Test Footer', $option );
	}
}

