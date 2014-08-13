define(function(require, exports, modules) {
    var $ = require('jquery');
    var Logger = require('js/common/logger');

    var responseData = null;

    window.callback = function(data) {
        responseData = data;
    }

    function get(url, data, callback) {
        $.ajax({
            url: url,
            type: 'get',
            data: data,
            jsonp: 'callback',
            dataType: 'jsonp',
            complete: function() {
                Logger.log(responseData);
                callback && callback(responseData);
            }
        });
    }

    function post(url, data, callback) {
        var cb;
        $.ajax({
            url: url,
            type: 'post',
            data: data,
            jsonp: 'callback',
            dataType: 'jsonp',
            complete: function() {
                Logger.log(responseData);
                callback && callback(responseData);
            }
        });
    }


    return {
        get: get,
        post: post
    }

});