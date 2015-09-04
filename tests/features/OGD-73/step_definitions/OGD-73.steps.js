var expect = require('chai').expect;
var Promise = require('promise');


module.exports = function () {
    this.World = require("../../support/world.js").World; // overwrite default World constructor

    var logoFilename = null;

    this.Given(/^es besteht ein Logo "([^"]*)"$/, function (filename, callback) {
        var me = this;
        logoFilename = filename;
        me.helpers.login('alain', 'alain')
            .then(function() {
                return me.helpers.visit('/cms/wp-admin/edit.php?post_type=ckan-local-org');
            })
            .then(function() {
                return me.browser.clickLink("Swisstopo");
            })
            .then(function() {
                console.log("Edit Swisstopo organisation");
                me.browser.fill('#_ckan_local_org_image', 'http://example.com/' + logoFilename);
                return me.browser.pressButton('#publish');
            })
            .then(function() {
                console.log("Updated organization");
                callback();
            })
            .catch(function(err) {
                callback.fail(err);
            });
    });

    this.Given(/^es ist unter opendata\.swiss sichtbar$/, function (callback) {
        var me = this;
        me.helpers.get_org_image('swisstopo')
            .then(function(orgImage) {
                expect(orgImage).to.equal('http://example.com/' + logoFilename)
            })
            .catch(function(err) {
                callback.fail(err);
            });
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