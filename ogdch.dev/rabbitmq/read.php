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

	$msg = json_decode( $msg->body );
	$action = $msg->action;
	$ckan_id = $msg->id;

	if( empty( $ckan_id ) ) {
		return FALSE;
	}

	// Always delete all posts for given id
	ckan_dataset_delete_posts_by_ckanid( $ckan_id );
	if ( 'delete' === $action ) {
		// If action for this id is delete stop here
		return TRUE;
	}

	$ckan_dataset = ckan_dataset_get_single_json( $ckan_id );
	ckan_dataset_save_single_json( $ckan_dataset, $ckan_id );
	return TRUE;
};


$channel->basic_consume( 'ckan', '', false, true, false, false, $callback );

while ( count( $channel->callbacks ) ) {
	$channel->wait();
}