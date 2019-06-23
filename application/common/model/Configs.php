<?php

namespace app\common\model;

use think\Model;

class Configs extends Model
{

    public static function getConfig($where='')
    {
        if ( empty($where) ){
            $map = ['group'=>'sys', 'status'=>1];
        } else {
            $map = ['group'=>$where, 'status'=>1];
        }

        $config = self::field('name,value')->where($map)->select();
        if ( count($config) > 0 ){

            //数据整理成一维数组
            $data = [];
            foreach ($config as $k=>$v){
                $data[$v['name']] = trim($v['value']);
            }

            return $data;
        }

        return false;
    }

}

