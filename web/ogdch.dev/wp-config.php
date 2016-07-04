<?php
// ===================================================
// Load database info and local development parameters
// ===================================================

if ( file_exists( dirname( __FILE__ ) . '/wp-local-config.php' ) ) {
	// Local
	include( dirname( __FILE__ ) . '/wp-local-config.php' );
} elseif ( file_exists( dirname( __FILE__ ) . '/wp-abnahme-config.php' ) ) {
	// Abnahme
	include( dirname( __FILE__ ) . '/wp-abnahme-config.php' );
} elseif ( file_exists( dirname( __FILE__ ) . '/wp-test-config.php' ) ) {
	// Test
	include( dirname( __FILE__ ) . '/wp-test-config.php' );
} elseif ( file_exists( dirname( __FILE__ ) . '/wp-functest-config.php' ) ) {
	// Functional Tests
	include( dirname( __FILE__ ) . '/wp-functest-config.php' );
} else {
	// Live
	include( dirname( __FILE__ ) . '/wp-live-config.php' );
}


// ===================================================
// Table prefix
// ===================================================

$table_prefix = 'odpch_';


// ===================================================
// Give mama some more memory
// ===================================================

define( 'WP_MEMORY_LIMIT', '512M' );


// ===================================================
// Activate compression
// ===================================================

define( 'COMPRESS_CSS', true );
define( 'COMPRESS_SCRIPTS', true );
define( 'ENFORCE_GZIP', true );


// ===================================================
// Some admin tweeks
// ===================================================

define( 'WP_POST_REVISIONS', 0 );
define( 'AUTOSAVE_INTERVAL', 86400 );

define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );

define( 'WP_ALLOW_REPAIR', true );
define( 'DISALLOW_FILE_EDIT', true );

define( 'AUTOMATIC_UPDATER_DISABLED', true );

// ===================================================
// Authentication Unique Keys and Salts.
// ===================================================

define('AUTH_KEY',         'X:t0x>b>,EXj|qhMIi>fz6ND)#4CBE^a6 YrnqY )B~0o@PqB.{^(Tz6-X(OeL!&');
define('SECURE_AUTH_KEY',  'FvYZj 5R}8^)_X##`^L|[WhNUd5bQn<K<yM9-!k_q/0&xrW56~y)[vEVVcDt-0O-');
define('LOGGED_IN_KEY',    'K-7pdPe6+Eg$K.E)b]}@4+V-17TZNj[v8Ad+c#oSN85nz!OLR8<w NoZB6u8Oz#V');
define('NONCE_KEY',        '*bWuRJ`x^I-#Q(wLE=-pdWy-.v&q42EdB}[rPv8LgC|LDBXq|,zw(L%rXDsTTDrj');
define('AUTH_SALT',        'UL!GF[J|+b#d.2<CI>Qc.Hlwnoy0e}f1Ak7Ra9n,1[;*xZ=wVlW<{zm2]8,n5;`X');
define('SECURE_AUTH_SALT', 'uWcc<{[ li3xto4Bv,o41c=j]X{^I8?}_KV:CJ*`{ow^?|iJvmjWhuA`O!O!DPL6');
define('LOGGED_IN_SALT',   'M,vF1J94|OP9b:jJeLJL+jk-x(+Af>V`guE7$}9uD;z_H(1N?k^gZ;*C2B*;JuuA');
define('NONCE_SALT',       '$~gaiKRI3f*#.+#s6N[F|T>Z|8@HeUPG-O,@jBdmn=6@Ii&Yy6K;,&C,Vq+(G-!3');

// ===================================================
// DO NOT EDIT FORM HERE ! ! !
// ===================================================

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );

// Disable XML RPC
add_filter( 'xmlrpc_enabled', '__return_false' );
