// features/support/world.js
var Browser = require('zombie');
Browser.localhost('*.ogdch.dev', 80);
Browser.waitDuration = '30s';
function World(callback) {
    this.browser = new Browser(
        {
            maxWait: 10000
        }
    ); // this.browser will be available in step definitions
    
    this.visit = function (url, callback) {
        this.browser.visit(url, callback);
    };

    callback(); // tell Cucumber we're finished and to use 'this' as the world instance
};

module.exports.World = World;
