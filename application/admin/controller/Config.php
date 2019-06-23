<?php

namespace app\admin\controller;

use app\common\model\Configs;
use think\Request;

class Config extends Base
{


    // 配置管理 列表
    public function index(Request $request)
    {
        $group = input('param.group', 'base');
        $post = $request->isAjax();
        if ($post){
            $page = input('param.page/d', 1);
            $limit = input('param.limit/d', 20);
            $data = array(
                'data'      =>  Configs::where('group', "$group")->order(['sort'=>'desc', 'id'=>'desc'])->page($page)->limit($limit)->select(),
                'count'     =>  Configs::where('group', "$group")->count('id'),
                'code'      => 0,
                'msg'       => '',
            );
            return json($data);
        }
        return view();
    }


    // 创建
    public function create(Request $request)
    {

        if ( $request->isPost() ){
            $post = trimAll($request->post());

            if ( !editAuth() ){
                return json(array('code'=>0, 'msg'=>'测试状态下，不允许添加、修改、删除'));
            }

            $post['status'] = $post['status'] ?? 2;
            $post['value']  = trim($post['value']);
            $post['tips']   = trim($post['tips']);
            unset($post['file']);

            if ( Configs::create($post) ){
                createLog('添加配置成功：' . $post['title']);
                exit(json_encode(array('code'=>1, 'msg'=>'保存成功')));
            }else{
                createLog('添加配置失败：' . $post['title']);
                exit(json_encode(array('code'=>0, 'msg'=>'保存失败')));
            }
        }else{
            return view();
        }
    }


    // 编辑
    public function edit(Request $request, $id=0)
    {

        if ( $request->isPost() ){
            $post = trimAll($request->post());

            if ( !editAuth() ){
                return json(array('code'=>0, 'msg'=>'测试状态下，不允许添加、修改、删除'));
            }

            $post['status'] = $post['status'] ?? 2;
            $post['value']  = trim($post['value']);
            $post['tips']   = trim($post['tips']);
            unset($post['file']);

            if ( Configs::where('id', $id)->update($post) ){
                createLog('编辑配置成功：' . $post['title']);
                exit(json_encode(array('code'=>1, 'msg'=>'保存成功')));
            }else{
                createLog('编辑配置失败：' . $post['title']);
                exit(json_encode(array('code'=>0, 'msg'=>'保存失败')));
            }
        }else{
            $config = Configs::find($id);
			$config['tips'] = htmlspecialchars_decode($config['tips']);
			$config['value'] = htmlspecialchars_decode($config['value']);
            $this->assign('config', $config);
            return view();
        }

    }


    //系统设置
    public function set(Request $request)
    {
        $group = input('param.group', 'base');

        if ( $request->isPost() ){
            $post = trimAll($request->post());

            if ( !editAuth() ){
                return json(array('code'=>0, 'msg'=>'测试状态下，不允许添加、修改、删除'));
            }

            //因为未选择switch的话，是不提交的，所以要判断哪些没选择
            $switchs = Configs::field('name')->where(array('group'=>$group, 'status'=>1, 'type'=>'switch'))->select();
            foreach ($switchs as $k=>$v){
                if (!isset($post[$v['name']])||$post[$v['name']]==''){
                    $post[$v['name']] = 2;
                }
            }

            //如果多选按钮checkbox一个都没选的话，是不提交的，判断
            $checkboxs = Configs::field('name')->where(array('group'=>$group, 'status'=>1, 'type'=>'checkbox'))->select();
            foreach ($checkboxs as $k=>$v){
                if (!isset($post[$v['name']])||$post[$v['name']]==''){
                    $post[$v['name']] = '';
                }
            }

            foreach ($post as $k=>$v){
                if (is_array($v)){
                    $v = implode('|', $v);
                }
                Configs::where('name', $k)->update(['value'=>$v]);
            }
            exit(json_encode(array('code'=>1, 'msg'=>'保存成功')));

        }else{

            $data = Configs::where(array('group'=>$group, 'status'=>1))->order('sort', 'desc')->select();
            foreach ($data as $k => $v) {
                //类型为switch、radio、checkbox、select，并且options不为空，需要处理options，处理成数组
                if (($v['type']=='switch' || $v['type']=='radio' || $v['type']=='checkbox' || $v['type']=='select') && !empty($v['options'])) {
                    //先去除HTML代码，再清除两侧的空白、回车
                    $v['options']   = trim(strip_tags($v['options']));

                    //回车、换行、空格替换成逗号
                    $v['options']   = preg_replace("/[\r\n]+/", '","', $v['options']);

                    //回车、换行、空格替换成逗号
                    $v['options']   = '{"' . preg_replace("/:/", '":"', $v['options']) . '"}';

                    $v['options']   = json_decode($v['options'], TRUE);

                    //checkbox的value值，拆分成数组
                    if ($v['type'] == 'checkbox') {
                        $v['value'] = explode('|', $v['value']);
                    }
                }

            }
            $this->assign('data', $data);
            return view();
        }

    }





}
