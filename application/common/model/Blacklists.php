<?php

namespace app\common\model;

use think\Model;

class Blacklists extends Model
{

    // 把投诉者加入黑名单
    public static function gogogo($ip='', $url='')
    {
        if ( !empty($ip) ){
            return self::create(array('ip'=>$ip, 'url'=>$url, 'create_time'=>time()));
        }
    }

    // 解除黑名单（删除指定IP）
    public static function del($ip='')
    {
        if ( !empty($ip) ){
            return self::where('ip',$ip)->delete();
        }
    }






}
