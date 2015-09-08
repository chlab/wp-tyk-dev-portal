module.exports = function () {
    this.World = require("../support/world.js").World; // overwrite default World constructor

    this.Given(/^Ich auf der Seite (.*) bin$/, function (page, callback) {
        this.visit('http://' + page, callback);
    });

    this.When(/^Ich nichts mache$/, function (callback) {
        callback();
    });

    this.Then(/^Sollte ich "(.*)" als Seitentitel sehen$/, function (title, callback) {
        // matching groups are passed as parameters to the step definition

        var pageTitle = this.browser.text('title');
        if (title === pageTitle) {
            callback();
        } else {
            callback.fail(new Error("Expected to be on page with title " + title));
        }
    });
};
