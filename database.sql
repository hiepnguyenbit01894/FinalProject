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

 Date: 15/05/2023 10:59:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_UserOrder`(`user_id`) USING BTREE,
  CONSTRAINT `FK_UserOrder` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 1, '2023-05-08 16:10:08', '2023-05-08 16:10:13');
INSERT INTO `orders` VALUES (2, 4, '2023-05-08 16:10:20', '2023-05-08 16:10:23');
INSERT INTO `orders` VALUES (3, 4, '2023-05-08 16:12:25', '2023-05-08 16:12:28');
INSERT INTO `orders` VALUES (4, 5, '2023-05-11 01:28:41', '2023-05-11 01:28:41');
INSERT INTO `orders` VALUES (5, 5, '2023-05-11 01:32:27', '2023-05-11 01:32:27');
INSERT INTO `orders` VALUES (6, 5, '2023-05-15 03:51:54', '2023-05-15 03:51:54');
INSERT INTO `orders` VALUES (7, 5, '2023-05-15 03:53:15', '2023-05-15 03:53:15');
INSERT INTO `orders` VALUES (8, 5, '2023-05-15 03:53:39', '2023-05-15 03:53:39');
INSERT INTO `orders` VALUES (9, 5, '2023-05-15 03:54:13', '2023-05-15 03:54:13');
INSERT INTO `orders` VALUES (10, 5, '2023-05-15 04:19:34', '2023-05-15 04:19:34');
INSERT INTO `orders` VALUES (11, 17, '2023-05-15 10:49:18', '2023-05-15 10:49:18');

-- ----------------------------
-- Table structure for orders_product
-- ----------------------------
DROP TABLE IF EXISTS `orders_product`;
CREATE TABLE `orders_product`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NULL DEFAULT NULL,
  `product_id` int NULL DEFAULT NULL,
  `quantity` int NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Orders`(`order_id`) USING BTREE,
  INDEX `FK_Product`(`product_id`) USING BTREE,
  CONSTRAINT `FK_Orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders_product
-- ----------------------------
INSERT INTO `orders_product` VALUES (1, 1, 6, 5, '2023-05-08 16:09:46', '2023-05-08 16:09:52');
INSERT INTO `orders_product` VALUES (2, 1, 7, 5, '2023-05-08 16:12:03', '2023-05-08 16:13:14');
INSERT INTO `orders_product` VALUES (5, 1, 8, 5, '2023-05-08 16:12:07', '2023-05-08 16:13:17');
INSERT INTO `orders_product` VALUES (8, 2, 9, 4, '2023-05-08 16:12:11', '2023-05-08 16:13:22');
INSERT INTO `orders_product` VALUES (9, 3, 25, 1, '2023-05-08 16:13:02', '2023-05-08 16:13:25');
INSERT INTO `orders_product` VALUES (12, 5, 8, 1, '2023-05-11 01:32:27', '2023-05-11 01:32:27');
INSERT INTO `orders_product` VALUES (13, 5, 9, 2, '2023-05-11 01:32:27', '2023-05-11 01:32:27');
INSERT INTO `orders_product` VALUES (14, 5, 7, 1, '2023-05-11 01:32:27', '2023-05-11 01:32:27');
INSERT INTO `orders_product` VALUES (15, 5, 6, 1, '2023-05-11 01:32:27', '2023-05-11 01:32:27');
INSERT INTO `orders_product` VALUES (16, 6, 8, 3, '2023-05-15 03:51:54', '2023-05-15 03:51:54');
INSERT INTO `orders_product` VALUES (17, 7, 8, 3, '2023-05-15 03:53:15', '2023-05-15 03:53:15');
INSERT INTO `orders_product` VALUES (18, 7, 11, 3, '2023-05-15 03:53:15', '2023-05-15 03:53:15');
INSERT INTO `orders_product` VALUES (19, 7, 9, 3, '2023-05-15 03:53:15', '2023-05-15 03:53:15');
INSERT INTO `orders_product` VALUES (20, 8, 10, 3, '2023-05-15 03:53:39', '2023-05-15 03:53:39');
INSERT INTO `orders_product` VALUES (21, 9, 9, 2, '2023-05-15 03:54:13', '2023-05-15 03:54:13');
INSERT INTO `orders_product` VALUES (22, 10, 8, 3, '2023-05-15 04:19:34', '2023-05-15 04:19:34');
INSERT INTO `orders_product` VALUES (23, 11, 9, 2, '2023-05-15 10:49:18', '2023-05-15 10:49:18');
INSERT INTO `orders_product` VALUES (24, 11, 8, 2, '2023-05-15 10:49:18', '2023-05-15 10:49:18');
INSERT INTO `orders_product` VALUES (25, 11, 7, 2, '2023-05-15 10:49:18', '2023-05-15 10:49:18');

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
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (6, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Brocolli', 120, '13', 'https://res.cloudinary.com/sivadass/image/upload/v1493620046/dummy-products/broccoli.jpg', NULL, '2023-04-23 10:17:36', '2023-04-23 10:17:36');
INSERT INTO `products` VALUES (7, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Cauliflower', 60, '11', 'https://res.cloudinary.com/sivadass/image/upload/v1493620046/dummy-products/cauliflower.jpg', NULL, '2023-04-23 10:19:01', '2023-04-23 10:19:01');
INSERT INTO `products` VALUES (8, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Cucumber', 48, '2', 'https://res.cloudinary.com/sivadass/image/upload/v1493620046/dummy-products/cucumber.jpg', NULL, '2023-04-23 10:20:21', '2023-04-23 10:20:21');
INSERT INTO `products` VALUES (9, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Beetroot', 32, '4', 'https://res.cloudinary.com/sivadass/image/upload/v1493620045/dummy-products/beetroot.jpg', NULL, '2023-04-23 10:21:09', '2023-04-23 10:21:09');
INSERT INTO `products` VALUES (10, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Carrot', 56, '12', 'https://res.cloudinary.com/sivadass/image/upload/v1493620046/dummy-products/carrots.jpg', NULL, '2023-04-23 10:21:38', '2023-04-23 10:21:38');
INSERT INTO `products` VALUES (11, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Tomato', 18, '12', 'https://res.cloudinary.com/sivadass/image/upload/v1493620045/dummy-products/tomato.jpg', NULL, '2023-05-14 10:29:08', '2023-04-23 10:22:31');
INSERT INTO `products` VALUES (12, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Beans', 82, '15', 'https://res.cloudinary.com/sivadass/image/upload/v1493620045/dummy-products/beans.jpg', NULL, '2023-04-23 10:23:24', '2023-04-23 10:23:24');
INSERT INTO `products` VALUES (13, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Brinjial', 45, '15', 'https://res.cloudinary.com/sivadass/image/upload/v1493620046/dummy-products/brinjal.jpg', NULL, '2023-05-14 10:23:31', '2023-04-23 10:24:30');
INSERT INTO `products` VALUES (14, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Capsicum', 60, '15', 'https://res.cloudinary.com/sivadass/image/upload/v1493620045/dummy-products/capsicum.jpg', NULL, '2023-04-23 10:25:08', '2023-04-23 10:25:08');
INSERT INTO `products` VALUES (15, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Potato', 22, '15', 'https://res.cloudinary.com/sivadass/image/upload/v1493620045/dummy-products/potato.jpg', NULL, '2023-04-23 10:26:33', '2023-04-23 10:26:33');
INSERT INTO `products` VALUES (17, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Corn', 75, '15', 'https://res.cloudinary.com/sivadass/image/upload/v1493620045/dummy-products/corn.jpg', NULL, '2023-04-23 10:27:59', '2023-04-23 10:27:59');
INSERT INTO `products` VALUES (18, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Onion', 18, '15', 'https://res.cloudinary.com/sivadass/image/upload/v1493620045/dummy-products/onion.jpg', NULL, '2023-05-14 15:15:58', '2023-04-23 10:29:34');
INSERT INTO `products` VALUES (19, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Apple', 16, '15', 'https://res.cloudinary.com/sivadass/image/upload/v1493620045/dummy-products/apple.jpg', NULL, '2023-05-14 15:19:42', '2023-04-23 10:29:52');
INSERT INTO `products` VALUES (20, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Banana', 45, '15', 'https://res.cloudinary.com/sivadass/image/upload/v1493620045/dummy-products/banana.jpg', NULL, '2023-04-23 10:30:20', '2023-04-23 10:30:20');
INSERT INTO `products` VALUES (21, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Grapes', 60, '15', 'https://res.cloudinary.com/sivadass/image/upload/v1493620045/dummy-products/grapes.jpg', NULL, '2023-04-23 10:31:00', '2023-04-23 10:31:00');
INSERT INTO `products` VALUES (22, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Mango', 75, '15', 'https://res.cloudinary.com/sivadass/image/upload/v1493620045/dummy-products/mango.jpg', NULL, '2023-04-23 10:31:51', '2023-04-23 10:31:51');
INSERT INTO `products` VALUES (23, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Musk Melon', 36, '15', 'https://res.cloudinary.com/sivadass/image/upload/v1493620045/dummy-products/musk-melon.jpg', NULL, '2023-04-23 10:32:36', '2023-04-23 10:32:36');
INSERT INTO `products` VALUES (24, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Orange', 75, '15', 'https://res.cloudinary.com/sivadass/image/upload/v1493620045/dummy-products/orange.jpg', NULL, '2023-04-23 10:33:43', '2023-04-23 10:33:43');
INSERT INTO `products` VALUES (25, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Pears', 69, '15', 'https://res.cloudinary.com/sivadass/image/upload/v1493620045/dummy-products/pears.jpg', NULL, '2023-04-23 10:34:17', '2023-04-23 10:34:17');
INSERT INTO `products` VALUES (26, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Pomegranate', 95, '15', 'https://res.cloudinary.com/sivadass/image/upload/v1493620045/dummy-products/pomegranate.jpg', NULL, '2023-04-23 10:34:48', '2023-04-23 10:34:48');
INSERT INTO `products` VALUES (27, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Raspberry', 160, '15', 'https://res.cloudinary.com/sivadass/image/upload/v1493620045/dummy-products/raspberry.jpg', NULL, '2023-04-23 10:35:10', '2023-04-23 10:35:10');
INSERT INTO `products` VALUES (29, 'Vegetable products contain secondary metabolites with beneficial properties, such as antioxidant, anticancer, or antimicrobial effects. These components, known as bioactive phytochemicals or bioactive compounds, turn fruits, vegetables, and other food der', 'Dragon Fruit', 88, '15', 'https://cdn.shopify.com/s/files/1/0586/7303/7499/products/DragonFruit1pc.jpg?v=1660188898', NULL, '2023-05-14 09:53:04', '2023-05-14 09:53:04');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lastname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, NULL, NULL, 'tuanbui', '1234565', NULL, NULL, NULL, NULL, '2023-05-04 15:40:36', '2023-05-04 15:40:36');
INSERT INTO `users` VALUES (4, NULL, NULL, 'tuanbui123', '$2b$10$LK920/NFOPdkHEf1Z3f3F.2aMzix5g35.Mj2k4KTDrjJWt15Gm7wq', NULL, NULL, NULL, NULL, '2023-05-04 17:22:20', '2023-05-04 17:22:20');
INSERT INTO `users` VALUES (5, 'asdf', 'asdf', 'tranhiep98', '$2b$10$4DxsSc.Xtw.x6ovX/NWRxOmED2IyepvoViaJHZoNbQwHozzRfBE9S', 'asdfa@asdf.com', '0123456789', 'asdfasdf', NULL, '2023-05-11 01:11:10', '2023-05-11 01:11:10');
INSERT INTO `users` VALUES (6, 'asdfasdf', 'asdfasdf', 'tranhiep99', '$2b$10$kDsS.Jd5rcGXNicdUdfQKuNje56QRQLAs8qoMHtRvE9OFro68xxGu', 'asdfasdf@asdc.com', '0456789123456', 'asdfasdf', NULL, '2023-05-11 01:21:08', '2023-05-11 01:21:08');
INSERT INTO `users` VALUES (7, 'asdf', 'asdf', 'tranhiep991', '$2b$10$XoJmvtSixGse.t1UvPt.wuy.yd4hpB.FIUJMHVvqc6e9oavuCiaGG', 'asdfsf@cc.com', '0312654989', 'asdfasdf', NULL, '2023-05-12 20:05:57', '2023-05-12 20:05:57');
INSERT INTO `users` VALUES (8, NULL, NULL, 'tranhiep9710', '$2b$10$2pCwbaC2eBlsKWqoY1MCgOSu5lftgkzdCytawNnkYcIZJFrLswX4S', 'asdfs@asdc.com', NULL, NULL, NULL, '2023-05-12 20:18:27', '2023-05-12 20:18:27');
INSERT INTO `users` VALUES (9, NULL, NULL, 'tranhiep880', '$2b$10$XMTOWSNKc7z1Blih1mqszedMQnMoGT..3xbuKSdyMfdtmqSNbsfX.', 'asdfasdf@dsaf.com', NULL, NULL, NULL, '2023-05-12 20:18:57', '2023-05-12 20:18:57');
INSERT INTO `users` VALUES (10, NULL, NULL, 'tranhiep771', '$2b$10$fn57BRfdNbVItuwAYZ3jjufwX7B9zNIQTTyZ6j0iUEhyiWaLHwwZC', 'asdf@dasc.com', NULL, NULL, NULL, '2023-05-12 20:19:14', '2023-05-12 20:19:14');
INSERT INTO `users` VALUES (11, NULL, NULL, 'tranhiep660', '$2b$10$6fnT2GUrmwKdCZ.DkHP/4uu7D0s.kv5vFFHf1FJnlB04OIJCc9/bK', 'asdf@adf.com', NULL, NULL, NULL, '2023-05-12 20:20:23', '2023-05-12 20:20:23');
INSERT INTO `users` VALUES (12, NULL, NULL, 'tranhiep55', '$2b$10$E9DvQ7JyACPkrAGxrNDYDOiiHo9qCv0l7DWKEDzH4tA4KMRygux7G', 'asd@asdf.com', NULL, NULL, NULL, '2023-05-12 20:23:55', '2023-05-12 20:23:55');
INSERT INTO `users` VALUES (13, NULL, NULL, 'tranhiep110', '$2b$10$wVm3TRuROrCbda26/re03.ObiDQJh7BY1Kc4tOtyzuJUmxfPRWCi2', 'asdf@asdf.com', NULL, NULL, NULL, '2023-05-12 20:25:51', '2023-05-12 20:25:51');
INSERT INTO `users` VALUES (14, NULL, NULL, 'tranhiep444', '$2b$10$ze/YLU2pBcUImqDxFyOFF.rEIVKGpoP9ZKDZAw/I8exRUtKLkdvDu', 'asdf@adsf.com', NULL, NULL, NULL, '2023-05-12 20:33:09', '2023-05-12 20:33:09');
INSERT INTO `users` VALUES (15, NULL, NULL, 'tranhiep22', '$2b$10$scSZqfgW5R1OTnDx/uW5Peha2ejO.GNzcq7CaFAkU5/TLWvTUmhge', 'asd@cc.com', NULL, NULL, NULL, '2023-05-12 20:57:19', '2023-05-12 20:57:19');
INSERT INTO `users` VALUES (16, NULL, NULL, 'tranhiep54', '$2b$10$muD9YM2.qCegoJROdQIEz.yZ1zTkgoqCH40tUDufS2J/MKgoCO87m', 'adsf@ac.com', NULL, NULL, NULL, '2023-05-15 09:55:32', '2023-05-15 09:55:32');
INSERT INTO `users` VALUES (17, 'Hiep', 'nguyen', 'tranhiep09', '$2b$10$fmjXPfS5dSgMmrkA7LQwuentKHkNZjsR8Pl1tsAqYTg72vllFn/W6', 'hipent@gmail.com', '0912345678', 'thanh xuan,ha noi', NULL, '2023-05-15 10:48:42', '2023-05-15 10:48:42');

SET FOREIGN_KEY_CHECKS = 1;
