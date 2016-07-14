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
 
add_filter( 'wp_nav_menu_items', 'add_login_logout_register_menu', 199, 2 );

/**
 * Add bootstrap
 *
 * @return void
 */
function add_theme_style() {
  wp_enqueue_style( 'bootstrap', 'https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css' );
}
add_action( 'wp_enqueue_scripts', 'add_theme_style' );