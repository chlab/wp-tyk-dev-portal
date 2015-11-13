var expect = require('chai').expect;
var Promise = require('promise');
var exec = require('child_process').exec;

module.exports = {
    dataset_is_available: function(datasetSlug, callback) {
        var me = this;
        return new Promise(function(resolve, reject) {
            me.browser.visit('/dataset/' + datasetSlug)
                .then(function() {
                    return me.browser.wait();
                })
                .then(function() {
                    console.log("Opened dataset in CKAN");
                    expect(me.browser.status).to.equal(200);
                    resolve();
                })
                .catch(function(err) {
                    me.browser.dump();
                    console.log(me.browser.html());
                    exec("sudo cat /var/log/httpd/ckan_default.error.log", function (error, stdout, stderr) {
                        console.log('stdout: ' + stdout);
                        console.log('stderr: ' + stderr);

                        console.log("Finished printing logs.");
                        reject(err);
                    });
                });
        });
    },
    dataset_is_unavailable: function(datasetSlug) {
        var me = this;
        return new Promise(function(resolve, reject) {
            me.browser.visit('/dataset/' + datasetSlug)
                .then(function() {
                    return me.browser.wait();
                })
                .then(function () {
                    console.log("Opened dataset in CKAN");
                    if (me.browser.status === 404) {
                        console.log("Got a 404 page, dataset is not available");
                        resolve();
                        return;
                    } 
                    // check if we got redirected to the login page
                    expect(me.browser.text('h1.page-heading')).to.equal('Anmeldung');
                    resolve();
                })
                .catch(function(err) {
                    me.browser.dump();
                    console.log(me.browser.html());
                    exec("sudo cat /var/log/httpd/ckan_default.error.log", function (error, stdout, stderr) {
                        console.log('stdout: ' + stdout);
                        console.log('stderr: ' + stderr);

                        console.log("Finished printing logs.");
                        reject(err);
                    });
                });
        });
    },
    get_org_image: function(orgSlug) {
        var me = this;
        return new Promise(function(resolve, reject) {
            me.browser.visit('/organization/' + orgSlug)
                .then(function() {
                    return me.browser.wait();
                })
                .then(function () {
                    console.log("Opened organization page in CKAN");
                    expect(me.browser.status).to.equal(200);
                    var org_image = me.browser.querySelector('section.description img').src;
                    resolve(org_image);
                })
                .catch(reject);
        });
    },
    get_org_descr: function(orgSlug) {
        var me = this;
        return new Promise(function(resolve, reject) {
            me.browser.visit('/organization/' + orgSlug)
                .then(function() {
                    return me.browser.wait();
                })
                .then(function () {
                    console.log("Opened organization page in CKAN");
                    expect(me.browser.status).to.equal(200);
                    var org_descr = me.browser.querySelector('p.lead').innerHTML;
                    resolve(org_descr);
                })
                .catch(reject);
        });
    }
};
