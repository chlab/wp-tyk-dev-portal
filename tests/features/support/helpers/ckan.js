var expect = require('chai').expect;
var Promise = require('promise');

module.exports = {
    dataset_is_available: function(datasetSlug, callback) {
        var me = this;
        return new Promise(function(resolve, reject) {
            me.browser.visit('/dataset/' + datasetSlug)
                .then(function() {
                    console.log("Opened dataset in CKAN");
                    expect(me.browser.status).to.equal(200);
                    resolve();
                })
                .catch(reject);
        });
    },
    dataset_is_unavailable: function(datasetSlug) {
        var me = this;
        return new Promise(function(resolve, reject) {
            me.browser.visit('/dataset/' + datasetSlug)
                .then(function () {
                    console.log("Opened dataset in CKAN");
                    if (me.browser.status === 404) {
                        console.log("Got a 404 page, dataset is not available");
                        resolve();
                        return;
                    }
                    expect(me.browser.query('div.flash-messages .alert')).to.exist;
                    resolve();
                })
                .catch(reject);
        });
    },
    get_org_image: function(orgSlug) {
        var me = this;
        return new Promise(function(resolve, reject) {
            me.browser.visit('/organization/' + orgSlug)
                .then(function () {
                    console.log("Opened organization page in CKAN");
                    expect(me.browser.status).to.equal(200);
                    var org_image = me.browser.querySelector('.secondary div.image img').src;
                    resolve(org_image);
                })
                .catch(reject);
        });
    }
};