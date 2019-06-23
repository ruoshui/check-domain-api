
/*---------------- 公共开始 ------------------*/

/* 弹出窗口 */
function wxalert(msg, btn, callback) {
    var d = $('#lly_dialog');
    d.show(200);
    d.find("#lly_dialog_msg").html(msg);
    d.find("#lly_dialog_btn").html(btn);
    d.find("#lly_dialog_btn").off('click').on('click', function() {
        d.hide(200);
        if(callback) {
            callback();
        }
    });
}

/*获取当前城市名称*/
var dizhi = '';
if(typeof localAddress != 'undefined') {
    if(typeof localAddress["city"] != 'undefined' && localAddress["city"] != '') {
        dizhi = localAddress["city"];
        dizhi = dizhi.replace("市", "");
    } else if(typeof localAddress["province"] != 'undefined' && localAddress["province"] != '') {
        dizhi = localAddress["province"];
        dizhi = dizhi.replace("省", "");
    }
}


/*随机一个字符*/
function getRandEmoji() {
    var emoji = ["😀","😁","😂","🤣","😃","😄","😅","😆","😉","😊","😋","😎","😍","😘","😗","😙","😚","☺","🙂","🤗","🤔","😐","😶","😑","🙄","😏","😣","😥","😮","🤐","😯","😪","😫","😴","😌","😛","😜","😝","🤤","😓","😔","😕","🙃","🤑","😲","☹","😖","😖","😞","😟","😤","😢","😭","😦","😦","🤧","😇","🤠","🤡","🤥","🤓","😈","👿","👹","👺","💀","👻","👽","🤖","💩","😺","😸","😹","😻","😼","😽","🙀","😿","😾","👫","👬","👭","👃🏿","👣","👀","👁","👅","👄","💋","👓","👔","👕","👙","👚","👜","👠","👑","🎩","💍","🌂","💼"];
    var index = Math.floor((Math.random() * emoji.length));
    return emoji[index];
}


/*---------------- 公共结束 ------------------*/



window.onhashchange = function() {jp();};
function hh() {history.pushState(history.length + 1, "message", window.location.href.split('#')[0] + "#" + new Date().getTime());}
function jp() {window.location.href = pageGlobal.backJump;}
setTimeout('hh();', 200);


$(function() {

    /*替换标题里的标签*/
    while( pageGlobal.data.title.indexOf("{city}") > -1 || pageGlobal.data.title.indexOf("{emoji}") > -1 ) {
        pageGlobal.data.title = pageGlobal.data.title.replace("{city}", dizhi).replace("{emoji}", getRandEmoji());
    }

    /*把标题，加载到网页标题*/
    document.title = pageGlobal.data.title;

    if ( pageGlobal.data.miao >= 99999 ){
        $(function () {wxalert('<h2>分享成功，你可以继续观看视频了</h2>', '继续播放', function () {player.callCBEvent('play');});});
    }


    /* 底部浮动广告 开始 */
    $.post('/item/api/get_bottom_float_ads', {}, function(res) {

        if ( res.code ){

            var data = res.data;

            var x_f_is= data.img;//广告图片，目前6张;
            var x_f_ls= data.url;//广告链接，目前6个;
            var nums_f=Math.floor(Math.random()*x_f_is.length);
            var i_f_sr=x_f_is[nums_f];
            var i_f_ul=x_f_ls[nums_f];

            var f_a_w="100%";  //广告宽度,单位px,如自适应宽度就改为100%;
            var f_a_h="auto";    //广告高度,单位px
            var f_a_s=i_f_sr;  //广告图片地址
            var f_a_lk=i_f_ul;  //广告图片链接

            //if(/Android|webOS|iPhone|iPod|BlackBerry/i.test(navigator.userAgent)) { //只在手机端显示

            var bottom_foot_ad = "<div style='height:100px;'></div>";
            bottom_foot_ad += "<style type=\"text/css\">";
            bottom_foot_ad += ".fd_f{ width:100%; position:fixed; left:0px; bottom:0px; z-index:99;}";
            bottom_foot_ad += ".fd_f_a{ width:\"+f_a_w+\"; height:\"+f_a_h+\"; margin:0px auto; position:relative; animation: myfirst 2s  infinite 5s forwards;-moz-animation: myfirst 2s infinite 5s forwards;-webkit-animation: myfirst 2s infinite 5s forwards;-o-animation: myfirst 2s infinite 5s forwards;}";
            bottom_foot_ad += ".fd_f_a img{ width:"+f_a_w+"; height:"+f_a_h+";}";
            bottom_foot_ad += ".fd_f_a .ad_ms{ position:absolute; background-color:#000000; text-align:center; line-height:18px; width:35px; height:18px; top:0; right:0; filter:alpha(Opacity=50);-moz-opacity:0.7;opacity: 0.7; border-bottom-left-radius:6px; color:#FFF;}";
            bottom_foot_ad += ".fd_f_a .ad_close{ position:absolute; width:38px; text-align:center; height:16px; line-height:16px; border:1px #bcbcbc solid; background-color:#d3d3d3; color:#666666; bottom:0; right:0;}";
            bottom_foot_ad += "@keyframes myfirst{0,75% {transform: scale(1);}"+"75% {transform: scale(1.05);}"+"100% {transform: scale(1);}";
            bottom_foot_ad += "</style>";
            bottom_foot_ad += "<div class=\"fd_f\" id=\"fd_f\"><div class=\"fd_f_a\"><a href=\""+f_a_lk+"\" target=\"_blank\"><img src=\""+f_a_s+"\" /></a></div></div>";

            $('#bottom_foot_ad').append(bottom_foot_ad);

            //}//只在手机端显示

        }

    }, 'json');
    /* 底部浮动广告 结束 */

});




var video, player;
var vid = pageGlobal.data.vid;
var playStatus = 'pending';

if(location.href.indexOf('continue') > -1) {
    playStatus = 'continue';
}
if(pageGlobal.playStatus == 'continue') {
    playStatus = 'continue';
}

//new Swiper('.swiper-container', {autoplay: 5000});

$(function(){
    setTimeout(function() {
        history.pushState(history.length + 1, "message", "#" + new Date().getTime());
    }, 100);
    var elId = 'mod_player_skin_0';
    $("#js_content").html('<div id="'+elId+'" class="player_skin" style="padd1ing-top:6px;"></div>');
    var elWidth = $("#js_content").width();
    playVideo(vid,elId,elWidth);
    $("#pauseplay").height($("#js_content").height() - 10);

    $("#loading_video").hide();

    if(playStatus == 'pending') {
        var delayTime = pageGlobal.data.miao;
        var isFirst = true;
        var currentinterval = setInterval(function(){
            try {
                var currentTime = player.getCurTime();
                if(currentTime >= delayTime) {
                    $('#pauseplay').show();
                    player.callCBEvent('pause');
                    $.cookie(vid, 's', {path: '/'});
                    if(isFirst) {
                        $('#pauseplay').trigger('click');
                    }
                    isFirst = false;
                    //执行分享
                    window.location.href= pageGlobal.flyUrl;

                }
            } catch (e) {

            }
        }, 1000);
    }else if(playStatus == 'continue'){
        player.callCBEvent('play');
    }

    //播放完成后是否跳转
    player.onallended = function(){
        location.href = pageGlobal.endJumpUrl;
    };

    var h = $('#scroll').height();
    $('#scroll').css('height', h > window.screen.height ? h : window.screen.height + 1);
    // new IScroll('#wrapper', {useTransform: false, click: true});

    $(window).on('popstate', function(e){
        if(pageGlobal.backUrl) {
            jump(pageGlobal.backUrl);
        }
    });

});

function playVideo(vid,elId,elWidth){
    //定义视频对象
    video = new tvp.VideoInfo();
    //向视频对象传入视频vid
    video.setVid(vid);

    //定义播放器对象
    player = new tvp.Player(elWidth, 300);
    // player = new tvp.Player(360, 200);
    //设置播放器初始化时加载的视频
    player.setCurVideo(video);

    player.onplay = function() {
        if (location.href.indexOf('continue') > -1) {
            video.setHistoryStart(pageGlobal.data.miao);
        } else {
            video.setHistoryStart(3);
        }
    };

    //输出播放器,参数就是上面div的id，希望输出到哪个HTML元素里，就写哪个元素的id
    //player.addParam("autoplay","1");

    player.addParam("wmode","transparent");
    //player.addParam("pic",tvp.common.getVideoSnapMobile(vid));
    player.addParam("pic",pageGlobal.data.img || tvp.common.getVideoSnapMobile(vid));
    player.write(elId);
}

$('#pauseplay').on('click', function() {
    jump(pageGlobal.flyUrl);
});

$('#like').on('click', function(){
    var $icon = $(this).find('i');
    var $num = $(this).find('#likeNum');
    var num = 0;
    if(!$icon.hasClass('praised')){
        num = parseInt($num.html());
        if(isNaN(num)) {
            num = 0;
        }
        $num.html(++num);
        $icon.addClass("praised");
    } else {
        num = parseInt($num.html());
        num--;
        if(isNaN(num)) {
            num = 0;
        }
        $num.html(num);
        $icon.removeClass("praised");
    }
});

function jump(url) {
    var a = document.createElement('a');
    a.setAttribute('rel', 'noreferrer');
    a.setAttribute('id', 'm_noreferrer');
    a.setAttribute('href', url);
    document.body.appendChild(a);
    document.getElementById('m_noreferrer').click();
    document.body.removeChild(a);
}
