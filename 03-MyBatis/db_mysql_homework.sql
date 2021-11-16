/*
 Navicat Premium Data Transfer

 Source Server         : 本地数据库
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : db_mysql_homework

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 16/09/2021 15:29:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `class_no` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `class_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`class_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('1', 'Java班');
INSERT INTO `class` VALUES ('2', '前段班');
INSERT INTO `class` VALUES ('3', '测试班');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `customer_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `customer_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`customer_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('001', '甘道夫');
INSERT INTO `customer` VALUES ('002', '佛罗多');
INSERT INTO `customer` VALUES ('003', '山姆');
INSERT INTO `customer` VALUES ('004', '皮平');
INSERT INTO `customer` VALUES ('005', '梅里');
INSERT INTO `customer` VALUES ('006', '阿拉贡');
INSERT INTO `customer` VALUES ('007', '莱戈拉斯');
INSERT INTO `customer` VALUES ('008', '金雳');
INSERT INTO `customer` VALUES ('009', '博罗米尔');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `employee_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `employee_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`employee_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', '阿沙');
INSERT INTO `employee` VALUES ('2', '页老师');
INSERT INTO `employee` VALUES ('3', '泡酱');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `goods_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `goods_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `goods_price` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('01', '维拉之星光', 1000000.00);
INSERT INTO `goods` VALUES ('02', '至尊魔戒', 99999.00);
INSERT INTO `goods` VALUES ('03', '火之戒', 16888.00);
INSERT INTO `goods` VALUES ('04', '纳西尔圣剑', 66666.00);
INSERT INTO `goods` VALUES ('05', '法杖', 8888.00);
INSERT INTO `goods` VALUES ('06', '白色魔法长袍', 5000.00);
INSERT INTO `goods` VALUES ('07', '精灵斗篷', 3000.00);
INSERT INTO `goods` VALUES ('08', '精灵绳', 4000.00);
INSERT INTO `goods` VALUES ('09', '精灵干粮', 1000.00);
INSERT INTO `goods` VALUES ('10', '刺叮', 8000.00);
INSERT INTO `goods` VALUES ('11', '弓箭', 800.00);
INSERT INTO `goods` VALUES ('12', '长剑', 800.00);
INSERT INTO `goods` VALUES ('13', '短剑', 200.00);
INSERT INTO `goods` VALUES ('14', '斧头', 500.00);
INSERT INTO `goods` VALUES ('15', '盾牌', 500.00);

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `order_detail_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `order_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `goods_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `sum` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`order_id`, `goods_id`, `order_detail_id`) USING BTREE,
  INDEX `order_detail_goods`(`goods_id`) USING BTREE,
  CONSTRAINT `order_detail_goods` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_detail_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES ('00001', '0001', '03', 1, 16888.00);
INSERT INTO `order_detail` VALUES ('00002', '0001', '05', 1, 8888.00);
INSERT INTO `order_detail` VALUES ('00003', '0001', '06', 1, 5000.00);
INSERT INTO `order_detail` VALUES ('00004', '0001', '09', 5, 5000.00);
INSERT INTO `order_detail` VALUES ('00005', '0002', '01', 1, 1000000.00);
INSERT INTO `order_detail` VALUES ('00006', '0002', '02', 1, 99999.00);
INSERT INTO `order_detail` VALUES ('00007', '0002', '07', 1, 3000.00);
INSERT INTO `order_detail` VALUES ('00008', '0002', '08', 1, 4000.00);
INSERT INTO `order_detail` VALUES ('00009', '0002', '09', 10, 10000.00);
INSERT INTO `order_detail` VALUES ('00010', '0002', '10', 1, 8000.00);
INSERT INTO `order_detail` VALUES ('00011', '0003', '07', 1, 3000.00);
INSERT INTO `order_detail` VALUES ('00012', '0003', '08', 1, 4000.00);
INSERT INTO `order_detail` VALUES ('00013', '0003', '09', 20, 20000.00);
INSERT INTO `order_detail` VALUES ('00014', '0003', '13', 1, 200.00);
INSERT INTO `order_detail` VALUES ('00015', '0004', '07', 1, 3000.00);
INSERT INTO `order_detail` VALUES ('00016', '0004', '08', 1, 4000.00);
INSERT INTO `order_detail` VALUES ('00017', '0004', '09', 15, 15000.00);
INSERT INTO `order_detail` VALUES ('00018', '0004', '13', 1, 200.00);
INSERT INTO `order_detail` VALUES ('00019', '0005', '07', 1, 3000.00);
INSERT INTO `order_detail` VALUES ('00020', '0005', '08', 1, 4000.00);
INSERT INTO `order_detail` VALUES ('00021', '0005', '09', 15, 15000.00);
INSERT INTO `order_detail` VALUES ('00022', '0005', '13', 1, 200.00);
INSERT INTO `order_detail` VALUES ('00023', '0006', '04', 1, 66666.00);
INSERT INTO `order_detail` VALUES ('00024', '0006', '07', 1, 3000.00);
INSERT INTO `order_detail` VALUES ('00025', '0006', '09', 10, 10000.00);
INSERT INTO `order_detail` VALUES ('00026', '0007', '07', 1, 3000.00);
INSERT INTO `order_detail` VALUES ('00027', '0007', '09', 5, 5000.00);
INSERT INTO `order_detail` VALUES ('00028', '0007', '11', 1, 800.00);
INSERT INTO `order_detail` VALUES ('00029', '0007', '13', 2, 400.00);
INSERT INTO `order_detail` VALUES ('00030', '0008', '07', 1, 3000.00);
INSERT INTO `order_detail` VALUES ('00031', '0008', '09', 15, 10000.00);
INSERT INTO `order_detail` VALUES ('00032', '0008', '14', 1, 500.00);
INSERT INTO `order_detail` VALUES ('00033', '0009', '07', 1, 3000.00);
INSERT INTO `order_detail` VALUES ('00034', '0009', '09', 10, 10000.00);
INSERT INTO `order_detail` VALUES ('00035', '0009', '12', 1, 800.00);
INSERT INTO `order_detail` VALUES ('00036', '0009', '15', 1, 500.00);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `order_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `employee_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `customer_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `order_time` datetime(0) NOT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `orders_employee`(`employee_id`) USING BTREE,
  INDEX `orders_customer`(`customer_id`) USING BTREE,
  CONSTRAINT `orders_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('0001', '1', '001', '2021-09-13 00:04:11');
INSERT INTO `orders` VALUES ('0002', '1', '002', '2021-09-13 00:13:57');
INSERT INTO `orders` VALUES ('0003', '1', '006', '2021-09-10 00:14:15');
INSERT INTO `orders` VALUES ('0004', '2', '007', '2021-09-13 00:14:29');
INSERT INTO `orders` VALUES ('0005', '2', '008', '2021-09-07 00:14:45');
INSERT INTO `orders` VALUES ('0006', '2', '009', '2021-09-15 00:24:42');
INSERT INTO `orders` VALUES ('0007', '3', '003', '2021-09-13 00:25:09');
INSERT INTO `orders` VALUES ('0008', '3', '004', '2021-09-01 00:25:19');
INSERT INTO `orders` VALUES ('0009', '3', '005', '2021-09-14 00:25:31');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `no` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `class_no` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no`) USING BTREE,
  INDEX `student_class`(`class_no`) USING BTREE,
  CONSTRAINT `student_class` FOREIGN KEY (`class_no`) REFERENCES `class` (`class_no`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1001', '阿沙', '2');
INSERT INTO `student` VALUES ('1002', '页老师', '1');
INSERT INTO `student` VALUES ('1003', '普妈', '1');
INSERT INTO `student` VALUES ('1004', 'Bonze', '1');
INSERT INTO `student` VALUES ('1005', '泡酱', '3');

SET FOREIGN_KEY_CHECKS = 1;
