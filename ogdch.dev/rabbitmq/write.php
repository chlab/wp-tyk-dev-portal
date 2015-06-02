<?php
require_once( __DIR__ . '/../vendor/autoload.php' );

use PhpAmqpLib\Connection\AMQPConnection;
use PhpAmqpLib\Message\AMQPMessage;

$connection = new AMQPConnection( 'localhost', 5672, 'admin', '123' );
$channel    = $connection->channel();
$queue_name = 'ckan';

$channel->queue_declare( $queue_name, false, false, false, false );

$mock_ckan_data = array(
	'{
		"id":"71a37fef-df2f-47a0-be06-cebf83765d26",
		"action":"insert"
	}',
);

foreach ( $mock_ckan_data as $ckan_data ) {
	$msg = new AMQPMessage( $ckan_data );
	$channel->basic_publish( $msg, '', $queue_name );
	echo ' [*] Sent ' . uniqid() . ' ' . count( $mock_ckan_data ) . ' messages to ' . $queue_name . ' queue.', "\n<br>";
}

$channel->close();
$connection->close();
