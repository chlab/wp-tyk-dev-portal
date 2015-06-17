<?php

class Ckan_Backend_Sync_Local_Group extends Ckan_Backend_Sync_Abstract {

	public function __construct() {
		parent::__construct( Ckan_Backend_Local_Group::POST_TYPE, Ckan_Backend_Local_Group::FIELD_PREFIX );

		add_action( 'save_post_' . Ckan_Backend_Local_Group::POST_TYPE, array( $this, 'do_sync' ) );
		// display all notices
		add_action( 'admin_notices', array( $this, 'show_admin_notices' ), 0 );
	}

	protected function get_update_data() {
		// Gernerate slug of group. If no title is entered use an uniqid
		if ( $_POST[Ckan_Backend_Local_Group::FIELD_PREFIX . 'name'] != '' ) {
			$title = $_POST[Ckan_Backend_Local_Group::FIELD_PREFIX . 'name'];
		} else {
			$title = $_POST['post_title'];

			if ( $title === '' ) {
				$title = uniqid();
			}
		}
		$slug = sanitize_title_with_dashes( $title );

		$data = array(
			'name'             => $slug,
			'title'            => $_POST['post_title'], // TODO: use all language here
			'description'      => $_POST[Ckan_Backend_Local_Group::FIELD_PREFIX . 'description_de'], // TODO: use all language here
		);

		return $data;
	}
}