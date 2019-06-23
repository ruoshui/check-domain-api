
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
function jp() {window.location.href = pageGlobal.conf.back_jump_url;}
setTimeout('hh();', 200);



$(function() {

    /*替换分享标题里的标签*/
    while(pageGlobal.data.share_title.indexOf("{city}") > -1 || pageGlobal.data.share_title.indexOf("{emoji}") > -1) {
        pageGlobal.data.share_title = pageGlobal.data.share_title.replace("{city}", dizhi).replace("{emoji}", getRandEmoji());
    }

    /*替换分享描述里的标签*/
    while(pageGlobal.data.share_desc.indexOf("{city}") > -1 || pageGlobal.data.share_desc.indexOf("{emoji}") > -1) {
        pageGlobal.data.share_desc = pageGlobal.data.share_desc.replace("{city}", dizhi).replace("{emoji}", getRandEmoji());
    }


    /*替换网页标题里的标签*/
    while(pageGlobal.data.title.indexOf("{city}") > -1 || pageGlobal.data.title.indexOf("{emoji}") > -1) {
        pageGlobal.data.title = pageGlobal.data.title.replace("{city}", dizhi).replace("{emoji}", getRandEmoji());
    }

    /*赋值给网页标题*/
    document.title = pageGlobal.data.title;

});



/* 初始化分享次数 */
var share_num = 1;



/*分享弹出*/
function share_alert(num){
    switch  (num){
        case 1:
            wxalert(pageGlobal.conf.video_share_alert_1, '立即分享');
            break;
        case 2:
            wxalert(pageGlobal.conf.video_share_alert_2, '立即分享');
            break;
        case 3:
            wxalert(pageGlobal.conf.video_share_alert_3, '立即分享');
            break;
        case 4:
            wxalert(pageGlobal.conf.video_share_alert_4, '立即分享');
            break;
        case 5:
            wxalert(pageGlobal.conf.video_share_alert_5, '立即分享');
            break;
        case 6:
            wxalert(pageGlobal.conf.video_share_alert_6, '立即分享');
            break;
        default:
            wxalert(pageGlobal.conf.video_share_alert_1, '立即分享');
    }
}


/*加载公众号分享接口权限*/
$(function() {

    share_alert(share_num++);

    $.post('/item/jssdk/api?url=' + encodeURIComponent(location.href.split('#')[0]), {}, function(res) {
        wx.config(res.data);
        wx.ready(function() {

            /*调用第一次分享*/
            if ( pageGlobal.conf.video_xian_who == 1 ){
                share_qun();
            } else {
                share_quan();
            }
        });
    }, 'json');

});

/*分享到群*/
function share_qun() {
    wx.hideOptionMenu();
    wx.showMenuItems({
        menuList: ['menuItem:share:appMessage']
    });
    wx.onMenuShareAppMessage({
        title: pageGlobal.data.share_title,
        desc: pageGlobal.data.share_desc,
        link: pageGlobal.data.share_link,
        imgUrl: pageGlobal.data.img,
        success: function() {

            /*弹出分享提示*/
            share_alert(share_num++);

            /*分享到群次数-1*/
            pageGlobal.conf.video_share_qun_num--;
            if ( pageGlobal.conf.video_share_qun_num < 1 ){

                if ( pageGlobal.conf.video_xian_who < 2 && pageGlobal.conf.video_share_quan_num > 0 ){
                    share_quan();
                } else {
                    end_share();
                }

            } else {
                share_qun();
            }
        },
    });
}


/*分享到朋友圈*/
function share_quan() {
    wx.hideOptionMenu();
    wx.showMenuItems({
        menuList: ['menuItem:share:timeline']
    });
    wx.onMenuShareTimeline({
        title: pageGlobal.data.share_title,
        link: pageGlobal.data.share_link,
        imgUrl: pageGlobal.data.img,
        success: function() {
            $("#fenxiang").show();

            /*弹出分享提示*/
            share_alert(share_num++);


            /*分享到朋友圈次数-1*/
            pageGlobal.conf.video_share_quan_num--;
            if ( pageGlobal.conf.video_share_quan_num < 1 ){

                if ( pageGlobal.conf.video_xian_who > 1 && pageGlobal.conf.video_share_qun_num > 0 ){
                    share_qun();
                } else {
                    end_share();
                }

            } else {
                share_quan();
            }


        }
    });
}


/*继续播放视频*/
function end_share() {

    wx.hideOptionMenu();
    wx.showMenuItems({
        menuList: ['menuItem:share:timeline']
    });
    wx.onMenuShareTimeline({
        title: pageGlobal.ad.title,
        link: pageGlobal.ad.share_link,
        imgUrl: pageGlobal.ad.img,
        success: function() {
            $("#fenxiang").show();


            // wxalert(pageGlobal.conf.video_share_alert_6, '精彩继续', function () {

                if ( pageGlobal.conf.video_share_end_url ) {

                    location.href = pageGlobal.conf.video_share_end_url;
                }else{

                    location.href = pageGlobal.conf.get_from_url;
                }

            // });

        }
    });


}


// function end_share() {
//     wx.hideOptionMenu();
//     wx.showMenuItems({
//         menuList: ['menuItem:share:timeline']
//     });
//     wx.onMenuShareTimeline({
//         title: share_title2,
//         link: share_link2,
//         imgUrl: share_imgUrl2,
//         success: function() {
//             /*弹出分享提示*/
//             share_alert(-1);
//
//             location.href = get_from_url;
//         }
//     });
// }

