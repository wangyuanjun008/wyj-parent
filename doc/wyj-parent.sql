/*
Navicat MySQL Data Transfer

Source Server         : AngularSpringDemo
Source Server Version : 50720
Source Host           : 192.168.99.100:3306
Source Database       : wyj-parent

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2017-11-09 23:23:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `b_bd_datadict`
-- ----------------------------
DROP TABLE IF EXISTS `b_bd_datadict`;
CREATE TABLE `b_bd_datadict` (
  `dictId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dictCode` varchar(50) DEFAULT NULL COMMENT '编码',
  `dictName` varchar(50) DEFAULT NULL COMMENT '名称',
  `dataGroupId` int(11) DEFAULT NULL COMMENT '分组编码',
  `remark` varchar(50) DEFAULT NULL COMMENT '描述',
  `status` int(11) DEFAULT NULL COMMENT '使用状态',
  `dictParentId` int(11) DEFAULT NULL COMMENT '父节点Id',
  PRIMARY KEY (`dictId`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of b_bd_datadict
-- ----------------------------
INSERT INTO `b_bd_datadict` VALUES ('14', '1', '男', '2', '', '1', null);
INSERT INTO `b_bd_datadict` VALUES ('15', '2', '女', '2', '', '1', null);
INSERT INTO `b_bd_datadict` VALUES ('16', '1', '是', '1', '', '1', null);
INSERT INTO `b_bd_datadict` VALUES ('17', '0', '否', '1', '', '1', null);
INSERT INTO `b_bd_datadict` VALUES ('21', '0', '目录', '5', '', '1', null);
INSERT INTO `b_bd_datadict` VALUES ('22', '1', '菜单', '5', '', '1', null);
INSERT INTO `b_bd_datadict` VALUES ('23', '3', '按钮', '5', '', '1', null);

-- ----------------------------
-- Table structure for `b_bd_datagroup`
-- ----------------------------
DROP TABLE IF EXISTS `b_bd_datagroup`;
CREATE TABLE `b_bd_datagroup` (
  `groupId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `groupCode` varchar(50) DEFAULT NULL COMMENT '分组编码',
  `groupName` varchar(50) DEFAULT NULL COMMENT '分组名称',
  `remark` varchar(50) DEFAULT NULL COMMENT '描述',
  `status` int(11) DEFAULT NULL COMMENT '使用状态',
  `parentId` int(11) DEFAULT NULL COMMENT '父类',
  PRIMARY KEY (`groupId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of b_bd_datagroup
-- ----------------------------
INSERT INTO `b_bd_datagroup` VALUES ('0', '0', '数据分组', null, '1', null);
INSERT INTO `b_bd_datagroup` VALUES ('1', 'yesOrNo', '是否', '是否', '1', '0');
INSERT INTO `b_bd_datagroup` VALUES ('2', 'sex', '男女', '男女', '1', '0');
INSERT INTO `b_bd_datagroup` VALUES ('4', 'status', '状态', '', '16', '0');
INSERT INTO `b_bd_datagroup` VALUES ('5', 'menuType', '菜单类型', '', '16', '0');

-- ----------------------------
-- Table structure for `s_auth_menu`
-- ----------------------------
DROP TABLE IF EXISTS `s_auth_menu`;
CREATE TABLE `s_auth_menu` (
  `menuId` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `parentId` int(11) DEFAULT NULL COMMENT '父级id',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(50) DEFAULT NULL COMMENT '菜单url',
  `perms` varchar(50) DEFAULT NULL COMMENT '授权标识(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型(0：目录 1：菜单 2：按钮)',
  `orderNum` int(11) DEFAULT NULL COMMENT '排序',
  `isUse` int(11) DEFAULT NULL COMMENT '是否使用',
  `createTime` date DEFAULT NULL COMMENT '创建时间',
  `createUserId` int(11) DEFAULT NULL COMMENT '创建人',
  `modifyTime` date DEFAULT NULL COMMENT '修改时间',
  `modifyUserId` int(11) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`menuId`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_auth_menu
-- ----------------------------
INSERT INTO `s_auth_menu` VALUES ('0', null, '权限管理系统', null, null, '0', '1', null, null, null, null, null);
INSERT INTO `s_auth_menu` VALUES ('1', '0', '系统组织管理', '', '', '0', '2', null, null, null, null, null);
INSERT INTO `s_auth_menu` VALUES ('2', '1', '系统管理', '/user/index', '1', '1', '1', null, null, null, null, null);
INSERT INTO `s_auth_menu` VALUES ('3', '0', '角色用户管理', '', '', '0', '3', null, '2017-09-08', null, null, null);
INSERT INTO `s_auth_menu` VALUES ('4', '0', '权限资源管理', '', '', '0', '4', null, '2017-09-08', null, '2017-09-08', null);
INSERT INTO `s_auth_menu` VALUES ('5', '0', '其他数据管理', '', '', '0', '5', null, '2017-09-08', null, '2017-09-08', null);
INSERT INTO `s_auth_menu` VALUES ('6', '0', '首页', '', '', '1', '1', null, '2017-09-08', null, null, null);
INSERT INTO `s_auth_menu` VALUES ('7', '3', '角色管理', '/role/index', 'role:list', '1', '1', '1', '2017-09-08', null, null, null);
INSERT INTO `s_auth_menu` VALUES ('8', '3', '用户管理', '/user/index', 'user:list', '1', '2', '1', '2017-09-08', null, null, null);
INSERT INTO `s_auth_menu` VALUES ('9', '4', '菜单管理', '/menu/index', 'menu:list', '1', '1', null, '2017-09-08', null, null, null);
INSERT INTO `s_auth_menu` VALUES ('10', '4', '权限管理', '/auth/index', 'auth:list', '1', '2', null, '2017-09-08', null, null, null);
INSERT INTO `s_auth_menu` VALUES ('11', '5', '数据分租', '/dataGroup/index', 'dataGroup:list', '1', '1', null, '2017-09-08', null, null, null);
INSERT INTO `s_auth_menu` VALUES ('12', '5', '数据字典', '/dataDict/index', 'dataDict:list', '1', '2', null, '2017-09-08', null, null, null);
INSERT INTO `s_auth_menu` VALUES ('13', '5', '日志记录', '/log/index', 'log:list', '1', '3', '1', '2017-09-08', null, null, null);
INSERT INTO `s_auth_menu` VALUES ('14', '2', '新增', '1', 'user:save', '2', '1', null, null, null, null, null);
INSERT INTO `s_auth_menu` VALUES ('18', '2', '编辑', '1', 'user:edit', '2', '2', null, null, null, null, null);
INSERT INTO `s_auth_menu` VALUES ('19', '2', '删除', '1', 'user:remove', '2', '3', null, null, null, null, null);
INSERT INTO `s_auth_menu` VALUES ('20', '7', '新增', '', 'role:save', '2', '1', null, null, null, null, null);
INSERT INTO `s_auth_menu` VALUES ('21', '7', '编辑', '', 'role:edit', '2', '2', null, null, null, null, null);
INSERT INTO `s_auth_menu` VALUES ('22', '7', '删除', '', 'role:remove', '2', '3', null, null, null, null, null);
INSERT INTO `s_auth_menu` VALUES ('23', '7', '操作权限', '', 'role:operation', '2', '4', null, null, null, null, null);
INSERT INTO `s_auth_menu` VALUES ('24', '8', '新增', '', 'user:save', '2', '1', null, null, null, null, null);
INSERT INTO `s_auth_menu` VALUES ('25', '8', '编辑', '', 'user:edit', '2', '2', null, null, null, null, null);
INSERT INTO `s_auth_menu` VALUES ('26', '8', '删除', '', 'user:remove', '2', '3', null, null, null, null, null);
INSERT INTO `s_auth_menu` VALUES ('27', '11', '新增', '', 'dataDict:save', '2', '1', null, null, null, null, null);
INSERT INTO `s_auth_menu` VALUES ('28', '11', '编辑', '', 'dataDict:edit', '2', '2', null, null, null, null, null);
INSERT INTO `s_auth_menu` VALUES ('29', '11', '删除', '', 'dataDict:remove', '2', '3', null, null, null, null, null);
INSERT INTO `s_auth_menu` VALUES ('30', '12', '新增', '', 'dataGroup:save', '2', '1', null, null, null, null, null);
INSERT INTO `s_auth_menu` VALUES ('31', '12', '编辑', '', 'dataGroup:edit', '2', '2', null, null, null, null, null);
INSERT INTO `s_auth_menu` VALUES ('32', '12', '删除', '', 'dataGroup:remove', '2', '3', null, null, null, null, null);
INSERT INTO `s_auth_menu` VALUES ('33', '9', '新增', '', 'menu:save', '2', '1', null, null, null, null, null);
INSERT INTO `s_auth_menu` VALUES ('34', '9', '编辑', '', 'menu:edit', '2', '2', null, null, null, null, null);
INSERT INTO `s_auth_menu` VALUES ('35', '9', '删除', '', 'menu:remove', '2', '3', null, null, null, null, null);
INSERT INTO `s_auth_menu` VALUES ('36', '10', '新增', '', 'auth:save', '2', '1', null, null, null, null, null);
INSERT INTO `s_auth_menu` VALUES ('37', '10', '编辑', '', 'auth:edit', '2', '2', null, null, null, null, null);
INSERT INTO `s_auth_menu` VALUES ('38', '10', '删除', '', 'auth:remove', '2', '3', null, null, null, null, null);
INSERT INTO `s_auth_menu` VALUES ('39', '13', '删除', '', 'log:remove', '2', '1', null, null, null, null, null);

-- ----------------------------
-- Table structure for `s_auth_role`
-- ----------------------------
DROP TABLE IF EXISTS `s_auth_role`;
CREATE TABLE `s_auth_role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `roleSign` varchar(50) DEFAULT NULL COMMENT '角色类型',
  `remake` varchar(50) DEFAULT NULL COMMENT '描述',
  `createTime` date DEFAULT NULL COMMENT '创建时间',
  `createUserId` int(11) DEFAULT NULL COMMENT '创建人',
  `modifyTime` date DEFAULT NULL COMMENT '修改时间',
  `modifyUserId` int(11) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_auth_role
-- ----------------------------
INSERT INTO `s_auth_role` VALUES ('1', '管理员', 'admin', '', '2017-09-11', null, null, null);
INSERT INTO `s_auth_role` VALUES ('2', '教师', 'teacher', '', '2017-09-11', null, null, null);

-- ----------------------------
-- Table structure for `s_auth_rolerelmenu`
-- ----------------------------
DROP TABLE IF EXISTS `s_auth_rolerelmenu`;
CREATE TABLE `s_auth_rolerelmenu` (
  `roleRelMenuId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `roleId` int(11) DEFAULT NULL COMMENT '角色id',
  `menuId` int(11) DEFAULT NULL COMMENT '菜单id',
  PRIMARY KEY (`roleRelMenuId`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_auth_rolerelmenu
-- ----------------------------
INSERT INTO `s_auth_rolerelmenu` VALUES ('43', '1', '0');
INSERT INTO `s_auth_rolerelmenu` VALUES ('44', '1', '6');
INSERT INTO `s_auth_rolerelmenu` VALUES ('45', '1', '1');
INSERT INTO `s_auth_rolerelmenu` VALUES ('46', '1', '2');
INSERT INTO `s_auth_rolerelmenu` VALUES ('47', '1', '14');
INSERT INTO `s_auth_rolerelmenu` VALUES ('48', '1', '18');
INSERT INTO `s_auth_rolerelmenu` VALUES ('49', '1', '19');
INSERT INTO `s_auth_rolerelmenu` VALUES ('50', '1', '3');
INSERT INTO `s_auth_rolerelmenu` VALUES ('51', '1', '7');
INSERT INTO `s_auth_rolerelmenu` VALUES ('52', '1', '20');
INSERT INTO `s_auth_rolerelmenu` VALUES ('53', '1', '21');
INSERT INTO `s_auth_rolerelmenu` VALUES ('54', '1', '22');
INSERT INTO `s_auth_rolerelmenu` VALUES ('55', '1', '23');
INSERT INTO `s_auth_rolerelmenu` VALUES ('56', '1', '8');
INSERT INTO `s_auth_rolerelmenu` VALUES ('57', '1', '24');
INSERT INTO `s_auth_rolerelmenu` VALUES ('58', '1', '25');
INSERT INTO `s_auth_rolerelmenu` VALUES ('59', '1', '26');
INSERT INTO `s_auth_rolerelmenu` VALUES ('60', '1', '4');
INSERT INTO `s_auth_rolerelmenu` VALUES ('61', '1', '9');
INSERT INTO `s_auth_rolerelmenu` VALUES ('62', '1', '33');
INSERT INTO `s_auth_rolerelmenu` VALUES ('63', '1', '34');
INSERT INTO `s_auth_rolerelmenu` VALUES ('64', '1', '35');
INSERT INTO `s_auth_rolerelmenu` VALUES ('65', '1', '10');
INSERT INTO `s_auth_rolerelmenu` VALUES ('66', '1', '36');
INSERT INTO `s_auth_rolerelmenu` VALUES ('67', '1', '37');
INSERT INTO `s_auth_rolerelmenu` VALUES ('68', '1', '38');
INSERT INTO `s_auth_rolerelmenu` VALUES ('69', '1', '5');
INSERT INTO `s_auth_rolerelmenu` VALUES ('70', '1', '11');
INSERT INTO `s_auth_rolerelmenu` VALUES ('71', '1', '27');
INSERT INTO `s_auth_rolerelmenu` VALUES ('72', '1', '28');
INSERT INTO `s_auth_rolerelmenu` VALUES ('73', '1', '29');
INSERT INTO `s_auth_rolerelmenu` VALUES ('74', '1', '12');
INSERT INTO `s_auth_rolerelmenu` VALUES ('75', '1', '30');
INSERT INTO `s_auth_rolerelmenu` VALUES ('76', '1', '31');
INSERT INTO `s_auth_rolerelmenu` VALUES ('77', '1', '32');
INSERT INTO `s_auth_rolerelmenu` VALUES ('78', '1', '13');
INSERT INTO `s_auth_rolerelmenu` VALUES ('79', '2', '0');
INSERT INTO `s_auth_rolerelmenu` VALUES ('80', '2', '5');
INSERT INTO `s_auth_rolerelmenu` VALUES ('81', '2', '11');
INSERT INTO `s_auth_rolerelmenu` VALUES ('82', '2', '27');
INSERT INTO `s_auth_rolerelmenu` VALUES ('83', '2', '28');
INSERT INTO `s_auth_rolerelmenu` VALUES ('84', '2', '29');
INSERT INTO `s_auth_rolerelmenu` VALUES ('85', '2', '12');
INSERT INTO `s_auth_rolerelmenu` VALUES ('86', '2', '30');
INSERT INTO `s_auth_rolerelmenu` VALUES ('87', '2', '31');
INSERT INTO `s_auth_rolerelmenu` VALUES ('88', '2', '32');
INSERT INTO `s_auth_rolerelmenu` VALUES ('89', '2', '13');
INSERT INTO `s_auth_rolerelmenu` VALUES ('90', '2', '39');

-- ----------------------------
-- Table structure for `s_auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `s_auth_user`;
CREATE TABLE `s_auth_user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userName` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `sex` int(11) DEFAULT NULL COMMENT '性别',
  `phone` int(11) DEFAULT NULL COMMENT '号码',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `address` varchar(50) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_auth_user
-- ----------------------------
INSERT INTO `s_auth_user` VALUES ('11', 'admin', '123456', '管理员', null, '12', '5', '');
INSERT INTO `s_auth_user` VALUES ('12', 'zhangsan', '123456', '张三', '1', '182930454', '', '');

-- ----------------------------
-- Table structure for `s_auth_userrelrole`
-- ----------------------------
DROP TABLE IF EXISTS `s_auth_userrelrole`;
CREATE TABLE `s_auth_userrelrole` (
  `userRelRoleId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`userRelRoleId`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_auth_userrelrole
-- ----------------------------
INSERT INTO `s_auth_userrelrole` VALUES ('26', '11', '1');
INSERT INTO `s_auth_userrelrole` VALUES ('27', '12', '2');

-- ----------------------------
-- Table structure for `s_log`
-- ----------------------------
DROP TABLE IF EXISTS `s_log`;
CREATE TABLE `s_log` (
  `logId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `operation` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户操作',
  `time` int(11) DEFAULT NULL COMMENT '响应时间',
  `method` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8 DEFAULT NULL COMMENT '请求参数',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`logId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of s_log
-- ----------------------------
INSERT INTO `s_log` VALUES ('1', '新增/编辑用户', '54', 'com.wyj.controller.system.UserController.save()', 'com.wyj.entity.system.User@3f01b837', '2017-09-28 13:52:08');
INSERT INTO `s_log` VALUES ('2', '新增/编辑用户', '51', 'com.wyj.controller.system.UserController.save()', 'com.wyj.entity.system.User@4031c113', '2017-10-13 14:14:43');
INSERT INTO `s_log` VALUES ('3', '退出登录', '3', 'com.wyj.controller.login.LoginController.logout()', null, '2017-10-13 14:44:07');
INSERT INTO `s_log` VALUES ('4', '退出登录', '4', 'com.wyj.controller.login.LoginController.logout()', null, '2017-10-13 14:45:52');
INSERT INTO `s_log` VALUES ('5', '退出登录', '1', 'com.wyj.controller.login.LoginController.logout()', null, '2017-10-13 14:47:21');
INSERT INTO `s_log` VALUES ('6', '退出登录', '3', 'com.wyj.controller.login.LoginController.logout()', null, '2017-10-13 14:53:33');
INSERT INTO `s_log` VALUES ('7', '退出登录', '0', 'com.wyj.controller.login.LoginController.logout()', null, '2017-10-13 14:54:42');
