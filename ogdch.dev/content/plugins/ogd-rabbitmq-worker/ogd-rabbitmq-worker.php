<?php

/*
Plugin Name: OGD RabbitMQ Worker
Plugin URI:
Description: Get Queue
Version: 1.0
Author: Team Jazz (Bartosz Podlewski)
Author URI: http://liip.ch
*/

defined( 'ABSPATH' ) or die;

register_activation_hook( __FILE__, array( 'ogd_rabbitmq_worker', 'flush_rewrite_rules' ) );
register_deactivation_hook( __FILE__, array( 'ogd_rabbitmq_worker', 'on_deactivation' ) );

final class ogd_rabbitmq_worker {

    public function __construct() {
        hm_add_rewrite_rule( array(
    		'rewrite' => '^api/get-queue',
    		'request_callback' => function() {
    			echo 'get the queue'; die;
    		}
    	) );
    }

    public static function on_deactivation() {
        flush_rewrite_rules( ); // Hard Reset including transient
    }
}

new ogd_rabbitmq_worker();