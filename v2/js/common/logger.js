define('js/common/logger', function(require, exports, module) {

    var Logger = {
        log: function() {

        }
    };

    function log(arg) {
        console.log(arg);
    }

    (function() {
        if (window.console) {
            if (window.console.log) {
                Logger.log = log;
            }
        }
    })();

    return Logger;
});