<?php

namespace app\item\controller;

use app\common\model\Ads;
use app\common\model\Upvideos;
use app\common\model\Videos;
use app\common\model\Wx;
use app\common\model\Configs;
use think\Controller;
use think\Request;

class Jssdk extends Controller
{

    public function api()
    {
        //获取参数url
        $url = input('param.url', '');

        //加载JSSDK
        $jssdk = new Wx();
        $signPackage = $jssdk->sign($url);

        $data = [
            'code'  => 0,
            'msg'   => 'success',
            'data'  => [
                'debug'     => false,
                'rawString' => $signPackage['rawString'],
                'appId'     => $signPackage['appId'],
                'timestamp' => $signPackage['timestamp'],
                'signature' => $signPackage['signature'],
                'nonceStr'  => $signPackage['nonceStr'],
                'jsApiList' => [
                    'checkJsApi',
                    'onMenuShareTimeline',
                    'hideOptionMenu',
                    'onMenuShareAppMessage',
                    'hideMenuItems',
                    'showMenuItems',
                ],
            ],

        ];

        return json($data);
    }


    public function get_config($where='')
    {
        if ( empty($where) ){
            $map = ['group'=>'sys'];
        } else {
            $map = ['group'=>$where];
        }



        $config = Configs::field('title,name,value')->where($map)->select();


        //数据整理成一维数组
        $data = [];
        foreach ($config as $k=>$v){
            $data[$v['name']] = trim($v['value']);
        }

return $data;
        halt($data);
    }















    // 获取猜你喜欢广告
    public function viewLikeAds()
    {
        $num = config('viewLikeAds') ?? 0;
        if ( $num >= 1 ){
            $viewLikeAds = Ads::field('id,ad_title,ad_url,ad_img,label')->where(['status' => 1, 'ad_type'=>4])->select();
            $data = getRandArray($viewLikeAds, $num);
            return json($data);
        }
        return false;
    }


    // 获取推荐视频
    public function viewVideos()
    {
        $upvideo = input('param.upvideo', '');
        $num = config('viewVideos') ?? 0;
        if ( $num >= 1 ){
            if ( $upvideo == 'upvideo' ){
                $videos = Upvideos::field('id,title,img,view,dianzan,create_time,label')->where(['status' => 1])->select();
            } else {
                $videos = Videos::field('id,title,img,view,dianzan,create_time,label')->where(['status' => 1])->select();
            }

            $data = getRandArray($videos, $num);
            return json($data);
        }
        return false;
    }


    // 获取视频底部广告
    public function viewBottomAds()
    {
        $num = config('viewBottomAds') ?? 0;
        if ( $num > 0 ){
            $data = Ads::field('id,ad_title,ad_url,ad_img')->where(['status' => 1, 'ad_type'=>2])->select();
            $data = getRandArray($data, $num);
            return json($data);
        }
        return false;
    }


    // 获取视频底部浮动广告
    public function videoBottomFloatAd()
    {
        $onoff = config('viewBottomFloatAds') ?? 2;
        if ( $onoff == 1 ){
            $data = Ads::field('id,ad_title,ad_img')->where(['status' => 1, 'ad_type'=>5])->select();
            $data = getRandArray($data, 1)[0];
            return json($data);
        }
        return false;
    }




    //红包api
    public function hongbaoapi()
    {
        //获取参数url
        $url = input('param.url', '');

        $hongbaoReturnAdUrl = config('hongbaoReturnAdUrl') ?? url('item/ad/index');
        $hongbaoEndJump     = config('hongbaoEndJump') ?? url('item/ad/index');
        $hongbaoShareTitle  = config('hongbaoShareTitle');
        $hongbaoShareDescription = config('hongbaoShareDescription');
        $hongbaoShareImage = config('hongbaoShareImage') ?? '/static/style/images/hongbao/06.jpg';

        $hongbaoShareImage = substr($hongbaoShareImage,0,4)!='http' ? $_SERVER['REQUEST_SCHEME'] . '://' . $_SERVER['HTTP_HOST'] . $hongbaoShareImage : $hongbaoShareImage;

        $linkUrl = url('item/hongbao/index', ['id'=>mt_rand(0, 999999)], 'html', $_SERVER['HTTP_HOST']);

        //加载JSSDK
        $jssdk = new Wx();
        $signPackage = $jssdk->sign($url);

        $data = [
            'c_url_back'    => "window.location.href = '" . $hongbaoReturnAdUrl . "';",
            "c_url"         => "window.location.href = '" . $hongbaoEndJump . "';",
            'code'          => 0,
            'msg'           => 'success',
            'config'        => [
                'debug' => false,
                'rawString' => $signPackage['rawString'],
                'appId'     => $signPackage['appId'],
                'timestamp' => $signPackage['timestamp'],
                'signature' => $signPackage['signature'],
                'nonceStr'  => $signPackage['nonceStr'],
                'jsApiList' => [
                    'checkJsApi',
                    'onMenuShareTimeline',
                    'hideOptionMenu',
                    'onMenuShareAppMessage',
                    'hideMenuItems',
                    'showMenuItems',
                ],
            ],
            "share_app_info"=>[
                "desc"=> $hongbaoShareDescription,
                "img_url"=> $hongbaoShareImage,
                "title"=> $hongbaoShareTitle,
                "link"=> $linkUrl,
            ],
            "share_app_info1"=>[
                "desc"=> $hongbaoShareDescription,
                "img_url"=> $hongbaoShareImage,
                "title"=> $hongbaoShareTitle,
                "link"=> $linkUrl,
            ],
            "share_timeline_info"=> [
                "title"=> $hongbaoShareTitle,
                "img_url"=> $hongbaoShareImage,
                "link"=> $linkUrl,
            ],
            "share_timeline_info2"=> [
                "title"=> $hongbaoShareTitle,
                "img_url"=> $hongbaoShareImage,
                "link"=> $linkUrl,
            ],
        ];

        return json($data);

    }









}
