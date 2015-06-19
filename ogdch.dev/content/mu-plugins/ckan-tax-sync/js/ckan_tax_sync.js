jQuery(function() {
    var $ = jQuery.noConflict();

    $( '#ckan_tax_sync_groups, #ckan_tax_sync_organisations' ).click(function(e) {

        var data = {
			'action': this.name + '_action',
		};

		var status_div = $('#' + this.name + '_status');
        status_div.html('');

        $.post(ajaxurl, data, function(response) {
                status_div.html('Loading Data ...');
            })
            .done(function(response) {
                var response = jQuery.parseJSON(response);

                if( 'success' == response.status ) {
                    status_div.html('Import finished with status:  <span style="color:green;font-weight:bold">' + response.status + '</span> and message <b>' + response.message + '</b>');
                } else {
                    status_div.html('Import failed with status: <span style="color:red;font-weight:bold">' + response.status + '</span> and message <b>' + response.message + '</b>');
                }
            })
            .fail(function(response) {
                var response = jQuery.parseJSON(response);
                status_div.html('XHTTP Request failed');
        });


        e.preventDefault();
    });

});