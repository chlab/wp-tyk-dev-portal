var Browser = require('zombie');
var util = require('./util');
var fs = require('fs');
var path = require('path');
var sys = require('sys')
var exec = require('child_process').exec;

Browser.localhost('ogdch.dev', 80);
Browser.localhost('opendata.swiss', 80);
Browser.waitDuration = '60s';

function World() {
    this.browser = new Browser(
        {
            maxWait: 100000,
            debug: true,
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
                    console.log("Error: " + error)
                    callback(error);
                }
                console.log('stdout: ' + stdout);
                console.log('stderr: ' + stderr);
                
                console.log("Finished restoring DBs.");
                callback();
            });
        } else {
            console.log("Skip restoring DBs...");
            callback();
        }
    };
};

function load(helperPath, dest) {
    var files = fs.readdirSync(helperPath),
        modulePath;

    for (var i = 0; i < files.length; i++) {
        if (files[i].match(/\.swp$/)) {
            continue;
        }
        modulePath = path.join(helperPath, files[i]);
        util.mixin(require(modulePath), dest);
    }
}

module.exports.World = World;
