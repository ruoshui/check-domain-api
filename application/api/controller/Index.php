<?php

namespace app\api\controller;

use think\Controller;
use think\Request;
use app\common\model\Wx;
use app\common\model\Configs;

class Index extends Controller
{

    public function index()
    {

        $request = request();
//      get_client_ip();
//dump( request()->isPost());
        if (!request()->isPost()) {

        }
        $params = array(
            //  'appkey'=> $appkey,    //您申请的APPKEY
            //  'url'   => $domain,
        );
        $clientip = request()->ip();
        $appkey = input('post.appkey');
        if (!$appkey)
            return $this->ajaxReturn(201,'appkay为空','');

        $url = input('post.url');
        if (!$url)
            return $this->ajaxReturn(202,'appkay为空','');


        echo $clientip;
        $wechatsdk = new Wx($appkey, $url, $clientip);
        $wechatsdk->checkDomian();
    }

    public function ajaxReturn($code = 201, $msg = 'appkay为空', $data = '')
    {
        return json([
            'code'=>201,
            'msg'=>'appkay为空',
            'data'=>'',
        ]);
        exit;
    }

}

