<?php

namespace app\item\controller;

use think\Request;

class Index extends Base
{

    public function index()
    {
        halt(config('imagePath') ?? '没有找到数据');
    }


}
