<?php
/**
 * Plugin Name: OGDch CKAN Tax Sync
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
		'name'                       => _x( 'Organisations', 'Taxonomy General Name', 'ogdch' ),
		'singular_name'              => _x( 'Organisation', 'Taxonomy Singular Name', 'ogdch' ),
		'menu_name'                  => __( 'Organisations', 'ogdch' ),
		'all_items'                  => __( 'All Items', 'ogdch' ),
		'parent_item'                => __( 'Parent Item', 'ogdch' ),
		'parent_item_colon'          => __( 'Parent Item:', 'ogdch' ),
		'new_item_name'              => __( 'New Item Name', 'ogdch' ),
		'add_new_item'               => __( 'Add New Item', 'ogdch' ),
		'edit_item'                  => __( 'Edit Item', 'ogdch' ),
		'update_item'                => __( 'Update Item', 'ogdch' ),
		'view_item'                  => __( 'View Item', 'ogdch' ),
		'separate_items_with_commas' => __( 'Separate items with commas', 'ogdch' ),
		'add_or_remove_items'        => __( 'Add or remove items', 'ogdch' ),
		'choose_from_most_used'      => __( 'Choose from the most used', 'ogdch' ),
		'popular_items'              => __( 'Popular Items', 'ogdch' ),
		'search_items'               => __( 'Search Items', 'ogdch' ),
		'not_found'                  => __( 'Not Found', 'ogdch' ),
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
	register_taxonomy( 'ckan_organisation', array( 'ckan-dataset', 'ckan-local-dataset' ), $args );


	$labels  = array(
		'name'                       => _x( 'Groups', 'Taxonomy General Name', 'ogdch' ),
		'singular_name'              => _x( 'Group', 'Taxonomy Singular Name', 'ogdch' ),
		'menu_name'                  => __( 'Groups', 'ogdch' ),
		'all_items'                  => __( 'All Items', 'ogdch' ),
		'parent_item'                => __( 'Parent Item', 'ogdch' ),
		'parent_item_colon'          => __( 'Parent Item:', 'ogdch' ),
		'new_item_name'              => __( 'New Item Name', 'ogdch' ),
		'add_new_item'               => __( 'Add New Item', 'ogdch' ),
		'edit_item'                  => __( 'Edit Item', 'ogdch' ),
		'update_item'                => __( 'Update Item', 'ogdch' ),
		'view_item'                  => __( 'View Item', 'ogdch' ),
		'separate_items_with_commas' => __( 'Separate items with commas', 'ogdch' ),
		'add_or_remove_items'        => __( 'Add or remove items', 'ogdch' ),
		'choose_from_most_used'      => __( 'Choose from the most used', 'ogdch' ),
		'popular_items'              => __( 'Popular Items', 'ogdch' ),
		'search_items'               => __( 'Search Items', 'ogdch' ),
		'not_found'                  => __( 'Not Found', 'ogdch' ),
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
	register_taxonomy( 'ckan_group', array( 'ckan-dataset', 'ckan-local-dataset' ), $args );
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
	<h1>CKAN Taxonomy Data synchronization</h1>
	<p>Get Taxonomie Data from CKAN Instance and rebuild it in WP</p>

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
		$taxonomy = 'ckan_group';
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

	if ( $taxonomy === 'ckan_group' ) {
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


/**
 * Create custom meta box to allow choosing only one ckan_group per dataset.
 * Checkbox -> Selectbox
 */
function ckan_organisation_custom_meta_box() {
	remove_meta_box( 'ckan_organisationdiv', 'ckan-local-dataset', 'side' );
	add_meta_box( 'ckan_organisationdiv',  __( 'Organisation', 'ogdch' ), 'ckan_organisation_meta_box', 'ckan-local-dataset', 'side' );

	remove_meta_box( 'ckan_organisationdiv', 'ckan-dataset', 'side' );
	add_meta_box( 'ckan_organisationdiv',  __( 'Organisation', 'ogdch' ), 'ckan_organisation_meta_box', 'ckan-dataset', 'side' );
}
add_action('add_meta_boxes', 'ckan_organisation_custom_meta_box');

/* Prints the taxonomy box content */
function ckan_organisation_meta_box($post) {
	$tax_name = 'ckan_organisation';
	?>
	<div class="tagsdiv" id="<?php echo $tax_name; ?>">
		<div class="jaxtag">
			<?php
			// Use nonce for verification
			wp_nonce_field( plugin_basename( __FILE__ ), 'ckan_organisation_noncename' );
			$type_IDs = wp_get_object_terms( $post->ID, 'ckan_organisation', array('fields' => 'ids') );
			wp_dropdown_categories('taxonomy=ckan_organisation&hide_empty=0&orderby=name&name=ckan_organisation&show_option_none=' . __( 'No Organisation', 'ogdch' ) . '&selected='.$type_IDs[0]); ?>
		</div>
	</div>
	<?php
}

/* When the post is saved, saves our custom taxonomy */
function ckan_organisation_save_postdata( $post_id ) {
	// verify if this is an auto save routine.
	// If it is our form has not been submitted, so we dont want to do anything
	if ( ( defined( 'DOING_AUTOSAVE' ) && DOING_AUTOSAVE ) || wp_is_post_revision( $post_id ) )
		return;

	// verify this came from the our screen and with proper authorization,
	// because save_post can be triggered at other times

	if ( !wp_verify_nonce( $_POST['ckan_organisation_noncename'], plugin_basename( __FILE__ ) ) )
		return;


	// Check permissions
	if ( 'ckan-local-dataset' == $_POST['post_type'] )
	{
		if ( !current_user_can( 'edit_page', $post_id ) )
			return;
	}
	else
	{
		if ( !current_user_can( 'edit_post', $post_id ) )
			return;
	}

	// OK, we're authenticated: we need to find and save the data

	$type_ID = $_POST['ckan_organisation'];

	$type = ( $type_ID > 0 ) ? get_term( $type_ID, 'ckan_organisation' )->slug : NULL;

	wp_set_object_terms(  $post_id , $type, 'ckan_organisation' );
}
/* Do something with the data entered */
add_action( 'save_post', 'ckan_organisation_save_postdata' );
