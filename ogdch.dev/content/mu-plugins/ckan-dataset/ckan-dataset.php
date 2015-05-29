<?php
/**
 * Plugin Name: ODGch App Directory
 * Description: Adds CKAN-Dataset Post-Type
 * Author: Team Jazz <bart@liip.ch>
 * Version: 1.0
 * Date: 21.05.2015
 */

// ===================================================
// Register Post Type
// ===================================================

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


// ===================================================
// Define CMB2 fields for Post Type
// ===================================================

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
		'type' => 'text',
		'desc' => 'Ref. ID from CKAN',
		//'attributes' => array( 'disabled' => true )
	) );

	$cmb->add_field( array(
		'name' => 'CKAN Name',
		'id'   => $prefix . 'name',
		'type' => 'text',
		'desc' => 'Name from CKAN',
		//'attributes' => array( 'disabled' => true )
	) );

	$cmb->add_field( array(
		'name' => 'CKAN Request Time',
		'id'   => $prefix . 'last_request',
		'type' => 'text',
		'desc' => 'CKAN Last Request Time',
		//'attributes' => array( 'disabled' => true )
	) );

	$cmb->add_field( array(
		'name' => 'CKAN JSON Response',
		'id'   => $prefix . 'response',
		'type' => 'textarea',
		'desc' => 'CKAN Response as JSON',
		//'attributes' => array( 'disabled' => true )
	) );

}

add_action( 'cmb2_init', 'ckan_dataset_fields' );


// ===================================================
// Get JSON Data from Single CKAN Entry
// ===================================================

function get_ckan_dataset( $ID = 0, $ckan_name ) {
	if ( false === ( $response = get_transient( 'ckan_data_' . $ckan_name ) ) ) {
		$response = get_post_meta( get_ckan_dataset_master( $ID ), '_ckandataset_response', true );
		set_transient( 'ckan_data_' . $ckan_name, $response, 60 );
	}

	return $response;
}

function get_ckan_dataset_master( $ID ) {
	$term            = wp_get_post_terms( $ID, 'post_translations' );
	$post_connection = unserialize( $term[0]->description );

	return $post_connection['de'];
}


// Get the JSON (Only called by RabbitMq Reader)
function ckan_dataset_get_single_json( $ID = 0, $ckan_name ) {
	// If WP ID is 0 or not numeric
	if ( $ID == 0 || ! is_numeric( $ID ) ) {
		return;
	}

	// Get CKAN API Response
	$endpoint = CKAN_API_ENDPOINT . 'action/package_show?id=' . $ckan_name;
	$response = wp_remote_get( $endpoint );

	return $response;
}


// Save JSON in Meta Field from the belonging WP Entry nad Cache Response Body
function ckan_dataset_save_single_json( $ID = 0, $response, $ckan_name ) {

	// If WP ID is 0 or not numeric
	if ( $ID == 0 || ! is_numeric( $ID ) ) {
		return;
	}

	// If Response is not a Array
	if ( ! is_array( $response ) ) {
		return;
	}

	$res = json_decode( $response['body'] );

	if ( $res->success == false ) {
		return;
	}


	// Set Cache
	delete_transient( 'ckan_data_' . $ckan_name );
	set_transient( 'ckan_data_' . $ckan_name, $response['body'], 60 );

	update_post_meta( $ID, '_ckandataset_last_request', $response['headers']['date'] );
	update_post_meta( $ID, '_ckandataset_response', $response['body'] );
}
