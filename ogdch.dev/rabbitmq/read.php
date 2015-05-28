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

	foreach ( $msg->title as $lang => $title ) {

		$action = $msg->action;

		$post = array(
			'post_author' => 1,
			'post_type'   => 'ckan-dataset',
			'post_title'  => $title,
		);

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

        $res = get_posts( $args );
		$num_res = count( $res );


		// Error handling
		if ( $num_res === 1 && $action == 'insert' ) { // If Ref. ID exists but action is insert -> update
			$action = 'update';
		} elseif ( $num_res === 0 && $action == 'update' ) { // If Ref. ID does not exists but action is update -> insert
			$action = 'insert';
		}


		if ( $num_res === 1 && $action == 'update' ) {

			// Post exists so update it
			$post['ID'] = $res[0];
			$new_id     = $res[0];
			wp_update_post( $post );

			echo "UPDATE " . $post['ID'] . " to " . $post['post_title'] . " \n";

		} elseif ( $num_res === 0 && $action == 'insert' ) {

			// Post does not exist so create it, add reference as custom field and set language of post
			$new_id = wp_insert_post( $post, true );
			add_post_meta( $new_id, '_ckandataset_reference', $msg->ref, true );
			pll_set_post_language( $new_id, $lang );  // Set Langauge

			echo "Insert " . $new_id . " as " . $post['post_title'] . " \n";

		} else {
			echo "ERROR\n";
		}


		$translations[ $lang ] = $new_id;

	}

	// Connect Posts with each other
	if ( $action === 'insert' ) {
		pll_save_post_translations( $translations );
	}

};


$channel->basic_consume( 'ckan', '', false, true, false, false, $callback );

while ( count( $channel->callbacks ) ) {
	$channel->wait();
}