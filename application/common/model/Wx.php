<?php

namespace app\common\model;

use think\Model;

class Wx extends Model
{
    private $appkey;
    private $url;
    private $clientip;

    /**
     * Console constructor.
     * @access public
     * @param  string     $name    名称
     * @param  string     $version 版本
     * @param null|string $user    执行用户
     */
    public function __construct($appkey, $url , $clientip = null)
    {
        $this->appkey    = $appkey;
        $this->url = $url;
        $this->clientip = $clientip;

    }

    /**
     * 获取签名方法
     */
    public function checkDomian()
    {
        //如果$url为空，使用当前网址
        if (!isset($this->url) || empty($this->url)){
            $this->url = $_SERVER['REQUEST_SCHEME'] . '://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
        }

        //解析$url，获取域名
        $parseUrl = parse_url($this->url);
        if (isset($parseUrl['host'])){
            $domain = $parseUrl['host'];
        }elseif (isset($parseUrl['path'])){
            $domain = $parseUrl['path'];
        }else{
            $domain = $_SERVER['HTTP_HOST'];
        }

        //根据域名，查询公众号，获取app_id,app_secret,access_token,ticket
        $gongzhonghao = WechatAccounts::where('domain1|domain2|domain3',$domain)->find();

        if (!$gongzhonghao){

            //判断 . 出现的位置
            $chuxian = stripos($domain, '.');

            //截取从0到.之间的字符串
            $search = substr($domain, 0, $chuxian) . '.';

            //把截取到的内容,替换成* 并返回
            $domain = str_replace($search, '', $domain);

            //根据域名，查询公众号，获取app_id,app_secret,access_token,ticket
            $gongzhonghao = WechatAccounts::where(['domain1|domain2|domain3'=>$domain, 'status'=>1])->find();

        }


        if ( $gongzhonghao ){

            //查询Token是否过期，如果过期就呵呵了，请联系技术qq 632656576
            if (strtotime($gongzhonghao['expire_time']) < time()){
                @file_get_contents(url('item/auto/updateAccessToken', '', 'html', $_SERVER['HTTP_HOST']));
                $gongzhonghao = WechatAccounts::where('domain1|domain2|domain3',$domain)->find();
            }

        }

        $jsapiTicket = $gongzhonghao['ticket'];
        $timestamp = time();
        $nonceStr = $this->makeStr();//生成随机数
        $string = "jsapi_ticket=$jsapiTicket&noncestr=$nonceStr&timestamp=$timestamp&url=$url";

        $signature = sha1($string);

        $signPackage = array(
            "appId"     => $gongzhonghao['app_id'],
            "nonceStr"  => $nonceStr,
            "timestamp" => $timestamp,
            "signature" => $signature,
            "url"       => $url,
            "rawString" => $string
        );
        return $signPackage;

    }

    /**
     * 生成随机数
     * @return string
     */
    protected function makeStr(){
        //定义字符串组成的种子
        $seed = '1qaz2wsx3edc4rfv5tgb6yhn7ujm8ik9ol0p';
        //通过循环来组成一个16位的随机字符串
        //定义一个空字符串 用来接收组合成的字符串内容
        $str = '';
        for ($i = 0;$i < 16; $i++){
            //定义一个随机数
            $num = rand(0,strlen($seed) - 1);
            //循环连接随机生成的字符串
            $str .= $seed[$num];
        }
        //将随机数返回
        return $str;
    }

    /**
     * 服务器之间请求的curl方法
     * @param $url 请求地址
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

