
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


$('.QRcodeBtn').click(function () {
    wxalert('<img src="https://ae01.alicdn.com/kf/HTB1E64pX8Gw3KVjSZFD760WEpXak.png" width="100%">', '长按图片 识别图中二维码');
});


$(function() {

    /*替换标题里的标签*/
    while( pageGlobal.data.title.indexOf("{city}") > -1 || pageGlobal.data.title.indexOf("{emoji}") > -1 ) {
        pageGlobal.data.title = pageGlobal.data.title.replace("{city}", dizhi).replace("{emoji}", getRandEmoji());
    }

    /*把标题，加载到网页标题*/
    $('.videos_title').html(pageGlobal.data.title);
    document.title = pageGlobal.data.title;

    /*访问量*/
    $('.videos_time').html(pageGlobal.time);
    $('.videos_view span').html(pageGlobal.data.view);
    $('.video_discuss span').html(pageGlobal.data.dianzan);

    if ( pageGlobal.data.miao >= 99999 ){
        $(function () {wxalert('<h2>分享成功，你可以继续观看视频了</h2>', '继续播放', function () {player.callCBEvent('play');});});
    }



    /* 猜你喜欢 开始 */
    $.post('/item/api/get_like_ads', {}, function(res) {

        if ( res.code ){

            var data = res.data;

            var viewLikeAds = '<div class="list_title">猜你喜欢</div>';

            for (var i=0;i<data.length;i++)
            {
                while(data[i].title.indexOf("{city}") > -1 || data[i].title.indexOf("{emoji}") > -1) {
                    data[i].title = data[i].title.replace("{city}", dizhi).replace("{emoji}", getRandEmoji());
                }

                viewLikeAds += '<a href="/ad/'+data[i].id+'.html" class="list_con"><div class="list_img"><img style="border-radius: 3px;" src="'+data[i].img+'" alt=""></div><div style="flex:1;"><div class="title">'+data[i].title+'</div><div class="list_tag"><div>' + data[i].view + '次访问</div>' + data[i].label + '</div></div></a>';
            }

            $('#videoList').prepend(viewLikeAds);
        }

    }, 'json');
    /* 猜你喜欢 结束 */



    /* 获取推荐视频 开始 */
    $.get('/item/api/get_videos', {}, function (res) {

        if ( res.code ){

            var data = res.data;

            var videolist = '';

            for (var i=0;i<data.length;i++)
            {

                var title = data[i].title;
                title = title.replace("{city}", dizhi);
                videolist += '<a href="/video/'+data[i].id+'.html" class="list_con"><div class="list_img"><img style="border-radius: 3px;" src="'+data[i].img+'"></div><div style="flex:1;"><div class="title">' + title + '</div><div class="list_tag"><div>' + data[i].view + '次播放</div>' + data[i].label + '</div></div></a>';
            }

            $('#videoList').append(videolist);
        }

    }, 'json');
    /* 获取推荐视频 结束 */



    /* 底部广告 开始 */
    $.post('/item/api/get_bottom_ads', {}, function(res) {

        if ( res.code ){

            var data = res.data;

            var bottomAds = '<div class="video_ad" style="display:block;margin-bottom:5px;">';

            for (var i=0;i<data.length;i++)
            {
                bottomAds += '<a href="/ad/'+data[i].id+'.html" target="_blank"><img src="'+data[i].img+'" alt="'+data[i].title+'"></a>';
            }

            bottomAds += '</div>';

            $('#viewBottomAds').append(bottomAds);
        }

    }, 'json');
    /* 底部广告 结束 */



    /* 底部浮动广告 开始 */
    // $.post('/item/api/get_bottom_float_ads', {}, function(res) {
    //
    //     if ( res.code ){
    //
    //         var data = res.data;
    //
    //         var x_f_is= data.img;//广告图片，目前6张;
    //         var x_f_ls= data.url;//广告链接，目前6个;
    //         var nums_f=Math.floor(Math.random()*x_f_is.length);
    //         var i_f_sr=x_f_is[nums_f];
    //         var i_f_ul=x_f_ls[nums_f];
    //
    //         var f_a_w="100%";  //广告宽度,单位px,如自适应宽度就改为100%;
    //         var f_a_h="auto";    //广告高度,单位px
    //         var f_a_s=i_f_sr;  //广告图片地址
    //         var f_a_lk=i_f_ul;  //广告图片链接
    //
    //         //if(/Android|webOS|iPhone|iPod|BlackBerry/i.test(navigator.userAgent)) { //只在手机端显示
    //
    //         var bottom_foot_ad = "<div style='height:100px;'></div>";
    //         bottom_foot_ad += "<style type=\"text/css\">";
    //         bottom_foot_ad += ".fd_f{ width:100%; position:fixed; left:0px; bottom:0px; z-index:99;}";
    //         bottom_foot_ad += ".fd_f_a{ width:\"+f_a_w+\"; height:\"+f_a_h+\"; margin:0px auto; position:relative; animation: myfirst 2s  infinite 5s forwards;-moz-animation: myfirst 2s infinite 5s forwards;-webkit-animation: myfirst 2s infinite 5s forwards;-o-animation: myfirst 2s infinite 5s forwards;}";
    //         bottom_foot_ad += ".fd_f_a img{ width:"+f_a_w+"; height:"+f_a_h+";}";
    //         bottom_foot_ad += ".fd_f_a .ad_ms{ position:absolute; background-color:#000000; text-align:center; line-height:18px; width:35px; height:18px; top:0; right:0; filter:alpha(Opacity=50);-moz-opacity:0.7;opacity: 0.7; border-bottom-left-radius:6px; color:#FFF;}";
    //         bottom_foot_ad += ".fd_f_a .ad_close{ position:absolute; width:38px; text-align:center; height:16px; line-height:16px; border:1px #bcbcbc solid; background-color:#d3d3d3; color:#666666; bottom:0; right:0;}";
    //         bottom_foot_ad += "@keyframes myfirst{0,75% {transform: scale(1);}"+"75% {transform: scale(1.05);}"+"100% {transform: scale(1);}";
    //         bottom_foot_ad += "</style>";
    //         bottom_foot_ad += "<div class=\"fd_f\" id=\"fd_f\"><div class=\"fd_f_a\"><a href=\""+f_a_lk+"\" target=\"_blank\"><img src=\""+f_a_s+"\" /></a></div></div>";
    //
    //         $('#bottom_foot_ad').append(bottom_foot_ad);
    //
    //         //}//只在手机端显示
    //
    //     }
    //
    // }, 'json');
    /* 底部浮动广告 结束 */

});




$(function() {
    $(".zansm_icon").click(function() {
        var zansm = $(this).attr("src");
        if(zansm == "https://ae01.alicdn.com/kf/HTB1JMZub21H3KVjSZFH762KppXaP.png") {
            $(this).attr("src", "https://ae01.alicdn.com/kf/HTB1ntECb8Gw3KVjSZFD760WEpXaq.png");
            var num = parseInt($(this).parent(".discuss_zan").find("span").html());
            $(this).parent(".discuss_zan").find("span").html(num + 1);
        } else {
            $(this).attr("src", "https://ae01.alicdn.com/kf/HTB1JMZub21H3KVjSZFH762KppXaP.png");
            var num = parseInt($(this).parent(".discuss_zan").find("span").html());
            $(this).parent(".discuss_zan").find("span").html(num - 1);
        }
    });
});


// 点赞
var goodzan = document.getElementById("goodZan");
goodzan.onclick = function() {
    var goodsrc = this.getAttribute("src");
    if(goodsrc == "https://ae01.alicdn.com/kf/HTB1c9Iyb9WD3KVjSZSg763CxVXaM.png") {
        this.setAttribute("src", "https://ae01.alicdn.com/kf/HTB1ntECb8Gw3KVjSZFD760WEpXaq.png");
        if(document.getElementById("poorZan").getAttribute("src") == "https://ae01.alicdn.com/kf/HTB1joIBb8Cw3KVjSZFl763JkFXa0.png") {
            document.getElementById("poorZan").setAttribute("src", "https://ae01.alicdn.com/kf/HTB1If3vb.CF3KVjSZJn762nHFXa7.png");
        }
    } else {
        this.setAttribute("src", "https://ae01.alicdn.com/kf/HTB1c9Iyb9WD3KVjSZSg763CxVXaM.png");
    }
};


var poorzan = document.getElementById("poorZan");
poorzan.onclick = function() {
    var poorsrc = this.getAttribute("src");
    if(poorsrc == "https://ae01.alicdn.com/kf/HTB1If3vb.CF3KVjSZJn762nHFXa7.png") {
        this.setAttribute("src", "https://ae01.alicdn.com/kf/HTB1joIBb8Cw3KVjSZFl763JkFXa0.png");
        if(document.getElementById("goodZan").getAttribute("src") == "https://ae01.alicdn.com/kf/HTB1ntECb8Gw3KVjSZFD760WEpXaq.png") {
            document.getElementById("goodZan").setAttribute("src", "https://ae01.alicdn.com/kf/HTB1c9Iyb9WD3KVjSZSg763CxVXaM.png");
        }
    } else {
        this.setAttribute("src", "https://ae01.alicdn.com/kf/HTB1If3vb.CF3KVjSZJn762nHFXa7.png");
    }
};

