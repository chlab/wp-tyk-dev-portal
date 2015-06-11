<?php

// =======================================================================//
// AJAX Endpoints (Move big functions into theme_functions.php)
// =======================================================================//


function ckan_search() {
    $return = array( 'status' => 'error' );


    $endpoint = CKAN_SEARCH_API_ENDPOINT . '?' . $_POST['q'];
    $response = wp_remote_get( $endpoint );
    $response = json_decode( $response['body'] );



    $return['count'] = $response->count;
    $results = $response->results;

    if( sizeof( $results ) > 0 ) {
        $include = array();
        foreach( $results as $slug ) {
            $args = array (
                'name'                  => $slug,
                'post_type'              => 'ckan-dataset',
                'post_status'            => 'any',
                'fields'                 => 'ids',
                'numberposts'            => 1,
            );

            $res = get_posts( $args );
            $include[] = get_ckan_dataset_master_by_lang( $res[0], pll_current_language() );
        }

        $query_args = array (
            'post_type'              => 'ckan-dataset',
            'post_status'            => 'any',
            'post__in'               => $include,
            'numberposts'            => 100,
        );

        $ckan_query = new WP_Query( $query_args );

        if ( $ckan_query->have_posts() ) {
            ob_start();

            $av_groups = array();
            $av_orgs = array();

            while ( $ckan_query->have_posts() ) : $ckan_query->the_post();

                get_template_part( 'partials/search', 'result-short' );

                $meta = json_decode( get_post_meta( get_the_id(), '_ckandataset_response', true ) );
                $set = $meta->result;
                foreach( $set->groups as $group ) {
                    if( !isset ( $av_groups[$group->name]['count'] ) )
                        $av_groups[$group->name]['count'] = 0;

                    $av_groups[$group->name]['count']++;
                }

                $org = $set->organization;


                if( !isset ( $av_orgs[$org->name]['count'] ) )
                        $av_orgs[$org->name]['count'] = 0;

                $av_orgs[$org->name]['count']++;

            endwhile;

            $return['groups'] = json_encode( $av_groups );
            $return['orgs'] = json_encode( $av_orgs );

            $return['html'] = ob_get_clean();
        }


    }



    $return['status'] = 'success';

    header( 'Content: application/json' );
    echo json_encode( $return );
    die;

}

add_action( 'wp_ajax_ckan_search_action', 'ckan_search' );
add_action( 'wp_ajax_nopriv_ckan_search_action', 'ckan_search' );


function get_ckan_dataset_master_by_lang( $ID, $lang ) {
    $term            = wp_get_post_terms( $ID, 'post_translations' );
    $post_connection = unserialize( $term[0]->description );

    return $post_connection[$lang];
}