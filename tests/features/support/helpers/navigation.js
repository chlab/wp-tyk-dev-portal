var expect = require('chai').expect;
var Promise = require('promise');

module.exports = {
    page: function(path) {
        return "http://ogdch.dev" + path;
    },
    visit: function(url, callback) {
        if (url.indexOf("http") == - 1) {
            this.browser.visit(this.page(url), callback);
        }
        else {
            this.browser.visit(url, callback);
        }
    }
};