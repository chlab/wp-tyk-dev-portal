var expect = require('chai').expect;
var Promise = require('promise');

var availableStatus = {
    'draft': 'Draft',
    'pending': 'Pending Review',
    'published': 'Published'
};

module.exports = {
    login: function (username, password, callback) {
        var me = this;
        me.browser.visit('/cms/wp-login.php', function(err) {
            if (err) {
                callback(err);
                return;
            }
            me.browser
                .fill("#user_login", username)
                .fill("#user_pass", password)
                .pressButton("#wp-submit", function() {
                    try {
                        expect(me.browser.text('title')).to.match(/^(Profile|Dashboard)/);
                        console.log("Logged in as " + username);
                        callback();
                    } catch(err) {
                        callback(err);
                    }
                });
        });
    },
    logout: function(callback) {
        var me = this;
        me.browser.visit('/cms/wp-login.php?loggedout=true', function(err) {
            if (err) {
                callback(err);
                return;
            }
            console.log("Logged out");
            callback();
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
    create_post: function(post_type, title, callback) {
        var me = this;
        me.visit(
            '/cms/wp-admin/edit.php?post_type=' + post_type,
            function(err) {
                if (err) {
                    callback(err);
                    return;
                }
                me.browser.clickLink("Add New", function(err) {
                    if (err) {
                        callback(err);
                        return;
                    }
                    console.log("Add new post");
                    me.browser
                        .fill("#title", title)
                        .pressButton("#save-post", function(err) {
                            if (err) {
                                callback(err);
                                return;
                            }
                            console.log("Added post");
                            try {
                                expect(me.browser.text('#message p')).to.match(/^Post draft updated/);
                                expect(me.browser.query("div[class='error']")).not.to.exist;

                                var datasetUrl = me.browser.location.href;
                                var datasetSlug = me.browser.query("#_ckan_local_dataset_ckan_name").value;

                                callback(null, datasetUrl, datasetSlug);
                            } catch(err) {
                                callback(err);
                                if (me.browser.query("div[class='error']")) {
                                    console.log("Error:", me.browser.query("div[class='error']").innerHTML);
                                }
                            }
                        });
                })
            }
        );
    },
    check_status_of_post: function(post_edit_url, expected_status_id, callback) {
        var me = this;
        me.visit(post_edit_url, function (err) {
            if (err) {
                callback(err);
                return;
            }
            console.log("Opened post edit page");

            try {
                expect(me.browser.text('#post-status-display')).to.equal(availableStatus[expected_status_id]);
                callback();
            } catch (err) {
                callback(err);
            }
        });
    },
    change_status_of_post: function(post_edit_url, new_status_id, callback) {
        var me = this;
        me.visit(post_edit_url, function (err) {
            if (err) {
                callback(err);
                return;
            }
            console.log("Opened post edit page");

            try {
                // return directly if the post already is in the requested status
                if (me.browser.text('#post-status-display') === availableStatus[new_status_id]) {
                    callback();
                    return;
                }

                var button_to_save = '#publish';
                if (new_status_id !== 'published') {
                    me.browser.select('#post_status', new_status_id);
                    button_to_save = '#save-post';
                }

                try {
                    me.browser.pressButton(button_to_save, function (err) {
                        if (err) {
                            callback(err);
                            return;
                        }
                        console.log("Updated post");
                        try {
                            expect(me.browser.text('#post-status-display')).to.equal(availableStatus[new_status_id]);
                            callback();
                        } catch (err) {
                            callback(err);
                        }
                    });
                }
                catch (err) {
                    me.browser
                        .pressButton("#publish", function (err) {
                            if (err) {
                                callback(err);
                                return;
                            }
                            console.log("Updated post");
                            try {
                                expect(me.browser.text('#post-status-display')).to.equal(availableStatus[new_status_id]);
                                callback();
                            } catch (err) {
                                callback(err);
                            }
                        });
                }
            } catch (err) {
                callback(err);
            }
        });
    }
};