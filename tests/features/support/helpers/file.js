var expect = require('chai').expect;
var Promise = require('promise');
var fs = require('fs');

module.exports = {
    file_exists: function(dirname, filename) {
        return new Promise(function(resolve, reject) {
            var path = fs.realpathSync(dirname + '/../' + filename);
            fs.exists(path, function(exists) {
                if (exists) {
                    console.log('File ' + filename + ' exists');
                    resolve(path);
                } else {
                    reject()
                }
            });
        });
    }
};