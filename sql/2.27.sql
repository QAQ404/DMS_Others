/*
Navicat MySQL Data Transfer

Source Server         : mydb
Source Server Version : 80026
Source Host           : localhost:3306
Source Database       : dormitory_management_system

Target Server Type    : MYSQL
Target Server Version : 80026
File Encoding         : 65001

Date: 2024-02-28 01:10:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for change_dormitory_application
-- ----------------------------
DROP TABLE IF EXISTS `change_dormitory_application`;
CREATE TABLE `change_dormitory_application` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `stu_id` int DEFAULT NULL COMMENT '学生ID',
  `new_dormitory_id` int DEFAULT NULL COMMENT '新寝室ID',
  `new_stu_id` int DEFAULT NULL COMMENT '被交换学生的Id',
  `new_stu_name` varchar(20) DEFAULT NULL COMMENT '被换学生的姓名',
  `new_stu_study_id` varchar(20) DEFAULT NULL COMMENT '被换学生的学号',
  `state` int DEFAULT NULL COMMENT '状态，2是同意，1是拒绝，0是未处理',
  `create_time` datetime DEFAULT NULL COMMENT '申请时间',
  `update_time` datetime DEFAULT NULL COMMENT '处理时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='申请换寝表';

-- ----------------------------
-- Records of change_dormitory_application
-- ----------------------------
INSERT INTO `change_dormitory_application` VALUES ('1', '8', '2', '-1', null, null, '0', '2024-02-26 16:03:00', null);
