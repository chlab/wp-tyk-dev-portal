<h2>Newest shiny datasets!</h2>

<?php
$args = array(
	'post_type' => 'ckan-dataset',
	'order'     => 'DESC',
);

// The Query
$the_datasets_query = new WP_Query( $args );

// The Loop
if ( $the_datasets_query->have_posts() ) {
	echo '<ul>';
	while ( $the_datasets_query->have_posts() ) {
		$the_datasets_query->the_post();
		echo '<li><a href="' . get_permalink() . '">' . get_the_title() . '</a></li>';
	}
	echo '</ul>';
} else {
	echo '<p>Nothing there</p>';
}
/* Restore original Post Data */
wp_reset_postdata();