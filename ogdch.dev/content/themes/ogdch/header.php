<!DOCTYPE html>
<!--[if IE 7]>
<html class="ie ie7" <?php language_attributes(); ?>><![endif]-->
<!--[if IE 8]>
<html class="ie ie8" <?php language_attributes(); ?>><![endif]-->
<!--[if IE 9]>
<html class="ie ie9" <?php language_attributes(); ?>><![endif]-->
<!--[if !IE]><!-->
<html <?php language_attributes(); ?>><!--<![endif]-->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width">
	<title><?php wp_title( '|', true, 'right' ); ?></title>

	<?php wp_head(); ?>
</head>

<body <?php body_class(); ?>>

<?php
wp_nav_menu( array(
	'theme_location' => 'service_navigation',
	'container'      => '',
	'menu_class'     => '',
	'items_wrap'     => '%3$s',
) );
?>