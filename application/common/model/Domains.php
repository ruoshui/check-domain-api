<?php

namespace app\common\model;

use think\Model;

class Domains extends Model
{

    // 定义时间戳字段名
    protected $createTime = 'create_time';
    protected $updateTime = 'update_time';

    // 自动写入时间戳
    protected $autoWriteTimestamp = true;

    public function gongzh()
    {
        return $this->hasOne('WechatAccounts', 'id', 'gid');
    }

    // 获取一条数据
    public static function getOneData($type=2, $check=true)
    {

        if ( $type > 0 ){

            // 获取数据，并随机返回一条
            $datas = self::field('domain')->where(['type'=>$type, 'status'=>1])->select();
            if ( count($datas) > 0 ){

                // 获取随机域名
                $data = $datas[mt_rand(0,count($datas)-1)]['domain'];

                // 如果是泛域名，就转换成正常域名
                if ( $check ){

                    // 把 * 替换成随机字符串
                    $data = str_replace('*', getRandStr(config('fanyumingNum')), $data);
                }

                // 返回随机域名
                return $data;
            }

        }

        return $_SERVER['HTTP_HOST'];
    }


}

