$( function() {

    var body = $('body');


    $( "#ckan_search" ).submit(function( event ) {
                var form_data = $(this).serialize();


                $.post(ogdAjax.ajaxurl, {
                    action  : 'ckan_search_action',
                    nonce   : ogdAjax.submissionNonce,
                    q       : form_data
                },
                function( raw_response, textStatus, jqXHR ) {
                    var response = jQuery.parseJSON(raw_response);


                    if( 'success' == response.status ) {
                        if( response.count == 0 ) {
                            $('#results').html('Nüt gfunde');
                        } else {
                            $('#results').html(response.html);

                            groups = $.parseJSON( response.groups );
                            orgs = $.parseJSON( response.orgs );
                            console.log(orgs);

                            $('.facet__term').addClass('facet__term--disabled');
                            $('.facet__term span').html('0');

                            $.each(groups, function(slug, item) {

                                $('.group__' + slug).removeClass('facet__term--disabled');
                                $('.group__' + slug + ' span').html(item.count);
                            });

                            $.each(orgs, function(slug, item) {
                                console.log(slug);
                                console.log(item);
                                $('.org__' + slug).removeClass('facet__term--disabled');
                                $('.org__' + slug + ' span').html(item.count);
                            });
                        }

                    } else {

                    }

                });

        event.preventDefault();
    });

});