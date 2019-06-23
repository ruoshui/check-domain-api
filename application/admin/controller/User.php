<?php

namespace app\admin\controller;

use app\common\model\Users;
use app\common\validate\UserValidate;
use think\Request;
use think\Route;

class User extends Base
{

    //用户列表
    public function index(Request $request)
    {
        $post = $request->isAjax();
        if ($post){
            $so = trim(input('param.so'));
            $page = input('param.page/d', 1);
            $limit = input('param.limit/d', 20);
            $data = array(
                'data'  => Users::where('username|mobile|email', 'like', "%" . $so . "%")->order('id', 'desc')->page($page)->limit($limit)->select(),
                'count' => Users::where('username|mobile|email', 'like', "%" . $so . "%")->count('id'),
                'code'  => 0,
                'msg'   => '',
            );

            return json($data);
        }

        return view();
    }


    //添加用户
    public function create(Request $request)
    {

        if ( $request->isPost() ){
            $post = trimAll($request->post());

            if ( !editAuth() ){
                return json(array('code'=>0, 'msg'=>'测试状态下，不允许添加、修改、删除'));
            }

            //查询此用户是否已经存在
            if ( Users::where('username', $post['username'])->find() ){
                exit(json_encode(array('code'=>0, 'msg'=>'用户' . $post['username'] . '已存在')));
            }

            $post['password'] = sha1Password($post['username'], $post['password']);
            $post['admin']  = $post['admin'] ?? 2;
            $post['status'] = $post['status'] ?? 2;

			//写入数据库
            if ( Users::create($post) ){
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


	// 编辑用户信息
    public function edit(Request $request)
    {
        $id = input('param.id', session('admin.id'));

        if ( $request->isPost() ){
            $post = trimAll($request->post());

            if ( !editAuth() ){
                return json(array('code'=>0, 'msg'=>'测试状态下，不允许添加、修改、删除'));
            }

            // 如果密码不为空，则给密码加密，否则，不修改密码
            if ( $post['password'] ){
                if ( strlen($post['password']) < 6 | strlen($post['password']) > 24 ){
                    return json(array('code'=>0, 'msg'=>'密码长度6-24位'));
                }
                $post['password'] = sha1Password($post['username'], $post['password']);

            }else{
                // 删除密码项（不修改密码）
                unset($post['password']);
            }

            $post['admin']  = $post['admin'] ?? 2;
            $post['status'] = $post['status'] ?? 2;

            if ( $post['username'] == 'admin' && ($post['admin'] == 2 || $post['status'] == 2)){
                exit(json_encode(array('code'=>0, 'msg'=>'admin用户不能修改权限，也不能禁用')));
            }

            if ( Users::where('id', $id)->update($post) ){
                exit(json_encode(array('code'=>1, 'msg'=>'保存成功')));
            }else{
                exit(json_encode(array('code'=>0, 'msg'=>'保存失败')));
            }

        }else{

            $user = Users::get($id);
            $this->assign('user', $user);
            return view();
        }

    }


}
