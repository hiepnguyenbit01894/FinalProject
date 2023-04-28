/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100421
 Source Host           : localhost:3306
 Source Schema         : demo_node_api

 Target Server Type    : MySQL
 Target Server Version : 100421
 File Encoding         : 65001

 Date: 24/04/2023 13:18:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `price` int NULL DEFAULT NULL,
  `quantity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `link_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '0: ẩn, 1: hiện ',
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (6, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Brocolli', 120, '15', 'https://res.cloudinary.com/sivadass/image/upload/v1493620046/dummy-products/broccoli.jpg', NULL, '2023-04-23 10:17:36', '2023-04-23 10:17:36');
INSERT INTO `products` VALUES (7, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Cauliflower', 60, '15', 'https://res.cloudinary.com/sivadass/image/upload/v1493620046/dummy-products/cauliflower.jpg', NULL, '2023-04-23 10:19:01', '2023-04-23 10:19:01');
INSERT INTO `products` VALUES (8, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Cucumber', 48, '15', 'https://res.cloudinary.com/sivadass/image/upload/v1493620046/dummy-products/cucumber.jpg', NULL, '2023-04-23 10:20:21', '2023-04-23 10:20:21');
INSERT INTO `products` VALUES (9, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Beetroot', 32, '15', 'https://res.cloudinary.com/sivadass/image/upload/v1493620045/dummy-products/beetroot.jpg', NULL, '2023-04-23 10:21:09', '2023-04-23 10:21:09');
INSERT INTO `products` VALUES (10, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Carrot', 56, '15', 'https://res.cloudinary.com/sivadass/image/upload/v1493620046/dummy-products/carrots.jpg', NULL, '2023-04-23 10:21:38', '2023-04-23 10:21:38');
INSERT INTO `products` VALUES (11, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Tomato', 16, '15', 'https://res.cloudinary.com/sivadass/image/upload/v1493620045/dummy-products/tomato.jpg', NULL, '2023-04-23 10:22:31', '2023-04-23 10:22:31');
INSERT INTO `products` VALUES (12, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Beans', 82, '15', 'https://res.cloudinary.com/sivadass/image/upload/v1493620045/dummy-products/beans.jpg', NULL, '2023-04-23 10:23:24', '2023-04-23 10:23:24');
INSERT INTO `products` VALUES (13, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Brinjal', 35, '15', 'https://res.cloudinary.com/sivadass/image/upload/v1493620045/dummy-products/brinjal.jpg', NULL, '2023-04-23 10:24:30', '2023-04-23 10:24:30');
INSERT INTO `products` VALUES (14, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Capsicum', 60, '15', 'https://res.cloudinary.com/sivadass/image/upload/v1493620045/dummy-products/capsicum.jpg', NULL, '2023-04-23 10:25:08', '2023-04-23 10:25:08');
INSERT INTO `products` VALUES (15, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Potato', 22, '15', 'https://res.cloudinary.com/sivadass/image/upload/v1493620045/dummy-products/potato.jpg', NULL, '2023-04-23 10:26:33', '2023-04-23 10:26:33');
INSERT INTO `products` VALUES (16, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Pumpkin', 48, '15', 'https://res.cloudinary.com/sivadass/image/upload/v1493620045/dummy-products/pumpkin.jpg', NULL, '2023-04-23 10:27:07', '2023-04-23 10:27:07');
INSERT INTO `products` VALUES (17, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Corn', 75, '15', 'https://res.cloudinary.com/sivadass/image/upload/v1493620045/dummy-products/corn.jpg', NULL, '2023-04-23 10:27:59', '2023-04-23 10:27:59');
INSERT INTO `products` VALUES (18, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Onion', 16, '15', 'https://res.cloudinary.com/sivadass/image/upload/v1493620045/dummy-products/onion.jpg', NULL, '2023-04-23 10:29:34', '2023-04-23 10:29:34');
INSERT INTO `products` VALUES (19, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Apple', 16, '15', 'https://res.cloudinary.com/sivadass/image/upload/v1493620045/dummy-products/apple.jpg', NULL, '2023-04-23 10:29:52', '2023-04-23 10:29:52');
INSERT INTO `products` VALUES (20, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Banana', 45, '15', 'https://res.cloudinary.com/sivadass/image/upload/v1493620045/dummy-products/banana.jpg', NULL, '2023-04-23 10:30:20', '2023-04-23 10:30:20');
INSERT INTO `products` VALUES (21, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Grapes', 60, '15', 'https://res.cloudinary.com/sivadass/image/upload/v1493620045/dummy-products/grapes.jpg', NULL, '2023-04-23 10:31:00', '2023-04-23 10:31:00');
INSERT INTO `products` VALUES (22, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Mango', 75, '15', 'https://res.cloudinary.com/sivadass/image/upload/v1493620045/dummy-products/mango.jpg', NULL, '2023-04-23 10:31:51', '2023-04-23 10:31:51');
INSERT INTO `products` VALUES (23, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Musk Melon', 36, '15', 'https://res.cloudinary.com/sivadass/image/upload/v1493620045/dummy-products/musk-melon.jpg', NULL, '2023-04-23 10:32:36', '2023-04-23 10:32:36');
INSERT INTO `products` VALUES (24, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Orange', 75, '15', 'https://res.cloudinary.com/sivadass/image/upload/v1493620045/dummy-products/orange.jpg', NULL, '2023-04-23 10:33:43', '2023-04-23 10:33:43');
INSERT INTO `products` VALUES (25, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Pears', 69, '15', 'https://res.cloudinary.com/sivadass/image/upload/v1493620045/dummy-products/pears.jpg', NULL, '2023-04-23 10:34:17', '2023-04-23 10:34:17');
INSERT INTO `products` VALUES (26, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Pomegranate', 95, '15', 'https://res.cloudinary.com/sivadass/image/upload/v1493620045/dummy-products/pomegranate.jpg', NULL, '2023-04-23 10:34:48', '2023-04-23 10:34:48');
INSERT INTO `products` VALUES (27, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Raspberry', 160, '15', 'https://res.cloudinary.com/sivadass/image/upload/v1493620045/dummy-products/raspberry.jpg', NULL, '2023-04-23 10:35:10', '2023-04-23 10:35:10');

SET FOREIGN_KEY_CHECKS = 1;
