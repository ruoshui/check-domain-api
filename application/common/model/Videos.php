<?php

namespace app\common\model;

use think\Model;

class Videos extends Model
{

    // 获取一条数据
    public static function getOneData($id='')
    {
        if ( $id ){

            if ( $data = self::where(['id'=>$id, 'status'=>1])->find() ){
                return $data;
            }
        }

        if ( $datas = self::where(['status'=>1])->select() ){
            return getRandArray($datas, 1)[0];
        }

        return false;
    }

    // 获取多条数据
    public static function getManyData($num=0, $field='*')
    {
        if ( $num > 0 ){

            if ( $datas = self::field($field)->where(['status'=>1])->select() ){
                return getRandArray($datas, $num);
            }
        }

        return false;
    }

}

