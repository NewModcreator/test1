/*
 Navicat Premium Dump SQL

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80034 (8.0.34)
 Source Host           : localhost:3306
 Source Schema         : watermanagementsystem

 Target Server Type    : MySQL
 Target Server Version : 80034 (8.0.34)
 File Encoding         : 65001

 Date: 31/12/2024 03:14:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dissolvedoxygendata
-- ----------------------------
DROP TABLE IF EXISTS `dissolvedoxygendata`;
CREATE TABLE `dissolvedoxygendata`  (
  `data_id` int NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `do_value` float NOT NULL,
  `segment_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`data_id`) USING BTREE,
  INDEX `segment_id`(`segment_id` ASC) USING BTREE,
  CONSTRAINT `dissolvedoxygendata_ibfk_1` FOREIGN KEY (`segment_id`) REFERENCES `riversegments` (`segment_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dissolvedoxygendata
-- ----------------------------

-- ----------------------------
-- Table structure for forumposts
-- ----------------------------
DROP TABLE IF EXISTS `forumposts`;
CREATE TABLE `forumposts`  (
  `post_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `segment_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`post_id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `forumposts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forumposts
-- ----------------------------

-- ----------------------------
-- Table structure for phdata
-- ----------------------------
DROP TABLE IF EXISTS `phdata`;
CREATE TABLE `phdata`  (
  `data_id` int NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `ph_value` float NOT NULL,
  `segment_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`data_id`) USING BTREE,
  INDEX `segment_id`(`segment_id` ASC) USING BTREE,
  CONSTRAINT `phdata_ibfk_1` FOREIGN KEY (`segment_id`) REFERENCES `riversegments` (`segment_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of phdata
-- ----------------------------

-- ----------------------------
-- Table structure for riversegments
-- ----------------------------
DROP TABLE IF EXISTS `riversegments`;
CREATE TABLE `riversegments`  (
  `segment_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `length` float NOT NULL,
  `river_manager` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `contact_info` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`segment_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of riversegments
-- ----------------------------

-- ----------------------------
-- Table structure for turbiditydata
-- ----------------------------
DROP TABLE IF EXISTS `turbiditydata`;
CREATE TABLE `turbiditydata`  (
  `data_id` int NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `turbidity` float NOT NULL,
  `segment_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`data_id`) USING BTREE,
  INDEX `segment_id`(`segment_id` ASC) USING BTREE,
  CONSTRAINT `turbiditydata_ibfk_1` FOREIGN KEY (`segment_id`) REFERENCES `riversegments` (`segment_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of turbiditydata
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'superadmin', '123456', '123@qq.com', '12313321313');
INSERT INTO `users` VALUES (2, 'user1', '123456', '111@qq.com', '12312312312');
INSERT INTO `users` VALUES (3, 'user3', '123456', '112@qq.com', '12312312323');

-- ----------------------------
-- Table structure for waterleveldata
-- ----------------------------
DROP TABLE IF EXISTS `waterleveldata`;
CREATE TABLE `waterleveldata`  (
  `data_id` int NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `water_level` float NOT NULL,
  `segment_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`data_id`) USING BTREE,
  INDEX `segment_id`(`segment_id` ASC) USING BTREE,
  CONSTRAINT `waterleveldata_ibfk_1` FOREIGN KEY (`segment_id`) REFERENCES `riversegments` (`segment_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of waterleveldata
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
