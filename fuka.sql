/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50550
 Source Host           : 127.0.0.1:3306
 Source Schema         : fuka

 Target Server Type    : MySQL
 Target Server Version : 50550
 File Encoding         : 65001

 Date: 15/01/2020 23:45:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `uname` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `aiguo` int(11) NULL DEFAULT NULL,
  `fuqiang` int(11) NULL DEFAULT NULL,
  `hexie` int(11) NULL DEFAULT NULL,
  `youshan` int(11) NULL DEFAULT NULL,
  `jingye` int(11) NULL DEFAULT NULL,
  `QQ` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (2, 'a14978435', 'garen', 3, 2, 1, 1, 0, '14978435');
INSERT INTO `user` VALUES (7, 'ysy0227062111130', '兔子肉', 1, 2, 1, 1, 0, '1357817937');

SET FOREIGN_KEY_CHECKS = 1;
