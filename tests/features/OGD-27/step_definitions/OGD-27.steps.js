var expect = require('chai').expect;
var Promise = require('promise');


module.exports = function () {
    this.World = require("../../support/world.js").World; // overwrite default World constructor

    var datasetUrl = null;
    var datasetSlug = null;

    this.Given(/hat einen Datensatz erfasst$/, function (callback) {
        var me = this;
        me.helpers.login('priska', 'priska', function(err) {
            if (err) {
                callback.fail(err);
                return;
            }
            var now = new Date();
            me.helpers.create_post('ckan-local-dataset', "Test " + now.getTime(), function(err, post_edit_url, slug) {
                if (err) {
                    callback.fail(err);
                    return;
                }
                datasetUrl = post_edit_url;
                datasetSlug = slug;
                me.helpers.logout(callback);
            });
        });
    });

    this.Given(/^dieser befindet sich nun im Status "([^"]*)"$/, function (status, callback) {
        var me = this;

        me.helpers.login('priska', 'priska', function(err) {
            if (err) {
                callback.fail(err);
                return;
            }
            var new_status_id = me.helpers.status_id(status);
            me.helpers.change_status_of_post(datasetUrl, new_status_id, function(err) {
                if (err) {
                    callback(err);
                    return;
                }
                me.helpers.logout(callback);
            });
        });
    });

    this.Given(/^opendata\.swiss zeigt ihn noch nicht an$/, function (callback) {
        var me = this;
        me.helpers.dataset_is_unavailable(datasetSlug, function(err) {
            if (err) {
                callback.fail(err);
                return;
            }
            console.log("Dataset is not available in CKAN");
            callback();
        });
    });

    this.Given(/^Alain ändert den Status auf "([^"]*)"$/, function (status, callback) {
        var me = this;
        me.helpers.login('alain', 'alain', function(err) {
            if (err) {
                callback(err);
                return;
            }
            var new_status_id = me.helpers.status_id(status);
            me.helpers.change_status_of_post(datasetUrl, new_status_id, function(err) {
                if (err) {
                    callback.fail(err);
                    return;
                }
                me.helpers.logout(callback);
            })
        });
    });

    this.Given(/^zeigt opendata\.swiss ihn weiterhin nicht an\.$/, function (callback) {
        var me = this;
        me.helpers.dataset_is_unavailable(datasetSlug, function(err) {
            if (err) {
                callback.fail(err);
                return;
            }
            console.log("Dataset is not available in CKAN");
            callback();
        });
    });

    this.Given(/^Priska veröffentlicht einen bisher unveröffentlichten Datensatz$/, function (callback) {
        var me = this;
        me.helpers.login('priska', 'priska', function(err) {
            if (err) {
                callback.fail(err);
                return;
            }
            var now = new Date();
            me.helpers.create_post('ckan-local-dataset', "Publish test " + now.getTime(), function(err, post_edit_url, slug) {
                if (err) {
                    callback(err);
                    return;
                }
                console.log("Dataset created as draft");
                datasetUrl = post_edit_url;
                datasetSlug = slug;

                me.helpers.change_status_of_post(datasetUrl, 'published', function(err) {
                    if (err) {
                        callback.fail(err);
                        return;
                    }
                    console.log("Dataset published");
                    me.helpers.logout(callback);
                })
            });
        });
    });

    this.Given(/^befindet sich dieser anschliessend im Status "([^"]*)"$/, function (status, callback) {
        var me = this;
        me.helpers.login('priska', 'priska', function(err) {
            if (err) {
                callback.fail(err);
                return;
            }

            var expected_status_id = me.helpers.status_id(status);
            me.helpers.check_status_of_post(datasetUrl, expected_status_id, function(err) {
                if (err) {
                    callback.fail(err);
                    return;
                }
                me.helpers.logout(callback);
            });
        });
    });

    this.Given(/^opendata\.swiss zeigt ihn an$/, function (callback) {
        var me = this;
        me.helpers.dataset_is_available(datasetSlug, function(err) {
            if (err) {
                callback.fail(err);
                return;
            }
            console.log("Dataset is available in CKAN");
            callback();
        });
    });

    this.Given(/^Priska hat einen veröffentlichten Datensatz$/, function (callback) {
        var me = this;
        me.helpers.login('priska', 'priska', function(err) {
            if (err) {
                callback.fail(err);
                return;
            }

            var now = new Date();
            me.helpers.create_post('ckan-local-dataset', "Publish test " + now.getTime(), function(err, post_edit_url, slug) {
                if (err) {
                    callback.fail(err);
                    return;
                }
                datasetUrl = post_edit_url;
                datasetSlug = slug;

                me.helpers.change_status_of_post(datasetUrl, 'published', function(err) {
                    if (err) {
                        callback.fail(err);
                        return;
                    }
                    me.helpers.logout(callback);
                })
            });
        });
    });

    this.Given(/^Priska ändert den Status auf "([^"]*)"$/, function (status, callback) {
        var me = this;
        me.helpers.login('priska', 'priska', function(err) {
            if (err) {
                callback(err);
                return;
            }

            var new_status_id = me.helpers.status_id(status);
            me.helpers.change_status_of_post(datasetUrl, new_status_id, function(err) {
                if (err) {
                    callback.fail(err);
                    return;
                }
                me.helpers.logout(callback);
            })
        });
    });

    this.Given(/^opendata\.swiss zeigt ihn nicht mehr an$/, function (callback) {
        var me = this;
        me.helpers.dataset_is_unavailable(datasetSlug, function(err) {
            if (err) {
                callback.fail(err);
                return;
            }
            console.log("Dataset is not available in CKAN");
            callback();
        });
    });

};
