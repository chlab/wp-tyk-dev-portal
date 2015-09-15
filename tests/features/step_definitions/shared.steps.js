module.exports = function () {
    this.World = require("../support/world.js").World; // overwrite default World constructor

    this.Given(/(.*) hat einen Datensatz "([^"]*)" erfasst$/, function (person, title, callback) {
        var me = this;
        me.username = person.toLowerCase();
        me.helpers.login(me.username)
            .then(function() {
                var now = new Date();
                return me.helpers.create_dataset(title + " " + now.getTime());
            })
            .then(function(post_data) {
                me.datasetUrl = post_data['url'];
                me.datasetSlug = post_data['slug'];
                return me.helpers.logout();
            })
            .then(callback)
            .catch(function(err) {
                callback.fail(err);
            });
    });

    this.Given(/(.*) ändert den Status auf "([^"]*)"$/, function (person, status, callback) {
        var me = this;
        me.username = person.toLowerCase();
        me.helpers.login(me.username)
            .then(function() {
                var new_status_id = me.helpers.status_id(status);
                return me.helpers.change_status_of_post(me.datasetUrl, new_status_id);
            })
            .then(function() {
                return me.helpers.logout();
            })
            .then(callback)
            .catch(function(err) {
                callback.fail(err);
            });
    });

    this.Given(/.*befindet sich.*im Status "([^"]*)"$/, function (status, callback) {
        var me = this;
        me.helpers.login(me.username)
            .then(function() {
                var expected_status_id = me.helpers.status_id(status);
                return me.helpers.check_status_of_post(me.datasetUrl, expected_status_id);
            })
            .then(function() {
                return me.helpers.logout();
            })
            .then(callback)
            .catch(function(err) {
                callback.fail(err);
            });
    });

    this.Given(/ist dieser nicht auffindbar auf opendata\.swiss$/, function (callback) {
        var me = this;
        me.helpers.dataset_is_unavailable(me.datasetSlug)
            .then(callback)
            .catch(function(err) {
                callback.fail(err);
            });
    });

    this.Given(/ist dieser auffindbar auf opendata\.swiss$/, function (callback) {
        var me = this;
        me.helpers.dataset_is_available(me.datasetSlug)
            .then(callback)
            .catch(function(err) {
                callback.fail(err);
            });
    });
};
