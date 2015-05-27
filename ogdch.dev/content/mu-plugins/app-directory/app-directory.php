<?php
/**
 * Plugin Name: ODGch App Directory
 * Description: Adds App Post-Type
 * Author: Team Jazz <bart@liip.ch>
 * Version: 1.0
 * Date: 21.05.2015
 */

function register_app_post_type() {

	$labels = array(
		'name'                => _x( 'Apps', 'Post Type General Name', 'ogdch' ),
		'singular_name'       => _x( 'App', 'Post Type Singular Name', 'ogdch' ),
		'menu_name'           => __( 'Apps', 'ogdch' ),
		'name_admin_bar'      => __( 'Apps', 'ogdch' ),
		'parent_item_colon'   => __( 'Parent App:', 'ogdch' ),
		'all_items'           => __( 'All Apps', 'ogdch' ),
		'add_new_item'        => __( 'Add New App', 'ogdch' ),
		'add_new'             => __( 'Add New', 'ogdch' ),
		'new_item'            => __( 'New Item', 'ogdch' ),
		'edit_item'           => __( 'Edit Item', 'ogdch' ),
		'update_item'         => __( 'Update Item', 'ogdch' ),
		'view_item'           => __( 'View Item', 'ogdch' ),
		'search_items'        => __( 'Search Item', 'ogdch' ),
		'not_found'           => __( 'Not found', 'ogdch' ),
		'not_found_in_trash'  => __( 'Not found in Trash', 'ogdch' ),
	);
	$rewrite = array(
		'slug'                => 'apps',
		'with_front'          => true,
		'pages'               => true,
		'feeds'               => true,
	);
	$args = array(
		'label'               => __( 'Apps', 'ogdch' ),
		'description'         => __( 'The App directory', 'ogdch' ),
		'labels'              => $labels,
		'supports'            => array( 'title', 'editor', 'thumbnail', ),
		'hierarchical'        => false,
		'public'              => true,
		'show_ui'             => true,
		'show_in_menu'        => true,
		'menu_position'       => 5,
		'menu_icon'           => 'dashicons-smartphone',
		'show_in_admin_bar'   => true,
		'show_in_nav_menus'   => true,
		'can_export'          => true,
		'has_archive'         => true,
		'exclude_from_search' => false,
		'publicly_queryable'  => true,
		'rewrite'             => $rewrite,
		'capability_type'     => 'page',
	);
	register_post_type( 'app', $args );

}

add_action( 'init', 'register_app_post_type', 0 );

/**
 * Define the metabox and field configurations.
 */
function cmb2_app_metaboxes() {

	// Start with an underscore to hide fields from custom fields list
	$prefix = '_app_';

	/**
	 * Initiate the metabox
	 */
	$cmb = new_cmb2_box( array(
		'id'            => 'app_metabox',
		'title'         => __( 'App Information', 'cmb2' ),
		'object_types'  => array( 'app', ), // Post type
		'context'       => 'normal',
		'priority'      => 'high',
		'show_names'    => true, // Show field names on the left
	) );

	// URL
	$cmb->add_field( array(
		'name' => __( 'URL', 'cmb2' ),
		'desc' => __( 'Landing page of app', 'cmb2' ),
		'id'   => $prefix . 'url',
		'type' => 'text_url',
		'protocols' => array( 'http', 'https' ), // Array of allowed protocols
		'attributes'  => array(
			'placeholder' => 'http://myapp.io',
			'rows'        => 3,
			'required'    => 'required',
		),
	) );

	// Author Name
	$cmb->add_field( array(
		'name'       => __( 'Author Name', 'cmb2' ),
		'id'         => $prefix . 'author_name',
		'type'       => 'text',
		'attributes'  => array(
			'required'    => 'required',
		),
	) );

	// Author Email
	$cmb->add_field( array(
		'name' => __( 'Author Email', 'cmb2' ),
		'desc' => __( 'Email address of author', 'cmb2' ),
		'id'   => $prefix . 'author_email',
		'type' => 'text_email',
		'attributes'  => array(
			'placeholder' => 'author@app.dev',
			'required'    => 'required',
		),
	) );

	// Version
	$cmb->add_field( array(
		'name'       => __( 'Version', 'cmb2' ),
		'id'         => $prefix . 'version',
		'type'       => 'text_small',
		'attributes'  => array(
			'placeholder' => '1.2.0',
		),
	) );


	// Icon
	$cmb->add_field( array(
		'name'       => __( 'Icon', 'cmb2' ),
		'id'         => $prefix . 'icon',
		'type'       => 'file',
	) );

}

add_action( 'cmb2_init', 'cmb2_app_metaboxes' );