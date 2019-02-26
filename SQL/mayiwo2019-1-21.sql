/*
Navicat MySQL Data Transfer

Source Server         : myconnection
Source Server Version : 50539
Source Host           : localhost:3306
Source Database       : mayiwo

Target Server Type    : MYSQL
Target Server Version : 50539
File Encoding         : 65001

Date: 2019-01-21 23:52:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admins`
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `account` varchar(64) NOT NULL COMMENT '账号',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `temporarycode` varchar(64) DEFAULT NULL COMMENT '临时码',
  `authority` int(64) NOT NULL DEFAULT '0' COMMENT '权限 二进制',
  PRIMARY KEY (`account`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('caiweishuai', 'SFlUTHAxWDk=YWQ0OTE5ZjlkNjk2ZWY4M2M1OGQ4MzQxOWFjMGRhZTE=', 'Hr4tL1cicTSAeJcq', '255');
INSERT INTO `admins` VALUES ('chenjinlong', 'a3BqRGNKMzI=YzBmNThjNjAwOTQ2NDBiN2Y2YzE5ZTNiYmNhYzM5YmY=', '9KMKDkxn4DpfPpdZ', '255');
INSERT INTO `admins` VALUES ('fuxue', 'cUM1dGZUbE0=OTNhZWNmZGFiYWRkYTgzODdlM2NlOWIwNDMyZjQyYjc=', null, '255');
INSERT INTO `admins` VALUES ('jinying', 'YWpFT2x4WVc=ZDg4NzI2MDMyY2Q4NzlkNzdjMTZkNWQzOWJkYmU0M2Q=', null, '255');
INSERT INTO `admins` VALUES ('mayiwoxxy', 'VW1SU0hXUk4=ODc4MTg4YmRjOThhYTkyOGRmN2RhNGQ4YjgyMjdjYTY=', null, '255');
INSERT INTO `admins` VALUES ('sst', 'RUJYbUloekU=M2NmZjRjNWVjMjAzNWM1ZWE0YWFiMmNmMjc1MWJhMmM=', '30wLSMI7Tbjr8Pkf', '255');

-- ----------------------------
-- Table structure for `admin_options`
-- ----------------------------
DROP TABLE IF EXISTS `admin_options`;
CREATE TABLE `admin_options` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(32) NOT NULL,
  `url` varchar(255) NOT NULL,
  `icon` varchar(32) NOT NULL,
  `color` varchar(32) NOT NULL,
  `limit` int(32) NOT NULL,
  `show_status` int(32) NOT NULL DEFAULT '0',
  `show_top` int(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`option_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of admin_options
-- ----------------------------
INSERT INTO `admin_options` VALUES ('1', 'swiper设置', '/pages/admin/swiper/swiper', 'icon-kanguos', '#E88024', '1', '0', '0');
INSERT INTO `admin_options` VALUES ('2', '失物招领模块', '/pages/admin/lost/lost', 'icon-zidingyi', '#30C934', '2', '0', '0');
INSERT INTO `admin_options` VALUES ('3', '学习资料模块', '/pages/admin/addmaterial/addmaterial', 'icon-xuexiziliao', '#53A3E9', '3', '0', '0');
INSERT INTO `admin_options` VALUES ('4', '品牌商家模块', '/pages/admin/shops/shops', 'icon-pinpaishangjia', '#FE927D', '4', '0', '0');
INSERT INTO `admin_options` VALUES ('5', '兼职家教模块', '/pages/admin/job/job', 'icon-shangmenjiajiao', '#D4ABE0', '5', '0', '0');
INSERT INTO `admin_options` VALUES ('6', '首页文章模块', '/pages/admin/passage/passage', 'icon-icon_wangye', '#2EC0EB', '6', '0', '0');

-- ----------------------------
-- Table structure for `comment_like`
-- ----------------------------
DROP TABLE IF EXISTS `comment_like`;
CREATE TABLE `comment_like` (
  `comment_id` int(32) NOT NULL,
  `like_user` varchar(64) CHARACTER SET utf8 NOT NULL,
  `like_time` datetime NOT NULL,
  `like_status` int(16) NOT NULL DEFAULT '0' COMMENT '0 为正常赞 1 为取消赞',
  PRIMARY KEY (`comment_id`,`like_user`) USING BTREE,
  KEY `user` (`like_user`) USING BTREE,
  CONSTRAINT `comment_id` FOREIGN KEY (`comment_id`) REFERENCES `user_comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user` FOREIGN KEY (`like_user`) REFERENCES `user` (`openid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of comment_like
-- ----------------------------
INSERT INTO `comment_like` VALUES ('1', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-29 20:57:49', '0');
INSERT INTO `comment_like` VALUES ('1', 'sst', '2018-10-17 20:10:02', '0');
INSERT INTO `comment_like` VALUES ('2', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-29 20:54:58', '0');
INSERT INTO `comment_like` VALUES ('3', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-26 19:34:40', '0');
INSERT INTO `comment_like` VALUES ('3', 'sst', '2018-10-29 20:48:54', '0');
INSERT INTO `comment_like` VALUES ('4', 'sst', '2018-10-29 20:46:48', '0');
INSERT INTO `comment_like` VALUES ('5', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-29 23:51:22', '0');
INSERT INTO `comment_like` VALUES ('6', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-29 23:53:59', '1');
INSERT INTO `comment_like` VALUES ('7', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-29 23:53:58', '0');
INSERT INTO `comment_like` VALUES ('9', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-29 23:53:57', '0');
INSERT INTO `comment_like` VALUES ('10', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-29 23:59:54', '0');
INSERT INTO `comment_like` VALUES ('11', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-30 00:00:11', '0');
INSERT INTO `comment_like` VALUES ('13', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-11-17 17:41:22', '0');
INSERT INTO `comment_like` VALUES ('13', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-30 17:24:59', '0');
INSERT INTO `comment_like` VALUES ('14', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-11-05 23:08:48', '0');
INSERT INTO `comment_like` VALUES ('15', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-30 23:41:31', '1');
INSERT INTO `comment_like` VALUES ('16', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-31 10:13:07', '0');
INSERT INTO `comment_like` VALUES ('17', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-11-20 00:39:35', '0');
INSERT INTO `comment_like` VALUES ('17', 'oj74Q5StOSo57H_ySEcCSbShZME0', '2018-11-20 00:51:07', '0');
INSERT INTO `comment_like` VALUES ('17', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-11-13 18:09:12', '0');
INSERT INTO `comment_like` VALUES ('19', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-11-05 22:57:12', '0');
INSERT INTO `comment_like` VALUES ('22', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-11-17 18:23:26', '1');
INSERT INTO `comment_like` VALUES ('24', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-11-17 18:23:36', '1');
INSERT INTO `comment_like` VALUES ('24', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-11-13 23:34:03', '0');
INSERT INTO `comment_like` VALUES ('26', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-11-05 23:01:35', '0');
INSERT INTO `comment_like` VALUES ('28', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-11-13 18:09:22', '0');
INSERT INTO `comment_like` VALUES ('31', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-11-17 00:10:37', '0');
INSERT INTO `comment_like` VALUES ('33', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-11-17 17:31:19', '0');
INSERT INTO `comment_like` VALUES ('34', 'oj74Q5dGUz5cXwDG9MKEosZnMKuo', '2018-11-21 13:21:21', '0');
INSERT INTO `comment_like` VALUES ('34', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-11-20 00:14:02', '0');
INSERT INTO `comment_like` VALUES ('34', 'oj74Q5Z_mbXJLtei2mhCkz_EXBKU', '2018-11-17 18:27:33', '0');
INSERT INTO `comment_like` VALUES ('35', 'oj74Q5Z_mbXJLtei2mhCkz_EXBKU', '2018-11-17 18:29:52', '0');
INSERT INTO `comment_like` VALUES ('37', 'oj74Q5dGUz5cXwDG9MKEosZnMKuo', '2018-11-21 13:21:20', '0');
INSERT INTO `comment_like` VALUES ('37', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-11-20 00:50:01', '0');
INSERT INTO `comment_like` VALUES ('39', 'oj74Q5cx0nIWH6YK-O3g29hetZ6E', '2018-11-26 00:32:29', '0');
INSERT INTO `comment_like` VALUES ('39', 'oj74Q5dGUz5cXwDG9MKEosZnMKuo', '2018-11-21 12:54:49', '0');
INSERT INTO `comment_like` VALUES ('39', 'oj74Q5eG3bOWHwalqHRpLkMnvpSY', '2018-11-21 13:05:50', '0');
INSERT INTO `comment_like` VALUES ('39', 'oj74Q5Q5DVMyt4QQNwqN8YqaKVLk', '2018-11-24 23:27:10', '0');
INSERT INTO `comment_like` VALUES ('39', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-11-20 00:56:48', '0');
INSERT INTO `comment_like` VALUES ('39', 'oj74Q5U5Fa0XZXSd9wdFFYqR4MS4', '2018-11-21 12:43:00', '0');
INSERT INTO `comment_like` VALUES ('40', 'oj74Q5dGUz5cXwDG9MKEosZnMKuo', '2018-11-21 12:54:48', '0');
INSERT INTO `comment_like` VALUES ('40', 'oj74Q5Q5DVMyt4QQNwqN8YqaKVLk', '2018-11-24 23:27:11', '0');
INSERT INTO `comment_like` VALUES ('40', 'oj74Q5U5Fa0XZXSd9wdFFYqR4MS4', '2018-11-21 12:42:59', '0');
INSERT INTO `comment_like` VALUES ('41', 'oj74Q5dGUz5cXwDG9MKEosZnMKuo', '2018-11-21 13:21:16', '0');
INSERT INTO `comment_like` VALUES ('42', 'oj74Q5dGUz5cXwDG9MKEosZnMKuo', '2018-11-21 13:21:18', '0');
INSERT INTO `comment_like` VALUES ('43', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-11-21 13:31:15', '0');
INSERT INTO `comment_like` VALUES ('44', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-11-28 11:11:08', '0');
INSERT INTO `comment_like` VALUES ('45', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-11-23 10:59:50', '0');
INSERT INTO `comment_like` VALUES ('53', 'oj74Q5eh_vTe_4q2VuHv8csNEdGE', '2018-11-26 21:41:16', '0');
INSERT INTO `comment_like` VALUES ('53', 'oj74Q5Q5DVMyt4QQNwqN8YqaKVLk', '2018-11-24 23:26:42', '0');
INSERT INTO `comment_like` VALUES ('53', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-11-24 23:36:37', '0');
INSERT INTO `comment_like` VALUES ('53', 'oj74Q5YyrubLoZWLtswcdG-5pnjI', '2018-11-28 18:01:42', '0');
INSERT INTO `comment_like` VALUES ('55', 'oj74Q5eh_vTe_4q2VuHv8csNEdGE', '2018-11-26 21:41:15', '0');
INSERT INTO `comment_like` VALUES ('57', 'oj74Q5eh_vTe_4q2VuHv8csNEdGE', '2018-11-26 21:41:14', '0');
INSERT INTO `comment_like` VALUES ('57', 'oj74Q5YyrubLoZWLtswcdG-5pnjI', '2018-11-28 18:01:38', '0');
INSERT INTO `comment_like` VALUES ('61', 'oj74Q5eh_vTe_4q2VuHv8csNEdGE', '2018-11-26 21:41:11', '0');
INSERT INTO `comment_like` VALUES ('62', 'oj74Q5eh_vTe_4q2VuHv8csNEdGE', '2018-11-26 21:41:08', '0');
INSERT INTO `comment_like` VALUES ('64', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-12-13 17:53:09', '0');
INSERT INTO `comment_like` VALUES ('65', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-12-13 17:53:10', '0');
INSERT INTO `comment_like` VALUES ('66', 'oj74Q5eh_vTe_4q2VuHv8csNEdGE', '2018-12-05 19:59:50', '0');
INSERT INTO `comment_like` VALUES ('66', 'oj74Q5Q5DVMyt4QQNwqN8YqaKVLk', '2018-12-07 12:56:24', '0');
INSERT INTO `comment_like` VALUES ('66', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-12-05 16:21:18', '0');
INSERT INTO `comment_like` VALUES ('67', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-12-05 21:46:16', '0');
INSERT INTO `comment_like` VALUES ('68', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-12-05 21:46:15', '0');
INSERT INTO `comment_like` VALUES ('73', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-12-13 17:45:01', '0');

-- ----------------------------
-- Table structure for `feedback`
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `openid` varchar(64) DEFAULT '' COMMENT '提交人id',
  `text` varchar(1024) DEFAULT NULL COMMENT '这才是重点',
  `subtime` datetime DEFAULT NULL COMMENT '提交时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES ('oj74Q5QxZpH8TzLIemQTZwokJ3uc', '不行', '2018-11-20 00:06:48');
INSERT INTO `feedback` VALUES ('oj74Q5QxZpH8TzLIemQTZwokJ3uc', '上线测试', '2018-11-20 00:51:27');
INSERT INTO `feedback` VALUES ('oj74Q5StOSo57H_ySEcCSbShZME0', '', '2018-11-20 00:51:34');
INSERT INTO `feedback` VALUES ('oj74Q5cx0nIWH6YK-O3g29hetZ6E', '', '2018-11-26 00:32:50');
INSERT INTO `feedback` VALUES ('oj74Q5eh_vTe_4q2VuHv8csNEdGE', '用户体验海星', '2018-12-05 20:01:39');
INSERT INTO `feedback` VALUES ('oj74Q5Z_mbXJLtei2mhCkz_EXBKU', '贼丑', '2018-12-13 17:44:45');

-- ----------------------------
-- Table structure for `home_modules`
-- ----------------------------
DROP TABLE IF EXISTS `home_modules`;
CREATE TABLE `home_modules` (
  `module_id` int(32) NOT NULL,
  `text` varchar(32) NOT NULL,
  `navi` varchar(255) NOT NULL COMMENT '跳转路径',
  `icon` varchar(255) NOT NULL COMMENT 'iconfont',
  `color` varchar(255) NOT NULL COMMENT '颜色',
  `show_status` int(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`module_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of home_modules
-- ----------------------------
INSERT INTO `home_modules` VALUES ('1', '失物招领', '../../pages/lost/lost', 'icon-shiwuzhaoling', '#04E2BA', '0');
INSERT INTO `home_modules` VALUES ('2', '兼职家教', '../../pages/job/job', 'icon-shangmenjiajiao', '#D4ABE0', '0');
INSERT INTO `home_modules` VALUES ('3', '品牌商家', '../../pages/shops/shops', 'icon-shangjia', '#FE927D', '0');
INSERT INTO `home_modules` VALUES ('4', '学习资料', '../../pages/material/material', 'icon-xuexiziliao', '#53A3E9', '2');
INSERT INTO `home_modules` VALUES ('5', '校园公益', '../../pages/unfinish/unfinish', 'icon-gongyi', '#21F084', '1');
INSERT INTO `home_modules` VALUES ('6', '租房工作', '../../pages/unfinish/unfinish', 'icon-zufangyuechifangzixianxing', '#F2A330', '1');

-- ----------------------------
-- Table structure for `home_swiper`
-- ----------------------------
DROP TABLE IF EXISTS `home_swiper`;
CREATE TABLE `home_swiper` (
  `swiperid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'swiper',
  `src` varchar(255) NOT NULL COMMENT '图片地址',
  `url` varchar(255) DEFAULT NULL COMMENT 'page url',
  `text` varchar(255) DEFAULT NULL COMMENT '显示的text',
  `pagetype` varchar(32) DEFAULT NULL COMMENT '页面类型，获取评论等',
  `id` int(32) DEFAULT NULL COMMENT '页面id',
  `show_status` int(16) NOT NULL DEFAULT '0' COMMENT '0 显示 1 隐藏',
  PRIMARY KEY (`swiperid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of home_swiper
-- ----------------------------
INSERT INTO `home_swiper` VALUES ('1', '/images/1542645363979-qxWYvq-.jpg', ' ', 'swiper', ' ', '18', '1');
INSERT INTO `home_swiper` VALUES ('2', '/images/1542645432557-Ixfjtd-.jpg', ' ', '', ' ', '8', '1');
INSERT INTO `home_swiper` VALUES ('5', '/images/1541430795619-wM7FAO-.jpg', ' ', '卖二手键盘', ' ', '1', '1');
INSERT INTO `home_swiper` VALUES ('6', '', null, null, null, null, '1');
INSERT INTO `home_swiper` VALUES ('7', '', null, null, null, null, '1');
INSERT INTO `home_swiper` VALUES ('8', '/images/1543073705448-zYXtO2-.jpg', '/pages/lost/detail/detail', '寻找小宝贝', 'lost', '22', '1');
INSERT INTO `home_swiper` VALUES ('9', '', null, null, null, null, '1');
INSERT INTO `home_swiper` VALUES ('10', '', null, null, null, null, '1');
INSERT INTO `home_swiper` VALUES ('11', '', null, null, null, null, '1');
INSERT INTO `home_swiper` VALUES ('12', '/images/1544196089245-c2OKXV-.jpg', ' ', '随便挂张图', ' ', '0', '0');
INSERT INTO `home_swiper` VALUES ('13', '', null, null, null, null, '1');
INSERT INTO `home_swiper` VALUES ('14', '', null, null, null, null, '1');
INSERT INTO `home_swiper` VALUES ('15', '', null, null, null, null, '1');
INSERT INTO `home_swiper` VALUES ('16', '', null, null, null, null, '1');
INSERT INTO `home_swiper` VALUES ('17', '', null, null, null, null, '1');

-- ----------------------------
-- Table structure for `job`
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `job_id` int(32) NOT NULL AUTO_INCREMENT,
  `publish_time` datetime NOT NULL COMMENT '发布时间',
  `title` varchar(64) NOT NULL COMMENT '显示的标题',
  `job_location` varchar(32) NOT NULL DEFAULT '开封' COMMENT '位置，开封，郑州等',
  `job_address` varchar(255) NOT NULL COMMENT '具体位置',
  `job_kind` varchar(255) NOT NULL COMMENT '工作类型  \r\n钟点工\r\n服务员\r\n网络营销\r\n安保\r\n传单派发\r\n软件开发/测试/优化\r\n文档处理/PS修图/视频剪辑\r\n游戏代练\r\n家教\r\n翻译\r\n校园代理\r\n',
  `job_time` varchar(255) NOT NULL DEFAULT '未指定' COMMENT '工作时间   日期段，或者 周一， 周二',
  `job_wage` varchar(64) NOT NULL DEFAULT '面谈' COMMENT '工资   例如 100/天   1200/月   面谈',
  `job_wage_kind` varchar(32) NOT NULL DEFAULT '未说明' COMMENT '工资结算类型  日结  月结  阶段结算',
  `job_indate` varchar(32) NOT NULL DEFAULT '' COMMENT '有效期  长期有效  或  十月一前',
  `job_brief` varchar(1024) NOT NULL COMMENT '工作需求介绍',
  `job_mobile` varchar(255) NOT NULL DEFAULT '未知' COMMENT '商家联系方式',
  `show_status` int(16) NOT NULL DEFAULT '0' COMMENT '展示状态',
  `show_top` int(16) NOT NULL DEFAULT '0' COMMENT '展示序列',
  `browse_sum` int(32) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO `job` VALUES ('1', '2018-11-06 23:17:17', '毕业设计', '开封', '鼓楼区', '编程', '周末', '100/次', '次结', '永久有效', '河南社富哦好副科级爱疯狂减肥房间爱咖啡放假了打瞌睡分类打发啊速度快放假安联大厦开发', '110', '1', '0', '14');
INSERT INTO `job` VALUES ('2', '2018-11-06 23:17:17', '带写代码', '开封', '鼓楼区', '编程', '周末', '100/次', '次结', '双十一之前', '河南社富哦好副科级爱疯狂减肥房间爱咖啡放假了打瞌睡分类打发啊速度快放假安联大厦开发', '110', '1', '0', '6');
INSERT INTO `job` VALUES ('3', '2018-11-07 05:17:17', '跑腿服务', '开封', '河南大学', '代理', '全天', '薪资面谈', '月结', '长期有效', '河南社富哦好副科级爱疯狂减肥房间爱咖啡放假了打瞌睡分类打发啊速度快放假安联大厦开发', '110', '1', '0', '15');
INSERT INTO `job` VALUES ('4', '2018-11-13 17:46:25', '招聘家教', '开封', '西部', '家教', '全天', '30/小时', '次结', '长期有效', '辅导一个中学生，语文数学', '13145454844', '1', '0', '7');
INSERT INTO `job` VALUES ('6', '2018-11-19 23:42:19', '添加数据', '意大利', '模拟', '游戏试玩', '周末', '100、day', '此结', '长期有效', '能玩，就来', '呵呵，怎么肯能有这样的好事', '1', '0', '0');
INSERT INTO `job` VALUES ('7', '2018-11-28 17:49:12', '兼职礼仪', '开封', '万博广场', '兼职', '周六周日', '130/天', '日结', '长期有效', '万博广场 周六日兼职礼仪 一天130 要求 女168左右 男175以上 形象佳 需要私戳', '请联系管理', '0', '0', '17');
INSERT INTO `job` VALUES ('8', '2018-12-05 16:07:59', '', '', '', '', '', '', '', '', '', '', '1', '0', '1');

-- ----------------------------
-- Table structure for `job_apply`
-- ----------------------------
DROP TABLE IF EXISTS `job_apply`;
CREATE TABLE `job_apply` (
  `apply_id` int(32) NOT NULL AUTO_INCREMENT,
  `job_id` int(32) NOT NULL,
  `apply_time` datetime NOT NULL COMMENT '申请时间',
  `apply_user` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '申请人',
  `apply_status` int(32) NOT NULL DEFAULT '0' COMMENT '申请状态  0 正常状态  1 删除状态',
  PRIMARY KEY (`apply_id`) USING BTREE,
  KEY `apply_user` (`apply_user`) USING BTREE,
  KEY `apply_job` (`job_id`) USING BTREE,
  CONSTRAINT `apply_job` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`) ON DELETE CASCADE,
  CONSTRAINT `apply_user` FOREIGN KEY (`apply_user`) REFERENCES `user` (`openid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of job_apply
-- ----------------------------
INSERT INTO `job_apply` VALUES ('1', '1', '2018-11-13 11:09:53', 'sst', '0');
INSERT INTO `job_apply` VALUES ('2', '1', '2018-11-13 11:09:56', 'sst', '0');
INSERT INTO `job_apply` VALUES ('3', '3', '2018-11-13 11:34:26', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '0');
INSERT INTO `job_apply` VALUES ('4', '4', '2018-11-19 00:16:58', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '0');
INSERT INTO `job_apply` VALUES ('5', '2', '2018-11-19 00:21:37', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '0');
INSERT INTO `job_apply` VALUES ('6', '1', '2018-11-19 00:21:44', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '0');
INSERT INTO `job_apply` VALUES ('7', '1', '2018-11-19 00:21:48', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '0');

-- ----------------------------
-- Table structure for `lostsandfinds`
-- ----------------------------
DROP TABLE IF EXISTS `lostsandfinds`;
CREATE TABLE `lostsandfinds` (
  `id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `publish_user` varchar(64) NOT NULL,
  `lost_type` varchar(32) NOT NULL COMMENT '类型  lost  丢  find 捡到',
  `publish_time` datetime DEFAULT NULL COMMENT '发布时间',
  `address_longitude` double(32,6) DEFAULT NULL COMMENT '经度',
  `address_latitude` double(32,6) DEFAULT NULL COMMENT '维度',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `detail` varchar(1024) DEFAULT NULL COMMENT '详细内容',
  `images` varchar(1024) DEFAULT NULL COMMENT '图片',
  `kinds` varchar(32) DEFAULT NULL COMMENT '丢失物品类型',
  `mobile` varchar(255) DEFAULT NULL COMMENT '联系方式',
  `item_status` int(16) NOT NULL DEFAULT '0' COMMENT '0 刚发布  1 物归原主',
  `show_status` int(16) NOT NULL DEFAULT '0' COMMENT '0 show  1 delete',
  `show_top` int(16) NOT NULL DEFAULT '0' COMMENT '显示顺序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of lostsandfinds
-- ----------------------------
INSERT INTO `lostsandfinds` VALUES ('1', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'lost', '2018-10-18 20:18:33', '0.000000', '0.000000', '', 'a', 'aadfa', '{\"images\":[\"/images/1539865112968-4tPV1V-.jpg\"]}', '数码', 'aaa', '0', '1', '0');
INSERT INTO `lostsandfinds` VALUES ('2', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'lost', '2018-10-18 20:20:24', '0.000000', '0.000000', '', 'aaa', 'aaaa', '{\"images\":[\"/images/1539865224357-xUfBU6-.jpg\"]}', '证件', '1121212', '0', '1', '0');
INSERT INTO `lostsandfinds` VALUES ('3', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'find', '2018-10-18 20:21:15', '0.000000', '0.000000', '', 'aaa', 'aaaaaaa', '{\"images\":[]}', '卡片', 'fda', '0', '1', '0');
INSERT INTO `lostsandfinds` VALUES ('4', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'lost', '2018-10-18 20:21:34', '0.000000', '0.000000', '', 'dfadf', 'fadfaf', '{\"images\":[\"/images/1539865294223-zzT9iF-.jpg\"]}', '证件', 'afsdff', '0', '1', '0');
INSERT INTO `lostsandfinds` VALUES ('5', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'lost', '2018-10-18 21:16:38', '0.000000', '0.000000', '', '震惊！！！！！', '某大学宿舍一钢铁直男，在三个室友帮助下，丢了贞操？？？', '{\"images\":[\"/images/1539868598358-MmaEoQ-.jpg\"]}', '其他', '1101100', '0', '1', '0');
INSERT INTO `lostsandfinds` VALUES ('6', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'lost', '2018-10-18 21:28:45', '0.000000', '0.000000', '', '寻找物品', '女朋友找不到了', '{\"images\":[]}', '其他', '111', '0', '1', '0');
INSERT INTO `lostsandfinds` VALUES ('7', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'find', '2018-10-18 21:30:20', '0.000000', '0.000000', '', '？？？？', 'FUCK U', '{\"images\":[\"/images/1539869420063-y2v9EY-.jpg\"]}', '卡片', '111', '0', '1', '0');
INSERT INTO `lostsandfinds` VALUES ('8', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'find', '2018-10-18 22:00:41', '114.354610', '34.815680', '河南省开封市龙亭区体育路16号', '没毛病', '老铁', '{\"images\":[\"/images/1539871241590-gOJXw4-.jpg\"]}', '证件', '1314800', '0', '1', '0');
INSERT INTO `lostsandfinds` VALUES ('9', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'lost', '2018-10-18 22:01:01', '0.000000', '0.000000', '', '121212', '121212', '{\"images\":[\"/images/1539871261510-3uqe29-.jpg\"]}', '卡片', '1', '0', '1', '0');
INSERT INTO `lostsandfinds` VALUES ('10', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'find', '2018-10-18 22:01:18', '0.000000', '0.000000', '', '哈哈哈', '放散阀', '{\"images\":[\"/images/1539871278766-2V6eN0-.jpg\"]}', '卡片', '啊发发', '0', '1', '0');
INSERT INTO `lostsandfinds` VALUES ('11', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'find', '2018-10-18 22:01:53', '114.353800', '34.817460', '河南省开封市龙亭区铁塔西街9号院', 'what？', 'fuck?????', '{\"images\":[\"/images/1539871313611-jFsvtf-.jpg\"]}', '卡片', 'aaaa', '0', '1', '0');
INSERT INTO `lostsandfinds` VALUES ('12', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'lost', '2018-10-18 22:02:19', '0.000000', '0.000000', '', '嘿嘿嘿', '哈哈哈哈', '{\"images\":[\"/images/1539871338905-hgnJ9p-.jpg\"]}', '数码', '啊啊啊啊', '0', '1', '0');
INSERT INTO `lostsandfinds` VALUES ('13', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'lost', '2018-10-18 22:04:06', '0.000000', '0.000000', '', '全都是', '泡沫', '{\"images\":[\"/images/1539871446523-fpWoMD-.jpg\"]}', '箱包', '120', '0', '1', '0');
INSERT INTO `lostsandfinds` VALUES ('14', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'lost', '2018-10-18 22:04:40', '0.000000', '0.000000', '', '热爱', '大佬群', '{\"images\":[\"/images/1539871480072-pGxAPr-.jpg\"]}', '数码', '150', '0', '1', '0');
INSERT INTO `lostsandfinds` VALUES ('15', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'find', '2018-10-19 09:09:31', '0.000000', '0.000000', '', 'CSS3使用了层叠样式表技术，可以对网页布局、字体、颜色、背景灯效果做出控制。css3作为css的进阶版，拆分和增加了盒子模型、列表模块、语言模块 、背景边框 、文字特效 、多栏布局等等。', 'CSS3使用了层叠样式表技术，可以对网页布局、字体、颜色、背景灯效果做出控制。css3作为css的进阶版，拆分和增加了盒子模型、列表模块、语言模块 、背景边框 、文字特效 、多栏布局等等。CSS3使用了层叠样式表技术，可以对网页布局、字体、颜色、背景灯效果做出控制。css3作为css的进阶版，拆分和增加了盒子模型、列表模块、语言模块 、背景边框 、文字特效 、多栏布局等等。CSS3使用了层叠样式表技术，可以对网页布局、字体、颜色、背景灯效果做出控制。css3作为css的进阶版，拆分和增加了盒子模型、列表模块、语言模块 、背景边框 、文字特效 、多栏布局等等。CSS3使用了层叠样式表技术，可以对', '{\"images\":[]}', '书籍', '哎哎哎啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', '0', '1', '0');
INSERT INTO `lostsandfinds` VALUES ('16', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'find', '2018-10-19 10:30:18', '0.000000', '0.000000', '', '哎哎哎', '发打发打发', '{\"images\":[\"/images/1539916218494-wTGIfn-.jpg\"]}', '数码', '112', '0', '1', '0');
INSERT INTO `lostsandfinds` VALUES ('17', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'find', '2018-10-19 19:49:16', '0.000000', '0.000000', '', '乱七八糟的代码', 'you can provide attr \"wx:key\" for a \"wx:for\" to improve performance.\n   5 |         <view class=\'msg_type\'>类型:</view>\n   6 |         <radio-group class=\"group  flex_row_left\" bindchange=\"radioChange\">\n>  7 |             <view class=\"label-2\" wx:for=\"{{radioItems}}\">\n     |              ^\n   8 |     ', '{\"images\":[\"/images/1539949756374-9pzTDa-.jpg\",\"/images/1539949756408-aOQ1WE-.jpg\",\"/images/1539949756412-x7Uxk8-.jpg\",\"/images/1539949756428-cXeXL1-.jpg\"]}', '数码', 'QQ 445247721', '0', '1', '0');
INSERT INTO `lostsandfinds` VALUES ('18', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'lost', '2018-10-19 19:57:26', '114.353800', '34.817460', '河南省开封市龙亭区铁塔西街9号院', '今天是你的生日', '今天是您的生日，我的祖国母亲 听，鸟儿飞翔欢歌 礼花隆隆祝贺 看，蓝天白云分外明媚 山川大地何其娇娆明艳 飘扬的五星红旗烈烈掌声潮起潮落 江南邈邈秀水霓裳舞曲妙漫现 北国万里山川雄姿勃发迤逦展 黄河今天是您的生日，我的祖国母亲 听，鸟儿飞翔欢歌 礼花隆隆祝贺 看，蓝天白云分外明媚 山川大地何其娇娆明艳 飘扬的五星红旗烈烈掌声潮起潮落 江南邈邈秀水霓裳舞曲妙漫现 北国万里山川雄姿勃发迤逦展 黄河今天是您的生日，我的祖国母亲 听，鸟儿飞翔欢歌 礼花隆隆祝贺 看，蓝天白云分外明媚 山川大地何其娇娆明艳 飘扬的五星红旗烈烈掌声潮起潮落 江南邈邈秀水霓裳舞曲妙漫现 北国万里山川雄姿勃发迤逦展 黄河今天是', '{\"images\":[\"/images/1539950246225-XmAtHX-.jpg\",\"/images/1539950246238-2TuiQk-.jpg\",\"/images/1539950246258-mJ7Y4j-.jpg\",\"/images/1539950246270-TxYUyr-.jpg\"]}', '书籍', '他没有留下联系方式', '0', '1', '2');
INSERT INTO `lostsandfinds` VALUES ('19', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'find', '2018-11-05 23:04:26', '114.309670', '34.812527', '河南省开封市龙亭区东京大道', '不多说，上图', '为加深我ACM团队成员凝聚力，提高团队团结精神，拉进16，17级现役/退役队员之间的感情，还有为庆祝ig取得总决赛完胜，小龙队icpc青岛铜牌，在下周四晚，把大家聚在一起共进晚宴，届时会探讨团队未来的新的发展方向，希望能来的尽量来，考虑到去老区授课的同学，地点可能在老区。周四能来的人提前给我说一声，好统计人数订餐。', '{\"images\":[\"/images/1541430266523-8qATRQ-.jpg\"]}', '证件', '110', '0', '1', '0');
INSERT INTO `lostsandfinds` VALUES ('20', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'lost', '2018-11-05 23:06:05', '0.000000', '0.000000', '', '空白', '  ', '{\"images\":[]}', '卡片', '  ', '0', '1', '0');
INSERT INTO `lostsandfinds` VALUES ('21', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', 'find', '2018-11-21 13:31:00', '114.309680', '34.812557', '河大华源学生公寓(开封市龙亭区东京大道)', '就是测试一下', '不要惊慌，什么都没丢。。', '{\"images\":[\"/images/1542778260105-qULKlf-.jpg\"]}', '卡片', '123456789', '0', '0', '0');
INSERT INTO `lostsandfinds` VALUES ('22', 'oj74Q5Q5DVMyt4QQNwqN8YqaKVLk', 'lost', '2018-11-24 23:18:12', '113.690740', '34.592358', '河南省郑州市新郑市龙湖镇文昌路1号', '找寻我亲爱的仓小鼠', '两个星期没见到它，甚是想念。', '{\"images\":[\"/images/1543072691901-gEgMqa-.jpg\"]}', '其他', '1310383258\'', '0', '0', '0');

-- ----------------------------
-- Table structure for `map_label`
-- ----------------------------
DROP TABLE IF EXISTS `map_label`;
CREATE TABLE `map_label` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `latitude` double(32,8) NOT NULL COMMENT '维度',
  `longtitude` double(32,8) NOT NULL COMMENT '经度',
  `iconPath` varchar(64) NOT NULL DEFAULT '/image/mayiwo2.png' COMMENT '图标',
  `content` varchar(32) NOT NULL COMMENT 'label标记',
  `fontSize` varchar(32) NOT NULL DEFAULT '10rpx' COMMENT 'label字体大小',
  `textAlign` varchar(32) NOT NULL DEFAULT 'center' COMMENT '位置',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of map_label
-- ----------------------------

-- ----------------------------
-- Table structure for `material`
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `publish_time` datetime NOT NULL COMMENT '发布时间',
  `publish_user` varchar(64) DEFAULT NULL COMMENT '发布人',
  `detail` varchar(2048) DEFAULT NULL COMMENT '简介json',
  `link` varchar(512) NOT NULL COMMENT '资源链接',
  `brief` varchar(1024) DEFAULT NULL COMMENT '内容  可能包含连接',
  `kinds` varchar(64) NOT NULL DEFAULT '其他' COMMENT '资源类别',
  `show_status` int(16) NOT NULL DEFAULT '0' COMMENT '显示状态  0 显示  1 删除',
  `save_num` int(32) NOT NULL DEFAULT '0' COMMENT '保存次数',
  `show_publish` int(4) NOT NULL DEFAULT '1' COMMENT '1 表示展示  0 表示隐藏',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `kinds` (`kinds`) USING BTREE,
  CONSTRAINT `kinds` FOREIGN KEY (`kinds`) REFERENCES `material_kinds` (`kinds`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of material
-- ----------------------------
INSERT INTO `material` VALUES ('7', '其他资源', '2018-10-21 22:50:22', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', null, 'http://www.baidu.com', '这是一份其他资源，呵呵呵这是一份其他资源，呵呵呵这是一份其他资源，呵呵呵这是一份其他资源，呵呵呵这是一份其他资源，呵呵呵这是一份其他资源，呵呵呵这是一份其他资源，呵呵呵这是一份其他资源，呵呵呵这是一份其他资源，呵呵呵', 'other', '0', '2', '1');

-- ----------------------------
-- Table structure for `material_kinds`
-- ----------------------------
DROP TABLE IF EXISTS `material_kinds`;
CREATE TABLE `material_kinds` (
  `kinds` varchar(64) NOT NULL,
  `quantity` int(32) DEFAULT '0' COMMENT '数量',
  `icon` varchar(32) NOT NULL DEFAULT 'icon-xuekeziyuan',
  PRIMARY KEY (`kinds`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of material_kinds
-- ----------------------------
INSERT INTO `material_kinds` VALUES ('Adobe', '0', 'icon-xuekeziyuan');
INSERT INTO `material_kinds` VALUES ('other', '1', 'icon-xuekeziyuan');
INSERT INTO `material_kinds` VALUES ('政治', '0', 'icon-xuekeziyuan');
INSERT INTO `material_kinds` VALUES ('数学', '0', 'icon-shuxue1');
INSERT INTO `material_kinds` VALUES ('考研', '0', 'icon-xuekeziyuan');
INSERT INTO `material_kinds` VALUES ('英语', '0', 'icon-yingyu');
INSERT INTO `material_kinds` VALUES ('计算机', '0', 'icon-xuekeziyuan');
INSERT INTO `material_kinds` VALUES ('高中数学', '0', 'icon-xuekeziyuan');

-- ----------------------------
-- Table structure for `passages`
-- ----------------------------
DROP TABLE IF EXISTS `passages`;
CREATE TABLE `passages` (
  `passage_id` int(32) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `imgurl` varchar(255) NOT NULL COMMENT '图片url',
  `publish_time` datetime NOT NULL,
  `publish_user` varchar(64) CHARACTER SET utf8 NOT NULL,
  `detail` varchar(4096) NOT NULL COMMENT 'detail',
  `browse_sum` int(32) NOT NULL DEFAULT '0',
  `show_top` int(32) NOT NULL DEFAULT '0',
  `show_status` int(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`passage_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of passages
-- ----------------------------
INSERT INTO `passages` VALUES ('1', '蚂蚁蜗成立', '/images/1540460934481-IkrJTM-.jpg', '2018-11-16 23:04:22', '', '{\"detail\":[{\"tp\":\"title\",\"text\":\"小米发布会\",\"time\":\"2018-10-25\",\"detailtime\":\"2018-10-25T10:24:09.940Z\",\"style\":\"\"},{\"tp\":\"image\",\"src\":\"/images/1540463058483-M4EXT1-.jpg\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"周大萌\\n哇哈哈哈\"},{\"tp\":\"image\",\"src\":\"/images/1540463085466-eOMFGo-.jpg\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"再放上一张图\"},{\"tp\":\"image\",\"src\":\"/images/1540463111560-ux5wCX-.jpg\",\"style\":\"\"},{\"tp\":\"image\",\"src\":\"/images/1540463117529-NVDYiN-.jpg\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"情\\n侣\\n头\\n像\"},{\"tp\":\"video\",\"src\":\"/images/1540463142689-sNC19i-.mp4\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"视频来一段\"}]}', '9', '0', '1');
INSERT INTO `passages` VALUES ('2', '正则表达式', '/images/1541431117025-JxKKQu-.jpg', '2018-11-14 11:57:58', '', '{\"detail\":[{\"tp\":\"title\",\"text\":\"小米发布会\",\"time\":\"2018-10-25\",\"detailtime\":\"2018-10-25T10:24:09.940Z\",\"style\":\"\"},{\"tp\":\"image\",\"src\":\"/images/1540463058483-M4EXT1-.jpg\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"周大萌\\n哇哈哈哈\"},{\"tp\":\"image\",\"src\":\"/images/1540463085466-eOMFGo-.jpg\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"再放上一张图\"},{\"tp\":\"image\",\"src\":\"/images/1540463111560-ux5wCX-.jpg\",\"style\":\"\"},{\"tp\":\"image\",\"src\":\"/images/1540463117529-NVDYiN-.jpg\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"情\\n侣\\n头\\n像\"},{\"tp\":\"video\",\"src\":\"/images/1540463142689-sNC19i-.mp4\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"视频来一段\"}]}', '2', '0', '1');
INSERT INTO `passages` VALUES ('3', '蚂蚁蜗成立', '/images/1540460934481-IkrJTM-.jpg', '2018-11-16 23:04:22', '', '{\"detail\":[{\"tp\":\"title\",\"text\":\"小米发布会\",\"time\":\"2018-10-25\",\"detailtime\":\"2018-10-25T10:24:09.940Z\",\"style\":\"\"},{\"tp\":\"image\",\"src\":\"/images/1540463058483-M4EXT1-.jpg\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"周大萌\\n哇哈哈哈\"},{\"tp\":\"image\",\"src\":\"/images/1540463085466-eOMFGo-.jpg\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"再放上一张图\"},{\"tp\":\"image\",\"src\":\"/images/1540463111560-ux5wCX-.jpg\",\"style\":\"\"},{\"tp\":\"image\",\"src\":\"/images/1540463117529-NVDYiN-.jpg\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"情\\n侣\\n头\\n像\"},{\"tp\":\"video\",\"src\":\"/images/1540463142689-sNC19i-.mp4\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"视频来一段\"}]}', '0', '0', '1');
INSERT INTO `passages` VALUES ('4', '震惊！！！！', '/images/1542446394805-udyVdv-.jpg', '2018-11-17 17:27:24', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '{\"detail\":[{\"tp\":\"title\",\"text\":\"震惊！！！！！\",\"time\":\"2018-11-17\",\"detailtime\":\"2018-11-17T09:20:08.377Z\",\"style\":\"\"},{\"tp\":\"image\",\"src\":\"/images/1542446414084-epKMcS-.jpg\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"为了金钱，这个女子竟然做出这样的事\"}]}', '7', '0', '1');
INSERT INTO `passages` VALUES ('5', '是他，是他，就是他', '/images/1542447213206-Qf4MrW-.jpg', '2018-11-17 17:36:01', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '{\"detail\":[{\"tp\":\"image\",\"src\":\"/images/1542447291278-E7906N-.jpg\",\"style\":\"\"},{\"tp\":\"title\",\"text\":\"海贼王！！！\",\"time\":\"2018-11-17\",\"detailtime\":\"2018-11-17T09:35:00.902Z\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"你来，或者不来，我们都在这儿\",\"style\":\"color:#DB4520; font-size:1.3em;\"},{\"tp\":\"text\",\"text\":\"吾余一元，购糖，拐幼童，得六万，遂二千，寻风尘女子，事毕，迷之，取其肾，凑足十数，购得弹药，于银行，得五百万。 钱已有，以不愁身后之事，自觉坏事做绝，需改过，于午时遇一跌倒老者，遂扶之，剩八角。\"}]}', '86', '0', '0');
INSERT INTO `passages` VALUES ('6', '共享美德', '/images/1542646540870-mlH6nV-.jpg', '2018-11-20 00:55:46', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '{\"detail\":[{\"tp\":\"title\",\"text\":\"共享美德\",\"time\":\"2018-11-20\",\"detailtime\":\"2018-11-19T16:52:16.351Z\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"我们将好的分享给别人之后，快乐就会更上一层楼；将失落分享给别人后，绝望会减少一半。没错，这就是分享的魔力，如果一个人不懂得分享，那么在他的生命中就永远不会出现彩虹，还会让痛苦继续待下去。\"},{\"tp\":\"image\",\"src\":\"/images/1542646472229-ePvxyR-.jpg\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"\\n\\n感谢聆听。\",\"style\":\"color:#93E0FF; font-size:1.3em;\"}]}', '95', '0', '0');
INSERT INTO `passages` VALUES ('7', '有多少父母，以爱的名义，一步步把孩子养成了废物', '/images/1543997462605-etTujb-.jpg', '2018-12-05 16:20:14', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '{\"detail\":[{\"tp\":\"title\",\"text\":\"有多少父母，以爱的名义，一步步把孩子养成了废物\",\"time\":\"2018-12-5\",\"detailtime\":\"2018-12-05T08:11:22.859Z\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"       我有一个朋友，非常霸道，一言不合就几天不让老公进门，夫妻感情很不好。\\n      老公为了避免跟她发生冲突，跟公司申请驻外地工作，两个月才回家一次，朋友就把所有的心思都花在了儿子身上。\\n        她几乎不跟朋友来往，也没有个人爱好和生活，除了朝九晚五上班之外，每天就奔波在学校，和去各种补习班的路上。\\n       朋友对儿子的成绩格外在意，作业只要有一个字写的潦草，她就会把整个本子撕掉让孩子重写，考试只要不考到3个100分，她就会大发雷霆。\\n      儿子很怕她，但是也不敢反抗，她很自豪孩子的听话，常挂在嘴边的一句话就是，“我这辈子就是为了儿子活着，等他结婚了我也要跟他住，一辈子都不会分开。”\\n       她说的一句话让我记忆尤深，“我儿子今年11岁，从他出生到现在，我看的电影都是动画片，从来没看过面向成年人的电影。”\\n      最重要的是，她说这话的时候不是伤感的，而是自豪的，因为她觉得自己是个很完美，奉献精神特别强的妈妈。\\n       很多母亲会陶醉在自己无私的奉献里，每天对着孩子一遍一遍的说，“我牺牲了自己的全部，都是为了你。”\\n       但是她们从没有想过，你的牺牲，孩子到底愿不愿意要，你的奉献，或许只感动了你自己。\\n    这种母亲一般会培养出两种孩子：一种孩子长大了特别叛逆，可能穷尽一生，就为了与母亲的控制对抗；另外一种，就是永远对母亲唯唯诺诺，爱无能的妈宝男。\"},{\"tp\":\"image\",\"src\":\"/images/1543997611277-NnQ5d5-.jpg\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"\\n曾经看过一期《爱情保卫战》，妈妈控制欲特别强，儿子交了四五个女朋友都被妈妈拆散，觉得她们不好，配不上自己的儿子。\\n       这次儿子觉得遇到了自己的真爱，母亲还是拼命反对，于是求助于电视台，面对母亲的强势，儿子一直唯唯诺诺，不敢说话。\\n他的妈妈是这么说的：“我把我儿子培养的这么优秀，我了解我儿子，他要找一个温柔，贤惠，生活上给他最好的照顾，事业上也能给他帮助的老婆，这个女孩配不上我儿子。”\\n        面对儿子从未有过的坚持，妈妈声泪俱下的说“儿子你怎么不听话，我对你不好吗？小时候我为了带你学琴，每周六倒两趟公交车，风里雨里坚持了两年；后来我又陪你全国各地参加比赛，为你成长我花了多少力气，你对得起我吗？”\\n       心理专家涂磊老师说“看你的行为，我只想到了两个字，凶手！这个世界上最可怕的不是怀着恨意的凶手，而是怀着爱意的凶手。\\n       最可怕的凶手，不是一刀致命的，而是一刀一刀的折磨你，可怕的凶手不是要把你杀死，而是要把你变成一个废物。\\n       生活当中就有一些打着爱的名义的母亲，把一个看似聪明伶俐，多才多艺的儿子变成了一个连爱都不能坚守的废物，在这种母亲心中，只有她自己才配得上她的儿子。”\\n       “孔雀东南飞”里有这样一段话：\\\"十三能织素，十四学裁衣，十五弹箜篌，十六诵诗书。十七为君妇，心中常苦悲。君既为府吏，守节情不移，贱妾留空房，相见常日稀。鸡鸣入机织，夜夜不得息。三日断五匹，大人故嫌迟。非为织作迟，君家妇难为！妾不堪驱使，徒留无所施，便可白公姥，及时相遣归。”\"},{\"tp\":\"image\",\"src\":\"/images/1543997793870-ijmbYf-.jpg\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"\\n        刘兰芝明明就是一个贤良淑德的好媳妇人选，为什么婆婆对她那么不满意，非得逼自己的儿子休妻另娶呢？\\n        长大后的我们终于懂了，古代的妻子得不到丈夫的疼爱，又没有自己的个人生活，所以女人往往就会把全部的精力都投入到儿子身上。\\n        一旦儿子生命里出现了一个比她还重要的女人，母亲就会有多年心爱之物被人抢走的痛心感，才会一心想拆散他们。\\n       在21世纪的今天，100句话里99句在提孩子的妈妈也不在少数，潜能训练导师杨海涛说，比其他失去一切更可怕的是失去自我。\\n        把所有的时间都用来盯着孩子，无论对于女人自己，对于丈夫，还是对于孩子，都是件悲哀又可怕的事。\\n       夫妻关系才是家庭关系的第一顺位。德国家庭治疗大师海灵格说过：健康的家庭运转法则，一定是先爱伴侣，再一起爱孩子。\\n      “妈妈是超人2”里，嗯哼乖巧懂事，随时都在妈妈面前上演霸道总裁戏码，无不彰显着杜江跟霍思燕恩爱的夫妻关系。\\n杜江出差回家，嗯哼问，“爸爸你是不是想我了，回来看我的？”杜江先亲了亲妻子，接着回答，“是的，我想你了，但是我更想你的妈妈。”\\n       如果老婆爱老公，老公爱老婆，就不会把那么多的精力都投入到孩子身上，这样才能培养出独立，内心强大的孩子。\\n        妈妈要跟孩子保持适当的界限感，只有尊重孩子，才能养出心灵健康的孩子。\"},{\"tp\":\"image\",\"src\":\"/images/1543997887245-dAnyQU-.jpg\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"文来自网络，如有侵权，请联系管理撤消\",\"style\":\"color:#DB4520; font-size:0.8em;\"},{\"tp\":\"image\",\"src\":\"/images/1543997956338-NSlH2J-.jpg\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"另外，扫码领红包哦(´-ω-`)\\n动动手指，打赏一下小编吧? \",\"style\":\"color:#93E0FF; font-size:1.2000000000000002em;\"}]}', '34', '0', '0');

-- ----------------------------
-- Table structure for `shops`
-- ----------------------------
DROP TABLE IF EXISTS `shops`;
CREATE TABLE `shops` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `publish_time` datetime NOT NULL COMMENT '发布时间',
  `publish_user` varchar(64) NOT NULL COMMENT '发布人',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `second_title` varchar(255) DEFAULT NULL COMMENT '副标题',
  `detail` text NOT NULL COMMENT '详细内容',
  `imgurl` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `shop_type` varchar(32) NOT NULL COMMENT '类型',
  `show_status` int(4) NOT NULL DEFAULT '0' COMMENT '0显示  1 删除',
  `show_top` int(32) NOT NULL DEFAULT '0' COMMENT '显示顺序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of shops
-- ----------------------------
INSERT INTO `shops` VALUES ('8', '2018-10-25 17:51:10', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'aaa', '1212321', '{\"detail\":[{\"tp\":\"title\",\"text\":\"aaaaaaaa\",\"time\":\"2018-10-25\",\"detailtime\":\"2018-10-25T09:49:02.966Z\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"hahahaha\\nmix3\\n\\n列举\"},{\"tp\":\"image\",\"src\":\"/images/1540460956553-qeaqvG-.jpg\",\"style\":\"\"},{\"tp\":\"image\",\"src\":\"/images/1540461015729-FrtJHr-.jpg\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"小米发布会\\n哈哈哈哈\"}]}', '/images/1540460934481-IkrJTM-.jpg', '行', '1', '0');
INSERT INTO `shops` VALUES ('9', '2018-10-25 18:27:00', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '当然是个吃货✧٩(ˊωˋ*)و✧', '十月25，小米发布会，来不来随你，但是，我去不了，哈哈哈', '{\"detail\":[{\"tp\":\"title\",\"text\":\"小米发布会\",\"time\":\"2018-10-25\",\"detailtime\":\"2018-10-25T10:24:09.940Z\",\"style\":\"\"},{\"tp\":\"image\",\"src\":\"/images/1540463058483-M4EXT1-.jpg\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"周大萌\\n哇哈哈哈\"},{\"tp\":\"image\",\"src\":\"/images/1540463085466-eOMFGo-.jpg\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"再放上一张图\"},{\"tp\":\"image\",\"src\":\"/images/1540463111560-ux5wCX-.jpg\",\"style\":\"\"},{\"tp\":\"image\",\"src\":\"/images/1540463117529-NVDYiN-.jpg\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"情\\n侣\\n头\\n像\"},{\"tp\":\"video\",\"src\":\"/images/1540463142689-sNC19i-.mp4\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"视频来一段\"}]}', '/images/1540462997138-nMeaiH-.jpg', '衣', '1', '0');
INSERT INTO `shops` VALUES ('10', '2018-11-05 23:19:23', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '哈哈哈', '副标题啊', '{\"detail\":[{\"tp\":\"title\",\"text\":\"空白\",\"time\":\"\",\"detailtime\":\"2018-11-05T15:19:10.691Z\",\"style\":\"\"}]}', '/images/1541431117025-JxKKQu-.jpg', '食', '1', '0');
INSERT INTO `shops` VALUES ('11', '2018-12-13 17:51:33', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', 'acmer家常题', '让你体验到指尖上的美味', '{\"detail\":[{\"tp\":\"title\",\"text\":\"饿了吗？来几道ACMER家常题\",\"time\":\"2018-12-13\",\"detailtime\":\"2018-12-13T09:47:19.988Z\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"你们真优秀\\n不像我，除了帅，一无是处\",\"style\":\"color:#333333; font-size:1.2000000000000002em;\"},{\"tp\":\"image\",\"src\":\"/images/1544694534292-iCvESB-.png\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"惊了，怎么是这张图？？？\",\"style\":\"color:#DB4520; font-size:1.4em;\"},{\"tp\":\"video\",\"src\":\"/images/1544694596855-C0oJ32-.mp4\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"停工。。。。暑假有时间再写吧\",\"style\":\"color:#93E0FF; font-size:0.7;\"}]}', '/images/1544694680026-JGdanc-.jpg', '食', '0', '0');

-- ----------------------------
-- Table structure for `shops_kinds`
-- ----------------------------
DROP TABLE IF EXISTS `shops_kinds`;
CREATE TABLE `shops_kinds` (
  `kinds` varchar(32) NOT NULL,
  `quantity` int(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`kinds`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of shops_kinds
-- ----------------------------
INSERT INTO `shops_kinds` VALUES ('住', '0');
INSERT INTO `shops_kinds` VALUES ('行', '3');
INSERT INTO `shops_kinds` VALUES ('衣', '3');
INSERT INTO `shops_kinds` VALUES ('食', '3');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `openid` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT 'user''s openid',
  `sessionkey` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT 'sessionkey',
  `nickName` varchar(64) DEFAULT NULL COMMENT '用户昵称',
  `gender` int(4) DEFAULT NULL COMMENT '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
  `avatarUrl` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户头像，最后一个数值代表正方形头像大小（有0、46、64、96、132数值可选，0代表132*132正方形头像），用户没有头像时该项为空。若用户更换头像，原有头像URL将失效。',
  `city` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户所在城市',
  `province` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户所在省份',
  `country` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户所在国家',
  `language` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户的语言，简体中文为zh_CN',
  `xh` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '学号',
  `realname` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '真实姓名',
  `mobile` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户手机号',
  `wechat` varchar(64) DEFAULT NULL COMMENT '微信',
  `school` varchar(32) DEFAULT NULL COMMENT '学校',
  `qq` varchar(32) DEFAULT NULL COMMENT 'QQ号',
  `specialty` varchar(32) DEFAULT NULL COMMENT '专业',
  `faculty` varchar(512) DEFAULT NULL COMMENT '特长技能',
  PRIMARY KEY (`openid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('oj74Q5aaWOGIkZ3cTc3bfYmFMw_A', 'jZtoJ7+ZrJfP2tJmDx5l6w==', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5ann8KlMqVscs8I8Q-T25gY', 'e/LHw2XalivAvdX40onHVw==', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5auNejSFm-vfrTZNYnWyvCQ', 'nqBH4BNE+BHWCOg0JRCOUA==', '颖小姐', '0', 'https://wx.qlogo.cn/mmopen/vi_32/9PXXxqq18LyaGHaP8vnqvjuLIIzKO9FObxjvvJLUJnBAgOKSO0pYJfxlmyzaPNiaWJYAelRXflqA7Rsib8hA37iaA/132', '', '', '', 'zh_CN', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5awSYV9hrt0edTA_sVlggNc', '7khT8UYb7RshTUVyb+s1dA==', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5b02r2ZBF5AjkLKtI0CUBXk', 'WnEP5hnxjkoUNxASVybh3g==', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5b5ry7crR1i5CaTY3FS7yrk', '8WpwD0yj7xDyxnT16NKqRg==', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5bAipnQQNTwqlESJNeFICgA', 'CeB5QGYJtnFeAOjpBjb4jg==', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5bDWPfs5LjVz71ZY6u3HwU0', 't0HrPtb0lIH2mJOzbV/MLA==', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5bVztE_EpgQLqIx290ZB_IE', 'E/8DhS2UAv+zkf3ztofwFw==', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5ck9ppRkmWg9gePJ52MJg84', 'NI+4ARYEdj1NHAV8x3oo8A==', '木棉', '1', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eraI46iac0jomyYt8iaNwiazGahsesm2bibdIEem96bvj3icPRQaO8Qf0UXIWUs8X0gwH3AiaMADqH1KT3w/132', '', '', 'Algeria', 'zh_CN', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5cTY2jqqS3yU18RXiv7gxXE', '9hwWYXHPGchxNoBENVEubg==', '谢慧敏', '0', 'https://wx.qlogo.cn/mmhead/kdBoH5VK1NdNIic7DicvRAFTKpI9gPmswDD3j9hojRnU8/132', '', '', '', 'zh_CN', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5cx0nIWH6YK-O3g29hetZ6E', 'bdAACNNf7mUAOAaP9OcYxQ==', '林冲', '0', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIradvotK0Q7V3PbDh8zeZdwiaLJ6IYp0gZ5ziatjuyTWZtnNkWuVnmerxPlIX9tdsmPt4jibyY6nGkQ/132', '', '', '', 'zh_CN', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5cxOz49i5kY4RJGzC_sWBJI', 'm8qfDTs/m9su1YHOhui7qQ==', '林佩雯', '0', 'https://wx.qlogo.cn/mmhead/Joywd54nDFTOicmCcWIfESmiczhRO3EE2adEVb5nJiatSI/132', '', '', '', 'zh_CN', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5dc6ZAqPgqB7uHfdZm1b-9A', 'nwYjCaTcp5DkmC8sNYftpQ==', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5dGUz5cXwDG9MKEosZnMKuo', 'OTk82YAquZVT65OymKbDFA==', '蚂蚁蜗 蔡卫帅', '1', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJN1RA4vD9HLM5icMPqZicrvUaYnUuxibRhMxjwLe72P6Dp0EUHiarBjtV2yCZ6szCuqOjia9veCW0Iic0w/132', 'Zhoukou', 'Henan', 'China', 'zh_CN', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5e70iiksGMsTO8NZq74gq3c', 'sSLTGcToawiCuWIsWpTNgA==', '成言', '2', 'https://wx.qlogo.cn/mmopen/vi_32/2nM9PaEsM4XiaymWnqH0Oc4iaibvuFFHE7lfTG2xO4icWQg8r7c6cUB5PwZI8iaxZJ2XM27Fia1YFeM2LicpOic53UOmUg/132', 'Gold Coast', 'Queensland', 'Australia', 'en', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5e9JobG4rj_S9lVqmu8shOc', 'bN/rNRR87ebpcfdmh4jB9g==', 'B   number', '1', 'https://wx.qlogo.cn/mmopen/vi_32/fGLITTE5iaNSXc4xUXnBBpC1uicOE4Ko5PCiall5QQvUkcuJop1SMdkybjASrzkbjD6wcIdsmAIhf8ZEjicQXYJwibg/132', 'mesa', 'Henan', 'China', 'zh_CN', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5eG3bOWHwalqHRpLkMnvpSY', 'Fyhc6nLl3i84lh0LFf6o5w==', '蚂蚁蜗徐笑研', '2', 'https://wx.qlogo.cn/mmopen/vi_32/By8zMo6PlqWunYmzrZOQ5HpFdnWSfmjkC32N4zHcP9oUQOeqYq8wx3Mib3thiazJZ2EQLqPw4zs4WMa1JCb79Ygw/132', 'Zhoukou', 'Henan', 'China', 'zh_CN', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5eh_vTe_4q2VuHv8csNEdGE', 'GuiPxqb1AvCaq51Si1Vzfw==', '付 snow?', '2', 'https://wx.qlogo.cn/mmopen/vi_32/2JCcs4ztsPkUbbq5bGU7iavycNCovGpXHZvlXib8ljzJicHWlph26nibkShtl2j4KtRUZ18gmtTwkTrTcibEkaHdeCQ/132', 'Zhengzhou', 'Henan', 'China', 'zh_CN', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5eJ2drZMA_JCLN5iJmlaVeE', 'I+oNGV5Ftr21FwBzFJ4rPw==', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5eP1BwxJeHle1Dl0bzN-Ges', 'WaihO+G6AtPU8nvI115g8Q==', '?言?', '2', 'https://wx.qlogo.cn/mmopen/vi_32/AQl9jI3ticVaKuyMLCEYBibicV0wOx7Efd9KpA8knEbIAlK4jtYGk7UNcTib595h4HnKTBYl5E0XmNAzLibpJQIRZnQ/132', 'Zhengzhou', 'Henan', 'China', 'zh_CN', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5f-v_Fc6pdpfa1W4Kf5BSxk', 'KICtCE6SmkiMpOR65E+DtQ==', '7', '1', 'https://wx.qlogo.cn/mmopen/vi_32/qD1SwStaUmwHuObLsJnpGMGJGia4UyYYBKxmEic8Cs78GZzibN8f2SQKoHFPFrsbiacIR8kkpEqYIJk5GFnEQ7lMUQ/132', 'Xinyang', 'Henan', 'China', 'zh_CN', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5fq8Z7j_CSQf54apNvEkBig', '4re+haKBb7t7hMZ1lEG6tQ==', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5Q5DVMyt4QQNwqN8YqaKVLk', '/DF7Mjw/z+132PTLykrgvg==', 'n.n', '2', 'https://wx.qlogo.cn/mmopen/vi_32/plWUNav3KjOoeudUjfiagbRicInZ516APcTMcxzPmMKfT8a9F0x655XgO9KY2ibTicncGEDwYoPxdZIxiaOvGldTVibw/132', 'Shangqiu', 'Henan', 'China', 'zh_CN', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5Qmq6wZ9HS_EjFOiyEHsSAc', '950XXzjJqIZL1XM+l4plNA==', '陈怡婷', '0', 'https://wx.qlogo.cn/mmhead/AmJAFs9hkYibSSs68xMvam3xZ0lVNib8IQMQ4rurwdeQA/132', '', '', '', 'zh_CN', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5Qmuhu-a-WsZ68NRQJ5V-jY', '9eAtLR4NxNtGJLPmQy3HWg==', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5QO7NQU_EB3bhHkMEq0Nl0I', 'SsKNOJdT330ZAGHJhQzp6A==', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5QwiU2VM7Omy04HkA0oJwas', 'ZEkFSinUOdBBqPudgW6faw==', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5QxjE-bpxSMvIWmpbcEQ3DM', 'X/ayP9uGww3r00Xj73xozQ==', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5QxZpH8TzLIemQTZwokJ3uc', 'kfLIv3uZdEL7dqVOEiNTgQ==', '被风筝追的人?', '1', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqzost4qsRenx6RQz3UheE3lz61cMM7gBcgIkVkA8myFfSLdzVZgMvFVwMsnSnAJnHHW5PuO4fgeA/132', 'Shangqiu', 'Henan', 'China', 'zh_CN', null, '蚂蚁', '1314', 'wechat', '河南大学', '4452', '经济', '                    <view class=\'save_num\'>\n                        <view class=\'iconfont icon-xueke-qita\'></view>\n                        <view>{{item.save_num}}</view>\n                    </view>');
INSERT INTO `user` VALUES ('oj74Q5RlU82kYk-KfNom4tS5BQyI', 'EPTgdTy2uvixs3Lo0yTyxQ==', 'Mr.Chen', '1', 'https://wx.qlogo.cn/mmopen/vi_32/icvFO1UdPCSkGqnlgrDPJibI7nEMZKjQoC4iagH6NnRdNjlKsXC3uw6xL1f7V03g9GMW9VxuaISPuIh3qZ812ibQicA/132', 'Kaifeng', 'Henan', 'China', 'zh_CN', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5RNo9iF2n3qiKv3ujXdqlZ8', '12P3xbi5eVKv3yUJ88VxSA==', '陈宁安', '0', 'https://wx.qlogo.cn/mmhead/F26ZCeFJ7Og4wnKn9eUgAe5AIDlsjHIGgyjn6cHDcdA/132', '', '', '', 'zh_CN', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5RpAHhOA-x_H4W8SKrWxjns', 'iRH2Lq7VemQcJJrtbsVB0w==', '测食鸡', '2', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLn79ZwHAYZjV6TB7Vk5wjubxR0VOX7fRmwpyl3kEnzDxdzCTDlh4Z2evDIZhou9c2PV3icUoIJWOg/132', '', '', '', 'zh_CN', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5RykTkjC6J5XppP1TDoK9_4', '/JlFHKZm8TAJCRtKK2so2w==', '。。。', '1', 'https://wx.qlogo.cn/mmopen/vi_32/6p7YWGXJhrFiafckCrY8zCU79HxyVsr7y7iaMiaK6yuG99YGQlibuBPaasQPpzIgYwzITbcmujcO4xykrs1gnmoyBQ/132', 'Pudong New District', 'Shanghai', 'China', 'zh_CN', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5SpDnrf2rSD6OhHr8xXOl_o', 'eFEssuvTc0axEhsEkJDeNw==', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5StOSo57H_ySEcCSbShZME0', 'ICFNqpw/DLz6l8ZgdPkrDg==', '张清', '0', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIradvotK0Q7VsZlGk3A5b3m4dNs5sZ4m0UBcmwGlSY3xMmTU8ibWK5ROB0EfssTob1iaX0cewbibMhw/132', '', '', '', 'zh_CN', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5SX_4uIQZsCYMq4ohZEavM8', 'FZ5PMJNpVcl5oHCIGvdVKA==', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5T4GnDVEsEb5ofTiPa7maAk', 'mAHhVJ0Wlt1mcP3aucWKnA==', '许惠俊', '0', 'https://wx.qlogo.cn/mmhead/6RsJfVic5sfKAc8BbpuXSXBuhicebhS6mqumlbGh9xCyM/132', '', '', '', 'zh_CN', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5TFrozEBFkSau1gnibPStAE', '+v7gTJAdf4JFde3a8Bv6Lw==', 'Reeeeeeyh', '2', 'https://wx.qlogo.cn/mmopen/vi_32/XbSCEnM3emONb5jA2GK6iaELg6EvX2Nupav3MGphSRI2tYoxgxia2vkPz7mfVtemDG1q9ibO7GtnysgGuU4p1l8ng/132', 'Xinxiang', 'Henan', 'China', 'zh_CN', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5Tof0XSM24OhR_WFMvhfHls', '4TVfMxtP56Bu9bf2Adt+Vw==', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5TugKGP7_PrZJwK8Rr41YuI', 'k5ZhaGYmmgRqq95EUJHawQ==', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5U5Fa0XZXSd9wdFFYqR4MS4', 'nywP2s8B2wH1uQX7A6/VWg==', '好吗？好的', '1', 'https://wx.qlogo.cn/mmopen/vi_32/VIROUlfQ1gzU3UoVtbvrYkyfcnRPMu90tkuZBHEibCP5YL4nPYJqukfAIgMYn29J4UNnlEGxjFsibDSsBynvc9HA/132', 'Anyang', 'Henan', 'China', 'zh_CN', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5Ucex5Eh0hUxJWRhbgG5yDI', 'iT9UOFtM0vyyED1Exuj2DA==', '七月在野', '1', 'https://wx.qlogo.cn/mmopen/vi_32/E9ayhcdQj8DuGEpsibw7q8vZ5BiaEVtkXWKegojggNHFJ4yoDH3ia314lWTBdR2ibSG3f367CkucTrR4teoMTpKpsg/132', 'Weifang', 'Shandong', 'China', 'zh_CN', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5UfI_w3cWRS24NyrBjv8Y4w', 'MhJCn9JNmsdAAjDg0KAccw==', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5UNrEg_aUaHVlTcc0d2et0E', 'mzrO9M6aJs+D8Sv1Za8mPw==', 'hihihihi', '1', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJiahgiafuMPYEFe5nICgmraVgQLhqYolsNpjQe4VjiaiceNIVwCPUp8EbTaQypiaZjOtTLImMqWicQq75Q/132', '', '', 'Albania', 'zh_CN', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5UVIe5QROlnYcrsGmKCRegE', 'PpkX2FMPDYL1mJ0QeDZxpw==', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5UYMPxMlxmnOKNVh9XLLsNA', 'nldibxdAXf1ZsssBhbJFaw==', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5VniEcq7mu_lgEqcINQDEqY', 'IdLa7+gBf/9du3Hyt8JSaQ==', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5WIZIo3kknk0F4d3BiblxXk', 'DbOJoK9qUQXzco+zZ8O2lw==', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5WR2y6E9r97DQwQen6HvYIA', 'LAGmKoI2vR9ARBMZ9f+w8g==', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5XHz_HoYXzpWVpDn0bb0-mQ', 'nZH5Pt+3fjew4ixa3YYjAA==', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5XRdcj2LL4FkGxcydFpI3Xk', 'gxRJEj/1sQ1R3cK7+A9hEw==', '雨中辰龙', '1', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJv3HPde36llzT1CVNRmRUrPsQSrHhhrogEgYRDcz8sD2wJTAVaUAHOmfa5F13lTRDAqbibhAnbaDA/132', 'Kaifeng', 'Henan', 'China', 'zh_CN', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5XWc4MigCKdo-xDKunNiOf0', '3KlY93olKBQ2qF0QVeOaog==', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5Ym712DbFo_X8i_BqmWu8EU', '8hOlqVIK4hczQ1fxS2snPw==', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5YRvb0sySu82QjQirvHb2xM', 'pLEEMkf6FCuZdaORrNkSSw==', '王小乾', '1', 'https://wx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLBlvzlCMTour6zFSVOqXgovToynQoRYBXjU6MxeHJqylydl6g1ydzEPbqW04Phnia4le3bDraOeA0A/132', 'Jiaozuo', 'Henan', 'China', 'zh_CN', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5YtU4YbjHv0JQyvVFsZHsHU', 'c9wOtVPGM1HCLNJkPzibOA==', '-南 墙', '1', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoyCAgtwKW6CCckhulbDicWa1OvaMBQB5dconDJrQYLTBHylSfJbB2W0EichuBibLQmvANibYGRqBnV7g/132', 'Hangzhou', 'Zhejiang', 'China', 'zh_CN', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5YyrubLoZWLtswcdG-5pnjI', 'hO1DPrpSQMd89qOJPmr/FQ==', 'Chip Shao', '1', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKrcDMPAw38wT5FHLImMMnAGxBaGlWGh3XPwcW32vBgicoCa7lATdR67gfy9o3jsSykNlTqUdSzLSw/132', '', '', 'Romania', 'zh_CN', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5Zf5NCAGKhNaYaioROIU6Ik', 'RAib4h2f7Zjm/YfAh6rrTg==', '王宇航', '1', 'https://wx.qlogo.cn/mmopen/vi_32/aIibjhjYI8kArPM3fp66TFHtoEytXSqTKFD5yzGfgCX04SlnsiaqseDlO6P6TEusPw3wOYfrV3Fxk6Z4emxiaJCYw/132', 'Dongguan', 'Guangdong', 'China', 'zh_HK', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5ZpNHObb2Nq_s0nsbDbCw5E', 'eeZj9tZnzhhLmYpE1/pbBQ==', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oj74Q5Z_mbXJLtei2mhCkz_EXBKU', 'D7uuMzOJmciRppuZAKgQTQ==', 'tensor7', '0', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqDYLeWq3qsarpxXdOmUjK6kcL75dIbzO1FaaB5RDP3l4W1aunfdocPWlXqEZp4ljibyibcLq3mKqmQ/132', '', '', '', 'zh_CN', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'VqizdOYmgQK98vV9+ksJzA==', '被风筝追的人?', '1', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erQclmTZFrRVvNXh6z8OfYxunuLKJygV0riawu8mgvvjocOzv2b5WQF88fsI6wg8FXJWS7s8icjk7lw/132', 'Shangqiu', 'Henan', 'China', 'zh_CN', null, '你大爷还是你大爷', '110', '0000', '清华大学外500公里的河南大学', '445247721', '最nb专业', '轻松驾驭任何可以轻松驾驭的东西');
INSERT INTO `user` VALUES ('sst', 'sst', 'sst', '1', '11', '11', '11', '11', '11', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `user_collect`
-- ----------------------------
DROP TABLE IF EXISTS `user_collect`;
CREATE TABLE `user_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collect_type` varchar(32) NOT NULL COMMENT '收藏类型',
  `collect_id` varchar(32) NOT NULL COMMENT '收藏文章的id',
  `collect_time` datetime NOT NULL,
  `collect_user` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT 'openid',
  `collect_status` int(16) NOT NULL DEFAULT '0' COMMENT '0 正常收藏  1 取消收藏',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `openid` (`collect_user`) USING BTREE,
  CONSTRAINT `openid` FOREIGN KEY (`collect_user`) REFERENCES `user` (`openid`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user_collect
-- ----------------------------

-- ----------------------------
-- Table structure for `user_comment`
-- ----------------------------
DROP TABLE IF EXISTS `user_comment`;
CREATE TABLE `user_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_type` varchar(64) NOT NULL COMMENT '评论类型  shops  or material etc',
  `comment_id` int(32) NOT NULL COMMENT '评论的目标id',
  `comment_user` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '评论人id',
  `comment_time` datetime NOT NULL COMMENT '评论时间',
  `comment_text` varchar(255) NOT NULL COMMENT '评论内容',
  `show_status` int(16) NOT NULL DEFAULT '0' COMMENT '0 显示  1 ，删除',
  `comment_like` int(32) NOT NULL DEFAULT '0' COMMENT '评论点赞',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `comment_user` (`comment_user`) USING BTREE,
  CONSTRAINT `comment_user` FOREIGN KEY (`comment_user`) REFERENCES `user` (`openid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user_comment
-- ----------------------------
INSERT INTO `user_comment` VALUES ('1', 'shops', '1', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-26 21:22:42', '评论', '0', '2');
INSERT INTO `user_comment` VALUES ('2', 'shops', '1', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-25 21:23:06', '发的发的撒', '0', '1');
INSERT INTO `user_comment` VALUES ('3', 'material', '1', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-17 21:23:31', 'dfadsfsa ', '0', '2');
INSERT INTO `user_comment` VALUES ('4', 'shops', '2', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-29 20:08:16', '8.08', '0', '1');
INSERT INTO `user_comment` VALUES ('5', 'shops', '1', 'sst', '2018-10-29 23:43:16', '就是现在', '0', '1');
INSERT INTO `user_comment` VALUES ('6', 'shops', '1', 'sst', '2018-10-29 23:43:18', '就是现在', '0', '0');
INSERT INTO `user_comment` VALUES ('7', 'shops', '1', 'sst', '2018-10-29 23:43:21', '就是现在', '0', '1');
INSERT INTO `user_comment` VALUES ('8', 'undefined', '1', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-29 23:51:27', '评论', '0', '0');
INSERT INTO `user_comment` VALUES ('9', 'shops', '1', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-29 23:53:52', '多以做你自己吧', '0', '1');
INSERT INTO `user_comment` VALUES ('10', 'shops', '1', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-29 23:59:09', '【我正在PK人气赢能量，快来为我点赞】，復·制这段描述￥bCgQb7iLpLP￥后咑閞?手机淘宝?或者用浏览器咑閞http://m.jevwv.top/h.3jsqO8p 查看', '0', '1');
INSERT INTO `user_comment` VALUES ('11', 'shops', '1', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-29 23:59:29', '暴力犯罪要受到严惩。', '0', '1');
INSERT INTO `user_comment` VALUES ('12', 'shops', '1', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-30 00:09:50', 'hahahhah键盘输入时触发，event.detail = {value, cursor, key', '0', '0');
INSERT INTO `user_comment` VALUES ('13', 'shops', '9', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-30 17:24:31', '精彩，我能摸你的皮卡丘嘛？？', '0', '2');
INSERT INTO `user_comment` VALUES ('14', 'shops', '8', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-30 17:29:37', '啦啦啦啦啦', '0', '1');
INSERT INTO `user_comment` VALUES ('15', 'shops', '9', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-30 23:28:46', 'pi ka duo', '0', '0');
INSERT INTO `user_comment` VALUES ('16', 'lost', '14', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-31 10:13:05', '这都丢了，真刺激', '0', '1');
INSERT INTO `user_comment` VALUES ('17', 'lost', '18', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-31 10:47:26', 'hu啦啦啦啦', '0', '3');
INSERT INTO `user_comment` VALUES ('18', 'shops', '1', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-31 10:49:42', '就是现在', '0', '0');
INSERT INTO `user_comment` VALUES ('19', 'lost', '2', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-11-05 22:57:04', '什么嘛', '0', '1');
INSERT INTO `user_comment` VALUES ('20', 'lost', '2', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-11-05 22:57:10', '什么嘛? ? ? ? ? ', '0', '0');
INSERT INTO `user_comment` VALUES ('21', 'lost', '5', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-11-05 22:58:31', '姑姑姑姑? ? ? ? ? ', '0', '0');
INSERT INTO `user_comment` VALUES ('22', 'lost', '5', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-11-05 22:58:39', '姑姑姑姑? ? ? ? ? 【老铁，双11红I包今天你领了吗？我在这里每天都有三次抽奖，快', '0', '0');
INSERT INTO `user_comment` VALUES ('23', 'lost', '5', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-11-05 22:58:42', '姑姑姑姑? ? ? ? ? 【老铁，双11红I包今天你领了吗？我在这里每天都有三次抽奖，快', '0', '0');
INSERT INTO `user_comment` VALUES ('24', 'lost', '5', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-11-05 22:58:43', '姑姑姑姑? ? ? ? ? 【老铁，双11红I包今天你领了吗？我在这里每天都有三次抽奖，快', '0', '1');
INSERT INTO `user_comment` VALUES ('25', 'lost', '5', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-11-05 22:58:43', '姑姑姑姑? ? ? ? ? 【老铁，双11红I包今天你领了吗？我在这里每天都有三次抽奖，快', '0', '0');
INSERT INTO `user_comment` VALUES ('26', 'lost', '8', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-11-05 23:01:32', '啊哈', '0', '1');
INSERT INTO `user_comment` VALUES ('27', 'shops', '10', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-11-05 23:19:49', '1', '0', '0');
INSERT INTO `user_comment` VALUES ('28', 'lost', '18', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-11-13 18:09:20', '胡扯', '0', '1');
INSERT INTO `user_comment` VALUES ('29', 'lost', '18', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-11-16 22:33:51', 'aaaa', '0', '0');
INSERT INTO `user_comment` VALUES ('30', 'shops', '9', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-11-16 22:47:20', '?', '0', '0');
INSERT INTO `user_comment` VALUES ('31', 'passage', '1', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-11-17 00:10:33', 'sheming', '0', '1');
INSERT INTO `user_comment` VALUES ('32', 'passage', '2', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-11-17 10:38:35', '纳尼？？？？', '0', '0');
INSERT INTO `user_comment` VALUES ('33', 'passage', '4', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-11-17 17:30:17', '唉，心疼这个女的', '0', '1');
INSERT INTO `user_comment` VALUES ('34', 'passage', '5', 'oj74Q5Z_mbXJLtei2mhCkz_EXBKU', '2018-11-17 18:27:31', '海贼王', '0', '3');
INSERT INTO `user_comment` VALUES ('35', 'shops', '9', 'oj74Q5Z_mbXJLtei2mhCkz_EXBKU', '2018-11-17 18:29:48', '贼丑', '0', '1');
INSERT INTO `user_comment` VALUES ('36', 'shops', '8', 'oj74Q5Z_mbXJLtei2mhCkz_EXBKU', '2018-11-17 18:30:10', 'hhhhhh', '0', '0');
INSERT INTO `user_comment` VALUES ('37', 'passage', '5', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-11-20 00:49:59', '路飞哇', '0', '2');
INSERT INTO `user_comment` VALUES ('38', 'lost', '18', 'oj74Q5StOSo57H_ySEcCSbShZME0', '2018-11-20 00:51:06', 'undefined', '0', '0');
INSERT INTO `user_comment` VALUES ('39', 'passage', '6', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-11-20 00:56:44', '内容真实，引起不适? ? ', '0', '6');
INSERT INTO `user_comment` VALUES ('40', 'passage', '6', 'oj74Q5U5Fa0XZXSd9wdFFYqR4MS4', '2018-11-21 12:42:56', '！', '0', '3');
INSERT INTO `user_comment` VALUES ('41', 'passage', '5', 'oj74Q5dGUz5cXwDG9MKEosZnMKuo', '2018-11-21 13:14:34', '讽刺扶老人啊? ', '0', '1');
INSERT INTO `user_comment` VALUES ('42', 'passage', '5', 'oj74Q5dGUz5cXwDG9MKEosZnMKuo', '2018-11-21 13:14:35', '讽刺扶老人啊? ', '0', '1');
INSERT INTO `user_comment` VALUES ('43', 'lost', '21', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-11-21 13:31:13', '阔以', '0', '1');
INSERT INTO `user_comment` VALUES ('44', 'lost', '21', 'oj74Q5dGUz5cXwDG9MKEosZnMKuo', '2018-11-21 14:19:03', '调皮', '0', '1');
INSERT INTO `user_comment` VALUES ('45', 'passage', '5', 'oj74Q5Q5DVMyt4QQNwqN8YqaKVLk', '2018-11-22 13:59:24', '? ? ? ? ', '0', '1');
INSERT INTO `user_comment` VALUES ('46', 'passage', '5', 'oj74Q5Q5DVMyt4QQNwqN8YqaKVLk', '2018-11-22 13:59:25', '? ? ? ? ', '0', '0');
INSERT INTO `user_comment` VALUES ('47', 'passage', '5', 'oj74Q5Q5DVMyt4QQNwqN8YqaKVLk', '2018-11-22 13:59:25', '? ? ? ? ', '0', '0');
INSERT INTO `user_comment` VALUES ('48', 'passage', '5', 'oj74Q5Q5DVMyt4QQNwqN8YqaKVLk', '2018-11-22 13:59:38', '哈哈哈，嘻嘻嘻', '0', '0');
INSERT INTO `user_comment` VALUES ('49', 'passage', '5', 'oj74Q5Q5DVMyt4QQNwqN8YqaKVLk', '2018-11-22 13:59:39', '哈哈哈，嘻嘻嘻', '0', '0');
INSERT INTO `user_comment` VALUES ('50', 'passage', '5', 'oj74Q5auNejSFm-vfrTZNYnWyvCQ', '2018-11-22 22:50:03', '? ? ? ? 人间啊', '0', '0');
INSERT INTO `user_comment` VALUES ('51', 'passage', '5', 'oj74Q5auNejSFm-vfrTZNYnWyvCQ', '2018-11-22 22:50:04', '? ? ? ? 人间啊', '0', '0');
INSERT INTO `user_comment` VALUES ('52', 'passage', '5', 'oj74Q5auNejSFm-vfrTZNYnWyvCQ', '2018-11-22 22:50:06', '? ? ? ? 人间啊', '0', '0');
INSERT INTO `user_comment` VALUES ('53', 'lost', '22', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-11-24 23:22:10', '我好久前见过它。。应该就是这只仓鼠', '0', '4');
INSERT INTO `user_comment` VALUES ('54', 'passage', '6', 'oj74Q5Q5DVMyt4QQNwqN8YqaKVLk', '2018-11-24 23:27:32', '内容真实，', '0', '0');
INSERT INTO `user_comment` VALUES ('55', 'lost', '22', 'oj74Q5dGUz5cXwDG9MKEosZnMKuo', '2018-11-25 10:08:09', '我想它已经回到大自然母亲的怀抱了！', '0', '1');
INSERT INTO `user_comment` VALUES ('56', 'passage', '6', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-11-25 23:00:17', '唉，，，，产品经理是最无知的', '0', '0');
INSERT INTO `user_comment` VALUES ('57', 'lost', '22', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-11-25 23:26:55', '能显示啊。。。。', '0', '2');
INSERT INTO `user_comment` VALUES ('58', 'passage', '6', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-11-26 00:14:57', '了7号号太沟通酷拉皮卡天苦海5级 抽后天考试拒绝后期', '0', '0');
INSERT INTO `user_comment` VALUES ('59', 'passage', '6', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-11-26 00:16:26', 'aaaaaaaa', '0', '0');
INSERT INTO `user_comment` VALUES ('60', 'passage', '6', 'oj74Q5cx0nIWH6YK-O3g29hetZ6E', '2018-11-26 00:32:26', '', '0', '0');
INSERT INTO `user_comment` VALUES ('61', 'lost', '22', 'oj74Q5eh_vTe_4q2VuHv8csNEdGE', '2018-11-26 21:41:01', '被烤了吃了', '0', '1');
INSERT INTO `user_comment` VALUES ('62', 'lost', '22', 'oj74Q5eh_vTe_4q2VuHv8csNEdGE', '2018-11-26 21:41:02', '被烤了吃了', '0', '1');
INSERT INTO `user_comment` VALUES ('63', 'passage', '6', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-11-28 11:09:29', '新版更新。。。', '0', '0');
INSERT INTO `user_comment` VALUES ('64', 'lost', '22', 'oj74Q5eG3bOWHwalqHRpLkMnvpSY', '2018-11-28 17:48:54', '楼上有毒吧', '0', '1');
INSERT INTO `user_comment` VALUES ('65', 'lost', '22', 'oj74Q5eG3bOWHwalqHRpLkMnvpSY', '2018-11-28 17:48:55', '楼上有毒吧', '0', '1');
INSERT INTO `user_comment` VALUES ('66', 'passage', '7', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-12-05 16:21:16', '哇⊙ω⊙，23.2元，好码，保存了！', '0', '3');
INSERT INTO `user_comment` VALUES ('67', 'passage', '7', 'oj74Q5dGUz5cXwDG9MKEosZnMKuo', '2018-12-05 17:38:20', '这个二维码来的猝不及防', '0', '1');
INSERT INTO `user_comment` VALUES ('68', 'passage', '7', 'oj74Q5eh_vTe_4q2VuHv8csNEdGE', '2018-12-05 20:00:12', '哇  扫了60多 不错不错！', '0', '1');
INSERT INTO `user_comment` VALUES ('69', 'passage', '6', 'oj74Q5auNejSFm-vfrTZNYnWyvCQ', '2018-12-06 22:53:33', '人生', '0', '0');
INSERT INTO `user_comment` VALUES ('70', 'passage', '7', 'oj74Q5auNejSFm-vfrTZNYnWyvCQ', '2018-12-06 23:00:04', '。。。你们都这么牛掰的吗。。。为啥我的就0.63', '0', '0');
INSERT INTO `user_comment` VALUES ('71', 'passage', '7', 'oj74Q5Q5DVMyt4QQNwqN8YqaKVLk', '2018-12-07 12:56:58', '被风筝追的人，你是秀儿嘛', '0', '0');
INSERT INTO `user_comment` VALUES ('72', 'passage', '6', 'oj74Q5Z_mbXJLtei2mhCkz_EXBKU', '2018-12-08 13:37:36', 'saoshitao', '0', '0');
INSERT INTO `user_comment` VALUES ('73', 'passage', '6', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-12-13 17:44:47', '', '0', '1');
INSERT INTO `user_comment` VALUES ('74', 'shops', '11', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-12-13 17:52:06', '好? ', '0', '0');
DROP TRIGGER IF EXISTS `auto_add_like`;
DELIMITER ;;
CREATE TRIGGER `auto_add_like` AFTER INSERT ON `comment_like` FOR EACH ROW UPDATE user_comment SET comment_like = (SELECT COUNT(*) FROM comment_like WHERE comment_id = new.comment_id AND like_status = 0) WHERE id = new.comment_id
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `auto_change_like`;
DELIMITER ;;
CREATE TRIGGER `auto_change_like` AFTER UPDATE ON `comment_like` FOR EACH ROW UPDATE user_comment SET comment_like = (SELECT COUNT(*) FROM comment_like WHERE comment_id = NEW.comment_id AND like_status = 0) WHERE id = NEW.comment_id
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `auto_change_like_delete`;
DELIMITER ;;
CREATE TRIGGER `auto_change_like_delete` AFTER DELETE ON `comment_like` FOR EACH ROW UPDATE user_comment SET comment_like = (SELECT COUNT(*) FROM comment_like WHERE comment_id = old.comment_id AND like_status = 0) WHERE id = old.comment_id
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `kindsSumAdd`;
DELIMITER ;;
CREATE TRIGGER `kindsSumAdd` AFTER INSERT ON `material` FOR EACH ROW UPDATE material_kinds SET quantity =( SELECT COUNT(*) FROM material WHERE kinds = NEW.kinds AND show_status=0 ) WHERE kinds = NEW.kinds
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `autoadd_quantity`;
DELIMITER ;;
CREATE TRIGGER `autoadd_quantity` AFTER INSERT ON `shops` FOR EACH ROW BEGIN
UPDATE shops_kinds SET quantity = quantity+1 WHERE NEW.shop_type = shops_kinds.kinds;

END
;;
DELIMITER ;
