/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50644
Source Host           : 127.0.0.1:3306
Source Database       : cloud_deer

Target Server Type    : MYSQL
Target Server Version : 50644
File Encoding         : 65001

Date: 2020-09-15 09:21:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `update_date` datetime DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `area_code` varchar(20) DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT NULL COMMENT '是否启用',
  `is_locked` tinyint(1) DEFAULT NULL COMMENT '是否锁定',
  `login_failure_count` int(2) DEFAULT NULL COMMENT '连续登录失败次数',
  `locked_date` datetime DEFAULT NULL COMMENT '锁定日期',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录日期',
  `login_ip` varchar(100) DEFAULT NULL COMMENT '最后登录IP',
  `head_img` varchar(255) DEFAULT NULL COMMENT '头像',
  `last_login_ip` varchar(255) DEFAULT NULL,
  `last_login_date` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机',
  `bfgb_id` bigint(20) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `username_mobile` (`username`,`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------

-- ----------------------------
-- Table structure for `t_cascade_constant`
-- ----------------------------
DROP TABLE IF EXISTS `t_cascade_constant`;
CREATE TABLE `t_cascade_constant` (
  `id` bigint(20) unsigned NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `area_code` char(12) CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` int(1) DEFAULT '0' COMMENT '状态：0-正常；-1 - 禁用',
  `type` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '类别',
  `parent_id` bigint(20) unsigned DEFAULT '0',
  `value` varchar(30) CHARACTER SET utf8mb4 DEFAULT '',
  `label` varchar(30) CHARACTER SET utf8mb4 DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cascade_constant
-- ----------------------------

-- ----------------------------
-- Table structure for `t_chat_record`
-- ----------------------------
DROP TABLE IF EXISTS `t_chat_record`;
CREATE TABLE `t_chat_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `send_date` datetime DEFAULT NULL COMMENT '发送时间',
  `wx_id` varchar(255) NOT NULL COMMENT '发送者微信Id',
  `robot` bigint(20) NOT NULL COMMENT '机器人ID',
  `recode_type` tinyint(5) NOT NULL DEFAULT '1' COMMENT '记录类型 1:文本,2:图片,3:文件',
  `recode_source` tinyint(11) NOT NULL DEFAULT '0' COMMENT '记录来源',
  `content` text COMMENT '记录内容',
  `file_path` varchar(255) NOT NULL COMMENT '文件路径',
  `send_nick_name` varchar(255) NOT NULL COMMENT '发送者昵称',
  `send_head_img` varchar(255) NOT NULL COMMENT '发送者头像',
  `recode_size` double(20,2) NOT NULL DEFAULT '0.00' COMMENT '消息大小 单位默认 B',
  `users` varchar(255) NOT NULL COMMENT '所属用户IDS',
  PRIMARY KEY (`id`),
  KEY `robot` (`robot`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_chat_record
-- ----------------------------
INSERT INTO `t_chat_record` VALUES ('1', '2020-09-07 16:32:21', '2020-09-07 16:32:27', '2020-09-07 16:32:31', '123', '123', '1', '0', null, '', '', '', '45.00', '123,45');
INSERT INTO `t_chat_record` VALUES ('2', '2020-09-05 16:33:25', '2020-09-06 16:33:29', '2020-09-07 16:33:34', '345', '345', '1', '0', 'hello', '', '', '', '50.00', 'asd,hjk');

-- ----------------------------
-- Table structure for `t_chat_record_23`
-- ----------------------------
DROP TABLE IF EXISTS `t_chat_record_23`;
CREATE TABLE `t_chat_record_23` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `send_date` datetime DEFAULT NULL COMMENT '发送时间',
  `wx_id` varchar(255) NOT NULL COMMENT '发送者微信Id',
  `robot` bigint(20) NOT NULL COMMENT '机器人ID',
  `recode_type` tinyint(5) NOT NULL DEFAULT '1' COMMENT '记录类型 1:文本,2:图片,3:文件',
  `recode_source` tinyint(11) NOT NULL DEFAULT '0' COMMENT '记录来源',
  `content` text COMMENT '记录内容',
  `file_path` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `send_nick_name` varchar(255) NOT NULL COMMENT '发送者昵称',
  `send_head_img` varchar(255) NOT NULL DEFAULT ' ' COMMENT '发送者头像',
  `recode_size` double(20,2) NOT NULL DEFAULT '0.00' COMMENT '消息大小 单位默认 B',
  `users` varchar(255) NOT NULL COMMENT '所属用户IDS',
  PRIMARY KEY (`id`),
  KEY `robot` (`robot`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_chat_record_23
-- ----------------------------
INSERT INTO `t_chat_record_23` VALUES ('3', '2020-09-10 10:47:52', null, '2020-09-10 10:47:52', '456789', '3', '1', '0', 'hello word', ' ', 'dssd', '127.0.0.1/haha/haha.img', '10.00', '456789,');
INSERT INTO `t_chat_record_23` VALUES ('4', '2020-09-10 10:48:49', null, '2020-09-10 10:48:53', '788', '3', '1', '0', 'uuu', ' ', 'dssd', ' ', '0.00', '');
INSERT INTO `t_chat_record_23` VALUES ('5', '2020-09-10 10:49:45', null, '2020-09-10 10:49:48', '456789', '3', '1', '0', 'gafgdf', '', 'dssd', ' ', '0.00', '');
INSERT INTO `t_chat_record_23` VALUES ('6', '2020-09-10 11:03:03', null, '2020-09-10 11:03:03', '456789', '3', '3', '0', '', 'C:\\SiAng Technology\\file-downs\\test-jpg', 'dssd', '127.0.0.1/haha/haha.img', '210372.00', '456789,');
INSERT INTO `t_chat_record_23` VALUES ('7', '2020-09-10 11:11:29', null, '2020-09-10 11:11:29', '456789', '3', '2', '0', '', 'C:\\SiAng Technology\\file-downs\\test-jpg', 'dssd', '127.0.0.1/haha/haha.img', '210372.00', '456789,');
INSERT INTO `t_chat_record_23` VALUES ('8', '2020-09-10 11:13:26', null, '2020-09-10 11:13:26', '456789', '3', '2', '0', '', 'C:\\SiAng Technology\\file-downs\\test-jpg', 'dssd', '127.0.0.1/haha/haha.img', '210372.00', '456789,');
INSERT INTO `t_chat_record_23` VALUES ('9', '2020-09-10 11:14:34', null, '2020-09-10 11:14:34', '456789', '3', '2', '0', '', 'C:\\SiAng Technology\\file-downs\\test-jpg', 'dssd', '127.0.0.1/haha/haha.img', '210372.00', '456789,');

-- ----------------------------
-- Table structure for `t_chat_record_24`
-- ----------------------------
DROP TABLE IF EXISTS `t_chat_record_24`;
CREATE TABLE `t_chat_record_24` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `send_date` datetime DEFAULT NULL COMMENT '发送时间',
  `wx_id` varchar(255) NOT NULL COMMENT '发送者微信Id',
  `robot` bigint(20) NOT NULL COMMENT '机器人ID',
  `recode_type` tinyint(5) NOT NULL DEFAULT '1' COMMENT '记录类型 1:文本,2:图片,3:文件',
  `recode_source` tinyint(11) NOT NULL COMMENT '记录来源',
  `content` text COMMENT '记录内容',
  `file_path` varchar(255) NOT NULL DEFAULT ' ' COMMENT '文件路径',
  `send_nick_name` varchar(255) NOT NULL COMMENT '发送者昵称',
  `send_head_img` varchar(255) NOT NULL COMMENT '发送者头像',
  `recode_size` double(20,2) NOT NULL DEFAULT '0.00' COMMENT '消息大小 单位默认B',
  `users` varchar(255) NOT NULL COMMENT '所属用户IDS',
  PRIMARY KEY (`id`),
  KEY `robot` (`robot`),
  KEY `index_users` (`users`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_chat_record_24
-- ----------------------------
INSERT INTO `t_chat_record_24` VALUES ('3', '2020-09-08 15:15:06', null, '2020-09-08 16:29:05', '123', '3', '1', '0', 'haha', ' ', 'hf', 'gf', '36.00', '123,456789');
INSERT INTO `t_chat_record_24` VALUES ('4', '2020-09-07 15:15:51', '2020-09-08 15:15:56', '2020-09-08 15:16:00', '123', '3', '1', '0', 'kk', ' ', '', '', '24.00', '123,456789');
INSERT INTO `t_chat_record_24` VALUES ('5', '2020-09-08 15:55:01', '2020-09-09 15:55:04', '2020-09-08 15:55:11', '452', '3', '1', '0', '8575555555', ' ', '', '', '50.00', '123');
INSERT INTO `t_chat_record_24` VALUES ('6', '2020-09-08 16:31:45', null, '2020-09-08 16:32:47', '123', '3', '1', '0', 'ytret', ' ', '', '', '0.00', '123,456789');
INSERT INTO `t_chat_record_24` VALUES ('7', '2020-09-08 16:32:54', '2020-09-08 16:32:58', '0000-00-00 00:00:00', '123', '3', '1', '0', 'fdsdx', ' ', 'tttt', '', '0.00', '123,852');
INSERT INTO `t_chat_record_24` VALUES ('8', '2020-09-01 16:34:12', '2020-09-04 16:34:17', null, '123', '3', '1', '0', 'asdfg', ' ', '', '', '0.00', '123,456789');

-- ----------------------------
-- Table structure for `t_constant`
-- ----------------------------
DROP TABLE IF EXISTS `t_constant`;
CREATE TABLE `t_constant` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '类型：类型值，字符串',
  `const_label` varchar(30) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '常量名',
  `const_value` int(30) DEFAULT NULL COMMENT '常量值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_constant
-- ----------------------------

-- ----------------------------
-- Table structure for `t_export`
-- ----------------------------
DROP TABLE IF EXISTS `t_export`;
CREATE TABLE `t_export` (
  `id` bigint(11) NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL,
  `update_date` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `area_code` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `download_count` int(11) DEFAULT NULL,
  `file_size` varchar(255) DEFAULT NULL,
  `deal_date` datetime DEFAULT NULL,
  `deal_seconds` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_export
-- ----------------------------

-- ----------------------------
-- Table structure for `t_group_member`
-- ----------------------------
DROP TABLE IF EXISTS `t_group_member`;
CREATE TABLE `t_group_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `wx_group` varchar(255) NOT NULL DEFAULT '0' COMMENT '微信群id',
  `group_name` varchar(255) NOT NULL COMMENT '微信群昵称',
  `wx_id` varchar(255) NOT NULL COMMENT '微信id',
  `wx_num` varchar(255) NOT NULL COMMENT '微信号',
  `nick_name` varchar(255) NOT NULL COMMENT '微信昵称',
  `is_save` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否开始收录 -> 0:false ; 1 true',
  `begin_save_date` datetime DEFAULT NULL COMMENT '开始收录时间',
  `recode_type` varchar(10) NOT NULL DEFAULT '1,2,3' COMMENT '记录类型 1:文本,2:图片,3:文件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_group_member
-- ----------------------------
INSERT INTO `t_group_member` VALUES ('1', '23', 'hello', '456789', 'haha', 'dssd', '1', '2020-09-08 15:47:19', '1,2,3');
INSERT INTO `t_group_member` VALUES ('2', '24', 'word', '4567', 'haha', 'dssd6', '1', '2020-09-08 15:12:20', '1,2,3');

-- ----------------------------
-- Table structure for `t_log_system`
-- ----------------------------
DROP TABLE IF EXISTS `t_log_system`;
CREATE TABLE `t_log_system` (
  `id` bigint(20) unsigned NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `operator` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operator_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area_code` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operate_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作功能',
  `ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作IP',
  `params` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求参数',
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_log_system
-- ----------------------------

-- ----------------------------
-- Table structure for `t_message`
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message` (
  `id` bigint(20) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `target_type` int(1) DEFAULT NULL,
  `target_id` bigint(20) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `play` int(1) DEFAULT NULL,
  `play_content` varchar(255) DEFAULT NULL,
  `message_type` int(1) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `role_id` varchar(20) NOT NULL,
  `see` int(11) DEFAULT NULL,
  `source_id` bigint(20) DEFAULT NULL,
  `strong_cue` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_message
-- ----------------------------

-- ----------------------------
-- Table structure for `t_robot`
-- ----------------------------
DROP TABLE IF EXISTS `t_robot`;
CREATE TABLE `t_robot` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_date` date NOT NULL COMMENT '创建时间',
  `update_date` date DEFAULT NULL COMMENT '更新时间',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '机器人名称',
  `wx_num` varchar(255) NOT NULL DEFAULT '' COMMENT '机器人微信号',
  `wx_id` varchar(255) NOT NULL DEFAULT '' COMMENT '机器人微信ID',
  `group_num` int(11) NOT NULL DEFAULT '0' COMMENT '守值群数',
  `server_ip` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器IP',
  `state` tinyint(11) NOT NULL DEFAULT '1' COMMENT '状态 0:异常 , 1:正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_robot
-- ----------------------------
INSERT INTO `t_robot` VALUES ('1', '2020-09-07', null, ' haha', ' aa123', ' aa456', '0', ' 192.168.0.118', '1');
INSERT INTO `t_robot` VALUES ('2', '2020-09-07', null, ' two_robot', ' two456', ' two456', '1', ' 192.168.0.105', '1');
INSERT INTO `t_robot` VALUES ('3', '2020-09-07', '2020-09-07', ' three_robot', ' three789', ' three789', '0', ' 192.168.0.107', '1');

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `area_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_date` date NOT NULL COMMENT '创建时间',
  `update_date` date DEFAULT NULL COMMENT '更新时间',
  `phone` varchar(11) NOT NULL COMMENT '手机号',
  `head_img` varchar(255) NOT NULL DEFAULT '' COMMENT '头像地址',
  `nick_name` varchar(255) NOT NULL DEFAULT '' COMMENT '昵称',
  `wx_id` varchar(255) NOT NULL DEFAULT '' COMMENT '微信id',
  `total_capacity` double(20,2) NOT NULL DEFAULT '1073741824.00' COMMENT '总容量 默认单位为 B',
  `available_capacity` double(20,2) unsigned NOT NULL DEFAULT '1073741824.00' COMMENT '可用容量 默认单位为 B',
  `total_group_num` int(11) NOT NULL DEFAULT '3' COMMENT '总群数',
  `available_group_num` int(11) NOT NULL DEFAULT '3' COMMENT '可用群数',
  `sex` tinyint(3) NOT NULL DEFAULT '0' COMMENT '性别, 0:女,1:男',
  `age` tinyint(4) DEFAULT NULL,
  `addr` varchar(255) NOT NULL DEFAULT '' COMMENT '所在地',
  `robot` bigint(20) NOT NULL DEFAULT '0' COMMENT '机器人id',
  `open_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'OPENID',
  `w_name` varchar(20) NOT NULL DEFAULT '' COMMENT '微信名称',
  `login_date` datetime DEFAULT NULL COMMENT '登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '2020-09-07', '2020-09-10', '18786722922', '127.0.0.1/haha/haha.img', '凤仙', '4544', '20000000000000.00', '200000210382.00', '1', '1', '1', '18', 'USA', '3', 'aa123456', '', null);
INSERT INTO `t_user` VALUES ('2', '2020-09-08', '2020-09-08', '18786722922', '127.0.0.1/haha/haha.img', '凤仙', '123', '1024.00', '1.00', '0', '0', '1', '18', 'USA', '0', 'test456789', '', null);
INSERT INTO `t_user` VALUES ('3', '2020-09-09', null, '18754966285', ' 127.0.0.1/haha/haha.img', ' 哈哈', '45712', '1073741824.00', '1073741824.00', '0', '0', '0', '18', ' ', '0', ' ', '', null);
INSERT INTO `t_user` VALUES ('4', '2020-09-10', '2020-09-10', '', '', '测试账户', '', '1048576.00', '1073741824.00', '0', '0', '0', '21', '贵州省贵阳市观山湖区', '0', '111111111', '', null);
INSERT INTO `t_user` VALUES ('5', '2020-09-10', '2020-09-11', '', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKr2PsQ4UGGMZPrvTsWCMtCpSKFF1Sd8TEWlzibJDUHDVgB6fUNOJPeiacIfpqMDOz4O6UjhpGMLDyQ/132', 'D塔', '456789', '1073741824.00', '1073741824.00', '3', '3', '1', '21', '', '3', 'o-h0S5WHSKwVFpI0DiVsf-3p2P8w', 'D塔', '2020-09-11 17:03:36');

-- ----------------------------
-- Table structure for `t_wx_group`
-- ----------------------------
DROP TABLE IF EXISTS `t_wx_group`;
CREATE TABLE `t_wx_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_date` date NOT NULL COMMENT '创建时间',
  `update_date` date DEFAULT NULL COMMENT '更新时间',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '群名称',
  `robot` bigint(20) NOT NULL DEFAULT '0' COMMENT '机器人id , 0 表示该群没机器人',
  `wx_group` varchar(255) NOT NULL DEFAULT '0' COMMENT '微信群id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_wx_group
-- ----------------------------
INSERT INTO `t_wx_group` VALUES ('1', '2020-09-04', '2020-09-04', ' hello', '3', '23');
INSERT INTO `t_wx_group` VALUES ('2', '2020-09-14', '2020-09-14', 'tyr', '3', '24');
