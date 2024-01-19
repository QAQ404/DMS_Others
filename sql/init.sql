/*
Navicat MySQL Data Transfer

Source Server         : mydb
Source Server Version : 80026
Source Host           : localhost:3306
Source Database       : dormitory_management_system

Target Server Type    : MYSQL
Target Server Version : 80026
File Encoding         : 65001

Date: 2024-01-19 09:59:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for building
-- ----------------------------
DROP TABLE IF EXISTS `building`;
CREATE TABLE `building` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '宿舍楼编号',
  `name` varchar(10) DEFAULT NULL COMMENT '宿舍楼名称',
  `manager_id` int DEFAULT NULL COMMENT '宿管编号',
  PRIMARY KEY (`id`),
  KEY `building_manager_user_id_fk` (`manager_id`),
  CONSTRAINT `building_manager_user_id_fk` FOREIGN KEY (`manager_id`) REFERENCES `manager` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='宿舍楼';

-- ----------------------------
-- Records of building
-- ----------------------------

-- ----------------------------
-- Table structure for dormitory
-- ----------------------------
DROP TABLE IF EXISTS `dormitory`;
CREATE TABLE `dormitory` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '寝室编号',
  `building_id` int DEFAULT NULL COMMENT '所属楼栋的编号',
  `name` varchar(10) DEFAULT NULL COMMENT '寝室名称',
  `unit_number` int DEFAULT '1' COMMENT '寝室所在单元号',
  `stu_number` int DEFAULT '0' COMMENT '学生人数',
  `bed_number` int DEFAULT NULL COMMENT '寝室床位数量',
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
  `name` varchar(10) DEFAULT NULL COMMENT '宿管姓名',
  `gender` char(1) DEFAULT '男' COMMENT '性别',
  `phone` varchar(11) DEFAULT NULL COMMENT '宿管电话',
  `picture` varchar(256) DEFAULT NULL COMMENT '宿管照片',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱',
  KEY `manager_user_id_fk` (`user_id`),
  CONSTRAINT `manager_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='宿管信息';

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('1', '系统管理员', '男', null, null, null);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `user_id` int NOT NULL COMMENT '对应的账号编号',
  `name` varchar(10) DEFAULT NULL COMMENT '学生姓名',
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_username_uindex` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='账号管理';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '3');
