<?php

namespace app\admin\controller;

use app\common\model\Logs;
use think\Request;

class Log extends Base
{
    //系统日志 展示页
    public function index(Request $request)
    {
        $post = $request->isAjax();
        if ($post){
            $so = trim(input('param.so'));

            $page = input('param.page/d', 1);
            $limit = input('param.limit/d', 20);
            $data = array(
                'data'      =>  Logs::where('username|action|ip|ipAscription', 'like', "%" . $so . "%")->order('id', 'desc')->page($page)->limit($limit)->select(),
                'count'     =>  Logs::where('username|action|ip|ipAscription', 'like', "%" . $so . "%")->count('id'),
                'code'      => 0,
                'msg'       => '',
            );
            return json($data);
        }
        return view();
    }

}
