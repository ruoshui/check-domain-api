/*
Navicat MySQL Data Transfer

Source Server         : fission_video
Source Server Version : 50726
Source Host           : 47.52.59.212:3306
Source Database       : lb_fission_video

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2019-06-19 11:21:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for fission_ads
-- ----------------------------
DROP TABLE IF EXISTS `fission_ads`;
CREATE TABLE `fission_ads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '广告类型',
  `title` varchar(255) NOT NULL COMMENT '广告标题',
  `url` varchar(255) DEFAULT NULL COMMENT '广告链接地址',
  `img` varchar(255) DEFAULT NULL COMMENT '广告图片地址',
  `content` text COMMENT '广告内容',
  `yuanwen` varchar(255) DEFAULT NULL COMMENT '阅读原文链接',
  `view` int(8) unsigned DEFAULT '0' COMMENT '访问量',
  `label` varchar(255) DEFAULT '<p>推荐</p><p>震撼</p>' COMMENT '标签',
  `desc` varchar(255) DEFAULT NULL COMMENT '备注描述',
  `foot_wx` varchar(255) DEFAULT NULL COMMENT '下方微信二维码地址',
  `sort` int(10) unsigned NOT NULL DEFAULT '500' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '状态，1:启用',
  `create_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fission_ads
-- ----------------------------
INSERT INTO `fission_ads` VALUES ('1', '1', '绝好实拍', 'https://mp.weixin.qq.com/mp/profile_ext?action=home&__biz=MjM5NDAyMDMwOA==&scene=124#wechat_redirect', 'https://ae01.alicdn.com/kf/HTB1E64pX8Gw3KVjSZFD760WEpXak.png', '<p>绝好实拍</p><p><br></p><p>绝好实拍</p><p><br></p><p>绝好实拍</p><p><br></p><p>绝好实拍</p><p><br></p><p>绝好实拍<br></p>', null, '0', '<p>推荐</p><p>震撼</p>', null, null, '500', '1', '1560000000');
INSERT INTO `fission_ads` VALUES ('2', '1', '爱上女孩子', 'https://mp.weixin.qq.com/mp/profile_ext?action=home&__biz=MzIzNTUwOTg1OA==&scene=124#wechat_redirect', 'https://ae01.alicdn.com/kf/HTB1E64pX8Gw3KVjSZFD760WEpXak.png', '<p>爱上女孩子</p><p><br></p><p>爱上女孩子</p><p><br></p><p>爱上女孩子</p><p><br></p><p>爱上女孩子</p><p><br></p><p>爱上女孩子<br></p>', null, '0', '<p>推荐</p><p>震撼</p>', null, null, '500', '1', '1560000000');
INSERT INTO `fission_ads` VALUES ('3', '2', '回退广告1，裂变程序开发，微信：13168096632', null, 'https://ae01.alicdn.com/kf/HTB1kQ.ub8aE3KVjSZLe760sSFXaC.png', '<p>回退广告1，裂变程序开发，微信：13168096632</p><p><br></p><p>回退广告1，裂变程序开发，微信：13168096632</p><p><br></p><p>回退广告1，裂变程序开发，微信：13168096632</p><p><br></p><p>回退广告1，裂变程序开发，微信：13168096632</p><p><br></p><p>回退广告1，裂变程序开发，微信：13168096632<br></p>', 'tel://13168096632', '0', '<p>推荐</p><p>震撼</p>', null, 'https://ae01.alicdn.com/kf/HTB1E64pX8Gw3KVjSZFD760WEpXak.png', '500', '1', '1560000000');
INSERT INTO `fission_ads` VALUES ('4', '2', '回退广告2，裂变程序开发，微信：13168096632', null, 'https://ae01.alicdn.com/kf/HTB1kQ.ub8aE3KVjSZLe760sSFXaC.png', '<p>回退广告2，裂变程序开发，微信：13168096632</p><p><br></p><p>回退广告2，裂变程序开发，微信：13168096632</p><p><br></p><p>回退广告2，裂变程序开发，微信：13168096632</p><p><br></p><p>回退广告2，裂变程序开发，微信：13168096632</p><p><br></p><p>回退广告2，裂变程序开发，微信：13168096632<br></p>', 'tel://13168096632', '0', '<p>推荐</p><p>震撼</p>', null, 'https://ae01.alicdn.com/kf/HTB1E64pX8Gw3KVjSZFD760WEpXak.png', '500', '1', '1560000000');
INSERT INTO `fission_ads` VALUES ('5', '3', '猜你喜欢广告1', 'https://www.baidu.com/s?wd=111', 'https://ae01.alicdn.com/kf/HTB1kQ.ub8aE3KVjSZLe760sSFXaC.png', '<p>猜你喜欢广告1</p><p><br></p><p>猜你喜欢广告1</p><p><br></p><p>猜你喜欢广告1</p><p><br></p><p>猜你喜欢广告1</p><p><br></p><p>猜你喜欢广告1<br></p>', '', '50050', '<p>推荐</p><p>震撼</p>', '', '', '500', '1', '1560000000');
INSERT INTO `fission_ads` VALUES ('6', '3', '猜你喜欢广告2', 'https://www.baidu.com/s?wd=222', 'https://ae01.alicdn.com/kf/HTB1kQ.ub8aE3KVjSZLe760sSFXaC.png', '<p>猜你喜欢广告2</p><p><br></p><p>猜你喜欢广告2</p><p><br></p><p>猜你喜欢广告22</p><p><br></p><p>猜你喜欢广告2</p><p><br></p><p>猜你喜欢广告2<br></p>', '', '68199', '<p>推荐</p><p>震撼</p>', '', '', '500', '1', '1560000000');
INSERT INTO `fission_ads` VALUES ('7', '4', '最后一次分享到朋友圈加载的广告1', '', 'https://ae01.alicdn.com/kf/HTB1kQ.ub8aE3KVjSZLe760sSFXaC.png', '<p>最后一次分享到朋友圈加载的广告111</p><p>最后一次分享到朋友圈加载的广告111</p><p>最后一次分享到朋友圈加载的广告111</p><p>最后一次分享到朋友圈加载的广告111</p><p>最后一次分享到朋友圈加载的广告111</p><p>最后一次分享到朋友圈加载的广告111</p>', '', '0', '<p>推荐</p><p>震撼</p>', '', '', '500', '1', '1560000000');
INSERT INTO `fission_ads` VALUES ('8', '4', '最后一次分享到朋友圈加载的广告2222', '', 'https://ae01.alicdn.com/kf/HTB1kQ.ub8aE3KVjSZLe760sSFXaC.png', '<p>最后一次分享到朋友圈加载的广告222</p><p>最后一次分享到朋友圈加载的广告222</p><p>最后一次分享到朋友圈加载的广告222</p><p>最后一次分享到朋友圈加载的广告222</p><p><br></p>', '', '0', '<p>推荐</p><p>震撼</p>', '', '', '500', '1', '1560000000');
INSERT INTO `fission_ads` VALUES ('9', '5', '通用底部广告1，裂变程序开发，微信：13168096632', '', 'https://ae01.alicdn.com/kf/HTB1Z_Etb81D3KVjSZFy762uFpXaQ.png', '<p>通用底部广告1，裂变程序开发，微信：13168096632</p><p><br></p><p>通用底部广告1，裂变程序开发，微信：13168096632</p><p><br></p><p>通用底部广告1，裂变程序开发，微信：13168096632</p><p><br></p><p>通用底部广告1，裂变程序开发，微信：13168096632</p><p><br></p><p>通用底部广告1，裂变程序开发，微信：13168096632<br></p>', '', '0', '<p>推荐</p><p>震撼</p>', '', 'https://ae01.alicdn.com/kf/HTB1E64pX8Gw3KVjSZFD760WEpXak.png', '500', '1', '1560000000');
INSERT INTO `fission_ads` VALUES ('10', '5', '通用底部广告2，裂变程序开发，微信：13168096632', '', 'https://ae01.alicdn.com/kf/HTB1iKwub8GE3KVjSZFh763kaFXaa.png', '<p>通用底部广告2，裂变程序开发，微信：13168096632</p><p><br></p><p>通用底部广告2，裂变程序开发，微信：13168096632</p><p><br></p><p>通用底部广告2，裂变程序开发，微信：13168096632</p><p><br></p><p>通用底部广告2，裂变程序开发，微信：13168096632</p><p><br></p><p>通用底部广告2，裂变程序开发，微信：13168096632<br></p>', 'tel://13168096632', '0', '<p>推荐</p><p>震撼</p>', '', 'https://ae01.alicdn.com/kf/HTB1E64pX8Gw3KVjSZFD760WEpXak.png', '500', '1', '1560000000');

-- ----------------------------
-- Table structure for fission_adtypes
-- ----------------------------
DROP TABLE IF EXISTS `fission_adtypes`;
CREATE TABLE `fission_adtypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL COMMENT '广告类型',
  `desc` varchar(255) DEFAULT NULL COMMENT '广告类型介绍',
  `sort` int(10) unsigned NOT NULL DEFAULT '50' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，启用：1；禁用：!=1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fission_adtypes
-- ----------------------------
INSERT INTO `fission_adtypes` VALUES ('1', '引导关注', '引导用户关注公众号', '800', '1');
INSERT INTO `fission_adtypes` VALUES ('2', '回退广告', '回退广告（点击返回上一页时会随机跳转到此页面）', '700', '1');
INSERT INTO `fission_adtypes` VALUES ('3', '猜你喜欢广告', '视频下面，猜你喜欢，第一条广告', '600', '1');
INSERT INTO `fission_adtypes` VALUES ('4', '分享广告', '最后一次分享，加载的广告', '500', '1');
INSERT INTO `fission_adtypes` VALUES ('5', '通用底部广告', '所有页面适用，底部图片广告「包含浮动广告」', '400', '1');

-- ----------------------------
-- Table structure for fission_blacklists
-- ----------------------------
DROP TABLE IF EXISTS `fission_blacklists`;
CREATE TABLE `fission_blacklists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) DEFAULT NULL COMMENT 'IP地址',
  `url` varchar(255) DEFAULT NULL COMMENT '网址',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '加入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fission_blacklists
-- ----------------------------
INSERT INTO `fission_blacklists` VALUES ('1', '113.65.31.252', 'http://tzzvhwb.978281.cn/video/103.html', '1560353825');
INSERT INTO `fission_blacklists` VALUES ('2', '42.236.10.125', '', '1560353828');

-- ----------------------------
-- Table structure for fission_configs
-- ----------------------------
DROP TABLE IF EXISTS `fission_configs`;
CREATE TABLE `fission_configs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为系统配置(1是，2否)',
  `group` varchar(20) NOT NULL DEFAULT 'base' COMMENT '分组',
  `title` varchar(20) NOT NULL COMMENT '配置标题',
  `name` varchar(50) NOT NULL COMMENT '配置名称，由英文字母和下划线组成',
  `value` text COMMENT '配置值',
  `type` varchar(20) NOT NULL DEFAULT 'input' COMMENT '配置类型',
  `options` text COMMENT '配置项(选项名:选项值)',
  `url` varchar(255) DEFAULT '' COMMENT '文件上传接口',
  `tips` varchar(255) DEFAULT NULL COMMENT '配置提示',
  `sort` int(10) unsigned NOT NULL DEFAULT '500' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '状态：1为启用，2为禁用',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fission_configs
-- ----------------------------
INSERT INTO `fission_configs` VALUES ('1', '1', 'base', '网站状态', 'site_status', '1', 'switch', '0:关闭\n1:开启', '', '网站状态，关闭网站后，前台无法访问，后台还可以正常访问', '1000', '1', '1560000000');
INSERT INTO `fission_configs` VALUES ('2', '1', 'base', '站点名称', 'site_name', '视频裂变系统', 'input', '', '', '站点名称', '999', '1', '1560000000');
INSERT INTO `fission_configs` VALUES ('3', '1', 'base', '站点域名', 'site_domain', 'lb.fission.video', 'input', '', '', '如果有手机网站，请设置为开启状态，否则只显示PC网站', '888', '1', '1560000000');
INSERT INTO `fission_configs` VALUES ('4', '1', 'base', '站点logo', 'logo', '', 'image', '', '', '站点logo', '800', '2', '1560000000');
INSERT INTO `fission_configs` VALUES ('5', '1', 'base', '站点关键词', 'site_keywords', '站点关键词', 'input', '', '', '站点关键词', '777', '2', '1560000000');
INSERT INTO `fission_configs` VALUES ('6', '1', 'base', '网站描述', 'site_description', '网站描述，网站描述', 'input', '', '', '网站描述', '666', '2', '1560000000');
INSERT INTO `fission_configs` VALUES ('7', '1', 'base', '站长微信号', 'wechat', '13168096632', 'input', '', '', '站长微信号', '444', '1', '1560000000');
INSERT INTO `fission_configs` VALUES ('8', '1', 'base', '站长QQ号码', 'qq', '632656576', 'input', '', '', '站长QQ号码', '333', '1', '1560000000');
INSERT INTO `fission_configs` VALUES ('9', '1', 'base', '站长手机号码', 'mobile', '13168096632', 'input', '', '', '站长手机号码', '222', '1', '1560000000');
INSERT INTO `fission_configs` VALUES ('10', '1', 'base', '版权信息', 'copyright', 'CopyRight &copy; 2018 www.fission.video', 'input', '', '', '版权信息', '111', '2', '1560000000');
INSERT INTO `fission_configs` VALUES ('11', '1', 'base', '备案信息', 'record', '沪ICP备14004226号-2', 'input', '', '', '备案信息', '99', '2', '1560000000');
INSERT INTO `fission_configs` VALUES ('12', '1', 'base', '流量统计', 'liuliangtongji', '<script type=\"text/javascript\" src=\"https://s23.cnzz.com/z_stat.php?id=1277720966&web_id=1277720966\"></script>', 'textarea', '', '', '流量统计代码，前台模板会编译', '88', '1', '1560000000');
INSERT INTO `fission_configs` VALUES ('13', '1', 'sys', '泛域名前缀个数', 'fanyumingNum', '8', 'input', '', '', '泛域名前缀个数', '900', '1', '1560000000');
INSERT INTO `fission_configs` VALUES ('14', '1', 'sys', '只能微信访问', 'WechatVisitSwitch', '2', 'switch', '0:关闭\n1:开启', '', '开启后，只能在微信里访问', '800', '1', '1560000000');
INSERT INTO `fission_configs` VALUES ('15', '1', 'sys', '非微信访问跳转', 'NoWechatUrl', '/404.html', 'input', '', '', '如果只允许微信访问，非微信访问就跳转到此网址，如：/404.html 或 http://www.qq.com', '700', '1', '1560000000');
INSERT INTO `fission_configs` VALUES ('16', '1', 'sys', '微信域名检测', 'WechatDomainDetectionSwitch', '1', 'switch', '', '', '开启后，如果检测到域名被微信屏蔽，系统会自动禁用此域名', '600', '1', '1560000000');
INSERT INTO `fission_configs` VALUES ('17', '1', 'sys', '域名检测appkey', 'WechatDomainDetectionAppkey', 'D72DE5A8A44136E82B0BD87DF5AC383617DCB39B', 'input', '', '', '域名检测appkey，请联系技术QQ:632656576 或者登陆官网注册 <a href=\"//check.ywx.cc\" target=\"_blank\">https://check.ywx.cc</a>', '500', '1', '1560000000');
INSERT INTO `fission_configs` VALUES ('18', '1', 'sys', '域名检测频率', 'WechatDomainDetectionSleep', '1', 'radio', '1:1秒\n2:2秒\n3:3秒', '', '单位：秒；域名检测频率，由服务商提供，一般是1秒或者2秒', '400', '1', '1560000000');
INSERT INTO `fission_configs` VALUES ('19', '1', 'sys', '资源网址', 'imagePath', 'http://lb.fission.video', 'input', '', '', '可为空，或者填写 http://本站域名，例如：http://www.yourdomain.com，填写资源网址，利于图片、js脚本、css样式等的缓存', '300', '1', '1560000000');
INSERT INTO `fission_configs` VALUES ('20', '1', 'video', '推荐视频数量', 'recommend_num', '3', 'input', '', '', '前台推荐视频的数量，不显示请输入0', '880', '1', '1560000000');
INSERT INTO `fission_configs` VALUES ('21', '1', 'video', '猜你喜欢广告', 'viewLikeAds', '1', 'input', '', '', '猜你喜欢最顶部广告的数量，不显示请输入0', '860', '1', '1560000000');
INSERT INTO `fission_configs` VALUES ('22', '1', 'video', '底部广告数量', 'viewBottomAds', '1', 'input', '', '', '视频底部推荐广告的数量，不显示请输入0', '840', '1', '1560000000');
INSERT INTO `fission_configs` VALUES ('23', '1', 'video', '底部浮动广告', 'bottom_float_ad', '1', 'switch', '', '', '底部浮动广告', '820', '1', '1560000000');
INSERT INTO `fission_configs` VALUES ('24', '1', 'video', '视频模板', 'video_template', 'template1', 'select', 'template1:模板一「可用」\ntemplate2:模板二「可用」\ntemplate3:模板三「暂无」', '', '<a class=\"layui-btn layui-btn-xs\" onclick=\"showImg(\'https://ae01.alicdn.com/kf/HTB1JTXncf5G3KVjSZPxq6zI3XXav.jpg\');\">点此查看模板展示</a>', '800', '1', '1560000000');
INSERT INTO `fission_configs` VALUES ('25', '1', 'video', '视频回退广告网址', 'back_jump_url', 'http://vkgyjf.978281.cn/u/1', 'input', '', '', '注意：在视频页面有效。网页返回上一步，无限循环广告网址', '780', '1', '1560000000');
INSERT INTO `fission_configs` VALUES ('26', '1', 'video', '视频分享结束跳转', 'video_share_end_url', '', 'input', '', '', 'http开头 , 留空为继续播放视频', '760', '1', '1560000000');
INSERT INTO `fission_configs` VALUES ('27', '1', 'video', '视频播放结束跳转', 'video_end_jump', 'http://vkgyjf.978281.cn/u/1', 'input', '', '', 'http开头 , 播放下一个请输入 /item/video/first/', '740', '1', '1560000000');
INSERT INTO `fission_configs` VALUES ('28', '1', 'video', '先群？先圈？', 'video_xian_who', '1', 'radio', '1:先分享到群\n2:先分享到朋友圈', '', '先分享到群？还是先分享到朋友圈？', '720', '1', '1560000000');
INSERT INTO `fission_configs` VALUES ('29', '1', 'video', '视频分享到群次数', 'video_share_qun_num', '2', 'input', '', '', '视频分享到群次数', '700', '1', '1560000000');
INSERT INTO `fission_configs` VALUES ('30', '1', 'video', '视频分享到圈次数', 'video_share_quan_num', '1', 'input', '', '', '视频分享到朋友圈次数', '680', '1', '1560000000');
INSERT INTO `fission_configs` VALUES ('31', '1', 'video', '视频分享背景图片', 'video_share_bg', 'https://ae01.alicdn.com/kf/HTB15rhNXvxj_uVjSZFq761boFXaG.png', 'image', '', '', '视频分享背景图片', '660', '1', '1560000000');
INSERT INTO `fission_configs` VALUES ('32', '1', 'video', '视频分享提示1', 'video_share_alert_1', '<h1 style=\"color: #098;\">请分享到微信群</h1><h2>免费观看完整视频</h2><h2 style=\"color: #F52;font-weight: 300;\">结局更精彩</h2>', 'textarea', '', '', '触发分享提示信息，使用默认值可以留空', '640', '1', '1560000000');
INSERT INTO `fission_configs` VALUES ('33', '1', 'video', '视频分享提示2', 'video_share_alert_2', '<h1 style=\"color: #098;\">分享成功</h1><h2>请继续分享到 <b style=\"color: #F52;\">1</b> 个微信群</h2>', 'textarea', '', '', '第一次分享成功后，显示此提示！使用默认值可以留空', '620', '1', '1560000000');
INSERT INTO `fission_configs` VALUES ('34', '1', 'video', '视频分享提示3', 'video_share_alert_3', '<h1 style=\"color: #098;\">分享成功</h1><h2>请再分享一次 <b style=\"color: #F52;\">朋友圈</b> 即可观看</h2>', 'textarea', '', '', '第二次分享成功后，显示此提示！使用默认值可以留空', '600', '1', '1560000000');
INSERT INTO `fission_configs` VALUES ('35', '1', 'video', '视频分享提示4', 'video_share_alert_4', '<h1 style=\"color: #F52;\">分享成功</h1><h2>请再分享一次 <b style=\"color: #098;\">朋友圈</b> 即可观看</h2>', 'textarea', '', '', '使用默认值可以留空', '580', '1', '1560000000');
INSERT INTO `fission_configs` VALUES ('36', '1', 'video', '视频分享提示5', 'video_share_alert_5', '<h1 style=\"color: #098;\">分享成功</h1><h2>你可以继续观看视频了</h2>', 'textarea', '', '', '使用默认值可以留空', '560', '1', '1560000000');
INSERT INTO `fission_configs` VALUES ('37', '1', 'video', '视频分享提示6', 'video_share_alert_6', '<h1 style=\"color: #098;\">分享成功</h1><h2>你可以继续观看视频了</h2>', 'textarea', '', '', '使用默认值可以留空', '540', '1', '1560000000');
INSERT INTO `fission_configs` VALUES ('38', '1', 'qita', '记录访问1', 'jilufangwen', '2', 'switch', '1:开启\n0:禁用', '', '是否记录操作人员访问了哪些页面', '500', '2', '1560000000');
INSERT INTO `fission_configs` VALUES ('39', '1', 'qita', '123', '123', '1', 'switch', '', '', '底部浮动广告', '830', '2', '1560000000');
INSERT INTO `fission_configs` VALUES ('40', '1', 'qita', '多选', 'duoxuan', 'A|B|C', 'checkbox', 'A:A\nB:B\nC:C', '', '', '300', '2', '1560000000');

-- ----------------------------
-- Table structure for fission_domains
-- ----------------------------
DROP TABLE IF EXISTS `fission_domains`;
CREATE TABLE `fission_domains` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gid` int(10) unsigned DEFAULT NULL COMMENT '公众号id',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '域名类型',
  `domain` varchar(255) NOT NULL COMMENT '域名',
  `sort` int(10) unsigned NOT NULL DEFAULT '500' COMMENT '排序,数字越大越靠前',
  `jiekou` varchar(255) DEFAULT NULL COMMENT '接口状态',
  `jiance` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否域名检测',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '域名状态：1、正常使用；2、暂停使用',
  `desc` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fission_ips
-- ----------------------------
DROP TABLE IF EXISTS `fission_ips`;
CREATE TABLE `fission_ips` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) NOT NULL COMMENT 'IP地址',
  `address` varchar(255) NOT NULL COMMENT 'IP归属地',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fission_jumps
-- ----------------------------
DROP TABLE IF EXISTS `fission_jumps`;
CREATE TABLE `fission_jumps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `did` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '域名id',
  `name` char(255) NOT NULL COMMENT '名称',
  `url` text NOT NULL COMMENT '网址',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '访问量',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '默认1为启用,禁用为0',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fission_jumps
-- ----------------------------
INSERT INTO `fission_jumps` VALUES ('1', '4', '回退广告1', '{\"1\":\"https:\\/\\/www.baidu.com\\/s?wd=\\u8fd9\\u662f\\u6f14\\u793a1111\",\"2\":\"https:\\/\\/www.baidu.com\\/s?wd=\\u8fd9\\u662f\\u6f14\\u793a2222\",\"3\":\"https:\\/\\/www.baidu.com\\/s?wd=\\u8fd9\\u662f\\u6f14\\u793a3333\",\"4\":\"https:\\/\\/www.baidu.com\\/s?wd=\\u8fd9\\u662f\\u6f14\\u793a4444\",\"5\":\"https:\\/\\/www.baidu.com\\/s?wd=\\u8fd9\\u662f\\u6f14\\u793a5555\",\"6\":\"https:\\/\\/www.baidu.com\\/s?wd=\\u8fd9\\u662f\\u6f14\\u793a6666\",\"7\":\"https:\\/\\/www.baidu.com\\/s?wd=\\u8fd9\\u662f\\u6f14\\u793a7777\",\"8\":\"https:\\/\\/www.baidu.com\\/s?wd=\\u8fd9\\u662f\\u6f14\\u793a8888\",\"9\":\"https:\\/\\/www.baidu.com\\/s?wd=\\u8fd9\\u662f\\u6f14\\u793a9999\"}', '8912', '1', '1560000000');
INSERT INTO `fission_jumps` VALUES ('2', '4', '回退广告2', '{\"111\":\"https:\\/\\/www.baidu.com\\/s?wd=\\u70b9\\u51fb\\u8fd4\\u56de\\uff0c\\u65e0\\u9650\\u8fd4\\u56de\",\"222\":\"https:\\/\\/www.baidu.com\\/s?wd=\\u70b9\\u51fb\\u8fd4\\u56de\\uff0c\\u600e\\u4e48\\u90fd\\u662f\\u5e7f\\u544a\\u554a\",\"333\":\"https:\\/\\/www.baidu.com\\/s?wd=\\u70b9\\u51fb\\u8fd4\\u56de\\uff0c\\u4ec0\\u4e48\\u60c5\\u51b5\",\"444\":\"https:\\/\\/www.baidu.com\\/s?wd=\\u70b9\\u51fb\\u8fd4\\u56de\\uff0c\\u600e\\u4e48\\u5173\\u95ed\",\"555\":\"https:\\/\\/www.baidu.com\\/s?wd=\\u70b9\\u51fb\\u8fd4\\u56de\\uff0c\\u8fd4\\u56de\\u5230\\u5929\\u660f\\u5730\\u6697\"}', '3685', '1', '1555152903');

-- ----------------------------
-- Table structure for fission_logs
-- ----------------------------
DROP TABLE IF EXISTS `fission_logs`;
CREATE TABLE `fission_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(255) NOT NULL COMMENT '用户',
  `action` char(255) NOT NULL COMMENT '操作',
  `ip` char(255) NOT NULL COMMENT 'IP地址',
  `ipAscription` char(255) NOT NULL COMMENT 'IP归属',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fission_users
-- ----------------------------
DROP TABLE IF EXISTS `fission_users`;
CREATE TABLE `fission_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `mobile` char(255) NOT NULL COMMENT '手机号码',
  `email` char(255) DEFAULT NULL COMMENT '电子邮件',
  `admin` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '管理员权限 1:管理员, 2:VIP',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1:启用, 2:禁用',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fission_users
-- ----------------------------
INSERT INTO `fission_users` VALUES ('1', 'admin', '89f1d0bd98d8dbcf606d3553e8caccfaace47fcf', '13168096632', 'zhangluwei@zhangluwei.cn', '1', '1', '1560000000');

-- ----------------------------
-- Table structure for fission_videos
-- ----------------------------
DROP TABLE IF EXISTS `fission_videos`;
CREATE TABLE `fission_videos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '博客文章标题',
  `vid` varchar(255) NOT NULL COMMENT '视频VID',
  `miao` int(10) unsigned NOT NULL DEFAULT '10' COMMENT '停止时间',
  `img` varchar(255) DEFAULT NULL,
  `share_title` varchar(255) DEFAULT NULL COMMENT '分享标题',
  `share_desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `view` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '访问量',
  `dianzan` int(10) unsigned DEFAULT '1' COMMENT '点赞数量',
  `label` varchar(255) DEFAULT '<p>推荐</p><p>震撼</p>' COMMENT '标签',
  `sort` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序,数字越大越靠前',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态1为启用,2为禁用',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fission_videos
-- ----------------------------
INSERT INTO `fission_videos` VALUES ('1', '小伙出狱108天，在前妻家门口修鞋107天，竟是为了…', 'p0612rebji7', '310', 'https://vpic.video.qq.com/img/p0612rebji7.png', '小伙出狱108天，在前妻家门口修鞋107天，竟是为了…', '小伙出狱108天，在前妻家门口修鞋107天，竟是为了…', '91382', '4535', '<p>推荐</p><p>震撼</p>', '500', '1', '1560000000');
INSERT INTO `fission_videos` VALUES ('2', '富二代看上{city}集团CEO的女人，被CEO叫来保镖狠狠的教训了一顿…', 'm0803nczksk', '520', 'https://ae01.alicdn.com/kf/HTB1KWsEbW5s3KVjSZFN763D3FXav.png', '富二代看上{city}集团CEO的女人，被CEO叫来保镖狠狠的教训了一顿…', '富二代看上{city}集团CEO的女人，被CEO叫来保镖狠狠的教训了一顿…', '46527', '1625', '<p>推荐</p><p>震撼</p>', '500', '1', '1560000000');
INSERT INTO `fission_videos` VALUES ('3', '小伙参加同学聚会被打，电话喊百人怒砸KTV场面失控……', 'j08399c0zbz', '270', 'https://ae01.alicdn.com/kf/HTB1xDgub.KF3KVjSZFE760ExFXad.png', '小伙参加同学聚会被打，电话喊百人怒砸KTV场面失控……', '小伙参加同学聚会被打，电话喊百人怒砸KTV场面失控……', '66989', '13997', '<p>推荐</p><p>震撼</p>', '500', '1', '1560000000');
INSERT INTO `fission_videos` VALUES ('4', '女大学生酒吧被灌醉怀孕生子，男子居然说他给了钱……', 'l0838wzsejw', '370', 'https://ae01.alicdn.com/kf/HTB1sDsub.GF3KVjSZFm762qPXXau.png', '女大学生酒吧被灌醉怀孕生子，男子居然说他给了钱……', '女大学生酒吧被灌醉怀孕生子，男子居然说他给了钱……', '30762', '4700', '<p>推荐</p><p>震撼</p>', '500', '1', '1560000000');
INSERT INTO `fission_videos` VALUES ('5', '{city}弟弟陷害哥哥把嫂子搞到手，每天跟她……', 'p0793p9ejlt', '307', 'https://ae01.alicdn.com/kf/HTB18gEBb8Kw3KVjSZFO761rDVXaM.png', '{city}弟弟陷害哥哥把嫂子搞到手，每天跟她……', '{city}弟弟陷害哥哥把嫂子搞到手，每天跟她……', '101167', '13868', '<p>推荐</p><p>震撼</p>', '500', '1', '1560000000');
INSERT INTO `fission_videos` VALUES ('6', '{city}修车小伙返乡，送兄弟豪车，开霸道都那么猖狂了', 'g0779aipz71', '435', 'https://ae01.alicdn.com/kf/HTB1t_oDbWSs3KVjSZPi763siVXaF.png', '{city}修车小伙返乡，送兄弟豪车，开霸道都那么猖狂了', '{city}修车小伙返乡，送兄弟豪车，开霸道都那么猖狂了', '86433', '5646', '<p>推荐</p><p>震撼</p>', '500', '1', '1560000000');
INSERT INTO `fission_videos` VALUES ('7', '农民工骑三轮车撞上小破车被打，{city}大哥过来一斧头人车一起毁了', 't0651le6iba', '177', 'https://vpic.video.qq.com/img/t0651le6iba.png', '农民工骑三轮车撞上小破车被打，{city}大哥过来一斧头人车一起毁了', '农民工骑三轮车撞上小破车被打，{city}大哥过来一斧头人车一起毁了', '36458', '3919', '<p>推荐</p><p>震撼</p>', '500', '1', '1560000000');
INSERT INTO `fission_videos` VALUES ('8', '{city}富家少爷穿破衣约会被美女看不起，最后美女被强 G...', 'a0770q21iyv', '488', 'https://ae01.alicdn.com/kf/HTB1YcQEbWWs3KVjSZFx761WUXXas.png', '{city}富家少爷穿破衣约会被美女看不起，最后美女被强 G...', '{city}富家少爷穿破衣约会被美女看不起，最后美女被强 G...', '62870', '10108', '<p>推荐</p><p>震撼</p>', '500', '1', '1560000000');
INSERT INTO `fission_videos` VALUES ('9', '{city}为兄弟抗罪入狱六年，出狱后路边摆烧烤摊和兄弟再相遇！结果...', 'k1412tnv13n', '30', 'https://ae01.alicdn.com/kf/HTB1xx7ub4iH3KVjSZPf760BiVXaC.png', '{city}为兄弟抗罪入狱六年，出狱后路边摆烧烤摊和兄弟再相遇！结果...', '{city}为兄弟抗罪入狱六年，出狱后路边摆烧烤摊和兄弟再相遇！结果...', '24413', '2529', '<p>推荐</p><p>震撼</p>', '500', '1', '1560000000');
INSERT INTO `fission_videos` VALUES ('10', '{city}小伙当兵八年归来，得知重疾父亲被恶霸打瘫痪...', 'u0775galbnv', '100', 'https://ae01.alicdn.com/kf/HTB1XK7wb.GF3KVjSZFv762_nXXaz.png', '{city}小伙当兵八年归来，得知重疾父亲被恶霸打瘫痪...', '{city}小伙当兵八年归来，得知重疾父亲被恶霸打瘫痪...', '28217', '3948', '<p>推荐</p><p>震撼</p>', '500', '1', '1560000000');
INSERT INTO `fission_videos` VALUES ('11', '{city}美女董事长被姐妹设计破产，抢走所有后......', 'd07836vctxh', '1000', 'https://ae01.alicdn.com/kf/HTB1UJ7EbYus3KVjSZKb760qkFXax.png', '{city}美女董事长被姐妹设计破产，抢走所有后......', '{city}美女董事长被姐妹设计破产，抢走所有后......', '76805', '4304', '<p>推荐</p><p>震撼</p>', '500', '1', '1560000000');
INSERT INTO `fission_videos` VALUES ('12', '{city}上 午 发 生 的，赶紧让身边的看一下！', 'p05117bs7fc', '95', 'https://ae01.alicdn.com/kf/HTB1mdUEbYus3KVjSZKb760qkFXaL.png', '必须谨慎，转发让身边的看一下！', '必须谨慎，转发让身边的看一下！', '93228', '3627', '<p>推荐</p><p>震撼</p>', '500', '1', '1560000000');
INSERT INTO `fission_videos` VALUES ('13', '{city}刚发生，场面好激烈！', 'y07258e2192', '580', 'https://ae01.alicdn.com/kf/HTB1YnMub3KG3KVjSZFL761MvXXaW.png', '{city}刚发生，场面好激烈！', '{city}刚发生，场面好激烈！', '14994', '3649', '<p>推荐</p><p>震撼</p>', '500', '1', '1560000000');
INSERT INTO `fission_videos` VALUES ('14', '{city}美女董事长被富二代绑进保时捷里，现场火爆...', 'h0788qugzp6', '480', 'https://ae01.alicdn.com/kf/HTB1e3Uub21H3KVjSZFB762SMXXaQ.png', '美女董事长被富二代...', '{city}美女董事长被富二代绑进保时捷里，现场火爆...', '88807', '4259', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('15', '{city}农民工讨薪被工头逼从胯下爬过，老大看不下去当场出手......', 'z07917ko6so', '400', 'https://ae01.alicdn.com/kf/HTB17V.jaQxz61VjSZFt761DSVXas.png', '{city}农民工讨薪被工头逼从胯下爬过，老大看不下去当场出手......', '必须转发让身边的看一下！阅读量：100000+', '188453', '23595', '<p>推荐</p><p>震撼</p>', '500', '1', '1560000000');
INSERT INTO `fission_videos` VALUES ('16', '{city}董事长坐破车买地被羞辱，为了兄弟...', 'h0731qfmm3f', '340', 'https://ae01.alicdn.com/kf/HTB1MVQub21H3KVjSZFH762KppXaS.png', '{city}董事长坐破车买地被羞辱，为了兄弟...', '{city}董事长坐破车买地被羞辱，为了兄弟...', '29929', '2710', '<p>推荐</p><p>震撼</p>', '500', '1', '1560000000');
INSERT INTO `fission_videos` VALUES ('17', '{city}洗车店两男子凌辱宾利女，场面劲爆！！', 'r0751hi4tck', '475', 'https://ae01.alicdn.com/kf/HTB1gz3ub.GF3KVjSZFo762mpFXaH.png', '{city}洗车店两男子凌辱宾利女，场面劲爆！！', '{city}洗车店两男子凌辱宾利女，场面劲爆！！', '17569', '3049', '<p>推荐</p><p>震撼</p>', '500', '1', '1560000000');
INSERT INTO `fission_videos` VALUES ('18', '{city}亿万集团董事长扮穷参加同学聚会，遭遇势利眼嘲讽侮辱狗眼看人低！', 's067056q3el', '450', 'https://vpic.video.qq.com/img/s067056q3el.png', '{city}亿万集团董事长扮穷参加同学聚会，遭遇势利眼嘲讽侮辱狗眼看人低！', '{city}亿万集团董事长扮穷参加同学聚会，遭遇势利眼嘲讽侮辱狗眼看人低！', '91460', '4589', '<p>推荐</p><p>震撼</p>', '500', '1', '1560000000');
INSERT INTO `fission_videos` VALUES ('19', '{city}女富豪低调参加同学聚会受尽屈辱，三分钟后全部后悔！', 'd0659an8hkr', '360', 'https://ae01.alicdn.com/kf/HTB1_mExb8WD3KVjSZKPq6yp7FXav.jpg', '{city}女富豪低调参加同学聚会受尽屈辱，三分钟后全部后悔！', '{city}女富豪低调参加同学聚会受尽屈辱，三分钟后全部后悔！', '76644', '3117', '<p>推荐</p><p>震撼</p>', '500', '1', '1560000000');
INSERT INTO `fission_videos` VALUES ('20', '{city}农民工把车刮坏，车主只要10块钱赔偿，换回的是上百万订单！', 'a0670u29qus', '95', 'https://vpic.video.qq.com/img/a0670u29qus.png', '{city}农民工把车刮坏，车主只要10块钱赔偿，换回的是上百万订单！', '{city}农民工把车刮坏，车主只要10块钱赔偿，换回的是上百万订单！', '64983', '8831', '<p>推荐</p><p>震撼</p>', '500', '1', '1560000000');
INSERT INTO `fission_videos` VALUES ('21', '{city}本地女首富追尾被官2代当街砸车场面惊呆', 'h07908y5259', '600', 'https://ae01.alicdn.com/kf/HTB1Q5Qxb7WE3KVjSZSy760ocXXaf.png', '{city}本地女首富追尾被官2代当街砸车场面惊呆', '{city}本地女首富追尾被官2代当街砸车场面惊呆', '13717', '4799', '<p>推荐</p><p>震撼</p>', '500', '1', '1560000000');
INSERT INTO `fission_videos` VALUES ('22', '{city}马总回老家谎称破产遭打脸,竟喊来营销团队砸烂全村...', 't061878rodc', '200', 'https://ae01.alicdn.com/kf/HTB10Ngxb8WD3KVjSZKPq6yp7FXat.jpg', '{city}马总回老家谎称破产遭打脸,竟喊来营销团队砸烂全村...', '{city}马总回老家谎称破产遭打脸,竟喊来营销团队砸烂全村...', '78541', '3108', '<p>推荐</p><p>震撼</p>', '500', '1', '1560000000');
INSERT INTO `fission_videos` VALUES ('23', '{city}拜把子磕头的兄弟，确因大哥穿的破而嫌弃羞辱', 't0761xgexmp', '30', 'https://ae01.alicdn.com/kf/HTB1IrMvb75E3KVjSZFC762uzXXaN.png', '{city}拜把子磕头的兄弟，确因大哥穿的破而嫌弃羞辱', '{city}拜把子磕头的兄弟，确因大哥穿的破而嫌弃羞辱', '20419', '1261', '<p>推荐</p><p>震撼</p>', '500', '1', '1560000000');
INSERT INTO `fission_videos` VALUES ('24', '宝马男开车撞人，不料遇上特种兵反被...这下人丢大了', 'j0751ru89z6', '210', 'https://ae01.alicdn.com/kf/HTB1mqIub3mH3KVjSZKz7622OXXal.png', '宝马男开车撞人，不料遇上特种兵反被...这下人丢大了', '阅读人数：100000+', '51001', '2413', '<p>推荐</p><p>震撼</p>', '500', '1', '1560000000');
INSERT INTO `fission_videos` VALUES ('25', '董事长KTV欺负农民工，结果{city}农民工给弟弟打了一个电话！', 'b0670pfpcgj', '300', 'https://vpic.video.qq.com/img/b0670pfpcgj.png', '董事长KTV欺负农民工，结果{city}农民工给弟弟打了一个电话！', '董事长KTV欺负农民工，结果{city}农民工给弟弟打了一个电话！', '73468', '4174', '<p>推荐</p><p>震撼</p>', '500', '1', '1560000000');
INSERT INTO `fission_videos` VALUES ('26', '骑自行车小伙被讹20000块，路过大哥看到后，路见不平！', 'p0836v5uqod', '235', 'https://ae01.alicdn.com/kf/HTB1q0Mxb7WE3KVjSZSy760ocXXaX.png', '骑自行车小伙被讹20000块，路过大哥看到后，路见不平！', '骑自行车小伙被讹20000块，路过大哥看到后，路见不平！', '87964', '1918', '<p>推荐</p><p>震撼</p>', '500', '1', '1560000000');
INSERT INTO `fission_videos` VALUES ('27', '{city}大哥为入赘豪门，赶走瘸子妹妹，3年后妹妹成亿万富豪回来', 'c07894uubxt', '800', 'https://vpic.video.qq.com/img/c07894uubxt.png', '{city}大哥为入赘豪门，赶走瘸子妹妹，3年后妹妹成亿万富豪回来', '{city}大哥为入赘豪门，赶走瘸子妹妹，3年后妹妹成亿万富豪回来', '13865', '1573', '<p>推荐</p><p>震撼</p>', '500', '1', '1560000000');
INSERT INTO `fission_videos` VALUES ('28', '男子炒股投资进群被骗8000万,精神崩溃当街持刀砍人...', 'l0813vafbsk', '281', 'https://ae01.alicdn.com/kf/HTB1TtUEbW1s3KVjSZFA760_ZXXap.png', '{city}男子被哥们拉进投资群，被骗8千万当街持刀连砍伤数人！', '{city}男子被骗炒股投资，倾家荡产后，精神失常当街砍人...', '90071', '3665', '<p>推荐</p><p>震撼</p>', '500', '1', '1560000000');
INSERT INTO `fission_videos` VALUES ('29', '{city}老板拿价值5000万古董报恩，半路竟被富二代撞碎，结果...', 'o0765n1jlu3', '460', 'https://vpic.video.qq.com/img/o0765n1jlu3.png', '天价古董花瓶被{city}富二代小伙撞碎,结果太惨...', '{city}小伙目中无人，打碎天价花瓶后直接傻眼...', '56155', '1350', '<p>推荐</p><p>震撼</p>', '500', '1', '1560000000');
INSERT INTO `fission_videos` VALUES ('30', '富家女忘带钱包被理发店老板唾骂,喊来打手怒砸理发店!', 'k0780p4ir12', '420', 'https://vpic.video.qq.com/img/k0780p4ir12.png', '理发店实拍视频!{city}女孩理发被迷晕拍小视频！', '{city}理发店监控拍下，女孩理发时被迷晕拍不雅视频！', '23929', '4731', '<p>推荐</p><p>震撼</p>', '500', '1', '1560000000');
INSERT INTO `fission_videos` VALUES ('31', '小情侣俩人因买不起钻戒被富豪强逼着爬行学狗叫...', 'c0798ldgq99', '339', 'https://ae01.alicdn.com/kf/HTB1MCcub.GF3KVjSZFoq6zmpFXa7.jpg', '{city}男子被女友用绳牵着爬行学狗叫！', '{city}小伙被女友用绳牵着爬行学狗叫！', '53511', '3254', '<p>推荐</p><p>震撼</p>', '500', '1', '1560000000');
INSERT INTO `fission_videos` VALUES ('32', '{city}农民工讨薪不成反遭开发商暴殴,开发商:我们无责,是他们太过分！', 't0822vjf61o', '316', 'https://ae01.alicdn.com/kf/HTB1ce7Cb8Kw3KVjSZTE763uRpXaU.png', '{city}刚刚发生一起持刀暴力伤人事件！', '{city}出大事了，就发生在你身边，都看看...', '69681', '1604', '<p>推荐</p><p>震撼</p>', '500', '1', '1560000000');
INSERT INTO `fission_videos` VALUES ('33', '{city}美女买车，遇不公平对待。销售狗眼看人低被打脸！', 'm0743nrp4ph', '269', 'https://ae01.alicdn.com/kf/HTB1KmsFbYys3KVjSZFn760FzpXaH.png', '在{city}再有钱也不要惹这种人！', '{city}真正有钱有身份的人是这样的！', '72115', '1265', '<p>推荐</p><p>震撼</p>', '500', '1', '1560000000');
INSERT INTO `fission_videos` VALUES ('34', '实拍就为一个包包一群人渣暴打美女,现场已被封锁...', 'r079915xsbf', '200', 'https://ae01.alicdn.com/kf/HTB1_K7wb81D3KVjSZFy762uFpXaX.png', '{city}一美女仅弄脏一个酷奇包包被一群男子暴打！', '{city}姑娘只因弄脏了一个酷奇包包，被一群人殴打！', '44384', '2093', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('35', '富二代看不起路边小吃摊，30秒后被打脸....叫你狗眼看人低！', 'i0773d492rf', '140', 'https://ae01.alicdn.com/kf/HTB1R4sub.GF3KVjSZFm762qPXXar.png', '{city}富二代狗眼看人低，结果被真土豪疯狂打脸！', '{city}富二代太嚣张，不知人外有人天外有天，都看看...', '102925', '2559', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('36', '一男子借高利贷无力偿还,被砸双手拖至医院被迫截肢...', 'q0798vb97bu', '143', 'https://ae01.alicdn.com/kf/HTB15RQBb8Kw3KVjSZTE763uRpXa8.png', '高利贷真的不能碰，{city}男子手掌被人用锤砸成粉粹性骨折！', '{city}男子借巨额高利贷，还不起，下场太惨了...', '37931', '4120', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('37', '暴发户酒桌上大骂一群穷B,大哥突然抡起酒瓶“爆头”', 'r0797krj6c4', '216', 'https://ae01.alicdn.com/kf/HTB1isovb8iE3KVjSZFM762QhVXaS.png', '{city}一小伙有钱了六亲不认,哥哥抡起酒瓶砸致重伤', '{city}小伙有钱就飘了，哥哥拿起酒瓶就让他脑袋开花', '68217', '4448', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('38', '男子将心爱女友转让给大哥,事后上门讨要女友转让费...', 's0819wfk347', '135', 'https://vpic.video.qq.com/img/s0819wfk347.png', '{city}一男子竟把老婆卖给了自己光混的哥哥！', '{city}一男子，禽兽不如竟把老婆送给了哥哥', '82770', '2103', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('39', '公交车上女司机遭劫匪暴打,司机猛打方向盘导致坠崖...', 'g08092ld3v2', '198', 'https://ae01.alicdn.com/kf/HTB1oHQxb8aE3KVjSZLe760sSFXai.png', '{city}公交车女司机遭劫匪暴打致坠河，车毁人亡！', '在{city}惹到公交女司机的下场，太惨了...', '55164', '2255', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('40', '壮汉单刀赴会社会大哥鸿门宴,结果被迫跪地爬行游街...', 'm0838gm5zjw', '255', 'https://ae01.alicdn.com/kf/HTB1ofMDbWSs3KVjSZPi763siVXap.png', '{city}一壮汉单刀赴会鸿门宴,被迫跪地爬行游街...', '{city}小伙单刀赴会，结果就出人意料！', '71170', '1835', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('41', '男子撞车后不报警,自导自演砸车打人跳车撞车大片...', 'c0829qqhflo', '286', 'https://ae01.alicdn.com/kf/HTB1bYgCb8Cw3KVjSZR0762cUpXa7.png', '{city}男子撞车后欲砸车报复遭百人围堵！', '{city}男子太嚣张，撞车后还想砸车，下场太惨...', '57006', '3593', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('42', '婚礼当天新娘发酒疯，竟和新郎表弟做出这事...', 'd0813naduec', '456', 'https://ae01.alicdn.com/kf/HTB1vXoBb8Cw3KVjSZFl763JkFXab.png', '{city}小伙在外打工，女友却在家勾引富二代，太现实了！', '{city}小伙在外打拼，女友却在家被他带绿帽子，太现实！', '97174', '1807', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('43', '官员去五星酒店被吃饭打脸,结果逼酒店老板自砸招牌...', 'y07079uvgr2', '825', 'https://ae01.alicdn.com/kf/HTB1Jl7vb.GF3KVjSZFv762_nXXaN.png', '看{city}酒店老板自砸招牌！', '{city}这家酒店饭菜太难吃，老板自己看不下去自砸招牌！', '80110', '1095', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('44', '霸道司机车被刮一下要20W,赔不起就磕一个头少1000...', 'a074317pqnm', '294', 'https://ae01.alicdn.com/kf/HTB1.Eotb2WG3KVjSZFg762TspXaR.png', '{city}这么霸道的司机谁见过?', '{city}最嚣张的司机被曝光，大家都看看！', '46616', '1796', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('45', '村霸围堵玉米地3毛1斤低价强收,结果亏得内裤都没了...', 'p0795wgn65j', '142', 'https://ae01.alicdn.com/kf/HTB1OJUub3KG3KVjSZFL761MvXXaE.png', '3毛钱1斤{city}村霸强收玉米,结果只能卖3分钱1斤卖哭了(视频)', '{city}村霸，强收村民玉米，结果亏得内裤都没了...', '39734', '1312', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('46', '80元衣服装进塑料袋就变成3000,大哥逼老板现场吃塑料袋...', 't0786h7nn3t', '211', 'https://ae01.alicdn.com/kf/HTB1J6Ewb8GE3KVjSZFh763kaFXaN.png', '震惊！{city}火车站附近黑店一个塑料袋要3000元！', '{city}火车站附近被曝光出的黑店，大家都看看，小心警惕！', '49465', '1086', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('47', '公交女司机撞上限高架被削顶,乘客拍下全程高清视频...', 'x0829m2cfhj', '363', 'https://ae01.alicdn.com/kf/HTB1vEstb3KG3KVjSZFL761MvXXaF.png', '{city}公交女司机遭乘客当众羞辱后，开车冲撞人群，致重大事故！', '刚刚{city}发生的，太恐怖了，都看看吧！', '50316', '1647', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('48', '暴发户回乡给兄弟送奔驰,兄弟竟说我家狗都不坐这车...', 'p07828b6e73', '465', 'https://ae01.alicdn.com/kf/HTB1fHEDbWSs3KVjSZPi763siVXaY.png', '都说开豪车了不起,{city}开宾利的车主真的要哭了！', '在{city}有地位的人不是开豪车住别墅而是....', '97549', '4905', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('49', '听说男友破产女生立马翻脸,居然现场堕胎跪求分手...', 'k0807r15q6h', '245', 'https://ae01.alicdn.com/kf/HTB18ZkAb8Gw3KVjSZFw762Q2FXaC.png', '{city}17岁女生听说男友破产,去医院堕胎3次都失败了', '{city}拜金女孩，得知男友家破产，立马撇清关系，气愤！', '42390', '4308', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('50', '实拍渣男骂农村人引民愤,惊动当地黑社会吓得裤子尿湿了...', 'c0797zhcsp5', '140', 'https://ae01.alicdn.com/kf/HTB11Bstb3mH3KVjSZKz7622OXXaJ.png', '奔驰男到{city}女友家做客,狂言农村人也算人?引发群殴！', '{city}一土豪，看不起农村人，引发群殴，太惨了！', '85911', '2480', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('51', '老总扮穷测试人心，结果被亲朋好友当狗一样的欺辱...', 'm072429qooz', '448', 'https://ae01.alicdn.com/kf/HTB1hYEub25G3KVjSZPx762I3XXaZ.png', '{city}农村惊现一百辆超跑，场面太震撼！', '{city}老板回老家，声势浩大，太震撼！', '60760', '1130', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('52', '小伙聚会遭攀比喝一杯酒给五百,土豪都被喝哭...', 'q0660kwfjax', '451', 'https://ae01.alicdn.com/kf/HTB1zJ7ub.WF3KVjSZPh760clXXah.png', '{city}同学聚会这些人千万不能得罪！', '{city}刚发生的事，多年的老同学，竟做出这样的事情！', '67450', '3311', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('53', '老公重病老婆竟说:不治死了算了,钱留给我再找一个...', 'j0800bz4s4n', '312', 'https://ae01.alicdn.com/kf/HTB1NjADbWWs3KVjSZFx761WUXXab.png', '{city}最恶毒的人被曝光【别浪费钱治了,死了算了吧】', '{city}女子被曝光，抛夫弃子，太恶毒了...', '71425', '1681', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('54', '军区司令遭城管疯狂暴打,出动整个警卫连竟都拦不住...', 'a0726dsdc29', '237', 'https://ae01.alicdn.com/kf/HTB1V3ADbYus3KVjSZKb760qkFXaH.png', '{city}城管暴力执法被千人围殴，全国曝光！', '{city}城管太丢人了，做这种事，被全国曝光！', '20176', '1808', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('55', '{city}男子为了升职， 竟把自己女友灌醉送给上司。', 'q0838j6krwo', '287', 'https://ae01.alicdn.com/kf/HTB1AYwub2WG3KVjSZFP760aiXXaT.png', '{city}男子蒙面持刀劫狱救人，结果惨目忍睹...', '{city}一小伙自不量力，持刀劫狱，下场太惨！', '54674', '1450', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('56', '{city}男老板强奸下属老婆，还威胁下属不准报警，不是人！', 'e0839f61ia7', '311', 'https://ae01.alicdn.com/kf/HTB1U63tb4iH3KVjSZPf760BiVXaR.png', '{city}男子收200万分手费嫌少了居然再绑架女友！', '{city}小伙分手，女友给200万分手费竟还嫌少，太过分！', '28680', '2343', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('57', '女孩在夜店遭多名男子灌醉，带进包间...禽兽！', 'y07258e2192', '333', 'https://ae01.alicdn.com/kf/HTB1FAZvb8OD3KVjSZFF763n9pXa0.png', '发生冲突开挖机群殴,{city}惊现变形金刚大战挖掘机！', '{city}刚发生的事情，挖掘机群殴，场面太震撼了！', '36014', '1551', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('58', '{city}女老板喝醉酒，竟把几名男下属带回家..场面太不雅！', 'z07604m1598', '250', 'https://ae01.alicdn.com/kf/HTB1Z8oBb8Cw3KVjSZR0762cUpXaI.png', '{city}酒店一个杯子引发群殴还被迫吃玻璃渣', '{city}一酒店，因顾客摔坏一个杯子竟引发了群殴，现场一片混乱！', '63301', '4546', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('59', '{city}这个老男人，不知羞耻，偷情偷到了朋友的闺女。', 'k0735iofe4a', '544', 'https://ae01.alicdn.com/kf/HTB1O4gvb75E3KVjSZFC762uzXXab.png', '{city}这个保镖够厉害居然空手脱了大小姐的内裤！', '{city}男子练就了好功夫，空手脱别人内裤，奇人...', '33417', '4057', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('60', '为了能顺利毕业， {city}女大学生忍着被辅导员睡了多次。', 't0723n2gw94', '204', 'https://ae01.alicdn.com/kf/HTB1sl7CbYus3KVjSZKb760qkFXax.png', '一场{city}女子炫富引发的血案!', '{city}一女子嚣张炫富，遭打脸，后果很惨！', '22979', '2162', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('61', '男子在宾馆直接抓住老婆出轨，持刀欲杀掉对方。', 'q07177b6fsb', '860', 'https://ae01.alicdn.com/kf/HTB1uV7ub.KF3KVjSZFE760ExFXa6.png', '黑社会在{city}街头大庭广众劫车案！', '{city}惊现黑社会团伙，光天化日下街头劫车...', '45312', '4347', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('62', '男子赌博欠下60万高利贷,竟让老婆用身体还债...', 'o0745wfnrtj', '285', 'https://vpic.video.qq.com/img/o0745wfnrtj.png', '{city}男子钱高利贷居然把老婆拿去抵债！', '{city}一无耻男子，借高利贷还不上，竟要求妻子做这种事情...', '79403', '4279', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('63', '女大学生遭男友玩腻，竟迷晕送给兄弟“玩”', 'l0838wzsejw', '372', 'https://ae01.alicdn.com/kf/HTB1oVMwb8GE3KVjSZFh763kaFXa3.png', '{city}女学生酒吧被灌醉怀孕产子,男子狂言:老子给了钱..', '{city}女大学生被骗到酒吧遭人灌醉后，被一群禽兽...', '39727', '4735', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('64', '美女学游泳竟被男私教多次迷晕，强奸，还毫不知情！', 'f0820ifsxhv', '221', 'https://ae01.alicdn.com/kf/HTB1L5ovb81D3KVjSZFy762uFpXaL.png', '{city}小伙酒后非礼小姑娘，惹众怒遭多人围殴，太惨了！', '{city}男子光天化日调戏小姑娘，惨被暴打，快看看！', '43426', '3839', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('65', '办公室，老板让秘书把内衣扯下...辣眼睛。', 'k0802ue99z4', '117', 'https://ae01.alicdn.com/kf/HTB1NkZtb.KF3KVjSZFE760ExFXa5.png', '刚刚{city}公交车出事了！【附视频】', '刚刚发生的事情{city}公交车上，竟发生这种事情！', '78426', '4391', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('66', '{city}女子住酒店，遭陌生人闯入强暴...太骇人！', 'o0775yr2qjx', '230', 'https://ae01.alicdn.com/kf/HTB1kVMvb9SD3KVjSZFK76210VXah.png', '{city}宾利男持刀砍人反被杀”案真实身份遭曝光！', '{city}一开豪车的男子太嚣张，当街砍人，不料竟是这种下场...', '29434', '4468', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('67', '大学女生被强，事后遭到威胁{city}***', 'p0707cdw13n', '231', 'https://ae01.alicdn.com/kf/HTB15kAtb2WG3KVjSZPc762kbXXaL.png', '{city}美女参加同学聚会遭调戏，叫人怒砸酒店，全被抓走！', '{city}女子参加同学聚会，不料发生意外状况，现场直接失控...', '101486', '1439', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('68', '男子惯用迷药诱奸少女竟有400多个,最后丧命于出租屋!', 'x0812js45hz', '170', 'https://ae01.alicdn.com/kf/HTB1g7czb8Gw3KVjSZFw762Q2FXaB.png', '刚刚发生的大事件:男子诱.奸{city}师范女生视频流..出！', '男子用迷.药诱.奸{city}师范女学生视.频.流.出...', '71059', '2991', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('69', '女子喝醉躺在大马路上， 遭三名男子轮流猥亵...过程相当激烈。', 'j08399c0zbz', '271', 'https://ae01.alicdn.com/kf/HTB1rJFHXvxj_uVjSZFq761boFXa7.png', '{city}同学聚会因买单引发群殴,50名刑警都压制不住', '刚刚在{city}，因同学聚会买单引发的群殴事件，都看看吧！', '79657', '3853', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('70', '地下车库，男子把女子拖在墙角强暴，被摄像头拍下！', 'o071233lxpg', '324', 'https://ae01.alicdn.com/kf/HTB1K4wtb.GF3KVjSZFm762qPXXan.png', '{city}刚刚发生的大事件:美女清洁工被高管非礼', '{city}一公司，竟有高管潜规则美女清洁工，人渣...', '28354', '1041', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('71', '{city}中医院住院部女护士，竟给男病人提供色情服务，都看看吧！', 'e0808l5zete', '480', 'https://ae01.alicdn.com/kf/HTB1nrIxb9WD3KVjSZSg763CxVXaZ.png', '{city}男子摔断翡翠竟要1500W,找人来砸店结果横着被抬出来...', '{city}一土豪，在店里砸坏翡翠竟要赔1500W，结果一个电话叫来上百人砸店！', '47655', '3882', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('72', '为谈成项目，{city}女销售主动约客户开房，可结果...', 'd0765mwcmor', '620', 'https://ae01.alicdn.com/kf/HTB1RWctb2WG3KVjSZFg762TspXas.png', '{city}一孕妇被撞腹中胎儿被撞出存活（视频）', '{city}一孕妇遇车祸，胎儿被撞出后竟存活下来了，奇迹！', '80022', '3426', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('73', '刚毕业女大学生，上班第一天就被老总潜规则，禽兽！', 'y0659jvqxiz', '250', 'https://ae01.alicdn.com/kf/HTB1JVwvb.GF3KVjSZFv762_nXXax.png', '{city}宝马司机撞退伍首长还打他，首长一怒调来100辆宝马...', '{city}一宝马司机太嚣张，撞人后还要打人，不料碰上硬茬，下场太惨...', '61252', '1918', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('74', '同学聚会，对当年的女神下药，迷晕后带进酒店...禽兽不如！', 'e07978ejxll', '246', 'https://ae01.alicdn.com/kf/HTB1LyQtb.GF3KVjSZFm762qPXXaD.png', '{city}刚刚发生的大事件，女兵遭开水泼脸凌辱...', '刚刚{city}发生的一起恶性事件，大家都看看吧！', '86921', '3602', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('75', '苹果手机又出爆炸新闻:为iPhoneX美女非要上床陪睡...', 'y0811gdmv5e', '235', 'https://ae01.alicdn.com/kf/HTB1TlQtb.GF3KVjSZFo762mpFXah.png', '{city}一妙龄女子为买iPhoneX陪睡陌生男竟达上百次！', '{city}一女子为了一部手机，竟陪睡男子上百次，辣眼睛！', '28722', '4544', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('76', '村长利用权力带女子到KTV偷情，不堪入目。', 'g08253bocmx', '635', 'https://ae01.alicdn.com/kf/HTB1cqZxb9WD3KVjSZSg763CxVXaP.png', '{city}发生恶性虐母事件:恶儿媳逼婆婆跟狗抢骨头吃！', '刚刚{city}发生的事情，一个人渣虐待自己的老母亲，禽兽不如！', '42957', '3793', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('77', '穷小子扛着班花遭全班同学围殴,没想到最后调来飞机...', 'v0743vt2bf9', '536', 'https://ae01.alicdn.com/kf/HTB1ec.wb8WD3KVjSZKP761p7FXa1.png', '刚刚发生的大事件:{city}小伙扛着少女满街跑...', '{city}街头发生的事，一小伙扛着少女满大街乱跑...', '88154', '4493', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('78', '男子刚出差，家里的妻子就在家偷情，都看看吧！', 'i0806jk1dcj', '675', 'https://ae01.alicdn.com/kf/HTB1O9svb8GE3KVjSZFh763kaFXas.png', '{city}上市集团董事长扮穷回乡看望未婚妻，被嘲讽还被讹50万', '{city}老总回老家看望未婚妻，不料被其羞辱还被讹了50万！', '23807', '1916', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('79', '{city}富婆戏虐男公关视频曝光,太辣眼不忍直视...', 'y0846ony2xa', '470', 'https://ae01.alicdn.com/kf/HTB1EmgCbYus3KVjSZKb760qkFXaA.png', '{city}男子遭三名美女强拉进厕所非礼！', '{city}小伙竟被一群美女强行拉到厕所做这事，辣眼睛！', '87118', '4427', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('80', '{city}美女KTV应聘前台却被逼做小姐，给客人提供色情服务！', 'l0847z76g70', '308', 'https://ae01.alicdn.com/kf/HTB1Xx.tb.KF3KVjSZFE760ExFXat.png', '{city}美女持枪走火导致重伤！', '刚刚{city}KTV发生的事情，女子持枪走火，射伤多人...', '100313', '2204', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('81', '{city}大爷光天化日跟巨乳女子在公园内激情啪啪啪....', 't08464jpxyp', '220', 'https://ae01.alicdn.com/kf/HTB1X2stb3KG3KVjSZFL761MvXXac.png', '{city}一老板被围殴,场面堪比“古惑仔', '{city}一男子打坏一瓶酒被讹钱，不服气，叫来上百人砸店！', '72565', '4963', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('82', '{city}小伙猥亵KTV花魁,保安受不了，直接让其脑袋开花！', 'w0840s6de3d', '190', 'https://ae01.alicdn.com/kf/HTB1gzUCbW1s3KVjSZFA760_ZXXaR.png', '{city}黑社會大哥在KTV耍帅遭保安暴打！', '{city}一小伙自称社会人，在KTV耍帅，遭一群保安暴打！', '39263', '2957', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('83', '女实习生加夜班，遭男老板逼迫满足自己的兽欲...', 'w0798n5qis9', '372', 'https://ae01.alicdn.com/kf/HTB1UjwCbW5s3KVjSZFN763D3FXaP.png', '{city}碰瓷新套路,5岁小孩都在学！', '刚刚{city}发生的事，警惕碰瓷新套路，孩子都在学！', '27723', '1494', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('84', '××宾馆暗藏摄像头，小情侣激情场面被拍下，疯传网络！', 'p08400uve85', '244', 'https://ae01.alicdn.com/kf/HTB1odosb3aH3KVjSZFj763FWpXaD.png', '实拍{city}父女两人打架旁观者还叫好！', '{city}父女俩大家，围观群众竟都在拍手叫好，竟是因为这样！', '31905', '2486', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('85', '公交车上变态男强行猥亵美女全过程，令人发指！', 'h0839go16ao', '284', 'https://ae01.alicdn.com/kf/HTB1b8Isb.KF3KVjSZFE760ExFXaI.png', '{city}小伙公交车上智擒人贩子,没想见义勇为反被拘...', '{city}小伙见义勇为，不料最后经被拘，只因...', '52865', '3495', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('86', '女孩被醉汉扒光衣服拽进酒店，监控画面令人毛骨茸然！', 'c08408c753z', '138', 'https://ae01.alicdn.com/kf/HTB1_rZub8WD3KVjSZFs763qkpXaL.png', '昨晚{city}发生黑社會火拼,小混混互砍血肉横飞！', '昨晚{city}发生的事，黑社会火拼，场面太震撼！', '98584', '3013', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('87', '{city}留守妇女，跟小叔子偷情被抓现场...', 'j0673xjn0qp', '107', 'https://ae01.alicdn.com/kf/HTB1jMoub8OD3KVjSZFF763n9pXaR.png', '{city}农村少妇，光天化日下跟小叔子发生...', '{city}农村发生的事情，女子竟跟小叔子光天化日下做这事！', '88982', '4939', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('88', '{city}23岁女子在家裸睡被强奸，独自在家一定要反锁房门！', 'e08506jt1yn', '222', 'https://ae01.alicdn.com/kf/HTB1X9Iub.uF3KVjSZK9762VtXXaH.png', '{city}黑社会强拆遇到硬茬，多人受伤，下场太惨了...', '{city}刚发生的事，黑社会强拆遇硬茬，双发火拼，场面震撼！', '43985', '2485', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('89', '{city}男子在家误吃伟哥，竟强奸了自己的姐姐，禽兽不如！', 'i084983651t', '432', 'https://ae01.alicdn.com/kf/HTB1LGMub9SD3KVjSZFK76210VXav.png', '{city}一女子虐待老母亲不给吃住，撵其滚蛋，禽兽不如！', '{city}一不孝子女，竟对自己的老母亲做这样的事情，天理不容！', '103071', '2277', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('90', '街头女子精神失常，满街裸奔，路人围观拍照！', 'q085002debz', '239', 'https://ae01.alicdn.com/kf/HTB1mTotb8WD3KVjSZFs763qkpXa7.png', '{city}一小伙吃饭被“爆头”，4次寻仇竟砍错人！', '{city}一男子报复寻仇，连砍多人，最后发现竟砍错了...', '61532', '4647', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('91', '男子在KTV猥亵强奸女服务员，老板一怒之下...', 'y0848sju75g', '206', 'https://ae01.alicdn.com/kf/HTB1q2Etb21G3KVjSZFk761K4XXaQ.png', '{city}小伙当面调戏别人女朋友，被揍得全身骨折！', '{city}一男子当面调戏别人女友，结果被人揍得面目全非，全身骨折！', '37287', '3416', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('92', '女子全裸阳台晒日光浴，不料被对面楼小伙全程摄像！', 'x08486o60dc', '149', 'https://ae01.alicdn.com/kf/HTB1BIwsb2WG3KVjSZFgq6zTspXan.jpg', '小女孩在{city}街头划坏豪车,遭众人殴打,父亲一怒之下叫来百人...', '{city}小女孩在路边划坏一豪车，被车主殴打，父亲一怒之下叫来百人...', '31514', '2332', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('93', '{city}女服务员遭社会青年胁迫卖淫，不听话就挨打，太惨了！', 's0835elxz1r', '234', 'https://ae01.alicdn.com/kf/HTB1rzgtb8WD3KVjSZFs763qkpXa9.png', '女服务员被顾客欺负，{city}老板为其出头，结局太意外！', '昨晚{city}酒店发生的事，老板怒打一群地痞流氓，多人受伤，场面太残忍！', '64796', '4192', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('94', '婚礼前晚，新娘跟前男友约炮被抓，下场太惨了！', 'l0673o4ah0b', '216', 'https://ae01.alicdn.com/kf/HTB1WPAub8WD3KVjSZFs763qkpXaC.png', '{city}小伙上门提亲，遭丈母娘要天价彩礼，给父亲一个电话带来了200W！', '100000+{city}人都在看', '42052', '1156', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('95', '商场试衣间有隐藏摄像头，女孩换衣服过程全被拍下！', 'p0850uzmbys', '402', 'https://ae01.alicdn.com/kf/HTB1rr7CbWSs3KVjSZPi763siVXax.png', '{city}小伙开面包车去相亲,拜金女狗眼看人低,结局太惨！', '100000+{city}人都在看', '66672', '2938', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('96', '女子下夜班，回家途中遭遇醉酒男，在路边被强奸！', 'y0529i48ng7', '311', 'https://ae01.alicdn.com/kf/HTB1pt3Bb8Kw3KVjSZTEq6AuRpXam.jpg', '莫欺少年穷，三十年河东三十年河西，【{city}】小伙十年行动打脸前女友！', '100000+{city}都在看...', '45503', '4259', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('97', '{city}小公园里，男女偷情被人现场直播，太刺激了！', 'f08528v2rhk', '242', 'https://ae01.alicdn.com/kf/HTB1QnZBbW5s3KVjSZFN763D3FXaw.png', '{city}女子惨遭家暴，满身都是伤，都看看！', '{city}女子天天遭丈夫虐待..太惨了...', '97731', '4620', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('98', '{city}KTV发生的事{emoji}，{city}女孩被人灌醉后，{emoji}遭多人轮奸...', 'p0707vr2jhu', '593', 'https://ae01.alicdn.com/kf/HTB1sqUsb3KG3KVjSZFL761MvXXaI.png', '女警官在{city}酒店吃饭被讹50万,一怒调来整个部队！', '场面太震撼，都看看吧！', '44715', '4626', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('99', '女子去男邻居家串门遭囚禁3个月，沦为性奴，太变态了！', 'n0664sj89od', '211', 'https://ae01.alicdn.com/kf/HTB1Qccsb.GF3KVjSZFm762qPXXaD.png', '实拍老董查{city}分公司,扮保安被打跪地磕头！', '董事长低调视察{city}分公司情况，却被打的头破血流！', '103069', '3591', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('100', '女孩烂醉认错男友被强奸视频被流出！', 'c073916fxym', '480', 'https://ae01.alicdn.com/kf/HTB1pt3Bb8Kw3KVjSZTEq6AuRpXam.jpg', '{city}女孩烂醉认错男友被强奸视频被流出！', '时间:36分17秒....', '78239', '2798', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('101', '{city}女孩酒吧上班被流氓拖进厕所强奸，男友竟在一旁观看', 'f0844ina1je', '162', 'https://ae01.alicdn.com/kf/HTB1C2gBbW5s3KVjSZFN763D3FXax.png', '{city}女孩酒吧上班被流氓强行欺负，男友一怒之下叫来上百人!', '{city}黑社会火拼，场面太震撼！', '84736', '3384', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('102', '{city}小三找人轮奸原配，丈夫知道后一怒之下叫来上百人...', 'u0779oikjsm', '309', 'https://ae01.alicdn.com/kf/HTB18lZtb3KG3KVjSZFL761MvXXad.png', '{city}小三绑架原配逼他离婚，被小弟轮，大哥一怒之...！', '{city}这个女孩当小三，还能干出这种事...', '42968', '1811', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');
INSERT INTO `fission_videos` VALUES ('103', '女孩喝醉遭多人性侵，还被拍成视频传在网上！！', 'v0799hs1onx', '555', 'https://ae01.alicdn.com/kf/HTB1IrMvb75E3KVjSZFC762uzXXaN.png', '【劲爆】{city}女大学生KTV喝醉进错包间，竟被...', '女大学生KTV喝醉进错包间，结果被...', '85206', '1037', '<p>推荐</p><p>震撼</p>', '500', '2', '1560000000');

-- ----------------------------
-- Table structure for fission_wechat_accounts
-- ----------------------------
DROP TABLE IF EXISTS `fission_wechat_accounts`;
CREATE TABLE `fission_wechat_accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_name` varchar(255) NOT NULL COMMENT '公众号名称',
  `domain1` varchar(255) NOT NULL COMMENT '域名1',
  `domain2` varchar(255) DEFAULT NULL COMMENT '域名2',
  `domain3` varchar(255) DEFAULT NULL COMMENT '域名3',
  `app_id` varchar(255) NOT NULL COMMENT 'AppID',
  `app_secret` varchar(255) NOT NULL COMMENT 'AppSecret',
  `access_token` varchar(255) NOT NULL COMMENT 'access_token',
  `ticket` varchar(255) NOT NULL COMMENT 'ticket',
  `sort` int(5) unsigned NOT NULL DEFAULT '500' COMMENT '排序,数字越大越靠前',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '状态1为启用,2为禁用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT 'token更新时间',
  `expire_time` datetime NOT NULL COMMENT 'token过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


