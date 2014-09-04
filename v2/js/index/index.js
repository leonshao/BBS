define(function(require, exports, module) {
    var Login = require('js/common/plugin_login');
    var $ = require('jquery');
    var KeyBoard = require('js/common/plugin_keyboard');
    var Mouse = require('js/common/plugin_mouse');
    var Logger = require('js/common/logger');

    window.jQuery = $;

    var BoxShow = function(container) {
        this.$container = $(container);
    };
    BoxShow.prototype = {
        init: function() {
            this.bind()
        },
        bind: function() {
            // this.$container
        }
    };

    function init() {

        var showLogin = $('#id_show_login');
        var showRegeister = $('#id_show_regeister');
        var showName = $('#id_show_welcome');

        var mouse = Mouse.getInstance(showLogin[0]);
        mouse.click(function() {
            var login = Login.getInstance($('#id_plugin_login')[0]);
            login.success(function() {
                alert('登陆成功');
                login.hide();
                showLogin.hide();
                showRegeister.hide();
                showName.show();
            });
            login.error(function() {
                alert('登陆失败，请重新输入');

            })
            login.init();
        });

        // var mouse2 = Mouse.getInstance(showRegeister[0]);
        

    }



    return {
        init: init
    }
});