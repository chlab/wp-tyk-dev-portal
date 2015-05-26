<?php
/**
 * Plugin Name: ODGch App Directory
 * Description: Adds CKAN-Dataset Post-Type
 * Author: Team Jazz <bart@liip.ch>
 * Version: 1.0
 * Date: 21.05.2015
 */

function register_ckan_post_type() {

	$labels  = array(
		'name'               => _x( 'CKAN Datasets', 'Post Type General Name', 'ogdch' ),
		'singular_name'      => _x( 'CKAN Dataset', 'Post Type Singular Name', 'ogdch' ),
		'menu_name'          => __( 'CKAN Data', 'ogdch' ),
		'name_admin_bar'     => __( 'CKAN Data', 'ogdch' ),
		'parent_item_colon'  => __( 'Parent Dataset:', 'ogdch' ),
		'all_items'          => __( 'All Datasets', 'ogdch' ),
		'add_new_item'       => __( 'Add New Dataset', 'ogdch' ),
		'add_new'            => __( 'Add New', 'ogdch' ),
		'new_item'           => __( 'New Dataset', 'ogdch' ),
		'edit_item'          => __( 'Edit Dataset', 'ogdch' ),
		'update_item'        => __( 'Update Dataset', 'ogdch' ),
		'view_item'          => __( 'View Dataset', 'ogdch' ),
		'search_items'       => __( 'Search Dataset', 'ogdch' ),
		'not_found'          => __( 'Not found', 'ogdch' ),
		'not_found_in_trash' => __( 'Not found in Trash', 'ogdch' ),
	);
	$rewrite = array(
		'slug'       => 'dataset',
		'with_front' => true,
		'pages'      => true,
		'feeds'      => true,
	);
	$args    = array(
		'label'               => __( 'CKAN', 'ogdch' ),
		'description'         => __( 'Contains Data from the CKAN Instance', 'ogdch' ),
		'labels'              => $labels,
		'supports'            => array( 'title', 'editor', 'thumbnail', ),
		'hierarchical'        => false,
		'public'              => true,
		'show_ui'             => true,
		'show_in_menu'        => true,
		'menu_position'       => 5,
		'menu_icon'           => 'dashicons-category',
		'show_in_admin_bar'   => true,
		'show_in_nav_menus'   => true,
		'can_export'          => true,
		'has_archive'         => true,
		'exclude_from_search' => false,
		'publicly_queryable'  => true,
		'rewrite'             => $rewrite,
		'capability_type'     => 'page',
	);
	register_post_type( 'ckan-dataset', $args );
}

add_action( 'init', 'register_ckan_post_type', 0 );


function ckan_dataset_fields() {

	$prefix = '_ckandataset_';

	$cmb = new_cmb2_box( array(
		'id'           => 'ckan-dataset-box',
		'title'        => __( 'CKAN Data', 'ogdch' ),
		'object_types' => array( 'ckan-dataset', ),
		'context'      => 'normal',
		'priority'     => 'high',
		'show_names'   => true,
	) );

	$cmb->add_field( array(
		'name' => 'CKAN Ref. ID',
		'id'   => $prefix . 'reference',
		'type' => 'ref_field',
		'desc' => 'Ref. ID from CKAN',
	) );


}

add_action( 'cmb2_init', 'ckan_dataset_fields' );

/* Render Callback for Ref. Field (renders read only field) */
function cmb2_render_callback_ref_field( $field, $escaped_value, $object_id, $object_type, $field_type_object ) {
	echo $field_type_object->input( array( 'type' => 'text', 'disabled' => true ) );
}

add_action( 'cmb2_render_ref_field', 'cmb2_render_callback_ref_field', 10, 5 );

/* Santize Callback for Ref. Field */
function cmb2_sanitize_ref_field_callback( $override_value, $value ) {
	return $value;
}

add_filter( 'cmb2_sanitize_ref_field', 'cmb2_sanitize_ref_field_callback', 10, 2 );
