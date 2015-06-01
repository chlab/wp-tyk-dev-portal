<?php

define( 'WP_USE_THEMES', false );
require_once( __DIR__ . '/../cms/wp-load.php' );
require_once( __DIR__ . '/../vendor/autoload.php' );

if ( ! function_exists( 'pll_save_post_translations' ) ) {
	die( 'pll_save_post_translations does not exist' );
}

use PhpAmqpLib\Connection\AMQPConnection;
use PhpAmqpLib\Message\AMQPMessage;

$connection = new AMQPConnection( 'localhost', 5672, 'admin', '123' );
$channel    = $connection->channel();

$channel->queue_declare( 'ckan', false, false, false, false );

echo '[*] Waiting for messages. To exit press CTRL+C', "\n";

$callback = function ( $msg ) {

	$msg          = json_decode( $msg->body );
	$translations = array();
	$baseaction   = $msg->action;
	$response     = '';

	foreach ( $msg->title as $lang => $title ) {

		$action = $msg->action;

		/**
		 * Prepare Data for WP
		 */
		$post = array(
			'post_author' => 1,
			'post_type'   => 'ckan-dataset',
			'post_title'  => $title,
			'post_status' => 'publish',
		);

		/**
		 * Check if entry exists
		 */
		$args = array(
			'meta_key'       => '_ckandataset_reference',
			'meta_value'     => $msg->ref,
			'meta_compare'   => '=',
			'post_type'      => 'ckan-dataset',
			'posts_per_page' => 1,
			'cache_results'  => false,
			'fields'         => 'ids',
			'post_status'    => 'any',
			'lang'           => $lang,
		);

		$res     = get_posts( $args );
		$num_res = count( $res );


		/**
		 * Error preventing
		 * Correct in case of wrong 'action' provided by CKAN
		 */
		if ( $num_res === 1 && $action == 'insert' ) { // If Ref. ID exists but action is insert -> update
			$action = 'update';
		} elseif ( $num_res === 0 && $action == 'update' ) { // If Ref. ID does not exists but action is update -> insert
			$action = 'insert';
		}


		/**
		 * Update CKAN-Dataset
		 * Update WP Entry for CKAN Dataset (Update the Titel)
		 * Data will be recieved later
		 */
		if ( $num_res === 1 && 'update' === $action ) {
			$post['ID'] = $res[0];
			$new_id     = $res[0];
			wp_update_post( $post );

			echo "UPDATE " . $post['ID'] . " to " . $post['post_title'] . " \n";

		} /**
		 * Insert CKAN-Dataset
		 * Inserts a new entry into WP. Saves the CKAN Reference and Name in a Custom Field and sets the language
		 */
		elseif ( $num_res === 0 && 'insert' === $action ) {

			$new_id = wp_insert_post( $post, true );

			echo "INSERT " . $post['ID'] . " to " . $post['post_title'] . " \n";

			add_post_meta( $new_id, '_ckandataset_reference', $msg->ref, true );
			add_post_meta( $new_id, '_ckandataset_name', $msg->name, true );
			pll_set_post_language( $new_id, $lang );  // Set Langauge

		} /**
		 * Delete CKAN-Dataset
		 */
		elseif ( $num_res === 1 && 'delete' === $action ) {
			wp_delete_post( $res[0] );
			echo "DELETE " . $res[0] . " \n";
		} /**
		 * Something went very wrong
		 */
		else {
			echo "ERROR";
		}


		/**
		 * Get CKAN Data from CKAN Instance
		 * Gets the JSON Data from CKAN if 'action' was not delete.
		 * More Informations in ckan-data-set.php
		 */
		if ( 'delete' != $action ) {
			echo 'get data for ' . $new_id . '->' . $msg->name . " \n\n";

			if ( $response === '' ) {
				$response = ckan_dataset_get_single_json( $new_id, $msg->name );
			}
			ckan_dataset_save_single_json( $new_id, $response, $msg->name );
		}

		/* Fill Tranlations Array */
		$translations[ $lang ] = $new_id;

	}

	/**
	 * Connect CKAN-Datasets
	 * Connects the fresh insertet CKAN-Datasets together so Polylang can work with it.
	 * This Function inserts a Term with a serialized array.
	 * More Info: https://polylang.wordpress.com/documentation/documentation-for-developers/functions-reference/
	 */
	if ( $action === 'insert' ) {
		pll_save_post_translations( $translations );
	}

};


$channel->basic_consume( 'ckan', '', false, true, false, false, $callback );

while ( count( $channel->callbacks ) ) {
	$channel->wait();
}