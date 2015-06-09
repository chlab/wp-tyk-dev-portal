<?php get_header(); ?>


	<div class="grid">
		<div class="grid__col grid__col--12-of-12">
			<?php get_template_part( 'partials/frontpage', 'datasets' ); ?>

			<?php get_template_part( 'partials/frontpage', 'groups' ); ?>
		</div>
	</div>

<?php get_footer(); ?>