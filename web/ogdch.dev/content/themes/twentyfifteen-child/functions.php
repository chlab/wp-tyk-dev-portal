<?php

/**
 * Add login/logout/register links to main nav depending on logged-in state
 * 
 * @param string $items
 * @param array $args
 * @return string
 */
function add_login_logout_register_menu( $items, $args ) {
	if ( $args->theme_location != 'primary' ) {
		return $items;
	}
 
	if ( is_user_logged_in() ) {
		$items .= '<li><a href="' . wp_logout_url() . '">' . __( 'Log Out' ) . '</a></li>';
	} else {
		$items .= '<li><a href="' . wp_login_url() . '">' . __( 'Login In' ) . '</a></li>';
		$items .= '<li><a href="' . wp_registration_url() . '">' . __( 'Sign Up' ) . '</a></li>';
	}
 
	return $items;
}
 
// add_filter( 'wp_nav_menu_items', 'add_login_logout_register_menu', 199, 2 );

/**
 * Add bootstrap
 *
 * @return void
 */
function add_theme_style() {
  wp_enqueue_style( 'bootstrap', 'https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css' );
}
add_action( 'wp_enqueue_scripts', 'add_theme_style' );


/**
 * Add company field to user profile
 * 
 * @param  array $fields
 * @return array
 */
function modify_profile_fields($fields) {
	$fields['company'] = 'Company';
	return $fields;
}
add_filter('user_contactmethods', 'modify_profile_fields');

/**
 * Add Piwik script
 */
function add_piwik_code() {
    if (!defined('PIWIK_URL')) {
    	return;
    }
    
    $piwik_siteid = 0;
    if ( defined( 'PIWIK_SITEID' ) && is_int( PIWIK_SITEID ) ) {
        $piwik_siteid = PIWIK_SITEID;
    }
    ?>
    <!-- Piwik -->
    <script type="text/javascript">
        var _paq = _paq || [];
        _paq.push(['trackPageView']);
        _paq.push(['enableLinkTracking']);
        (function() {
            var u="//<?php echo esc_attr( PIWIK_URL ); ?>/";
            _paq.push(['setTrackerUrl', u+'piwik.php']);
            _paq.push(['setSiteId', <?php echo intval( $piwik_siteid ); ?>]);
            var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
            g.type='text/javascript'; g.async=true; g.defer=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
        })();
    </script>
    <noscript><p><img src="//<?php echo esc_attr( PIWIK_URL ); ?>/piwik.php?idsite=<?php echo intval( $piwik_siteid ); ?>" style="border:0;" alt="" /></p></noscript>
    <!-- End Piwik Code -->
    <?php
}

add_action( 'wp_footer', 'add_piwik_code' );
