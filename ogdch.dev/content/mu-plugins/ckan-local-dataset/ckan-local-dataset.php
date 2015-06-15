<?php
/**
 * Plugin Name: OGDch local CKAN Dataset
 * Description: Adds CKAN-Dataset Post-Type to add posts locally and syncs them to CKAN
 * Author: Team Jazz <bart@liip.ch>
 * Version: 1.0
 * Date: 21.05.2015
 */

// ===================================================
// Register Post Type
// ===================================================

function register_ckan_local_post_type() {

	$labels = array(
		'name'               => __( 'CKAN local Datasets', 'ogdch' ),
		'singular_name'      => __( 'CKAN local Dataset', 'ogdch' ),
		'menu_name'          => __( 'CKAN local Data', 'ogdch' ),
		'name_admin_bar'     => __( 'CKAN local Data', 'ogdch' ),
		'parent_item_colon'  => __( 'Parent Dataset:', 'ogdch' ),
		'all_items'          => __( 'All local Datasets', 'ogdch' ),
		'add_new_item'       => __( 'Add New Dataset', 'ogdch' ),
		'add_new'            => __( 'Add New', 'ogdch' ),
		'new_item'           => __( 'New local Dataset', 'ogdch' ),
		'edit_item'          => __( 'Edit local Dataset', 'ogdch' ),
		'update_item'        => __( 'Update local Dataset', 'ogdch' ),
		'view_item'          => __( 'View Dataset', 'ogdch' ),
		'search_items'       => __( 'Search Dataset', 'ogdch' ),
		'not_found'          => __( 'Not found', 'ogdch' ),
		'not_found_in_trash' => __( 'Not found in Trash', 'ogdch' ),
	);

	$args = array(
		'label'               => __( 'CKAN', 'ogdch' ),
		'description'         => __( 'Contains Data from the CKAN Instance', 'ogdch' ),
		'labels'              => $labels,
		'supports'            => array( 'title' ),
		'hierarchical'        => false,
		'public'              => false,
		'show_ui'             => true,
		'show_in_menu'        => true,
		'menu_position'       => 5,
		'menu_icon'           => 'dashicons-category',
		'show_in_admin_bar'   => true,
		'show_in_nav_menus'   => true,
		'can_export'          => true,
		'has_archive'         => false,
		'exclude_from_search' => false,
		'publicly_queryable'  => false,
		'capability_type'     => 'page',
	);
	register_post_type( 'ckan-local-dataset', $args );
}

add_action( 'init', 'register_ckan_local_post_type', 0 );


// ===================================================
// Define CMB2 fields for Post Type
// ===================================================

function ckan_local_dataset_fields() {

	global $language_priority;
	$prefix = '_ckan_local_dataset_';


	$cmb = new_cmb2_box( array(
		'id'           => 'ckan-local-dataset-box',
		'title'        => __( 'Ressource Data', 'ogdch' ),
		'object_types' => array( 'ckan-local-dataset', ),
		'context'      => 'normal',
		'priority'     => 'high',
		'show_names'   => true,
	) );

	/* CKAN Ref ID (If Set.. update.. set on first save) */
	$cmb->add_field( array(
		'name'       => __( 'CKAN Ref. ID', 'ogdch' ),
		'id'         => $prefix . 'reference',
		'type'       => 'text',
		'desc'       => __( 'Ref. ID from CKAN', 'ogdch' ),
		'attributes' => array(
			'readonly' => 'readonly',
		),
	) );

	/* Permalink */
	$cmb->add_field( array(
		'name'       => __( 'Name (Slug)', 'ogdch' ),
		'id'         => $prefix . 'name',
		'type'       => 'text',
		'desc'       => __( 'Permalink Name', 'ogdch' ),
		'attributes' => array(
			'placeholder' => 'my-dataset-about-paper',
			'readonly'    => 'readonly',
		),
	) );

	/* Title */
	$cmb->add_field( array(
		'name' => __( 'Dataset Title', 'ogdch' ),
		'type' => 'title',
		'id'   => 'title_title'
	) );

	foreach ( $language_priority as $lang ) {
		$cmb->add_field( array(
			'name'       => __( 'Title', 'ogdch' ) . ' (' . strtoupper( $lang ) . ')',
			'id'         => $prefix . 'name_' . $lang,
			'type'       => 'text',
			'attributes' => array(
				'placeholder' => __( 'e.g. Awesome dataset', 'ogdch' )
			)
		) );
	}


	/* Description */
	$cmb->add_field( array(
		'name' => __( 'Dataset Description', 'ogdch' ),
		'type' => 'title',
		'id'   => 'description_title',
		'desc' => __( 'Markdown Syntax can be used to format the description.', 'ogdch' ),
	) );

	foreach ( $language_priority as $lang ) {
		$cmb->add_field( array(
			'name'       => 'Description (' . strtoupper( $lang ) . ')',
			'id'         => $prefix . 'description_' . $lang,
			'type'       => 'textarea',
			'attributes' => array( 'rows' => 3 ),
		) );
	}


	/* Visibility */
	$cmb->add_field( array(
		'name' => __( 'Sichtbarkeit', 'ogdch' ),
		'type' => 'title',
		'id'   => 'visibility_title',
	) );

	$cmb->add_field( array(
		'name'    => __( 'Visibility', 'ogdch' ),
		'desc'    => __( 'Select the visibility of the Dataset', 'ogdch' ),
		'id'      => $prefix . 'visibility',
		'type'    => 'radio',
		'default' => 'active',
		'options' => array(
			'active'  => __( 'Active', 'ogdch' ),
			'deleted' => __( 'Deleted', 'ogdch' ),
		),
	) );


	/* Source */
	$cmb->add_field( array(
		'name' => __( 'Source', 'ogdch' ),
		'type' => 'title',
		'id'   => 'source_title',
	) );

	$cmb->add_field( array(
		'name'       => __( 'Source', 'ogdch' ),
		'id'         => $prefix . 'source',
		'type'       => 'text',
		'attributes' => array(
			'placeholder' => 'http://example.com/dataset.json',
		),
	) );

	$cmb->add_field( array(
		'name'       => __( 'Version', 'ogdch' ),
		'id'         => $prefix . 'version',
		'type'       => 'text',
		'attributes' => array(
			'placeholder' => '1.0'
		)
	) );


	/* Author */
	$cmb->add_field( array(
		'name' => __( 'Dataset Author', 'ogdch' ),
		'type' => 'title',
		'id'   => 'author_title'
	) );

	$cmb->add_field( array(
		'name'       => __( 'Author Name', 'ogdch' ),
		'id'         => $prefix . 'author',
		'type'       => 'text',
		'attributes' => array(
			'placeholder' => __( 'Hans Musterman', 'ogdch' ),
		)
	) );

	$cmb->add_field( array(
		'name'       => __( 'Author Email', 'ogdch' ),
		'id'         => $prefix . 'author_email',
		'type'       => 'text',
		'attributes' => array(
			'placeholder' => __( 'hans@musterman.ch', 'ogdch' ),
		)
	) );


	/* Maintainer */
	$cmb->add_field( array(
		'name' => __( 'Dataset Maintainer', 'ogdch' ),
		'type' => 'title',
		'id'   => 'maintainer_title'
	) );

	$cmb->add_field( array(
		'name'       => __( 'Maintainer Name', 'ogdch' ),
		'id'         => $prefix . 'maintainer',
		'type'       => 'text',
		'attributes' => array(
			'placeholder' => __( 'Peter Müller', 'ogdch' ),
		)
	) );

	$cmb->add_field( array(
		'name'       => __( 'Maintainer Email', 'ogdch' ),
		'id'         => $prefix . 'maintainer_email',
		'type'       => 'text',
		'attributes' => array(
			'placeholder' => __( 'peter@mueller.ch', 'ogdch' ),
		)
	) );

	/* Resource */
	$cmb->add_field( array(
		'name' => __( 'Resources', 'ogdch' ),
		'type' => 'title',
		'id'   => 'resource_title'
	) );

	$cmb->add_field( array(
		'name' => 'Add Resource',
		'desc' => '',
		'id'   => $prefix . 'resources',
		'type' => 'file_list',
	) );


	/* Custom Fields */
	$cmb->add_field( array(
		'name' => __( 'Custom Fields', 'ogdch' ),
		'type' => 'title',
		'id'   => 'customfields_title',
	) );

	$custom_fields_id = $cmb->add_field( array(
		'id'      => $prefix . 'custom_fields',
		'type'    => 'group',
		'options' => array(
			'group_title'   => __( 'Custom Field {#}', 'ogdch' ),
			'add_button'    => __( 'Add another Field', 'ogdch' ),
			'remove_button' => __( 'Remove Field', 'ogdch' ),
		),
	) );

	$cmb->add_group_field( $custom_fields_id, array(
		'name' => __( 'Key', 'ogdch' ),
		'id'   => 'key',
		'type' => 'text',
	) );

	$cmb->add_group_field( $custom_fields_id, array(
		'name' => __( 'Value', 'ogdch' ),
		'id'   => 'value',
		'type' => 'text',
	) );

}

add_action( 'cmb2_init', 'ckan_local_dataset_fields' );


// ===================================================
// Send Data to CKAN
// ===================================================

/**
 * This action gets called when a post of type ckan-local-dataset
 * is saved/changed/deleted/trashed.
 */
function sync_ckan_local_dataset() {
	global $post;

	// Exit if WP is doing a auto-save
	if ( defined( 'DOING_AUTOSAVE' ) && DOING_AUTOSAVE ) {
		return;
	}

	// Exit is $post is empty (Should never happen)
	if ( ! $post ) {
		return;
	}

	// Exit if THIS saved Post is a revision (Revisions are deactivated in wp-config.. but just in case)
	if ( wp_is_post_revision( $post->ID ) || ! isset( $post->post_status ) ) {
		return;
	}

	// If action is trash or delete set CKAN dataset to deleted
	if ( isset( $_GET ) && ( $_GET['action'] === 'trash' || $_GET['action'] === 'delete' ) ) {
		ckan_local_dataset_trash_action();
	} // If action is untrash set CKAN dataset to active
	elseif ( isset( $_GET ) && $_GET['action'] === 'untrash' ) {
		ckan_local_dataset_trash_action( true );
	} // Or generate data for insert/update
	else {
		ckan_local_dataset_update_action( $post );
	}
}

add_action( 'save_post_ckan-local-dataset', 'sync_ckan_local_dataset' );
// display all notices
add_action( 'admin_notices', 'ckan_local_dataset_show_admin_notices', 0 );

/**
 * Gets called when a ckan-local-dataset is trashed/untrashed or deleted.
 * Updates internal post visibility field and CKAN dataset state.
 *
 * @param bool $untrash Set true if dataset should be untrashed
 *
 * @return bool True when CKAN request was successful.
 */
function ckan_local_dataset_trash_action( $untrash = false ) {
	$post_id = $_GET['post'];

	if ( $untrash ) {
		// Set internal post visibility state to active
		update_post_meta( $post_id, '_ckan_local_dataset_visibility', 'active' );
	} else {
		// Set internal post visibility state to deleted
		update_post_meta( $post_id, '_ckan_local_dataset_visibility', 'deleted' );
	}

	$ckan_ref = get_post_meta( $post_id, '_ckan_local_dataset_reference', true );

	// If no CKAN reference id is defined don't send request a to CKAN
	if ( $ckan_ref === '' ) {
		return false;
	}

	// Get current CKAN data and update state property
	$endpoint     = CKAN_API_ENDPOINT . 'action/package_show?id=' . $ckan_ref;
	$response       = ckan_local_dataset_do_api_request( $endpoint );
	$success      = ckan_local_dataset_check_response_for_errors( $response );
	$ckan_dataset = $response->result;

	if ( $untrash ) {
		// Set CKAN state to active.
		$ckan_dataset->state = 'active';
	} else {
		// Set CKAN state to deleted
		$ckan_dataset->state = 'deleted';
	}

	$ckan_dataset = json_encode( $ckan_dataset );

	// Send updated data to CKAN
	$endpoint = CKAN_API_ENDPOINT . 'action/package_update?id=' . $ckan_ref;
	$response   = ckan_local_dataset_do_api_request( $endpoint, $ckan_dataset );

	return ckan_local_dataset_check_response_for_errors( $response );
}

/**
 * Gets called when a ckan-local-dataset is saved/updated.
 * Sends new/updated dataset to CKAN and updates reference id and name (slug) from CKAN.
 *
 * @param object $post The ckan-local-dataset post to updated/save
 *
 * @return bool True when CKAN request was successful.
 */
function ckan_local_dataset_update_action( $post ) {
	$ckan_organisation_slug = ckan_local_dataset_get_selected_organisation_slug( $_POST['ckan_organisation'] );
	$extras                 = ckan_local_dataset_prepare_custom_fields( $_POST['_ckan_local_dataset_custom_fields'] );
	$resources              = ckan_local_dataset_prepare_resources( $_POST['_ckan_local_dataset_resources'] );
	$groups                 = ckan_local_dataset_get_selected_groups( $_POST['tax_input']['ckan_group'] );

	// Gernerate slug of dataset. If no title is entered use an uniqid
	if ( $_POST['_ckan_local_dataset_name'] != '' ) {
		$title = $_POST['_ckan_local_dataset_name'];
	} else {
		$title = $_POST['post_title'];

		if ( $title === '' ) {
			$title = uniqid();
		}
	}
	$slug = sanitize_title_with_dashes( $title );

	$ckan_post = array(
		'name'             => $slug,
		'title'            => $_POST['post_title'],
		'maintainer'       => $_POST['_ckan_local_dataset_maintainer'],
		'maintainer_email' => $_POST['_ckan_local_dataset_maintainer_email'],
		'author'           => $_POST['_ckan_local_dataset_author'],
		'author_email'     => $_POST['_ckan_local_dataset_author_email'],
		'notes'            => $_POST['_ckan_local_dataset_description_de'], // TODO: use all language here
		'version'          => $_POST['_ckan_local_dataset_version'],
		'state'            => $_POST['_ckan_local_dataset_visibility'],
		'extras'           => $extras,
		'resources'        => $resources,
		'groups'           => $groups,
		'owner_org'        => $ckan_organisation_slug
	);

	$ckan_post = json_encode( $ckan_post );

	// Define endpoint for request
	$endpoint = CKAN_API_ENDPOINT . 'action/';

	// If post has reference id use it as endpoint -> update existing dataset
	if ( isset( $_POST['_ckan_local_dataset_reference'] ) && $_POST['_ckan_local_dataset_reference'] != '' ) {
		$endpoint .= 'package_update?id=' . $_POST['_ckan_local_dataset_reference'];
	} else {
		// Insert new dataset
		$endpoint .= 'package_create';
	}

	$response = ckan_local_dataset_do_api_request( $endpoint, $ckan_post );

	$success = ckan_local_dataset_check_response_for_errors( $response );
	if ( $success ) {
		$ckan_dataset = $response->result;
		if ( isset( $ckan_dataset->id ) && $ckan_dataset->id != '' ) {
			// Set reference id from CKAN and add it to $_POST because the real meta save will follow after this action
			update_post_meta( $post->ID, '_ckan_local_dataset_reference', $ckan_dataset->id );
			update_post_meta( $post->ID, '_ckan_local_dataset_name', $ckan_dataset->name );
			$_POST['_ckan_local_dataset_reference'] = $ckan_dataset->id;
			$_POST['_ckan_local_dataset_name']      = $ckan_dataset->name;
		}
	}

	return $success;
}

/**
 * Displays all admin notices
 *
 * @return string
 */
function ckan_local_dataset_show_admin_notices() {
	$notice = get_option( 'ckan_local_dataset_notice' );
	if ( empty( $notice ) ) {
		return '';
	}
	//print the message
	foreach ( $notice as $key => $m ) {
		echo '<div class="error"><p>' . $m . '</p></div>';
	}
	delete_option( 'ckan_local_dataset_notice' );
}

/**
 * Sends a curl request with given data to specified CKAN endpoint.
 *
 * @param string $endpoint CKAN API endpoint which gets called
 * @param string $data Data to send
 *
 * @return object The CKAN dataset as object
 */
function ckan_local_dataset_do_api_request( $endpoint, $data = '' ) {
	$ch = curl_init( $endpoint );
	curl_setopt( $ch, CURLOPT_CUSTOMREQUEST, "POST" );
	curl_setopt( $ch, CURLOPT_POSTFIELDS, $data );
	curl_setopt( $ch, CURLOPT_RETURNTRANSFER, true );
	curl_setopt( $ch, CURLOPT_HTTPHEADER, [ 'Authorization: ' . CKAN_API_KEY . '' ] );

	// send request
	$response = curl_exec( $ch );
	$response = json_decode( $response );

	curl_close( $ch );

	return $response;
}

/**
 * Validates CKAN API response
 *
 * @param object $response The json_decoded response from the CKAN API
 *
 * @return bool True if response looks good
 */
function ckan_local_dataset_check_response_for_errors( $response ) {
	// store all error notices in option array
	$notice = get_option( 'ckan_local_dataset_notice' );
	if ( ! is_object( $response ) ) {
		$notice[] = 'There was a problem sending the request.';
	}

	if ( isset( $response->success ) && $response->success === false ) {
		if ( isset( $response->error ) && isset( $response->error->name ) && is_array( $response->error->name ) ) {
			$notice[] = $response->error->name[0];
		} else {
			$notice[] = 'API responded with unknown error.';
		}
	}
	update_option( 'ckan_local_dataset_notice', $notice );

	return true;
}

/**
 * Transforms custom field values from WP form to a CKAN friendly form.
 *
 * @return array CKAN friendly custom fields
 */
function ckan_local_dataset_prepare_custom_fields( $custom_fields ) {
	$ckan_custom_fields = array();

	// Check if custom fields are added. If yes generate CKAN friendly array.
	if ( $custom_fields[0]['key'] != '' ) {
		foreach ( $custom_fields as $custom_field ) {
			$ckan_custom_fields[] = array(
				'key'   => $custom_field['key'],
				'value' => $custom_field['value']
			);
		}
	}

	return $ckan_custom_fields;
}

/**
 * Transforms resources field values from WP form to a CKAN friendly form.
 *
 * @return array CKAN friendly custom fields
 */
function ckan_local_dataset_prepare_resources( $resources ) {
	$ckan_resources = array();
	foreach ( $resources as $attachment_id => $url ) {
		$attachment       = get_post( $attachment_id );
		$ckan_resources[] = array(
			'url'         => $url,
			'name'        => $attachment->post_title,
			'description' => $attachment->post_content
		);
	}

	return $ckan_resources;
}

/**
 * Gets slug from selected organisation
 *
 * @param int $organisation_id
 *
 * @return string Slug of organisation or empty string if organisation wasn't found
 */
function ckan_local_dataset_get_selected_organisation_slug( $organisation_id ) {
	if ( $organisation_id < 1 ) {
		return '';
	}

	$organisation = get_term( $organisation_id, 'ckan_organisation' );
	if ( is_object( $organisation ) && $organisation->slug != '' ) {
		return $organisation->slug;
	}

	return '';
}

/**
 * Create CKAN friendly array of all selected groups
 *
 * @param array $selected_groups IDs of selected groups
 *
 * @return array CKAN friendly array with all selected groups
 */
function ckan_local_dataset_get_selected_groups( $selected_groups ) {
	$ckan_groups = array();

	foreach ( $selected_groups as $group_id ) {
		// First entry is always a 0 -> not used
		if ( $group_id == 0 ) {
			continue;
		}

		$group = get_term( $group_id, 'ckan_group' );
		if ( is_object( $group ) && $group->slug != '' ) {
			$ckan_groups[] = array( 'name' => $group->slug );
		}
	}

	return $ckan_groups;
}

?>