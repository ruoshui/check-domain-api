<?php

namespace app\admin\controller;

use app\common\model\Domains;
use app\common\model\Videos;
use app\common\model\WechatAccounts;

class Index extends Base
{
    //主页
    public function index()
    {
        return view();
    }


    //欢迎页
    public function welcome()
    {
        // 统计 数量
        $data = [
            'num' => [
                'video'		=>         Videos::count('id'),
                'gzh'		=> WechatAccounts::count('id'),
                'domain'	=>        Domains::count('id'),
            ],
            'true' => [
                'video'		=>         Videos::where('status',1)->count('id'),
                'gzh'		=> WechatAccounts::where('status',1)->count('id'),
                'domain'	=>        Domains::where('status',1)->count('id'),
            ],
        ];

        $this->assign('data', $data);

        return view();
    }




}
