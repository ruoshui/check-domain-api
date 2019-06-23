<?php

namespace app\admin\controller;

use app\common\model\Domains;
use app\common\model\Jumps;
use think\Request;

class Jump extends Base
{


    public function index(Request $request)
    {
        $post = $request->isAjax();
        if ($post){
            $so = trim(input('param.so'));

            $page = input('param.page/d', 1);
            $limit = input('param.limit/d', 20);
            $data = array(
                'data'      =>  Jumps::where('name|url', 'like', "%" . $so . "%")->with('domain')->order(['id'=>'desc'])->page($page)->limit($limit)->select(),
                'count'     =>  Jumps::where('name|url', 'like', "%" . $so . "%")->count('id'),
                'code'      => 0,
                'msg'       => '',
            );

            return json($data);
        }

        return view();
    }


    public function create(Request $request)
    {

        if ( $request->isPost() ){
            $post = trimAll($request->post());

            if ( !editAuth() ){
                return json(array('code'=>0, 'msg'=>'测试状态下，不允许添加、修改、删除'));
            }

            // 通过合并两个数组来创建一个新数组，其中的一个数组元素为键名，另一个数组元素为键值：
            $newArr = array_combine($post['sort'], $post['url']);

            // 根据键，以升序对关联数组进行排序
            ksort($newArr);

            // 把数组 转换成 json字符串
            $newArr = json_encode($newArr);

            $post['status']      = $post['status'] ?? 2;
            $post['url']         = $newArr;
            $post['create_time'] = time();

            //保存到数据库
            if ( Jumps::create($post) ){
                createLog('添加跳转成功：' . $post['name']);
                exit(json_encode(array('code'=>1, 'msg'=>'保存成功')));
            }else{
                createLog('添加跳转失败：' . $post['name']);
                exit(json_encode(array('code'=>0, 'msg'=>'保存失败')));
            }

        }else{
            $domains = Domains::where(['type'=>9, 'status'=>1])->select();
            $this->assign('domains', $domains);
            return view();
        }

    }


    public function edit(Request $request,$id)
    {

        if ( $request->isPost() ){
            $post = trimAll($request->post());

            if ( !editAuth() ){
                return json(array('code'=>0, 'msg'=>'测试状态下，不允许添加、修改、删除'));
            }

            // 通过合并两个数组来创建一个新数组，其中的一个数组元素为键名，另一个数组元素为键值：
            $newArr = array_combine($post['sort'],$post['url']);

            // 根据键，以升序对关联数组进行排序
            ksort($newArr);

            // 把数组 转换成 json字符串
            $newArr = json_encode($newArr);

            $post['status']      = $post['status'] ?? 2;
            $post['url']         = $newArr;

            //保存到数据库
            if ( Jumps::where('id',$id)->update($post) ){
                createLog('编辑跳转成功：' . $post['name']);
                exit(json_encode(array('code'=>1, 'msg'=>'保存成功')));
            }else{
                createLog('编辑跳转失败：' . $post['name']);
                exit(json_encode(array('code'=>0, 'msg'=>'保存失败')));
            }

        }else{

            $data = Jumps::get($id);

            // 把json字符串 转换成数组
            $data['url'] = json_decode($data['url'], true) ?? [];

            // 获取所有跳转域名
            $domains = Domains::where(['type'=>9, 'status'=>1])->select();
            $this->assign(['domains'=>$domains, 'data'=>$data]);
            return view();
        }
    }

}
