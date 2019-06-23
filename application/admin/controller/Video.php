<?php

namespace app\admin\controller;

use app\common\model\Domains;
use app\common\model\Videos;
use think\Request;

class Video extends Base
{

    // 显示视频列表
    public function index(Request $request)
    {
        $post = $request->isAjax();

        if ($post){
            $so = trim(input('param.so'));
            $page = input('param.page/d', 1);
            $limit = input('param.limit/d', 20);

            $videos = Videos::where('title|vid', 'like', "%" . $so . "%")->order(['sort'=>'desc', 'id'=>'desc'])->page($page)->limit($limit)->select();

            if ( count($videos) > 0 ){
                foreach ( $videos as $k=>$v){
                    $v['domain'] = Domains::getOneData(2);
                }
            }

            $data = array(
                'data'      => $videos,
                'count'     => Videos::where('title|vid', 'like', "%" . $so . "%")->count('id'),
                'code'      => 0,
                'msg'       => '',
            );
            return json($data);
        }

        return view();
    }


    // 添加视频、保存数据
    public function create(Request $request)
    {

        if ( $request->isPost() ){
            $post = trimAll($request->post());

            if ( !editAuth() ){
                return json(array('code'=>0, 'msg'=>'测试状态下，不允许添加、修改、删除'));
            }

            $post['label']       = $post['label']  ? $post['label']  : '<p>必看</p><p>实事</p><p>震撼</p>';
            $post['status']      = $post['status'] ?? 2;
            $post['share_title'] = $post['share_title'] ? $post['share_title'] : $post['title'];
            $post['share_desc']  = $post['share_desc']  ? $post['share_desc']  : $post['title'];
            $post['create_time'] = time();
            unset($post['file']);

            //写入数据库
            if ( Videos::create($post) ){
                createLog('添加视频成功：' . $post['title']);
                exit(json_encode(array('code'=>1, 'msg'=>'操作成功')));
            }else{
                createLog('添加视频失败：' . $post['title']);
                exit(json_encode(array('code'=>0, 'msg'=>'操作失败')));
            }

        }else{

            return view();
        }
    }


    // 编辑文章、保存数据
    public function edit(Request $request, $id)
    {

        if ( $request->isPost() ){
            $post = trimAll($request->post());

            if ( !editAuth() ){
                return json(array('code'=>0, 'msg'=>'测试状态下，不允许添加、修改、删除'));
            }

            $post['label']       = $post['label']  ? $post['label']  : '<p>必看</p><p>实事</p><p>震撼</p>';
            $post['status']      = $post['status'] ?? 2;
            $post['share_title'] = $post['share_title'] ? $post['share_title'] : $post['title'];
            $post['share_desc']  = $post['share_desc']  ? $post['share_desc']  : $post['title'];
            unset($post['file']);

            //写入数据库
            if ( Videos::where('id', $id)->update($post) ){
                createLog('编辑视频成功：' . $post['title']);
                exit(json_encode(array('code'=>1, 'msg'=>'操作成功')));
            }else{
                createLog('编辑视频失败：' . $post['title']);
                exit(json_encode(array('code'=>0, 'msg'=>'操作失败')));
            }

        }else{

            //加载数据
            $Video = Videos::get($id);
            $this->assign('Video', $Video);
            return view();

        }
    }



}
