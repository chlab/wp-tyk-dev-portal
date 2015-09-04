var Browser = require('zombie');
var util = require('./util');
var fs = require('fs');
var path = require('path');
var sys = require('sys')
var exec = require('child_process').exec;

Browser.localhost('ogdch.dev', 80);
Browser.localhost('opendata.swiss', 80);
Browser.waitDuration = '30s';
function World(callback) {
    this.browser = new Browser(
        {
            maxWait: 30000,
            debug: false,
            loadCSS: false,
            runScripts: false
        }
    );
    this.helpers = {
        browser: this.browser
    };

    load(path.join(__dirname, './helpers'), this.helpers);

    this.restore_db = function(callback)  {
        if (process.env.RESET_DB) {
            console.log("Restoring DBs...");
            exec("/vagrant/scripts/restore_dumps.sh", function (error, stdout, stderr) {
                if (error) {
                    callback.fail(error);
                }
                /*
                console.log('stdout: ' + stdout);
                console.log('stderr: ' + stderr);
                */
                console.log("Finished restoring DBs.");
                callback();
            });
        } else {
            callback();
        }

    }

    callback(); // tell Cucumber we're finished and to use 'this' as the world instance
};

function load(helperPath, dest) {
    var files = fs.readdirSync(helperPath),
        modulePath;

    for (var i = 0; i < files.length; i++) {
        if (files[i].match(/\.swp$/)) {
            continue;
        }
        modulePath = path.join(helperPath, files[i]);
        util.mixin(require(modulePath), dest);;
    }
}

module.exports.World = World;
