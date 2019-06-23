<?php

namespace app\admin\controller;

use app\common\model\WechatAccounts;
use think\Request;

class WechatAccount extends Base
{
    // 公众号 列表
    public function index(Request $request)
    {
        $post = $request->isAjax();
        if ($post){
            $so = trim(input('param.so'));

            $page = input('param.page/d', 1);
            $limit = input('param.limit/d', 20);
            $data = array(
                'data'  => WechatAccounts::where('account_name|domain1|domain2|domain3|app_id', 'like', "%" . $so . "%")->order(['sort'=>'desc', 'id'=>'desc'])->page($page)->limit($limit)->select(),
                'count' => WechatAccounts::where('account_name|domain1|domain2|domain3|app_id', 'like', "%" . $so . "%")->count('id'),
                'code'  => 0,
                'msg'   => '正常',
            );

            return json($data);
        }
        return view();
    }

    // 创建公众号
    public function create(Request $request)
    {

        if ( $request->isPost() ){
            $post = trimAll($request->post());

            if ( !editAuth() ){
                return json(array('code'=>0, 'msg'=>'测试状态下，不允许添加、修改、删除'));
            }

            $post['sort']   = $post['sort'] ? $post['sort'] : 500;
            $post['status'] = $post['status'] ?? 2;
            $post['create_time'] = date('Y-m-d H:i:s', time());

            if ( WechatAccounts::create($post) ){
                createLog('添加公众号成功');
                exit(json_encode(array('code'=>1, 'msg'=>'操作成功')));
            } else {
                createLog('添加公众号失败');
                exit(json_encode(array('code'=>0, 'msg'=>'操作失败')));
            }
        }else{
            return view();
        }
    }

    // 编辑公众平台
    public function edit(Request $request)
    {
        $id = input('param.id/d', '');

        if ( $request->isPost() ){
            $post = trimAll($request->post());

            if ( !editAuth() ){
                return json(array('code'=>0, 'msg'=>'测试状态下，不允许添加、修改、删除'));
            }

            $post['sort']   = $post['sort'] ? $post['sort'] : 500;
            $post['status'] = $post['status'] ?? 2;

            if ( WechatAccounts::where('id', $id)->update($post) ){
                createLog('编辑公众号成功');
                exit(json_encode(array('code'=>1, 'msg'=>'操作成功')));
            } else {
                exit(json_encode(array('code'=>0, 'msg'=>'操作失败')));
                createLog('编辑公众号失败');
            }
        }else{
            $wechataccount = WechatAccounts::get($id);
            $this->assign('wechataccount', $wechataccount);
            return view();
        }
    }

    //获取Token
    public function getToken(){
        $app_id = input('param.app_id');
        $app_secret = input('param.app_secret');

        if ($app_id && $app_secret){
            $access_token = $this->getAccessToken($app_id, $app_secret);
            $ticket = $this->getJsapiTicket($access_token);
            if ($access_token && $ticket){
                $data = array(
                    'access_token'=>$access_token,
                    'ticket'=>$ticket,
                    'update_time'=>date('Y-m-d H:i:s'),
                    'expire_time'=>date('Y-m-d H:i:s', time()+7200),
                );
                exit(json_encode(array('code'=>1, 'msg'=>'获取成功', 'data'=>$data)));
            }else{
                exit(json_encode(array('code'=>0, 'msg'=>'获取失败')));
            }
        }else{
            exit(json_encode(array('code'=>0, 'msg'=>'获取失败，缺少参数')));
        }

    }



    /**
     * 获取access_token方法
     * 正常返回 {"access_token":"ACCESS_TOKEN","expires_in":7200}
     * 错误返回 {"errcode":40013,"errmsg":"invalid appid"}
     */
    public function getAccessToken($appid, $secret){
        //调用curl方法完成请求
        $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='. $appid .'&secret=' . $secret;
        $result = $this->curl($url);
        //将返回得到的json数据转成php数组
        $result = json_decode($result,true);
        //定义需要返回的内容
        if (isset($result['access_token']) && !empty($result['access_token'])){
            return $result['access_token'];
        }else{
            return $result['errcode'] . '：' . $result['errmsg'];
        }

    }

    /**
     * 获取临时票据方法
     *
     * @return mixed
     */
    public function getJsapiTicket($AccessToken){
        //定义请求地址
        $url = 'https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=' . $AccessToken . '&type=jsapi';
        //使用curl方法发送请求,获取临时票据
        $result = $this->curl($url);
        //转换成php数组
        $result = json_decode($result,true);
        //定义返回的数据
        if (isset($result['ticket']) && !empty($result['ticket'])){
            return $result['ticket'];
        }else{
            return false;
        }

    }



    /**
     * 服务器之间请求的curl方法
     *
     * @param $url @请求地址
     * @param array $field post参数
     * @return string
     */
    public function curl($url,$field = []){
        //初始化curl
        $ch = curl_init();
        //设置请求的地址
        curl_setopt($ch,CURLOPT_URL,$url);
        //设置接收返回的数据,不直接展示在页面
        curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
        //设置禁止证书校验
        curl_setopt($ch,CURLOPT_SSL_VERIFYPEER,false);
        curl_setopt($ch,CURLOPT_SSL_VERIFYHOST,false);
        //判断是否为post请求方式,如果传递了第二个参数,就代表是post请求,如果么有传递,第二个参数为空,就是get请求
        if (!empty($field)){
            //设置请求超时时间
            curl_setopt($ch,CURLOPT_TIMEOUT,30);
            //设置开启post
            curl_setopt($ch,CURLOPT_POST,1);
            //传递post数据
            curl_setopt($ch,CURLOPT_POSTFIELDS,$field);
        }
        //定义一个空字符串,用来接收请求的结果
        $data = '';
        if (curl_exec($ch)){
            $data = curl_multi_getcontent($ch);
        }
        //关闭curl
        curl_close($ch);
        //将得到的结果返回
        return $data;
    }


}
