define(function(require, exports, module) {
    var $ = require('jquery');
    var Logger = require('js/common/logger');

    var Mouse = function(container) {
        this.container = $(container);
        this.key = {
            keydown: {

            }
        };
    };
    Mouse.prototype = {
        click: function(callback) {
            this.container.click(callback);
        }
    };

    return {
        getInstance: function(arg) {
            return new Mouse(arg);
        }
    }
});