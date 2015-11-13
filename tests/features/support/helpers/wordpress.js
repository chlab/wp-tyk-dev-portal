var expect = require('chai').expect;
var Promise = require('promise');

var availableStatus = {
    'draft': 'Entwurf',
    'pending': 'Ausstehender Review',
    'published': 'Veröffentlich'
};


module.exports = {
    login: function (username) {
        var me = this;
        return new Promise(function(resolve, reject) {
            me.browser.visit('/cms/wp-login.php')
                .then(function() {
                    me.browser
                        .fill("#user_login", username)
                        .fill("#user_pass", username)
                    return me.browser.pressButton("#wp-submit");
                })
                .then(function() {
                    return me.browser.wait();
                })
                .then(function() {
                    expect(me.browser.text('title')).to.match(/^(Profile|Dashboard)/);
                    console.log("Logged in as " + username);
                })
                .then(function() {
                    resolve();
                })
                .catch(reject);
        });
    },
    logout: function() {
        var me = this;
        return new Promise(function(resolve, reject) {
            me.browser.visit('/cms/wp-login.php?loggedout=true')
                .then(function() {
                    console.log("Logged out");
                })
                .then(function() {
                    return me.browser.wait();
                })
                .then(function() {
                    resolve();
                })
                .catch(reject);
        });
    },
    status_id: function(text) {
        var wpStatus;
        switch (text) {
            case 'in Bearbeitung':
                wpStatus = 'draft'
                break;
            case 'validiert':
                wpStatus = 'pending'
                break;
            default:
                wpStatus = 'published'
        }
        return wpStatus;
    },
    status_text: function(text) {
        var wpStatus = this.status_id(text);
        return availableStatus[wpStatus];
    },
    create_dataset: function(title) {
        var me = this;
        return new Promise(function(resolve, reject) {
            me.browser.visit('/cms/wp-admin/post-new.php?post_type=ckan-local-dataset')
                .then(function() {
                    return me.browser.wait();
                })
                .then(function() {
                    console.log("Add new dataset");
                    me.browser
                        .fill("#title", title)
                        .fill('#_ckan_local_dataset_identifier_original_identifier', '123')
                        .fill('#_ckan_local_dataset_description_en', title + ' EN')
                        .fill('#_ckan_local_dataset_description_fr', title + ' FR')
                        .fill('#_ckan_local_dataset_description_de', title + ' DE')
                        .fill('#_ckan_local_dataset_description_it', title + ' IT')
                        .fill('#_ckan_local_dataset_issued', '01.01.2015')
                        .fill('#_ckan_local_dataset_publishers_0_label', 'Test Publisher')
                        .fill('#_ckan_local_dataset_contact_points_0_name', 'Sekretariat')
                        .fill('#_ckan_local_dataset_contact_points_0_email', 'sekretariat@example.com')
                        .fill('#_ckan_local_dataset_distributions_0_issued', '02.02.2015')
                        .fill('#_ckan_local_dataset_distributions_0_access_url', 'http://access.url')
                    return me.browser.pressButton("#save-post");
                })
                .then(function() {
                    return me.browser.wait();
                })
                .then(function() {
                    console.log("Added dataset");
                    expect(me.browser.text('#message p')).to.match(/^Datensatz.*aktualisiert/);
                    expect(me.browser.query("div[class='error']")).not.to.exist;
                    var datasetUrl = me.browser.location.href;
                    var datasetSlug = me.browser.query("#_ckan_local_dataset_ckan_name").value;
                    resolve({
                        'slug': datasetSlug,
                        'url': datasetUrl
                    });
                })
                .catch(function(err) {
                    if (me.browser.query("div[class='error']")) {
                        console.log("Error:", me.browser.query("div[class='error']").innerHTML);
                    }
                    console.log(me.browser.debug());
                    console.log(me.browser.html());
                    console.log("Slug:", me.browser.query("#_ckan_local_dataset_ckan_name"));
                    reject(err);
                });
        });

    },
    check_status_of_post: function(post_edit_url, expected_status_id) {
        var me = this;
        return new Promise(function(resolve, reject) {
            me.browser.visit(post_edit_url)
                .then(function() {
                    return me.browser.wait();
                })
                .then(function() {
                    console.log("Opened post edit page");
                    expect(me.browser.text('#post-status-display')).to.equal(availableStatus[expected_status_id]);
                    resolve()
                })
                .catch(reject);
        });


    },
    change_status_of_post: function(post_edit_url, new_status_id) {
        var me = this;
        return new Promise(function(resolve, reject) {
            me.browser.visit(post_edit_url)
                .then(function() {
                    return me.browser.wait();
                })
                .then(function() {
                    console.log("Opened post edit page");

                    var button_to_save = '#publish';
                    if (new_status_id !== 'published') {
                        me.browser.select('#post_status', new_status_id);
                        button_to_save = '#save-post';
                    }
                    return me.browser.pressButton(button_to_save);
                })
                .then(function() {
                    return me.browser.wait();
                })
                .then(function() {
                    console.log("Updated post");
                    expect(me.browser.text('#post-status-display')).to.equal(availableStatus[new_status_id]);
                })
                .catch(function() {
                    return me.browser.pressButton("#publish");
                })
                .then(function() {
                    return me.browser.wait();
                })
                .then(function() {
                    console.log("Updated post");
                    expect(me.browser.text('#post-status-display')).to.equal(availableStatus[new_status_id]);
                    resolve();
                })
                .catch(reject);
        });
    },
    change_title_of_dataset: function(post_edit_url, title) {
        var me = this;
        return new Promise(function(resolve, reject) {
            me.browser.visit(post_edit_url)
                .then(function() {
                    return me.browser.wait();
                })
                .then(function() {
                    console.log("Opened post edit page");
                    me.browser
                        .fill("#title", title)
                        .fill("#_ckan_local_dataset_title_en", title)
                        .fill("#_ckan_local_dataset_title_de", title)
                        .fill("#_ckan_local_dataset_title_fr", title)
                        .fill("#_ckan_local_dataset_title_it", title);
                    return me.browser.pressButton('#publish');
                })
                .then(function() {
                    return me.browser.wait();
                })
                .then(function() {
                    console.log("Updated post");
                    expect(me.browser.text('#message p')).to.match(/^Datensatz publiziert/);
                    expect(me.browser.query('#title').value).to.equal(title);
                    resolve();
                })
                .catch(reject);
        });
    }
};
