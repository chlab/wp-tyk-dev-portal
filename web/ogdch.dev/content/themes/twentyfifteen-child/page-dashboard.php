<?php
/**
 * Template Name: Developer Dashboard
 */

get_header(); ?>

	<div id="primary" class="content-area">
		<main id="main" class="site-main" role="main">
			
				<article class="page type-page hentry">
					<?php tyk_dev_portal_api_subscribe_form()?>
					<div class="entry-content">
						<h2>Dashboard</h2>

						<label for="tyk-api-select">Subscribe to an API:</label>
						<?php tyk_dev_portal_api_select()?>
						<div>
							<div id="tyk-subscribe-success"></div>
							<div id="tyk-subscribe-error"></div>
						</div>
						<div style="margin-top: 1em;"><input type="submit" id="btn-tyk-api-subscribe" value="Subscribe" /></div>
					</div>
					</form>
				</article>

		</main><!-- .site-main -->
	</div><!-- .content-area -->

	<script>
		;(function($) {
			$('#btn-tyk-api-subscribe').click(function(e) {
				e.preventDefault();
				var data = { 
					action: 'get_token',
					api: $('#tyk-api-select').val()
				};
				$.post('<?php echo esc_url(admin_url('admin-ajax.php'))?>', data)
					.done(function(result) {
						console.log(result);
						if (result && result.success) {
							$('#tyk-subscribe-success').html(result.data.message);
						}
						else {
							$('#tyk-subscribe-error').html('An error occurred. Please try again.');
							console.error(result);
						}
					});
			});
		})(jQuery);
	</script>

<?php get_footer(); ?>
