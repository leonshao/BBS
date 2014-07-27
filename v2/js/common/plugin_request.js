define(function(require, exports, modules) {
    var $ = require('jquery');
    var Logger = require('js/common/logger');


    function get(url, data, callback) {
        var cb;
        $.ajax({
            url: url,
            type: 'get',
            data: data,
            dataType: 'jsonp',
            jsonpCallback: function() {
                cb = window.callback;
                window.callback = function(data) {
                    callback && callback(data);
                    window.callback = cb;
                }
            }
        });
    }

    function post(url, data, callback) {
        var cb;
        $.ajax({
            url: url,
            type: 'post',
            data: data,
            dataType: 'jsonp',
            jsonpCallback: function() {
                cb = window.callback;
                window.callback = function(data) {
                    callback && callback(data);
                    window.callback = cb;
                }
            }
        });
    }


    return {
        get: get,
        post: post
    }

});