var expect = require('chai').expect;
var Promise = require('promise');

module.exports = {
    page: function(path) {
        return "http://ogdch.dev" + path;
    },
    visit: function(url) {
        if (url.indexOf("http") == - 1) {
            return this.browser.visit(this.page(url));
        }
        else {
            return this.browser.visit(url);
        }
    }
};