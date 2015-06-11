<h4><?php the_title(); ?></h4>
<p>
    <?php echo get_post_meta( get_the_id(), '_ckandataset_reference', true ); ?>
</p>
<p><?php the_terms( get_the_id(), 'ckan_group', 'groups: ', ' / ' ); ?></p>
<p><?php the_terms( get_the_id(), 'ckan_organisation', 'orgs: ', ' / ' ); ?></p>

<hr />