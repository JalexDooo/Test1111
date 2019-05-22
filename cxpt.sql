/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : cxpt

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 27/12/2018 12:45:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_admin
-- ----------------------------
DROP TABLE IF EXISTS `tbl_admin`;
CREATE TABLE `tbl_admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_admin` int(11) NULL DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type_aliases` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_admin
-- ----------------------------
INSERT INTO `tbl_admin` VALUES (1, 1, 'admin', 'cxptadmin2018', '管理员');

-- ----------------------------
-- Table structure for tbl_compete
-- ----------------------------
DROP TABLE IF EXISTS `tbl_compete`;
CREATE TABLE `tbl_compete`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_compete` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `level_compete` int(11) NOT NULL,
  `cover_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `start_time` datetime(0) NOT NULL,
  `end_time` datetime(0) NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `requirement` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_CP_level`(`level_compete`) USING BTREE,
  CONSTRAINT `FK_CP_level` FOREIGN KEY (`level_compete`) REFERENCES `tbl_levels` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_download_file
-- ----------------------------
DROP TABLE IF EXISTS `tbl_download_file`;
CREATE TABLE `tbl_download_file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_match` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title_work` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `instructor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attachment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `clicks` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_enroll
-- ----------------------------
DROP TABLE IF EXISTS `tbl_enroll`;
CREATE TABLE `tbl_enroll`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compete_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `title_enroll` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instructor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attachment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_compete`(`compete_id`) USING BTREE,
  INDEX `FK_group`(`group_id`) USING BTREE,
  CONSTRAINT `FK_compete` FOREIGN KEY (`compete_id`) REFERENCES `tbl_compete` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_group` FOREIGN KEY (`group_id`) REFERENCES `tbl_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_excellent
-- ----------------------------
DROP TABLE IF EXISTS `tbl_excellent`;
CREATE TABLE `tbl_excellent`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enroll_id` int(11) NULL DEFAULT NULL,
  `year` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `compete_id` int(11) NULL DEFAULT NULL,
  `compete_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `compete_level` int(11) NOT NULL,
  `level_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `prize_id` int(11) NOT NULL,
  `prize_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `members` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instructor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `profession_id` int(11) NULL DEFAULT NULL,
  `profession_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_EX_enroll`(`enroll_id`) USING BTREE,
  INDEX `FK_EX_compete`(`compete_id`) USING BTREE,
  INDEX `FK_EX_prize`(`prize_id`) USING BTREE,
  INDEX `FK_EX_level`(`compete_level`) USING BTREE,
  CONSTRAINT `FK_EX_compete` FOREIGN KEY (`compete_id`) REFERENCES `tbl_compete` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_EX_enroll` FOREIGN KEY (`enroll_id`) REFERENCES `tbl_enroll` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_EX_level` FOREIGN KEY (`compete_level`) REFERENCES `tbl_levels` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_EX_prize` FOREIGN KEY (`prize_id`) REFERENCES `tbl_prize` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 249 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_excellent_member
-- ----------------------------
DROP TABLE IF EXISTS `tbl_excellent_member`;
CREATE TABLE `tbl_excellent_member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `s_type` int(11) NOT NULL,
  `excellent_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_excellent`(`excellent_id`) USING BTREE,
  CONSTRAINT `FK_excellent` FOREIGN KEY (`excellent_id`) REFERENCES `tbl_excellent` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 79 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_flink
-- ----------------------------
DROP TABLE IF EXISTS `tbl_flink`;
CREATE TABLE `tbl_flink`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort_link` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_flink
-- ----------------------------
INSERT INTO `tbl_flink` VALUES (1, '山东科技大学', 'http://www.sdust.edu.cn/', NULL, NULL);
INSERT INTO `tbl_flink` VALUES (2, '山东科技大学图书馆', 'http://lib.sdust.edu.cn/', NULL, NULL);
INSERT INTO `tbl_flink` VALUES (3, '山东科技大学教务处', 'http://jwc.sdust.edu.cn/', NULL, NULL);
INSERT INTO `tbl_flink` VALUES (4, '北极星', 'http://bjx.sdust.edu.cn/', NULL, NULL);

-- ----------------------------
-- Table structure for tbl_good_teacher
-- ----------------------------
DROP TABLE IF EXISTS `tbl_good_teacher`;
CREATE TABLE `tbl_good_teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_teacher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `occupation_call` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `research_direction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `introduce` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `clicks` int(11) NULL DEFAULT NULL,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `scroll_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scroll_show` int(10) UNSIGNED ZEROFILL NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_good_work
-- ----------------------------
DROP TABLE IF EXISTS `tbl_good_work`;
CREATE TABLE `tbl_good_work`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `match_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `item_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cover_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `finish_time` datetime(0) NULL DEFAULT NULL,
  `introduce` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `clicks` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `year` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level_id` int(11) NULL DEFAULT NULL,
  `prize_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_group
-- ----------------------------
DROP TABLE IF EXISTS `tbl_group`;
CREATE TABLE `tbl_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_group` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_levels
-- ----------------------------
DROP TABLE IF EXISTS `tbl_levels`;
CREATE TABLE `tbl_levels`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_levels
-- ----------------------------
INSERT INTO `tbl_levels` VALUES (1, '国家级');
INSERT INTO `tbl_levels` VALUES (2, '省级');
INSERT INTO `tbl_levels` VALUES (3, '校级A类');
INSERT INTO `tbl_levels` VALUES (4, '校级B类');
INSERT INTO `tbl_levels` VALUES (5, '校级C类');

-- ----------------------------
-- Table structure for tbl_match
-- ----------------------------
DROP TABLE IF EXISTS `tbl_match`;
CREATE TABLE `tbl_match`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level_match` int(11) NULL DEFAULT NULL,
  `name_match` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `introduce` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `link_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `clicks` int(11) NULL DEFAULT NULL,
  `priority` int(11) NULL DEFAULT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `end_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_MT_level`(`level_match`) USING BTREE,
  CONSTRAINT `FK_MT_level` FOREIGN KEY (`level_match`) REFERENCES `tbl_levels` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_member
-- ----------------------------
DROP TABLE IF EXISTS `tbl_member`;
CREATE TABLE `tbl_member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sno` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `group_id` int(11) NOT NULL,
  `type_member` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_MM_group`(`group_id`) USING BTREE,
  CONSTRAINT `FK_MM_group` FOREIGN KEY (`group_id`) REFERENCES `tbl_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_news
-- ----------------------------
DROP TABLE IF EXISTS `tbl_news`;
CREATE TABLE `tbl_news`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_news` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `clicks` int(11) NULL DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_news_type
-- ----------------------------
DROP TABLE IF EXISTS `tbl_news_type`;
CREATE TABLE `tbl_news_type`  (
  `id` int(11) NOT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_news_type
-- ----------------------------
INSERT INTO `tbl_news_type` VALUES (1, '通知公告');
INSERT INTO `tbl_news_type` VALUES (2, '政策文件');
INSERT INTO `tbl_news_type` VALUES (3, '常见问题');

-- ----------------------------
-- Table structure for tbl_prize
-- ----------------------------
DROP TABLE IF EXISTS `tbl_prize`;
CREATE TABLE `tbl_prize`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prize_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_prize
-- ----------------------------
INSERT INTO `tbl_prize` VALUES (1, '一等奖');
INSERT INTO `tbl_prize` VALUES (2, '二等奖');
INSERT INTO `tbl_prize` VALUES (3, '三等奖');
INSERT INTO `tbl_prize` VALUES (4, '优秀奖');

-- ----------------------------
-- Table structure for tbl_profession
-- ----------------------------
DROP TABLE IF EXISTS `tbl_profession`;
CREATE TABLE `tbl_profession`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_profession
-- ----------------------------
INSERT INTO `tbl_profession` VALUES (1, '自动化专业');
INSERT INTO `tbl_profession` VALUES (2, '电气专业');

-- ----------------------------
-- Table structure for tbl_scrollimg
-- ----------------------------
DROP TABLE IF EXISTS `tbl_scrollimg`;
CREATE TABLE `tbl_scrollimg`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_show` int(11) NULL DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type_scroll` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_student
-- ----------------------------
DROP TABLE IF EXISTS `tbl_student`;
CREATE TABLE `tbl_student`  (
  `sno` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_student` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `profession_id` int(11) NOT NULL,
  `classno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qq` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `imgurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`sno`) USING BTREE,
  INDEX `FK_ST_profession`(`profession_id`) USING BTREE,
  CONSTRAINT `FK_ST_profession` FOREIGN KEY (`profession_id`) REFERENCES `tbl_profession` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- View structure for vm_excellent
-- ----------------------------
DROP VIEW IF EXISTS `vm_excellent`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vm_excellent` AS select `tbl_excellent`.`id` AS `id`,`tbl_enroll`.`id` AS `enroll_id`,`tbl_group`.`id` AS `group_id`,`tbl_excellent`.`prize_id` AS `prize_id`,`tbl_member`.`sno` AS `sno`,`tbl_member`.`type_member` AS `type_member`,`tbl_group`.`name_group` AS `name_group`,`tbl_excellent`.`prize_name` AS `prize_name`,`tbl_excellent`.`compete_level` AS `compete_level`,`tbl_excellent`.`year` AS `year`,`tbl_excellent`.`profession_id` AS `profession_id` from (((`tbl_excellent` join `tbl_enroll`) join `tbl_group`) join `tbl_member`) where ((`tbl_enroll`.`id` = `tbl_excellent`.`enroll_id`) and (`tbl_group`.`id` = `tbl_enroll`.`group_id`) and (`tbl_member`.`group_id` = `tbl_group`.`id`));

-- ----------------------------
-- View structure for vm_excellent_member
-- ----------------------------
DROP VIEW IF EXISTS `vm_excellent_member`;
CREATE VIEW `vm_excellent_member` AS select `tbl_excellent_member`.`excellent_id` AS `id`,`tbl_excellent_member`.`sno` AS `sno`,`tbl_excellent_member`.`sname` AS `sname`,`tbl_excellent`.`compete_level` AS `compete_level`,`tbl_excellent`.`level_name` AS `level_name`,`tbl_excellent`.`prize_id` AS `prize_id`,`tbl_excellent`.`prize_name` AS `prize_name`,`tbl_excellent`.`year` AS `year`,`tbl_excellent`.`profession_id` AS `profession_id`,`tbl_excellent`.`profession_name` AS `profession_name`,`tbl_excellent`.`title` AS `title`,`tbl_excellent`.`compete_id` AS `compete_id`,`tbl_excellent`.`compete_name` AS `compete_name`,`tbl_excellent`.`members` AS `members`,`tbl_excellent`.`instructor` AS `instructor` from (`tbl_excellent_member` join `tbl_excellent`) where (`tbl_excellent_member`.`excellent_id` = `tbl_excellent`.`id`);

-- ----------------------------
-- View structure for vm_item
-- ----------------------------
DROP VIEW IF EXISTS `vm_item`;
CREATE VIEW `vm_item` AS select `tbl_enroll`.`id` AS `id`,`tbl_compete`.`name_compete` AS `name_compete`,`tbl_group`.`name_group` AS `name_group`,`tbl_enroll`.`title_enroll` AS `title_enroll`,`tbl_enroll`.`status` AS `status`,`tbl_member`.`sno` AS `sno`,`tbl_member`.`type_member` AS `type_member`,`tbl_enroll`.`instructor` AS `instructor`,`tbl_enroll`.`group_id` AS `group_id`,`tbl_enroll`.`compete_id` AS `compete_id`,`tbl_compete`.`level_compete` AS `level_compete`,`tbl_enroll`.`update_time` AS `update_time`,`tbl_enroll`.`attachment` AS `attachment`,`tbl_excellent`.`prize_name` AS `prize_name` from ((((`tbl_enroll` join `tbl_group`) join `tbl_member`) join `tbl_compete`) left join `tbl_excellent` on((`tbl_enroll`.`id` = `tbl_excellent`.`enroll_id`))) where ((`tbl_enroll`.`compete_id` = `tbl_compete`.`id`) and (`tbl_enroll`.`group_id` = `tbl_group`.`id`) and (`tbl_member`.`group_id` = `tbl_group`.`id`));

-- ----------------------------
-- View structure for vw_excellent
-- ----------------------------
DROP VIEW IF EXISTS `vw_excellent`;
CREATE VIEW `vw_excellent` AS select `tbl_excellent`.`id` AS `id`,`tbl_excellent`.`enroll_id` AS `enroll_id`,`tbl_excellent`.`year` AS `year`,`tbl_enroll`.`status` AS `status`,`tbl_excellent`.`compete_level` AS `compete_level`,`tbl_excellent`.`prize_id` AS `prize_id`,`tbl_excellent`.`profession_id` AS `profession_id` from (`tbl_excellent` join `tbl_enroll`) where (`tbl_enroll`.`id` = `tbl_excellent`.`enroll_id`);

-- ----------------------------
-- View structure for vw_item
-- ----------------------------
DROP VIEW IF EXISTS `vw_item`;
CREATE VIEW `vw_item` AS select `tbl_compete`.`name_compete` AS `name_compete`,`tbl_compete`.`level_compete` AS `level_compete`,`tbl_enroll`.`create_time` AS `create_time`,`tbl_enroll`.`update_time` AS `update_time`,`tbl_enroll`.`id` AS `id`,`tbl_enroll`.`compete_id` AS `compete_id`,`tbl_enroll`.`group_id` AS `group_id`,`tbl_enroll`.`status` AS `status`,`tbl_enroll`.`title_enroll` AS `title_enroll`,`tbl_enroll`.`instructor` AS `instructor`,`tbl_group`.`name_group` AS `name_group`,`tbl_enroll`.`attachment` AS `attachment` from ((`tbl_enroll` join `tbl_group`) join `tbl_compete`) where ((`tbl_enroll`.`group_id` = `tbl_group`.`id`) and (`tbl_enroll`.`compete_id` = `tbl_compete`.`id`));

SET FOREIGN_KEY_CHECKS = 1;
