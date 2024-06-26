/*
Navicat MySQL Data Transfer

Source Server         : mydb
Source Server Version : 80026
Source Host           : localhost:3306
Source Database       : dormitory_management_system

Target Server Type    : MYSQL
Target Server Version : 80026
File Encoding         : 65001

Date: 2024-01-22 22:14:04
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='宿舍楼';

-- ----------------------------
-- Records of building
-- ----------------------------
INSERT INTO `building` VALUES ('1', '1栋', '2', '2', '0', '0');
INSERT INTO `building` VALUES ('2', '2栋', '1', '2', '0', '0');
INSERT INTO `building` VALUES ('3', '3栋', '1', '2', '0', '0');
INSERT INTO `building` VALUES ('4', '4栋', '1', '1', '0', '0');
INSERT INTO `building` VALUES ('5', '5栋', '1', '2', '0', '0');
INSERT INTO `building` VALUES ('6', '6栋', '1', '2', '0', '0');
INSERT INTO `building` VALUES ('7', '7栋', '1', '2', '0', '0');
INSERT INTO `building` VALUES ('8', '8栋', '1', '2', '0', '0');
INSERT INTO `building` VALUES ('9', '9栋', '1', '2', '0', '0');
INSERT INTO `building` VALUES ('10', '10栋', '1', '2', '0', '0');
INSERT INTO `building` VALUES ('11', '11栋', '1', '2', '0', '0');
INSERT INTO `building` VALUES ('12', '友谊学校', '2', '2', '0', '0');

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
INSERT INTO `building_info` VALUES ('1', '2010-09-02', '1栋是个好宿舍', 'https://hzh-biyesheji.oss-cn-beijing.aliyuncs.com/9d88300e-2e61-4682-9f11-951bfd225618.jpg', '2024-01-22 18:49:32', '2');
INSERT INTO `building_info` VALUES ('2', '2024-01-01', null, null, '2024-01-22 12:56:01', '2');
INSERT INTO `building_info` VALUES ('3', null, null, null, '2024-01-21 08:44:28', '1');
INSERT INTO `building_info` VALUES ('4', null, null, null, '2024-01-22 13:35:44', '1');
INSERT INTO `building_info` VALUES ('5', null, null, null, '2024-01-21 08:44:28', '1');
INSERT INTO `building_info` VALUES ('6', null, null, null, '2024-01-21 08:44:28', '1');
INSERT INTO `building_info` VALUES ('7', '2020-01-02', null, null, '2024-01-22 08:59:37', '2');
INSERT INTO `building_info` VALUES ('8', null, null, null, '2024-01-21 08:51:23', '1');
INSERT INTO `building_info` VALUES ('9', null, null, null, '2024-01-21 13:40:00', '1');
INSERT INTO `building_info` VALUES ('10', null, null, null, '2024-01-21 13:40:00', '1');
INSERT INTO `building_info` VALUES ('11', null, null, null, '2024-01-22 09:59:51', '1');
INSERT INTO `building_info` VALUES ('12', '2077-01-01', '小马谷欢迎你', 'https://hzh-biyesheji.oss-cn-beijing.aliyuncs.com/e9b1eb53-8da3-48d0-b554-e3d17eb9dc73.jpg', '2024-01-22 13:18:50', '2');

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
  PRIMARY KEY (`id`),
  KEY `dormitory_building_id_fk` (`building_id`),
  CONSTRAINT `dormitory_building_id_fk` FOREIGN KEY (`building_id`) REFERENCES `building` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='学生寝室';

-- ----------------------------
-- Records of dormitory
-- ----------------------------

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
INSERT INTO `manager` VALUES ('1', '男', null, null, null, '10', '20240001');
INSERT INTO `manager` VALUES ('2', '男', null, null, null, '2', '20240002');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `user_id` int NOT NULL COMMENT '对应的账号编号',
  `dormitory_id` int DEFAULT NULL COMMENT '所在寝室的编号',
  `id` varchar(20) DEFAULT NULL COMMENT '学生学号',
  KEY `student_user_fk` (`user_id`),
  KEY `student_dormitory_id_fk` (`dormitory_id`),
  CONSTRAINT `student_dormitory_id_fk` FOREIGN KEY (`dormitory_id`) REFERENCES `dormitory` (`id`),
  CONSTRAINT `student_user_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='学生信息';

-- ----------------------------
-- Records of student
-- ----------------------------

-- ----------------------------
-- Table structure for student_inf
-- ----------------------------
DROP TABLE IF EXISTS `student_inf`;
CREATE TABLE `student_inf` (
  `student_id` int DEFAULT NULL COMMENT '学生编号',
  `phone` varchar(11) DEFAULT NULL COMMENT '电话',
  `gender` char(1) DEFAULT '男' COMMENT '学生性别',
  `picture` varchar(256) DEFAULT NULL COMMENT '学生照片',
  `institute` varchar(20) DEFAULT NULL COMMENT '学生所在学院',
  `entrance_time` int DEFAULT NULL COMMENT '入学年份',
  `class` varchar(20) DEFAULT NULL COMMENT '班级',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱',
  KEY `student_inf_student_user_id_fk` (`student_id`),
  CONSTRAINT `student_inf_student_user_id_fk` FOREIGN KEY (`student_id`) REFERENCES `student` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='学生的详细信息';

-- ----------------------------
-- Records of student_inf
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='账号管理';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '3', '系统管理员');
INSERT INTO `user` VALUES ('2', 'admin2', 'e10adc3949ba59abbe56e057f20f883e', '2', '宿管1号');

-- ----------------------------
-- View structure for view_get_all_building_info
-- ----------------------------
DROP VIEW IF EXISTS `view_get_all_building_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_get_all_building_info` AS select `building`.`id` AS `id`,`building`.`name` AS `name`,`building`.`unit_number` AS `unit_number`,`building`.`dor_number` AS `dor_number`,`building`.`stu_number` AS `stu_number`,`building_info`.`build_year` AS `build_year`,`building_info`.`introduction` AS `introduction`,`building_info`.`picture` AS `picture`,`building_info`.`update_time` AS `update_time`,`building_info`.`floor_number` AS `floor_number`,`user`.`name` AS `man_name`,`user`.`id` AS `man_id` from ((`building` join `building_info`) join `user`) where ((`building`.`id` = `building_info`.`building_id`) and (`user`.`id` = `building`.`manager_id`)) ;

-- ----------------------------
-- View structure for view_get_all_building_manager
-- ----------------------------
DROP VIEW IF EXISTS `view_get_all_building_manager`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_get_all_building_manager` AS select `building`.`id` AS `id`,`building`.`name` AS `name`,`building`.`unit_number` AS `unit_number`,`building`.`dor_number` AS `dor_number`,`building`.`stu_number` AS `stu_number`,`user`.`name` AS `man_name`,`building`.`manager_id` AS `manager_id` from (`building` join `user`) where (`user`.`id` = `building`.`manager_id`) ;
