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
				'placeholder' => __( 'z.B. ein beschreibender Titel', 'ogdch' )
			)
		) );
	}


	/* Permalink */
	$cmb->add_field( array(
		'name' => __( 'Dataset Permalink', 'ogdch' ),
		'type' => 'title',
		'id'   => 'permalink_title'
	) );

	$cmb->add_field( array(
		'name'       => __( 'Name (Slug)', 'ogdch' ),
		'id'         => $prefix . 'name',
		'type'       => 'text',
		'desc'       => __( 'Permalink Name', 'ogdch' ),
		'attributes' => array(
			'placeholder' => 'my-dataset-about-paper'
		)
	) );


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

	/* Data */
	$cmb->add_field( array(
		'name' => __( 'Add Data', 'ogdch' ),
		'type' => 'title',
		'id'   => 'data_title'
	) );

	$cmb->add_field( array(
		'name'    => __( 'File', 'ogdch' ),
		'desc'    => __( 'Upload a Datafile or enter an URL.', 'ogdch' ),
		'id'      => $prefix . 'data_file',
		'type'    => 'file',
		'options' => array(
			'url' => true,
		),
	) );

	foreach ( $language_priority as $lang ) {
		$cmb->add_field( array(
			'name'       => __('Data Description', 'ogdch' ) . ' (' . strtoupper( $lang ) . ')',
			'id'         => $prefix . 'data_description_' . $lang,
			'type'       => 'textarea',
			'attributes' => array(
				'rows'        => 3,
				'placeholder' => __( 'Nützliche Hinweise zu den Daten', 'ogdch' )
			),
		) );
	}
}

add_action( 'cmb2_init', 'ckan_local_dataset_fields' );


// ===================================================
// Send Data to CKAN
// ===================================================


function sync_ckan_local_dataset() {
    global $post;

    // Exit if WP is doing a auto-save
	if ( defined( 'DOING_AUTOSAVE' ) && DOING_AUTOSAVE )
		return;

    // Exit is $post is empty (Should never happen)
	if ( ! $post )
		return;

    // Exit if THIS saved Post is a revision (Revisions are deactivated in wp-config.. but just in case)
	if ( wp_is_post_revision( $post->ID ) || ! isset( $post->post_status ) )
		return;



    // If "Action" is trash, untrash or delete set CKAN Data set to deleted
	if ( isset( $_GET ) && ( $_GET['action'] === 'trash' || $_GET['action'] === 'untrash' || $_GET['action'] === 'delete' ) ) {
		$ckan_post = array( 'state' => 'deleted' );
		update_post_meta( $_GET['post'], '_ckan_local_dataset_visibility', 'deleted' );
		$_POST['_ckan_local_dataset_visibility'] = 'deleted';

		if( get_post_meta( $_GET['post'], '_ckan_local_dataset_reference', true ) === '' ) {
    		return;
		}
	}
	// Or generate Data for insert/update
	else {


        // Check if Custom Fields are added. If yes generate CKANinsh Array
    	if ( $_POST['_ckan_local_dataset_custom_fields'][0]['key'] != '' ) {
    		$extras = array();
    		foreach ( $_POST['_ckan_local_dataset_custom_fields'] as $key => $value ) {
    			$extras[] = array( $value['key'], $value['value'] );
    		}
    	}

        // Get "Name" for Dataset. If no Title entered use a uniqid
    	if ( $_POST['_ckan_local_dataset_name'] != '' ) {
    		$slug = sanitize_title_with_dashes( $_POST['_ckan_local_dataset_name'] );
    	} else {
        	$title = $_POST['post_title'];

        	if ( $title === '' )
        	    $title = uniqid();

    		$slug = sanitize_title_with_dashes( $title );
    	}


		$ckan_post = array(
			'name'             => $slug,
			'title'            => $_POST['post_title'],
			'maintainer'       => $_POST['_ckan_local_dataset_maintainer'],
			'maintainer_email' => $_POST['_ckan_local_dataset_maintainer_email'],
			'author'           => $_POST['_ckan_local_dataset_author'],
			'author_email'     => $_POST['_ckan_local_dataset_author_email'],
			'notes'            => $_POST['_ckan_local_dataset_data_description_de'],
			'url'              => $_POST['_ckan_local_dataset_data_file'],
			'version'          => $_POST['_ckan_local_dataset_version'],
			'state'            => $_POST['_ckan_local_dataset_visibility'],
			'extras'           => $extras,
		);
	}


	// Filter empty values as CKAN seems not to like it and make the Array a JSON String
	$ckan_post = json_encode( array_filter( $ckan_post ) );

    // Define Entpoint for Request (Default: create)
	$endpoint = CKAN_REST_API_ENDPOINT . 'dataset';

	// If Post has Ref ID get the CKAN "Name" and add it to the Entpoint
	if ( isset( $_POST['_ckan_local_dataset_reference'] ) && $_POST['_ckan_local_dataset_reference'] != '' ) {
		$endpoint .= '/' . $_POST['_ckan_local_dataset_reference'];
	} // If Action is trash, untrash or delete get "Name" for $_GET['post']
	elseif ( isset( $_GET ) && ( $_GET['action'] === 'trash' || $_GET['action'] === 'untrash' || $_GET['action'] === 'delete' ) ) {
		$endpoint .= '/' . get_post_meta( $_GET['post'], '_ckan_local_dataset_name', true );
	}


	// send request
	$ch = curl_init( $endpoint );
	curl_setopt( $ch, CURLOPT_CUSTOMREQUEST, "POST" );
	curl_setopt( $ch, CURLOPT_POSTFIELDS, $ckan_post );
	curl_setopt( $ch, CURLOPT_RETURNTRANSFER, true );
	curl_setopt( $ch, CURLOPT_HTTPHEADER, [ 'Authorization: ' . CKAN_API_KEY . '' ] );

	$result = curl_exec( $ch );
	$result = json_decode( $result );


	if ( is_object( $result ) ) {
		if ( isset( $result->success ) && $result->success === false ) {
			die( 'FAILED' );
		} elseif ( $result->name && ! isset( $result->id ) ) {
			$res = $result->name;
			die( 'Error: ' . $res[0] );
		}

		if ( isset( $result->id ) && $result->id != '' ) {
    		// Set Ref. ID and add it to $_POST because the real meta save will follow after this action
			update_post_meta( $post->ID, '_ckan_local_dataset_reference', $result->id );
			update_post_meta( $post->ID, '_ckan_local_dataset_name', $result->name );
			$_POST['_ckan_local_dataset_reference'] = $result->id;
			$_POST['_ckan_local_dataset_name'] = $result->name;
		}
	} else {
		die( 'Save/update failed. CKAN entry not found.' );
	}

}

add_action( 'save_post_ckan-local-dataset', 'sync_ckan_local_dataset' );

?>