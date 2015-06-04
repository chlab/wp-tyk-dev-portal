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
		'with_front' => false,
		'pages'      => true,
		'feeds'      => true,
	);
	$args    = array(
		'label'               => __( 'CKAN', 'ogdch' ),
		'description'         => __( 'Contains Data from the CKAN Instance', 'ogdch' ),
		'labels'              => $labels,
		'supports'            => array( 'title', 'editor', 'thumbnail', 'comments' ),
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
 * Stores a CKAN api response in database.
 *
 * @param array $ckan_dataset
 * @param string $ckan_id
 *
 * @return bool Returns true if data storing was successful.
 */
function ckan_dataset_save_single_json( $ckan_dataset, $ckan_id ) {
	// Check if response is not an array
	if ( ! is_array( $ckan_dataset ) ) {
		return false;
	}

	// Check if response body is a valid JSON
	$ckan_dataset_body_raw = $ckan_dataset['body'];
	$ckan_dataset_body     = json_decode( $ckan_dataset_body_raw, true );
	if ( ! $ckan_dataset_body || $ckan_dataset_body['success'] === false ) {
		return false;
	}

	// Gather data
	$langugages_todo           = array( 'en', 'de', 'fr', 'it' );
	$translations              = array();
	$request_date              = $ckan_dataset['headers']['date'];
	$ckan_dataset_result       = $ckan_dataset_body['result'];
	$ckan_dataset_name         = $ckan_dataset_result['name'];
	$ckan_dataset_organisation = $ckan_dataset_result['organization'];
	$ckan_dataset_groups       = $ckan_dataset_result['groups'];
	$ckan_dataset_data         = ckan_dataset_prepare_data( $ckan_dataset_result );

	$organisation_id = false;
	if ( is_array( $ckan_dataset_organisation ) && ! empty( $ckan_dataset_organisation['name'] ) ) {
		$organisation_id = ckan_dataset_get_organisation_id_by_slug( $ckan_dataset_organisation['name'] );
	}
	$group_ids = array();
	if ( is_array( $ckan_dataset_groups ) ) {
		foreach ( $ckan_dataset_groups as $group ) {
			$group_id = ckan_dataset_get_group_id_by_slug( $group['name'] );
			if ( $group_id ) {
				$group_ids[] = $group_id;
			}
		}
	}

	$post_ids = ckan_dataset_get_posts_by_ckanid( $ckan_id, 'ids' );

	// If posts already exist -> update
	if ( count( $post_ids ) > 0 ) {
		foreach ( $post_ids as $post_id ) {
			$post_language = pll_get_post_language( $post_id );
			$data          = $ckan_dataset_data[ $post_language ];

			if ( ! ckan_dataset_has_data( $data ) ) {
				$data = ckan_dataset_get_data_in_different_language( $ckan_dataset_data );
			}
			$name = $post_language . '-' . $ckan_dataset_name;
			ckan_dataset_update_post( $post_id, $ckan_id, $data, $name, $request_date, $ckan_dataset_body_raw, $organisation_id, $group_ids );
			$translations[ $post_language ] = $post_id;

			// Remove current language from array
			if ( ( $key = array_search( $post_language, $langugages_todo ) ) !== false ) {
				unset( $langugages_todo[ $key ] );
			}
		}
	}

	// Create new posts for all remaining translations
	foreach ( $langugages_todo as $language ) {
		$data = $ckan_dataset_data[ $language ];
		if ( ! ckan_dataset_has_data( $data ) ) {
			$data = ckan_dataset_get_data_in_different_language( $ckan_dataset_data );
		}
		$name                      = $language . '-' . $ckan_dataset_name;
		$new_id                    = ckan_dataset_insert_post( $ckan_id, $data, $name, $request_date, $ckan_dataset_body_raw, $organisation_id, $group_ids, $language );
		$translations[ $language ] = $new_id;
	}

	pll_save_post_translations( $translations );

	return true;
}

/**
 * Deletes all posts for given ckanid.
 *
 * @param string $ckan_id
 *
 * @return int Returns count of deleted entries.
 */
function ckan_dataset_delete_posts_by_ckanid( $ckan_id ) {
	$post_ids = ckan_dataset_get_posts_by_ckanid( $ckan_id, 'ids' );

	$first_post_id = reset( $post_ids );
	ckan_dataset_delete_post_translations( $first_post_id );

	foreach ( $post_ids as $post_id ) {
		ckan_dataset_delete_post( $post_id );
	}

	return count( $post_ids );
}

/**
 * Updates all posts for given ckanid by getting data from CKAN api.
 *
 * @param string $ckan_id
 *
 * @return bool Returns true if no error occurs while updating.
 */
function ckan_dataset_update_posts_by_ckanid( $ckan_id ) {
	$ckan_dataset = ckan_dataset_get_single_json( $ckan_id );

	return ckan_dataset_save_single_json( $ckan_dataset, $ckan_id );
}

/**
 * Gets posts for given ckanid from database.
 * If $fields parameter is empty all fields are returned.
 *
 * @param string $ckan_id
 * @param string $fields
 *
 * @return array List of posts.
 */
function ckan_dataset_get_posts_by_ckanid( $ckan_id, $fields = '' ) {
	$args = array(
		'meta_key'      => '_ckandataset_reference',
		'meta_value'    => $ckan_id,
		'meta_compare'  => '=',
		'post_type'     => 'ckan-dataset',
		'cache_results' => false,
		'fields'        => $fields,
		'post_status'   => 'any',
		'lang'          => '', // Leave empty to query all languages
		'nopaging'      => true // disable paging
	);

	return get_posts( $args );
}

/**
 * Delete translation entry of post in term table.
 *
 * @param int $post_id
 */
function ckan_dataset_delete_post_translations( $post_id ) {
	$taxonomy       = 'post_translations';
	$args           = array( 'fields' => 'ids' );
	$post_terms_ids = wp_get_post_terms( $post_id, $taxonomy, $args );
	foreach ( $post_terms_ids as $term_id ) {
		echo "DELETE term " . $term_id . "\n";
		wp_delete_term( $term_id, $taxonomy );
	}
}

/**
 * Get organisation id by slug
 *
 * @param string $organisation_slug
 *
 * @return bool|int Returns id of found organisation / false if organisation was not found
 */
function ckan_dataset_get_organisation_id_by_slug( $organisation_slug ) {
	$organisation = get_term_by( 'slug', $organisation_slug, 'ckan_organisation' );
	if ( ! $organisation ) {
		echo "ERROR: Organisation " . $organisation_slug . " does not exist\n";

		return false;
	}

	return (int) $organisation->term_id;
}

/**
 * Adds organisation to given post
 *
 * @param int $post_id
 * @param int $organisation_id
 *
 * @return bool
 */
function ckan_dataset_add_organisation_to_post( $post_id, $organisation_id ) {
	if ( $post_id == 0 || $organisation_id == 0 ) {
		return false;
	}
	$organisation_add_success = wp_set_object_terms( $post_id, $organisation_id, 'ckan_organisation' );
	if ( is_wp_error( $organisation_add_success ) || ! is_array( $organisation_add_success ) ) {
		echo "ERROR: Failed inserting organisation " . $organisation_id . "\n";
	}

	return true;
}

/**
 * Get group id by slug
 *
 * @param string $group_slug
 *
 * @return bool|int Returns id of found group / false if group was not found
 */
function ckan_dataset_get_group_id_by_slug( $group_slug ) {
	$group = get_term_by( 'slug', $group_slug, 'ckan_group' );
	if ( ! $group ) {
		echo "ERROR: Group " . $group_slug . " does not exist\n";

		return false;
	}

	return (int) $group->term_id;
}

/**
 * Adds groups to given post
 *
 * @param int $post_id
 * @param array $group_ids
 *
 * @return bool
 */
function ckan_dataset_add_groups_to_post( $post_id, $group_ids ) {
	if ( $post_id == 0 || empty ( $group_ids ) ) {
		return false;
	}
	$groups_add_success = wp_set_object_terms( $post_id, $group_ids, 'ckan_group' );
	if ( is_wp_error( $groups_add_success ) || ! is_array( $groups_add_success ) ) {
		echo "ERROR: Failed inserting groups " . implode( ',', $group_ids ) . "\n";
	}

	return true;
}

/**
 * Adds new dataset post to database
 *
 * @param string $ckan_id
 * @param array $data
 * @param string $name
 * @param string $request_date
 * @param string $response
 * @param int $organisation_id
 * @param array $group_ids
 * @param string $language
 *
 * @return int|WP_Error
 */
function ckan_dataset_insert_post( $ckan_id, $data, $name, $request_date, $response, $organisation_id, $group_ids, $language ) {
	$post   = array(
		'post_content' => $data['description'],
		'post_name'    => $name,
		'post_title'   => $data['title'],
		'post_type'    => 'ckan-dataset',
		'post_author'  => 1,
		'post_status'  => 'publish',
	);
	$new_id = wp_insert_post( $post, true );
	echo "INSERT post " . $new_id . ' / title ' . $post['post_title'] . "\n";
	if ( is_wp_error( $new_id ) ) {
		echo "Something went wrong while inserting post " . implode( ',', $post );

		return false;
	}
	add_post_meta( $new_id, '_ckandataset_reference', $ckan_id, true );
	add_post_meta( $new_id, '_ckandataset_last_request', $request_date );
	add_post_meta( $new_id, '_ckandataset_response', $response );
	if ( $organisation_id ) {
		ckan_dataset_add_organisation_to_post( $new_id, $organisation_id );
	}
	if ( ! empty ( $group_ids ) ) {
		ckan_dataset_add_groups_to_post( $new_id, $group_ids );
	}
	pll_set_post_language( $new_id, $language );  // Set Langauge

	return $new_id;
}

/**
 * Updates dataset post in database
 *
 * @param int $post_id
 * @param string $ckan_id
 * @param array $data
 * @param string $name
 * @param string $request_date
 * @param string $response
 * @param int $organisation_id
 * @param array $group_ids
 *
 * @return int|WP_Error
 */
function ckan_dataset_update_post( $post_id, $ckan_id, $data, $name, $request_date, $response, $organisation_id, $group_ids ) {
	$post = array(
		'ID'         => $post_id,
		'post_name'  => $name,
		'post_title' => $data['title']
	);
	echo "UPDATE post " . $post_id . ' / new title: ' . $post['post_title'] . "\n";
	$update_success = wp_update_post( $post, true );
	if ( is_wp_error( $update_success ) ) {
		echo "Something went wrong while updating post " . $post_id;

		return false;
	}
	update_post_meta( $post_id, '_ckandataset_reference', $ckan_id, true );
	update_post_meta( $post_id, '_ckandataset_last_request', $request_date );
	update_post_meta( $post_id, '_ckandataset_response', $response );
	if ( $organisation_id ) {
		ckan_dataset_add_organisation_to_post( $post_id, $organisation_id );
	}
	if ( ! empty ( $group_ids ) ) {
		ckan_dataset_add_groups_to_post( $post_id, $group_ids );
	}

	return $post_id;
}

/**
 * Deletes dataset post
 *
 * @param $post_id
 *
 * @return array|bool|WP_Post False on failure.
 */
function ckan_dataset_delete_post( $post_id ) {
	echo "DELETE post " . $post_id . "\n";

	return wp_delete_post( $post_id, true );
}

/**
 * Reformat ckan data to array with the following structure:
 *
 * array(
 *      'en' => array( 'title' => 'Title EN', ... ),
 *      'de' => array( 'title' => 'Titel DE', ... ),
 *      'fr' => array( 'title' => 'Titre FR', ... ),
 *      'it' => array( 'title' => 'Titolo IT', ... )
 * )
 *
 * @param array $raw_data
 *
 * @return array
 */
function ckan_dataset_prepare_data( $raw_data ) {
	// TODO: implement and remove mock data
	return array(
		'en' => array(
			'title'       => 'My dataset',
			'description' => 'My long description'
		),
		'de' => array(
			'title'       => 'Mein Datensatz',
			'description' => 'Meine lange Beschreibung'
		),
		'fr' => array(
			'title'       => '',
			'description' => ''
		),
		'it' => array(
			'title'       => 'Mammamia! Datensatz',
			'description' => 'Babedi bubedi'
		)
	);
}

/**
 * Returns data from different language (according to $language_priority array)
 *
 * @param array $ckan_dataset_data
 *
 * @return array|bool Array with data if data in different language found. False if no data is found.
 */
function ckan_dataset_get_data_in_different_language( $ckan_dataset_data ) {
	global $language_priority;
	foreach ( $language_priority as $language ) {
		$data = $ckan_dataset_data[ $language ];
		if ( ckan_dataset_has_data( $data ) ) {
			return $data;
		}
	}

	return false;
}

/**
 * Tells if data is available in given array
 *
 * @param array $data
 *
 * @return bool
 */
function ckan_dataset_has_data( $data ) {
	// TODO: assumption -> empty title means no translation available
	$key_field = 'title';

	return is_array( $data ) && array_key_exists( $key_field, $data ) && ( ! empty( $data[ $key_field ] ) );
}