<?php

namespace app\admin\controller;

use think\Request;

class Upload extends Base
{
    //上传所有文件
    public function file()
    {
        //
    }

    // 上传图片
    public function images(Request $request)
    {

        //获取图片
        $file = $request->file('file');

        //判断是否选择图片
        if ($file == null) {
            exit(json_encode(array('code'=>2, 'msg'=>'请上传文件')));
        }

        //执行移动图片到指定目录
        $info = $file->validate(array('size'=>20971520,'ext'=>'jpg,png,gif'))->move('./uploads/');

		if ($info) {
			//返回图片路径
        	$img = '/uploads/' . str_replace('\\','/',$info->getSaveName());
        	$domain = config('imagePath') ? config('imagePath') : $_SERVER['REQUEST_SCHEME'] . '://' . $_SERVER['HTTP_HOST'];

        	exit(json_encode(array('code'=>0, 'msg'=>'图片成功上传', 'data'=>array('src'=>$img, 'title'=>$img, 'url'=>$domain . $img))));
		} else {
			exit(json_encode(array('code'=>2, 'msg'=>$file->getError())));
		}

    }


    // 上传视频
    public function video(Request $request)
    {
        //获取文件
        $file = $request->file('file');

        //判断是否选择文件
        if ($file == null) {
            exit(json_encode(array('code'=>2, 'msg'=>'请上传文件')));
        }

        //执行移动图片到指定目录
        $info = $file->validate(array('size'=>104857600,'ext'=>'mp4'))->move('./uploads/video/');

        if ($info) {
            //返回图片路径
            $data = '/uploads/video/' . str_replace('\\','/',$info->getSaveName());

            exit(json_encode(array('code'=>0, 'msg'=>'上传成功', 'data'=>array('src'=>$data, 'title'=>$data))));
        } else {
            exit(json_encode(array('code'=>2, 'msg'=>$file->getError())));
        }

    }

    // 上传音频
    public function audio()
    {
        //
    }


}
