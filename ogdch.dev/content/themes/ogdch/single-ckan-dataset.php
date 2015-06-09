<?php get_header(); ?>

<?php if ( have_posts() ) : ?>
	<?php while ( have_posts() ) : the_post();?>
		<h1 class="post__title"><?php the_title(); ?></h1>
		<h2>Ref ID</h2>
		<?php var_dump( get_post_meta( get_the_ID(), '_ckandataset_reference' , true ) ); ?>

        <h2>Last update</h2>
		<?php var_dump( get_post_meta( get_the_ID(), '_ckandataset_last_request' , true ) ); ?>


		<h2>Data</h2>
		<pre><?php echo get_ckan_dataset( get_the_ID(), get_post_meta( get_the_ID(), '_ckandataset_name' , true ) ); ?></pre>


		<h2>Master Post</h2>
		<?php echo get_the_title( get_ckan_dataset_master( get_the_ID() ) ); ?>
	<?php endwhile; ?>

<?php else : ?>
    Nix gefunden
<?php endif; ?>

<?php comments_template(); ?>

<?php get_footer(); ?>
