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


// ===================================================
// Options Page
// ===================================================

add_action( 'admin_menu', 'ckan_tax_data_sync_add_admin_menu' );
add_action( 'admin_init', 'ckan_tax_data_sync_settings_init' );


function ckan_tax_data_sync_add_admin_menu(  ) {
	add_menu_page( 'CKAN Tax-Data', 'CKAN Tax-Data', 'manage_options', 'ckan_tax_data_sync', 'ckan_tax_data_sync_options_page' );
}


function ckan_tax_data_sync_settings_init(  ) {

	register_setting( 'pluginPage', 'ckan_tax_data_sync_settings' );

	add_settings_section(
		'ckan_tax_data_sync_pluginPage_section',
		__( 'Update / Delete Data', 'ogdch' ),
		'ckan_tax_data_sync_settings_section_callback',
		'pluginPage'
	);

	add_settings_field(
		'ckan_tax_data_sync_select_field_0',
		__( 'Get Organisations', 'ogdch' ),
		'ckan_tax_data_sync_select_field_0_render',
		'pluginPage',
		'ckan_tax_data_sync_pluginPage_section'
	);

    add_settings_field(
		'ckan_tax_data_sync_select_field_1',
		__( 'Get Groups', 'ogdch' ),
		'ckan_tax_data_sync_select_field_1_render',
		'pluginPage',
		'ckan_tax_data_sync_pluginPage_section'
	);
}


function ckan_tax_data_sync_select_field_0_render(  ) {
	echo '<input type="checkbox" />';
}

function ckan_tax_data_sync_select_field_1_render(  ) {
	echo '<input type="checkbox" />';
}


function ckan_tax_data_sync_settings_section_callback(  ) {
	echo __( 'Get/Flush Taxonomie Data from CKAN', 'ogdch' );
}


function ckan_tax_data_sync_options_page(  ) {

	?>
	<form action='options.php' method='post'>

		<h2>CKAN Tax-Data Sync</h2>

		<?php
		settings_fields( 'pluginPage' );
		do_settings_sections( 'pluginPage' );
		submit_button();
		?>

	</form>
	<?php

}







/*
add_action( 'init', 'ckan_taxonomy', 0 );


class Ckan_Tax_Data_Page {

	private $key = 'ckan_tax_data';
	private $metabox_id = 'ckan_tax_data_metabox';
	private $textdomain = 'odgch';

	protected $title = '';
	protected $options_page = '';

	public function __construct() {
		$this->title = __( 'CKAN Tax Data', $this->textdomain );
	}

	public function hooks() {
		add_action( 'admin_init', array( $this, 'init' ) );
		add_action( 'admin_menu', array( $this, 'add_options_page' ) );
		add_action( 'cmb2_init', array( $this, 'add_options_page_metabox' ) );
	}

	public function init() {
		register_setting( $this->key, $this->key );
	}

	public function add_options_page() {
		$this->options_page = add_menu_page( $this->title, $this->title, 'manage_options', $this->key, array(
				$this,
				'admin_page_display'
			) );
		add_action( "admin_print_styles-{$this->options_page}", array( 'CMB2_hookup', 'enqueue_cmb_css' ) );
	}

	public function admin_page_display() {
		?>
		<div class="wrap cmb2-options-page <?php echo $this->key; ?>">
			<h2><?php echo esc_html( get_admin_page_title() ); ?></h2>
			<?php cmb2_metabox_form( $this->metabox_id, $this->key, array( 'cmb_styles' => false ) ); ?>
		</div>
	<?php
	}


	function add_options_page_metabox() {
		$cmb = new_cmb2_box( array(
			'id'      => $this->metabox_id,
			'hookup'  => false,
			'show_on' => array(
				// These are important, don't remove
				'key'   => 'options-page',
				'value' => array( $this->key, )
			),
		) );
		// Set our CMB2 fields
		$cmb->add_field( array(
			'name'    => __( 'Test Text2', $this->textdomain ),
			'desc'    => __( 'field description (optional)', $this->textdomain ),
			'id'      => 'test_text',
			'type'    => 'text',
			'default' => 'Default Text',
		) );
		$cmb->add_field( array(
			'name'    => __( 'Test Color Picker', $this->textdomain ),
			'desc'    => __( 'field description (optional)', $this->textdomain ),
			'id'      => 'test_colorpicker',
			'type'    => 'colorpicker',
			'default' => '#bada55',
		) );
	}

	public function __get( $field ) {
		// Allowed fields to retrieve
		if ( in_array( $field, array( 'key', 'metabox_id', 'title', 'options_page' ), true ) ) {
			return $this->{$field};
		}
		throw new Exception( 'Invalid property: ' . $field );
	}
}

function ckan_tax_data_sync_page() {
	static $object = null;
	if ( is_null( $object ) ) {
		$object = new Ckan_Tax_Data_Page();
		$object->hooks();
	}

	return $object;
}

function ckan_data_sync_get_option( $key = '' ) {
	return cmb2_get_option( myprefix_admin()->key, $key );
}


ckan_tax_data_sync_page();*/