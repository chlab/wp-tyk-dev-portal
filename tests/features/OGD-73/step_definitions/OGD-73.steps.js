var expect = require('chai').expect;
var Promise = require('promise');


module.exports = function () {
    this.World = require("../../support/world.js").World; // overwrite default World constructor

    var logoPath = null;

    this.Given(/^es besteht ein Logo "([^"]*)"$/, function (filename, callback) {
        var me = this;
        me.helpers.file_exists(__dirname, filename, function(err, path) {
            if (err) {
                callback.fail(err);
                return;
            }
            logoPath = path;

            me.helpers.login('alain', 'alain', function(err) {
                if (err) {
                    callback.fail(err);
                    return;
                }
                me.helpers.visit('/cms/wp-admin/edit.php?post_type=ckan-local-org', function (err) {
                    if (err) {
                        callback.fail(err);
                        return;
                    }
                    me.browser.clickLink("Swisstopo", function (err) {
                        if (err) {
                            callback(err);
                            return;
                        }
                        console.log("Edit Swisstopo organisation");

                        console.log(me.browser.html());

                        me.browser
                            .fill('#_ckan_local_org_image', filename)
                            .pressButton('#publish', function (err) {
                                if (err) {
                                    callback(err);
                                    return;
                                }
                                console.log("Updated organization");
                                callback();
                            });
                    });
                });
            });
        });
    });

    this.Given(/^es ist unter opendata\.swiss sichtbar$/, function (callback) {
        // Write code here that turns the phrase above into concrete actions
        callback.pending();
    });

    this.Given(/^Alain im Admin ein neues Logo "([^"]*)" einfügt$/, function (arg1, callback) {
        // Write code here that turns the phrase above into concrete actions
        callback.pending();
    });

    this.Given(/^ist unter opendata\.swiss das neue Logo ersichtlich$/, function (callback) {
        // Write code here that turns the phrase above into concrete actions
        callback.pending();
    });

    this.Given(/^in der Bechreibung steht "([^"]*)"$/, function (arg1, callback) {
        // Write code here that turns the phrase above into concrete actions
        callback.pending();
    });

    this.Given(/^diese ist unter opendata\.swiss für Oleg sichtbar$/, function (callback) {
        // Write code here that turns the phrase above into concrete actions
        callback.pending();
    });

    this.Given(/^Alain die Beschreibung im Admin ändert zu "([^"]*)"$/, function (arg1, callback) {
        // Write code here that turns the phrase above into concrete actions
        callback.pending();
    });

    this.Given(/^sieht Oleg unter opendata\.swiss den Text "([^"]*)"$/, function (arg1, callback) {
        // Write code here that turns the phrase above into concrete actions
        callback.pending();
    });


};