var expect = require('chai').expect;


module.exports = function () {
    this.World = require("../../support/world.js").World; // overwrite default World constructor

    var datasetUrl = null;
    var datasetSlug = null;

    this.Given(/hat einen Datensatz erfasst$/, function (callback) {
        var me = this;
        me.helpers.login('priska', 'priska')
            .then(function() {
                var now = new Date();
                return me.helpers.create_post('ckan-local-dataset', "Test " + now.getTime());
            })
            .then(function(post_data) {
                datasetUrl = post_data['url'];
                datasetSlug = post_data['slug'];
                return me.helpers.logout();
            })
            .then(callback)
            .catch(function(err) {
                callback.fail(err);
            });
    });

    this.Given(/^dieser befindet sich nun im Status "([^"]*)"$/, function (status, callback) {
        var me = this;

        me.helpers.login('priska', 'priska')
            .then(function() {
                var new_status_id = me.helpers.status_id(status);
                return me.helpers.change_status_of_post(datasetUrl, new_status_id);
            })
            .then(me.helpers.logout())
            .then(callback)
            .catch(function(err) {
                callback.fail(err);
            });
    });

    this.Given(/^opendata\.swiss zeigt ihn noch nicht an$/, function (callback) {
        var me = this;
        me.helpers.dataset_is_unavailable(datasetSlug)
            .then(callback)
            .catch(function(err) {
                callback.fail(err);
            });
    });

    this.Given(/^Alain ändert den Status auf "([^"]*)"$/, function (status, callback) {
        var me = this;
        me.helpers.login('alain', 'alain')
            .then(function() {
                var new_status_id = me.helpers.status_id(status);
                return me.helpers.change_status_of_post(datasetUrl, new_status_id)
            })
            .then(me.helpers.logout())
            .then(callback)
            .catch(function(err) {
                callback.fail(err);
            });
    });

    this.Given(/^zeigt opendata\.swiss ihn weiterhin nicht an\.$/, function (callback) {
        var me = this;
        me.helpers.dataset_is_unavailable(datasetSlug)
            .then(callback)
            .catch(function(err) {
                callback.fail(err);
            });
    });

    this.Given(/^Priska veröffentlicht einen bisher unveröffentlichten Datensatz$/, function (callback) {
        var me = this;
        me.helpers.login('priska', 'priska')
            .then(function() {
                var now = new Date();
                return me.helpers.create_post('ckan-local-dataset', "Publish test " + now.getTime());
            })
            .then(function(post_data) {
                console.log("Dataset created as draft");
                datasetUrl = post_data['url'];
                datasetSlug = post_data['slug'];
                return me.helpers.change_status_of_post(datasetUrl, 'published');
            })
            .then(function() {
                console.log("Dataset published");
                return me.helpers.logout();
            })
            .then(callback)
            .catch(function(err) {
                callback.fail(err);
            });
    });

    this.Given(/^befindet sich dieser anschliessend im Status "([^"]*)"$/, function (status, callback) {
        var me = this;
        me.helpers.login('priska', 'priska')
            .then(function() {
                var expected_status_id = me.helpers.status_id(status);
                return me.helpers.check_status_of_post(datasetUrl, expected_status_id);
            })
            .then(me.helpers.logout())
            .then(callback)
            .catch(function(err) {
                callback.fail(err);
            });
    });

    this.Given(/^opendata\.swiss zeigt ihn an$/, function (callback) {
        var me = this;
        me.helpers.dataset_is_available(datasetSlug)
            .then(callback)
            .catch(function(err) {
                callback.fail(err);
            });
    });

    this.Given(/^Priska hat einen veröffentlichten Datensatz$/, function (callback) {
        var me = this;
        me.helpers.login('priska', 'priska')
            .then(function() {
                var now = new Date();
                return me.helpers.create_post('ckan-local-dataset', "Publish test " + now.getTime());
            })
            .then(function(post_data) {
                datasetUrl = post_data['url'];
                datasetSlug = post_data['slug'];
                return me.helpers.change_status_of_post(datasetUrl, 'published');
            })
            .then(me.helpers.logout())
            .then(callback)
            .catch(function(err) {
                callback.fail(err);
            });
    });

    this.Given(/^Priska ändert den Status auf "([^"]*)"$/, function (status, callback) {
        var me = this;
        me.helpers.login('priska', 'priska')
            .then(function() {
                var new_status_id = me.helpers.status_id(status);
                return me.helpers.change_status_of_post(datasetUrl, new_status_id);
            })
            .then(me.helpers.logout())
            .then(callback)
            .catch(function(err) {
                callback.fail(err);
            });
    });

    this.Given(/^opendata\.swiss zeigt ihn nicht mehr an$/, function (callback) {
        var me = this;
        me.helpers.dataset_is_unavailable(datasetSlug)
            .then(function() {
                console.log("Dataset is not available in CKAN");
                callback();
            })
            .catch(function(err) {
                callback.fail(err);
            });
    });

};
