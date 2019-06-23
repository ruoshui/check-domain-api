<?php
// 应用公共文件


// 没有图片
function nopic()
{
    return "/uploads/nopic.jpg";
}


if ( !function_exists('editAuth') ){

    /**
     * true  能编辑
     * false 不能编辑
     * @return bool
     */
    function editAuth()
    {
        return true;
    }

}



// 操作日志
function createLog($action = 'NULL')
{
      $ipAdd = \app\common\model\Ips::getIpAddress();
    $data = array(
        'username'      => session('admin.username') ?? '',
        'action'        => $action ?? 'NULL',
        'ip'            => $_SERVER["REMOTE_ADDR"] ?? 'NULL',
        'ipAscription'  => $ipAdd ?? 'NULL',
        );
    \app\common\model\Logs::create($data);
}


if ( !function_exists('weixinfangwen')){
    function weixinfangwen()
    {

        //判断是否只能微信访问
        if (config('WechatVisitSwitch') == 1){
            $llq = strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger');
            $iPad    = strpos($_SERVER['HTTP_USER_AGENT'], 'iPad');
            $iPhone  = strpos($_SERVER['HTTP_USER_AGENT'], 'iPhone');
            $Android = strpos($_SERVER['HTTP_USER_AGENT'], 'Android');

            //判断浏览器，非微信浏览器报错
            if ($llq==false || ($iPhone==false && $Android==false && $iPad==false)) {
                return redirect(config('NoWechatUrl'));die;
            }
        }
    }
}



/**
 * 新增函数config 比之前的systemConfig函数更精简,使用更方便
 */
if ( !function_exists('config') ){
    /**
     * 获取配置项
     * @param string $name 配置项的name值
     * @param string $showAll 是否显示配置项的全部信息
     * @return array|false|mixed|PDOStatement|string|\think\Model|null
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    function config($name='', $showAll='')
    {
        if ( $name ){

            //获取单个配置项, 如果$showAll为真, 显示此配置项的全部信息, 否则只显示value值
            $conf = \app\common\model\Configs::where(['status'=>1, 'name'=>$name])->find();
            return $showAll ? $conf : $conf['value'];

        } else {

            //获取全部配置
            $confAll = \app\common\model\Configs::field('name,value')->where(['status'=>1])->select();

            //数据整理成一维数组
            $data = [];
            foreach ($confAll as $k=>$v){
                $data[$v['name']] = trim($v['value']);
            }

            return $data;

        }
    }
}


/**
 * 此函数 随时可能废弃
 */
if (!function_exists('systemConfig')){
    //系统配置
    function systemConfig($name=''){
        //获取单个配置项
        if (isset($name) && !empty($name)){
            //获取config配置
            $data = \app\common\model\Configs::where(['status'=>1, 'name'=>$name])->find();
            return $data;
        }

        //获取全部配置项
        if (!isset($name) || empty($name)){
            $allData = \app\common\model\Configs::field('name,value')->where('status',1)->select();

            //数据整理成一维数组
            $data = [];
            foreach ($allData as $k=>$v){
                $data[$v['name']] = trim($v['value']);
            }

            return $data;
        }

    }
}

if (!function_exists('getRandStr')){
    /**
     * 获取a-z,A-Z,0-9的随机字符串
     * @param $len
     * @param $startStr //起始字符串
     * @return string
     * @company    :WuYuZhong Co. Ltd
     * @author     :BabySeeME <417170808@qq.com>
     * @createTime :2018-03-05 14:22
     */
    function getRandStr($len=6,$startStr='') {
        $chars = array_merge(range('a', 'z'));
        $charsLen = count($chars) - 1;
        shuffle($chars);
        $output = $startStr;
        for ($i = 0; $i < $len; $i++) {
            $output .= $chars[mt_rand(0, $charsLen)];
        }
        return $output;
    }
}

/**
 * 加密密码
 * @param $username
 * @param $password
 * @return string
 */
function sha1Password($username, $password){
    return sha1($username . '632656576' . $password);
}


/**
 * 友好的时间显示
 *
 * @param int    $sTime 待显示的时间
 * @param string $type  类型. normal | mohu | full | ymd | other
 * @return string
 */

function friendlyDate($timeInt = null, $format = 'Y-m-d H:i:s') {
    if (empty($timeInt) || !is_numeric($timeInt) || !$timeInt) {
        return '';
    }
    $d = time() - $timeInt;
    if ($d < 0) {
        return '';
    } elseif ($d < 60) {
        return $d . '秒前';
    } elseif ($d < 3600) {
        return floor($d / 60) . '分钟前';
    } elseif ($d < 86400) {
        return floor($d / 3600) . '小时前';
    } elseif ($d < 604800) {
        return floor($d / 86400) . '天前';
    } else {
        return date($format, $timeInt);
    }

}

//屏蔽隐藏中间的字符
function hideMobile($mobile){
    $len = floor(mb_strlen($mobile) / 3);
    return substr_replace($mobile, '****', $len, $len + 1);
}


/**
 *
 */
if (!function_exists('getRandArray')){

    /**
     * 数组随机获取N个值
     * @param array $arr
     * @param int $num
     * @return array|bool
     */
    function getRandArray($arr=[], $num=1)
    {

        if ( count($arr)<1 || $num < 1 ){
            return false;
        }

        //根据数组的数量，创建一个新的临时数组，并乱序,新临时数组的值，当作原数组的key
        $randArr = [];
        for ( $i = 0; $i < count($arr); $i++ ){
            $randArr[] = $i;
        }
        shuffle($randArr);

        //如果需要返回的数组数量大于原数组的数量，返回最大数量
        if ($num > count($arr)){
            $num = count($arr);
        }

        //创建一个返回的数组
        $reArr = [];
        for ( $x = 0; $x < $num; $x++ ){
            $reArr[] = $arr[$randArr[$x]];
        }
        return $reArr;
    }

}

if ( !function_exists('getFullPath')){

    /**
     * 把图片的路径变成绝对路径
     * @param string $image
     * @return string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    function getFullPath($image = ''){
        if ( empty($image) ){
            return $image;
        }

        // 如果 http 或者 // 开头 返回原来的图片地址
        if ( substr($image, 0, 4) == 'http' || substr($image, 0, 2) == '//' ){
            return $image;
        }

        // 如果 / 开头
        if ( substr($image, 0, 1) == '/' ){
            $url = $_SERVER['REQUEST_SCHEME'] . '://' . $_SERVER['HTTP_HOST'];
            $imagePath = config('imagePath') !== null && !empty(config('imagePath')) ? config('imagePath') : $url;
            return $imagePath . $image;
        }
        return $image;
    }
}


if ( !function_exists('trimAll') ){

    /**
     * 去掉字符串或者数组里字符串两边的空格
     * @param $data
     * @return array|string
     */
    function trimAll($data=''){
        if ( is_string($data) ){
            return trim($data);
        }

        if ( is_array($data) ){
            foreach ( $data as $k=>$v ){
                if ( is_array($v) ) {
                    $data[$k] = trimAll($v);
                } else {
                    $data[$k] = trim($v);
                }
            }
            return $data;
        }
        return false;
    }
}


/**
 * 获取一个随机字符串，每分钟变化一次
 * @return string
 */
function getRandStr60(){
    return strval(date('i') + date('H'));
}



function get_server_ip()
{
    if (isset($_SERVER['SERVER_NAME'])) {
        return gethostbyname($_SERVER['SERVER_NAME']);
    } else {
        if (isset($_SERVER)) {
            if (isset($_SERVER['SERVER_ADDR'])) {
                $server_ip = $_SERVER['SERVER_ADDR'];
            } elseif (isset($_SERVER['LOCAL_ADDR'])) {
                $server_ip = $_SERVER['LOCAL_ADDR'];
            }
        } else {
            $server_ip = getenv('SERVER_ADDR');
        }
        return $server_ip ? $server_ip : '获取不到服务器IP';
    }
}



if ( !function_exists('zhuanhuan') ){

    /**
     * 泛域名相互转换 abc123.domain.com <==> *.domain.com
     * @param string $domain
     * @return mixed|string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    function zhuanhuan($domain ='')
    {

        if ( !$domain ){
            $domain = $_SERVER['HTTP_HOST'];
        }

        // 如果是 * 开头 就转换成 随机的二级域名
        // 判断 . 出现的位置
        $chuxian = stripos($domain, '.');

        //截取从0到.之间的字符串
        $search = substr($domain, 0, $chuxian);

        if ( $search == '*'){

            // 把 * 替换成 随机的二级域名
            $domain = str_replace('*', getRandStr(config('fanyumingNum')), $domain);

        } else {

            //把 截取到的内容, 替换成 * 并返回
            $domain = str_replace($search, '*', $domain);
        }

        return $domain;
    }

}

