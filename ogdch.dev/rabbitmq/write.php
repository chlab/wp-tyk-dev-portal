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

require_once '../vendor/autoload.php';

use PhpAmqpLib\Connection\AMQPConnection;
use PhpAmqpLib\Message\AMQPMessage;

$connection = new AMQPConnection('localhost', 5672, 'admin', '123');
$channel = $connection->channel();

$channel->queue_declare('ckan', false, false, false, false);

$msg = new AMQPMessage('{"ref":123,"title":{"de":"titel DE","fr":"titel FR","en":"titel EN","it":"titel IT"},"action":"insert"}');
$channel->basic_publish($msg, '', 'ckan');

$msg = new AMQPMessage('{"ref":1253,"title":{"de":"titel DE2","fr":"titel FR2","en":"titel EN2","it":"titel IT2"},"action":"update"}');
$channel->basic_publish($msg, '', 'ckan');

$channel->close();
$connection->close();