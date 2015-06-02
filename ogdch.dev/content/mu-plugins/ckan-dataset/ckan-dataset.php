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
		'name'       => 'CKAN Ref. ID',
		'id'         => $prefix . 'reference',
		'type'       => 'text',
		'desc'       => 'Ref. ID from CKAN',
		'attributes' => array( 'disabled' => true )
	) );

	$cmb->add_field( array(
		'name'       => 'CKAN Request Time',
		'id'         => $prefix . 'last_request',
		'type'       => 'text',
		'desc'       => 'CKAN Last Request Time',
		'attributes' => array( 'disabled' => true )
	) );

	$cmb->add_field( array(
		'name'       => 'CKAN JSON Response',
		'id'         => $prefix . 'response',
		'type'       => 'textarea',
		'desc'       => 'CKAN Response as JSON',
		'attributes' => array( 'disabled' => true )
	) );

}

add_action( 'cmb2_init', 'ckan_dataset_fields' );


// ===================================================
// CKAN Dataset Functions
// ===================================================

/**
 * Get a CKAN Dataset from WP
 * Gets the JSON Repsonse from CKAN but from the WP Instance. If it's not in Cache get it from DB and cache again.
 */
function get_ckan_dataset( $ID = 0, $ckan_name ) {
	if ( false === ( $response = get_transient( 'ckan_data_' . $ckan_name ) ) ) {
		$response = get_post_meta( get_ckan_dataset_master( $ID ), '_ckandataset_response', true );
		set_transient( 'ckan_data_' . $ckan_name, $response, 60 );
	}

	return $response;
}


/**
 * Get the parent dataset of a dataset
 * Gets the 'post_translation' term, unserializes it and returns the german post ID
 */
function get_ckan_dataset_master( $ID ) {
	$term            = wp_get_post_terms( $ID, 'post_translations' );
	$post_connection = unserialize( $term[0]->description );

	return $post_connection['de'];
}


/**
 * Get the JSON (Only called by RabbitMQ Reader)
 * Makes a request to the CKAN Instance and returns the JSON repsonse (ckan_dataset_save_single_json() should be called after that)
 */
function ckan_dataset_get_single_json( $ckan_id ) {
	// Get CKAN API Response
	$endpoint = CKAN_API_ENDPOINT . 'action/package_show?id=' . $ckan_id;
	$response = wp_remote_get( $endpoint );

	return $response;
}


/**
 * Save JSON in Meta Field from the belonging WP Entry nad Cache Response Body
 * Saves the Request Body (JSON) in acustom Field of the belonging WP entry and puts it into the Cache
 */
function ckan_dataset_save_single_json( $ckan_dataset, $ckan_id ) {

	$translations = array();

	// If Response is not a Array
	if ( ! is_array( $ckan_dataset ) ) {
		return;
	}

	// Check if response is valid JSON
	$ckan_dataset_body = json_decode( $ckan_dataset['body'], true );

	if ( !$ckan_dataset_body || $ckan_dataset_body['success'] === false ) {
		return;
	}

	$ckan_dataset_result = $ckan_dataset_body['result'];
	$ckan_dataset_title = $ckan_dataset_result['title'];

	// TODO: remove this lines when ckanext-fluent plugin is active
	$ckan_dataset_title = array(
		'en' => 'My Dataset',
		'de' => 'Mein Datensatz',
		'fr' => '', // TODO: assumption -> empty title means no translation available
		'it' => 'Mammamia! Datensatz'
	);

	$posts_ids = ckan_dataset_get_posts_by_ckanid($ckan_id, 'ids');

	// check if all languages are empty
	if(!(array_filter($ckan_dataset_title))) {
		$first_post_id = reset($posts_ids);
		ckan_dataset_delete_post_translations($first_post_id);
	}

	// TODO: What are we doing with this transient?
	delete_transient( 'ckan_data_' . $ckan_id );
	set_transient( 'ckan_data_' . $ckan_id, $ckan_dataset['body'], 60 );

	// if posts already exist -> update
	if(count($posts_ids) > 0) {
		foreach($posts_ids as $post_id) {
			$post_language = pll_get_post_language($post_id);
			$title = $ckan_dataset_title[$post_language];
			if(empty($title)) {
				// delete post if translation doesn't exist anymore
				echo "DELETE post " . $post_id . "\n";
				wp_delete_post( $post_id, true );
			} else {
				// update post
				$post = array(
					'post_title'  => $title
				);
				echo "UPDATE post " . $post_id . ' / new title: ' . $post['post_title'] . "\n";
				wp_update_post( $post, true );
				update_post_meta( $post_id, '_ckandataset_reference', $ckan_id, true );
				update_post_meta( $post_id, '_ckandataset_last_request', $ckan_dataset['headers']['date'] );
				$translations[ $post_language ] = $post_id;
			}
			// remove current language from array
			if(array_key_exists($post_language, $ckan_dataset_title)) {
				unset($ckan_dataset_title[$post_language]);
			}
		}
	}

	// create new posts for all remaining translations
	foreach($ckan_dataset_title as $lang => $title) {
		if(!empty($title)) {
			$post = array(
				'post_author' => 1,
				'post_type'   => 'ckan-dataset',
				'post_title'  => $title,
				'post_status' => 'publish',
			);
			echo "INSERT " . $post['post_title'] . "\n";
			$new_id = wp_insert_post( $post, true );
			add_post_meta( $new_id, '_ckandataset_reference', $ckan_id, true );
			add_post_meta( $new_id, '_ckandataset_last_request', $ckan_dataset['headers']['date'] );
			add_post_meta( $new_id, '_ckandataset_response', $ckan_dataset['body'] );
			pll_set_post_language( $new_id, $lang );  // Set Langauge
			$translations[ $lang ] = $new_id;
		}
	}

	pll_save_post_translations( $translations );

	return TRUE;
}

function ckan_dataset_delete_posts_by_ckanid($ckan_id) {
	$posts_ids = ckan_dataset_get_posts_by_ckanid($ckan_id, 'ids');

	$first_post_id = reset($posts_ids);
	ckan_dataset_delete_post_translations($first_post_id);

	foreach($posts_ids as $post_id) {
		echo "DELETE post " . $post_id . "\n";
		wp_delete_post( $post_id, true );
	}

	return count($posts_ids);
}

function ckan_dataset_update_posts_by_ckanid($ckan_id) {
	$ckan_dataset = ckan_dataset_get_single_json( $ckan_id );
	return ckan_dataset_save_single_json( $ckan_dataset, $ckan_id );
}

function ckan_dataset_get_posts_by_ckanid($ckan_id, $fields = '') {
	$args = array(
		'meta_key'       => '_ckandataset_reference',
		'meta_value'     => $ckan_id,
		'meta_compare'   => '=',
		'post_type'      => 'ckan-dataset',
		'cache_results'  => false,
		'fields'         => $fields,
		'post_status'    => 'any',
		'lang' => '', // Leave empty to query all languages
		'nopaging' => true // disable paging
	);
	return get_posts( $args );
}


function ckan_dataset_delete_post_translations($post_id) {
	$taxonomy = 'post_translations';
	$args = array('fields' => 'ids');
	$post_terms_ids = wp_get_post_terms($post_id, $taxonomy, $args);
	foreach($post_terms_ids as $term_id) {
		echo "DELETE term " . $term_id . "\n";
		return wp_delete_term($term_id, $taxonomy);
	}
}