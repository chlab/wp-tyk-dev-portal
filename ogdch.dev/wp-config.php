<?php
// ===================================================
// Load database info and local development parameters
// ===================================================

if ( ! defined( 'WP_HOME' ) ) {
	define( 'WP_HOME', 'http://' . $_SERVER['HTTP_HOST'] );
}


if ( file_exists( dirname( __FILE__ ) . '/wp-local-config.php' ) ) {
	// Local
	include( dirname( __FILE__ ) . '/wp-local-config.php' );
} elseif ( file_exists( dirname( __FILE__ ) . '/wp-test-config.php' ) ) {
	// Test
	include( dirname( __FILE__ ) . '/wp-test-config.php' );
} else {
	// Live
	include( dirname( __FILE__ ) . '/wp-live-config.php' );
}


// ===================================================
// Table prefix
// ===================================================

$table_prefix = 'ogdch_';


// ===================================================
// Set WP language
// ===================================================

define( 'WPLANG', 'de_DE' );


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

define( 'WP_POST_REVISIONS', 30 );
define( 'AUTOSAVE_INTERVAL', 86400 );

define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );

define( 'WP_ALLOW_REPAIR', true );
define( 'DISALLOW_FILE_EDIT', true );


// ===================================================
// Authentication Unique Keys and Salts.
// ===================================================

define('AUTH_KEY',         'ffFir(Z;glFwc*/<STo+.4t-jQJty`!av<iOY&-mM=rk[-H!mQ~c|X=_1nzMb7Ky');
define('SECURE_AUTH_KEY',  '~XAUdj)T0|>{K5G?uo=a0CA8 4;J/x>V3!e`Bz=NGHD2MH=L.I!j|mS?53J):6;,');
define('LOGGED_IN_KEY',    'VTNPr8- >E=Lv/%+rA!SP0;U9P_MfuFD9+a;+J=r/VFw3|L>ib#_Ap&^Shit1)<}');
define('NONCE_KEY',        '4$+%qQ<Yf{Mzsy5rF->%8LpkvBV&4KsL[2gP,}S}>C%xn$6Bm-bRI<m2y:6C: SE');
define('AUTH_SALT',        ':{y.;s7M MUrw/)F]qSE-jyA5.Qi8z8U:O$f|WdDDKzyiB`aQ+czUS!44e-AggV)');
define('SECURE_AUTH_SALT', 'Hf2[K*Fi}lra6E9[6|+vg5rn9Z|ZtNSK30?{`QdoO0auq@g,sro5da%K4d7}4{AI');
define('LOGGED_IN_SALT',   'gqIN+FZ 5+KhW4E-yY8dl|}m`c~^}7$2^Swew9;/J@!!^8kC=iXJ+_ywup@/FD/S');
define('NONCE_SALT',       '9q-$mg]u3Jm+P{5EvKo52SG*(f{?6-]2.j43pq$a 1lsL)2TT^TH1s:i%U)m@<rE');

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