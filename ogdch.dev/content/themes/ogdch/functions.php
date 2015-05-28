<?php


// =======================================================================//
// Frontend Includes
// =======================================================================//

$frontend_includes = array(
	'assets/php/init.php',
	'assets/php/cleanup.php',
	'assets/php/scripts.php',
	'assets/php/actions.php',
	'assets/php/filters.php',
	'assets/php/shortcodes.php',
	'assets/php/walker.php',
	'assets/php/theme_functions.php',
	'assets/php/widgets.php',
	'assets/php/ajax.php',
);

foreach ( $frontend_includes as $file ) {
	if ( !$filepath = locate_template( $file ) ) {
		trigger_error( sprintf( __( 'Error locating %s for inclusion', 'ogdch' ), $file ), E_USER_ERROR );
	}
	require_once $filepath;
}
unset( $file, $filepath );


// =======================================================================//
// Only Backend Includes
// =======================================================================//

/*if ( is_admin() ) {

	$backend_includes = array(
		'assets/php/backend/filters.php',             // Admin Filters
		'assets/php/backend/scripts_backend.php',     // Admin Scripts / CSS
		'assets/php/backend/custom_field_types.php',  // Custom Field Types
		'assets/php/backend/custom_fields.php',       // Custom Fields / Metaboxes
		'assets/php/backend/admin_cols.php',          // Admin Columns
		'assets/php/backend/dashboard_widgets.php',   // Dashboard
		'assets/php/backend/user_fields.php',         // Custom Fields in User Edit
		'assets/php/backend/caps.php',                // Caps for Post Types
		'assets/php/backend/wysiwyg.php'
	);

	foreach ( $backend_includes as $file ) {
		if ( !$filepath = locate_template( $file ) ) {
			trigger_error( sprintf( __( 'Error locating %s for inclusion', 'ogdch' ), $file ), E_USER_ERROR );
		}
		require_once $filepath;
	}
	unset( $file, $filepath );
}*/