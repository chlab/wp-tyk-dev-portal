var expect = require('chai').expect;
var Promise = require('promise');

var availableStatus = {
    'draft': 'Draft',
    'pending': 'Pending Review',
    'published': 'Published'
};


module.exports = {
    login: function (username, password) {
        var me = this;
        return new Promise(function(resolve, reject) {
            me.browser.visit('/cms/wp-login.php')
                .then(function() {
                    me.browser
                        .fill("#user_login", username)
                        .fill("#user_pass", password)
                    return me.browser.pressButton("#wp-submit");
                })
                .then(function() {
                    expect(me.browser.text('title')).to.match(/^(Profile|Dashboard)/);
                    console.log("Logged in as " + username);
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
    create_post: function(post_type, title) {
        var me = this;
        return new Promise(function(resolve, reject) {
            me.browser.visit('/cms/wp-admin/edit.php?post_type=' + post_type)
                .then(function() {
                    return me.browser.clickLink("Add New")
                })
                .then(function() {
                    console.log("Add new post");
                    me.browser.fill("#title", title);
                    return me.browser.pressButton("#save-post");
                })
                .then(function() {
                    return me.browser.wait();
                })
                .then(function() {
                    console.log("Added post");
                    expect(me.browser.text('#message p')).to.match(/^Post draft updated/);
                    expect(me.browser.query("div[class='error']")).not.to.exist;
                    var datasetUrl = me.browser.location.href;
                    var datasetSlug = me.browser.query("#_ckan_local_dataset_ckan_name").value;
                    resolve({
                        'slug': datasetSlug,
                        'url': datasetUrl
                    });
                })
                .catch(function(err) {
                    reject(err);
                    if (me.browser.query("div[class='error']")) {
                        console.log("Error:", me.browser.query("div[class='error']").innerHTML);
                    }
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
    change_status_of_post: function(post_edit_url, new_status_id, callback) {
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
    }
};