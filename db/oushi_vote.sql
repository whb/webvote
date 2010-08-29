/*
Navicat MySQL Data Transfer

Source Server         : db
Source Server Version : 50148
Source Host           : localhost:3306
Source Database       : oushi_vote

Target Server Type    : MYSQL
Target Server Version : 50148
File Encoding         : 65001

Date: 2010-08-27 15:57:04
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `discuss_info`
-- ----------------------------
DROP TABLE IF EXISTS `discuss_info`;
CREATE TABLE `discuss_info` (
  `discuss_id` int(11) NOT NULL AUTO_INCREMENT,
  `works_id` int(11) NOT NULL,
  `discuss_commond` varchar(1000) NOT NULL,
  `discuss_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `discuss_status` varchar(1) NOT NULL DEFAULT '0',
  `discuss_member` varchar(50) DEFAULT '匿名',
  PRIMARY KEY (`discuss_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of discuss_info
-- ----------------------------
INSERT INTO `discuss_info` VALUES ('1', '3', '测试评论测试评论3', '2010-08-20 15:11:12', '1','评论用户');
INSERT INTO `discuss_info` VALUES ('2', '4', '测试评论测试评论4', '2010-08-20 15:11:12', '1','评论用户');
INSERT INTO `discuss_info` VALUES ('3', '3', '测试评论测试评论3', '2010-08-20 15:11:43', '1','评论用户');
INSERT INTO `discuss_info` VALUES ('4', '4', '测试评论测试评论4', '2010-08-20 15:11:43', '1','评论用户');
INSERT INTO `discuss_info` VALUES ('5', '3', '测试评论测试评论3', '2010-08-20 15:11:46', '1','评论用户');
INSERT INTO `discuss_info` VALUES ('6', '4', '测试评论测试评论4', '2010-08-20 15:11:46', '1','评论用户');
INSERT INTO `discuss_info` VALUES ('7', '3', '测试评论测试评论3', '2010-08-20 15:12:12', '1','评论用户');
INSERT INTO `discuss_info` VALUES ('8', '4', '测试评论测试评论4', '2010-08-20 15:12:12', '1','评论用户');
INSERT INTO `discuss_info` VALUES ('9', '4', 'discussCommond测试discuss', '2010-08-25 10:00:54', '1','评论用户');
INSERT INTO `discuss_info` VALUES ('10', '4', '我要评论 discussCommond 我要评论 discussCommond 我要评论 discussCommond 我要评论 discussCommond 我要评论 discussCommond 我要评论 discussCommond 我要评论 discussCommond ', '2010-08-25 10:06:04', '1','评论用户');
INSERT INTO `discuss_info` VALUES ('11', '4', '我要评论 discussCommond 我要评论 discussCommond', '2010-08-25 10:38:30', '1','评论用户');
INSERT INTO `discuss_info` VALUES ('12', '4', '我要评论 discussCommond 我要评论 discussCommond', '2010-08-25 10:38:34', '1','评论用户');
INSERT INTO `discuss_info` VALUES ('13', '4', '我要评论 discussCommond 我要评论 discussCommond', '2010-08-25 10:38:36', '1','评论用户');
INSERT INTO `discuss_info` VALUES ('14', '4', '我要评论 discussCommond 我要评论 discussCommond', '2010-08-25 10:39:16', '0','评论用户');
INSERT INTO `discuss_info` VALUES ('15', '4', '我要评论 discussCommond 我要评论 discussCommond', '2010-08-25 10:41:38', '0','评论用户');
INSERT INTO `discuss_info` VALUES ('16', '4', '下午评论', '2010-08-25 13:45:47', '1','评论用户');
INSERT INTO `discuss_info` VALUES ('17', '4', '再次评论', '2010-08-25 13:53:45', '0','评论用户');
INSERT INTO `discuss_info` VALUES ('18', '4', 'go no discuss', '2010-08-25 14:12:20', '0','评论用户');
INSERT INTO `discuss_info` VALUES ('19', '4', 'ping lun', '2010-08-25 14:13:27', '0','评论用户');
INSERT INTO `discuss_info` VALUES ('20', '4', 'jsp\n入门与提高', '2010-08-25 14:14:44', '0','评论用户');
INSERT INTO `discuss_info` VALUES ('21', '5', '评论评论', '2010-08-26 13:38:22', '0','评论用户');
INSERT INTO `discuss_info` VALUES ('22', '5', '评论', '2010-08-26 13:38:34', '0','评论用户');
INSERT INTO `discuss_info` VALUES ('23', '11', '评FLV', '2010-08-26 13:39:49', '1','评论用户');
INSERT INTO `discuss_info` VALUES ('24', '12', '', '2010-08-26 17:03:32', '0','评论用户');
INSERT INTO `discuss_info` VALUES ('25', '4', '我要评论 discussCommond 我要评论 discussCommond 111111111111111111', '2010-08-27 13:34:20', '0','评论用户');

-- ----------------------------
-- Table structure for `video_info`
-- ----------------------------
DROP TABLE IF EXISTS `video_info`;
CREATE TABLE `video_info` (
  `video_id` int(11) NOT NULL AUTO_INCREMENT,
  `works_id` int(11) NOT NULL,
  `video_url` varchar(500) NOT NULL,
  PRIMARY KEY (`video_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video_info
-- ----------------------------
INSERT INTO `video_info` VALUES ('1', '9',  'http://v.youku.com/v_show/id_XMjAxMjY1NzMy.html');
INSERT INTO `video_info` VALUES ('2', '10', 'http://v.youku.com/v_show/id_XMjAxMjY1NzMy.html');
INSERT INTO `video_info` VALUES ('3', '11', 'http://v.youku.com/v_show/id_XMjAxMjY1NzMy.html');
INSERT INTO `video_info` VALUES ('4', '12', 'http://v.youku.com/v_show/id_XMjAxMjY1NzMy.html');
INSERT INTO `video_info` VALUES ('5', '13', 'http://v.youku.com/v_show/id_XMjAxMjY1NzMy.html');
INSERT INTO `video_info` VALUES ('6', '14', 'http://v.youku.com/v_show/id_XMjAxMjY1NzMy.html');
INSERT INTO `video_info` VALUES ('7', '15', 'http://v.youku.com/v_show/id_XMjAxMjY1NzMy.html');

-- ----------------------------
-- Table structure for `vote_info`
-- ----------------------------
DROP TABLE IF EXISTS `vote_info`;
CREATE TABLE `vote_info` (
  `vote_id` int(11) NOT NULL AUTO_INCREMENT,
  `works_id` int(11) NOT NULL,
  `vote_ip` varchar(20) NOT NULL,
  `vote_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`vote_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vote_info
-- ----------------------------
INSERT INTO `vote_info` VALUES ('1', '1', '123', '2010-08-18 21:24:17');
INSERT INTO `vote_info` VALUES ('2', '1', '234', '2010-08-17 14:24:25');
INSERT INTO `vote_info` VALUES ('3', '3', '456', '2010-08-17 14:24:36');
INSERT INTO `vote_info` VALUES ('4', '3', '567', '2010-08-17 14:24:47');
INSERT INTO `vote_info` VALUES ('5', '6', '123', '2010-08-17 14:24:59');
INSERT INTO `vote_info` VALUES ('6', '1', '123', '2010-08-18 16:13:15');
INSERT INTO `vote_info` VALUES ('7', '1', '255.255.255.255', '2010-08-19 14:03:09');
INSERT INTO `vote_info` VALUES ('8', '6', '255.255.255.255', '2010-08-19 14:03:09');
INSERT INTO `vote_info` VALUES ('9', '8', '255.255.255.255', '2010-08-19 14:03:09');
INSERT INTO `vote_info` VALUES ('10', '9', '255.255.255.255', '2010-08-19 14:03:09');
INSERT INTO `vote_info` VALUES ('11', '10', '255.255.255.255', '2010-08-19 14:03:09');
INSERT INTO `vote_info` VALUES ('12', '1', '255.255.255.255', '2010-08-20 10:04:38');
INSERT INTO `vote_info` VALUES ('13', '6', '255.255.255.255', '2010-08-20 10:04:38');
INSERT INTO `vote_info` VALUES ('14', '8', '255.255.255.255', '2010-08-20 10:04:38');
INSERT INTO `vote_info` VALUES ('15', '9', '255.255.255.255', '2010-08-20 10:04:38');
INSERT INTO `vote_info` VALUES ('16', '10', '255.255.255.255', '2010-08-20 10:04:38');
INSERT INTO `vote_info` VALUES ('17', '1', '255.255.255.255', '2010-08-20 10:05:35');
INSERT INTO `vote_info` VALUES ('18', '6', '255.255.255.255', '2010-08-20 10:05:35');
INSERT INTO `vote_info` VALUES ('19', '8', '255.255.255.255', '2010-08-20 10:05:35');
INSERT INTO `vote_info` VALUES ('20', '9', '255.255.255.255', '2010-08-20 10:05:35');
INSERT INTO `vote_info` VALUES ('21', '10', '255.255.255.255', '2010-08-20 10:05:35');
INSERT INTO `vote_info` VALUES ('22', '1', '255.255.255.255', '2010-08-20 10:07:48');
INSERT INTO `vote_info` VALUES ('23', '6', '255.255.255.255', '2010-08-20 10:07:48');
INSERT INTO `vote_info` VALUES ('24', '8', '255.255.255.255', '2010-08-20 10:07:48');
INSERT INTO `vote_info` VALUES ('25', '9', '255.255.255.255', '2010-08-20 10:07:48');
INSERT INTO `vote_info` VALUES ('26', '10', '255.255.255.255', '2010-08-20 10:07:48');
INSERT INTO `vote_info` VALUES ('27', '1', '255.255.255.255', '2010-08-20 15:11:12');
INSERT INTO `vote_info` VALUES ('28', '6', '255.255.255.255', '2010-08-20 15:11:12');
INSERT INTO `vote_info` VALUES ('29', '8', '255.255.255.255', '2010-08-20 15:11:12');
INSERT INTO `vote_info` VALUES ('30', '9', '255.255.255.255', '2010-08-20 15:11:12');
INSERT INTO `vote_info` VALUES ('31', '10', '255.255.255.255', '2010-08-20 15:11:12');
INSERT INTO `vote_info` VALUES ('32', '1', '255.255.255.255', '2010-08-20 15:11:43');
INSERT INTO `vote_info` VALUES ('33', '6', '255.255.255.255', '2010-08-20 15:11:43');
INSERT INTO `vote_info` VALUES ('34', '8', '255.255.255.255', '2010-08-20 15:11:43');
INSERT INTO `vote_info` VALUES ('35', '9', '255.255.255.255', '2010-08-20 15:11:43');
INSERT INTO `vote_info` VALUES ('36', '10', '255.255.255.255', '2010-08-20 15:11:43');
INSERT INTO `vote_info` VALUES ('37', '1', '255.255.255.255', '2010-08-20 15:11:46');
INSERT INTO `vote_info` VALUES ('38', '6', '255.255.255.255', '2010-08-20 15:11:46');
INSERT INTO `vote_info` VALUES ('39', '8', '255.255.255.255', '2010-08-20 15:11:46');
INSERT INTO `vote_info` VALUES ('40', '9', '255.255.255.255', '2010-08-20 15:11:46');
INSERT INTO `vote_info` VALUES ('41', '10', '255.255.255.255', '2010-08-20 15:11:46');
INSERT INTO `vote_info` VALUES ('42', '1', '255.255.255.255', '2010-08-20 15:12:12');
INSERT INTO `vote_info` VALUES ('43', '6', '255.255.255.255', '2010-08-20 15:12:12');
INSERT INTO `vote_info` VALUES ('44', '8', '255.255.255.255', '2010-08-20 15:12:12');
INSERT INTO `vote_info` VALUES ('45', '9', '255.255.255.255', '2010-08-20 15:12:12');
INSERT INTO `vote_info` VALUES ('46', '10', '255.255.255.255', '2010-08-20 15:12:12');
INSERT INTO `vote_info` VALUES ('47', '1', '192.168.1.50', '2010-08-24 08:47:26');
INSERT INTO `vote_info` VALUES ('48', '7', '192.168.1.50', '2010-08-24 08:47:26');
INSERT INTO `vote_info` VALUES ('49', '6', '192.168.1.50', '2010-08-24 08:54:42');
INSERT INTO `vote_info` VALUES ('50', '5', '192.168.1.50', '2010-08-24 08:54:42');
INSERT INTO `vote_info` VALUES ('51', '4', '192.168.1.50', '2010-08-24 08:54:42');
INSERT INTO `vote_info` VALUES ('52', '1', '192.168.1.50', '2010-08-24 08:59:32');
INSERT INTO `vote_info` VALUES ('53', '7', '192.168.1.50', '2010-08-24 08:59:33');
INSERT INTO `vote_info` VALUES ('54', '5', '192.168.1.50', '2010-08-24 08:59:34');
INSERT INTO `vote_info` VALUES ('55', '1', '192.168.1.50', '2010-08-24 09:03:38');
INSERT INTO `vote_info` VALUES ('56', '7', '192.168.1.50', '2010-08-24 09:03:38');
INSERT INTO `vote_info` VALUES ('57', '3', '192.168.1.50', '2010-08-24 10:06:20');
INSERT INTO `vote_info` VALUES ('58', '5', '192.168.1.50', '2010-08-24 10:06:20');
INSERT INTO `vote_info` VALUES ('59', '8', '192.168.1.50', '2010-08-24 10:06:20');
INSERT INTO `vote_info` VALUES ('60', '3', '192.168.1.50', '2010-08-24 10:11:05');
INSERT INTO `vote_info` VALUES ('61', '5', '192.168.1.50', '2010-08-24 10:11:05');
INSERT INTO `vote_info` VALUES ('62', '3', '192.168.1.50', '2010-08-24 10:15:38');
INSERT INTO `vote_info` VALUES ('63', '7', '192.168.1.50', '2010-08-24 10:15:38');
INSERT INTO `vote_info` VALUES ('64', '5', '192.168.1.50', '2010-08-24 10:15:38');
INSERT INTO `vote_info` VALUES ('65', '7', '192.168.1.50', '2010-08-24 10:22:40');
INSERT INTO `vote_info` VALUES ('66', '3', '192.168.1.50', '2010-08-24 10:31:32');
INSERT INTO `vote_info` VALUES ('67', '1', '192.168.1.50', '2010-08-24 10:31:32');
INSERT INTO `vote_info` VALUES ('68', '4', '192.168.1.50', '2010-08-24 10:31:32');
INSERT INTO `vote_info` VALUES ('69', '7', '192.168.1.50', '2010-08-24 10:38:10');
INSERT INTO `vote_info` VALUES ('70', '5', '192.168.1.50', '2010-08-24 10:38:10');
INSERT INTO `vote_info` VALUES ('71', '1', '192.168.1.50', '2010-08-24 13:28:04');
INSERT INTO `vote_info` VALUES ('72', '6', '192.168.1.50', '2010-08-24 13:28:04');
INSERT INTO `vote_info` VALUES ('73', '8', '192.168.1.50', '2010-08-24 13:28:04');
INSERT INTO `vote_info` VALUES ('74', '4', '192.168.1.50', '2010-08-24 13:33:02');
INSERT INTO `vote_info` VALUES ('75', '3', '192.168.1.50', '2010-08-24 13:36:04');
INSERT INTO `vote_info` VALUES ('76', '4', '192.168.1.50', '2010-08-24 13:36:04');
INSERT INTO `vote_info` VALUES ('77', '1', '192.168.1.50', '2010-08-24 14:46:29');
INSERT INTO `vote_info` VALUES ('78', '6', '192.168.1.50', '2010-08-24 14:46:29');
INSERT INTO `vote_info` VALUES ('79', '1', '192.168.1.50', '2010-08-25 08:22:37');
INSERT INTO `vote_info` VALUES ('80', '6', '192.168.1.50', '2010-08-25 08:22:37');
INSERT INTO `vote_info` VALUES ('81', '6', '192.168.1.50', '2010-08-25 09:39:09');
INSERT INTO `vote_info` VALUES ('82', '5', '192.168.1.50', '2010-08-25 09:39:09');
INSERT INTO `vote_info` VALUES ('83', '4', '192.168.1.50', '2010-08-25 09:39:09');
INSERT INTO `vote_info` VALUES ('84', '8', '192.168.1.50', '2010-08-25 09:39:09');
INSERT INTO `vote_info` VALUES ('85', '3', '192.168.1.50', '2010-08-25 09:47:11');
INSERT INTO `vote_info` VALUES ('86', '5', '192.168.1.50', '2010-08-25 09:47:11');
INSERT INTO `vote_info` VALUES ('87', '6', '192.168.1.50', '2010-08-25 14:43:54');
INSERT INTO `vote_info` VALUES ('88', '8', '192.168.1.50', '2010-08-25 14:43:54');
INSERT INTO `vote_info` VALUES ('89', '4', '192.168.1.50', '2010-08-25 14:50:27');
INSERT INTO `vote_info` VALUES ('90', '2', '192.168.1.50', '2010-08-26 09:56:15');
INSERT INTO `vote_info` VALUES ('91', '19', '192.168.1.50', '2010-08-26 13:24:14');
INSERT INTO `vote_info` VALUES ('92', '10', '192.168.1.50', '2010-08-26 13:39:35');
INSERT INTO `vote_info` VALUES ('93', '9', '192.168.1.50', '2010-08-26 13:39:35');
INSERT INTO `vote_info` VALUES ('94', '17', '192.168.1.50', '2010-08-26 17:03:17');
INSERT INTO `vote_info` VALUES ('95', '10', '192.168.1.50', '2010-08-27 13:04:38');
INSERT INTO `vote_info` VALUES ('96', '6', '192.168.1.50', '2010-08-27 13:04:38');
INSERT INTO `vote_info` VALUES ('97', '9', '192.168.1.50', '2010-08-27 13:04:38');
INSERT INTO `vote_info` VALUES ('98', '3', '192.168.1.50', '2010-08-27 13:33:31');
INSERT INTO `vote_info` VALUES ('99', '4', '192.168.1.50', '2010-08-27 13:33:31');
INSERT INTO `vote_info` VALUES ('100', '1', '192.168.1.50', '2010-08-27 13:36:43');
INSERT INTO `vote_info` VALUES ('101', '9', '192.168.1.50', '2010-08-27 13:36:43');
INSERT INTO `vote_info` VALUES ('102', '11', '192.168.1.50', '2010-08-27 13:36:43');
INSERT INTO `vote_info` VALUES ('103', '12', '192.168.1.50', '2010-08-27 13:36:43');

-- ----------------------------
-- Table structure for `works_info`
-- ----------------------------
DROP TABLE IF EXISTS `works_info`;
CREATE TABLE `works_info` (
  `works_id` int(11) NOT NULL AUTO_INCREMENT,
  `works_title` varchar(50) NOT NULL,
  `works_author` varchar(50) NOT NULL,
  `works_recommond` varchar(1000) DEFAULT NULL,
  `works_file_name` varchar(100) NOT NULL,
  `works_type` varchar(3) NOT NULL,
  `works_release_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`works_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of works_info
-- ----------------------------
INSERT INTO `works_info` VALUES ('1', '测试数据title1', '测试author1', '测试测试测试测试recommond1', 'test1.jpg', 'jpg', '2010-08-12 17:05:43');
INSERT INTO `works_info` VALUES ('2', '测试数据title2', 'testauthor2', 'testrecommond2', 'test2.jpg', 'flv', '2010-08-12 17:06:48');
INSERT INTO `works_info` VALUES ('3', '测试数据title3', '测试author3', '测试测试测试测试recommond3', 'test3.jpg', 'jpg', '2010-08-16 12:40:36');
INSERT INTO `works_info` VALUES ('4', '测试数据title4', '测试author4', '测试测试测试测试recommond4', 'test4.jpg', 'jpg', '2010-08-16 12:56:12');
INSERT INTO `works_info` VALUES ('5', '测试数据title5', '测试author5', '测试测试测试测试recommond5', 'test5.jpg', 'jpg', '2010-08-16 12:56:16');
INSERT INTO `works_info` VALUES ('6', '测试数据title6', '测试author6', '测试测试测试测试recommond6', 'test6.jpg', 'jpg', '2010-08-16 12:56:19');
INSERT INTO `works_info` VALUES ('7', '测试数据title7', '测试author7', '测试测试测试测试recommond7', 'test7.jpg', 'jpg', '2010-08-16 12:56:21');
INSERT INTO `works_info` VALUES ('8', '测试数据title8', '测试author8', '测试测试测试测试recommond8', 'test8.jpg', 'jpg', '2010-08-16 12:56:24');
INSERT INTO `works_info` VALUES ('9', '测试数据title9', 'testauthor9', 'testrecommond9', 'test9.jpg', 'flv', '2010-08-12 17:06:48');
INSERT INTO `works_info` VALUES ('10', '测试数据title10', 'testauthor10', 'testrecommond10', 'test10.jpg', 'flv', '2010-08-12 17:06:49');
INSERT INTO `works_info` VALUES ('11', '测试数据title11', 'testauthor11', 'testrecommond11', 'test11.jpg', 'flv', '2010-08-12 17:06:50');
INSERT INTO `works_info` VALUES ('12', '测试数据title12', 'testauthor12', 'testrecommond12', 'test12.jpg', 'flv', '2010-08-12 17:06:51');
INSERT INTO `works_info` VALUES ('13', '测试数据title13', 'testauthor13', 'testrecommond13', 'test13.jpg', 'flv', '2010-08-12 17:06:52');
INSERT INTO `works_info` VALUES ('14', '测试数据title14', 'testauthor14', 'testrecommond14', 'test14.jpg', 'flv', '2010-08-12 17:06:53');
INSERT INTO `works_info` VALUES ('15', '测试数据title15', 'testauthor15', 'testrecommond15', 'test15.jpg', 'flv', '2010-08-12 17:06:54');
INSERT INTO `works_info` VALUES ('16', '测试数据title16', 'testauthor16', 'testrecommond16', 'test16.jpg', 'flv', '2010-08-12 17:06:55');
INSERT INTO `works_info` VALUES ('17', '测试数据title17', 'testauthor17', 'testrecommond17', 'test17.jpg', 'flv', '2010-08-12 17:06:56');
INSERT INTO `works_info` VALUES ('18', '测试数据title18', 'testauthor18', 'testrecommond18', 'test18.jpg', 'flv', '2010-08-12 17:06:57');
INSERT INTO `works_info` VALUES ('19', '测试数据title19', 'testauthor19', 'testrecommond19', 'test19.jpg', 'flv', '2010-08-12 17:06:58');
INSERT INTO `works_info` VALUES ('20', '测试数据title20', 'testauthor20', 'testrecommond20', 'test20.jpg', 'flv', '2010-08-12 17:06:59');
