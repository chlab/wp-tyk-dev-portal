var ogdchHooks = function () {
    this.After(function (scenario) {
        console.log("Cleanup after scenario...");
        this.restore_db();
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
