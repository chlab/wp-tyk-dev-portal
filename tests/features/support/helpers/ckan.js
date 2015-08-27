var expect = require('chai').expect;
var Promise = require('promise');

module.exports = {
    dataset_is_available: function(datasetSlug, callback) {
        var me = this;
        me.visit('/dataset/' + datasetSlug, function (err) {
            if (err) {
                callback(err);
                return;
            }
            console.log("Opened dataset in CKAN");

            try {
                expect(me.browser.status).to.equal(200);
                callback();
            } catch(err) {
                callback(err);
            }
        });
    },
    dataset_is_unavailable: function(datasetSlug, callback) {
        var me = this;
        me.visit('/dataset/' + datasetSlug, function (err) {
            if (err) {
                callback(err);
                return;
            }
            console.log("Opened dataset in CKAN");

            if (me.browser.status === 404) {
                console.log("Got a 404 page, dataset is not available");
                callback();
                return;
            }

            try {
                expect(me.browser.query('div.flash-messages .alert')).to.exist;
                callback();
            } catch(err) {
                callback(err);
            }
        });
    }
};