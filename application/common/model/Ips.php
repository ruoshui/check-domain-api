<?php

namespace app\common\model;

use think\Model;

class Ips extends Model
{
    //获取IP地址归属地
    // 获取物理地址
    public static function getIpAddress($ip='')
    {
        // http://api.map.baidu.com/location/ip?ak=F454f8a5efe5e577997931cc01de3974&ip=120.36.254.31
        if ( empty($ip) ){
            // 当前IP地址
            $ip = $_SERVER['REMOTE_ADDR'];
        }

        // 查询本地数据库是否已经有记录
        $ipJilu = Ips::where(['ip'=>$ip, 'status'=>1])->find();
        if ( $ipJilu ){
            return $ipJilu['address'];
        }

        // 如果没有本地记录，使用接口获取
        $apiUrl = 'http://api.map.baidu.com/location/ip?ak=F454f8a5efe5e577997931cc01de3974&ip=' . $ip;

        // 获取接口查询的数据
        if ( !$resData = file_get_contents($apiUrl) ){
            return false;
        }

        // json 转为 array
        if ( !$data = json_decode($resData, true) ){
            return false;
        }

        // 记录数据，并返回
        if ( $data['status']==0 ){

            $address = $data['content']['address_detail']['province'] . '-' . $data['content']['address_detail']['city'];
            Ips::create(['ip'=>$ip, 'address'=>$address, 'status'=>1, 'create_time'=>time()]);

            return $address;

        }else{
            return false;
        }

    }

    public static function getIpToCity($ip='')
    {
        if ( empty($ip) ){
            // 当前IP地址
            $ip = $_SERVER['REMOTE_ADDR'];
        }

        // 如果没有本地记录，使用接口获取
        $apiUrl = 'http://api.map.baidu.com/location/ip?ak=F454f8a5efe5e577997931cc01de3974&ip=' . $ip;

        // 获取接口查询的数据
        if ( !$resData = file_get_contents($apiUrl) ){
            return false;
        }

        // json 转为 array
        if ( !$data = json_decode($resData, true) ){
            return false;
        }

        // 记录数据，并返回
        if ( $data['status']==0 ){

            $address = $data['content']['address_detail']['city'];

            $address = rtrim($address, '市 ');

            return $address;

        }else{
            return false;
        }
    }

}

