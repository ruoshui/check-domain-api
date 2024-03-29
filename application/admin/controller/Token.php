<?php

namespace app\admin\controller;

class Token extends Base
{
    /**
     * 获取access_token方法
     * 正常返回 {"access_token":"ACCESS_TOKEN","expires_in":7200}
     * 错误返回 {"errcode":40013,"errmsg":"invalid appid"}
     */
    public function getAccessToken($appid, $secret){
        //调用curl方法完成请求
        $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=' . $appid . '&secret=' . $secret;
        $result = $this->curl($url);
        //将返回得到的json数据转成php数组
        $result = json_decode($result,true);

        //定义需要返回的内容
        return $result['access_token'] ?? $result['errcode'] . $result['errmsg'];

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
        return $result['ticket'];
    }

    /**
     * 获取签名方法
     */
    public function sign(){
        //需要定义4个参数,分别包括随机数,临时票据,时间戳和当前url地址
        $domain = $_SERVER['HTTP_HOST'];

        $nonceStr = $this->makeStr();
        $ticket = $this->getJsapiTicket();
        $time = time();
        //组合url
        $url = $_SERVER['REQUEST_SCHEME'] . '://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
        //将4个参数放入一个数组中
        $arr = [
            'noncestr=' . $nonceStr,
            'jsapi_ticket=' . $ticket,
            'timestamp=' . $time,
            'url=' . $url,
        ];
        //对数组进行字段化排序
        sort($arr,SORT_STRING);
        //对数组进行组合成字符串
        $string = implode('&',$arr);
        //将字符串加密生成签名
        $sign = sha1($string);
        //由于调用签名方法的时候不只需要签名,还需要生成签名的时候的随机数,时间戳,所以我们应该返回由这些内容组成的一个数组
        $reArr = [
            'appId' => $this->appid,
            'timestamp' => $time,
            'nonceStr' => $nonceStr,
            'signature' => $sign,
            'url' => $url,
        ];
        //将数组返回
        return $reArr;
    }

    /**
     *
     * 生成随机数
     *
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
     *
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
//测试获取access_token值的方法
//$obj = new Wx();
//$data = $obj->getAccessToken();
//echo $data;

//测试获取jsapiticket方法
//$obj = new Wx();
//$data = $obj->getJsapiTicket();
//echo $data;

//测试生成签名方法
//$obj = new Wx();
//$data = $obj->sign();
//echo '<pre>';
//print_r($data);
