/*
Navicat MySQL Data Transfer

Source Server         : LOEO
Source Server Version : 50610
Source Host           : localhost:3306
Source Database       : LOEO

Target Server Type    : MYSQL
Target Server Version : 50610
File Encoding         : 65001

Date: 2017-01-17 00:23:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for persistent_logins
-- ----------------------------
DROP TABLE IF EXISTS `persistent_logins`;
CREATE TABLE `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of persistent_logins
-- ----------------------------
INSERT INTO `persistent_logins` VALUES ('1', '2pylGg6bYPyteljZ7YrNRQ==', '7pl0EcNfYWYvuQIfhnVXXw==', '2016-11-24 22:48:37');
INSERT INTO `persistent_logins` VALUES ('1', 'nMuUvOU608sMZK4weOS9Rw==', 'wrHVC9XDoprW5jkwccILNw==', '2017-01-02 23:02:32');
INSERT INTO `persistent_logins` VALUES ('1', 'q2cvAK9hzlhmCSM2T2G28w==', 'UxBrk5ui3aFDPQWqFJv3Wg==', '2016-11-24 22:50:55');

-- ----------------------------
-- Table structure for t_product
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES ('6', '产品', null);
INSERT INTO `t_product` VALUES ('8', '123123', null);
INSERT INTO `t_product` VALUES ('9', '123123', null);

-- ----------------------------
-- Table structure for t_product_type
-- ----------------------------
DROP TABLE IF EXISTS `t_product_type`;
CREATE TABLE `t_product_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_odx8t7pmevvc0vb1e74yx6asq` (`productId`),
  CONSTRAINT `FK_odx8t7pmevvc0vb1e74yx6asq` FOREIGN KEY (`productId`) REFERENCES `t_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_product_type
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_button
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_button`;
CREATE TABLE `t_sys_button` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(30) NOT NULL COMMENT '按钮名称',
  `class` varchar(30) DEFAULT NULL COMMENT '按钮类型',
  `iconCls` varchar(255) DEFAULT NULL COMMENT '按钮图标',
  `script` varchar(255) DEFAULT NULL COMMENT '按钮脚本',
  `menuId` int(11) NOT NULL COMMENT '菜单id',
  `orde` int(255) NOT NULL COMMENT '排序',
  `enable` tinyint(1) DEFAULT NULL COMMENT '按钮状态',
  `createUser` int(255) DEFAULT NULL,
  `createDt` datetime DEFAULT NULL,
  `updateUser` int(11) DEFAULT NULL,
  `updateDt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `btn_menu_id` (`menuId`),
  CONSTRAINT `btn_menu_id` FOREIGN KEY (`menuId`) REFERENCES `t_sys_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_button
-- ----------------------------
INSERT INTO `t_sys_button` VALUES ('1', '权威', null, '11', '22', '14', '32', '1', '1', '2016-09-25 20:03:48', '1', '2016-09-25 20:03:48');
INSERT INTO `t_sys_button` VALUES ('2', '权威', '111', '11', '22', '14', '32', '1', '1', '2016-09-25 20:05:13', '1', '2016-09-25 21:03:25');

-- ----------------------------
-- Table structure for t_sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_menu`;
CREATE TABLE `t_sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '菜单名称',
  `iconCls` varchar(30) DEFAULT NULL COMMENT '菜单图标',
  `link` varchar(255) DEFAULT NULL COMMENT '菜单url',
  `pid` int(11) DEFAULT NULL COMMENT '父ID',
  `isLeaf` tinyint(1) DEFAULT NULL COMMENT '是否叶子节点',
  `orde` int(255) DEFAULT NULL COMMENT '排序',
  `createDt` datetime DEFAULT NULL,
  `createUser` int(11) DEFAULT NULL,
  `updateDt` datetime DEFAULT NULL,
  `updateUser` int(11) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_menu
-- ----------------------------
INSERT INTO `t_sys_menu` VALUES ('1', '主菜单', null, null, '0', '0', '1', '2016-09-21 00:11:40', '1', '2016-09-21 00:11:47', '1', '1');
INSERT INTO `t_sys_menu` VALUES ('5', '系统管理', 'fa fa-files-o', '1', '1', '0', '1', '2016-09-24 00:55:03', '1', '2016-09-27 01:57:03', '1', '1');
INSERT INTO `t_sys_menu` VALUES ('6', '用户管理', 'fa fa-user', 'user/page.do', '5', '1', '1', '2016-09-24 01:11:33', '1', '2016-09-27 01:54:45', '1', '1');
INSERT INTO `t_sys_menu` VALUES ('7', '组织架构', 'fa fa-sitemap', '/org/page.do', '5', '1', '2', '2016-09-24 01:13:28', '1', '2016-09-27 01:55:17', '1', '1');
INSERT INTO `t_sys_menu` VALUES ('8', '角色管理', 'fa fa-users', 'role/page.do', '5', '1', '3', '2016-09-24 01:14:54', '1', '2016-09-27 01:55:36', '1', '1');
INSERT INTO `t_sys_menu` VALUES ('9', '权限管理', 'fa fa-eye', 'privilege/page.do', '5', '1', '4', '2016-09-24 01:15:51', '1', '2016-10-02 23:19:32', '1', '1');
INSERT INTO `t_sys_menu` VALUES ('14', '我的', 'fa fa-dashboard', '3', '1', '0', '3', '2016-09-24 01:31:00', '1', '2016-09-27 01:57:19', '1', '1');
INSERT INTO `t_sys_menu` VALUES ('15', '111', '12', '1122', '14', '0', '11', '2016-10-08 00:31:38', '1', '2016-10-08 00:31:38', '1', '1');
INSERT INTO `t_sys_menu` VALUES ('17', '123', '123', '321', '15', '1', '123', '2016-10-08 00:34:38', '1', '2016-10-08 00:34:38', '1', '1');
INSERT INTO `t_sys_menu` VALUES ('18', '资源管理', 'fa fa-list-ol', '/resource/page.do', '5', '1', '1', '2016-11-05 13:18:58', '1', '2016-11-05 13:20:05', '1', '1');

-- ----------------------------
-- Table structure for t_sys_org
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_org`;
CREATE TABLE `t_sys_org` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `descp` varchar(200) DEFAULT NULL,
  `leaf` varchar(10) DEFAULT NULL,
  `createDt` datetime DEFAULT NULL,
  `createUser` int(11) DEFAULT NULL,
  `updateDt` datetime DEFAULT NULL,
  `updateUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fj4wmb1pc7b1act5qy87bjws9` (`pid`),
  KEY `FK_ptea98lnhphw5t1is8kkb061p` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_org
-- ----------------------------
INSERT INTO `t_sys_org` VALUES ('2', '人事部', '0', '人事部', 'true', null, null, null, null);
INSERT INTO `t_sys_org` VALUES ('16', '开发部', '0', '开发部', 'false', null, null, null, null);
INSERT INTO `t_sys_org` VALUES ('27', '软件部', '16', '描述', 'true', null, null, null, null);
INSERT INTO `t_sys_org` VALUES ('28', '硬件部', '16', '2', 'true', null, null, null, null);
INSERT INTO `t_sys_org` VALUES ('29', '测试部', '0', '描述', 'false', null, null, null, null);
INSERT INTO `t_sys_org` VALUES ('30', '测试2组', '29', '描述', 'true', null, null, null, null);

-- ----------------------------
-- Table structure for t_sys_privilege
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_privilege`;
CREATE TABLE `t_sys_privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `master` varchar(20) DEFAULT NULL,
  `masterValue` varchar(20) DEFAULT NULL,
  `access` varchar(20) DEFAULT NULL,
  `accessValue` varchar(20) DEFAULT NULL,
  `operation` varchar(20) DEFAULT NULL,
  `createUser` int(11) DEFAULT NULL,
  `createDt` datetime DEFAULT NULL,
  `updateUser` int(11) DEFAULT NULL,
  `updateDt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_privilege
-- ----------------------------
INSERT INTO `t_sys_privilege` VALUES ('153', 'role', '5', '0', '7', 'enable', '1', '2016-11-08 23:10:48', '1', '2016-11-08 23:10:48');
INSERT INTO `t_sys_privilege` VALUES ('154', 'role', '5', '1', '8', 'enable', '1', '2016-11-08 23:10:48', '1', '2016-11-08 23:10:48');
INSERT INTO `t_sys_privilege` VALUES ('155', 'role', '5', '1', '9', 'enable', '1', '2016-11-08 23:10:48', '1', '2016-11-08 23:10:48');
INSERT INTO `t_sys_privilege` VALUES ('156', 'role', '5', '1', '10', 'enable', '1', '2016-11-08 23:10:48', '1', '2016-11-08 23:10:48');
INSERT INTO `t_sys_privilege` VALUES ('157', 'role', '5', '1', '11', 'enable', '1', '2016-11-08 23:10:48', '1', '2016-11-08 23:10:48');
INSERT INTO `t_sys_privilege` VALUES ('158', 'role', '6', '0', '7', 'enable', '1', '2016-11-08 23:10:59', '1', '2016-11-08 23:10:59');
INSERT INTO `t_sys_privilege` VALUES ('159', 'role', '6', '1', '8', 'enable', '1', '2016-11-08 23:10:59', '1', '2016-11-08 23:10:59');
INSERT INTO `t_sys_privilege` VALUES ('202', 'user', '2', '0', '7', 'enable', '1', '2016-11-27 13:56:57', '1', '2016-11-27 13:56:57');
INSERT INTO `t_sys_privilege` VALUES ('203', 'user', '2', '1', '10', 'enable', '1', '2016-11-27 13:56:57', '1', '2016-11-27 13:56:57');
INSERT INTO `t_sys_privilege` VALUES ('204', 'user', '2', '1', '11', 'enable', '1', '2016-11-27 13:56:57', '1', '2016-11-27 13:56:57');
INSERT INTO `t_sys_privilege` VALUES ('205', 'user', '2', '1', '13', 'enable', '1', '2016-11-27 13:56:57', '1', '2016-11-27 13:56:57');
INSERT INTO `t_sys_privilege` VALUES ('213', 'user', '1', '2', '23', 'enable', '1', '2017-01-02 21:32:46', '1', '2017-01-02 21:32:46');
INSERT INTO `t_sys_privilege` VALUES ('214', 'user', '1', '1', '8', 'enable', '1', '2017-01-02 21:32:46', '1', '2017-01-02 21:32:46');
INSERT INTO `t_sys_privilege` VALUES ('215', 'user', '1', '0', '7', 'enable', '1', '2017-01-02 21:32:46', '1', '2017-01-02 21:32:46');
INSERT INTO `t_sys_privilege` VALUES ('216', 'user', '1', '1', '9', 'enable', '1', '2017-01-02 21:32:46', '1', '2017-01-02 21:32:46');
INSERT INTO `t_sys_privilege` VALUES ('217', 'user', '1', '1', '10', 'enable', '1', '2017-01-02 21:32:46', '1', '2017-01-02 21:32:46');
INSERT INTO `t_sys_privilege` VALUES ('218', 'user', '1', '1', '11', 'enable', '1', '2017-01-02 21:32:46', '1', '2017-01-02 21:32:46');
INSERT INTO `t_sys_privilege` VALUES ('219', 'user', '1', '1', '13', 'enable', '1', '2017-01-02 21:32:46', '1', '2017-01-02 21:32:46');
INSERT INTO `t_sys_privilege` VALUES ('220', 'user', '1', '2', '25', 'enable', '1', '2017-01-02 21:32:46', '1', '2017-01-02 21:32:46');
INSERT INTO `t_sys_privilege` VALUES ('221', 'user', '1', '2', '24', 'enable', '1', '2017-01-02 21:32:46', '1', '2017-01-02 21:32:46');

-- ----------------------------
-- Table structure for t_sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_resource`;
CREATE TABLE `t_sys_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `descp` varchar(255) DEFAULT NULL,
  `iconCls` varchar(255) DEFAULT NULL,
  `script` varchar(255) DEFAULT NULL,
  `createDt` datetime DEFAULT NULL,
  `createUser` int(255) DEFAULT NULL,
  `updateDt` datetime DEFAULT NULL,
  `updateUser` int(11) DEFAULT NULL,
  `enable` tinyint(255) DEFAULT NULL,
  `isLeaf` tinyint(255) DEFAULT NULL,
  `orde` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_resource
-- ----------------------------
INSERT INTO `t_sys_resource` VALUES ('7', '系统管理', '', '0', '0', '系统管理', 'fa fa-files-o', '', '2016-11-06 00:48:37', '1', '2016-11-06 00:48:37', '1', '1', '0', '1');
INSERT INTO `t_sys_resource` VALUES ('8', '用户管理', '/user/page.do', '1', '7', '用户管理', 'fa fa-user', '', '2016-11-06 01:02:10', '1', '2016-11-06 01:02:10', '1', '1', '0', '2');
INSERT INTO `t_sys_resource` VALUES ('9', '资源管理', '/resource/page.do', '1', '7', '资源管理', 'fa fa-list-ol', '', '2016-11-06 01:33:15', '1', '2016-11-06 01:33:15', '1', '1', '1', '2');
INSERT INTO `t_sys_resource` VALUES ('10', '组织架构', '/org/page.do', '1', '7', '组织架构', 'fa fa-sitemap', '', '2016-11-06 01:39:12', '1', '2016-11-06 01:39:12', '1', '1', '1', '3');
INSERT INTO `t_sys_resource` VALUES ('11', '角色管理', '/role/page.do', '1', '7', '角色管理', 'fa fa-users', '', '2016-11-06 01:41:58', '1', '2016-11-06 01:41:58', '1', '1', '1', '4');
INSERT INTO `t_sys_resource` VALUES ('13', '权限管理', '/privilege/page.do', '1', '7', '权限管理', 'fa fa-eye', '', '2016-11-06 01:50:09', '1', '2016-11-06 01:53:40', '1', '1', '1', '5');
INSERT INTO `t_sys_resource` VALUES ('20', '11', '', '0', '0', '1', '1', '1', '2016-11-06 02:37:58', '1', '2016-11-06 02:37:58', '1', '1', '1', '1');
INSERT INTO `t_sys_resource` VALUES ('22', '权威', '', '0', '21', '', '123', '123', '2016-11-20 22:13:51', '1', '2016-11-20 22:13:51', '1', '1', '1', '123');
INSERT INTO `t_sys_resource` VALUES ('23', '新增', '', '2', '8', '', 'fa fa-user', '', '2017-01-02 21:30:14', '1', '2017-01-02 21:30:14', '1', '1', '1', '0');
INSERT INTO `t_sys_resource` VALUES ('24', '修改', '', '2', '8', '', 'fa fa-user', '', '2017-01-02 21:31:57', '1', '2017-01-02 21:38:25', '1', '1', '1', '1');
INSERT INTO `t_sys_resource` VALUES ('25', '删除', '', '2', '8', '', 'fa fa-user', '', '2017-01-02 21:32:07', '1', '2017-01-02 21:38:39', '1', '1', '1', '2');

-- ----------------------------
-- Table structure for t_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role`;
CREATE TABLE `t_sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `code` varchar(100) NOT NULL,
  `descp` varchar(200) DEFAULT NULL,
  `createUser` int(11) DEFAULT NULL,
  `createDt` datetime DEFAULT NULL,
  `updateUser` int(11) DEFAULT NULL,
  `updateDt` datetime DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_key` (`name`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_role
-- ----------------------------
INSERT INTO `t_sys_role` VALUES ('4', '系统管理员', '1', '系统管理员', null, null, '1', '2016-09-24 01:43:10', '1');
INSERT INTO `t_sys_role` VALUES ('5', '高级用户', '2', '高级用户', null, null, '1', '2016-09-24 01:43:13', '1');
INSERT INTO `t_sys_role` VALUES ('6', '普通用户', '3', '普通用户', null, null, '1', '2016-09-24 01:43:17', '1');
INSERT INTO `t_sys_role` VALUES ('7', '测试员', '4', '测试员', null, null, '1', '2016-09-24 01:43:20', '1');
INSERT INTO `t_sys_role` VALUES ('10', '333', '333', '333', null, null, '1', '2016-12-09 22:40:01', '1');
INSERT INTO `t_sys_role` VALUES ('11', '123', '321', '123', '1', '2016-09-23 23:48:02', '1', '2016-09-23 23:48:02', '1');
INSERT INTO `t_sys_role` VALUES ('12', '33', '11', '', '1', '2016-09-23 23:48:22', '1', '2016-09-23 23:48:22', '1');
INSERT INTO `t_sys_role` VALUES ('13', '123123', '133', '', '1', '2016-09-23 23:50:23', '1', '2016-09-23 23:50:23', '1');
INSERT INTO `t_sys_role` VALUES ('14', '123', '3213', '', '1', '2016-09-23 23:53:11', '1', '2016-09-23 23:53:11', '1');

-- ----------------------------
-- Table structure for t_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user`;
CREATE TABLE `t_sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `birthday` date NOT NULL,
  `sex` varchar(4) DEFAULT NULL,
  `avatar` varchar(50) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `orgId` int(10) DEFAULT NULL,
  `createDt` datetime DEFAULT NULL,
  `createUser` int(11) DEFAULT NULL,
  `updateDt` datetime DEFAULT NULL,
  `updateUser` int(11) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_unique` (`username`),
  KEY `user_org` (`orgId`),
  CONSTRAINT `user_org` FOREIGN KEY (`orgId`) REFERENCES `t_sys_org` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_user
-- ----------------------------
INSERT INTO `t_sys_user` VALUES ('1', '1', '123', '1233', '4', '2016-06-29', '男', null, '123@1.com', '123123', null, '2016-09-16 01:28:52', '11', '2016-09-20 01:28:56', '33', '1');
INSERT INTO `t_sys_user` VALUES ('2', '2', '123123', '啊啦雷', '8', '2014-12-01', '女', null, 'wer@qqq.com', '(123) 123-1231', null, null, null, null, null, '1');
INSERT INTO `t_sys_user` VALUES ('11', 'liutao', '123123', '刘涛', '0', '1988-04-22', '男', null, '11@qq.com', '1111111', null, null, null, '2016-09-18 02:28:51', '1', '1');
INSERT INTO `t_sys_user` VALUES ('31', 'qinzeyu', '123123', '秦泽玉', '0', '1989-11-21', '保密', null, '22@wq.com', '110', null, null, null, null, null, '1');

-- ----------------------------
-- Table structure for t_sys_user_org
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user_org`;
CREATE TABLE `t_sys_user_org` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orgId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_aundm63jovvvcbdti8xp3rr9b` (`orgId`),
  KEY `FK_s60ynuecdfjaitv44ct672k8r` (`userId`),
  CONSTRAINT `FK_aundm63jovvvcbdti8xp3rr9b` FOREIGN KEY (`orgId`) REFERENCES `t_sys_org` (`id`),
  CONSTRAINT `FK_s60ynuecdfjaitv44ct672k8r` FOREIGN KEY (`userId`) REFERENCES `t_sys_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_user_org
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user_role`;
CREATE TABLE `t_sys_user_role` (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`),
  KEY `FK_kjp9c6hki8a1p70x44bwqex2v` (`roleId`),
  KEY `FK_akj61lp0wul5h73yq0xrq89cq` (`userId`),
  CONSTRAINT `role_user_id` FOREIGN KEY (`userId`) REFERENCES `t_sys_user` (`id`),
  CONSTRAINT `user_role_Id` FOREIGN KEY (`roleId`) REFERENCES `t_sys_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_user_role
-- ----------------------------
INSERT INTO `t_sys_user_role` VALUES ('1', '4');
INSERT INTO `t_sys_user_role` VALUES ('2', '5');
INSERT INTO `t_sys_user_role` VALUES ('1', '6');
INSERT INTO `t_sys_user_role` VALUES ('2', '6');
