<?php

namespace app\admin\controller;

use app\common\model\Domains;
use app\common\model\WechatAccounts;
use think\Request;

class Domain extends Base
{
    //显示所有域名
    public function index(Request $request)
    {
        $post = $request->isAjax();
        if ($post){
            $so = trim(input('param.so'));

            $page = input('param.page/d', 1);
            $limit = input('param.limit/d', 20);
            $data = array(
                'data'      =>  Domains::with('gongzh')->where('domain', 'like', "%" . $so . "%")->order(['sort'=>'desc', 'id'=>'desc'])->page($page)->limit($limit)->select(),
                'count'     =>  Domains::where('domain', 'like', "%" . $so . "%")->count('id'),
                'code'      => 0,
                'msg'       => '',
            );
            return json($data);
        }

        return view();
    }


    //添加一个域名
    public function create(Request $request)
    {

        //获取公众号列表
        $gzhList = WechatAccounts::field('id,account_name')->where(['status'=>1])->order(['sort'=>'desc', 'id'=>'desc'])->select();
        $this->assign('gzhList', $gzhList);

        if ( $request->isPost() ){
            $post = trimAll($request->post());

            if ( !editAuth() ){
                return json(array('code'=>0, 'msg'=>'测试状态下，不允许添加、修改、删除'));
            }

            $post['status'] = $post['status'] ?? 2;
            $post['jiance'] = $post['jiance'] ?? 2;
            $post['update_time'] = time();

            if ( Domains::create($post) ){
                createLog('添加域名成功：' . $post['domain']);
                exit(json_encode(array('code'=>1, 'msg'=>'保存成功')));
            }else{
                createLog('添加域名失败：' . $post['domain']);
                exit(json_encode(array('code'=>0, 'msg'=>'保存失败')));
            }
        }else{
            return view();
        }
    }


    //编辑域名
    public function edit(Request $request)
    {
        //获取公众号列表
        $gzhList = WechatAccounts::field('id,account_name')->where(['status'=>1])->order(['sort'=>'desc', 'id'=>'desc'])->select();
        $this->assign('gzhList', $gzhList);

        $id = input('param.id/d','');

        if ( $request->isPost() ){
            $post = trimAll($request->post());

            if ( !editAuth() ){
                return json(array('code'=>0, 'msg'=>'测试状态下，不允许添加、修改、删除'));
            }

            $post['status'] = $post['status'] ?? 2;
            $post['jiance'] = $post['jiance'] ?? 2;
            $post['update_time'] = time();

            if ( Domains::where('id', $id)->update($post) ){
                createLog('修改域名成功：' . $post['domain']);
                exit(json_encode(array('code'=>1, 'msg'=>'保存成功')));
            }else{
                createLog('修改域名成功：' . $post['domain']);
                exit(json_encode(array('code'=>0, 'msg'=>'保存失败')));
            }
        }else{
            $domain = Domains::find($id);
            $this->assign('domain', $domain);
            return view();
        }
    }


}
