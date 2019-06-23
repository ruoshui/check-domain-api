<?php
/**
 * 本平台由
 */

namespace app\item\controller;

use app\common\model\Domains;
use app\common\model\WechatAccounts;
use think\Controller;
use think\Request;

class Auto extends Controller
{


    protected function check($appkey='', $domain='')
    {
        $params = array(
            'appkey'=> $appkey,    //您申请的APPKEY
            'url'   => $domain,
        );

        $paramstring = http_build_query($params);
        $content = $this->JCurl('https://check.ywx.cc/api', $paramstring);
        $result = json_decode($content, true);
        return $result;
    }


    //域名检测
    public function checkDomain()
    {

        echo "<meta charset='UTF-8' /><title>微信域名检测</title>";

        // 获取后台开关设置
        $func_switch = config('WechatDomainDetectionSwitch') ?? 2;

        if ( $func_switch == 2 ){

            // 功能未开启
            exit('未开启微信域名检测，可以在后台启动（位置：系统功能->系统设置->系统）');

        } else {

            // 获取appkey
            $appkey = config('WechatDomainDetectionAppkey') ?? '';

            // 获取接口频率
            $sleep = config('WechatDomainDetectionSleep') ?? 2;
        }


        //即使Client断开(如关掉浏览器)，PHP脚本也可以继续执行
        ignore_user_abort(true);
        //后台执行无时间限制
        set_time_limit(0);


        // 获取所有需要检测的域名
        $domains = Domains::field('id,domain,status')->where(['status'=>1, 'jiance'=>1])->select();//halt($domains);
        if ( count($domains)<1 ){

            // 没有获取到需要检测的域名
            exit('没有获取到需要检测的域名');
        }

        $ta = '<style>table,tr,th,td{text-align: center;}td{min-width: 200px;}</style><table align=center border=1 cellpadding=10 cellspacing=0><tr><td colspan=3><b style="font-size: 150%;">域名检测</b></td></tr><tr><th>时间</th><th>域名</th><th>状态</th></tr>';
        foreach ($domains as $k=>$v){

            $checkres = $this->check($appkey, $v['domain']);

            //205 接口请求频繁
            if ($checkres['code']=205){
                // 延时执行
                sleep($sleep);
                $checkres = $this->check($appkey, $v['domain']);
            }

            if ( $checkres['code'] == 100 ){

                if ( $checkres['data'] == 101 ){
                    Domains::where(['id'=>$v['id']])->update(['jiekou' => $checkres['msg'], 'update_time'=>time()]);
                }

                if ( $checkres['data'] == 102 ){
                    Domains::where(['id'=>$v['id']])->update(['jiekou' => $checkres['msg'],'status'=>2, 'update_time'=>time()]);
                }

            } else {

                Domains::where(['id'=>$v['id']])->update(['jiekou' => $checkres['msg'], 'update_time'=>time()]);
            }

            // 添加本地日志
            $this->createLocalhostLog(date('H:i:s') . '	' . $v['domain'] . '    ' . $checkres['msg'] . "\n");

            // 创建网页显示内容
            $ta .= '<tr><td>'.date('Y-m-d H:i:s').'</td><td>'.$v['domain'].'</td><td>'.$checkres['msg'].'</td></tr>';

        }

        echo $ta .= '<tr><td colspan=3><b>域名检测：<a href=//check.ywx.cc target=_blank>https://check.ywx.cc</a> 技术支持 QQ：632656576</b></td></tr></table>';

        //添加几个回车，隔开日志上下
        $this->createLocalhostLog("\n");

    }



    //创建本地日志文件
    public function createLocalhostLog($info='', $wenjianming = 'WechatDomainDetection')
    {

        //判断数据
        if (is_array($info)){
            $info = json_encode($info);
        }

        //定义文件路径
        $dir = 'cache' . DIRECTORY_SEPARATOR . $wenjianming . DIRECTORY_SEPARATOR . date('Y-m') . DIRECTORY_SEPARATOR;

        //判断文件夹是否存在，如果不存在，就创建一个
        if (!file_exists($dir)){
            mkdir ($dir,0777,true);
        }

        //定义文件名称
        $name = date('Y-m-d') . '.txt';

        //路径 + 文件名
        $filename = $dir . $name;

        //保存数据
        $result = file_put_contents($filename, $info, FILE_APPEND | LOCK_EX);

        //返回写入到文件内数据的字节数
        return $result;

    }



    /**
     * 请求接口返回内容
     * @param    string $url [请求的URL地址]
     * @param    string $params [请求的参数]
     * @param    int $ipost [是否采用POST形式]
     * @return    string
     */
    public function JCurl($url, $params = false, $ispost = 0)
    {
        $httpInfo = array();
        $ch = curl_init();

        curl_setopt($ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 60);
        curl_setopt($ch, CURLOPT_TIMEOUT, 60);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
        if ($ispost) {
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $params);
            curl_setopt($ch, CURLOPT_URL, $url);
        }else {
            if ($params) {
                curl_setopt($ch, CURLOPT_URL, $url.'?'.$params);
            } else {
                curl_setopt($ch, CURLOPT_URL, $url);
            }
        }

        $response = curl_exec($ch);
        if ($response === FALSE) {
            //echo "cURL Error: " . curl_error($ch);
            return false;
        }

        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $httpInfo = array_merge($httpInfo, curl_getinfo($ch));
        curl_close($ch);
        return $response;
    }




    //更新accessToken数据 每2小时一次
    public function updateAccessToken()
    {

        echo "<meta charset='UTF-8' /><title>更新accessToken</title>";

        //获取所有公众号
        $gongzhonghao = WechatAccounts::field('id,app_id,app_secret')->where('status',1)->select();
        //更新内容
        foreach ($gongzhonghao as $value){
            $access_token   =   $this->getAccessToken($value['app_id'], $value['app_secret']);
            $ticket         =   $this->getJsapiTicket($access_token);
            $data = array(
                'access_token'=>$access_token,
                'ticket'=>$ticket,
                'update_time'=>date('Y-m-d H:i:s'),
                'expire_time'=>date('Y-m-d H:i:s', time()+7200),
            );
            if ( WechatAccounts::where('id', $value['id'])->update($data) ){

                //日志
                echo $createLog = date('H:i:s') . "	更新成功 ID：" . $value['id'] . "\n";
                echo '<br>';
                echo $createLog .= '到期时间：' . $data['expire_time'] . "\n";
                echo '<br>';
                echo $createLog .= '新Token：' . $data['access_token'] . "\n\n";
                echo '<hr>';
                echo $createLog .= "====================================================================================================\n\n\n";
                echo '<hr>';

                $this->createLocalhostLog($createLog, 'updateAccessToken');
            }else{
                echo $createLog = $value['id'] . "更新异常";
                $this->createLocalhostLog($createLog, 'updateAccessToken');
            }
        }

    }




    /**
     * 获取access_token方法
     * 正常返回 {"access_token":"ACCESS_TOKEN","expires_in":7200}
     * 错误返回 {"errcode":40013,"errmsg":"invalid appid"}
     */
    public function getAccessToken($appid, $secret){
        //调用curl方法完成请求
        $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='. $appid .'&secret=' . $secret;
        $result = $this->curl($url);
        //将返回得到的json数据转成php数组
        $result = json_decode($result,true);
        //定义需要返回的内容
        if (isset($result['access_token']) && !empty($result['access_token'])){
            return $result['access_token'];
        }else{
            return $result['errcode'] . '：' . $result['errmsg'];
        }

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
        if (isset($result['ticket']) && !empty($result['ticket'])){
            return $result['ticket'];
        }else{
            return false;
        }

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
