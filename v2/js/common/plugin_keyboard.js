define(function(require, exports, module) {
    var $ = require('jquery');
    var Logger = require('js/common/logger');

    var Keyboard = function(container) {
        this.container = $(container);
        this.key = {
            keydown: {

            }
        };
    };
    Keyboard.prototype = {
        onKeyDown: function(co) {
            var that = this;
            $.extend(this.key['keydown'], co);

            that.container.keydown(function(e) {
                var code = e.keyCode;
                switch (code) {
                    case 13:
                        co.onEnter && co.onEnter();
                        break;
                }
            });
        }
    };

    return {
        getInstance: function(arg) {
            return new Keyboard(arg);
        }
    }
});