<?php

namespace app\admin\controller;

use app\common\model\Users;
use think\Controller;
use think\Request;

class Account extends Controller
{

    public function initialize()
    {
        //
    }

    //用户登录
    public function login(Request $request)
    {

        if ( $request->isPost() ){
            $post = trimAll($request->post());

            if ( empty($post['username']) || empty($post['password']) || empty($post['vercode']) ){
                return json(array('code'=>0, 'msg'=>'不能为空'));
            }

			//查询是否有此用户
			$user = Users::where('username', $post['username'])->find();

			//如果没有此用户,提醒
			if (!$user){
                createLog('登陆失败!没有此用户!用户名:' . $post['username']);
			    exit(json_encode(array('code'=>0, 'msg'=>'没有此用户')));
            }

			//对输入的密码进行加密,并且与查询到的密码进行对比
			if (sha1Password($post['username'], $post['password']) != $user['password']){
                createLog('登陆失败！密码错误！用户名：' . $post['username'] . ' 密码：' . $post['password']);
			    exit(json_encode(array('code'=>0, 'msg'=>'密码错误')));
            }

			//检测此用户的状态,1为正常,2为禁用
            if ($user['status'] !== 1){
                exit(json_encode(array('code'=>0, 'msg'=>'此用户已禁用')));
            }

			//检测此用户的权限,1为管理员,2为普通VIP用户
            if ($user['admin'] !== 1){
                exit(json_encode(array('code'=>0, 'msg'=>'此用户没有管理权限')));
            }

            //密码不加入session
            unset($user['password']);

            //把此用户的信息加入到session里
            session('admin', $user);

			//记录登陆日志
            createLog('登陆成功');
			
			//报告前台:登陆成功
            exit(json_encode(array('code'=>1, 'msg'=>'登陆成功')));
        }else{
            return view();
        }
    }

    //用户注册
    public function reg(Request $request)
    {

        return json(array('code'=>0, 'msg'=>'暂不支持注册, 多用户版本请联系技术QQ:632656576'));

        if ( $request->isPost() ){
            $post = trimAll($request->post());

            if (!isset($post['xieyi']) || $post['xieyi'] != 1){
                exit(json_encode(array('code'=>0, 'msg'=>'必须同意用户协议')));
            }

			
            //查询此用户是否已经存在
            $user = Users::where('username', $post['username'])->find();
            if ($user){
                exit(json_encode(array('code'=>0, 'msg'=>'用户' . $post['username'] . '已存在')));
            }

			//整理注册资料
            $data = array(
                'username'  => $post['username'],
                'password'  => sha1Password($post['username'], $post['password']),
                'mobile'    => $post['mobile'],
                'email'     => $post['email'],
                'admin'     => 2,
                'status'    => 1,
            );
			
			//写入数据库
			$res = Users::create($data);
            if ($res){
                createLog('用户' . $post['username'] . '注册成功');
                exit(json_encode(array('code'=>1, 'msg'=>'注册成功')));
            }else{
                createLog('用户' . $post['username'] . '注册失败');
                exit(json_encode(array('code'=>0, 'msg'=>'注册失败')));
            }
        }else{
            return view();
        }
    }

    //安全退出
    public function logout()
    {
        session(null);
        session('admin',null);
        session('user',null);
        $this->redirect(url('admin/account/login'));
    }

}
