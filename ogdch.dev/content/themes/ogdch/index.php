<?php get_header(); ?>

<?php if ( have_posts() ) : ?>
	<?php while ( have_posts() ) : the_post();?>
		<h1 class="post__title"><?php the_title(); ?></h1>
	<?php endwhile; ?>

<?php else : ?>
    Nix gefunden
<?php endif; ?>


<?php get_footer(); ?>
