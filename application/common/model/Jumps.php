<?php

namespace app\common\model;

use think\Model;

class Jumps extends Model
{

    // 所属域名
    public function domain()
    {
        return $this->hasOne('Domains', 'id', 'did');
    }
}

