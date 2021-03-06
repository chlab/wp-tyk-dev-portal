var expect = require('chai').expect;

module.exports = function () {
    this.World = require("../../support/world.js").World; // overwrite default World constructor

    this.Given(/kann (.*) den Titel auf "([^"]*)" ändern$/, function (person, title, callback) {
        var me = this;
        me.username = person.toLowerCase();
        me.helpers.login(me.username)
            .then(function() {
                return me.helpers.change_title_of_dataset(me.datasetUrl, title);
            })
            .then(function() {
                return me.helpers.logout();
            })
            .then(callback)
            .catch(function(err) {
                callback(err);
            });
    });

    this.Given(/^kann Priska diesen Datensatz nicht bearbeiten$/, function (callback) {
        var me = this;
        me.helpers.login('priska')
            .then(function() {
                expect(me.datasetUrl).not.to.be.empty;
                return me.browser.visit(me.datasetUrl);
            })
            .then(function() {
                return me.browser.wait();
            })
            .catch(function(err) {
                expect(err.cause).to.match(/Server returned status code 500/);
                expect(me.browser.text('body p')).to.match(/^Sie haben nicht die nötigen Rechte, um dieses Element zu bearbeiten/);
            })
            .then(function() {
                return me.helpers.logout();
            })
            .then(callback)
            .catch(function(err) {
                callback(err);
            });
    });

};
