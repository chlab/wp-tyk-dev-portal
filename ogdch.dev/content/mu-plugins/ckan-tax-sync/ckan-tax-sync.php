<?php
/**
 * Plugin Name: ODGch CKAN Tax Sync
 * Description: Syncs the Groups and Organizations into WP
 * Author: Team Jazz <bart@liip.ch>
 * Version: 1.0
 * Date: 01.06.2015
 */


// ===================================================
// Register Custom Taxonomy
// ===================================================

function ckan_taxonomy() {

	$labels  = array(
		'name'                       => _x( 'Organisationen', 'Taxonomy General Name', 'odgch' ),
		'singular_name'              => _x( 'Organisation', 'Taxonomy Singular Name', 'odgch' ),
		'menu_name'                  => __( 'Organisationen', 'odgch' ),
		'all_items'                  => __( 'All Items', 'odgch' ),
		'parent_item'                => __( 'Parent Item', 'odgch' ),
		'parent_item_colon'          => __( 'Parent Item:', 'odgch' ),
		'new_item_name'              => __( 'New Item Name', 'odgch' ),
		'add_new_item'               => __( 'Add New Item', 'odgch' ),
		'edit_item'                  => __( 'Edit Item', 'odgch' ),
		'update_item'                => __( 'Update Item', 'odgch' ),
		'view_item'                  => __( 'View Item', 'odgch' ),
		'separate_items_with_commas' => __( 'Separate items with commas', 'odgch' ),
		'add_or_remove_items'        => __( 'Add or remove items', 'odgch' ),
		'choose_from_most_used'      => __( 'Choose from the most used', 'odgch' ),
		'popular_items'              => __( 'Popular Items', 'odgch' ),
		'search_items'               => __( 'Search Items', 'odgch' ),
		'not_found'                  => __( 'Not Found', 'odgch' ),
	);
	$rewrite = array(
		'slug'         => 'organisationen',
		'with_front'   => true,
		'hierarchical' => true,
	);
	$args    = array(
		'labels'            => $labels,
		'hierarchical'      => true,
		'public'            => true,
		'show_ui'           => true,
		'show_admin_column' => true,
		'show_in_nav_menus' => true,
		'show_tagcloud'     => false,
		'rewrite'           => $rewrite,
	);
	register_taxonomy( 'ckan_organisation', array( 'ckan-dataset' ), $args );


	$labels  = array(
		'name'                       => _x( 'Gruppen', 'Taxonomy General Name', 'odgch' ),
		'singular_name'              => _x( 'Gruppe', 'Taxonomy Singular Name', 'odgch' ),
		'menu_name'                  => __( 'Gruppen', 'odgch' ),
		'all_items'                  => __( 'All Items', 'odgch' ),
		'parent_item'                => __( 'Parent Item', 'odgch' ),
		'parent_item_colon'          => __( 'Parent Item:', 'odgch' ),
		'new_item_name'              => __( 'New Item Name', 'odgch' ),
		'add_new_item'               => __( 'Add New Item', 'odgch' ),
		'edit_item'                  => __( 'Edit Item', 'odgch' ),
		'update_item'                => __( 'Update Item', 'odgch' ),
		'view_item'                  => __( 'View Item', 'odgch' ),
		'separate_items_with_commas' => __( 'Separate items with commas', 'odgch' ),
		'add_or_remove_items'        => __( 'Add or remove items', 'odgch' ),
		'choose_from_most_used'      => __( 'Choose from the most used', 'odgch' ),
		'popular_items'              => __( 'Popular Items', 'odgch' ),
		'search_items'               => __( 'Search Items', 'odgch' ),
		'not_found'                  => __( 'Not Found', 'odgch' ),
	);
	$rewrite = array(
		'slug'         => 'gruppen',
		'with_front'   => true,
		'hierarchical' => true,
	);
	$args    = array(
		'labels'            => $labels,
		'hierarchical'      => true,
		'public'            => true,
		'show_ui'           => true,
		'show_admin_column' => true,
		'show_in_nav_menus' => true,
		'show_tagcloud'     => false,
		'rewrite'           => $rewrite,
	);
	register_taxonomy( 'ckan_groups', array( 'ckan-dataset' ), $args );
}

add_action( 'init', 'ckan_taxonomy', 0 );

// ===================================================
// Options Page
// ===================================================


add_action( 'admin_menu', 'ckan_tax_sync_menu' );
add_action( 'admin_enqueue_scripts', 'ckan_tax_sync_scripts' );

function ckan_tax_sync_menu() {
	add_menu_page( 'CKAN Tax', 'CKAN Tax.-Data', 'manage_options', 'ckan_tax_sync', 'ckan_tax_sync_init' );
}

function ckan_tax_sync_init() {
	?>
	<h1>CKAN Taxonimie Data</h1>
	<p>Get Taxonomie Date from CKAN Instance or update it</p>

	<h3>Groups</h3>
	<?php submit_button( 'Get / Update Groups', 'primary', 'ckan_tax_sync_groups' ); ?>
	<div id="ckan_tax_sync_groups_status"></div>

	<h3>Organisations</h3>
	<?php submit_button( 'Get / Update Organisations', 'primary', 'ckan_tax_sync_organisations' ); ?>
	<div id="ckan_tax_sync_organisations_status"></div>

<?php
}

function ckan_tax_sync_scripts() {
	$screen = get_current_screen();
	if ( $screen->id != 'toplevel_page_ckan_tax_sync' ) {
		return;
	}

	wp_register_script( 'ckan_tax_sync', plugins_url( '/js/ckan_tax_sync.js', __FILE__ ), array( 'jquery' ), null );
	wp_enqueue_script( 'jquery' );
	wp_enqueue_script( 'ckan_tax_sync' );

}


// ===================================================
// Init AJAX Actions
// ===================================================

add_action( 'wp_ajax_ckan_tax_sync_groups_action', 'ckan_sync_tax' );
add_action( 'wp_ajax_nopriv_ckan_tax_sync_groups_action', 'ckan_sync_tax' );

add_action( 'wp_ajax_ckan_tax_sync_organisations_action', 'ckan_sync_tax' );
add_action( 'wp_ajax_nopriv_ckan_tax_sync_organisations_action', 'ckan_sync_tax' );


function ckan_sync_tax() {
	$action = $_REQUEST['action'];
	$return = array( 'status' => 'error' );


	if ( 'ckan_tax_sync_groups_action' === $action ) {
		$endpoint = CKAN_API_ENDPOINT . 'action/group_list';
		$taxonomy = 'ckan_groups';
	} elseif ( 'ckan_tax_sync_organisations_action' === $action ) {
		$endpoint = CKAN_API_ENDPOINT . 'action/organization_list';
		$taxonomy = 'ckan_organisation';
	} else {
		header( 'Content: application/json' );
		$return['message'] = 'No Endpoint found';
		echo json_encode( $return );
		die;
	}

	$response = wp_remote_get( $endpoint );

	$data = json_decode( $response['body'] );

	if ( ! is_object( $data ) ) {
		$return['message'] = 'No Data recieved';
	} else {
		$data = $data->result;
		if ( ! is_array( $data ) ) {
			$return['message'] = 'No Data recieved';
		} else {

			$return = json_decode( ckan_synchronize_taxonomy( $taxonomy, $data ) );
		}
	}

	header( 'Content: application/json' );
	echo json_encode( $return );
	die;
}


// ===================================================
// Sync Functions
// ===================================================

function ckan_synchronize_taxonomy( $taxonomy, $data ) {
	$ckan_data = $data;

	$return = array(
		'updated'  => 0,
		'inserted' => 0,
		'deleted'  => 0,
		'status'   => 'error',
		'message'  => 'fail'
	);

	if ( $taxonomy === 'ckan_groups' ) {
		$action = 'group_show';
	} elseif ( $taxonomy === 'ckan_organisation' ) {
		$action = 'organization_show';
	}

	foreach ( $data as $slug ) {
		$endpoint = CKAN_API_ENDPOINT . 'action/' . $action . '?id=' . $slug;
		$response = wp_remote_get( $endpoint );

		$data = json_decode( $response['body'] );

		if ( ! is_object( $data ) ) {
			continue;
		}

		$data = $data->result;
		if ( ! is_object( $data ) ) {
			continue;
		}

		$term = get_term_by( 'slug', $slug, $taxonomy );

		// if is object than the trem has a parent and $parent_term will be set (default is 0)
		$parent_term = 0;

		if ( is_array( $data->groups ) ) {
			if ( sizeof( $data->groups ) > 0 ) {
				$group       = $data->groups[0];
				$parent_term = get_term_by( 'slug', $group->name, $taxonomy );
				if ( $parent_term->term_id > 0 ) {
					$parent_term = $parent_term->term_id;
				}
			}
		}


		if ( is_object( $term ) ) {
			// update term
			wp_update_term( $term->term_id, $taxonomy, array(
				'name'        => $data->display_name,
				'parent'      => $parent_term,
				'description' => $data->description
			) );
			$return['updated'] = $return['updated'] + 1;

		} else {
			// create term
			$new_term = wp_insert_term(
				$data->display_name,
				$taxonomy,
				array(
					'parent'      => $parent_term,
					'description' => $data->description,
					'slug'        => $slug,
				)
			);

			if ( ! is_array( $new_term ) ) {
				echo 'could not create term: ' . $slug;
			} else {
				pll_set_term_language( $new_term['term_id'], 'de' );
				$return['inserted'] = $return['inserted'] + 1;
			}
		}
	}


	// Delete not recieved terms
	$delete_terms  = array();
	$current_terms = get_terms( $taxonomy, array( 'hide_empty' => false ) );

	if ( is_array( $current_terms ) ) {
		foreach ( $current_terms as $cterm ) {
			if ( ! in_array( $cterm->slug, $ckan_data ) ) {
				$term = get_term_by( 'slug', $cterm->slug, $taxonomy );
				wp_delete_term( $term->term_id, $taxonomy );
				$return['deleted'] = $return['deleted'] + 1;
			}
		}
	}

	$return['status']  = 'success';
	$return['message'] = 'Import finished. Updated: ' . $return['updated'] . ', Inserted: ' . $return['inserted'] . ' Deleted: ' . $return['deleted'];

	return json_encode( $return );
}

