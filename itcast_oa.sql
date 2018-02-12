/*
Navicat MySQL Data Transfer

Source Server         : itcastoa
Source Server Version : 50614
Source Host           : localhost:3306
Source Database       : itcast_oa

Target Server Type    : MYSQL
Target Server Version : 50614
File Encoding         : 65001

Date: 2018-02-12 23:48:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `itcast_book`
-- ----------------------------
DROP TABLE IF EXISTS `itcast_book`;
CREATE TABLE `itcast_book` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of itcast_book
-- ----------------------------
INSERT INTO `itcast_book` VALUES ('2', 'php');
INSERT INTO `itcast_book` VALUES ('3', 'java');
INSERT INTO `itcast_book` VALUES ('4', 'c');
INSERT INTO `itcast_book` VALUES ('5', 'c  ');
INSERT INTO `itcast_book` VALUES ('6', 'android');
INSERT INTO `itcast_book` VALUES ('8', 'RXAndroid');
INSERT INTO `itcast_book` VALUES ('9', 'RXJava');
INSERT INTO `itcast_book` VALUES ('10', 'android');
INSERT INTO `itcast_book` VALUES ('11', 'RXAndroid');
INSERT INTO `itcast_book` VALUES ('12', 'RXJava');

-- ----------------------------
-- Table structure for `itcast_department`
-- ----------------------------
DROP TABLE IF EXISTS `itcast_department`;
CREATE TABLE `itcast_department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  `parentId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB56F87C7729C9286` (`parentId`),
  CONSTRAINT `FKB56F87C7729C9286` FOREIGN KEY (`parentId`) REFERENCES `itcast_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of itcast_department
-- ----------------------------
INSERT INTO `itcast_department` VALUES ('1', '开发部', '写代码', null);
INSERT INTO `itcast_department` VALUES ('2', '开发一部', '开发一部233', '1');
INSERT INTO `itcast_department` VALUES ('3', '财务部', '管钱的', null);
INSERT INTO `itcast_department` VALUES ('4', '财务一部', '也是管钱的', '3');
INSERT INTO `itcast_department` VALUES ('5', '一部(1)', null, '4');
INSERT INTO `itcast_department` VALUES ('6', '1111', null, '5');
INSERT INTO `itcast_department` VALUES ('7', '财务二部', '', '3');
INSERT INTO `itcast_department` VALUES ('8', '财务三部', '', '3');
INSERT INTO `itcast_department` VALUES ('9', '财务四部', '', '3');
INSERT INTO `itcast_department` VALUES ('12', '开发二部', '', '1');
INSERT INTO `itcast_department` VALUES ('14', '财务五部', '', '3');
INSERT INTO `itcast_department` VALUES ('18', 'aaaaaaaaaaa', '', '2');
INSERT INTO `itcast_department` VALUES ('20', '测试部', '测试部门', null);
INSERT INTO `itcast_department` VALUES ('21', '测试一部', '', '20');

-- ----------------------------
-- Table structure for `itcast_forum`
-- ----------------------------
DROP TABLE IF EXISTS `itcast_forum`;
CREATE TABLE `itcast_forum` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `position_` int(11) DEFAULT NULL,
  `topicCount` int(11) DEFAULT NULL,
  `articleCount` int(11) DEFAULT NULL,
  `topicId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK903A938C1074626A` (`topicId`),
  CONSTRAINT `FK903A938C1074626A` FOREIGN KEY (`topicId`) REFERENCES `itcast_topic` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of itcast_forum
-- ----------------------------
INSERT INTO `itcast_forum` VALUES ('5', 'java专区', 'java', '6', '2', '2', '6');
INSERT INTO `itcast_forum` VALUES ('6', 'PHP', '', '7', '0', '0', null);
INSERT INTO `itcast_forum` VALUES ('7', '网页平面', '', '8', '0', '0', null);
INSERT INTO `itcast_forum` VALUES ('8', 'C++专区', '', '5', '2', '4', '7');
INSERT INTO `itcast_forum` VALUES ('9', '自连接', '大漠孤烟直，喵喵喵', '9', '0', '0', null);
INSERT INTO `itcast_forum` VALUES ('10', 'dddd', '', '10', '0', '0', null);

-- ----------------------------
-- Table structure for `itcast_privilege`
-- ----------------------------
DROP TABLE IF EXISTS `itcast_privilege`;
CREATE TABLE `itcast_privilege` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `parentId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2A54CF9CE7D51427` (`parentId`),
  CONSTRAINT `FK2A54CF9CE7D51427` FOREIGN KEY (`parentId`) REFERENCES `itcast_privilege` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of itcast_privilege
-- ----------------------------
INSERT INTO `itcast_privilege` VALUES ('1', '系统管理', null, null);
INSERT INTO `itcast_privilege` VALUES ('2', '岗位管理', '/role_list', '1');
INSERT INTO `itcast_privilege` VALUES ('3', '部门管理', '/department_list', '1');
INSERT INTO `itcast_privilege` VALUES ('4', '用户管理', '/user_list', '1');
INSERT INTO `itcast_privilege` VALUES ('5', '岗位列表', '/role_list', '2');
INSERT INTO `itcast_privilege` VALUES ('6', '岗位删除', '/role_delete', '2');
INSERT INTO `itcast_privilege` VALUES ('7', '岗位添加', '/role_add', '2');
INSERT INTO `itcast_privilege` VALUES ('8', '岗位修改', '/role_edit', '2');
INSERT INTO `itcast_privilege` VALUES ('9', '部门列表', '/department_list', '3');
INSERT INTO `itcast_privilege` VALUES ('10', '部门删除', '/department_delete', '3');
INSERT INTO `itcast_privilege` VALUES ('11', '部门添加', '/department_add', '3');
INSERT INTO `itcast_privilege` VALUES ('12', '部门修改', '/department_edit', '3');
INSERT INTO `itcast_privilege` VALUES ('13', '用户列表', '/user_list', '4');
INSERT INTO `itcast_privilege` VALUES ('14', '用户删除', '/user_delete', '4');
INSERT INTO `itcast_privilege` VALUES ('15', '用户添加', '/user_add', '4');
INSERT INTO `itcast_privilege` VALUES ('16', '用户修改', '/user_edit', '4');
INSERT INTO `itcast_privilege` VALUES ('17', '用户初始化密码', '/user_initPassword', '4');
INSERT INTO `itcast_privilege` VALUES ('18', '网上交流', null, null);
INSERT INTO `itcast_privilege` VALUES ('19', '论坛管理', '/forumManage_list', '18');
INSERT INTO `itcast_privilege` VALUES ('20', '论坛', '/forum_list', '18');

-- ----------------------------
-- Table structure for `itcast_reply`
-- ----------------------------
DROP TABLE IF EXISTS `itcast_reply`;
CREATE TABLE `itcast_reply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `ipAddress` varchar(255) DEFAULT NULL,
  `postTime` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `topicId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK90DF19551074626A` (`topicId`),
  KEY `FK90DF1955C0603920` (`userId`),
  CONSTRAINT `FK90DF19551074626A` FOREIGN KEY (`topicId`) REFERENCES `itcast_topic` (`id`),
  CONSTRAINT `FK90DF1955C0603920` FOREIGN KEY (`userId`) REFERENCES `itcast_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of itcast_reply
-- ----------------------------
INSERT INTO `itcast_reply` VALUES ('1', 'xxx', null, '2017-11-05 13:31:46', '0', '7', '1');
INSERT INTO `itcast_reply` VALUES ('2', 'buznemy', '0:0:0:0:0:0:0:1', '2017-11-17 15:53:00', '0', '8', '4');
INSERT INTO `itcast_reply` VALUES ('3', 'aaaaaa', '0:0:0:0:0:0:0:1', '2017-11-17 16:16:16', '0', '8', '4');

-- ----------------------------
-- Table structure for `itcast_role`
-- ----------------------------
DROP TABLE IF EXISTS `itcast_role`;
CREATE TABLE `itcast_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of itcast_role
-- ----------------------------
INSERT INTO `itcast_role` VALUES ('1', '测试员', '测试代码对方答复');
INSERT INTO `itcast_role` VALUES ('2', '主管', '什么都管');
INSERT INTO `itcast_role` VALUES ('4', '黄雷达', '大头大头，下雨不愁');
INSERT INTO `itcast_role` VALUES ('5', '中道儿子', '捡来的儿子');
INSERT INTO `itcast_role` VALUES ('6', '程序员', '你好吗');
INSERT INTO `itcast_role` VALUES ('7', '测试人员', '测试代码');
INSERT INTO `itcast_role` VALUES ('8', '经理', '管人');

-- ----------------------------
-- Table structure for `itcast_role_privilege`
-- ----------------------------
DROP TABLE IF EXISTS `itcast_role_privilege`;
CREATE TABLE `itcast_role_privilege` (
  `privilegeId` bigint(20) NOT NULL,
  `roleId` bigint(20) NOT NULL,
  PRIMARY KEY (`roleId`,`privilegeId`),
  KEY `FK350BD81DB0E19C6E` (`privilegeId`),
  KEY `FK350BD81DBB0AE3B6` (`roleId`),
  CONSTRAINT `FK350BD81DB0E19C6E` FOREIGN KEY (`privilegeId`) REFERENCES `itcast_privilege` (`id`),
  CONSTRAINT `FK350BD81DBB0AE3B6` FOREIGN KEY (`roleId`) REFERENCES `itcast_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of itcast_role_privilege
-- ----------------------------
INSERT INTO `itcast_role_privilege` VALUES ('1', '2');
INSERT INTO `itcast_role_privilege` VALUES ('1', '6');
INSERT INTO `itcast_role_privilege` VALUES ('1', '8');
INSERT INTO `itcast_role_privilege` VALUES ('2', '8');
INSERT INTO `itcast_role_privilege` VALUES ('3', '8');
INSERT INTO `itcast_role_privilege` VALUES ('4', '6');
INSERT INTO `itcast_role_privilege` VALUES ('4', '8');
INSERT INTO `itcast_role_privilege` VALUES ('5', '8');
INSERT INTO `itcast_role_privilege` VALUES ('6', '8');
INSERT INTO `itcast_role_privilege` VALUES ('7', '8');
INSERT INTO `itcast_role_privilege` VALUES ('8', '8');
INSERT INTO `itcast_role_privilege` VALUES ('9', '8');
INSERT INTO `itcast_role_privilege` VALUES ('10', '8');
INSERT INTO `itcast_role_privilege` VALUES ('11', '8');
INSERT INTO `itcast_role_privilege` VALUES ('12', '8');
INSERT INTO `itcast_role_privilege` VALUES ('13', '6');
INSERT INTO `itcast_role_privilege` VALUES ('13', '8');
INSERT INTO `itcast_role_privilege` VALUES ('14', '6');
INSERT INTO `itcast_role_privilege` VALUES ('14', '8');
INSERT INTO `itcast_role_privilege` VALUES ('15', '8');
INSERT INTO `itcast_role_privilege` VALUES ('16', '8');
INSERT INTO `itcast_role_privilege` VALUES ('17', '6');
INSERT INTO `itcast_role_privilege` VALUES ('17', '8');
INSERT INTO `itcast_role_privilege` VALUES ('18', '7');
INSERT INTO `itcast_role_privilege` VALUES ('18', '8');
INSERT INTO `itcast_role_privilege` VALUES ('19', '7');
INSERT INTO `itcast_role_privilege` VALUES ('19', '8');
INSERT INTO `itcast_role_privilege` VALUES ('20', '7');
INSERT INTO `itcast_role_privilege` VALUES ('20', '8');

-- ----------------------------
-- Table structure for `itcast_topic`
-- ----------------------------
DROP TABLE IF EXISTS `itcast_topic`;
CREATE TABLE `itcast_topic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `ipAddress` varchar(255) DEFAULT NULL,
  `postTime` datetime DEFAULT NULL,
  `lastUpdateTime` datetime DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `replyCount` int(11) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `replyId` bigint(20) DEFAULT NULL,
  `forumId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK90FFD39A2B39ADCE` (`forumId`),
  KEY `FK90FFD39AC0603920` (`userId`),
  KEY `FK90FFD39A95786B20` (`replyId`),
  CONSTRAINT `FK90FFD39A2B39ADCE` FOREIGN KEY (`forumId`) REFERENCES `itcast_forum` (`id`),
  CONSTRAINT `FK90FFD39A95786B20` FOREIGN KEY (`replyId`) REFERENCES `itcast_reply` (`id`),
  CONSTRAINT `FK90FFD39AC0603920` FOREIGN KEY (`userId`) REFERENCES `itcast_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of itcast_topic
-- ----------------------------
INSERT INTO `itcast_topic` VALUES ('1', 'struts怎么样', '挺好的', null, '2017-11-05 02:58:18', '2017-11-05 02:58:23', '1', '0', '7', '1', '8');
INSERT INTO `itcast_topic` VALUES ('2', 'hibernate', 'hibernate', null, '2017-11-05 13:34:49', null, '0', '0', '1', '1', '8');
INSERT INTO `itcast_topic` VALUES ('3', 'spring', 'spring', null, '2017-11-01 13:35:44', null, '2', '0', '1', '1', '8');
INSERT INTO `itcast_topic` VALUES ('4', 'C++好学吗', '怎么样', '0:0:0:0:0:0:0:1', '2017-11-06 20:20:28', '2017-11-17 16:16:16', '0', '2', '8', '3', '8');
INSERT INTO `itcast_topic` VALUES ('5', '新人报道', '钱宝宝竟然脱单了', '0:0:0:0:0:0:0:1', '2017-11-06 20:21:40', null, '0', '0', '8', null, '5');
INSERT INTO `itcast_topic` VALUES ('6', '钱中道是不是傻子', '嗯，是的', '0:0:0:0:0:0:0:1', '2017-11-07 11:59:32', null, '0', '0', '8', null, '5');
INSERT INTO `itcast_topic` VALUES ('7', '回归啦', '我又回来啦', '0:0:0:0:0:0:0:1', '2018-02-12 21:43:37', null, '0', '0', '8', null, '8');

-- ----------------------------
-- Table structure for `itcast_user`
-- ----------------------------
DROP TABLE IF EXISTS `itcast_user`;
CREATE TABLE `itcast_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loginName` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `departmentId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4ADEC00F49BC32E` (`departmentId`),
  CONSTRAINT `FK4ADEC00F49BC32E` FOREIGN KEY (`departmentId`) REFERENCES `itcast_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of itcast_user
-- ----------------------------
INSERT INTO `itcast_user` VALUES ('1', 'zhangsan', '张三', '81dc9bdb52d04dc20036dbd8313ed055', '12345', '1460786009@qq.com', '0', 'desc', null);
INSERT INTO `itcast_user` VALUES ('6', 'wangwu', '王五', '81dc9bdb52d04dc20036dbd8313ed055', '111', '2222', '1', '33333', '3');
INSERT INTO `itcast_user` VALUES ('7', 'lisi', '李四', '81dc9bdb52d04dc20036dbd8313ed055', '22222', '333', '1', '5555', null);
INSERT INTO `itcast_user` VALUES ('8', 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', null, null, '1', null, null);
INSERT INTO `itcast_user` VALUES ('9', 'zhangsang', '张桑', '81dc9bdb52d04dc20036dbd8313ed055', '', '', '1', '', '1');
INSERT INTO `itcast_user` VALUES ('10', 'lisiq', '李思琪', '81dc9bdb52d04dc20036dbd8313ed055', '', '', '0', '', '20');
INSERT INTO `itcast_user` VALUES ('11', 'wanwu', '万五', '81dc9bdb52d04dc20036dbd8313ed055', '', '', '1', '', '1');

-- ----------------------------
-- Table structure for `itcast_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `itcast_user_role`;
CREATE TABLE `itcast_user_role` (
  `roleId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`),
  KEY `FK9C95CD55BB0AE3B6` (`roleId`),
  KEY `FK9C95CD55C0603920` (`userId`),
  CONSTRAINT `FK9C95CD55BB0AE3B6` FOREIGN KEY (`roleId`) REFERENCES `itcast_role` (`id`),
  CONSTRAINT `FK9C95CD55C0603920` FOREIGN KEY (`userId`) REFERENCES `itcast_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of itcast_user_role
-- ----------------------------
INSERT INTO `itcast_user_role` VALUES ('1', '6');
INSERT INTO `itcast_user_role` VALUES ('2', '1');
INSERT INTO `itcast_user_role` VALUES ('6', '9');
INSERT INTO `itcast_user_role` VALUES ('7', '10');
INSERT INTO `itcast_user_role` VALUES ('8', '11');
