/*
Navicat MySQL Data Transfer

Source Server         : mydb
Source Server Version : 80026
Source Host           : localhost:3306
Source Database       : dormitory_management_system

Target Server Type    : MYSQL
Target Server Version : 80026
File Encoding         : 65001

Date: 2024-02-11 08:48:42
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
INSERT INTO `building` VALUES ('1', '1栋', '2', '2', '15', '0');
INSERT INTO `building` VALUES ('2', '2栋', '2', '2', '0', '0');
INSERT INTO `building` VALUES ('3', '3栋', '1', '2', '0', '0');
INSERT INTO `building` VALUES ('4', '4栋', '3', '1', '0', '0');
INSERT INTO `building` VALUES ('5', '5栋', '4', '2', '0', '0');
INSERT INTO `building` VALUES ('6', '6栋', '1', '2', '0', '0');
INSERT INTO `building` VALUES ('7', '7栋', '5', '2', '0', '0');
INSERT INTO `building` VALUES ('8', '8栋', '1', '2', '0', '0');
INSERT INTO `building` VALUES ('9', '9栋', '1', '2', '0', '0');
INSERT INTO `building` VALUES ('10', '10栋', '2', '2', '0', '0');
INSERT INTO `building` VALUES ('11', '11栋', '3', '2', '0', '0');
INSERT INTO `building` VALUES ('12', '友谊学校', '7', '2', '0', '0');
INSERT INTO `building` VALUES ('13', '12栋', '2', '1', '0', '0');
INSERT INTO `building` VALUES ('14', '临时宿舍楼', '1', '999', '1', '0');

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
INSERT INTO `building_info` VALUES ('2', '2024-01-01', null, null, '2024-01-23 14:45:11', '2');
INSERT INTO `building_info` VALUES ('3', '2024-01-01', null, null, '2024-01-21 08:44:28', '1');
INSERT INTO `building_info` VALUES ('4', '2024-02-01', null, null, '2024-01-23 20:09:51', '1');
INSERT INTO `building_info` VALUES ('5', null, null, null, '2024-01-23 20:09:55', '1');
INSERT INTO `building_info` VALUES ('6', null, null, null, '2024-01-21 08:44:28', '1');
INSERT INTO `building_info` VALUES ('7', '2020-01-02', null, null, '2024-01-23 20:09:58', '2');
INSERT INTO `building_info` VALUES ('8', null, null, null, '2024-01-21 08:51:23', '1');
INSERT INTO `building_info` VALUES ('9', null, null, null, '2024-01-21 13:40:00', '1');
INSERT INTO `building_info` VALUES ('10', null, null, null, '2024-01-25 20:31:26', '1');
INSERT INTO `building_info` VALUES ('11', null, null, null, '2024-01-25 20:31:30', '1');
INSERT INTO `building_info` VALUES ('12', '2077-01-01', '小马谷欢迎你', 'https://hzh-biyesheji.oss-cn-beijing.aliyuncs.com/e9b1eb53-8da3-48d0-b554-e3d17eb9dc73.jpg', '2024-01-24 17:58:09', '2');
INSERT INTO `building_info` VALUES ('13', null, null, null, '2024-01-23 14:42:54', '1');
INSERT INTO `building_info` VALUES ('14', null, null, null, '2024-01-25 22:05:46', '999');

-- ----------------------------
-- Table structure for clazz
-- ----------------------------
DROP TABLE IF EXISTS `clazz`;
CREATE TABLE `clazz` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '班级编号',
  `name` int DEFAULT NULL COMMENT '班级号',
  `stu_number` int DEFAULT '0' COMMENT '学生数',
  `major_id` int DEFAULT NULL COMMENT '专业id',
  `entrance_year` int DEFAULT NULL COMMENT '年级',
  PRIMARY KEY (`id`),
  KEY `clazz_major_id_fk` (`major_id`),
  CONSTRAINT `clazz_major_id_fk` FOREIGN KEY (`major_id`) REFERENCES `major` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='班级';

-- ----------------------------
-- Records of clazz
-- ----------------------------
INSERT INTO `clazz` VALUES ('1', '1', '0', '1', '2020');
INSERT INTO `clazz` VALUES ('4', '1', '0', '7', '2020');
INSERT INTO `clazz` VALUES ('5', '2', '0', '1', '2020');
INSERT INTO `clazz` VALUES ('6', '3', '0', '1', '2020');
INSERT INTO `clazz` VALUES ('8', '1', '0', '1', '2021');
INSERT INTO `clazz` VALUES ('9', '5', '0', '1', '2021');
INSERT INTO `clazz` VALUES ('10', '4', '0', '1', '2021');

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='学生寝室';

-- ----------------------------
-- Records of dormitory
-- ----------------------------
INSERT INTO `dormitory` VALUES ('1', '14', '暂未分配寝室', '1', '0', '9999', '2024-02-05 14:15:35', '1', null);
INSERT INTO `dormitory` VALUES ('2', '1', '101', '1', '0', '4', '2024-02-10 22:31:15', '1', 'https://hzh-biyesheji.oss-cn-beijing.aliyuncs.com/4197b720-6085-4389-87d7-cf284430aa7f.jpg');
INSERT INTO `dormitory` VALUES ('7', '1', '102', '1', '0', '4', '2024-01-30 10:36:34', '1', null);
INSERT INTO `dormitory` VALUES ('8', '1', '103', '1', '0', '4', '2024-01-30 10:36:40', '1', null);
INSERT INTO `dormitory` VALUES ('9', '1', '104', '1', '0', '4', '2024-01-30 10:36:46', '1', null);
INSERT INTO `dormitory` VALUES ('10', '1', '105', '1', '0', '4', '2024-01-30 10:36:58', '1', null);
INSERT INTO `dormitory` VALUES ('11', '1', '106', '1', '0', '4', '2024-01-30 10:37:02', '1', null);
INSERT INTO `dormitory` VALUES ('12', '1', '107', '1', '0', '4', '2024-01-30 10:37:06', '1', null);
INSERT INTO `dormitory` VALUES ('13', '1', '108', '1', '0', '4', '2024-01-30 10:37:10', '1', null);
INSERT INTO `dormitory` VALUES ('14', '1', '109', '1', '0', '4', '2024-01-30 10:37:14', '1', null);
INSERT INTO `dormitory` VALUES ('15', '1', '110', '1', '0', '4', '2024-01-30 10:37:20', '1', null);
INSERT INTO `dormitory` VALUES ('16', '1', '201', '1', '0', '4', '2024-01-30 10:37:24', '2', null);
INSERT INTO `dormitory` VALUES ('17', '1', '202', '1', '0', '4', '2024-01-30 10:37:28', '2', null);
INSERT INTO `dormitory` VALUES ('18', '1', '203', '1', '0', '4', '2024-01-30 10:37:32', '2', null);
INSERT INTO `dormitory` VALUES ('19', '1', '204', '1', '0', '4', '2024-01-30 10:37:35', '2', null);
INSERT INTO `dormitory` VALUES ('20', '1', '205', '1', '0', '4', '2024-01-30 10:37:49', '2', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='学院';

-- ----------------------------
-- Records of institute
-- ----------------------------
INSERT INTO `institute` VALUES ('1', '软件学院', '3', '6', '0');
INSERT INTO `institute` VALUES ('3', '土木学院', '0', '0', '0');
INSERT INTO `institute` VALUES ('4', '国际学院', '1', '0', '0');
INSERT INTO `institute` VALUES ('5', '临时学院', '1', '1', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='专业';

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES ('1', '软件工程', '6', '1', '0');
INSERT INTO `major` VALUES ('3', '国际英语', '0', '4', '0');
INSERT INTO `major` VALUES ('5', '人工智能', '0', '1', '0');
INSERT INTO `major` VALUES ('6', '大数据分析', '0', '1', '0');
INSERT INTO `major` VALUES ('7', '暂未分配专业', '1', '5', '0');

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
INSERT INTO `manager` VALUES ('7', '女', null, 'https://hzh-biyesheji.oss-cn-beijing.aliyuncs.com/cc2d9d39-3eff-4d58-abca-0c7c5f6a1566.jpeg', null, '1', '       7');
INSERT INTO `manager` VALUES ('1', '男', '14899234483', null, '1728343784@qq.com', '5', '20240001');
INSERT INTO `manager` VALUES ('2', '男', '12643678456', 'https://hzh-biyesheji.oss-cn-beijing.aliyuncs.com/e09be688-cb00-45fc-a6c4-f88f068f1767.jpg', '3257854357@qq.com', '4', '20240002');
INSERT INTO `manager` VALUES ('3', '男', '110', 'https://hzh-biyesheji.oss-cn-beijing.aliyuncs.com/63487f60-2595-4f32-81f4-530e40c5bf44.jpg', null, '2', '20240003');
INSERT INTO `manager` VALUES ('4', '男', null, null, null, '1', '20240004');
INSERT INTO `manager` VALUES ('5', '男', null, null, null, '1', '20240005');

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
INSERT INTO `student` VALUES ('8', '1', '202001010101', '男', '7', '4', '5', '2020');

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
INSERT INTO `student_info` VALUES ('8', '12356479263', null, '18299336278@qq.com', '我是好学生', '2024-02-06 19:50:48', '汉族', '2002-02-19');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='账号管理';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '3', '系统管理员');
INSERT INTO `user` VALUES ('2', 'admin2', 'e10adc3949ba59abbe56e057f20f883e', '2', '宿管1号');
INSERT INTO `user` VALUES ('3', 'admin3', '8e5439d78706f042cba955f030e949c4', '2', '宿管2号');
INSERT INTO `user` VALUES ('4', 'admin4', 'e10adc3949ba59abbe56e057f20f883e', '2', '宿管3号');
INSERT INTO `user` VALUES ('5', 'admin5', '1545e945d5c3e7d9fa642d0a57fc8432', '2', '宿管4号');
INSERT INTO `user` VALUES ('7', '       7', 'dcd5f50d22ad0afab2af9fb732dd9bbf', '2', 'rb');
INSERT INTO `user` VALUES ('8', '202001010101', 'e10adc3949ba59abbe56e057f20f883e', '1', '张三');

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
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_get_all_studentinfo_list` AS select `user`.`id` AS `id`,`user`.`name` AS `name`,`student`.`study_id` AS `study_id`,`student`.`gender` AS `gender`,`student`.`entrance_year` AS `entrance_year`,`building`.`id` AS `building_id`,`building`.`name` AS `building_name`,`institute`.`id` AS `ins_id`,`institute`.`name` AS `ins_name`,`major`.`id` AS `major_id`,`major`.`name` AS `major_name`,`clazz`.`id` AS `clazz_id`,`clazz`.`name` AS `clazz_name`,`student_info`.`phone` AS `phone`,`student_info`.`picture` AS `picture`,`student_info`.`email` AS `email`,`student_info`.`introduction` AS `introduction`,`student_info`.`update_time` AS `update_time`,`student_info`.`ethnicity` AS `ethnicity`,`dormitory`.`id` AS `dormitory_id`,`dormitory`.`name` AS `dormitory_name`,`dormitory`.`unit_number` AS `unit_number`,`dormitory`.`floor_number` AS `floor_number`,`student_info`.`birthday` AS `birthday` from (((((((`user` join `student`) join `student_info`) join `building`) join `dormitory`) join `institute`) join `major`) join `clazz`) where ((`user`.`id` = `student`.`user_id`) and (`student`.`dormitory_id` = `dormitory`.`id`) and (`dormitory`.`building_id` = `building`.`id`) and (`student`.`clazz_id` = `clazz`.`id`) and (`clazz`.`major_id` = `major`.`id`) and (`major`.`ins_id` = `institute`.`id`)) ;

-- ----------------------------
-- View structure for view_get_all_student_list
-- ----------------------------
DROP VIEW IF EXISTS `view_get_all_student_list`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_get_all_student_list` AS select `user`.`id` AS `id`,`user`.`name` AS `name`,`student`.`study_id` AS `study_id`,`student`.`gender` AS `gender`,`student`.`entrance_year` AS `entrance_year`,`dormitory`.`name` AS `dormitory_name`,`student`.`dormitory_id` AS `dormitory_id`,`dormitory`.`building_id` AS `building_id`,`building`.`name` AS `building_name`,`clazz`.`name` AS `clazz_name`,`clazz`.`id` AS `clazz_id`,`institute`.`id` AS `ins_id`,`institute`.`name` AS `ins_name`,`major`.`id` AS `major_id`,`major`.`name` AS `major_name`,`dormitory`.`unit_number` AS `unit_number`,`dormitory`.`floor_number` AS `floor_number` from ((((((`user` join `student`) join `building`) join `dormitory`) join `clazz`) join `major`) join `institute`) where ((`user`.`id` = `student`.`user_id`) and (`student`.`dormitory_id` = `dormitory`.`id`) and (`dormitory`.`building_id` = `building`.`id`) and (`student`.`clazz_id` = `clazz`.`id`) and (`clazz`.`major_id` = `major`.`id`) and (`major`.`ins_id` = `institute`.`id`)) ;
