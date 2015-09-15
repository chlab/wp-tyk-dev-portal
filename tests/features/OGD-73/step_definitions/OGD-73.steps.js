var expect = require('chai').expect;

module.exports = function () {
    this.World = require("../../support/world.js").World; // overwrite default World constructor

    this.Given(/^es besteht ein Logo "([^"]*)"$/, function (filename, callback) {
        var me = this;
        me.logoFilename = filename;
        me.helpers.login('alain')
            .then(function() {
                return me.helpers.visit('/cms/wp-admin/edit.php?post_type=ckan-local-org');
            })
            .then(function() {
                return me.browser.clickLink("Swisstopo");
            })
            .then(function() {
                console.log("Edit Swisstopo organisation");
                me.browser.fill('#_ckan_local_org_image', 'http://example.com/' + me.logoFilename);
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
                expect(orgImage).to.equal('http://example.com/' + me.logoFilename)
                callback();
            })
            .catch(function(err) {
                callback.fail(err);
            });
    });

    this.Given(/^Alain im Admin ein neues Logo "([^"]*)" einfügt$/, function (filename, callback) {
        var me = this;
        me.logoFilename = filename;
        me.helpers.login('alain')
            .then(function() {
                return me.helpers.visit('/cms/wp-admin/edit.php?post_type=ckan-local-org');
            })
            .then(function() {
                return me.browser.clickLink("Swisstopo");
            })
            .then(function() {
                console.log("Edit Swisstopo organisation");
                me.browser.fill('#_ckan_local_org_image', 'http://example.com/' + me.logoFilename);
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

    this.Given(/^ist unter opendata\.swiss das neue Logo ersichtlich$/, function (callback) {
        var me = this;
        me.helpers.get_org_image('swisstopo')
            .then(function(orgImage) {
                expect(orgImage).to.equal('http://example.com/' + me.logoFilename)
                callback();
            })
            .catch(function(err) {
                callback.fail(err);
            });
    });

    this.Given(/^in der Bechreibung steht "([^"]*)"$/, function (descr, callback) {
        var me = this;
        me.orgDescription = descr;
        me.helpers.login('alain')
            .then(function() {
                return me.helpers.visit('/cms/wp-admin/edit.php?post_type=ckan-local-org');
            })
            .then(function() {
                return me.browser.clickLink("Swisstopo");
            })
            .then(function() {
                console.log("Edit Swisstopo organisation");
                me.browser.fill('#_ckan_local_org_description_de', me.orgDescription);
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

    this.Given(/^diese ist unter opendata\.swiss für Oleg sichtbar$/, function (callback) {
        var me = this;
        me.helpers.get_org_descr('swisstopo')
            .then(function(orgDescr) {
                var re = new RegExp(me.orgDescription);
                expect(orgDescr).to.match(re);
                callback();
            })
            .catch(function(err) {
                callback.fail(err);
            });
    });

    this.Given(/^Alain die Beschreibung im Admin ändert zu "([^"]*)"$/, function (descr, callback) {
        var me = this;
        me.orgDescription = descr;
        me.helpers.login('alain')
            .then(function() {
                return me.helpers.visit('/cms/wp-admin/edit.php?post_type=ckan-local-org');
            })
            .then(function() {
                return me.browser.clickLink("Swisstopo");
            })
            .then(function() {
                console.log("Edit Swisstopo organisation");
                me.browser.fill('#_ckan_local_org_description_de', me.orgDescription);
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

    this.Given(/^sieht Oleg unter opendata\.swiss den Text "([^"]*)"$/, function (arg1, callback) {
        var me = this;
        me.helpers.get_org_descr('swisstopo')
            .then(function(orgDescr) {
                var re = new RegExp(me.orgDescription);
                expect(orgDescr).to.match(re);
                callback();
            })
            .catch(function(err) {
                callback.fail(err);
            });
    });


};