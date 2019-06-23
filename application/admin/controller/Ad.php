<?php

namespace app\admin\controller;

use app\common\model\Ads;
use app\common\model\Adtypes;
use think\Request;

class Ad extends Base
{
    //获取广告列表
    public function index(Request $request)
    {

        $post = $request->isAjax();

        if ($post){

            $so = trim(input('param.so'));

            $page = input('param.page/d', 1);
            $limit = input('param.limit/d', 20);
            $data = array(
                'data'      =>  Ads::where('title|url|img|content|desc', 'like', "%" . $so . "%")->with('adtype')->order(['sort'=>'desc', 'id'=>'desc'])->page($page)->limit($limit)->select(),
                'count'     =>  Ads::where('title|url|img|content|desc', 'like', "%" . $so . "%")->count('id'),
                'code'      => 0,
                'msg'       => '',
            );

            return json($data);
        }

        //获取全部广告类型
        $adtypes = Adtypes::where(['status'=>1])->order(['sort'=>'desc','id'=>'desc'])->select();
        $this->assign('adtypes', $adtypes);
        return view();

    }


    //添加广告
    public function create(Request $request)
    {
        if ( $request->isPost() ){
            $post = trimAll($request->post());

            if ( !editAuth() ){
                return json(array('code'=>0, 'msg'=>'测试状态下，不允许添加、修改、删除'));
            }

            $post['img']    = $post['img'] ? $post['img'] : nopic();
            $post['status'] = $post['status'] ?? 2;
            $post['create_time'] = time();
            unset($post['file']);

            //写入数据库
            if ( Ads::create($post) ){
                createLog('广告' . $post['title'] . '添加成功');
                exit(json_encode(array('code'=>1, 'msg'=>'添加成功')));
            }else{
                createLog('广告' . $post['title'] . '添加失败');
                exit(json_encode(array('code'=>0, 'msg'=>'添加失败')));
            }

        }else{

            //获取全部广告类型
            $adtypes = Adtypes::where(['status'=>1])->order(['sort'=>'desc','id'=>'desc'])->select();
            $this->assign('adtypes', $adtypes);
            return view();

        }
    }


    //编辑广告信息
    public function edit(Request $request, $id)
    {
        if ( $request->isPost() ){
            $post = trimAll($request->post());

            if ( !editAuth() ){
                return json(array('code'=>0, 'msg'=>'测试状态下，不允许添加、修改、删除'));
            }

            $post['img']    = $post['img'] ? $post['img'] : nopic();
            $post['status'] = $post['status'] ?? 2;
            unset($post['file']);

            if ( Ads::where('id', $id)->update($post) ){
                createLog('广告' . $post['title'] . '修改成功');
                exit(json_encode(array('code'=>1, 'msg'=>'修改成功')));
            }else{
                createLog('广告' . $post['title'] . '修改失败');
                exit(json_encode(array('code'=>0, 'msg'=>'保存失败')));
            }

        }else{
            $ad = Ads::find($id);
            $this->assign('data', $ad);

            //获取全部广告类型
            $adtypes = Adtypes::where(['status'=>1])->order(['sort'=>'desc','id'=>'desc'])->select();
            $this->assign('adtypes', $adtypes);
            return view();
        }
    }


    //广告类型 列表
    public function typelist(Request $request)
    {

        $post = $request->isAjax();
        if ($post){

            $page = input('param.page/d', 1);
            $limit = input('param.limit/d', 20);
            $data = array(
                'data'      =>  Adtypes::order(['sort'=>'desc', 'id'=>'desc'])->page($page)->limit($limit)->select(),
                'count'     =>  Adtypes::count('id'),
                'code'      => 0,
                'msg'       => '',
            );
            return json($data);
        }
        return view();
    }

    //广告类型 添加
    public function typecreate(Request $request)
    {
        if ( $request->isPost() ){
            $post = trimAll($request->post());

            if ( !editAuth() ){
                return json(array('code'=>0, 'msg'=>'测试状态下，不允许添加、修改、删除'));
            }

            $post['status'] = $post['status'] ?? 2;

            if ( Adtypes::create($post) ){

                createLog('广告类型 ' . $post['type'] . '添加成功');
                exit(json_encode(array('code'=>1, 'msg'=>'添加成功')));
            }else{

                createLog('广告类型 ' . $post['type'] . '添加失败');
                exit(json_encode(array('code'=>0, 'msg'=>'添加失败')));
            }

        }else{

            return view();

        }

    }

    //广告类型 编辑
    public function typeedit(Request $request, $id)
    {

        if ( $request->isPost() ){
            $post = trimAll($request->post());

            if ( !editAuth() ){
                return json(array('code'=>0, 'msg'=>'测试状态下，不允许添加、修改、删除'));
            }

            $post['status'] = $post['status'] ?? 2;

            //更新数据
            if ( Adtypes::where(['id'=>$id])->update($post) ){

                createLog('广告类型 ' . $post['type'] . ' 修改成功');
                exit(json_encode(array('code'=>1, 'msg'=>'修改成功')));
            }else{

                createLog('广告类型 ' . $post['type'] . ' 修改失败');
                exit(json_encode(array('code'=>0, 'msg'=>'修改成功')));
            }

        }else{

            $type = Adtypes::where(['id'=>$id])->find();
            $this->assign('type', $type);
            return view();

        }

    }





}
