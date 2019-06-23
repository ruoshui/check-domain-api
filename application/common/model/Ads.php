<?php

namespace app\common\model;

use think\Model;

class Ads extends Model
{
    //广告类型
    public function adtype()
    {
        return $this->hasOne('Adtypes', 'id', 'type');
    }


    // 获取一条数据
    public static function getOneData($type='3', $id='')
    {
        if ( $id ){

            if ( $data = self::where(['status'=>1, 'id'=>$id])->find() ){
                return $data;
            }
        }

        if ( $datas = self::where(['status'=>1, 'type'=>$type])->select() ){
            return getRandArray($datas, 1)[0];
        }

        return false;
    }

    // 获取多条数据
    public static function getManyData($type=3, $num=99)
    {
        if ( $num > 0 ){

            if ( $datas = self::where(['status'=>1, 'type'=>$type])->select() ){
                return getRandArray($datas, $num);
            }
        }

        return false;
    }

}

