var expect = require('chai').expect;
var Promise = require('promise');
var fs = require('fs');

module.exports = {
    file_exists: function(dirname, filename, callback) {
        var path = fs.realpathSync(dirname + '/../' + filename);
        if (fs.existsSync(path)) {
            console.log('File ' + filename + ' exists');
            callback(null, path);
            return
        }
        callback('File ' + filename +' does not exist!');
    }
};