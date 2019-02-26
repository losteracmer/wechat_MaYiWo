/*
 Navicat MySQL Data Transfer

 Source Server         : localConnection
 Source Server Type    : MySQL
 Source Server Version : 50539
 Source Host           : localhost:3306
 Source Schema         : mayiwo

 Target Server Type    : MySQL
 Target Server Version : 50539
 File Encoding         : 65001

 Date: 20/11/2018 00:22:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_options
-- ----------------------------
DROP TABLE IF EXISTS `admin_options`;
CREATE TABLE `admin_options`  (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `icon` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `color` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `limit` int(32) NOT NULL,
  `show_status` int(32) NOT NULL DEFAULT 0,
  `show_top` int(32) NOT NULL DEFAULT 0,
  PRIMARY KEY (`option_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_options
-- ----------------------------
INSERT INTO `admin_options` VALUES (1, 'swiper设置', '/pages/admin/swiper/swiper', 'icon-kanguos', '#E88024', 1, 0, 0);
INSERT INTO `admin_options` VALUES (2, '失物招领模块', '/pages/admin/lost/lost', 'icon-zidingyi', '#30C934', 2, 0, 0);
INSERT INTO `admin_options` VALUES (3, '学习资料模块', '/pages/admin/addmaterial/addmaterial', 'icon-xuexiziliao', '#53A3E9', 3, 0, 0);
INSERT INTO `admin_options` VALUES (4, '品牌商家模块', '/pages/admin/shops/shops', 'icon-pinpaishangjia', '#FE927D', 4, 0, 0);
INSERT INTO `admin_options` VALUES (5, '兼职家教模块', '/pages/admin/job/job', 'icon-shangmenjiajiao', '#D4ABE0', 5, 0, 0);
INSERT INTO `admin_options` VALUES (6, '首页文章模块', '/pages/admin/passage/passage', 'icon-icon_wangye', '#2EC0EB', 6, 0, 0);

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins`  (
  `account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `temporarycode` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '临时码',
  `authority` int(64) NOT NULL DEFAULT 0 COMMENT '权限 二进制',
  PRIMARY KEY (`account`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('sst', 'RUJYbUloekU=M2NmZjRjNWVjMjAzNWM1ZWE0YWFiMmNmMjc1MWJhMmM=', 'w6w16aEbKnZZEWul', 255);

-- ----------------------------
-- Table structure for comment_like
-- ----------------------------
DROP TABLE IF EXISTS `comment_like`;
CREATE TABLE `comment_like`  (
  `comment_id` int(32) NOT NULL,
  `like_user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `like_time` datetime NOT NULL,
  `like_status` int(16) NOT NULL DEFAULT 0 COMMENT '0 为正常赞 1 为取消赞',
  PRIMARY KEY (`comment_id`, `like_user`) USING BTREE,
  INDEX `user`(`like_user`) USING BTREE,
  CONSTRAINT `comment_id` FOREIGN KEY (`comment_id`) REFERENCES `user_comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user` FOREIGN KEY (`like_user`) REFERENCES `user` (`openid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of comment_like
-- ----------------------------
INSERT INTO `comment_like` VALUES (1, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-29 20:57:49', 0);
INSERT INTO `comment_like` VALUES (1, 'sst', '2018-10-17 20:10:02', 0);
INSERT INTO `comment_like` VALUES (2, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-29 20:54:58', 0);
INSERT INTO `comment_like` VALUES (3, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-26 19:34:40', 0);
INSERT INTO `comment_like` VALUES (3, 'sst', '2018-10-29 20:48:54', 0);
INSERT INTO `comment_like` VALUES (4, 'sst', '2018-10-29 20:46:48', 0);
INSERT INTO `comment_like` VALUES (5, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-29 23:51:22', 0);
INSERT INTO `comment_like` VALUES (6, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-29 23:53:59', 1);
INSERT INTO `comment_like` VALUES (7, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-29 23:53:58', 0);
INSERT INTO `comment_like` VALUES (9, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-29 23:53:57', 0);
INSERT INTO `comment_like` VALUES (10, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-29 23:59:54', 0);
INSERT INTO `comment_like` VALUES (11, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-30 00:00:11', 0);
INSERT INTO `comment_like` VALUES (13, 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-11-17 17:41:22', 0);
INSERT INTO `comment_like` VALUES (13, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-30 17:24:59', 0);
INSERT INTO `comment_like` VALUES (14, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-11-05 23:08:48', 0);
INSERT INTO `comment_like` VALUES (15, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-30 23:41:31', 1);
INSERT INTO `comment_like` VALUES (16, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-31 10:13:07', 0);
INSERT INTO `comment_like` VALUES (17, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-11-13 18:09:12', 0);
INSERT INTO `comment_like` VALUES (19, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-11-05 22:57:12', 0);
INSERT INTO `comment_like` VALUES (22, 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-11-17 18:23:26', 1);
INSERT INTO `comment_like` VALUES (24, 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-11-17 18:23:36', 1);
INSERT INTO `comment_like` VALUES (24, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-11-13 23:34:03', 0);
INSERT INTO `comment_like` VALUES (26, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-11-05 23:01:35', 0);
INSERT INTO `comment_like` VALUES (28, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-11-13 18:09:22', 0);
INSERT INTO `comment_like` VALUES (31, 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-11-17 00:10:37', 0);
INSERT INTO `comment_like` VALUES (33, 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-11-17 17:31:19', 0);
INSERT INTO `comment_like` VALUES (34, 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-11-20 00:14:02', 0);
INSERT INTO `comment_like` VALUES (34, 'oj74Q5Z_mbXJLtei2mhCkz_EXBKU', '2018-11-17 18:27:33', 0);
INSERT INTO `comment_like` VALUES (35, 'oj74Q5Z_mbXJLtei2mhCkz_EXBKU', '2018-11-17 18:29:52', 0);

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback`  (
  `openid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提交人id',
  `text` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '这才是重点',
  `subtime` datetime NULL DEFAULT NULL COMMENT '提交时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES ('oj74Q5QxZpH8TzLIemQTZwokJ3uc', '不行', '2018-11-20 00:06:48');

-- ----------------------------
-- Table structure for home_modules
-- ----------------------------
DROP TABLE IF EXISTS `home_modules`;
CREATE TABLE `home_modules`  (
  `module_id` int(32) NOT NULL,
  `text` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `navi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '跳转路径',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'iconfont',
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '颜色',
  `show_status` int(32) NOT NULL DEFAULT 0,
  PRIMARY KEY (`module_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of home_modules
-- ----------------------------
INSERT INTO `home_modules` VALUES (1, '失物招领', '../../pages/lost/lost', 'icon-shiwuzhaoling', '#04E2BA', 0);
INSERT INTO `home_modules` VALUES (2, '兼职家教', '../../pages/job/job', 'icon-shangmenjiajiao', '#D4ABE0', 0);
INSERT INTO `home_modules` VALUES (3, '品牌商家', '../../pages/shops/shops', 'icon-shangjia', '#FE927D', 0);
INSERT INTO `home_modules` VALUES (4, '学习资料', '../../pages/material/material', 'icon-xuexiziliao', '#53A3E9', 2);
INSERT INTO `home_modules` VALUES (5, '校园公益', '../../pages/unfinish/unfinish', 'icon-gongyi', '#21F084', 1);
INSERT INTO `home_modules` VALUES (6, '租房工作', '../../pages/unfinish/unfinish', 'icon-zufangyuechifangzixianxing', '#F2A330', 1);

-- ----------------------------
-- Table structure for home_swiper
-- ----------------------------
DROP TABLE IF EXISTS `home_swiper`;
CREATE TABLE `home_swiper`  (
  `swiperid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'swiper',
  `src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片地址',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'page url',
  `text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示的text',
  `pagetype` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '页面类型，获取评论等',
  `id` int(32) NULL DEFAULT NULL COMMENT '页面id',
  `show_status` int(16) NOT NULL DEFAULT 0 COMMENT '0 显示 1 隐藏',
  PRIMARY KEY (`swiperid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of home_swiper
-- ----------------------------
INSERT INTO `home_swiper` VALUES (1, '/images/1540460934481-IkrJTM-.jpg', '/pages/lost/detail/detail', '测试swiper', 'lost', 18, 0);
INSERT INTO `home_swiper` VALUES (2, '/images/1541161147977-dqioUb-.jpg', '/pages/shops/detail/detail', '', 'shops', 8, 0);
INSERT INTO `home_swiper` VALUES (5, '/images/1541430795619-wM7FAO-.jpg', ' ', '卖二手键盘', ' ', 1, 1);

-- ----------------------------
-- Table structure for job
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job`  (
  `job_id` int(32) NOT NULL AUTO_INCREMENT,
  `publish_time` datetime NOT NULL COMMENT '发布时间',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '显示的标题',
  `job_location` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '开封' COMMENT '位置，开封，郑州等',
  `job_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '具体位置',
  `job_kind` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工作类型  \r\n钟点工\r\n服务员\r\n网络营销\r\n安保\r\n传单派发\r\n软件开发/测试/优化\r\n文档处理/PS修图/视频剪辑\r\n游戏代练\r\n家教\r\n翻译\r\n校园代理\r\n',
  `job_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '未指定' COMMENT '工作时间   日期段，或者 周一， 周二',
  `job_wage` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '面谈' COMMENT '工资   例如 100/天   1200/月   面谈',
  `job_wage_kind` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '未说明' COMMENT '工资结算类型  日结  月结  阶段结算',
  `job_indate` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '有效期  长期有效  或  十月一前',
  `job_brief` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工作需求介绍',
  `job_mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '未知' COMMENT '商家联系方式',
  `show_status` int(16) NOT NULL DEFAULT 0 COMMENT '展示状态',
  `show_top` int(16) NOT NULL DEFAULT 0 COMMENT '展示序列',
  `browse_sum` int(32) NOT NULL DEFAULT 0 COMMENT '浏览次数',
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO `job` VALUES (1, '2018-11-06 23:17:17', '毕业设计', '开封', '鼓楼区', '编程', '周末', '100/次', '次结', '永久有效', '河南社富哦好副科级爱疯狂减肥房间爱咖啡放假了打瞌睡分类打发啊速度快放假安联大厦开发', '110', 0, 0, 14);
INSERT INTO `job` VALUES (2, '2018-11-06 23:17:17', '带写代码', '开封', '鼓楼区', '编程', '周末', '100/次', '次结', '双十一之前', '河南社富哦好副科级爱疯狂减肥房间爱咖啡放假了打瞌睡分类打发啊速度快放假安联大厦开发', '110', 0, 0, 6);
INSERT INTO `job` VALUES (3, '2018-11-07 05:17:17', '跑腿服务', '开封', '河南大学', '代理', '全天', '薪资面谈', '月结', '长期有效', '河南社富哦好副科级爱疯狂减肥房间爱咖啡放假了打瞌睡分类打发啊速度快放假安联大厦开发', '110', 0, 0, 15);
INSERT INTO `job` VALUES (4, '2018-11-13 17:46:25', '招聘家教', '开封', '西部', '家教', '全天', '30/小时', '次结', '长期有效', '辅导一个中学生，语文数学', '13145454844', 0, 0, 7);
INSERT INTO `job` VALUES (6, '2018-11-19 23:42:19', '添加数据', '意大利', '模拟', '游戏试玩', '周末', '100、day', '此结', '长期有效', '能玩，就来', '呵呵，怎么肯能有这样的好事', 0, 0, 0);

-- ----------------------------
-- Table structure for job_apply
-- ----------------------------
DROP TABLE IF EXISTS `job_apply`;
CREATE TABLE `job_apply`  (
  `apply_id` int(32) NOT NULL AUTO_INCREMENT,
  `job_id` int(32) NOT NULL,
  `apply_time` datetime NOT NULL COMMENT '申请时间',
  `apply_user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请人',
  `apply_status` int(32) NOT NULL DEFAULT 0 COMMENT '申请状态  0 正常状态  1 删除状态',
  PRIMARY KEY (`apply_id`) USING BTREE,
  INDEX `apply_user`(`apply_user`) USING BTREE,
  INDEX `apply_job`(`job_id`) USING BTREE,
  CONSTRAINT `apply_user` FOREIGN KEY (`apply_user`) REFERENCES `user` (`openid`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `apply_job` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of job_apply
-- ----------------------------
INSERT INTO `job_apply` VALUES (1, 1, '2018-11-13 11:09:53', 'sst', 0);
INSERT INTO `job_apply` VALUES (2, 1, '2018-11-13 11:09:56', 'sst', 0);
INSERT INTO `job_apply` VALUES (3, 3, '2018-11-13 11:34:26', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 0);
INSERT INTO `job_apply` VALUES (4, 4, '2018-11-19 00:16:58', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', 0);
INSERT INTO `job_apply` VALUES (5, 2, '2018-11-19 00:21:37', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', 0);
INSERT INTO `job_apply` VALUES (6, 1, '2018-11-19 00:21:44', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', 0);
INSERT INTO `job_apply` VALUES (7, 1, '2018-11-19 00:21:48', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', 0);

-- ----------------------------
-- Table structure for lostsandfinds
-- ----------------------------
DROP TABLE IF EXISTS `lostsandfinds`;
CREATE TABLE `lostsandfinds`  (
  `id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `publish_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lost_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类型  lost  丢  find 捡到',
  `publish_time` datetime NULL DEFAULT NULL COMMENT '发布时间',
  `address_longitude` double(32, 6) NULL DEFAULT NULL COMMENT '经度',
  `address_latitude` double(32, 6) NULL DEFAULT NULL COMMENT '维度',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `detail` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细内容',
  `images` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片',
  `kinds` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '丢失物品类型',
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `item_status` int(16) NOT NULL DEFAULT 0 COMMENT '0 刚发布  1 物归原主',
  `show_status` int(16) NOT NULL DEFAULT 0 COMMENT '0 show  1 delete',
  `show_top` int(16) NOT NULL DEFAULT 0 COMMENT '显示顺序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of lostsandfinds
-- ----------------------------
INSERT INTO `lostsandfinds` VALUES (1, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'lost', '2018-10-18 20:18:33', 0.000000, 0.000000, '', 'a', 'aadfa', '{\"images\":[\"/images/1539865112968-4tPV1V-.jpg\"]}', '数码', 'aaa', 0, 1, 0);
INSERT INTO `lostsandfinds` VALUES (2, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'lost', '2018-10-18 20:20:24', 0.000000, 0.000000, '', 'aaa', 'aaaa', '{\"images\":[\"/images/1539865224357-xUfBU6-.jpg\"]}', '证件', '1121212', 0, 1, 0);
INSERT INTO `lostsandfinds` VALUES (3, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'find', '2018-10-18 20:21:15', 0.000000, 0.000000, '', 'aaa', 'aaaaaaa', '{\"images\":[]}', '卡片', 'fda', 0, 0, 0);
INSERT INTO `lostsandfinds` VALUES (4, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'lost', '2018-10-18 20:21:34', 0.000000, 0.000000, '', 'dfadf', 'fadfaf', '{\"images\":[\"/images/1539865294223-zzT9iF-.jpg\"]}', '证件', 'afsdff', 0, 0, 0);
INSERT INTO `lostsandfinds` VALUES (5, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'lost', '2018-10-18 21:16:38', 0.000000, 0.000000, '', '震惊！！！！！', '某大学宿舍一钢铁直男，在三个室友帮助下，丢了贞操？？？', '{\"images\":[\"/images/1539868598358-MmaEoQ-.jpg\"]}', '其他', '1101100', 0, 0, 0);
INSERT INTO `lostsandfinds` VALUES (6, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'lost', '2018-10-18 21:28:45', 0.000000, 0.000000, '', '寻找物品', '女朋友找不到了', '{\"images\":[]}', '其他', '111', 0, 1, 0);
INSERT INTO `lostsandfinds` VALUES (7, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'find', '2018-10-18 21:30:20', 0.000000, 0.000000, '', '？？？？', 'FUCK U', '{\"images\":[\"/images/1539869420063-y2v9EY-.jpg\"]}', '卡片', '111', 0, 1, 0);
INSERT INTO `lostsandfinds` VALUES (8, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'find', '2018-10-18 22:00:41', 114.354610, 34.815680, '河南省开封市龙亭区体育路16号', '没毛病', '老铁', '{\"images\":[\"/images/1539871241590-gOJXw4-.jpg\"]}', '证件', '1314800', 0, 0, 0);
INSERT INTO `lostsandfinds` VALUES (9, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'lost', '2018-10-18 22:01:01', 0.000000, 0.000000, '', '121212', '121212', '{\"images\":[\"/images/1539871261510-3uqe29-.jpg\"]}', '卡片', '1', 0, 0, 0);
INSERT INTO `lostsandfinds` VALUES (10, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'find', '2018-10-18 22:01:18', 0.000000, 0.000000, '', '哈哈哈', '放散阀', '{\"images\":[\"/images/1539871278766-2V6eN0-.jpg\"]}', '卡片', '啊发发', 0, 0, 0);
INSERT INTO `lostsandfinds` VALUES (11, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'find', '2018-10-18 22:01:53', 114.353800, 34.817460, '河南省开封市龙亭区铁塔西街9号院', 'what？', 'fuck?????', '{\"images\":[\"/images/1539871313611-jFsvtf-.jpg\"]}', '卡片', 'aaaa', 0, 0, 0);
INSERT INTO `lostsandfinds` VALUES (12, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'lost', '2018-10-18 22:02:19', 0.000000, 0.000000, '', '嘿嘿嘿', '哈哈哈哈', '{\"images\":[\"/images/1539871338905-hgnJ9p-.jpg\"]}', '数码', '啊啊啊啊', 0, 0, 0);
INSERT INTO `lostsandfinds` VALUES (13, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'lost', '2018-10-18 22:04:06', 0.000000, 0.000000, '', '全都是', '泡沫', '{\"images\":[\"/images/1539871446523-fpWoMD-.jpg\"]}', '箱包', '120', 0, 1, 0);
INSERT INTO `lostsandfinds` VALUES (14, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'lost', '2018-10-18 22:04:40', 0.000000, 0.000000, '', '热爱', '大佬群', '{\"images\":[\"/images/1539871480072-pGxAPr-.jpg\"]}', '数码', '150', 0, 0, 0);
INSERT INTO `lostsandfinds` VALUES (15, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'find', '2018-10-19 09:09:31', 0.000000, 0.000000, '', 'CSS3使用了层叠样式表技术，可以对网页布局、字体、颜色、背景灯效果做出控制。css3作为css的进阶版，拆分和增加了盒子模型、列表模块、语言模块 、背景边框 、文字特效 、多栏布局等等。', 'CSS3使用了层叠样式表技术，可以对网页布局、字体、颜色、背景灯效果做出控制。css3作为css的进阶版，拆分和增加了盒子模型、列表模块、语言模块 、背景边框 、文字特效 、多栏布局等等。CSS3使用了层叠样式表技术，可以对网页布局、字体、颜色、背景灯效果做出控制。css3作为css的进阶版，拆分和增加了盒子模型、列表模块、语言模块 、背景边框 、文字特效 、多栏布局等等。CSS3使用了层叠样式表技术，可以对网页布局、字体、颜色、背景灯效果做出控制。css3作为css的进阶版，拆分和增加了盒子模型、列表模块、语言模块 、背景边框 、文字特效 、多栏布局等等。CSS3使用了层叠样式表技术，可以对', '{\"images\":[]}', '书籍', '哎哎哎啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', 0, 0, 0);
INSERT INTO `lostsandfinds` VALUES (16, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'find', '2018-10-19 10:30:18', 0.000000, 0.000000, '', '哎哎哎', '发打发打发', '{\"images\":[\"/images/1539916218494-wTGIfn-.jpg\"]}', '数码', '112', 0, 0, 0);
INSERT INTO `lostsandfinds` VALUES (17, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'find', '2018-10-19 19:49:16', 0.000000, 0.000000, '', '乱七八糟的代码', 'you can provide attr \"wx:key\" for a \"wx:for\" to improve performance.\n   5 |         <view class=\'msg_type\'>类型:</view>\n   6 |         <radio-group class=\"group  flex_row_left\" bindchange=\"radioChange\">\n>  7 |             <view class=\"label-2\" wx:for=\"{{radioItems}}\">\n     |              ^\n   8 |     ', '{\"images\":[\"/images/1539949756374-9pzTDa-.jpg\",\"/images/1539949756408-aOQ1WE-.jpg\",\"/images/1539949756412-x7Uxk8-.jpg\",\"/images/1539949756428-cXeXL1-.jpg\"]}', '数码', 'QQ 445247721', 0, 1, 0);
INSERT INTO `lostsandfinds` VALUES (18, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'lost', '2018-10-19 19:57:26', 114.353800, 34.817460, '河南省开封市龙亭区铁塔西街9号院', '今天是你的生日', '今天是您的生日，我的祖国母亲 听，鸟儿飞翔欢歌 礼花隆隆祝贺 看，蓝天白云分外明媚 山川大地何其娇娆明艳 飘扬的五星红旗烈烈掌声潮起潮落 江南邈邈秀水霓裳舞曲妙漫现 北国万里山川雄姿勃发迤逦展 黄河今天是您的生日，我的祖国母亲 听，鸟儿飞翔欢歌 礼花隆隆祝贺 看，蓝天白云分外明媚 山川大地何其娇娆明艳 飘扬的五星红旗烈烈掌声潮起潮落 江南邈邈秀水霓裳舞曲妙漫现 北国万里山川雄姿勃发迤逦展 黄河今天是您的生日，我的祖国母亲 听，鸟儿飞翔欢歌 礼花隆隆祝贺 看，蓝天白云分外明媚 山川大地何其娇娆明艳 飘扬的五星红旗烈烈掌声潮起潮落 江南邈邈秀水霓裳舞曲妙漫现 北国万里山川雄姿勃发迤逦展 黄河今天是', '{\"images\":[\"/images/1539950246225-XmAtHX-.jpg\",\"/images/1539950246238-2TuiQk-.jpg\",\"/images/1539950246258-mJ7Y4j-.jpg\",\"/images/1539950246270-TxYUyr-.jpg\"]}', '书籍', '他没有留下联系方式', 0, 0, 2);
INSERT INTO `lostsandfinds` VALUES (19, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'find', '2018-11-05 23:04:26', 114.309670, 34.812527, '河南省开封市龙亭区东京大道', '不多说，上图', '为加深我ACM团队成员凝聚力，提高团队团结精神，拉进16，17级现役/退役队员之间的感情，还有为庆祝ig取得总决赛完胜，小龙队icpc青岛铜牌，在下周四晚，把大家聚在一起共进晚宴，届时会探讨团队未来的新的发展方向，希望能来的尽量来，考虑到去老区授课的同学，地点可能在老区。周四能来的人提前给我说一声，好统计人数订餐。', '{\"images\":[\"/images/1541430266523-8qATRQ-.jpg\"]}', '证件', '110', 0, 0, 0);
INSERT INTO `lostsandfinds` VALUES (20, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'lost', '2018-11-05 23:06:05', 0.000000, 0.000000, '', '空白', '  ', '{\"images\":[]}', '卡片', '  ', 0, 1, 0);

-- ----------------------------
-- Table structure for map_label
-- ----------------------------
DROP TABLE IF EXISTS `map_label`;
CREATE TABLE `map_label`  (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `latitude` double(32, 8) NOT NULL COMMENT '维度',
  `longtitude` double(32, 8) NOT NULL COMMENT '经度',
  `iconPath` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '/image/mayiwo2.png' COMMENT '图标',
  `content` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'label标记',
  `fontSize` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '10rpx' COMMENT 'label字体大小',
  `textAlign` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'center' COMMENT '位置',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for material
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material`  (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `publish_time` datetime NOT NULL COMMENT '发布时间',
  `publish_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发布人',
  `detail` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '简介json',
  `link` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '资源链接',
  `brief` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容  可能包含连接',
  `kinds` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '其他' COMMENT '资源类别',
  `show_status` int(16) NOT NULL DEFAULT 0 COMMENT '显示状态  0 显示  1 删除',
  `save_num` int(32) NOT NULL DEFAULT 0 COMMENT '保存次数',
  `show_publish` int(4) NOT NULL DEFAULT 1 COMMENT '1 表示展示  0 表示隐藏',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `kinds`(`kinds`) USING BTREE,
  CONSTRAINT `kinds` FOREIGN KEY (`kinds`) REFERENCES `material_kinds` (`kinds`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of material
-- ----------------------------
INSERT INTO `material` VALUES (1, '苍老师教学视频', '2018-10-19 22:27:45', '正义的码农', 'www.baidu.com', '131313', '\'{title:苍;}\'', '其他', 0, 998, 1);
INSERT INTO `material` VALUES (2, '视频', '2018-10-20 18:50:41', '啊啊啊啊', '31231313', '13311313', '更大幅度', '其他', 0, 333, 1);
INSERT INTO `material` VALUES (3, 'aaaa', '2018-10-20 23:36:18', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', NULL, 'wwwww', 'ttttt', '其他', 1, 1, 1);
INSERT INTO `material` VALUES (4, 'aaaa', '2018-10-20 23:36:46', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', NULL, 'wwwww', 'ttttt', '其他', 0, 1, 1);
INSERT INTO `material` VALUES (5, 'aaate', '2018-10-20 23:37:34', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', NULL, 'rererer', 'rere', '其他', 1, 0, 1);
INSERT INTO `material` VALUES (6, 'aaate', '2018-10-20 23:38:29', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', NULL, 'rererer', 'rere\nfa\nd\nsaf\nasdf\nds\nf\ndf\n\nasf\nsad\nf\ns\ndf\nasdf\na\nsf\n', '其他', 0, 0, 1);
INSERT INTO `material` VALUES (7, '其他资源', '2018-10-21 22:50:22', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', NULL, 'http://www.baidu.com', '这是一份其他资源，呵呵呵这是一份其他资源，呵呵呵这是一份其他资源，呵呵呵这是一份其他资源，呵呵呵这是一份其他资源，呵呵呵这是一份其他资源，呵呵呵这是一份其他资源，呵呵呵这是一份其他资源，呵呵呵这是一份其他资源，呵呵呵', 'other', 0, 0, 1);
INSERT INTO `material` VALUES (8, '标题党', '2018-10-22 20:27:55', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', NULL, '11111', '哈哈哈哈哈哈哈哈哈哈', '其他', 0, 0, 1);
INSERT INTO `material` VALUES (9, '资料', '2018-10-25 18:18:39', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', NULL, 'www.baidu.com', '人们说，最优秀的总是将至未至；但是这一次，小米8就是小米迄今为止最卓越的一代产品。5月31日，小米年度旗舰发布会，更多新品，与你深圳见！', '其他', 0, 0, 1);
INSERT INTO `material` VALUES (10, '新添加', '2018-10-25 22:14:53', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', NULL, 'wwwww', '哈哈哈\n你好\n河南的', '其他', 0, 0, 1);
INSERT INTO `material` VALUES (11, 'buzhi', '2018-10-25 22:16:49', 'afdasfsdaf', NULL, 'adfasdfs', 'fafdsaf', '其他', 0, 0, 1);

-- ----------------------------
-- Table structure for material_kinds
-- ----------------------------
DROP TABLE IF EXISTS `material_kinds`;
CREATE TABLE `material_kinds`  (
  `kinds` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `quantity` int(32) NULL DEFAULT 0 COMMENT '数量',
  `icon` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'icon-xuekeziyuan',
  PRIMARY KEY (`kinds`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of material_kinds
-- ----------------------------
INSERT INTO `material_kinds` VALUES ('other', 1, 'icon-xuekeziyuan');
INSERT INTO `material_kinds` VALUES ('undefined', 0, 'icon-xuekeziyuan');
INSERT INTO `material_kinds` VALUES ('其他', 8, 'icon-xuekeziyuan');
INSERT INTO `material_kinds` VALUES ('政治', 0, 'icon-xuekeziyuan');
INSERT INTO `material_kinds` VALUES ('数学', 0, 'icon-shuxue1');
INSERT INTO `material_kinds` VALUES ('考研', 0, 'icon-xuekeziyuan');
INSERT INTO `material_kinds` VALUES ('英语', 0, 'icon-yingyu');
INSERT INTO `material_kinds` VALUES ('高中数学', 0, 'icon-xuekeziyuan');

-- ----------------------------
-- Table structure for passages
-- ----------------------------
DROP TABLE IF EXISTS `passages`;
CREATE TABLE `passages`  (
  `passage_id` int(32) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `imgurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片url',
  `publish_time` datetime NOT NULL,
  `publish_user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `detail` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'detail',
  `browse_sum` int(32) NOT NULL DEFAULT 0,
  `show_top` int(32) NOT NULL DEFAULT 0,
  `show_status` int(32) NOT NULL DEFAULT 0,
  PRIMARY KEY (`passage_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of passages
-- ----------------------------
INSERT INTO `passages` VALUES (1, '蚂蚁蜗成立', '/images/1540460934481-IkrJTM-.jpg', '2018-11-16 23:04:22', '', '{\"detail\":[{\"tp\":\"title\",\"text\":\"小米发布会\",\"time\":\"2018-10-25\",\"detailtime\":\"2018-10-25T10:24:09.940Z\",\"style\":\"\"},{\"tp\":\"image\",\"src\":\"/images/1540463058483-M4EXT1-.jpg\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"周大萌\\n哇哈哈哈\"},{\"tp\":\"image\",\"src\":\"/images/1540463085466-eOMFGo-.jpg\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"再放上一张图\"},{\"tp\":\"image\",\"src\":\"/images/1540463111560-ux5wCX-.jpg\",\"style\":\"\"},{\"tp\":\"image\",\"src\":\"/images/1540463117529-NVDYiN-.jpg\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"情\\n侣\\n头\\n像\"},{\"tp\":\"video\",\"src\":\"/images/1540463142689-sNC19i-.mp4\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"视频来一段\"}]}', 9, 0, 1);
INSERT INTO `passages` VALUES (2, '正则表达式', '/images/1541431117025-JxKKQu-.jpg', '2018-11-14 11:57:58', '', '{\"detail\":[{\"tp\":\"title\",\"text\":\"小米发布会\",\"time\":\"2018-10-25\",\"detailtime\":\"2018-10-25T10:24:09.940Z\",\"style\":\"\"},{\"tp\":\"image\",\"src\":\"/images/1540463058483-M4EXT1-.jpg\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"周大萌\\n哇哈哈哈\"},{\"tp\":\"image\",\"src\":\"/images/1540463085466-eOMFGo-.jpg\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"再放上一张图\"},{\"tp\":\"image\",\"src\":\"/images/1540463111560-ux5wCX-.jpg\",\"style\":\"\"},{\"tp\":\"image\",\"src\":\"/images/1540463117529-NVDYiN-.jpg\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"情\\n侣\\n头\\n像\"},{\"tp\":\"video\",\"src\":\"/images/1540463142689-sNC19i-.mp4\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"视频来一段\"}]}', 2, 0, 1);
INSERT INTO `passages` VALUES (3, '蚂蚁蜗成立', '/images/1540460934481-IkrJTM-.jpg', '2018-11-16 23:04:22', '', '{\"detail\":[{\"tp\":\"title\",\"text\":\"小米发布会\",\"time\":\"2018-10-25\",\"detailtime\":\"2018-10-25T10:24:09.940Z\",\"style\":\"\"},{\"tp\":\"image\",\"src\":\"/images/1540463058483-M4EXT1-.jpg\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"周大萌\\n哇哈哈哈\"},{\"tp\":\"image\",\"src\":\"/images/1540463085466-eOMFGo-.jpg\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"再放上一张图\"},{\"tp\":\"image\",\"src\":\"/images/1540463111560-ux5wCX-.jpg\",\"style\":\"\"},{\"tp\":\"image\",\"src\":\"/images/1540463117529-NVDYiN-.jpg\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"情\\n侣\\n头\\n像\"},{\"tp\":\"video\",\"src\":\"/images/1540463142689-sNC19i-.mp4\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"视频来一段\"}]}', 0, 0, 1);
INSERT INTO `passages` VALUES (4, '震惊！！！！', '/images/1542446394805-udyVdv-.jpg', '2018-11-17 17:27:24', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '{\"detail\":[{\"tp\":\"title\",\"text\":\"震惊！！！！！\",\"time\":\"2018-11-17\",\"detailtime\":\"2018-11-17T09:20:08.377Z\",\"style\":\"\"},{\"tp\":\"image\",\"src\":\"/images/1542446414084-epKMcS-.jpg\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"为了金钱，这个女子竟然做出这样的事\"}]}', 7, 0, 1);
INSERT INTO `passages` VALUES (5, '是他，是他，就是他', '/images/1542447213206-Qf4MrW-.jpg', '2018-11-17 17:36:01', 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '{\"detail\":[{\"tp\":\"image\",\"src\":\"/images/1542447291278-E7906N-.jpg\",\"style\":\"\"},{\"tp\":\"title\",\"text\":\"海贼王！！！\",\"time\":\"2018-11-17\",\"detailtime\":\"2018-11-17T09:35:00.902Z\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"你来，或者不来，我们都在这儿\",\"style\":\"color:#DB4520; font-size:1.3em;\"},{\"tp\":\"text\",\"text\":\"吾余一元，购糖，拐幼童，得六万，遂二千，寻风尘女子，事毕，迷之，取其肾，凑足十数，购得弹药，于银行，得五百万。 钱已有，以不愁身后之事，自觉坏事做绝，需改过，于午时遇一跌倒老者，遂扶之，剩八角。\"}]}', 19, 0, 0);

-- ----------------------------
-- Table structure for shops
-- ----------------------------
DROP TABLE IF EXISTS `shops`;
CREATE TABLE `shops`  (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `publish_time` datetime NOT NULL COMMENT '发布时间',
  `publish_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发布人',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `second_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '副标题',
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '详细内容',
  `imgurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `shop_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类型',
  `show_status` int(4) NOT NULL DEFAULT 0 COMMENT '0显示  1 删除',
  `show_top` int(32) NOT NULL DEFAULT 0 COMMENT '显示顺序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of shops
-- ----------------------------
INSERT INTO `shops` VALUES (8, '2018-10-25 17:51:10', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'aaa', '1212321', '{\"detail\":[{\"tp\":\"title\",\"text\":\"aaaaaaaa\",\"time\":\"2018-10-25\",\"detailtime\":\"2018-10-25T09:49:02.966Z\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"hahahaha\\nmix3\\n\\n列举\"},{\"tp\":\"image\",\"src\":\"/images/1540460956553-qeaqvG-.jpg\",\"style\":\"\"},{\"tp\":\"image\",\"src\":\"/images/1540461015729-FrtJHr-.jpg\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"小米发布会\\n哈哈哈哈\"}]}', '/images/1540460934481-IkrJTM-.jpg', '行', 1, 0);
INSERT INTO `shops` VALUES (9, '2018-10-25 18:27:00', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '当然是个吃货✧٩(ˊωˋ*)و✧', '十月25，小米发布会，来不来随你，但是，我去不了，哈哈哈', '{\"detail\":[{\"tp\":\"title\",\"text\":\"小米发布会\",\"time\":\"2018-10-25\",\"detailtime\":\"2018-10-25T10:24:09.940Z\",\"style\":\"\"},{\"tp\":\"image\",\"src\":\"/images/1540463058483-M4EXT1-.jpg\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"周大萌\\n哇哈哈哈\"},{\"tp\":\"image\",\"src\":\"/images/1540463085466-eOMFGo-.jpg\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"再放上一张图\"},{\"tp\":\"image\",\"src\":\"/images/1540463111560-ux5wCX-.jpg\",\"style\":\"\"},{\"tp\":\"image\",\"src\":\"/images/1540463117529-NVDYiN-.jpg\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"情\\n侣\\n头\\n像\"},{\"tp\":\"video\",\"src\":\"/images/1540463142689-sNC19i-.mp4\",\"style\":\"\"},{\"tp\":\"text\",\"text\":\"视频来一段\"}]}', '/images/1540462997138-nMeaiH-.jpg', '衣', 1, 0);
INSERT INTO `shops` VALUES (10, '2018-11-05 23:19:23', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '哈哈哈', '副标题啊', '{\"detail\":[{\"tp\":\"title\",\"text\":\"空白\",\"time\":\"\",\"detailtime\":\"2018-11-05T15:19:10.691Z\",\"style\":\"\"}]}', '/images/1541431117025-JxKKQu-.jpg', '食', 0, 0);

-- ----------------------------
-- Table structure for shops_kinds
-- ----------------------------
DROP TABLE IF EXISTS `shops_kinds`;
CREATE TABLE `shops_kinds`  (
  `kinds` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `quantity` int(32) NOT NULL DEFAULT 0,
  PRIMARY KEY (`kinds`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of shops_kinds
-- ----------------------------
INSERT INTO `shops_kinds` VALUES ('住', 0);
INSERT INTO `shops_kinds` VALUES ('行', 3);
INSERT INTO `shops_kinds` VALUES ('衣', 3);
INSERT INTO `shops_kinds` VALUES ('食', 2);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `openid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'user\'s openid',
  `sessionkey` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sessionkey',
  `nickName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `gender` int(4) NULL DEFAULT NULL COMMENT '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
  `avatarUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像，最后一个数值代表正方形头像大小（有0、46、64、96、132数值可选，0代表132*132正方形头像），用户没有头像时该项为空。若用户更换头像，原有头像URL将失效。',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户所在城市',
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户所在省份',
  `country` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户所在国家',
  `language` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户的语言，简体中文为zh_CN',
  `xh` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学号',
  `realname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `wechat` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信',
  `school` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学校',
  `qq` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'QQ号',
  `specialty` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '专业',
  `faculty` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '特长技能',
  PRIMARY KEY (`openid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('oj74Q5QxZpH8TzLIemQTZwokJ3uc', '/4Fa+PWXixLoCllDnZCd0g==', '被风筝追的人🤔', 1, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqzost4qsRenx6RQz3UheE3lz61cMM7gBcgIkVkA8myFfSLdzVZgMvFVwMsnSnAJnHHW5PuO4fgeA/132', 'Shangqiu', 'Henan', 'China', 'zh_CN', NULL, '蚂蚁', '1314', 'wechat', '河南大学', '4452', '经济', '                    <view class=\'save_num\'>\n                        <view class=\'iconfont icon-xueke-qita\'></view>\n                        <view>{{item.save_num}}</view>\n                    </view>');
INSERT INTO `user` VALUES ('oj74Q5Z_mbXJLtei2mhCkz_EXBKU', 'HkznA/CvdwQrWkqkQ+T0/g==', 'tensor7', 0, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqDYLeWq3qsarpxXdOmUjK6kcL75dIbzO1FaaB5RDP3l4W1aunfdocPWlXqEZp4ljibyibcLq3mKqmQ/132', '', '', '', 'zh_CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES ('oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'VqizdOYmgQK98vV9+ksJzA==', '被风筝追的人🤔', 1, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erQclmTZFrRVvNXh6z8OfYxunuLKJygV0riawu8mgvvjocOzv2b5WQF88fsI6wg8FXJWS7s8icjk7lw/132', 'Shangqiu', 'Henan', 'China', 'zh_CN', NULL, '你大爷还是你大爷', '110', '0000', '清华大学外500公里的河南大学', '445247721', '最nb专业', '轻松驾驭任何可以轻松驾驭的东西');
INSERT INTO `user` VALUES ('sst', 'sst', 'sst', 1, '11', '11', '11', '11', '11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user_collect
-- ----------------------------
DROP TABLE IF EXISTS `user_collect`;
CREATE TABLE `user_collect`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collect_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收藏类型',
  `collect_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收藏文章的id',
  `collect_time` datetime NOT NULL,
  `collect_user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'openid',
  `collect_status` int(16) NOT NULL DEFAULT 0 COMMENT '0 正常收藏  1 取消收藏',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `openid`(`collect_user`) USING BTREE,
  CONSTRAINT `openid` FOREIGN KEY (`collect_user`) REFERENCES `user` (`openid`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_comment
-- ----------------------------
DROP TABLE IF EXISTS `user_comment`;
CREATE TABLE `user_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论类型  shops  or material etc',
  `comment_id` int(32) NOT NULL COMMENT '评论的目标id',
  `comment_user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论人id',
  `comment_time` datetime NOT NULL COMMENT '评论时间',
  `comment_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论内容',
  `show_status` int(16) NOT NULL DEFAULT 0 COMMENT '0 显示  1 ，删除',
  `comment_like` int(32) NOT NULL DEFAULT 0 COMMENT '评论点赞',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `comment_user`(`comment_user`) USING BTREE,
  CONSTRAINT `comment_user` FOREIGN KEY (`comment_user`) REFERENCES `user` (`openid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_comment
-- ----------------------------
INSERT INTO `user_comment` VALUES (1, 'shops', 1, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-26 21:22:42', '评论', 0, 2);
INSERT INTO `user_comment` VALUES (2, 'shops', 1, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-25 21:23:06', '发的发的撒', 0, 1);
INSERT INTO `user_comment` VALUES (3, 'material', 1, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-17 21:23:31', 'dfadsfsa ', 0, 2);
INSERT INTO `user_comment` VALUES (4, 'shops', 2, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-29 20:08:16', '8.08', 0, 1);
INSERT INTO `user_comment` VALUES (5, 'shops', 1, 'sst', '2018-10-29 23:43:16', '就是现在', 0, 1);
INSERT INTO `user_comment` VALUES (6, 'shops', 1, 'sst', '2018-10-29 23:43:18', '就是现在', 0, 0);
INSERT INTO `user_comment` VALUES (7, 'shops', 1, 'sst', '2018-10-29 23:43:21', '就是现在', 0, 1);
INSERT INTO `user_comment` VALUES (8, 'undefined', 1, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-29 23:51:27', '评论', 0, 0);
INSERT INTO `user_comment` VALUES (9, 'shops', 1, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-29 23:53:52', '多以做你自己吧', 0, 1);
INSERT INTO `user_comment` VALUES (10, 'shops', 1, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-29 23:59:09', '【我正在PK人气赢能量，快来为我点赞】，復·制这段描述￥bCgQb7iLpLP￥后咑閞👉手机淘宝👈或者用浏览器咑閞http://m.jevwv.top/h.3jsqO8p 查看', 0, 1);
INSERT INTO `user_comment` VALUES (11, 'shops', 1, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-29 23:59:29', '暴力犯罪要受到严惩。', 0, 1);
INSERT INTO `user_comment` VALUES (12, 'shops', 1, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-30 00:09:50', 'hahahhah键盘输入时触发，event.detail = {value, cursor, key', 0, 0);
INSERT INTO `user_comment` VALUES (13, 'shops', 9, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-30 17:24:31', '精彩，我能摸你的皮卡丘嘛？？', 0, 2);
INSERT INTO `user_comment` VALUES (14, 'shops', 8, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-30 17:29:37', '啦啦啦啦啦', 0, 1);
INSERT INTO `user_comment` VALUES (15, 'shops', 9, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-30 23:28:46', 'pi ka duo', 0, 0);
INSERT INTO `user_comment` VALUES (16, 'lost', 14, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-31 10:13:05', '这都丢了，真刺激', 0, 1);
INSERT INTO `user_comment` VALUES (17, 'lost', 18, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-31 10:47:26', 'hu啦啦啦啦', 0, 1);
INSERT INTO `user_comment` VALUES (18, 'shops', 1, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-10-31 10:49:42', '就是现在', 0, 0);
INSERT INTO `user_comment` VALUES (19, 'lost', 2, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-11-05 22:57:04', '什么嘛', 0, 1);
INSERT INTO `user_comment` VALUES (20, 'lost', 2, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-11-05 22:57:10', '什么嘛😁 😁 😁 😁 😁 ', 0, 0);
INSERT INTO `user_comment` VALUES (21, 'lost', 5, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-11-05 22:58:31', '姑姑姑姑😂 😂 😂 😂 😂 ', 0, 0);
INSERT INTO `user_comment` VALUES (22, 'lost', 5, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-11-05 22:58:39', '姑姑姑姑😂 😂 😂 😂 😂 【老铁，双11红I包今天你领了吗？我在这里每天都有三次抽奖，快', 0, 0);
INSERT INTO `user_comment` VALUES (23, 'lost', 5, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-11-05 22:58:42', '姑姑姑姑😂 😂 😂 😂 😂 【老铁，双11红I包今天你领了吗？我在这里每天都有三次抽奖，快', 0, 0);
INSERT INTO `user_comment` VALUES (24, 'lost', 5, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-11-05 22:58:43', '姑姑姑姑😂 😂 😂 😂 😂 【老铁，双11红I包今天你领了吗？我在这里每天都有三次抽奖，快', 0, 1);
INSERT INTO `user_comment` VALUES (25, 'lost', 5, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-11-05 22:58:43', '姑姑姑姑😂 😂 😂 😂 😂 【老铁，双11红I包今天你领了吗？我在这里每天都有三次抽奖，快', 0, 0);
INSERT INTO `user_comment` VALUES (26, 'lost', 8, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-11-05 23:01:32', '啊哈', 0, 1);
INSERT INTO `user_comment` VALUES (27, 'shops', 10, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-11-05 23:19:49', '1', 0, 0);
INSERT INTO `user_comment` VALUES (28, 'lost', 18, 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-11-13 18:09:20', '胡扯', 0, 1);
INSERT INTO `user_comment` VALUES (29, 'lost', 18, 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-11-16 22:33:51', 'aaaa', 0, 0);
INSERT INTO `user_comment` VALUES (30, 'shops', 9, 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-11-16 22:47:20', '?', 0, 0);
INSERT INTO `user_comment` VALUES (31, 'passage', 1, 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-11-17 00:10:33', 'sheming', 0, 1);
INSERT INTO `user_comment` VALUES (32, 'passage', 2, 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-11-17 10:38:35', '纳尼？？？？', 0, 0);
INSERT INTO `user_comment` VALUES (33, 'passage', 4, 'oj74Q5QxZpH8TzLIemQTZwokJ3uc', '2018-11-17 17:30:17', '唉，心疼这个女的', 0, 1);
INSERT INTO `user_comment` VALUES (34, 'passage', 5, 'oj74Q5Z_mbXJLtei2mhCkz_EXBKU', '2018-11-17 18:27:31', '海贼王', 0, 2);
INSERT INTO `user_comment` VALUES (35, 'shops', 9, 'oj74Q5Z_mbXJLtei2mhCkz_EXBKU', '2018-11-17 18:29:48', '贼丑', 0, 1);
INSERT INTO `user_comment` VALUES (36, 'shops', 8, 'oj74Q5Z_mbXJLtei2mhCkz_EXBKU', '2018-11-17 18:30:10', 'hhhhhh', 0, 0);

-- ----------------------------
-- Triggers structure for table comment_like
-- ----------------------------
DROP TRIGGER IF EXISTS `auto_add_like`;
delimiter ;;
CREATE TRIGGER `auto_add_like` AFTER INSERT ON `comment_like` FOR EACH ROW UPDATE user_comment SET comment_like = (SELECT COUNT(*) FROM comment_like WHERE comment_id = new.comment_id AND like_status = 0) WHERE id = new.comment_id
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table comment_like
-- ----------------------------
DROP TRIGGER IF EXISTS `auto_change_like`;
delimiter ;;
CREATE TRIGGER `auto_change_like` AFTER UPDATE ON `comment_like` FOR EACH ROW UPDATE user_comment SET comment_like = (SELECT COUNT(*) FROM comment_like WHERE comment_id = NEW.comment_id AND like_status = 0) WHERE id = NEW.comment_id
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table comment_like
-- ----------------------------
DROP TRIGGER IF EXISTS `auto_change_like_delete`;
delimiter ;;
CREATE TRIGGER `auto_change_like_delete` AFTER DELETE ON `comment_like` FOR EACH ROW UPDATE user_comment SET comment_like = (SELECT COUNT(*) FROM comment_like WHERE comment_id = old.comment_id AND like_status = 0) WHERE id = old.comment_id
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table material
-- ----------------------------
DROP TRIGGER IF EXISTS `kindsSumAdd`;
delimiter ;;
CREATE TRIGGER `kindsSumAdd` AFTER INSERT ON `material` FOR EACH ROW UPDATE material_kinds SET quantity =( SELECT COUNT(*) FROM material WHERE kinds = NEW.kinds AND show_status=0 ) WHERE kinds = NEW.kinds
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table shops
-- ----------------------------
DROP TRIGGER IF EXISTS `autoadd_quantity`;
delimiter ;;
CREATE TRIGGER `autoadd_quantity` AFTER INSERT ON `shops` FOR EACH ROW BEGIN
UPDATE shops_kinds SET quantity = quantity+1 WHERE NEW.shop_type = shops_kinds.kinds;

END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
