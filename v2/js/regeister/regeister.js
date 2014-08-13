define(function(require, exports, module) {
    var $ = require('jquery');
    var Logger = require('js/common/logger');
    var KeyBoard = require('js/common/plugin_keyboard');
    var Request = require('js/common/plugin_request');

    // 左侧的选图 begin

    var Game = function(container, data) {
        this.container = $(container);
        this.a = this.container.find('a');
        this.span = this.container.find('span');
        this.ul = this.container.find('ul');
        this.li = null;

        this.data = data;

        this.hasChoose = false;

        this.onSelectCB;

        this.value = "";
    };
    Game.prototype = {
        init: function() {
            this.render();
            this.li = this.container.find('ul li');
            this.bind();
        },
        render: function() {
            if(!this.data){
                return;
            }
            var that = this;
            this.a.html(this.data.title);
            var lis = "";
            $.each(this.data.data, function(index, obj) {
                var li = '<li data-index=' + index+ '><a href="javascript:void(0);">' + obj + '</a></li>';
                lis += li;
            });
            that.ul.html(lis);
        },
        refresh:function(data){
            this.data = data;
            this.render();
        },
        bind: function() {
            var that = this;

            var isOver = true;
            this.container
            this.a.mouseover(function() {
                isOver = true;
                that.ul.show();
            });
            this.a.mouseleave(function(event) {
                isOver = false;
                setTimeout(function() {
                    if (!isOver) {
                        that.ul.hide();
                    }
                }, 200);
            });
            this.ul.mouseover(function(event) {
                isOver = true;
                that.ul.show();

            });
            this.ul.mouseleave(function(event) {
                isOver = false;
                setTimeout(function() {
                    if (!isOver) {
                        that.ul.hide();
                    }
                }, 200);
            });
            this.container.on('click', 'ul li', function() {
                var t = $(this);
                var value = t.find('a').html();
                that.setValue(value);
                that.onSelectCB && that.onSelectCB(t.attr('data-index'), t[0], value);
            });
        },
        onSelect: function(callback){
            this.onSelectCB = callback;
        },
        setValue: function(value) {
            this.value = value;
            this.ul.hide();
            this.span.css({
                display: 'block'
            });
            Logger.log('setvalue: ' + value);
            this.span.html(value);
        },
        getValue: function() {
            return this.value;
        }
    };


    // 左侧的选图 end

    var Gender = function(container) {
        this.container = $(container);
        this.a = this.container.find('a');
        this.value = "";
    };
    Gender.prototype = {
        init: function() {
            this.bind();
        },
        bind: function() {
            var that = this;
            this.a.click(function() {
                that.value = $(this).html();
                that.a.removeClass('current');
                $(this).addClass('current');
            });
        },
        getValue: function() {
            return this.value;
        }
    };

    var Birthday = function(container) {
        this.container = $(container);
        this.a = this.container.find('a');
        this.span = this.container.find('span');
        this.value = "1990-07-19";
    };
    Birthday.prototype = {
        init: function() {
            this.bind();
        },
        bind: function() {
            var that = this;
            this.a.mouseover(function() {
                alert('todo');
            });
        },
        setValue: function(value) {
            this.value = value;
            this.ul.hide();
            this.span.css({
                display: 'block'
            });
            Logger.log(value);
            this.span.html(value);
        },
        getValue: function() {
            return this.value;
        }
    };




    var enducation, grade, academy, major, job, address, gender, birthday;
    var idHash = null;
    var leftData = {};

    function getData() {

    }

    function onEnter() {
        onRegister();
    }

    function onRegister() {

        if (!checkData()) {
            return;
        }

        var other = {
            xx: 'xx',
            xxx: 'xxx'
        };

        var data = {};
        Request.post('v2/fakedata/regeister', data, function() {
            alert('todo 注册成功');
        });


    }

    function checkData() {
        var goon = true;
        $('.right input').each(function(index, obj) {
            var input = $(this);
            if ($.trim(input.val()) == '') {
                goon = false;
            }
        });
        if(!goon){
            alert('请检查输入项');
        }

        return goon;
    }

    function loadVerifyImg() {
        var that = this;
        // http://dev.bbs.szgdut.net/member.php?mod=seccode&action=seccode&inajax=1
        var url = 'member.php';
        Request.get(url, {
            mod: 'seccode',
            action: 'seccode',
            inajax: '1'
        }, function(data) {
            if (data.data_img && data.data_img.src && data.data_img.idhash) {
                $('.verify img')[0].src = data.data_img.src;
                idHash = data.data_img.idhash;
                return;
            }
            setTimeout(function() {
                alert('拉去验证码失败，请刷新验证码');
            }, 500);
        })

    }

    /*
<div class="enducation">
                <div>
                    <a href="javascript:void(0);">学历</a>
                    <span>本科</span>
                    <ul>
                        <li><a href="javascript:void(0);">本科</a></li>
                        <li><a href="javascript:void(0);">研究生</a></li>
                    </ul>
                </div>
            </div>
*/

    function loadLeftDate(callback) {
        Request.get('v2/fakedata/getleftdata.js', {

        }, function(data) {
            if (!data) {
                alert('加载左侧数据失败，请刷新重试');
                return;
            }
            
            callback(processData(data.data));
        });
    }
    function processData(data){

        data.district_data.data = data.district_data.district;
        data.education_data.data = data.education_data.education;
        
        // data.

        data.college_data.academy = [];
        data.college_data.major = [];
        data.college_data.academy = [{
            title: '学院',
            data: []
        }];
        $.each(data.college_data, function(index, obj){
            data.college_data.academy[0].data.push(obj.college);
            data.college_data.major[index] = {
                title: '专业',
                data: []
            };
            $.each(obj.professions, function(ind, ob){
                data.college_data.major[index].data.push(ob.profession);
            })
        });

        return data;
    }

    function init() {
        loadLeftDate(function(data) {


            enducation = new Game($('.enducation>div'), data.education_data);
            enducation.init();

            grade = new Game($('.grade_academy_major .grade'), data.grade_data);
            grade.init();

            academy = new Game($('.grade_academy_major .academy'), data.college_data.academy[0]);
            academy.init();


            major = new Game($('.grade_academy_major .major'), null);
            major.init();

            academy.onSelect(function(index, ele, value){
                // Logger.log(data.college_data.major[index].data);
                major.refresh(data.college_data.major[index]);
            });

            job = new Game($('.job>div'), null);
            job.init();

            address = new Game($('.address>div'), data.district_data);
            address.init();

        });
        gender = new Gender($('.gender'));
        gender.init();

        birthday = new Birthday($('.birthday>div'));
        birthday.init();


        $.each($('.right input'), function(index, obj) {
            var keyBoard = new KeyBoard.getInstance(obj);
            keyBoard.onKeyDown({
                onEnter: onEnter
            });
        });

        $('.rigister button').click(onRegister);


        loadVerifyImg();
        $('.verify span ').click(function() {
            loadVerifyImg();
        });

    }


    return {
        init: init
    }

});