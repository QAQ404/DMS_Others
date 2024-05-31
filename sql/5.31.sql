/*
Navicat MySQL Data Transfer

Source Server         : mydb
Source Server Version : 80026
Source Host           : localhost:3306
Source Database       : dormitory_management_system

Target Server Type    : MYSQL
Target Server Version : 80026
File Encoding         : 65001

Date: 2024-05-31 10:24:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for building
-- ----------------------------
DROP TABLE IF EXISTS `building`;
CREATE TABLE `building` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '宿舍楼编号',
  `name` varchar(10) NOT NULL COMMENT '宿舍楼名称',
  `manager_id` int NOT NULL COMMENT '宿管编号',
  `unit_number` int DEFAULT '1' COMMENT '寝室楼单元数',
  `dor_number` int DEFAULT '0' COMMENT '宿舍楼内寝室数量',
  `stu_number` int DEFAULT '0' COMMENT '宿舍楼内学生数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `building_name_uindex` (`name`),
  KEY `building_manager_user_id_fk` (`manager_id`),
  CONSTRAINT `building_manager_user_id_fk` FOREIGN KEY (`manager_id`) REFERENCES `manager` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='宿舍楼';

-- ----------------------------
-- Records of building
-- ----------------------------
INSERT INTO `building` VALUES ('1', '1栋', '2', '2', '30', '65');
INSERT INTO `building` VALUES ('2', '2栋', '4', '2', '20', '47');
INSERT INTO `building` VALUES ('3', '3栋', '3', '2', '15', '48');
INSERT INTO `building` VALUES ('4', '4栋', '5', '2', '10', '20');
INSERT INTO `building` VALUES ('5', '5栋', '7', '2', '0', '0');
INSERT INTO `building` VALUES ('6', '6栋', '1', '2', '0', '0');
INSERT INTO `building` VALUES ('7', '7栋', '1', '2', '0', '0');
INSERT INTO `building` VALUES ('8', '8栋', '1', '2', '0', '0');
INSERT INTO `building` VALUES ('9', '9栋', '1', '2', '0', '0');
INSERT INTO `building` VALUES ('14', '临时宿舍楼', '1', '1', '1', '0');

-- ----------------------------
-- Table structure for building_info
-- ----------------------------
DROP TABLE IF EXISTS `building_info`;
CREATE TABLE `building_info` (
  `building_id` int DEFAULT NULL COMMENT '对应的宿舍楼编号',
  `build_year` date DEFAULT NULL COMMENT '建造日期',
  `introduction` text COMMENT '宿舍楼的介绍',
  `picture` varchar(256) DEFAULT NULL COMMENT '照片',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `floor_number` int DEFAULT '1' COMMENT '楼层数',
  KEY `buildingInfo_building_id_fk` (`building_id`),
  CONSTRAINT `buildingInfo_building_id_fk` FOREIGN KEY (`building_id`) REFERENCES `building` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='宿舍楼的详细信息';

-- ----------------------------
-- Records of building_info
-- ----------------------------
INSERT INTO `building_info` VALUES ('1', '2010-09-02', '1栋是个好宿舍，这是男寝。', 'https://hzh-biyesheji.oss-cn-beijing.aliyuncs.com/eee6da89-2a5e-4d5f-a8e3-a445041b5602.jpg', '2024-05-29 09:49:26', '3');
INSERT INTO `building_info` VALUES ('2', '2024-01-01', '这是女寝', 'https://hzh-biyesheji.oss-cn-beijing.aliyuncs.com/f56ad0cb-014c-4bbd-9819-5113c8d1bf6d.jpg', '2024-05-28 21:58:35', '2');
INSERT INTO `building_info` VALUES ('3', '2024-01-01', '这是男寝', 'https://hzh-biyesheji.oss-cn-beijing.aliyuncs.com/9a4a1b1a-a565-4520-9fec-385048eff266.jpg', '2024-05-29 09:37:59', '2');
INSERT INTO `building_info` VALUES ('4', '2024-02-01', '这是女寝。', 'https://hzh-biyesheji.oss-cn-beijing.aliyuncs.com/1ed8c683-4960-46fd-8af2-22166c1ef9b8.jpg', '2024-05-29 09:38:22', '2');
INSERT INTO `building_info` VALUES ('5', null, '这是男生寝室。', 'https://hzh-biyesheji.oss-cn-beijing.aliyuncs.com/c4c4682b-5c49-46c4-a2a0-80856beb464a.jpg', '2024-05-29 09:38:37', '2');
INSERT INTO `building_info` VALUES ('6', null, null, 'https://hzh-biyesheji.oss-cn-beijing.aliyuncs.com/547bd3bd-65c5-43ae-a279-7c9f40089774.jpg', '2024-05-28 19:46:02', '2');
INSERT INTO `building_info` VALUES ('7', '2020-01-02', null, 'https://hzh-biyesheji.oss-cn-beijing.aliyuncs.com/86443b56-a6cd-43fc-a923-2c5f0cdc15c6.jpg', '2024-05-28 19:49:10', '2');
INSERT INTO `building_info` VALUES ('8', null, null, 'https://hzh-biyesheji.oss-cn-beijing.aliyuncs.com/9c26b930-bfd1-4638-b355-439c936f657e.jpg', '2024-05-28 19:47:30', '2');
INSERT INTO `building_info` VALUES ('9', null, null, 'https://hzh-biyesheji.oss-cn-beijing.aliyuncs.com/9aa0f8c7-0387-457b-9458-50a45f50c242.jpg', '2024-05-28 19:47:23', '2');
INSERT INTO `building_info` VALUES ('14', null, null, null, '2024-05-01 21:42:09', '1');

-- ----------------------------
-- Table structure for change_dormitory_application
-- ----------------------------
DROP TABLE IF EXISTS `change_dormitory_application`;
CREATE TABLE `change_dormitory_application` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `stu_id` int DEFAULT NULL COMMENT '学生ID',
  `old_id` int DEFAULT NULL COMMENT '交换者寝室',
  `new_dormitory_id` int DEFAULT NULL COMMENT '新寝室ID',
  `new_stu_id` int DEFAULT NULL COMMENT '被交换学生的Id',
  `new_stu_name` varchar(20) DEFAULT NULL COMMENT '被换学生的姓名',
  `new_stu_study_id` varchar(20) DEFAULT NULL COMMENT '被换学生的学号',
  `state` int DEFAULT NULL COMMENT '状态，2是同意，1是拒绝，0是未处理,-1是已失效',
  `create_time` datetime DEFAULT NULL COMMENT '申请时间',
  `update_time` datetime DEFAULT NULL COMMENT '处理时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='申请换寝表';

-- ----------------------------
-- Records of change_dormitory_application
-- ----------------------------
INSERT INTO `change_dormitory_application` VALUES ('22', '15', '1', '7', '-1', null, null, '2', '2024-02-28 21:43:36', '2024-02-28 23:35:51');
INSERT INTO `change_dormitory_application` VALUES ('23', '11', '2', '7', '-1', null, null, '1', '2024-02-28 21:43:46', '2024-02-28 23:35:54');
INSERT INTO `change_dormitory_application` VALUES ('27', '23', '1', '34', '-1', null, null, '2', '2024-05-28 22:53:26', '2024-05-28 22:53:32');
INSERT INTO `change_dormitory_application` VALUES ('28', '8', '2', '7', '18', '李二', '202001010202', '-1', '2024-05-30 14:34:01', '2024-05-30 14:36:55');
INSERT INTO `change_dormitory_application` VALUES ('29', '12', '33', '62', '-1', null, null, '2', '2024-05-30 14:37:30', '2024-05-30 14:40:37');
INSERT INTO `change_dormitory_application` VALUES ('30', '35', '10', '62', '-1', null, null, '-1', '2024-05-30 14:38:32', '2024-05-30 14:40:37');

-- ----------------------------
-- Table structure for clazz
-- ----------------------------
DROP TABLE IF EXISTS `clazz`;
CREATE TABLE `clazz` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '班级编号',
  `name` int DEFAULT NULL COMMENT '班级号',
  `stu_number` int DEFAULT '0' COMMENT '学生数',
  `major_id` int DEFAULT NULL COMMENT '专业id',
  `entrance_year` int NOT NULL COMMENT '年级',
  PRIMARY KEY (`id`),
  KEY `clazz_major_id_fk` (`major_id`),
  CONSTRAINT `clazz_major_id_fk` FOREIGN KEY (`major_id`) REFERENCES `major` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='班级';

-- ----------------------------
-- Records of clazz
-- ----------------------------
INSERT INTO `clazz` VALUES ('1', '1', '6', '1', '2020');
INSERT INTO `clazz` VALUES ('4', '1', '0', '7', '2020');
INSERT INTO `clazz` VALUES ('5', '2', '6', '1', '2020');
INSERT INTO `clazz` VALUES ('8', '1', '6', '1', '2021');
INSERT INTO `clazz` VALUES ('9', '2', '6', '1', '2021');
INSERT INTO `clazz` VALUES ('12', '1', '0', '7', '2021');
INSERT INTO `clazz` VALUES ('13', '1', '4', '5', '2020');
INSERT INTO `clazz` VALUES ('15', '1', '4', '5', '2021');
INSERT INTO `clazz` VALUES ('16', '1', '4', '6', '2020');
INSERT INTO `clazz` VALUES ('17', '1', '4', '6', '2021');
INSERT INTO `clazz` VALUES ('18', '1', '4', '8', '2020');
INSERT INTO `clazz` VALUES ('19', '2', '4', '8', '2020');
INSERT INTO `clazz` VALUES ('20', '3', '4', '8', '2020');
INSERT INTO `clazz` VALUES ('21', '1', '4', '8', '2021');
INSERT INTO `clazz` VALUES ('22', '2', '4', '8', '2021');
INSERT INTO `clazz` VALUES ('23', '1', '4', '9', '2020');
INSERT INTO `clazz` VALUES ('24', '1', '4', '9', '2021');
INSERT INTO `clazz` VALUES ('25', '1', '4', '10', '2020');
INSERT INTO `clazz` VALUES ('26', '2', '4', '10', '2020');
INSERT INTO `clazz` VALUES ('27', '1', '4', '10', '2021');
INSERT INTO `clazz` VALUES ('28', '2', '4', '10', '2021');
INSERT INTO `clazz` VALUES ('29', '1', '4', '11', '2020');
INSERT INTO `clazz` VALUES ('30', '2', '4', '11', '2020');
INSERT INTO `clazz` VALUES ('31', '1', '4', '11', '2021');
INSERT INTO `clazz` VALUES ('32', '1', '4', '12', '2020');
INSERT INTO `clazz` VALUES ('33', '1', '4', '12', '2021');
INSERT INTO `clazz` VALUES ('34', '1', '4', '13', '2020');
INSERT INTO `clazz` VALUES ('35', '2', '4', '13', '2020');
INSERT INTO `clazz` VALUES ('36', '1', '4', '14', '2020');
INSERT INTO `clazz` VALUES ('37', '2', '4', '14', '2020');
INSERT INTO `clazz` VALUES ('38', '1', '4', '15', '2020');
INSERT INTO `clazz` VALUES ('39', '2', '4', '15', '2020');
INSERT INTO `clazz` VALUES ('40', '1', '4', '16', '2020');
INSERT INTO `clazz` VALUES ('41', '2', '4', '16', '2020');
INSERT INTO `clazz` VALUES ('42', '1', '4', '17', '2020');
INSERT INTO `clazz` VALUES ('43', '2', '4', '17', '2020');
INSERT INTO `clazz` VALUES ('44', '3', '4', '17', '2020');
INSERT INTO `clazz` VALUES ('45', '1', '4', '13', '2021');
INSERT INTO `clazz` VALUES ('46', '1', '4', '14', '2021');
INSERT INTO `clazz` VALUES ('47', '1', '4', '16', '2021');
INSERT INTO `clazz` VALUES ('48', '1', '4', '17', '2021');
INSERT INTO `clazz` VALUES ('49', '1', '4', '15', '2021');
INSERT INTO `clazz` VALUES ('50', '3', '6', '1', '2020');
INSERT INTO `clazz` VALUES ('51', '3', '6', '1', '2021');

-- ----------------------------
-- Table structure for dormitory
-- ----------------------------
DROP TABLE IF EXISTS `dormitory`;
CREATE TABLE `dormitory` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '寝室编号',
  `building_id` int DEFAULT NULL COMMENT '所属楼栋的编号',
  `name` varchar(10) NOT NULL COMMENT '寝室名称',
  `unit_number` int DEFAULT '1' COMMENT '寝室所在单元号',
  `stu_number` int DEFAULT '0' COMMENT '学生人数',
  `bed_number` int DEFAULT NULL COMMENT '寝室床位数量',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `floor_number` int DEFAULT '1' COMMENT '所在楼层',
  `picture` varchar(256) DEFAULT NULL COMMENT '照片',
  PRIMARY KEY (`id`),
  KEY `dormitory_building_id_fk` (`building_id`),
  CONSTRAINT `dormitory_building_id_fk` FOREIGN KEY (`building_id`) REFERENCES `building` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='学生寝室';

-- ----------------------------
-- Records of dormitory
-- ----------------------------
INSERT INTO `dormitory` VALUES ('1', '14', '暂未分配寝室', '1', '0', '99999', '2024-02-14 10:07:11', '1', null);
INSERT INTO `dormitory` VALUES ('2', '1', '101', '1', '1', '4', '2024-02-28 19:59:48', '1', 'https://hzh-biyesheji.oss-cn-beijing.aliyuncs.com/4197b720-6085-4389-87d7-cf284430aa7f.jpg');
INSERT INTO `dormitory` VALUES ('7', '1', '102', '1', '4', '4', '2024-02-28 19:59:46', '1', null);
INSERT INTO `dormitory` VALUES ('8', '1', '103', '1', '4', '4', '2024-01-30 10:36:40', '1', null);
INSERT INTO `dormitory` VALUES ('9', '1', '104', '1', '4', '4', '2024-01-30 10:36:46', '1', null);
INSERT INTO `dormitory` VALUES ('10', '1', '105', '1', '4', '4', '2024-01-30 10:36:58', '1', null);
INSERT INTO `dormitory` VALUES ('16', '1', '201', '1', '4', '4', '2024-02-23 12:05:55', '2', null);
INSERT INTO `dormitory` VALUES ('17', '1', '202', '1', '4', '4', '2024-01-30 10:37:28', '2', null);
INSERT INTO `dormitory` VALUES ('18', '1', '203', '1', '4', '4', '2024-01-30 10:37:32', '2', null);
INSERT INTO `dormitory` VALUES ('19', '1', '204', '1', '4', '4', '2024-01-30 10:37:35', '2', null);
INSERT INTO `dormitory` VALUES ('20', '1', '205', '1', '4', '4', '2024-01-30 10:37:49', '2', null);
INSERT INTO `dormitory` VALUES ('23', '1', '101', '2', '4', '4', '2024-05-28 19:58:49', '1', null);
INSERT INTO `dormitory` VALUES ('24', '1', '102', '2', '4', '4', '2024-05-28 21:35:31', '1', null);
INSERT INTO `dormitory` VALUES ('25', '1', '103', '2', '4', '4', '2024-05-28 21:35:31', '1', null);
INSERT INTO `dormitory` VALUES ('26', '1', '104', '2', '4', '4', '2024-05-28 21:35:31', '1', null);
INSERT INTO `dormitory` VALUES ('27', '1', '105', '2', '4', '4', '2024-05-28 21:35:31', '1', null);
INSERT INTO `dormitory` VALUES ('28', '1', '201', '2', '4', '4', '2024-05-28 21:36:06', '2', null);
INSERT INTO `dormitory` VALUES ('29', '1', '202', '2', '4', '4', '2024-05-28 21:36:06', '2', null);
INSERT INTO `dormitory` VALUES ('30', '1', '203', '2', '0', '4', '2024-05-28 21:36:06', '2', null);
INSERT INTO `dormitory` VALUES ('31', '1', '204', '2', '0', '4', '2024-05-28 21:36:06', '2', null);
INSERT INTO `dormitory` VALUES ('32', '1', '205', '2', '0', '4', '2024-05-28 21:36:06', '2', null);
INSERT INTO `dormitory` VALUES ('33', '2', '101', '1', '3', '4', '2024-05-28 22:00:06', '1', null);
INSERT INTO `dormitory` VALUES ('34', '2', '102', '1', '4', '4', '2024-05-28 22:00:06', '1', null);
INSERT INTO `dormitory` VALUES ('35', '2', '103', '1', '4', '4', '2024-05-28 22:00:06', '1', null);
INSERT INTO `dormitory` VALUES ('36', '2', '104', '1', '4', '4', '2024-05-28 22:00:06', '1', null);
INSERT INTO `dormitory` VALUES ('37', '2', '105', '1', '4', '4', '2024-05-28 22:00:06', '1', null);
INSERT INTO `dormitory` VALUES ('38', '2', '201', '1', '4', '4', '2024-05-28 22:02:22', '2', null);
INSERT INTO `dormitory` VALUES ('39', '2', '202', '1', '4', '4', '2024-05-28 22:02:22', '2', null);
INSERT INTO `dormitory` VALUES ('40', '2', '203', '1', '4', '4', '2024-05-28 22:02:22', '2', null);
INSERT INTO `dormitory` VALUES ('41', '2', '204', '1', '4', '4', '2024-05-28 22:02:22', '2', null);
INSERT INTO `dormitory` VALUES ('42', '2', '205', '1', '4', '4', '2024-05-28 22:02:22', '2', null);
INSERT INTO `dormitory` VALUES ('43', '2', '101', '2', '4', '4', '2024-05-28 22:02:45', '1', null);
INSERT INTO `dormitory` VALUES ('44', '2', '102', '2', '4', '4', '2024-05-28 22:02:45', '1', null);
INSERT INTO `dormitory` VALUES ('45', '2', '103', '2', '0', '4', '2024-05-28 22:02:45', '1', null);
INSERT INTO `dormitory` VALUES ('46', '2', '104', '2', '0', '4', '2024-05-28 22:02:45', '1', null);
INSERT INTO `dormitory` VALUES ('47', '2', '105', '2', '0', '4', '2024-05-28 22:02:45', '1', null);
INSERT INTO `dormitory` VALUES ('48', '2', '201', '2', '0', '4', '2024-05-28 22:03:06', '2', null);
INSERT INTO `dormitory` VALUES ('49', '2', '202', '2', '0', '4', '2024-05-28 22:03:06', '2', null);
INSERT INTO `dormitory` VALUES ('50', '2', '203', '2', '0', '4', '2024-05-28 22:03:06', '2', null);
INSERT INTO `dormitory` VALUES ('51', '2', '204', '2', '0', '4', '2024-05-28 22:03:06', '2', null);
INSERT INTO `dormitory` VALUES ('52', '2', '205', '2', '0', '4', '2024-05-28 22:03:06', '2', null);
INSERT INTO `dormitory` VALUES ('53', '3', '101', '1', '4', '4', '2024-05-29 09:44:13', '1', null);
INSERT INTO `dormitory` VALUES ('54', '3', '102', '1', '4', '4', '2024-05-29 09:44:13', '1', null);
INSERT INTO `dormitory` VALUES ('55', '3', '103', '1', '4', '4', '2024-05-29 09:44:13', '1', null);
INSERT INTO `dormitory` VALUES ('56', '3', '104', '1', '4', '4', '2024-05-29 09:44:13', '1', null);
INSERT INTO `dormitory` VALUES ('57', '3', '105', '1', '4', '4', '2024-05-29 09:44:13', '1', null);
INSERT INTO `dormitory` VALUES ('58', '4', '101', '1', '4', '4', '2024-05-29 09:47:39', '1', null);
INSERT INTO `dormitory` VALUES ('59', '4', '102', '1', '4', '4', '2024-05-29 09:47:39', '1', null);
INSERT INTO `dormitory` VALUES ('60', '4', '103', '1', '4', '4', '2024-05-29 09:47:39', '1', null);
INSERT INTO `dormitory` VALUES ('61', '4', '104', '1', '4', '4', '2024-05-29 09:47:39', '1', null);
INSERT INTO `dormitory` VALUES ('62', '4', '105', '1', '4', '4', '2024-05-29 09:47:39', '1', null);
INSERT INTO `dormitory` VALUES ('63', '1', '301', '1', '0', '4', '2024-05-29 09:49:49', '3', null);
INSERT INTO `dormitory` VALUES ('64', '1', '302', '1', '0', '4', '2024-05-29 09:49:49', '3', null);
INSERT INTO `dormitory` VALUES ('65', '1', '303', '1', '0', '4', '2024-05-29 09:49:49', '3', null);
INSERT INTO `dormitory` VALUES ('66', '1', '304', '1', '0', '4', '2024-05-29 09:49:49', '3', null);
INSERT INTO `dormitory` VALUES ('67', '1', '305', '1', '0', '4', '2024-05-29 09:49:49', '3', null);
INSERT INTO `dormitory` VALUES ('68', '1', '301', '2', '0', '4', '2024-05-29 09:50:13', '3', null);
INSERT INTO `dormitory` VALUES ('69', '1', '302', '2', '0', '4', '2024-05-29 09:50:13', '3', null);
INSERT INTO `dormitory` VALUES ('70', '1', '303', '2', '0', '4', '2024-05-29 09:50:13', '3', null);
INSERT INTO `dormitory` VALUES ('71', '1', '304', '2', '0', '4', '2024-05-29 09:50:13', '3', null);
INSERT INTO `dormitory` VALUES ('72', '1', '305', '2', '0', '4', '2024-05-29 09:50:13', '3', null);
INSERT INTO `dormitory` VALUES ('73', '3', '101', '2', '4', '4', '2024-05-29 09:50:46', '1', null);
INSERT INTO `dormitory` VALUES ('74', '3', '102', '2', '4', '4', '2024-05-29 09:50:46', '1', null);
INSERT INTO `dormitory` VALUES ('75', '3', '103', '2', '4', '4', '2024-05-29 09:50:46', '1', null);
INSERT INTO `dormitory` VALUES ('76', '3', '104', '2', '4', '4', '2024-05-29 09:50:46', '1', null);
INSERT INTO `dormitory` VALUES ('77', '3', '105', '2', '4', '4', '2024-05-29 09:50:46', '1', null);
INSERT INTO `dormitory` VALUES ('78', '4', '101', '2', '0', '4', '2024-05-29 09:51:15', '1', null);
INSERT INTO `dormitory` VALUES ('79', '4', '102', '2', '0', '4', '2024-05-29 09:51:15', '1', null);
INSERT INTO `dormitory` VALUES ('80', '4', '103', '2', '0', '4', '2024-05-29 09:51:15', '1', null);
INSERT INTO `dormitory` VALUES ('81', '4', '104', '2', '0', '4', '2024-05-29 09:51:15', '1', null);
INSERT INTO `dormitory` VALUES ('82', '4', '105', '2', '0', '4', '2024-05-29 09:51:15', '1', null);
INSERT INTO `dormitory` VALUES ('83', '3', '201', '1', '4', '4', '2024-05-29 13:54:52', '2', null);
INSERT INTO `dormitory` VALUES ('84', '3', '202', '1', '4', '4', '2024-05-29 13:54:52', '2', null);
INSERT INTO `dormitory` VALUES ('85', '3', '203', '1', '0', '4', '2024-05-29 13:54:52', '2', null);
INSERT INTO `dormitory` VALUES ('86', '3', '204', '1', '0', '4', '2024-05-29 13:54:52', '2', null);
INSERT INTO `dormitory` VALUES ('87', '3', '205', '1', '0', '4', '2024-05-29 13:54:52', '2', null);

-- ----------------------------
-- Table structure for email
-- ----------------------------
DROP TABLE IF EXISTS `email`;
CREATE TABLE `email` (
  `id` int NOT NULL AUTO_INCREMENT,
  `send` int DEFAULT NULL COMMENT '发送人id',
  `send_id` varchar(20) DEFAULT NULL COMMENT '发送人学号/工作编号',
  `send_show` int DEFAULT '1',
  `re` int DEFAULT NULL COMMENT '接收人id',
  `re_id` varchar(20) DEFAULT NULL COMMENT '接收人学号/工作编号',
  `re_show` int DEFAULT '1',
  `theme` varchar(64) DEFAULT NULL COMMENT '主题',
  `content` text COMMENT '邮件内容',
  `create_time` datetime DEFAULT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of email
-- ----------------------------
INSERT INTO `email` VALUES ('1', '1', '20240001', '1', '2', '20240002', '1', '好好工作', '<p><span style=\"background-color: rgb(230, 0, 0);\">务必</span>好好担起<strong>宿管</strong>的责任</p>', '2024-05-02 21:44:07');
INSERT INTO `email` VALUES ('2', '8', '202001010101', '1', '1', '20240001', '1', '赞美宿舍', '<p><u>感谢宿管</u></p><p><strong>给我们</strong></p><p><em>提供</em></p><p><span style=\"color: rgb(230, 0, 0);\">这么好的</span></p><p><s>宿舍</s></p>', '2024-05-03 10:21:09');
INSERT INTO `email` VALUES ('3', '1', '20240001', '1', '8', '202001010101', '1', '你也要好好学习', '<p><span class=\"ql-size-large\">已经收到了你的夸奖，你也要</span><span class=\"ql-size-large\" style=\"background-color: rgb(255, 255, 102);\">好好学习</span><span class=\"ql-size-large\">在寝室</span></p>', '2024-05-03 10:46:52');

-- ----------------------------
-- Table structure for institute
-- ----------------------------
DROP TABLE IF EXISTS `institute`;
CREATE TABLE `institute` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '学院编号\n',
  `name` varchar(20) NOT NULL COMMENT '学院名称',
  `major_number` int DEFAULT '0' COMMENT '专业数',
  `clazz_number` int DEFAULT '0' COMMENT '班级数',
  `stu_number` int DEFAULT '0' COMMENT '学院的学生数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `institute_name_uindex` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='学院';

-- ----------------------------
-- Records of institute
-- ----------------------------
INSERT INTO `institute` VALUES ('1', '软件学院', '3', '10', '52');
INSERT INTO `institute` VALUES ('3', '土木学院', '2', '7', '28');
INSERT INTO `institute` VALUES ('5', '临时学院', '1', '2', '0');
INSERT INTO `institute` VALUES ('7', '国际学院', '1', '4', '16');
INSERT INTO `institute` VALUES ('8', '人文社会科学学院', '2', '5', '20');
INSERT INTO `institute` VALUES ('9', '交通运输工程学院', '5', '16', '64');

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '专业编号',
  `name` varchar(20) NOT NULL COMMENT '专业名称',
  `clazz_number` int DEFAULT '0' COMMENT '班级数',
  `ins_id` int DEFAULT NULL COMMENT '学院id',
  `stu_number` int DEFAULT '0' COMMENT '学生数',
  PRIMARY KEY (`id`),
  KEY `major_institute_id_fk` (`ins_id`),
  CONSTRAINT `major_institute_id_fk` FOREIGN KEY (`ins_id`) REFERENCES `institute` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='专业';

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES ('1', '软件工程', '6', '1', '36');
INSERT INTO `major` VALUES ('5', '人工智能', '2', '1', '8');
INSERT INTO `major` VALUES ('6', '大数据分析', '2', '1', '8');
INSERT INTO `major` VALUES ('7', '暂未分配专业', '2', '5', '0');
INSERT INTO `major` VALUES ('8', '土木工程', '5', '3', '20');
INSERT INTO `major` VALUES ('9', '给排水科学与工程', '2', '3', '8');
INSERT INTO `major` VALUES ('10', '会计学', '4', '7', '16');
INSERT INTO `major` VALUES ('11', '法学', '3', '8', '12');
INSERT INTO `major` VALUES ('12', '汉语言文学', '2', '8', '8');
INSERT INTO `major` VALUES ('13', '交通工程', '3', '9', '12');
INSERT INTO `major` VALUES ('14', '物流工程', '3', '9', '12');
INSERT INTO `major` VALUES ('15', '铁道工程', '3', '9', '12');
INSERT INTO `major` VALUES ('16', '车辆工程', '3', '9', '12');
INSERT INTO `major` VALUES ('17', '能源与动力工程', '4', '9', '16');

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `user_id` int NOT NULL COMMENT '对应的账号编号',
  `gender` char(1) DEFAULT '男' COMMENT '性别',
  `phone` varchar(11) DEFAULT NULL COMMENT '宿管电话',
  `picture` varchar(256) DEFAULT NULL COMMENT '宿管照片',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱',
  `building_number` int DEFAULT '0' COMMENT '管理宿舍楼的数量',
  `work_id` varchar(20) NOT NULL COMMENT '宿管的编号',
  UNIQUE KEY `manager_id_uindex` (`work_id`),
  KEY `manager_user_id_fk` (`user_id`),
  CONSTRAINT `manager_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='宿管信息';

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('1', '男', '14899234483', 'https://hzh-biyesheji.oss-cn-beijing.aliyuncs.com/8e585480-33cb-4bb3-a037-6f731e4c4af0.jpg', '1728343784@qq.com', '5', '20240001');
INSERT INTO `manager` VALUES ('2', '男', '12643678456', 'https://hzh-biyesheji.oss-cn-beijing.aliyuncs.com/e09be688-cb00-45fc-a6c4-f88f068f1767.jpg', '3257854357@qq.com', '1', '20240002');
INSERT INTO `manager` VALUES ('3', '男', '14022348826', 'https://hzh-biyesheji.oss-cn-beijing.aliyuncs.com/63487f60-2595-4f32-81f4-530e40c5bf44.jpg', '1627136283@qq.com', '1', '20240003');
INSERT INTO `manager` VALUES ('4', '女', '18926374526', 'https://hzh-biyesheji.oss-cn-beijing.aliyuncs.com/3ef7efc5-286e-4ca6-9e53-3a43c15c5bcf.jpg', '1465234523@qq.com', '1', '20240004');
INSERT INTO `manager` VALUES ('5', '女', '12633784563', 'https://hzh-biyesheji.oss-cn-beijing.aliyuncs.com/958cbba7-52e1-4ed0-a072-6f877cb2bb29.jpg', '1627733846@qq.com', '1', '20240005');
INSERT INTO `manager` VALUES ('7', '男', '19936747283', 'https://hzh-biyesheji.oss-cn-beijing.aliyuncs.com/abcf4591-b92b-4dd2-978a-87145059a5c3.jpg', '1637234829@qq.com', '1', '20240006');

-- ----------------------------
-- Table structure for repair_application
-- ----------------------------
DROP TABLE IF EXISTS `repair_application`;
CREATE TABLE `repair_application` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `stu_id` int DEFAULT NULL COMMENT '申请人Id',
  `dor_id` int DEFAULT NULL COMMENT '申请的寝室',
  `state` int DEFAULT '0' COMMENT '申请的状态，2已处理，1是已拒绝，0是未处理，-1是已失效',
  `picture` varchar(128) DEFAULT NULL COMMENT '图片',
  `trouble_item` varchar(32) DEFAULT NULL COMMENT '故障物品',
  `description` text COMMENT '保修的描述',
  `create_time` datetime DEFAULT NULL COMMENT '申请时间',
  `update_time` datetime DEFAULT NULL COMMENT '处理时间',
  `manager_id` int DEFAULT NULL COMMENT '处理的宿管Id',
  `manager_message` text COMMENT '处理者留言',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='寝室保修申请表';

-- ----------------------------
-- Records of repair_application
-- ----------------------------
INSERT INTO `repair_application` VALUES ('1', '8', '7', '2', null, '电灯', '电灯坏了', '2024-03-02 10:54:11', '2024-04-25 15:19:55', '1', '已经解决了');
INSERT INTO `repair_application` VALUES ('2', '8', '7', '1', null, '插座', '插座坏了', '2024-03-12 10:28:50', '2024-04-25 15:20:45', '2', '没有问题，无需报修');
INSERT INTO `repair_application` VALUES ('4', '8', '7', '0', null, '电源开关', '有问题', '2024-04-25 15:29:40', null, null, null);
INSERT INTO `repair_application` VALUES ('6', '11', '2', '0', 'https://hzh-biyesheji.oss-cn-beijing.aliyuncs.com/9547c458-e768-46fa-8c74-dd4802ec9584.jpg', '插座', '坏了', '2024-05-29 23:30:57', null, null, null);
INSERT INTO `repair_application` VALUES ('7', '8', '2', '0', 'https://hzh-biyesheji.oss-cn-beijing.aliyuncs.com/5c2ce601-6e3d-49f5-bdd9-9db66a7d4ab5.jpg', '插座', '', '2024-05-30 14:34:35', null, null, null);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `user_id` int NOT NULL COMMENT '对应的账号编号',
  `dormitory_id` int DEFAULT NULL COMMENT '所在寝室的编号',
  `study_id` varchar(20) NOT NULL COMMENT '学生学号',
  `gender` char(1) DEFAULT '男' COMMENT '性别',
  `major_id` int DEFAULT NULL COMMENT '专业',
  `clazz_id` int DEFAULT NULL COMMENT '班级',
  `ins_id` int DEFAULT NULL COMMENT '学院',
  `entrance_year` int DEFAULT NULL COMMENT '入学年份',
  UNIQUE KEY `student_study_id_uindex` (`study_id`),
  KEY `student_user_fk` (`user_id`),
  KEY `student_dormitory_id_fk` (`dormitory_id`),
  KEY `student_clazz_id_fk` (`clazz_id`),
  KEY `student_institute_id_fk` (`ins_id`),
  KEY `student_major_id_fk` (`major_id`),
  CONSTRAINT `student_clazz_id_fk` FOREIGN KEY (`clazz_id`) REFERENCES `clazz` (`id`),
  CONSTRAINT `student_dormitory_id_fk` FOREIGN KEY (`dormitory_id`) REFERENCES `dormitory` (`id`),
  CONSTRAINT `student_institute_id_fk` FOREIGN KEY (`ins_id`) REFERENCES `institute` (`id`),
  CONSTRAINT `student_major_id_fk` FOREIGN KEY (`major_id`) REFERENCES `major` (`id`),
  CONSTRAINT `student_user_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='学生信息';

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('8', '62', '202001010101', '男', '1', '1', '1', '2020');
INSERT INTO `student` VALUES ('11', '62', '202001010102', '男', '1', '1', '1', '2020');
INSERT INTO `student` VALUES ('15', '62', '202001010103', '男', '1', '1', '1', '2020');
INSERT INTO `student` VALUES ('12', '62', '202001010104', '女', '1', '1', '1', '2020');
INSERT INTO `student` VALUES ('13', '33', '202001010105', '女', '1', '1', '1', '2020');
INSERT INTO `student` VALUES ('14', '2', '202001010106', '男', '1', '1', '1', '2020');
INSERT INTO `student` VALUES ('17', '7', '202001010201', '男', '1', '5', '1', '2020');
INSERT INTO `student` VALUES ('18', '7', '202001010202', '男', '1', '5', '1', '2020');
INSERT INTO `student` VALUES ('19', '33', '202001010203', '女', '1', '5', '1', '2020');
INSERT INTO `student` VALUES ('20', '7', '202001010204', '男', '1', '5', '1', '2020');
INSERT INTO `student` VALUES ('21', '7', '202001010205', '男', '1', '5', '1', '2020');
INSERT INTO `student` VALUES ('22', '33', '202001010206', '女', '1', '5', '1', '2020');
INSERT INTO `student` VALUES ('115', '28', '202001010301', '男', '1', '50', '1', '2020');
INSERT INTO `student` VALUES ('116', '28', '202001010302', '男', '1', '50', '1', '2020');
INSERT INTO `student` VALUES ('117', '28', '202001010303', '男', '1', '50', '1', '2020');
INSERT INTO `student` VALUES ('118', '28', '202001010304', '男', '1', '50', '1', '2020');
INSERT INTO `student` VALUES ('119', '44', '202001010305', '女', '1', '50', '1', '2020');
INSERT INTO `student` VALUES ('120', '44', '202001010306', '女', '1', '50', '1', '2020');
INSERT INTO `student` VALUES ('35', '10', '202001020101', '男', '5', '13', '1', '2020');
INSERT INTO `student` VALUES ('36', '10', '202001020102', '男', '5', '13', '1', '2020');
INSERT INTO `student` VALUES ('37', '10', '202001020103', '男', '5', '13', '1', '2020');
INSERT INTO `student` VALUES ('38', '10', '202001020104', '男', '5', '13', '1', '2020');
INSERT INTO `student` VALUES ('43', '17', '202001030101', '男', '6', '16', '1', '2020');
INSERT INTO `student` VALUES ('44', '17', '202001030102', '男', '6', '16', '1', '2020');
INSERT INTO `student` VALUES ('45', '17', '202001030103', '男', '6', '16', '1', '2020');
INSERT INTO `student` VALUES ('46', '17', '202001030104', '男', '6', '16', '1', '2020');
INSERT INTO `student` VALUES ('51', '19', '202002010101', '男', '8', '18', '3', '2020');
INSERT INTO `student` VALUES ('52', '19', '202002010102', '男', '8', '18', '3', '2020');
INSERT INTO `student` VALUES ('53', '19', '202002010103', '男', '8', '18', '3', '2020');
INSERT INTO `student` VALUES ('54', '35', '202002010104', '女', '8', '18', '3', '2020');
INSERT INTO `student` VALUES ('55', '19', '202002010201', '男', '8', '19', '3', '2020');
INSERT INTO `student` VALUES ('56', '20', '202002010202', '男', '8', '19', '3', '2020');
INSERT INTO `student` VALUES ('57', '20', '202002010203', '男', '8', '19', '3', '2020');
INSERT INTO `student` VALUES ('58', '35', '202002010204', '女', '8', '19', '3', '2020');
INSERT INTO `student` VALUES ('59', '20', '202002010301', '男', '8', '20', '3', '2020');
INSERT INTO `student` VALUES ('60', '20', '202002010302', '男', '8', '20', '3', '2020');
INSERT INTO `student` VALUES ('61', '23', '202002010303', '男', '8', '20', '3', '2020');
INSERT INTO `student` VALUES ('62', '35', '202002010304', '女', '8', '20', '3', '2020');
INSERT INTO `student` VALUES ('63', '35', '202002020101', '女', '9', '23', '3', '2020');
INSERT INTO `student` VALUES ('64', '23', '202002020102', '男', '9', '23', '3', '2020');
INSERT INTO `student` VALUES ('65', '23', '202002020103', '男', '9', '23', '3', '2020');
INSERT INTO `student` VALUES ('66', '23', '202002020104', '男', '9', '23', '3', '2020');
INSERT INTO `student` VALUES ('79', '36', '202003010101', '女', '10', '25', '7', '2020');
INSERT INTO `student` VALUES ('80', '36', '202003010102', '女', '10', '25', '7', '2020');
INSERT INTO `student` VALUES ('81', '36', '202003010103', '女', '10', '25', '7', '2020');
INSERT INTO `student` VALUES ('82', '36', '202003010104', '女', '10', '25', '7', '2020');
INSERT INTO `student` VALUES ('83', '37', '202003010201', '女', '10', '26', '7', '2020');
INSERT INTO `student` VALUES ('84', '37', '202003010202', '女', '10', '26', '7', '2020');
INSERT INTO `student` VALUES ('85', '37', '202003010203', '女', '10', '26', '7', '2020');
INSERT INTO `student` VALUES ('86', '37', '202003010204', '女', '10', '26', '7', '2020');
INSERT INTO `student` VALUES ('95', '40', '202004010101', '女', '11', '29', '8', '2020');
INSERT INTO `student` VALUES ('96', '40', '202004010102', '女', '11', '29', '8', '2020');
INSERT INTO `student` VALUES ('97', '27', '202004010103', '男', '11', '29', '8', '2020');
INSERT INTO `student` VALUES ('98', '27', '202004010104', '男', '11', '29', '8', '2020');
INSERT INTO `student` VALUES ('99', '27', '202004010201', '男', '11', '30', '8', '2020');
INSERT INTO `student` VALUES ('100', '40', '202004010202', '女', '11', '30', '8', '2020');
INSERT INTO `student` VALUES ('101', '40', '202004010203', '女', '11', '30', '8', '2020');
INSERT INTO `student` VALUES ('102', '41', '202004010204', '女', '11', '30', '8', '2020');
INSERT INTO `student` VALUES ('103', '27', '202004020101', '男', '12', '32', '8', '2020');
INSERT INTO `student` VALUES ('104', '41', '202004020102', '女', '12', '32', '8', '2020');
INSERT INTO `student` VALUES ('105', '41', '202004020103', '女', '12', '32', '8', '2020');
INSERT INTO `student` VALUES ('106', '41', '202004020104', '女', '12', '32', '8', '2020');
INSERT INTO `student` VALUES ('127', '53', '202005010101', '男', '13', '34', '9', '2020');
INSERT INTO `student` VALUES ('128', '53', '202005010102', '男', '13', '34', '9', '2020');
INSERT INTO `student` VALUES ('129', '53', '202005010103', '男', '13', '34', '9', '2020');
INSERT INTO `student` VALUES ('130', '53', '202005010104', '男', '13', '34', '9', '2020');
INSERT INTO `student` VALUES ('131', '54', '202005010201', '男', '13', '35', '9', '2020');
INSERT INTO `student` VALUES ('132', '54', '202005010202', '男', '13', '35', '9', '2020');
INSERT INTO `student` VALUES ('133', '54', '202005010203', '男', '13', '35', '9', '2020');
INSERT INTO `student` VALUES ('134', '54', '202005010204', '男', '13', '35', '9', '2020');
INSERT INTO `student` VALUES ('155', '74', '202005020101', '男', '14', '36', '9', '2020');
INSERT INTO `student` VALUES ('156', '74', '202005020102', '男', '14', '36', '9', '2020');
INSERT INTO `student` VALUES ('157', '59', '202005020103', '女', '14', '36', '9', '2020');
INSERT INTO `student` VALUES ('158', '74', '202005020104', '男', '14', '36', '9', '2020');
INSERT INTO `student` VALUES ('159', '74', '202005020201', '男', '14', '37', '9', '2020');
INSERT INTO `student` VALUES ('160', '75', '202005020202', '男', '14', '37', '9', '2020');
INSERT INTO `student` VALUES ('161', '59', '202005020203', '女', '14', '37', '9', '2020');
INSERT INTO `student` VALUES ('162', '75', '202005020204', '男', '14', '37', '9', '2020');
INSERT INTO `student` VALUES ('163', '75', '202005030101', '男', '15', '38', '9', '2020');
INSERT INTO `student` VALUES ('164', '75', '202005030102', '男', '15', '38', '9', '2020');
INSERT INTO `student` VALUES ('165', '59', '202005030103', '女', '15', '38', '9', '2020');
INSERT INTO `student` VALUES ('166', '76', '202005030104', '男', '15', '38', '9', '2020');
INSERT INTO `student` VALUES ('167', '76', '202005030201', '男', '15', '39', '9', '2020');
INSERT INTO `student` VALUES ('168', '76', '202005030202', '男', '15', '39', '9', '2020');
INSERT INTO `student` VALUES ('169', '59', '202005030203', '女', '15', '39', '9', '2020');
INSERT INTO `student` VALUES ('170', '76', '202005030204', '男', '15', '39', '9', '2020');
INSERT INTO `student` VALUES ('171', '77', '202005040101', '男', '16', '40', '9', '2020');
INSERT INTO `student` VALUES ('172', '77', '202005040102', '男', '16', '40', '9', '2020');
INSERT INTO `student` VALUES ('173', '61', '202005040103', '女', '16', '40', '9', '2020');
INSERT INTO `student` VALUES ('174', '77', '202005040104', '男', '16', '40', '9', '2020');
INSERT INTO `student` VALUES ('175', '77', '202005040201', '男', '16', '41', '9', '2020');
INSERT INTO `student` VALUES ('176', '84', '202005040202', '男', '16', '41', '9', '2020');
INSERT INTO `student` VALUES ('177', '84', '202005040203', '男', '16', '41', '9', '2020');
INSERT INTO `student` VALUES ('178', '61', '202005040204', '女', '16', '41', '9', '2020');
INSERT INTO `student` VALUES ('179', '83', '202005050101', '男', '17', '42', '9', '2020');
INSERT INTO `student` VALUES ('180', '60', '202005050102', '女', '17', '42', '9', '2020');
INSERT INTO `student` VALUES ('181', '60', '202005050103', '女', '17', '42', '9', '2020');
INSERT INTO `student` VALUES ('182', '83', '202005050104', '男', '17', '42', '9', '2020');
INSERT INTO `student` VALUES ('183', '83', '202005050201', '男', '17', '43', '9', '2020');
INSERT INTO `student` VALUES ('184', '60', '202005050202', '女', '17', '43', '9', '2020');
INSERT INTO `student` VALUES ('185', '83', '202005050203', '男', '17', '43', '9', '2020');
INSERT INTO `student` VALUES ('186', '60', '202005050204', '女', '17', '43', '9', '2020');
INSERT INTO `student` VALUES ('187', '84', '202005050301', '男', '17', '44', '9', '2020');
INSERT INTO `student` VALUES ('188', '84', '202005050302', '男', '17', '44', '9', '2020');
INSERT INTO `student` VALUES ('189', '61', '202005050303', '女', '17', '44', '9', '2020');
INSERT INTO `student` VALUES ('190', '61', '202005050304', '女', '17', '44', '9', '2020');
INSERT INTO `student` VALUES ('23', '34', '202101010101', '女', '1', '8', '1', '2021');
INSERT INTO `student` VALUES ('24', '8', '202101010102', '男', '1', '8', '1', '2021');
INSERT INTO `student` VALUES ('25', '8', '202101010103', '男', '1', '8', '1', '2021');
INSERT INTO `student` VALUES ('26', '8', '202101010104', '男', '1', '8', '1', '2021');
INSERT INTO `student` VALUES ('27', '34', '202101010105', '女', '1', '8', '1', '2021');
INSERT INTO `student` VALUES ('28', '8', '202101010106', '男', '1', '8', '1', '2021');
INSERT INTO `student` VALUES ('29', '9', '202101010201', '男', '1', '9', '1', '2021');
INSERT INTO `student` VALUES ('30', '34', '202101010202', '女', '1', '9', '1', '2021');
INSERT INTO `student` VALUES ('31', '9', '202101010203', '男', '1', '9', '1', '2021');
INSERT INTO `student` VALUES ('32', '34', '202101010204', '女', '1', '9', '1', '2021');
INSERT INTO `student` VALUES ('33', '9', '202101010205', '男', '1', '9', '1', '2021');
INSERT INTO `student` VALUES ('34', '9', '202101010206', '男', '1', '9', '1', '2021');
INSERT INTO `student` VALUES ('121', '29', '202101010301', '男', '1', '51', '1', '2021');
INSERT INTO `student` VALUES ('122', '29', '202101010302', '男', '1', '51', '1', '2021');
INSERT INTO `student` VALUES ('123', '29', '202101010303', '男', '1', '51', '1', '2021');
INSERT INTO `student` VALUES ('124', '29', '202101010304', '男', '1', '51', '1', '2021');
INSERT INTO `student` VALUES ('125', '44', '202101010305', '女', '1', '51', '1', '2021');
INSERT INTO `student` VALUES ('126', '44', '202101010306', '女', '1', '51', '1', '2021');
INSERT INTO `student` VALUES ('39', '16', '202101020101', '男', '5', '15', '1', '2021');
INSERT INTO `student` VALUES ('40', '16', '202101020102', '男', '5', '15', '1', '2021');
INSERT INTO `student` VALUES ('41', '16', '202101020103', '男', '5', '15', '1', '2021');
INSERT INTO `student` VALUES ('42', '16', '202101020104', '男', '5', '15', '1', '2021');
INSERT INTO `student` VALUES ('47', '18', '202101030101', '男', '6', '17', '1', '2021');
INSERT INTO `student` VALUES ('48', '18', '202101030102', '男', '6', '17', '1', '2021');
INSERT INTO `student` VALUES ('49', '18', '202101030103', '男', '6', '17', '1', '2021');
INSERT INTO `student` VALUES ('50', '18', '202101030104', '男', '6', '17', '1', '2021');
INSERT INTO `student` VALUES ('67', '24', '202102010101', '男', '8', '21', '3', '2021');
INSERT INTO `student` VALUES ('68', '24', '202102010102', '男', '8', '21', '3', '2021');
INSERT INTO `student` VALUES ('69', '24', '202102010103', '男', '8', '21', '3', '2021');
INSERT INTO `student` VALUES ('70', '24', '202102010104', '男', '8', '21', '3', '2021');
INSERT INTO `student` VALUES ('71', '25', '202102010201', '男', '8', '22', '3', '2021');
INSERT INTO `student` VALUES ('72', '25', '202102010202', '男', '8', '22', '3', '2021');
INSERT INTO `student` VALUES ('73', '25', '202102010203', '男', '8', '22', '3', '2021');
INSERT INTO `student` VALUES ('74', '25', '202102010204', '男', '8', '22', '3', '2021');
INSERT INTO `student` VALUES ('75', '26', '202102020101', '男', '9', '24', '3', '2021');
INSERT INTO `student` VALUES ('76', '26', '202102020102', '男', '9', '24', '3', '2021');
INSERT INTO `student` VALUES ('77', '26', '202102020103', '男', '9', '24', '3', '2021');
INSERT INTO `student` VALUES ('78', '26', '202102020104', '男', '9', '24', '3', '2021');
INSERT INTO `student` VALUES ('87', '38', '202103010101', '女', '10', '27', '7', '2021');
INSERT INTO `student` VALUES ('88', '38', '202103010102', '女', '10', '27', '7', '2021');
INSERT INTO `student` VALUES ('89', '38', '202103010103', '女', '10', '27', '7', '2021');
INSERT INTO `student` VALUES ('90', '38', '202103010104', '女', '10', '27', '7', '2021');
INSERT INTO `student` VALUES ('91', '39', '202103010201', '女', '10', '28', '7', '2021');
INSERT INTO `student` VALUES ('92', '39', '202103010202', '女', '10', '28', '7', '2021');
INSERT INTO `student` VALUES ('93', '39', '202103010203', '女', '10', '28', '7', '2021');
INSERT INTO `student` VALUES ('94', '39', '202103010204', '女', '10', '28', '7', '2021');
INSERT INTO `student` VALUES ('107', '42', '202104010101', '女', '11', '31', '8', '2021');
INSERT INTO `student` VALUES ('108', '42', '202104010102', '女', '11', '31', '8', '2021');
INSERT INTO `student` VALUES ('109', '42', '202104010103', '女', '11', '31', '8', '2021');
INSERT INTO `student` VALUES ('110', '42', '202104010104', '女', '11', '31', '8', '2021');
INSERT INTO `student` VALUES ('111', '43', '202104020101', '女', '12', '33', '8', '2021');
INSERT INTO `student` VALUES ('112', '43', '202104020102', '女', '12', '33', '8', '2021');
INSERT INTO `student` VALUES ('113', '43', '202104020103', '女', '12', '33', '8', '2021');
INSERT INTO `student` VALUES ('114', '43', '202104020104', '女', '12', '33', '8', '2021');
INSERT INTO `student` VALUES ('139', '55', '202105010101', '男', '13', '45', '9', '2021');
INSERT INTO `student` VALUES ('140', '55', '202105010102', '男', '13', '45', '9', '2021');
INSERT INTO `student` VALUES ('141', '55', '202105010103', '男', '13', '45', '9', '2021');
INSERT INTO `student` VALUES ('142', '55', '202105010104', '男', '13', '45', '9', '2021');
INSERT INTO `student` VALUES ('135', '56', '202105020101', '男', '14', '46', '9', '2021');
INSERT INTO `student` VALUES ('136', '56', '202105020102', '男', '14', '46', '9', '2021');
INSERT INTO `student` VALUES ('137', '56', '202105020103', '男', '14', '46', '9', '2021');
INSERT INTO `student` VALUES ('138', '56', '202105020104', '男', '14', '46', '9', '2021');
INSERT INTO `student` VALUES ('143', '58', '202105030101', '女', '15', '49', '9', '2021');
INSERT INTO `student` VALUES ('144', '57', '202105030102', '男', '15', '49', '9', '2021');
INSERT INTO `student` VALUES ('145', '57', '202105030103', '男', '15', '49', '9', '2021');
INSERT INTO `student` VALUES ('146', '57', '202105030104', '男', '15', '49', '9', '2021');
INSERT INTO `student` VALUES ('147', '58', '202105040101', '女', '16', '47', '9', '2021');
INSERT INTO `student` VALUES ('148', '57', '202105040102', '男', '16', '47', '9', '2021');
INSERT INTO `student` VALUES ('149', '73', '202105040103', '男', '16', '47', '9', '2021');
INSERT INTO `student` VALUES ('150', '73', '202105040104', '男', '16', '47', '9', '2021');
INSERT INTO `student` VALUES ('151', '58', '202105050101', '女', '17', '48', '9', '2021');
INSERT INTO `student` VALUES ('152', '58', '202105050102', '女', '17', '48', '9', '2021');
INSERT INTO `student` VALUES ('153', '73', '202105050103', '男', '17', '48', '9', '2021');
INSERT INTO `student` VALUES ('154', '73', '202105050104', '男', '17', '48', '9', '2021');

-- ----------------------------
-- Table structure for student_info
-- ----------------------------
DROP TABLE IF EXISTS `student_info`;
CREATE TABLE `student_info` (
  `student_id` int DEFAULT NULL COMMENT '学生编号',
  `phone` varchar(11) DEFAULT NULL COMMENT '电话',
  `picture` varchar(256) DEFAULT NULL COMMENT '学生照片',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱',
  `introduction` text COMMENT '个人介绍',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `ethnicity` varchar(10) DEFAULT NULL COMMENT '民族',
  `birthday` date DEFAULT NULL COMMENT '生日',
  KEY `student_inf_student_user_id_fk` (`student_id`),
  CONSTRAINT `student_inf_student_user_id_fk` FOREIGN KEY (`student_id`) REFERENCES `student` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='学生的详细信息';

-- ----------------------------
-- Records of student_info
-- ----------------------------
INSERT INTO `student_info` VALUES ('8', '13513543322', 'https://hzh-biyesheji.oss-cn-beijing.aliyuncs.com/c333ffb5-9817-45b2-9b17-db693c26c71a.jpg', '18299336278@qq.com', '我是好学生', '2024-05-28 19:43:39', '汉族', '2002-02-12');
INSERT INTO `student_info` VALUES ('11', null, null, null, null, '2024-02-20 11:16:37', null, null);
INSERT INTO `student_info` VALUES ('12', null, null, null, null, '2024-05-08 18:14:59', null, null);
INSERT INTO `student_info` VALUES ('13', null, null, null, null, '2024-05-28 21:56:49', null, null);
INSERT INTO `student_info` VALUES ('14', null, null, null, null, '2024-02-21 20:28:01', null, null);
INSERT INTO `student_info` VALUES ('15', null, null, null, null, '2024-02-20 11:34:53', null, null);
INSERT INTO `student_info` VALUES ('17', null, null, null, null, '2024-02-21 15:21:58', null, null);
INSERT INTO `student_info` VALUES ('18', null, null, null, null, '2024-02-24 11:50:04', null, null);
INSERT INTO `student_info` VALUES ('19', null, null, null, null, '2024-05-28 21:55:05', null, null);
INSERT INTO `student_info` VALUES ('20', null, null, null, null, '2024-05-28 21:55:05', null, null);
INSERT INTO `student_info` VALUES ('21', null, null, null, null, '2024-05-28 21:55:05', null, null);
INSERT INTO `student_info` VALUES ('22', null, null, null, null, '2024-05-28 21:55:05', null, null);
INSERT INTO `student_info` VALUES ('23', null, null, null, null, '2024-05-28 22:34:48', null, null);
INSERT INTO `student_info` VALUES ('24', null, null, null, null, '2024-05-28 22:34:48', null, null);
INSERT INTO `student_info` VALUES ('25', null, null, null, null, '2024-05-28 22:34:48', null, null);
INSERT INTO `student_info` VALUES ('26', null, null, null, null, '2024-05-28 22:34:48', null, null);
INSERT INTO `student_info` VALUES ('27', null, null, null, null, '2024-05-28 22:34:48', null, null);
INSERT INTO `student_info` VALUES ('28', null, null, null, null, '2024-05-28 22:34:48', null, null);
INSERT INTO `student_info` VALUES ('29', null, null, null, null, '2024-05-28 22:39:32', null, null);
INSERT INTO `student_info` VALUES ('30', null, null, null, null, '2024-05-28 22:39:32', null, null);
INSERT INTO `student_info` VALUES ('31', null, null, null, null, '2024-05-28 22:39:32', null, null);
INSERT INTO `student_info` VALUES ('32', null, null, null, null, '2024-05-28 22:39:32', null, null);
INSERT INTO `student_info` VALUES ('33', null, null, null, null, '2024-05-28 22:39:32', null, null);
INSERT INTO `student_info` VALUES ('34', null, null, null, null, '2024-05-28 22:39:32', null, null);
INSERT INTO `student_info` VALUES ('35', null, null, null, null, '2024-05-28 22:57:54', null, null);
INSERT INTO `student_info` VALUES ('36', null, null, null, null, '2024-05-28 22:57:54', null, null);
INSERT INTO `student_info` VALUES ('37', null, null, null, null, '2024-05-28 22:57:54', null, null);
INSERT INTO `student_info` VALUES ('38', null, null, null, null, '2024-05-28 22:57:54', null, null);
INSERT INTO `student_info` VALUES ('39', null, null, null, null, '2024-05-28 22:59:11', null, null);
INSERT INTO `student_info` VALUES ('40', null, null, null, null, '2024-05-28 22:59:11', null, null);
INSERT INTO `student_info` VALUES ('41', null, null, null, null, '2024-05-28 22:59:11', null, null);
INSERT INTO `student_info` VALUES ('42', null, null, null, null, '2024-05-28 22:59:11', null, null);
INSERT INTO `student_info` VALUES ('43', null, null, null, null, '2024-05-28 23:05:28', null, null);
INSERT INTO `student_info` VALUES ('44', null, null, null, null, '2024-05-28 23:05:28', null, null);
INSERT INTO `student_info` VALUES ('45', null, null, null, null, '2024-05-28 23:05:28', null, null);
INSERT INTO `student_info` VALUES ('46', null, null, null, null, '2024-05-28 23:05:28', null, null);
INSERT INTO `student_info` VALUES ('47', null, null, null, null, '2024-05-28 23:05:28', null, null);
INSERT INTO `student_info` VALUES ('48', null, null, null, null, '2024-05-28 23:05:28', null, null);
INSERT INTO `student_info` VALUES ('49', null, null, null, null, '2024-05-28 23:05:28', null, null);
INSERT INTO `student_info` VALUES ('50', null, null, null, null, '2024-05-28 23:05:28', null, null);
INSERT INTO `student_info` VALUES ('51', null, null, null, null, '2024-05-28 23:22:49', null, null);
INSERT INTO `student_info` VALUES ('52', null, null, null, null, '2024-05-28 23:22:49', null, null);
INSERT INTO `student_info` VALUES ('53', null, null, null, null, '2024-05-28 23:22:49', null, null);
INSERT INTO `student_info` VALUES ('54', null, null, null, null, '2024-05-28 23:22:49', null, null);
INSERT INTO `student_info` VALUES ('55', null, null, null, null, '2024-05-28 23:22:49', null, null);
INSERT INTO `student_info` VALUES ('56', null, null, null, null, '2024-05-28 23:22:49', null, null);
INSERT INTO `student_info` VALUES ('57', null, null, null, null, '2024-05-28 23:22:49', null, null);
INSERT INTO `student_info` VALUES ('58', null, null, null, null, '2024-05-28 23:22:49', null, null);
INSERT INTO `student_info` VALUES ('59', null, null, null, null, '2024-05-28 23:22:49', null, null);
INSERT INTO `student_info` VALUES ('60', null, null, null, null, '2024-05-28 23:22:49', null, null);
INSERT INTO `student_info` VALUES ('61', null, null, null, null, '2024-05-28 23:22:49', null, null);
INSERT INTO `student_info` VALUES ('62', null, null, null, null, '2024-05-28 23:22:49', null, null);
INSERT INTO `student_info` VALUES ('63', null, null, null, null, '2024-05-28 23:22:49', null, null);
INSERT INTO `student_info` VALUES ('64', null, null, null, null, '2024-05-28 23:22:49', null, null);
INSERT INTO `student_info` VALUES ('65', null, null, null, null, '2024-05-28 23:22:49', null, null);
INSERT INTO `student_info` VALUES ('66', null, null, null, null, '2024-05-28 23:22:49', null, null);
INSERT INTO `student_info` VALUES ('67', null, null, null, null, '2024-05-28 23:33:08', null, null);
INSERT INTO `student_info` VALUES ('68', null, null, null, null, '2024-05-28 23:33:08', null, null);
INSERT INTO `student_info` VALUES ('69', null, null, null, null, '2024-05-28 23:33:08', null, null);
INSERT INTO `student_info` VALUES ('70', null, null, null, null, '2024-05-28 23:33:08', null, null);
INSERT INTO `student_info` VALUES ('71', null, null, null, null, '2024-05-28 23:33:08', null, null);
INSERT INTO `student_info` VALUES ('72', null, null, null, null, '2024-05-28 23:33:08', null, null);
INSERT INTO `student_info` VALUES ('73', null, null, null, null, '2024-05-28 23:33:08', null, null);
INSERT INTO `student_info` VALUES ('74', null, null, null, null, '2024-05-28 23:33:08', null, null);
INSERT INTO `student_info` VALUES ('75', null, null, null, null, '2024-05-28 23:33:08', null, null);
INSERT INTO `student_info` VALUES ('76', null, null, null, null, '2024-05-28 23:33:09', null, null);
INSERT INTO `student_info` VALUES ('77', null, null, null, null, '2024-05-28 23:33:09', null, null);
INSERT INTO `student_info` VALUES ('78', null, null, null, null, '2024-05-28 23:33:09', null, null);
INSERT INTO `student_info` VALUES ('79', null, null, null, null, '2024-05-28 23:43:40', null, null);
INSERT INTO `student_info` VALUES ('80', null, null, null, null, '2024-05-28 23:43:40', null, null);
INSERT INTO `student_info` VALUES ('81', null, null, null, null, '2024-05-28 23:43:40', null, null);
INSERT INTO `student_info` VALUES ('82', null, null, null, null, '2024-05-28 23:43:40', null, null);
INSERT INTO `student_info` VALUES ('83', null, null, null, null, '2024-05-28 23:43:40', null, null);
INSERT INTO `student_info` VALUES ('84', null, null, null, null, '2024-05-28 23:43:40', null, null);
INSERT INTO `student_info` VALUES ('85', null, null, null, null, '2024-05-28 23:43:40', null, null);
INSERT INTO `student_info` VALUES ('86', null, null, null, null, '2024-05-28 23:43:41', null, null);
INSERT INTO `student_info` VALUES ('87', null, null, null, null, '2024-05-28 23:43:41', null, null);
INSERT INTO `student_info` VALUES ('88', null, null, null, null, '2024-05-28 23:43:41', null, null);
INSERT INTO `student_info` VALUES ('89', null, null, null, null, '2024-05-28 23:43:41', null, null);
INSERT INTO `student_info` VALUES ('90', null, null, null, null, '2024-05-28 23:43:41', null, null);
INSERT INTO `student_info` VALUES ('91', null, null, null, null, '2024-05-28 23:43:41', null, null);
INSERT INTO `student_info` VALUES ('92', null, null, null, null, '2024-05-28 23:43:41', null, null);
INSERT INTO `student_info` VALUES ('93', null, null, null, null, '2024-05-28 23:43:41', null, null);
INSERT INTO `student_info` VALUES ('94', null, null, null, null, '2024-05-28 23:43:41', null, null);
INSERT INTO `student_info` VALUES ('95', null, null, null, null, '2024-05-29 00:07:30', null, null);
INSERT INTO `student_info` VALUES ('96', null, null, null, null, '2024-05-29 00:07:30', null, null);
INSERT INTO `student_info` VALUES ('97', null, null, null, null, '2024-05-29 00:07:30', null, null);
INSERT INTO `student_info` VALUES ('98', null, null, null, null, '2024-05-29 00:07:30', null, null);
INSERT INTO `student_info` VALUES ('99', null, null, null, null, '2024-05-29 00:07:30', null, null);
INSERT INTO `student_info` VALUES ('100', null, null, null, null, '2024-05-29 00:07:30', null, null);
INSERT INTO `student_info` VALUES ('101', null, null, null, null, '2024-05-29 00:07:31', null, null);
INSERT INTO `student_info` VALUES ('102', null, null, null, null, '2024-05-29 00:07:31', null, null);
INSERT INTO `student_info` VALUES ('103', null, null, null, null, '2024-05-29 00:07:31', null, null);
INSERT INTO `student_info` VALUES ('104', null, null, null, null, '2024-05-29 00:07:31', null, null);
INSERT INTO `student_info` VALUES ('105', null, null, null, null, '2024-05-29 00:07:31', null, null);
INSERT INTO `student_info` VALUES ('106', null, null, null, null, '2024-05-29 00:07:31', null, null);
INSERT INTO `student_info` VALUES ('107', null, null, null, null, '2024-05-29 00:11:45', null, null);
INSERT INTO `student_info` VALUES ('108', null, null, null, null, '2024-05-29 00:11:46', null, null);
INSERT INTO `student_info` VALUES ('109', null, null, null, null, '2024-05-29 00:11:46', null, null);
INSERT INTO `student_info` VALUES ('110', null, null, null, null, '2024-05-29 00:11:46', null, null);
INSERT INTO `student_info` VALUES ('111', null, null, null, null, '2024-05-29 00:11:46', null, null);
INSERT INTO `student_info` VALUES ('112', null, null, null, null, '2024-05-29 00:11:46', null, null);
INSERT INTO `student_info` VALUES ('113', null, null, null, null, '2024-05-29 00:11:46', null, null);
INSERT INTO `student_info` VALUES ('114', null, null, null, null, '2024-05-29 00:11:46', null, null);
INSERT INTO `student_info` VALUES ('115', null, null, null, null, '2024-05-29 13:17:58', null, null);
INSERT INTO `student_info` VALUES ('116', null, null, null, null, '2024-05-29 13:17:58', null, null);
INSERT INTO `student_info` VALUES ('117', null, null, null, null, '2024-05-29 13:17:58', null, null);
INSERT INTO `student_info` VALUES ('118', null, null, null, null, '2024-05-29 13:17:58', null, null);
INSERT INTO `student_info` VALUES ('119', null, null, null, null, '2024-05-29 13:17:58', null, null);
INSERT INTO `student_info` VALUES ('120', null, null, null, null, '2024-05-29 13:17:58', null, null);
INSERT INTO `student_info` VALUES ('121', null, null, null, null, '2024-05-29 13:20:29', null, null);
INSERT INTO `student_info` VALUES ('122', null, null, null, null, '2024-05-29 13:20:29', null, null);
INSERT INTO `student_info` VALUES ('123', null, null, null, null, '2024-05-29 13:20:29', null, null);
INSERT INTO `student_info` VALUES ('124', null, null, null, null, '2024-05-29 13:20:29', null, null);
INSERT INTO `student_info` VALUES ('125', null, null, null, null, '2024-05-29 13:20:29', null, null);
INSERT INTO `student_info` VALUES ('126', null, null, null, null, '2024-05-29 13:20:29', null, null);
INSERT INTO `student_info` VALUES ('127', null, null, null, null, '2024-05-29 13:28:08', null, null);
INSERT INTO `student_info` VALUES ('128', null, null, null, null, '2024-05-29 13:28:08', null, null);
INSERT INTO `student_info` VALUES ('129', null, null, null, null, '2024-05-29 13:28:08', null, null);
INSERT INTO `student_info` VALUES ('130', null, null, null, null, '2024-05-29 13:28:08', null, null);
INSERT INTO `student_info` VALUES ('131', null, null, null, null, '2024-05-29 13:28:08', null, null);
INSERT INTO `student_info` VALUES ('132', null, null, null, null, '2024-05-29 13:28:08', null, null);
INSERT INTO `student_info` VALUES ('133', null, null, null, null, '2024-05-29 13:28:08', null, null);
INSERT INTO `student_info` VALUES ('134', null, null, null, null, '2024-05-29 13:28:08', null, null);
INSERT INTO `student_info` VALUES ('135', null, null, null, null, '2024-05-29 13:32:32', null, null);
INSERT INTO `student_info` VALUES ('136', null, null, null, null, '2024-05-29 13:32:32', null, null);
INSERT INTO `student_info` VALUES ('137', null, null, null, null, '2024-05-29 13:32:32', null, null);
INSERT INTO `student_info` VALUES ('138', null, null, null, null, '2024-05-29 13:32:32', null, null);
INSERT INTO `student_info` VALUES ('139', null, null, null, null, '2024-05-29 13:32:32', null, null);
INSERT INTO `student_info` VALUES ('140', null, null, null, null, '2024-05-29 13:32:33', null, null);
INSERT INTO `student_info` VALUES ('141', null, null, null, null, '2024-05-29 13:32:33', null, null);
INSERT INTO `student_info` VALUES ('142', null, null, null, null, '2024-05-29 13:32:33', null, null);
INSERT INTO `student_info` VALUES ('143', null, null, null, null, '2024-05-29 13:37:55', null, null);
INSERT INTO `student_info` VALUES ('144', null, null, null, null, '2024-05-29 13:37:55', null, null);
INSERT INTO `student_info` VALUES ('145', null, null, null, null, '2024-05-29 13:37:55', null, null);
INSERT INTO `student_info` VALUES ('146', null, null, null, null, '2024-05-29 13:37:55', null, null);
INSERT INTO `student_info` VALUES ('147', null, null, null, null, '2024-05-29 13:37:55', null, null);
INSERT INTO `student_info` VALUES ('148', null, null, null, null, '2024-05-29 13:37:55', null, null);
INSERT INTO `student_info` VALUES ('149', null, null, null, null, '2024-05-29 13:37:55', null, null);
INSERT INTO `student_info` VALUES ('150', null, null, null, null, '2024-05-29 13:37:55', null, null);
INSERT INTO `student_info` VALUES ('151', null, null, null, null, '2024-05-29 13:37:55', null, null);
INSERT INTO `student_info` VALUES ('152', null, null, null, null, '2024-05-29 13:37:55', null, null);
INSERT INTO `student_info` VALUES ('153', null, null, null, null, '2024-05-29 13:37:55', null, null);
INSERT INTO `student_info` VALUES ('154', null, null, null, null, '2024-05-29 13:37:55', null, null);
INSERT INTO `student_info` VALUES ('155', null, null, null, null, '2024-05-29 13:50:37', null, null);
INSERT INTO `student_info` VALUES ('156', null, null, null, null, '2024-05-29 13:50:37', null, null);
INSERT INTO `student_info` VALUES ('157', null, null, null, null, '2024-05-29 13:50:37', null, null);
INSERT INTO `student_info` VALUES ('158', null, null, null, null, '2024-05-29 13:50:37', null, null);
INSERT INTO `student_info` VALUES ('159', null, null, null, null, '2024-05-29 13:50:37', null, null);
INSERT INTO `student_info` VALUES ('160', null, null, null, null, '2024-05-29 13:50:37', null, null);
INSERT INTO `student_info` VALUES ('161', null, null, null, null, '2024-05-29 13:50:37', null, null);
INSERT INTO `student_info` VALUES ('162', null, null, null, null, '2024-05-29 13:50:37', null, null);
INSERT INTO `student_info` VALUES ('163', null, null, null, null, '2024-05-29 13:53:41', null, null);
INSERT INTO `student_info` VALUES ('164', null, null, null, null, '2024-05-29 13:53:41', null, null);
INSERT INTO `student_info` VALUES ('165', null, null, null, null, '2024-05-29 13:53:41', null, null);
INSERT INTO `student_info` VALUES ('166', null, null, null, null, '2024-05-29 13:53:41', null, null);
INSERT INTO `student_info` VALUES ('167', null, null, null, null, '2024-05-29 13:53:41', null, null);
INSERT INTO `student_info` VALUES ('168', null, null, null, null, '2024-05-29 13:53:41', null, null);
INSERT INTO `student_info` VALUES ('169', null, null, null, null, '2024-05-29 13:53:41', null, null);
INSERT INTO `student_info` VALUES ('170', null, null, null, null, '2024-05-29 13:53:41', null, null);
INSERT INTO `student_info` VALUES ('171', null, null, null, null, '2024-05-29 13:56:33', null, null);
INSERT INTO `student_info` VALUES ('172', null, null, null, null, '2024-05-29 13:56:33', null, null);
INSERT INTO `student_info` VALUES ('173', null, null, null, null, '2024-05-29 13:56:33', null, null);
INSERT INTO `student_info` VALUES ('174', null, null, null, null, '2024-05-29 13:56:33', null, null);
INSERT INTO `student_info` VALUES ('175', null, null, null, null, '2024-05-29 13:56:33', null, null);
INSERT INTO `student_info` VALUES ('176', null, null, null, null, '2024-05-29 13:56:33', null, null);
INSERT INTO `student_info` VALUES ('177', null, null, null, null, '2024-05-29 13:56:33', null, null);
INSERT INTO `student_info` VALUES ('178', null, null, null, null, '2024-05-29 13:56:33', null, null);
INSERT INTO `student_info` VALUES ('179', null, null, null, null, '2024-05-29 13:59:58', null, null);
INSERT INTO `student_info` VALUES ('180', null, null, null, null, '2024-05-29 13:59:58', null, null);
INSERT INTO `student_info` VALUES ('181', null, null, null, null, '2024-05-29 13:59:58', null, null);
INSERT INTO `student_info` VALUES ('182', null, null, null, null, '2024-05-29 13:59:58', null, null);
INSERT INTO `student_info` VALUES ('183', null, null, null, null, '2024-05-29 13:59:58', null, null);
INSERT INTO `student_info` VALUES ('184', null, null, null, null, '2024-05-29 13:59:58', null, null);
INSERT INTO `student_info` VALUES ('185', null, null, null, null, '2024-05-29 13:59:59', null, null);
INSERT INTO `student_info` VALUES ('186', null, null, null, null, '2024-05-29 13:59:59', null, null);
INSERT INTO `student_info` VALUES ('187', null, null, null, null, '2024-05-29 13:59:59', null, null);
INSERT INTO `student_info` VALUES ('188', null, null, null, null, '2024-05-29 13:59:59', null, null);
INSERT INTO `student_info` VALUES ('189', null, null, null, null, '2024-05-29 13:59:59', null, null);
INSERT INTO `student_info` VALUES ('190', null, null, null, null, '2024-05-29 13:59:59', null, null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '账号的编号',
  `username` varchar(20) NOT NULL COMMENT '登录的账号',
  `password` varchar(32) NOT NULL COMMENT '登录的密码',
  `role` int NOT NULL COMMENT '3为管理员，2为宿管，1为学生',
  `name` varchar(20) NOT NULL COMMENT '用户姓名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_username_uindex` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='账号管理';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '3', '系统管理员');
INSERT INTO `user` VALUES ('2', 'admin2', 'e10adc3949ba59abbe56e057f20f883e', '2', '宿管1号');
INSERT INTO `user` VALUES ('3', 'admin3', 'e10adc3949ba59abbe56e057f20f883e', '2', '宿管2号');
INSERT INTO `user` VALUES ('4', 'admin4', 'e10adc3949ba59abbe56e057f20f883e', '2', '宿管3号');
INSERT INTO `user` VALUES ('5', 'admin5', 'e10adc3949ba59abbe56e057f20f883e', '2', '宿管4号');
INSERT INTO `user` VALUES ('7', 'admin6', 'e10adc3949ba59abbe56e057f20f883e', '2', '宿管5号');
INSERT INTO `user` VALUES ('8', '202001010101', 'e10adc3949ba59abbe56e057f20f883e', '1', '张一');
INSERT INTO `user` VALUES ('11', '202001010102', 'e10adc3949ba59abbe56e057f20f883e', '1', '张二');
INSERT INTO `user` VALUES ('12', '202001010104', 'e10adc3949ba59abbe56e057f20f883e', '1', '张四');
INSERT INTO `user` VALUES ('13', '202001010105', 'e10adc3949ba59abbe56e057f20f883e', '1', '张五');
INSERT INTO `user` VALUES ('14', '202001010106', 'e10adc3949ba59abbe56e057f20f883e', '1', '张六');
INSERT INTO `user` VALUES ('15', '202001010103', 'e10adc3949ba59abbe56e057f20f883e', '1', '张三');
INSERT INTO `user` VALUES ('17', '202001010201', 'e10adc3949ba59abbe56e057f20f883e', '1', '李一');
INSERT INTO `user` VALUES ('18', '202001010202', 'e10adc3949ba59abbe56e057f20f883e', '1', '李二');
INSERT INTO `user` VALUES ('19', '202001010203', 'e10adc3949ba59abbe56e057f20f883e', '1', '李三');
INSERT INTO `user` VALUES ('20', '202001010204', 'e10adc3949ba59abbe56e057f20f883e', '1', '李四');
INSERT INTO `user` VALUES ('21', '202001010205', 'e10adc3949ba59abbe56e057f20f883e', '1', '李五');
INSERT INTO `user` VALUES ('22', '202001010206', 'e10adc3949ba59abbe56e057f20f883e', '1', '李六');
INSERT INTO `user` VALUES ('23', '202101010101', 'e10adc3949ba59abbe56e057f20f883e', '1', '杨一');
INSERT INTO `user` VALUES ('24', '202101010102', 'e10adc3949ba59abbe56e057f20f883e', '1', '杨二');
INSERT INTO `user` VALUES ('25', '202101010103', 'e10adc3949ba59abbe56e057f20f883e', '1', '杨三');
INSERT INTO `user` VALUES ('26', '202101010104', 'e10adc3949ba59abbe56e057f20f883e', '1', '杨四');
INSERT INTO `user` VALUES ('27', '202101010105', 'e10adc3949ba59abbe56e057f20f883e', '1', '杨五');
INSERT INTO `user` VALUES ('28', '202101010106', 'e10adc3949ba59abbe56e057f20f883e', '1', '杨六');
INSERT INTO `user` VALUES ('29', '202101010201', 'e10adc3949ba59abbe56e057f20f883e', '1', '刘一');
INSERT INTO `user` VALUES ('30', '202101010202', 'e10adc3949ba59abbe56e057f20f883e', '1', '刘二');
INSERT INTO `user` VALUES ('31', '202101010203', 'e10adc3949ba59abbe56e057f20f883e', '1', '刘三');
INSERT INTO `user` VALUES ('32', '202101010204', 'e10adc3949ba59abbe56e057f20f883e', '1', '刘四');
INSERT INTO `user` VALUES ('33', '202101010205', 'e10adc3949ba59abbe56e057f20f883e', '1', '刘五');
INSERT INTO `user` VALUES ('34', '202101010206', 'e10adc3949ba59abbe56e057f20f883e', '1', '刘六');
INSERT INTO `user` VALUES ('35', '202001020101', 'e10adc3949ba59abbe56e057f20f883e', '1', '王一');
INSERT INTO `user` VALUES ('36', '202001020102', 'e10adc3949ba59abbe56e057f20f883e', '1', '王二');
INSERT INTO `user` VALUES ('37', '202001020103', 'e10adc3949ba59abbe56e057f20f883e', '1', '王三');
INSERT INTO `user` VALUES ('38', '202001020104', 'e10adc3949ba59abbe56e057f20f883e', '1', '王四');
INSERT INTO `user` VALUES ('39', '202101020101', 'e10adc3949ba59abbe56e057f20f883e', '1', '朱一');
INSERT INTO `user` VALUES ('40', '202101020102', 'e10adc3949ba59abbe56e057f20f883e', '1', '朱二');
INSERT INTO `user` VALUES ('41', '202101020103', 'e10adc3949ba59abbe56e057f20f883e', '1', '朱三');
INSERT INTO `user` VALUES ('42', '202101020104', 'e10adc3949ba59abbe56e057f20f883e', '1', '朱四');
INSERT INTO `user` VALUES ('43', '202001030101', 'e10adc3949ba59abbe56e057f20f883e', '1', '田一');
INSERT INTO `user` VALUES ('44', '202001030102', 'e10adc3949ba59abbe56e057f20f883e', '1', '田二');
INSERT INTO `user` VALUES ('45', '202001030103', 'e10adc3949ba59abbe56e057f20f883e', '1', '田三');
INSERT INTO `user` VALUES ('46', '202001030104', 'e10adc3949ba59abbe56e057f20f883e', '1', '田四');
INSERT INTO `user` VALUES ('47', '202101030101', 'e10adc3949ba59abbe56e057f20f883e', '1', '田五');
INSERT INTO `user` VALUES ('48', '202101030102', 'e10adc3949ba59abbe56e057f20f883e', '1', '田六');
INSERT INTO `user` VALUES ('49', '202101030103', 'e10adc3949ba59abbe56e057f20f883e', '1', '田七');
INSERT INTO `user` VALUES ('50', '202101030104', 'e10adc3949ba59abbe56e057f20f883e', '1', '田八');
INSERT INTO `user` VALUES ('51', '202002010101', 'e10adc3949ba59abbe56e057f20f883e', '1', '丁一');
INSERT INTO `user` VALUES ('52', '202002010102', 'e10adc3949ba59abbe56e057f20f883e', '1', '丁二');
INSERT INTO `user` VALUES ('53', '202002010103', 'e10adc3949ba59abbe56e057f20f883e', '1', '丁三');
INSERT INTO `user` VALUES ('54', '202002010104', 'e10adc3949ba59abbe56e057f20f883e', '1', '丁四');
INSERT INTO `user` VALUES ('55', '202002010201', 'e10adc3949ba59abbe56e057f20f883e', '1', '丁五');
INSERT INTO `user` VALUES ('56', '202002010202', 'e10adc3949ba59abbe56e057f20f883e', '1', '丁六');
INSERT INTO `user` VALUES ('57', '202002010203', 'e10adc3949ba59abbe56e057f20f883e', '1', '丁七');
INSERT INTO `user` VALUES ('58', '202002010204', 'e10adc3949ba59abbe56e057f20f883e', '1', '丁八');
INSERT INTO `user` VALUES ('59', '202002010301', 'e10adc3949ba59abbe56e057f20f883e', '1', '丁壹');
INSERT INTO `user` VALUES ('60', '202002010302', 'e10adc3949ba59abbe56e057f20f883e', '1', '丁贰');
INSERT INTO `user` VALUES ('61', '202002010303', 'e10adc3949ba59abbe56e057f20f883e', '1', '丁叁');
INSERT INTO `user` VALUES ('62', '202002010304', 'e10adc3949ba59abbe56e057f20f883e', '1', '丁肆');
INSERT INTO `user` VALUES ('63', '202002020101', 'e10adc3949ba59abbe56e057f20f883e', '1', '丁伍');
INSERT INTO `user` VALUES ('64', '202002020102', 'e10adc3949ba59abbe56e057f20f883e', '1', '丁陆');
INSERT INTO `user` VALUES ('65', '202002020103', 'e10adc3949ba59abbe56e057f20f883e', '1', '丁柒');
INSERT INTO `user` VALUES ('66', '202002020104', 'e10adc3949ba59abbe56e057f20f883e', '1', '丁捌');
INSERT INTO `user` VALUES ('67', '202102010101', 'e10adc3949ba59abbe56e057f20f883e', '1', '宋一');
INSERT INTO `user` VALUES ('68', '202102010102', 'e10adc3949ba59abbe56e057f20f883e', '1', '宋二');
INSERT INTO `user` VALUES ('69', '202102010103', 'e10adc3949ba59abbe56e057f20f883e', '1', '宋三');
INSERT INTO `user` VALUES ('70', '202102010104', 'e10adc3949ba59abbe56e057f20f883e', '1', '宋四');
INSERT INTO `user` VALUES ('71', '202102010201', 'e10adc3949ba59abbe56e057f20f883e', '1', '宋五');
INSERT INTO `user` VALUES ('72', '202102010202', 'e10adc3949ba59abbe56e057f20f883e', '1', '宋六');
INSERT INTO `user` VALUES ('73', '202102010203', 'e10adc3949ba59abbe56e057f20f883e', '1', '宋七');
INSERT INTO `user` VALUES ('74', '202102010204', 'e10adc3949ba59abbe56e057f20f883e', '1', '宋八');
INSERT INTO `user` VALUES ('75', '202102020101', 'e10adc3949ba59abbe56e057f20f883e', '1', '宋壹');
INSERT INTO `user` VALUES ('76', '202102020102', 'e10adc3949ba59abbe56e057f20f883e', '1', '宋贰');
INSERT INTO `user` VALUES ('77', '202102020103', 'e10adc3949ba59abbe56e057f20f883e', '1', '宋叁');
INSERT INTO `user` VALUES ('78', '202102020104', 'e10adc3949ba59abbe56e057f20f883e', '1', '宋肆');
INSERT INTO `user` VALUES ('79', '202003010101', 'e10adc3949ba59abbe56e057f20f883e', '1', '金一');
INSERT INTO `user` VALUES ('80', '202003010102', 'e10adc3949ba59abbe56e057f20f883e', '1', '金二');
INSERT INTO `user` VALUES ('81', '202003010103', 'e10adc3949ba59abbe56e057f20f883e', '1', '金三');
INSERT INTO `user` VALUES ('82', '202003010104', 'e10adc3949ba59abbe56e057f20f883e', '1', '金四');
INSERT INTO `user` VALUES ('83', '202003010201', 'e10adc3949ba59abbe56e057f20f883e', '1', '金五');
INSERT INTO `user` VALUES ('84', '202003010202', 'e10adc3949ba59abbe56e057f20f883e', '1', '金六');
INSERT INTO `user` VALUES ('85', '202003010203', 'e10adc3949ba59abbe56e057f20f883e', '1', '金七');
INSERT INTO `user` VALUES ('86', '202003010204', 'e10adc3949ba59abbe56e057f20f883e', '1', '金八');
INSERT INTO `user` VALUES ('87', '202103010101', 'e10adc3949ba59abbe56e057f20f883e', '1', '金壹');
INSERT INTO `user` VALUES ('88', '202103010102', 'e10adc3949ba59abbe56e057f20f883e', '1', '金贰');
INSERT INTO `user` VALUES ('89', '202103010103', 'e10adc3949ba59abbe56e057f20f883e', '1', '金叁');
INSERT INTO `user` VALUES ('90', '202103010104', 'e10adc3949ba59abbe56e057f20f883e', '1', '金肆');
INSERT INTO `user` VALUES ('91', '202103010201', 'e10adc3949ba59abbe56e057f20f883e', '1', '金伍');
INSERT INTO `user` VALUES ('92', '202103010202', 'e10adc3949ba59abbe56e057f20f883e', '1', '金陆');
INSERT INTO `user` VALUES ('93', '202103010203', 'e10adc3949ba59abbe56e057f20f883e', '1', '金柒');
INSERT INTO `user` VALUES ('94', '202103010204', 'e10adc3949ba59abbe56e057f20f883e', '1', '金捌');
INSERT INTO `user` VALUES ('95', '202004010101', 'e10adc3949ba59abbe56e057f20f883e', '1', '黄一');
INSERT INTO `user` VALUES ('96', '202004010102', 'e10adc3949ba59abbe56e057f20f883e', '1', '黄二');
INSERT INTO `user` VALUES ('97', '202004010103', 'e10adc3949ba59abbe56e057f20f883e', '1', '黄三');
INSERT INTO `user` VALUES ('98', '202004010104', 'e10adc3949ba59abbe56e057f20f883e', '1', '黄四');
INSERT INTO `user` VALUES ('99', '202004010201', 'e10adc3949ba59abbe56e057f20f883e', '1', '黄五');
INSERT INTO `user` VALUES ('100', '202004010202', 'e10adc3949ba59abbe56e057f20f883e', '1', '黄六');
INSERT INTO `user` VALUES ('101', '202004010203', 'e10adc3949ba59abbe56e057f20f883e', '1', '黄七');
INSERT INTO `user` VALUES ('102', '202004010204', 'e10adc3949ba59abbe56e057f20f883e', '1', '黄八');
INSERT INTO `user` VALUES ('103', '202004020101', 'e10adc3949ba59abbe56e057f20f883e', '1', '黄壹');
INSERT INTO `user` VALUES ('104', '202004020102', 'e10adc3949ba59abbe56e057f20f883e', '1', '黄贰');
INSERT INTO `user` VALUES ('105', '202004020103', 'e10adc3949ba59abbe56e057f20f883e', '1', '黄叁');
INSERT INTO `user` VALUES ('106', '202004020104', 'e10adc3949ba59abbe56e057f20f883e', '1', '黄肆');
INSERT INTO `user` VALUES ('107', '202104010101', 'e10adc3949ba59abbe56e057f20f883e', '1', '白一');
INSERT INTO `user` VALUES ('108', '202104010102', 'e10adc3949ba59abbe56e057f20f883e', '1', '白二');
INSERT INTO `user` VALUES ('109', '202104010103', 'e10adc3949ba59abbe56e057f20f883e', '1', '白三');
INSERT INTO `user` VALUES ('110', '202104010104', 'e10adc3949ba59abbe56e057f20f883e', '1', '白四');
INSERT INTO `user` VALUES ('111', '202104020101', 'e10adc3949ba59abbe56e057f20f883e', '1', '白五');
INSERT INTO `user` VALUES ('112', '202104020102', 'e10adc3949ba59abbe56e057f20f883e', '1', '白六');
INSERT INTO `user` VALUES ('113', '202104020103', 'e10adc3949ba59abbe56e057f20f883e', '1', '白七');
INSERT INTO `user` VALUES ('114', '202104020104', 'e10adc3949ba59abbe56e057f20f883e', '1', '白八');
INSERT INTO `user` VALUES ('115', '202001010301', 'e10adc3949ba59abbe56e057f20f883e', '1', '马一');
INSERT INTO `user` VALUES ('116', '202001010302', 'e10adc3949ba59abbe56e057f20f883e', '1', '马二');
INSERT INTO `user` VALUES ('117', '202001010303', 'e10adc3949ba59abbe56e057f20f883e', '1', '马三');
INSERT INTO `user` VALUES ('118', '202001010304', 'e10adc3949ba59abbe56e057f20f883e', '1', '马四');
INSERT INTO `user` VALUES ('119', '202001010305', 'e10adc3949ba59abbe56e057f20f883e', '1', '马五');
INSERT INTO `user` VALUES ('120', '202001010306', 'e10adc3949ba59abbe56e057f20f883e', '1', '马六');
INSERT INTO `user` VALUES ('121', '202101010301', 'e10adc3949ba59abbe56e057f20f883e', '1', '马壹');
INSERT INTO `user` VALUES ('122', '202101010302', 'e10adc3949ba59abbe56e057f20f883e', '1', '马贰');
INSERT INTO `user` VALUES ('123', '202101010303', 'e10adc3949ba59abbe56e057f20f883e', '1', '马叁');
INSERT INTO `user` VALUES ('124', '202101010304', 'e10adc3949ba59abbe56e057f20f883e', '1', '马肆');
INSERT INTO `user` VALUES ('125', '202101010305', 'e10adc3949ba59abbe56e057f20f883e', '1', '马伍');
INSERT INTO `user` VALUES ('126', '202101010306', 'e10adc3949ba59abbe56e057f20f883e', '1', '马陆');
INSERT INTO `user` VALUES ('127', '202005010101', 'e10adc3949ba59abbe56e057f20f883e', '1', '陈一');
INSERT INTO `user` VALUES ('128', '202005010102', 'e10adc3949ba59abbe56e057f20f883e', '1', '陈二');
INSERT INTO `user` VALUES ('129', '202005010103', 'e10adc3949ba59abbe56e057f20f883e', '1', '陈三');
INSERT INTO `user` VALUES ('130', '202005010104', 'e10adc3949ba59abbe56e057f20f883e', '1', '陈四');
INSERT INTO `user` VALUES ('131', '202005010201', 'e10adc3949ba59abbe56e057f20f883e', '1', '陈五');
INSERT INTO `user` VALUES ('132', '202005010202', 'e10adc3949ba59abbe56e057f20f883e', '1', '陈六');
INSERT INTO `user` VALUES ('133', '202005010203', 'e10adc3949ba59abbe56e057f20f883e', '1', '陈七');
INSERT INTO `user` VALUES ('134', '202005010204', 'e10adc3949ba59abbe56e057f20f883e', '1', '陈八');
INSERT INTO `user` VALUES ('135', '202105020101', 'e10adc3949ba59abbe56e057f20f883e', '1', '陈壹');
INSERT INTO `user` VALUES ('136', '202105020102', 'e10adc3949ba59abbe56e057f20f883e', '1', '陈贰');
INSERT INTO `user` VALUES ('137', '202105020103', 'e10adc3949ba59abbe56e057f20f883e', '1', '陈叁');
INSERT INTO `user` VALUES ('138', '202105020104', 'e10adc3949ba59abbe56e057f20f883e', '1', '陈肆');
INSERT INTO `user` VALUES ('139', '202105010101', 'e10adc3949ba59abbe56e057f20f883e', '1', '陈伍');
INSERT INTO `user` VALUES ('140', '202105010102', 'e10adc3949ba59abbe56e057f20f883e', '1', '陈陆');
INSERT INTO `user` VALUES ('141', '202105010103', 'e10adc3949ba59abbe56e057f20f883e', '1', '陈柒');
INSERT INTO `user` VALUES ('142', '202105010104', 'e10adc3949ba59abbe56e057f20f883e', '1', '陈捌');
INSERT INTO `user` VALUES ('143', '202105030101', 'e10adc3949ba59abbe56e057f20f883e', '1', '毛一');
INSERT INTO `user` VALUES ('144', '202105030102', 'e10adc3949ba59abbe56e057f20f883e', '1', '毛二');
INSERT INTO `user` VALUES ('145', '202105030103', 'e10adc3949ba59abbe56e057f20f883e', '1', '毛三');
INSERT INTO `user` VALUES ('146', '202105030104', 'e10adc3949ba59abbe56e057f20f883e', '1', '毛四');
INSERT INTO `user` VALUES ('147', '202105040101', 'e10adc3949ba59abbe56e057f20f883e', '1', '毛五');
INSERT INTO `user` VALUES ('148', '202105040102', 'e10adc3949ba59abbe56e057f20f883e', '1', '毛六');
INSERT INTO `user` VALUES ('149', '202105040103', 'e10adc3949ba59abbe56e057f20f883e', '1', '毛七');
INSERT INTO `user` VALUES ('150', '202105040104', 'e10adc3949ba59abbe56e057f20f883e', '1', '毛八');
INSERT INTO `user` VALUES ('151', '202105050101', 'e10adc3949ba59abbe56e057f20f883e', '1', '毛壹');
INSERT INTO `user` VALUES ('152', '202105050102', 'e10adc3949ba59abbe56e057f20f883e', '1', '毛贰');
INSERT INTO `user` VALUES ('153', '202105050103', 'e10adc3949ba59abbe56e057f20f883e', '1', '毛叁');
INSERT INTO `user` VALUES ('154', '202105050104', 'e10adc3949ba59abbe56e057f20f883e', '1', '毛肆');
INSERT INTO `user` VALUES ('155', '202005020101', 'e10adc3949ba59abbe56e057f20f883e', '1', '习一');
INSERT INTO `user` VALUES ('156', '202005020102', 'e10adc3949ba59abbe56e057f20f883e', '1', '习二');
INSERT INTO `user` VALUES ('157', '202005020103', 'e10adc3949ba59abbe56e057f20f883e', '1', '习三');
INSERT INTO `user` VALUES ('158', '202005020104', 'e10adc3949ba59abbe56e057f20f883e', '1', '习四');
INSERT INTO `user` VALUES ('159', '202005020201', 'e10adc3949ba59abbe56e057f20f883e', '1', '习五');
INSERT INTO `user` VALUES ('160', '202005020202', 'e10adc3949ba59abbe56e057f20f883e', '1', '习六');
INSERT INTO `user` VALUES ('161', '202005020203', 'e10adc3949ba59abbe56e057f20f883e', '1', '习七');
INSERT INTO `user` VALUES ('162', '202005020204', 'e10adc3949ba59abbe56e057f20f883e', '1', '习八');
INSERT INTO `user` VALUES ('163', '202005030101', 'e10adc3949ba59abbe56e057f20f883e', '1', '胡一');
INSERT INTO `user` VALUES ('164', '202005030102', 'e10adc3949ba59abbe56e057f20f883e', '1', '胡二');
INSERT INTO `user` VALUES ('165', '202005030103', 'e10adc3949ba59abbe56e057f20f883e', '1', '胡三');
INSERT INTO `user` VALUES ('166', '202005030104', 'e10adc3949ba59abbe56e057f20f883e', '1', '胡四');
INSERT INTO `user` VALUES ('167', '202005030201', 'e10adc3949ba59abbe56e057f20f883e', '1', '胡五');
INSERT INTO `user` VALUES ('168', '202005030202', 'e10adc3949ba59abbe56e057f20f883e', '1', '胡六');
INSERT INTO `user` VALUES ('169', '202005030203', 'e10adc3949ba59abbe56e057f20f883e', '1', '胡七');
INSERT INTO `user` VALUES ('170', '202005030204', 'e10adc3949ba59abbe56e057f20f883e', '1', '胡八');
INSERT INTO `user` VALUES ('171', '202005040101', 'e10adc3949ba59abbe56e057f20f883e', '1', '韩一');
INSERT INTO `user` VALUES ('172', '202005040102', 'e10adc3949ba59abbe56e057f20f883e', '1', '韩二');
INSERT INTO `user` VALUES ('173', '202005040103', 'e10adc3949ba59abbe56e057f20f883e', '1', '韩三');
INSERT INTO `user` VALUES ('174', '202005040104', 'e10adc3949ba59abbe56e057f20f883e', '1', '韩四');
INSERT INTO `user` VALUES ('175', '202005040201', 'e10adc3949ba59abbe56e057f20f883e', '1', '韩五');
INSERT INTO `user` VALUES ('176', '202005040202', 'e10adc3949ba59abbe56e057f20f883e', '1', '韩六');
INSERT INTO `user` VALUES ('177', '202005040203', 'e10adc3949ba59abbe56e057f20f883e', '1', '韩七');
INSERT INTO `user` VALUES ('178', '202005040204', 'e10adc3949ba59abbe56e057f20f883e', '1', '韩八');
INSERT INTO `user` VALUES ('179', '202005050101', 'e10adc3949ba59abbe56e057f20f883e', '1', '钟一');
INSERT INTO `user` VALUES ('180', '202005050102', 'e10adc3949ba59abbe56e057f20f883e', '1', '钟二');
INSERT INTO `user` VALUES ('181', '202005050103', 'e10adc3949ba59abbe56e057f20f883e', '1', '钟三');
INSERT INTO `user` VALUES ('182', '202005050104', 'e10adc3949ba59abbe56e057f20f883e', '1', '钟四');
INSERT INTO `user` VALUES ('183', '202005050201', 'e10adc3949ba59abbe56e057f20f883e', '1', '钟五');
INSERT INTO `user` VALUES ('184', '202005050202', 'e10adc3949ba59abbe56e057f20f883e', '1', '钟六');
INSERT INTO `user` VALUES ('185', '202005050203', 'e10adc3949ba59abbe56e057f20f883e', '1', '钟七');
INSERT INTO `user` VALUES ('186', '202005050204', 'e10adc3949ba59abbe56e057f20f883e', '1', '钟八');
INSERT INTO `user` VALUES ('187', '202005050301', 'e10adc3949ba59abbe56e057f20f883e', '1', '钟壹');
INSERT INTO `user` VALUES ('188', '202005050302', 'e10adc3949ba59abbe56e057f20f883e', '1', '钟贰');
INSERT INTO `user` VALUES ('189', '202005050303', 'e10adc3949ba59abbe56e057f20f883e', '1', '钟叁');
INSERT INTO `user` VALUES ('190', '202005050304', 'e10adc3949ba59abbe56e057f20f883e', '1', '钟肆');

-- ----------------------------
-- View structure for view_change_dor_application
-- ----------------------------
DROP VIEW IF EXISTS `view_change_dor_application`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_change_dor_application` AS select `change_dormitory_application`.`id` AS `id`,`change_dormitory_application`.`state` AS `state`,`change_dormitory_application`.`create_time` AS `create_time`,`change_dormitory_application`.`update_time` AS `update_time`,`change_dormitory_application`.`stu_id` AS `stu_id`,`user1`.`name` AS `stu_name`,`stu1`.`study_id` AS `stu_study_id`,`change_dormitory_application`.`old_id` AS `old_id`,`dor1`.`name` AS `old_name`,`dor1`.`unit_number` AS `old_unit_number`,`dor1`.`floor_number` AS `old_floor_number`,`building1`.`name` AS `old_building_name`,`dor2`.`id` AS `new_id`,`dor2`.`name` AS `new_name`,`dor2`.`unit_number` AS `new_unit_number`,`dor2`.`floor_number` AS `new_floor_number`,`building2`.`name` AS `new_building_name`,`change_dormitory_application`.`new_stu_id` AS `new_stu_id`,`change_dormitory_application`.`new_stu_name` AS `new_stu_name`,`change_dormitory_application`.`new_stu_study_id` AS `new_stu_study_id` from ((((((`change_dormitory_application` join `student` `stu1`) join `dormitory` `dor1`) join `dormitory` `dor2`) join `user` `user1`) join `building` `building1`) join `building` `building2`) where ((`stu1`.`user_id` = `change_dormitory_application`.`stu_id`) and (`change_dormitory_application`.`old_id` = `dor1`.`id`) and (`change_dormitory_application`.`new_dormitory_id` = `dor2`.`id`) and (`user1`.`id` = `stu1`.`user_id`) and (`dor1`.`building_id` = `building1`.`id`) and (`dor2`.`building_id` = `building2`.`id`)) ;

-- ----------------------------
-- View structure for view_get_all_building_info
-- ----------------------------
DROP VIEW IF EXISTS `view_get_all_building_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_get_all_building_info` AS select `building`.`id` AS `id`,`building`.`name` AS `name`,`building`.`unit_number` AS `unit_number`,`building`.`dor_number` AS `dor_number`,`building`.`stu_number` AS `stu_number`,`building_info`.`build_year` AS `build_year`,`building_info`.`introduction` AS `introduction`,`building_info`.`picture` AS `picture`,`building_info`.`update_time` AS `update_time`,`building_info`.`floor_number` AS `floor_number`,`user`.`name` AS `man_name`,`user`.`id` AS `man_id`,`manager`.`work_id` AS `work_id` from (((`building` join `building_info`) join `user`) join `manager`) where ((`building`.`id` = `building_info`.`building_id`) and (`user`.`id` = `building`.`manager_id`) and (`manager`.`user_id` = `user`.`id`)) ;

-- ----------------------------
-- View structure for view_get_all_building_manager
-- ----------------------------
DROP VIEW IF EXISTS `view_get_all_building_manager`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_get_all_building_manager` AS select `building`.`id` AS `id`,`building`.`name` AS `name`,`building`.`unit_number` AS `unit_number`,`building`.`dor_number` AS `dor_number`,`building`.`stu_number` AS `stu_number`,`user`.`name` AS `man_name`,`building`.`manager_id` AS `manager_id` from (`building` join `user`) where (`user`.`id` = `building`.`manager_id`) ;

-- ----------------------------
-- View structure for view_get_all_clazz_list
-- ----------------------------
DROP VIEW IF EXISTS `view_get_all_clazz_list`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_get_all_clazz_list` AS select `clazz`.`id` AS `id`,`clazz`.`name` AS `name`,`clazz`.`stu_number` AS `stu_number`,`major`.`name` AS `major_name`,`institute`.`name` AS `ins_name`,`clazz`.`entrance_year` AS `entrance_year` from ((`clazz` join `major` on((`clazz`.`major_id` = `major`.`id`))) join `institute` on((`major`.`ins_id` = `institute`.`id`))) ;

-- ----------------------------
-- View structure for view_get_all_dormitory_list
-- ----------------------------
DROP VIEW IF EXISTS `view_get_all_dormitory_list`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_get_all_dormitory_list` AS select `dormitory`.`name` AS `name`,`dormitory`.`unit_number` AS `unit_number`,`dormitory`.`stu_number` AS `stu_number`,`dormitory`.`bed_number` AS `bed_number`,`dormitory`.`update_time` AS `update_time`,`dormitory`.`floor_number` AS `floor_number`,`building`.`name` AS `building_name`,`user`.`name` AS `man_name`,`dormitory`.`id` AS `id`,`dormitory`.`picture` AS `picture`,`manager`.`work_id` AS `work_id`,`dormitory`.`building_id` AS `building_id`,`building`.`manager_id` AS `manager_id` from (((`dormitory` join `building`) join `user`) join `manager`) where ((`dormitory`.`building_id` = `building`.`id`) and (`building`.`manager_id` = `user`.`id`) and (`user`.`id` = `manager`.`user_id`)) ;

-- ----------------------------
-- View structure for view_get_all_email_list
-- ----------------------------
DROP VIEW IF EXISTS `view_get_all_email_list`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_get_all_email_list` AS select `email`.`id` AS `id`,`email`.`send` AS `send`,`email`.`send_id` AS `send_id`,`email`.`send_show` AS `send_show`,`user`.`name` AS `send_name`,`email`.`re` AS `re`,`email`.`re_id` AS `re_id`,`email`.`re_show` AS `re_show`,`user2`.`name` AS `re_name`,`email`.`theme` AS `theme`,`email`.`content` AS `content`,`email`.`create_time` AS `create_time` from ((`user` join `email`) join `user` `user2`) where ((`user`.`id` = `email`.`send`) and (`user2`.`id` = `email`.`re`)) ;

-- ----------------------------
-- View structure for view_get_all_major_list
-- ----------------------------
DROP VIEW IF EXISTS `view_get_all_major_list`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_get_all_major_list` AS select `major`.`name` AS `name`,`major`.`clazz_number` AS `clazz_number`,`major`.`stu_number` AS `stu_number`,`major`.`id` AS `id`,`institute`.`name` AS `ins_name` from (`institute` join `major` on((`major`.`ins_id` = `institute`.`id`))) ;

-- ----------------------------
-- View structure for view_get_all_manager_list
-- ----------------------------
DROP VIEW IF EXISTS `view_get_all_manager_list`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_get_all_manager_list` AS select `user`.`name` AS `name`,`manager`.`gender` AS `gender`,`manager`.`phone` AS `phone`,`manager`.`picture` AS `picture`,`manager`.`email` AS `email`,`manager`.`building_number` AS `building_number`,`manager`.`work_id` AS `work_id`,`user`.`id` AS `id`,`user`.`username` AS `username` from (`user` join `manager`) where (`user`.`id` = `manager`.`user_id`) ;

-- ----------------------------
-- View structure for view_get_all_studentinfo_list
-- ----------------------------
DROP VIEW IF EXISTS `view_get_all_studentinfo_list`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_get_all_studentinfo_list` AS select `user`.`id` AS `id`,`user`.`name` AS `name`,`student`.`study_id` AS `study_id`,`student`.`gender` AS `gender`,`student`.`entrance_year` AS `entrance_year`,`building`.`id` AS `building_id`,`building`.`name` AS `building_name`,`institute`.`id` AS `ins_id`,`institute`.`name` AS `ins_name`,`major`.`id` AS `major_id`,`major`.`name` AS `major_name`,`clazz`.`id` AS `clazz_id`,`clazz`.`name` AS `clazz_name`,`student_info`.`phone` AS `phone`,`student_info`.`picture` AS `picture`,`student_info`.`email` AS `email`,`student_info`.`introduction` AS `introduction`,`student_info`.`update_time` AS `update_time`,`student_info`.`ethnicity` AS `ethnicity`,`dormitory`.`id` AS `dormitory_id`,`dormitory`.`name` AS `dormitory_name`,`dormitory`.`unit_number` AS `unit_number`,`dormitory`.`floor_number` AS `floor_number`,`student_info`.`birthday` AS `birthday`,`clazz`.`entrance_year` AS `clazz_year`,`building`.`manager_id` AS `manager_id` from (((((((`user` join `student`) join `student_info`) join `building`) join `dormitory`) join `institute`) join `major`) join `clazz`) where ((`user`.`id` = `student`.`user_id`) and (`student`.`dormitory_id` = `dormitory`.`id`) and (`dormitory`.`building_id` = `building`.`id`) and (`student`.`clazz_id` = `clazz`.`id`) and (`clazz`.`major_id` = `major`.`id`) and (`major`.`ins_id` = `institute`.`id`) and (`user`.`id` = `student_info`.`student_id`)) ;

-- ----------------------------
-- View structure for view_get_all_student_list
-- ----------------------------
DROP VIEW IF EXISTS `view_get_all_student_list`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_get_all_student_list` AS select `user`.`id` AS `id`,`user`.`name` AS `name`,`student`.`study_id` AS `study_id`,`student`.`gender` AS `gender`,`student`.`entrance_year` AS `entrance_year`,`dormitory`.`name` AS `dormitory_name`,`student`.`dormitory_id` AS `dormitory_id`,`dormitory`.`building_id` AS `building_id`,`building`.`name` AS `building_name`,`clazz`.`name` AS `clazz_name`,`clazz`.`id` AS `clazz_id`,`institute`.`id` AS `ins_id`,`institute`.`name` AS `ins_name`,`major`.`id` AS `major_id`,`major`.`name` AS `major_name`,`dormitory`.`unit_number` AS `unit_number`,`dormitory`.`floor_number` AS `floor_number`,`clazz`.`entrance_year` AS `clazz_year`,`building`.`manager_id` AS `manager_id` from ((((((`user` join `student`) join `building`) join `dormitory`) join `clazz`) join `major`) join `institute`) where ((`user`.`id` = `student`.`user_id`) and (`student`.`dormitory_id` = `dormitory`.`id`) and (`dormitory`.`building_id` = `building`.`id`) and (`student`.`clazz_id` = `clazz`.`id`) and (`clazz`.`major_id` = `major`.`id`) and (`major`.`ins_id` = `institute`.`id`)) ;

-- ----------------------------
-- View structure for view_repair_application
-- ----------------------------
DROP VIEW IF EXISTS `view_repair_application`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_repair_application` AS select `repair_application`.`id` AS `id`,`repair_application`.`state` AS `state`,`repair_application`.`picture` AS `picture`,`repair_application`.`trouble_item` AS `trouble_item`,`repair_application`.`description` AS `description`,`repair_application`.`create_time` AS `create_time`,`repair_application`.`update_time` AS `update_time`,`repair_application`.`stu_id` AS `stu_id`,`user`.`name` AS `stu_name`,`student`.`study_id` AS `stu_study_id`,`repair_application`.`dor_id` AS `dor_id`,`dormitory`.`name` AS `dor_name`,`dormitory`.`unit_number` AS `unit_number`,`dormitory`.`floor_number` AS `floor_number`,`building`.`name` AS `building_name`,`building`.`manager_id` AS `building_man_id`,`repair_application`.`manager_id` AS `manager_id`,`repair_application`.`manager_message` AS `manager_message`,`student_info`.`phone` AS `phone` from (((((`repair_application` join `student`) join `user`) join `dormitory`) join `building`) join `student_info`) where ((`student`.`user_id` = `repair_application`.`stu_id`) and (`user`.`id` = `student`.`user_id`) and (`dormitory`.`id` = `repair_application`.`dor_id`) and (`dormitory`.`building_id` = `building`.`id`) and (`user`.`id` = `student_info`.`student_id`)) ;
