var ogdchHooks = function () {
    this.After(function (scenario, callback) {
        console.log("Cleanup after scenario...");
        this.restore_db(callback);
    });

    this.registerHandler('BeforeStep', function (event, callback) {
        console.log("Start Step: ", event.getPayloadItem('step').getName());
        callback();
    });
    this.registerHandler('AfterStep', function (event, callback) {
        console.log("End Step: ", event.getPayloadItem('step').getName());
        callback();
    });
};

module.exports = ogdchHooks;
