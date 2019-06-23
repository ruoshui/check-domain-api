<?php

namespace app\item\controller;

use app\common\model\Blacklists;
use app\common\model\Domains;
use think\Controller;
use think\Request;

class Base extends Controller
{

    public function initialize()
    {

        // 网站关闭否
        if ( config('site_status') != 1 ){
            echo '网站已关闭';die;
        }

        // 查询客户端IP在不在黑名单里
        $ip = isset($_SERVER['REMOTE_ADDR']) ? $_SERVER['REMOTE_ADDR'] : $_SERVER['SERVER_ADDR'];
        if ( Blacklists::where('ip', $ip)->find() ){
            $this->redirect(config('NoWechatUrl'));die;
        }

        //判断是否只能微信访问
        if (config('WechatVisitSwitch') == 1){
            $llq = strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger');
            $iPad    = strpos($_SERVER['HTTP_USER_AGENT'], 'iPad');
            $iPhone  = strpos($_SERVER['HTTP_USER_AGENT'], 'iPhone');
            $Android = strpos($_SERVER['HTTP_USER_AGENT'], 'Android');

            //判断浏览器，非微信浏览器报错
            if ($llq==false || ($iPhone==false && $Android==false && $iPad==false)) {
                $this->redirect(config('NoWechatUrl'));die;
            }
        }

    }



    //获取相对应的入口域名
    public function getRukou($domain='')
    {

        if ( !$domain ){
            $domain = $_SERVER['HTTP_HOST'];
        }

        //查询当前域名 在 域名管理 中的信息
        $fandomain = Domains::where(['domain'=>$domain])->find();

        if ( empty($fandomain) ){
            //如果 没有查到 转换后在查询
            $domain = zhuanhuan($domain);
            $fandomain = Domains::where(['domain'=>$domain])->find();
        }

        // 如果还是没查到 说明此域名 不在域名管理中
        if ( empty($fandomain) ){
            return $domain;
        }

        // 如果查到了 获取此域名的  gzhId
        $gid = $fandomain['gid'];

        // 查看 gzhId 下面 的所有入口域名
        $gzhDomain = Domains::field('domain')->where(['status'=>1, 'type'=>1, 'gid'=>$gid])->select();

        //如果后台没有查询到域名 就返回原始域名
        if ( count($gzhDomain) <= 0 ){
            return $domain;
        }

        $resghz = $gzhDomain[mt_rand(0,count($gzhDomain)-1)]['domain'] ?? $domain;

        // 把 * 替换成随机字符串
        $resghz = str_replace('*', getRandStr(config('fanyumingNum')), $resghz);

        return $resghz;
    }



}
