<?php
require_once( __DIR__ . '/../vendor/autoload.php' );

use PhpAmqpLib\Connection\AMQPConnection;
use PhpAmqpLib\Message\AMQPMessage;

$connection = new AMQPConnection( 'localhost', 5672, 'admin', '123' );
$channel    = $connection->channel();
$queue_name = 'ckan';

$channel->queue_declare( $queue_name, false, false, false, false );

$ref            = rand( 100, 999 );
$ref            = 'caa92e13-a975-4644-9e85-c3c752b462972';
$mock_ckan_data = array(
	'{"ref":"' . $ref . '","name":"ich-bin-ein-datensatz2","title":{"de":"Ich bin ein Datensatz2 DE","fr":"Ich bin ein Datensatz2 FR","en":"Ich bin ein Datensatz2 EN","it":"Ich bin ein Datensatz2 IT"},"action":"insert"}',
	//'{"ref":' . $ref . ',"title":{"de":"titelyolo DE ' . $ref . '","fr":"titelyolo FR ' . $ref . '","en":"titelyolo EN ' . $ref . '","it":"titelyolo IT ' . $ref . '"},"action":"insert"}',
	//'{"ref":' . $ref . ',"title":{"de":"titelyolo DE ' . $ref . '","fr":"titelyolo FR ' . $ref . '","en":"titelyolo EN ' . $ref . '","it":"titelyolo IT ' . $ref . '"},"action":"update"}',
	//'{"ref":' . $ref . ',"title":{"de":"titel2 DE ' . $ref . '","fr":"titel2 FR ' . $ref . '","en":"titel2 EN ' . $ref . '","it":"titel2 IT ' . $ref . '"},"action":"update"}',
	//'{"ref":' . $ref . ',"title":{"de":"titel3 DE ' . $ref . '","fr":"titel33 FR ' . $ref . '","en":"titel333 EN ' . $ref . '","it":"titel33333 IT ' . $ref . '"},"action":"update"}',
	//'{"ref":653,"title":{"de":"titel--3 DE ' . $ref . '","fr":"titel--33 FR ' . $ref . '","en":"titel--333 EN ' . $ref . '","it":"titel---33333 IT ' . $ref . '"},"action":"update"}',
);

foreach ( $mock_ckan_data as $ckan_data ) {
	$msg = new AMQPMessage( $ckan_data );
	$channel->basic_publish( $msg, '', $queue_name );
	echo ' [*] Sent ' . uniqid() . ' ' . count( $mock_ckan_data ) . ' messages to ' . $queue_name . ' queue.', "\n<br>";
}

$channel->close();
$connection->close();
