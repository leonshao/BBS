define(function(require, exports, module) {
    var $ = require('jquery');
    var Logger = require('js/common/logger');
    var Request = require('js/common/plugin_request');
    var Keyboard = require('js/common/plugin_keyboard');

    var Login = function(container) {
        this.container = $(container);

        this.successcb = null;
        this.errorcb = null;

        this.idHash = null;
    };

    Login.prototype = {
        init: function() {
            this.show();
            this.bind();
            this.loadVerifyImg();
        },
        bind: function() {
            var that = this;
            this.container.find('.close_ button').click(function() {
                that.hide();
            });
            this.container.find('.login button').click(function() {
                that.login();
            });
            this.container.find('.verify a').click(function() {
                that.loadVerifyImg();
            });

            var name = this.container.find('.input_data input[type="email"]');
            var password = this.container.find('.input_data input[type="password"]');
            var verify = this.container.find('.input_data input[type="verify"]');

            function onEnter() {
                that.login();
            }

            var key = Keyboard.getInstance(name[0]);
            key.onKeyDown({
                onEnter: onEnter
            });

            var key1 = Keyboard.getInstance(password[0]);
            key1.onKeyDown({
                onEnter: onEnter
            });

            var key2 = Keyboard.getInstance(verify[0]);
            key2.onKeyDown({
                onEnter: onEnter
            });
        },
        login: function() {
            var that = this;
            var name = this.container.find('.input_data input[type="email"]').val();
            var password = this.container.find('.input_data input[type="password"]').val();
            var verify = this.container.find('.input_data input[type="verify"]').val();

            name = $.trim(name);
            password = $.trim(password);
            verify = $.trim(verify);

            if (name == '' || password == '' || verify == '') {
                alert('你确定没有坑我？请检查输入是否正确！');
                return;
            }

            // member.php?mod=logging&action=login&loginsubmit=yes&handlekey=login&loginhash=LBeFo&json=1
            var url = 'fakedata/postlogin.js';
            Request.get(url, {
                mod: 'logging',
                action: 'login',
                loginsubmit: 'yes',
                handlekey: 'login',
                loginhash: that.idHash,
                json: 1
            }, function(data) {
                Logger.log(data);
                if (data.code == 0) {
                    that.successcb && that.successcb();
                } else {
                    that.errorcb && that.errorcb();
                }
            });
        },
        setCookie: function() {

        },
        show: function() {
            this.container.fadeIn();
        },
        hide: function() {
            this.container.fadeOut();
        },
        close: function() {
            this.hide();
            this.container.remove();
            this.container = null;
        },
        success: function(callback) {
            this.successcb = callback;
        },
        error: function(callback) {
            this.errorcb = callback
        },
        loadVerifyImg: function() {
            var that = this;
            // http://dev.bbs.szgdut.net/member.php?mod=seccode&action=seccode&inajax=1
            var url = 'member.php';
            Request.get(url, {
                mod: 'seccode',
                action: 'seccode',
                inajax: '1'
            }, function(data) {

                if (data.data_img && data.data_img.src && data.data_img.idHash) {
                    that.container.find('.verify img')[0].src = data.data_img.src;
                    that.idHash = data.data_img.idHash;
                    return;
                }
                setTimeout(function() {
                    alert('拉去验证码失败，请刷新验证码');
                });
            })

        }
    };



    return {
        getInstance: function(arg) {
            return new Login(arg);
        }
    }

});