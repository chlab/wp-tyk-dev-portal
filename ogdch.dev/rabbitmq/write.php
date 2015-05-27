<?php

/*$msg = array(
    'ref' => 123,
    'title' => array(
        'de' => 'titel DE',
        'fr' => 'titel FR',
        'en' => 'titel EN',
        'it' => 'titel IT',
    ),
    'action' => 'insert',
);

    var_dump(json_encode($msg));die;*/

require_once(__DIR__ . '/../vendor/autoload.php');

use PhpAmqpLib\Connection\AMQPConnection;
use PhpAmqpLib\Message\AMQPMessage;

$connection = new AMQPConnection('localhost', 5672, 'admin', '123');
$channel = $connection->channel();

$channel->queue_declare('ckan', false, false, false, false);

$ref = rand(100, 999);
$mock_ckan_data = array(
	'{"ref":' . $ref . ',"title":{"de":"titel DE ' . $ref . '","fr":"titel FR ' . $ref . '","en":"titel EN ' . $ref . '","it":"titel IT ' . $ref . '"},"action":"insert"}',
);
$queue_name = 'ckan';

foreach($mock_ckan_data as $ckan_data) {
	$msg = new AMQPMessage($ckan_data);
	$channel->basic_publish($msg, '', $queue_name);
}

$channel->close();
$connection->close();

echo ' [*] Sent ' . count($mock_ckan_data) . ' messages to ' . $queue_name . ' queue.', "\n";