<?php
/**
 * Template Name: Developer Dashboard
 */
get_header();
?>

	<div id="primary" class="content-area">
		<main id="main" class="site-main" role="main">
			
				<article class="page type-page hentry">
					<div class="entry-content">
						<?php tyk_dev_portal_dashboard()?>
					</div>
				</article>

		</main><!-- .site-main -->
	</div><!-- .content-area -->

<?php get_footer(); ?>
