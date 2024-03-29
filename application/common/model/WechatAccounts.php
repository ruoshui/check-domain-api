<?php

namespace app\common\model;

use think\Model;

class WechatAccounts extends Model
{

    // 定义时间戳字段名
    protected $createTime = 'create_time';
    protected $updateTime = 'update_time';

    // 自动写入时间戳
    protected $autoWriteTimestamp = false;

}

