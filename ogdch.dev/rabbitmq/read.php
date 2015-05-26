<?php

/*
$msg = array(
    'ref' => 123,
    'title' => array(
        'de' => 'titel DE',
        'fr' => 'titel FR',
        'en' => 'titel EN',
        'it' => 'titel IT',
    ),
    'action' => 'insert',
);*/

define('WP_USE_THEMES', false);
require_once '../cms/wp-load.php';
require_once '../vendor/autoload.php';

if( ! function_exists('pll_save_post_translations')) {
    die('pll_save_post_translations does not exist');
}

use PhpAmqpLib\Connection\AMQPConnection;
use PhpAmqpLib\Message\AMQPMessage;

$connection = new AMQPConnection('localhost', 5672, 'admin', '123');
$channel = $connection->channel();

$channel->queue_declare('ckan', false, false, false, false);

echo ' [*] Waiting for messages. To exit press CTRL+C', "\n";

$callback = function($msg) {
    $msg = json_decode ($msg->body );
    $translations = array();
    foreach ( $msg->title as $lang => $title ) {
        var_dump($lang .' - '.$title);


        $post = array (
	        'post_author' => 1,
            'post_type' => 'ckan-dataset',
            'post_title' => $title
        );

        $new_id = wp_insert_post ( $post, true ); // Insert Post
        pll_set_post_language( $new_id, $lang );  // Set Langauge

        $translations[$lang] = $new_id;

    }

    // Connect Posts with each other
    pll_save_post_translations( $translations );

};

$channel->basic_consume('ckan', '', false, true, false, false, $callback);

while(count($channel->callbacks)) {
	$channel->wait();
}