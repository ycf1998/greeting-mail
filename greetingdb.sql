/*
 Navicat Premium Data Transfer

 Source Server         : t-money
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : 175.178.102.32:3306
 Source Schema         : greetingdb

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 14/09/2022 23:32:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cutomer_service
-- ----------------------------
DROP TABLE IF EXISTS `cutomer_service`;
CREATE TABLE `cutomer_service`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `person_id` int UNSIGNED NOT NULL,
  `greeting_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for greeting_card
-- ----------------------------
DROP TABLE IF EXISTS `greeting_card`;
CREATE TABLE `greeting_card`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `card_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '卡片名称',
  `card_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '卡片类型（对应前端class名）',
  `card_cron` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'cron表达式',
  `card_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '卡片描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

INSERT INTO `greetingdb`.`greeting_card` (`id`, `card_name`, `card_type`, `card_cron`, `card_desc`) VALUES (1, '上班卡', 'sun-card', '0 0 8 * * ?', '8:00');
INSERT INTO `greetingdb`.`greeting_card` (`id`, `card_name`, `card_type`, `card_cron`, `card_desc`) VALUES (2, '下班卡', 'moon-card', '0 50 17 * * ?', '17:50');

-- ----------------------------
-- Table structure for greeting_log
-- ----------------------------
DROP TABLE IF EXISTS `greeting_log`;
CREATE TABLE `greeting_log`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `greeting_id` int UNSIGNED NOT NULL,
  `greeting_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `greeting_cron` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `result` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `return_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 129 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for greeting_service
-- ----------------------------
DROP TABLE IF EXISTS `greeting_service`;
CREATE TABLE `greeting_service`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `greeting_id` int NOT NULL COMMENT '问候id',
  `service_id` int NOT NULL COMMENT '服务id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账户',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邮箱',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '省份',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '城市',
  `district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '区',
  `district_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '区划代码',
  `open_greeting` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否开启问候',
  `locked` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否封号',
  `greetings_number` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '被问候次数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for person_greeting
-- ----------------------------
DROP TABLE IF EXISTS `person_greeting`;
CREATE TABLE `person_greeting`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `person_id` int NOT NULL COMMENT '用户id',
  `greeting_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '问候任务名',
  `greeting_cron` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '问候计划',
  `greetings_number` int NOT NULL DEFAULT 0 COMMENT '问候次数',
  `open` tinyint(1) NOT NULL DEFAULT 1 COMMENT '开启问候',
  `card_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'sun-card' COMMENT '卡片类型',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for provinces
-- ----------------------------
DROP TABLE IF EXISTS `provinces`;
CREATE TABLE `provinces`  (
  `district_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `city_geocode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `district_geocode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('110100', '北京市', '北京市', '110100', '北京', '110100', '116.405285', '39.904989');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('110101', '北京市', '北京市', '110100', '东城', '110101', '116.418757', '39.917544');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('110102', '北京市', '北京市', '110100', '西城', '110102', '116.366794', '39.915309');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('110105', '北京市', '北京市', '110100', '朝阳', '110105', '116.486409', '39.921489');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('110106', '北京市', '北京市', '110100', '丰台', '110106', '116.286968', '39.863642');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('110107', '北京市', '北京市', '110100', '石景山', '110107', '116.195445', '39.914601');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('110108', '北京市', '北京市', '110100', '海淀', '110108', '116.310316', '39.956074');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('110109', '北京市', '北京市', '110100', '门头沟', '110109', '116.105381', '39.937183');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('110111', '北京市', '北京市', '110100', '房山', '110111', '116.139157', '39.735535');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('110112', '北京市', '北京市', '110100', '通州', '110112', '116.658603', '39.902486');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('110113', '北京市', '北京市', '110100', '顺义', '110113', '116.653525', '40.128936');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('110114', '北京市', '北京市', '110100', '昌平', '110114', '116.235906', '40.218085');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('110115', '北京市', '北京市', '110100', '大兴', '110115', '116.338033', '39.728908');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('110116', '北京市', '北京市', '110100', '怀柔', '110116', '116.637122', '40.324272');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('110117', '北京市', '北京市', '110100', '平谷', '110117', '117.112335', '40.144783');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('110118', '北京市', '北京市', '110100', '密云', '110118', '116.843352', '40.377362');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('110119', '北京市', '北京市', '110100', '延庆', '110119', '115.985006', '40.465325');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('120100', '天津市', '天津市', '120100', '天津', '120100', '117.190182', '39.125596');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('120101', '天津市', '天津市', '120100', '和平区', '120101', '117.195907', '39.118327');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('120102', '天津市', '天津市', '120100', '河东区', '120102', '117.226568', '39.122125');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('120103', '天津市', '天津市', '120100', '河西区', '120103', '117.217536', '39.101897');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('120104', '天津市', '天津市', '120100', '南开区', '120104', '117.164143', '39.120474');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('120105', '天津市', '天津市', '120100', '河北区', '120105', '117.201569', '39.156632');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('120106', '天津市', '天津市', '120100', '红桥区', '120106', '117.163301', '39.175066');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('120110', '天津市', '天津市', '120100', '东丽区', '120110', '117.313967', '39.087764');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('120111', '天津市', '天津市', '120100', '西青区', '120111', '117.012247', '39.139446');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('120112', '天津市', '天津市', '120100', '津南区', '120112', '117.382549', '38.989577');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('120113', '天津市', '天津市', '120100', '北辰区', '120113', '117.13482', '39.225555');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('120114', '天津市', '天津市', '120100', '武清区', '120114', '117.057959', '39.376925');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('120115', '天津市', '天津市', '120100', '宝坻区', '120115', '117.308094', '39.716965');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('120116', '天津市', '天津市', '120100', '滨海新区', '120116', '117.654173', '39.032846');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('120117', '天津市', '天津市', '120100', '宁河区', '120117', '117.82828', '39.328886');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('120118', '天津市', '天津市', '120100', '静海区', '120118', '116.925304', '38.935671');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('120119', '天津市', '天津市', '120100', '蓟州区', '120119', '117.407449', '40.045342');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130100', '河北省', '石家庄市', '130100', '石家庄', '130100', '114.502461', '38.045474');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130102', '河北省', '石家庄市', '130100', '长安区', '130102', '114.548151', '38.047501');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130104', '河北省', '石家庄市', '130100', '桥西区', '130104', '114.462931', '38.028383');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130105', '河北省', '石家庄市', '130100', '新华区', '130105', '114.465974', '38.067142');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130107', '河北省', '石家庄市', '130100', '井陉矿区', '130107', '114.058178', '38.069748');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130108', '河北省', '石家庄市', '130100', '裕华', '130108', '114.533257', '38.027696');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130109', '河北省', '石家庄市', '130100', '藁城', '130109', '114.849647', '38.033767');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130110', '河北省', '石家庄市', '130100', '鹿泉', '130110', '114.321023', '38.093994');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130111', '河北省', '石家庄市', '130100', '栾城', '130111', '114.654281', '37.886911');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130121', '河北省', '石家庄市', '130100', '井陉', '130121', '114.144488', '38.033614');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130123', '河北省', '石家庄市', '130100', '正定', '130123', '114.569887', '38.147835');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130125', '河北省', '石家庄市', '130100', '行唐', '130125', '114.552734', '38.437422');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130126', '河北省', '石家庄市', '130100', '灵寿', '130126', '114.37946', '38.306546');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130127', '河北省', '石家庄市', '130100', '高邑', '130127', '114.610699', '37.605714');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130128', '河北省', '石家庄市', '130100', '深泽', '130128', '115.200207', '38.18454');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130129', '河北省', '石家庄市', '130100', '赞皇', '130129', '114.387756', '37.660199');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130130', '河北省', '石家庄市', '130100', '无极', '130130', '114.977845', '38.176376');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130131', '河北省', '石家庄市', '130100', '平山', '130131', '114.184144', '38.259311');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130132', '河北省', '石家庄市', '130100', '元氏', '130132', '114.52618', '37.762514');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130133', '河北省', '石家庄市', '130100', '赵县', '130133', '114.775362', '37.754341');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130181', '河北省', '石家庄市', '130100', '辛集', '130181', '115.217451', '37.92904');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130183', '河北省', '石家庄市', '130100', '晋州', '130183', '115.044886', '38.027478');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130184', '河北省', '石家庄市', '130100', '新乐', '130184', '114.68578', '38.344768');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130200', '河北省', '唐山市', '130200', '唐山', '130200', '118.175393', '39.635113');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130202', '河北省', '唐山市', '130200', '路南区', '130202', '118.210821', '39.615162');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130203', '河北省', '唐山市', '130200', '路北区', '130203', '118.174736', '39.628538');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130204', '河北省', '唐山市', '130200', '古冶', '130204', '118.45429', '39.715736');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130205', '河北省', '唐山市', '130200', '开平区', '130205', '118.264425', '39.676171');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130207', '河北省', '唐山市', '130200', '丰南', '130207', '118.110793', '39.56303');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130208', '河北省', '唐山市', '130200', '丰润', '130208', '118.155779', '39.831363');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130209', '河北省', '唐山市', '130200', '曹妃甸', '130209', '118.446585', '39.278277');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130224', '河北省', '唐山市', '130200', '滦南', '130224', '118.681552', '39.506201');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130225', '河北省', '唐山市', '130200', '乐亭', '130225', '118.905341', '39.42813');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130227', '河北省', '唐山市', '130200', '迁西', '130227', '118.305139', '40.146238');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130229', '河北省', '唐山市', '130200', '玉田', '130229', '117.753665', '39.887323');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130281', '河北省', '唐山市', '130200', '遵化', '130281', '117.965875', '40.188616');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130283', '河北省', '唐山市', '130200', '迁安', '130283', '118.701933', '40.012108');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130284', '河北省', '唐山市', '130200', '滦州', '130284', '118.71048', '39.747116');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130300', '河北省', '秦皇岛市', '130300', '秦皇岛', '130300', '119.586579', '39.942531');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130302', '河北省', '秦皇岛市', '130300', '海港区', '130302', '119.596224', '39.943458');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130303', '河北省', '秦皇岛市', '130300', '山海关', '130303', '119.753591', '39.998023');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130304', '河北省', '秦皇岛市', '130300', '北戴河', '130304', '119.486286', '39.825121');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130306', '河北省', '秦皇岛市', '130300', '抚宁', '130306', '119.240651', '39.887053');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130321', '河北省', '秦皇岛市', '130300', '青龙', '130321', '118.954555', '40.406023');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130322', '河北省', '秦皇岛市', '130300', '昌黎', '130322', '119.164541', '39.709729');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130324', '河北省', '秦皇岛市', '130300', '卢龙', '130324', '118.881809', '39.891639');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130400', '河北省', '邯郸市', '130400', '邯郸', '130400', '114.490686', '36.612273');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130402', '河北省', '邯郸市', '130400', '邯山区', '130402', '114.484989', '36.603196');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130403', '河北省', '邯郸市', '130400', '丛台区', '130403', '114.494703', '36.611082');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130404', '河北省', '邯郸市', '130400', '复兴区', '130404', '114.458242', '36.615484');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130406', '河北省', '邯郸市', '130400', '峰峰', '130406', '114.209936', '36.420487');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130407', '河北省', '邯郸市', '130400', '肥乡', '130407', '114.805154', '36.555778');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130408', '河北省', '邯郸市', '130400', '永年', '130408', '114.496162', '36.776413');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130423', '河北省', '邯郸市', '130400', '临漳', '130423', '114.610703', '36.337604');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130424', '河北省', '邯郸市', '130400', '成安', '130424', '114.680356', '36.443832');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130425', '河北省', '邯郸市', '130400', '大名', '130425', '115.152586', '36.283316');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130426', '河北省', '邯郸市', '130400', '涉县', '130426', '113.673297', '36.563143');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130427', '河北省', '邯郸市', '130400', '磁县', '130427', '114.38208', '36.367673');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130430', '河北省', '邯郸市', '130400', '邱县', '130430', '115.168584', '36.81325');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130431', '河北省', '邯郸市', '130400', '鸡泽', '130431', '114.878517', '36.914908');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130432', '河北省', '邯郸市', '130400', '广平', '130432', '114.950859', '36.483603');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130433', '河北省', '邯郸市', '130400', '馆陶', '130433', '115.289057', '36.539461');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130434', '河北省', '邯郸市', '130400', '魏县', '130434', '114.93411', '36.354248');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130435', '河北省', '邯郸市', '130400', '曲周', '130435', '114.957588', '36.773398');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130481', '河北省', '邯郸市', '130400', '武安', '130481', '114.194581', '36.696115');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130500', '河北省', '邢台市', '130500', '邢台', '130500', '114.561132', '37.05073');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130502', '河北省', '邢台市', '130500', '桥东区', '130502', '114.507131', '37.064125');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130503', '河北省', '邢台市', '130500', '桥西区', '130503', '114.473687', '37.068009');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130521', '河北省', '邢台市', '130500', '邢台县', '130521', '114.143411', '37.177109');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130522', '河北省', '邢台市', '130500', '临城', '130522', '114.506873', '37.444009');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130523', '河北省', '邢台市', '130500', '内丘', '130523', '114.511523', '37.287663');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130524', '河北省', '邢台市', '130500', '柏乡', '130524', '114.693382', '37.483596');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130525', '河北省', '邢台市', '130500', '隆尧', '130525', '114.776348', '37.350925');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130526', '河北省', '邢台市', '130500', '任县', '130526', '114.684469', '37.129952');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130527', '河北省', '邢台市', '130500', '南和', '130527', '114.691377', '37.003812');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130528', '河北省', '邢台市', '130500', '宁晋', '130528', '114.921027', '37.618956');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130529', '河北省', '邢台市', '130500', '巨鹿', '130529', '115.038782', '37.21768');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130530', '河北省', '邢台市', '130500', '新河', '130530', '115.247537', '37.526216');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130531', '河北省', '邢台市', '130500', '广宗', '130531', '115.142797', '37.075548');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130532', '河北省', '邢台市', '130500', '平乡', '130532', '115.029218', '37.069404');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130533', '河北省', '邢台市', '130500', '威县', '130533', '115.272749', '36.983272');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130534', '河北省', '邢台市', '130500', '清河', '130534', '115.668999', '37.059991');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130535', '河北省', '邢台市', '130500', '临西', '130535', '115.498684', '36.8642');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130581', '河北省', '邢台市', '130500', '南宫', '130581', '115.398102', '37.359668');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130582', '河北省', '邢台市', '130500', '沙河', '130582', '114.504902', '36.861903');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130600', '河北省', '保定市', '130600', '保定', '130600', '115.482331', '38.867657');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130602', '河北省', '保定市', '130600', '竞秀', '130602', '115.470659', '38.88662');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130606', '河北省', '保定市', '130600', '莲池', '130606', '115.500934', '38.865005');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130607', '河北省', '保定市', '130600', '满城', '130607', '115.32442', '38.95138');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130608', '河北省', '保定市', '130600', '清苑', '130608', '115.492221', '38.771012');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130609', '河北省', '保定市', '130600', '徐水', '130609', '115.64941', '39.020395');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130623', '河北省', '保定市', '130600', '涞水', '130623', '115.711985', '39.393148');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130624', '河北省', '保定市', '130600', '阜平', '130624', '114.198801', '38.847276');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130626', '河北省', '保定市', '130600', '定兴', '130626', '115.796895', '39.266195');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130627', '河北省', '保定市', '130600', '唐县', '130627', '114.981241', '38.748542');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130628', '河北省', '保定市', '130600', '高阳', '130628', '115.778878', '38.690092');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130629', '河北省', '保定市', '130600', '容城', '130629', '115.866247', '39.05282');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130630', '河北省', '保定市', '130600', '涞源', '130630', '114.692567', '39.35755');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130631', '河北省', '保定市', '130600', '望都', '130631', '115.154009', '38.707448');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130632', '河北省', '保定市', '130600', '安新', '130632', '115.931979', '38.929912');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130633', '河北省', '保定市', '130600', '易县', '130633', '115.501146', '39.35297');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130634', '河北省', '保定市', '130600', '曲阳', '130634', '114.704055', '38.619992');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130635', '河北省', '保定市', '130600', '蠡县', '130635', '115.583631', '38.496429');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130636', '河北省', '保定市', '130600', '顺平', '130636', '115.132749', '38.845127');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130637', '河北省', '保定市', '130600', '博野', '130637', '115.461798', '38.458271');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130638', '河北省', '保定市', '130600', '雄县', '130638', '116.107474', '38.990819');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130681', '河北省', '保定市', '130600', '涿州', '130681', '115.973409', '39.485765');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130682', '河北省', '保定市', '130600', '定州', '130682', '114.991389', '38.517602');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130683', '河北省', '保定市', '130600', '安国', '130683', '115.33141', '38.421367');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130684', '河北省', '保定市', '130600', '高碑店', '130684', '115.882704', '39.327689');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130700', '河北省', '张家口市', '130700', '张家口', '130700', '114.884091', '40.811901');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130702', '河北省', '张家口市', '130700', '桥东区', '130702', '114.885658', '40.813875');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130703', '河北省', '张家口市', '130700', '桥西区', '130703', '114.882127', '40.824385');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130705', '河北省', '张家口市', '130700', '宣化', '130705', '115.0632', '40.609368');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130706', '河北省', '张家口市', '130700', '下花园', '130706', '115.281002', '40.488645');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130708', '河北省', '张家口市', '130700', '万全', '130708', '114.736131', '40.765136');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130709', '河北省', '张家口市', '130700', '崇礼', '130709', '115.281652', '40.971302');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130722', '河北省', '张家口市', '130700', '张北', '130722', '114.715951', '41.151713');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130723', '河北省', '张家口市', '130700', '康保', '130723', '114.615809', '41.850046');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130724', '河北省', '张家口市', '130700', '沽源', '130724', '115.684836', '41.667419');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130725', '河北省', '张家口市', '130700', '尚义', '130725', '113.977713', '41.080091');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130726', '河北省', '张家口市', '130700', '蔚县', '130726', '114.582695', '39.837181');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130727', '河北省', '张家口市', '130700', '阳原', '130727', '114.167343', '40.113419');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130728', '河北省', '张家口市', '130700', '怀安', '130728', '114.422364', '40.671274');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130730', '河北省', '张家口市', '130700', '怀来', '130730', '115.520846', '40.405405');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130731', '河北省', '张家口市', '130700', '涿鹿', '130731', '115.219246', '40.378701');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130732', '河北省', '张家口市', '130700', '赤城', '130732', '115.832708', '40.912081');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130800', '河北省', '承德市', '130800', '承德', '130800', '117.939152', '40.976204');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130802', '河北省', '承德市', '130800', '双桥', '130802', '117.939152', '40.976204');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130803', '河北省', '承德市', '130800', '双滦', '130803', '117.797485', '40.959756');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130804', '河北省', '承德市', '130800', '鹰手营子', '130804', '117.661154', '40.546956');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130821', '河北省', '承德市', '130800', '承德县', '130821', '118.172496', '40.768637');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130822', '河北省', '承德市', '130800', '兴隆', '130822', '117.507098', '40.418525');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130824', '河北省', '承德市', '130800', '滦平', '130824', '117.337124', '40.936644');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130825', '河北省', '承德市', '130800', '隆化', '130825', '117.736343', '41.316667');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130826', '河北省', '承德市', '130800', '丰宁', '130826', '116.65121', '41.209903');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130827', '河北省', '承德市', '130800', '宽城', '130827', '118.488642', '40.607981');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130828', '河北省', '承德市', '130800', '围场', '130828', '117.764086', '41.949404');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130881', '河北省', '承德市', '130800', '平泉', '130881', '118.690238', '41.00561');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130900', '河北省', '沧州市', '130900', '沧州', '130900', '116.857461', '38.310582');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130902', '河北省', '沧州市', '130900', '新华区', '130902', '116.873049', '38.308273');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130903', '河北省', '沧州市', '130900', '运河', '130903', '116.840063', '38.307405');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130921', '河北省', '沧州市', '130900', '沧县', '130921', '117.007478', '38.219856');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130922', '河北省', '沧州市', '130900', '青县', '130922', '116.838384', '38.569646');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130923', '河北省', '沧州市', '130900', '东光', '130923', '116.542062', '37.88655');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130924', '河北省', '沧州市', '130900', '海兴', '130924', '117.496606', '38.141582');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130925', '河北省', '沧州市', '130900', '盐山', '130925', '117.229814', '38.056141');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130926', '河北省', '沧州市', '130900', '肃宁', '130926', '115.835856', '38.427102');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130927', '河北省', '沧州市', '130900', '南皮', '130927', '116.709171', '38.042439');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130928', '河北省', '沧州市', '130900', '吴桥', '130928', '116.391512', '37.628182');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130929', '河北省', '沧州市', '130900', '献县', '130929', '116.123844', '38.189661');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130930', '河北省', '沧州市', '130900', '孟村', '130930', '117.105104', '38.057953');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130981', '河北省', '沧州市', '130900', '泊头', '130981', '116.570163', '38.073479');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130982', '河北省', '沧州市', '130900', '任丘', '130982', '116.106764', '38.706513');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130983', '河北省', '沧州市', '130900', '黄骅', '130983', '117.343803', '38.369238');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('130984', '河北省', '沧州市', '130900', '河间', '130984', '116.089452', '38.44149');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('131000', '河北省', '廊坊市', '131000', '廊坊', '131000', '116.704441', '39.523927');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('131002', '河北省', '廊坊市', '131000', '安次', '131002', '116.694544', '39.502569');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('131003', '河北省', '廊坊市', '131000', '广阳', '131003', '116.713708', '39.521931');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('131022', '河北省', '廊坊市', '131000', '固安', '131022', '116.299894', '39.436468');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('131023', '河北省', '廊坊市', '131000', '永清', '131023', '116.498089', '39.319717');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('131024', '河北省', '廊坊市', '131000', '香河', '131024', '117.007161', '39.757212');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('131025', '河北省', '廊坊市', '131000', '大城', '131025', '116.640735', '38.699215');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('131026', '河北省', '廊坊市', '131000', '文安', '131026', '116.460107', '38.866801');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('131028', '河北省', '廊坊市', '131000', '大厂', '131028', '116.986501', '39.889266');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('131081', '河北省', '廊坊市', '131000', '霸州', '131081', '116.392021', '39.117331');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('131082', '河北省', '廊坊市', '131000', '三河', '131082', '117.077018', '39.982778');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('131100', '河北省', '衡水市', '131100', '衡水', '131100', '115.665993', '37.735097');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('131102', '河北省', '衡水市', '131100', '桃城', '131102', '115.694945', '37.732237');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('131103', '河北省', '衡水市', '131100', '冀州', '131103', '115.579173', '37.542788');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('131121', '河北省', '衡水市', '131100', '枣强', '131121', '115.726499', '37.511512');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('131122', '河北省', '衡水市', '131100', '武邑', '131122', '115.892415', '37.803774');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('131123', '河北省', '衡水市', '131100', '武强', '131123', '115.970236', '38.03698');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('131124', '河北省', '衡水市', '131100', '饶阳', '131124', '115.726577', '38.232671');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('131125', '河北省', '衡水市', '131100', '安平', '131125', '115.519627', '38.233511');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('131126', '河北省', '衡水市', '131100', '故城', '131126', '115.966747', '37.350981');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('131127', '河北省', '衡水市', '131100', '景县', '131127', '116.258446', '37.686622');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('131128', '河北省', '衡水市', '131100', '阜城', '131128', '116.164727', '37.869945');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('131182', '河北省', '衡水市', '131100', '深州', '131182', '115.554596', '38.00347');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140100', '山西省', '太原市', '140100', '太原', '140100', '112.549248', '37.857014');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140105', '山西省', '太原市', '140100', '小店', '140105', '112.564273', '37.817974');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140106', '山西省', '太原市', '140100', '迎泽', '140106', '112.558851', '37.855804');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140107', '山西省', '太原市', '140100', '杏花岭', '140107', '112.560743', '37.879291');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140108', '山西省', '太原市', '140100', '尖草坪', '140108', '112.487122', '37.939893');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140109', '山西省', '太原市', '140100', '万柏林', '140109', '112.522258', '37.862653');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140110', '山西省', '太原市', '140100', '晋源', '140110', '112.477849', '37.715619');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140121', '山西省', '太原市', '140100', '清徐', '140121', '112.357961', '37.60729');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140122', '山西省', '太原市', '140100', '阳曲', '140122', '112.673818', '38.058797');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140123', '山西省', '太原市', '140100', '娄烦', '140123', '111.793798', '38.066035');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140181', '山西省', '太原市', '140100', '古交', '140181', '112.174353', '37.908534');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140200', '山西省', '大同市', '140200', '大同', '140200', '113.301438', '40.090511');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140212', '山西省', '大同市', '140200', '新荣', '140212', '113.141044', '40.258269');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140213', '山西省', '大同市', '140200', '平城', '140213', '113.304425', '40.081998');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140214', '山西省', '大同市', '140200', '云冈', '140214', '113.162402', '39.996839');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140215', '山西省', '大同市', '140200', '云州', '140215', '113.618471', '40.04623');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140221', '山西省', '大同市', '140200', '阳高', '140221', '113.749871', '40.364927');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140222', '山西省', '大同市', '140200', '天镇', '140222', '114.09112', '40.421336');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140223', '山西省', '大同市', '140200', '广灵', '140223', '114.279252', '39.763051');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140224', '山西省', '大同市', '140200', '灵丘', '140224', '114.23576', '39.438867');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140225', '山西省', '大同市', '140200', '浑源', '140225', '113.698091', '39.699099');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140226', '山西省', '大同市', '140200', '左云', '140226', '112.70641', '40.012873');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140300', '山西省', '阳泉市', '140300', '阳泉', '140300', '113.583285', '37.861188');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140302', '山西省', '阳泉市', '140300', '城区', '140302', '113.583285', '37.861188');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140303', '山西省', '阳泉市', '140300', '矿区', '140303', '113.559066', '37.870085');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140311', '山西省', '阳泉市', '140300', '郊区', '140311', '113.58664', '37.94096');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140321', '山西省', '阳泉市', '140300', '平定', '140321', '113.631049', '37.800289');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140322', '山西省', '阳泉市', '140300', '盂县', '140322', '113.41223', '38.086131');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140400', '山西省', '长治市', '140400', '长治', '140400', '113.113556', '36.191112');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140403', '山西省', '长治市', '140400', '潞州', '140403', '113.129521', '36.209472');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140404', '山西省', '长治市', '140400', '上党', '140404', '113.057416', '36.059287');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140405', '山西省', '长治市', '140400', '屯留', '140405', '112.892741', '36.314072');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140406', '山西省', '长治市', '140400', '潞城', '140406', '113.223245', '36.332233');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140423', '山西省', '长治市', '140400', '襄垣', '140423', '113.050094', '36.532854');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140425', '山西省', '长治市', '140400', '平顺', '140425', '113.438791', '36.200202');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140426', '山西省', '长治市', '140400', '黎城', '140426', '113.387366', '36.502971');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140427', '山西省', '长治市', '140400', '壶关', '140427', '113.206138', '36.110938');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140428', '山西省', '长治市', '140400', '长子', '140428', '112.884656', '36.119484');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140429', '山西省', '长治市', '140400', '武乡', '140429', '112.8653', '36.834315');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140430', '山西省', '长治市', '140400', '沁县', '140430', '112.70138', '36.757123');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140431', '山西省', '长治市', '140400', '沁源', '140431', '112.340878', '36.500777');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140500', '山西省', '晋城市', '140500', '晋城', '140500', '112.851274', '35.497553');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140502', '山西省', '晋城市', '140500', '城区', '140502', '112.8514', '35.4976');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140521', '山西省', '晋城市', '140500', '沁水', '140521', '112.187213', '35.689472');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140522', '山西省', '晋城市', '140500', '阳城', '140522', '112.422014', '35.482177');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140524', '山西省', '晋城市', '140500', '陵川', '140524', '113.278877', '35.775614');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140525', '山西省', '晋城市', '140500', '泽州', '140525', '112.899137', '35.617221');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140581', '山西省', '晋城市', '140500', '高平', '140581', '112.930691', '35.791355');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140600', '山西省', '朔州市', '140600', '朔州', '140600', '112.433387', '39.331261');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140602', '山西省', '朔州市', '140600', '朔城', '140602', '112.428676', '39.324525');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140603', '山西省', '朔州市', '140600', '平鲁', '140603', '112.295227', '39.515603');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140621', '山西省', '朔州市', '140600', '山阴', '140621', '112.816396', '39.52677');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140622', '山西省', '朔州市', '140600', '应县', '140622', '113.187505', '39.559187');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140623', '山西省', '朔州市', '140600', '右玉', '140623', '112.465588', '39.988812');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140681', '山西省', '朔州市', '140600', '怀仁', '140681', '113.100512', '39.82079');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140700', '山西省', '晋中市', '140700', '晋中', '140700', '112.736465', '37.696495');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140702', '山西省', '晋中市', '140700', '榆次', '140702', '112.740056', '37.6976');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140721', '山西省', '晋中市', '140700', '榆社', '140721', '112.973521', '37.069019');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140722', '山西省', '晋中市', '140700', '左权', '140722', '113.377834', '37.079672');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140723', '山西省', '晋中市', '140700', '和顺', '140723', '113.572919', '37.327027');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140724', '山西省', '晋中市', '140700', '昔阳', '140724', '113.706166', '37.60437');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140725', '山西省', '晋中市', '140700', '寿阳', '140725', '113.177708', '37.891136');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140726', '山西省', '晋中市', '140700', '太谷', '140726', '112.554103', '37.424595');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140727', '山西省', '晋中市', '140700', '祁县', '140727', '112.330532', '37.358739');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140728', '山西省', '晋中市', '140700', '平遥', '140728', '112.174059', '37.195474');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140729', '山西省', '晋中市', '140700', '灵石', '140729', '111.772759', '36.847469');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140781', '山西省', '晋中市', '140700', '介休', '140781', '111.913857', '37.027616');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140800', '山西省', '运城市', '140800', '运城', '140800', '111.003957', '35.022778');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140802', '山西省', '运城市', '140800', '盐湖', '140802', '111.000627', '35.025643');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140821', '山西省', '运城市', '140800', '临猗', '140821', '110.77493', '35.141883');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140822', '山西省', '运城市', '140800', '万荣', '140822', '110.843561', '35.417042');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140823', '山西省', '运城市', '140800', '闻喜', '140823', '111.220306', '35.353839');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140824', '山西省', '运城市', '140800', '稷山', '140824', '110.978996', '35.600412');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140825', '山西省', '运城市', '140800', '新绛', '140825', '111.225205', '35.613697');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140826', '山西省', '运城市', '140800', '绛县', '140826', '111.576182', '35.49045');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140827', '山西省', '运城市', '140800', '垣曲', '140827', '111.67099', '35.298293');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140828', '山西省', '运城市', '140800', '夏县', '140828', '111.223174', '35.140441');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140829', '山西省', '运城市', '140800', '平陆', '140829', '111.212377', '34.837256');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140830', '山西省', '运城市', '140800', '芮城', '140830', '110.69114', '34.694769');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140881', '山西省', '运城市', '140800', '永济', '140881', '110.447984', '34.865125');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140882', '山西省', '运城市', '140800', '河津', '140882', '110.710268', '35.59715');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140900', '山西省', '忻州市', '140900', '忻州', '140900', '112.733538', '38.41769');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140902', '山西省', '忻州市', '140900', '忻府', '140902', '112.734112', '38.417743');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140921', '山西省', '忻州市', '140900', '定襄', '140921', '112.963231', '38.484948');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140922', '山西省', '忻州市', '140900', '五台', '140922', '113.259012', '38.725711');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140923', '山西省', '忻州市', '140900', '代县', '140923', '112.962519', '39.065138');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140924', '山西省', '忻州市', '140900', '繁峙', '140924', '113.267707', '39.188104');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140925', '山西省', '忻州市', '140900', '宁武', '140925', '112.307936', '39.001718');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140926', '山西省', '忻州市', '140900', '静乐', '140926', '111.940231', '38.355947');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140927', '山西省', '忻州市', '140900', '神池', '140927', '112.200438', '39.088467');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140928', '山西省', '忻州市', '140900', '五寨', '140928', '111.841015', '38.912761');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140929', '山西省', '忻州市', '140900', '岢岚', '140929', '111.56981', '38.705625');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140930', '山西省', '忻州市', '140900', '河曲', '140930', '111.146609', '39.381895');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140931', '山西省', '忻州市', '140900', '保德', '140931', '111.085688', '39.022576');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140932', '山西省', '忻州市', '140900', '偏关', '140932', '111.500477', '39.442153');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('140981', '山西省', '忻州市', '140900', '原平', '140981', '112.713132', '38.729186');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('141000', '山西省', '临汾市', '141000', '临汾', '141000', '111.517973', '36.08415');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('141002', '山西省', '临汾市', '141000', '尧都', '141002', '111.522945', '36.080366');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('141021', '山西省', '临汾市', '141000', '曲沃', '141021', '111.475529', '35.641387');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('141022', '山西省', '临汾市', '141000', '翼城', '141022', '111.713508', '35.738621');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('141023', '山西省', '临汾市', '141000', '襄汾', '141023', '111.442932', '35.876139');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('141024', '山西省', '临汾市', '141000', '洪洞', '141024', '111.673692', '36.255742');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('141025', '山西省', '临汾市', '141000', '古县', '141025', '111.920207', '36.26855');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('141026', '山西省', '临汾市', '141000', '安泽', '141026', '112.251372', '36.146032');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('141027', '山西省', '临汾市', '141000', '浮山', '141027', '111.850039', '35.971359');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('141028', '山西省', '临汾市', '141000', '吉县', '141028', '110.682853', '36.099355');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('141029', '山西省', '临汾市', '141000', '乡宁', '141029', '110.857365', '35.975402');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('141030', '山西省', '临汾市', '141000', '大宁', '141030', '110.751283', '36.46383');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('141031', '山西省', '临汾市', '141000', '隰县', '141031', '110.935809', '36.692675');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('141032', '山西省', '临汾市', '141000', '永和', '141032', '110.631276', '36.760614');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('141033', '山西省', '临汾市', '141000', '蒲县', '141033', '111.09733', '36.411682');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('141034', '山西省', '临汾市', '141000', '汾西', '141034', '111.563021', '36.653368');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('141081', '山西省', '临汾市', '141000', '侯马', '141081', '111.371272', '35.620302');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('141082', '山西省', '临汾市', '141000', '霍州', '141082', '111.723103', '36.57202');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('141100', '山西省', '吕梁市', '141100', '吕梁', '141100', '111.134335', '37.524366');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('141102', '山西省', '吕梁市', '141100', '离石', '141102', '111.134462', '37.524037');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('141121', '山西省', '吕梁市', '141100', '文水', '141121', '112.032595', '37.436314');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('141122', '山西省', '吕梁市', '141100', '交城', '141122', '112.159154', '37.555155');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('141123', '山西省', '吕梁市', '141100', '兴县', '141123', '111.124816', '38.464136');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('141124', '山西省', '吕梁市', '141100', '临县', '141124', '110.995963', '37.960806');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('141125', '山西省', '吕梁市', '141100', '柳林', '141125', '110.89613', '37.431664');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('141126', '山西省', '吕梁市', '141100', '石楼', '141126', '110.837119', '36.999426');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('141127', '山西省', '吕梁市', '141100', '岚县', '141127', '111.671555', '38.278654');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('141128', '山西省', '吕梁市', '141100', '方山', '141128', '111.238885', '37.892632');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('141129', '山西省', '吕梁市', '141100', '中阳', '141129', '111.193319', '37.342054');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('141130', '山西省', '吕梁市', '141100', '交口', '141130', '111.183188', '36.983068');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('141181', '山西省', '吕梁市', '141100', '孝义', '141181', '111.781568', '37.144474');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('141182', '山西省', '吕梁市', '141100', '汾阳', '141182', '111.785273', '37.267742');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150100', '内蒙古自治区', '呼和浩特市', '150100', '呼和浩特', '150100', '111.670801', '40.818311');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150102', '内蒙古自治区', '呼和浩特市', '150100', '新城区', '150102', '111.685964', '40.826225');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150103', '内蒙古自治区', '呼和浩特市', '150100', '回民区', '150103', '111.662162', '40.815149');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150104', '内蒙古自治区', '呼和浩特市', '150100', '玉泉区', '150104', '111.66543', '40.799421');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150105', '内蒙古自治区', '呼和浩特市', '150100', '赛罕区', '150105', '111.698463', '40.807834');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150121', '内蒙古自治区', '呼和浩特市', '150100', '土左旗', '150121', '111.09', '40.41');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150122', '内蒙古自治区', '呼和浩特市', '150100', '托克托', '150122', '111.11', '40.16');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150123', '内蒙古自治区', '呼和浩特市', '150100', '和林格尔', '150123', '111.824143', '40.380288');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150124', '内蒙古自治区', '呼和浩特市', '150100', '清水河', '150124', '111.67222', '39.912479');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150125', '内蒙古自治区', '呼和浩特市', '150100', '武川', '150125', '111.456563', '41.094483');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150200', '内蒙古自治区', '包头市', '150200', '包头', '150200', '109.840405', '40.658168');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150202', '内蒙古自治区', '包头市', '150200', '东河区', '150202', '110.026895', '40.587056');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150203', '内蒙古自治区', '包头市', '150200', '昆都仑区', '150203', '109.822932', '40.661345');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150204', '内蒙古自治区', '包头市', '150200', '青山区', '150204', '109.880049', '40.668558');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150205', '内蒙古自治区', '包头市', '150200', '石拐区', '150205', '110.272565', '40.672094');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150206', '内蒙古自治区', '包头市', '150200', '白云鄂博', '150206', '109.97016', '41.769246');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150207', '内蒙古自治区', '包头市', '150200', '九原区', '150207', '109.968122', '40.600581');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150221', '内蒙古自治区', '包头市', '150200', '土右旗', '150221', '110.32', '40.33');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150222', '内蒙古自治区', '包头市', '150200', '固阳', '150222', '110.063421', '41.030004');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150223', '内蒙古自治区', '包头市', '150200', '达茂旗', '150223', '110.26', '41.42');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150300', '内蒙古自治区', '乌海市', '150300', '乌海', '150300', '106.825563', '39.673734');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150302', '内蒙古自治区', '乌海市', '150300', '海勃湾区', '150302', '106.817762', '39.673527');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150303', '内蒙古自治区', '乌海市', '150300', '海南区', '150303', '106.884789', '39.44153');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150304', '内蒙古自治区', '乌海市', '150300', '乌达', '150304', '106.722711', '39.502288');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150400', '内蒙古自治区', '赤峰市', '150400', '赤峰', '150400', '118.956806', '42.275317');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150402', '内蒙古自治区', '赤峰市', '150400', '红山', '150402', '118.961087', '42.269732');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150403', '内蒙古自治区', '赤峰市', '150400', '元宝山', '150403', '119.289877', '42.041168');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150404', '内蒙古自治区', '赤峰市', '150400', '松山', '150404', '118.938958', '42.281046');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150421', '内蒙古自治区', '赤峰市', '150400', '阿鲁旗', '150421', '120.03', '43.53');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150422', '内蒙古自治区', '赤峰市', '150400', '巴林左旗', '150422', '119.391737', '43.980715');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150423', '内蒙古自治区', '赤峰市', '150400', '巴林右旗', '150423', '118.678347', '43.528963');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150424', '内蒙古自治区', '赤峰市', '150400', '林西', '150424', '118.05775', '43.605326');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150425', '内蒙古自治区', '赤峰市', '150400', '克什克腾旗', '150425', '117.542465', '43.256233');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150426', '内蒙古自治区', '赤峰市', '150400', '翁牛特旗', '150426', '119.022619', '42.937128');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150428', '内蒙古自治区', '赤峰市', '150400', '喀喇沁旗', '150428', '118.708572', '41.92778');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150429', '内蒙古自治区', '赤峰市', '150400', '宁城', '150429', '119.339242', '41.598692');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150430', '内蒙古自治区', '赤峰市', '150400', '敖汉旗', '150430', '119.906486', '42.287012');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150500', '内蒙古自治区', '通辽市', '150500', '通辽', '150500', '122.263119', '43.617429');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150502', '内蒙古自治区', '通辽市', '150500', '科尔沁区', '150502', '121.472818', '45.059645');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150521', '内蒙古自治区', '通辽市', '150500', '科左中旗', '150521', '123.18', '44.08');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150522', '内蒙古自治区', '通辽市', '150500', '科左后旗', '150522', '122.21', '42.58');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150523', '内蒙古自治区', '通辽市', '150500', '开鲁', '150523', '121.308797', '43.602432');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150524', '内蒙古自治区', '通辽市', '150500', '库伦旗', '150524', '121.774886', '42.734692');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150525', '内蒙古自治区', '通辽市', '150500', '奈曼旗', '150525', '120.662543', '42.84685');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150526', '内蒙古自治区', '通辽市', '150500', '扎鲁特旗', '150526', '120.905275', '44.555294');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150581', '内蒙古自治区', '通辽市', '150500', '霍林郭勒', '150581', '119.657862', '45.532361');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150600', '内蒙古自治区', '鄂尔多斯市', '150600', '鄂尔多斯', '150600', '109.99029', '39.817179');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150602', '内蒙古自治区', '鄂尔多斯市', '150600', '东胜', '150602', '109.98945', '39.81788');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150603', '内蒙古自治区', '鄂尔多斯市', '150600', '康巴什', '150603', '109.868118', '39.615711');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150621', '内蒙古自治区', '鄂尔多斯市', '150600', '达拉特旗', '150621', '110.040281', '40.404076');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150622', '内蒙古自治区', '鄂尔多斯市', '150600', '准格尔旗', '150622', '111.238332', '39.865221');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150623', '内蒙古自治区', '鄂尔多斯市', '150600', '鄂前旗', '150623', '107.29', '38.11');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150624', '内蒙古自治区', '鄂尔多斯市', '150600', '鄂托克旗', '150624', '107.982604', '39.095752');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150625', '内蒙古自治区', '鄂尔多斯市', '150600', '杭锦旗', '150625', '108.736324', '39.831789');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150626', '内蒙古自治区', '鄂尔多斯市', '150600', '乌审旗', '150626', '108.842454', '38.596611');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150627', '内蒙古自治区', '鄂尔多斯市', '150600', '伊金霍洛', '150627', '109.787402', '39.604312');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150700', '内蒙古自治区', '呼伦贝尔市', '150700', '呼伦贝尔', '150700', '119.758168', '49.215333');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150702', '内蒙古自治区', '呼伦贝尔市', '150700', '海拉尔', '150702', '119.764923', '49.213889');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150703', '内蒙古自治区', '呼伦贝尔市', '150700', '扎赉诺尔', '150703', '117.716373', '49.456567');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150721', '内蒙古自治区', '呼伦贝尔市', '150700', '阿荣旗', '150721', '123.464615', '48.130503');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150722', '内蒙古自治区', '呼伦贝尔市', '150700', '莫力达瓦', '150722', '124.507401', '48.478385');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150723', '内蒙古自治区', '呼伦贝尔市', '150700', '鄂伦春旗', '150723', '123.44', '50.35');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150724', '内蒙古自治区', '呼伦贝尔市', '150700', '鄂温克旗', '150724', '119.45', '49.09');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150725', '内蒙古自治区', '呼伦贝尔市', '150700', '陈旗', '150725', '119.26', '49.19');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150726', '内蒙古自治区', '呼伦贝尔市', '150700', '新左旗', '150726', '118.16', '48.13');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150727', '内蒙古自治区', '呼伦贝尔市', '150700', '新右旗', '150727', '116.49', '48.4');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150781', '内蒙古自治区', '呼伦贝尔市', '150700', '满洲里', '150781', '117.455561', '49.590788');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150782', '内蒙古自治区', '呼伦贝尔市', '150700', '牙克石', '150782', '120.729005', '49.287024');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150783', '内蒙古自治区', '呼伦贝尔市', '150700', '扎兰屯', '150783', '122.744401', '48.007412');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150784', '内蒙古自治区', '呼伦贝尔市', '150700', '额尔古纳', '150784', '120.178636', '50.2439');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150785', '内蒙古自治区', '呼伦贝尔市', '150700', '根河', '150785', '121.532724', '50.780454');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150800', '内蒙古自治区', '巴彦淖尔市', '150800', '巴彦淖尔', '150800', '107.416959', '40.757402');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150802', '内蒙古自治区', '巴彦淖尔市', '150800', '临河', '150802', '107.417018', '40.757092');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150821', '内蒙古自治区', '巴彦淖尔市', '150800', '五原', '150821', '108.270658', '41.097639');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150822', '内蒙古自治区', '巴彦淖尔市', '150800', '磴口', '150822', '107.006056', '40.330479');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150823', '内蒙古自治区', '巴彦淖尔市', '150800', '乌前旗', '150823', '108.39', '40.44');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150824', '内蒙古自治区', '巴彦淖尔市', '150800', '乌中旗', '150824', '108.31', '41.34');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150825', '内蒙古自治区', '巴彦淖尔市', '150800', '乌后旗', '150825', '106.59', '41.27');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150826', '内蒙古自治区', '巴彦淖尔市', '150800', '杭锦后旗', '150826', '107.147682', '40.888797');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150900', '内蒙古自治区', '乌兰察布市', '150900', '乌兰察布', '150900', '113.114543', '41.034126');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150902', '内蒙古自治区', '乌兰察布市', '150900', '集宁', '150902', '113.116453', '41.034134');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150921', '内蒙古自治区', '乌兰察布市', '150900', '卓资', '150921', '112.577702', '40.89576');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150922', '内蒙古自治区', '乌兰察布市', '150900', '化德', '150922', '114.01008', '41.899335');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150923', '内蒙古自治区', '乌兰察布市', '150900', '商都', '150923', '113.560643', '41.560163');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150924', '内蒙古自治区', '乌兰察布市', '150900', '兴和', '150924', '113.834009', '40.872437');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150925', '内蒙古自治区', '乌兰察布市', '150900', '凉城', '150925', '112.500911', '40.531627');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150926', '内蒙古自治区', '乌兰察布市', '150900', '察右前旗', '150926', '113.13', '40.48');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150927', '内蒙古自治区', '乌兰察布市', '150900', '察右中旗', '150927', '112.37', '41.16');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150928', '内蒙古自治区', '乌兰察布市', '150900', '察右后旗', '150928', '113.11', '41.27');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150929', '内蒙古自治区', '乌兰察布市', '150900', '四子王旗', '150929', '111.70123', '41.528114');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('150981', '内蒙古自治区', '乌兰察布市', '150900', '丰镇', '150981', '113.163462', '40.437534');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('152200', '内蒙古自治区', '兴安盟', '152200', '兴安盟', '152200', '122.070317', '46.076268');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('152201', '内蒙古自治区', '兴安盟', '152200', '乌兰浩特', '152201', '122.068975', '46.077238');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('152202', '内蒙古自治区', '兴安盟', '152200', '阿尔山', '152202', '119.943656', '47.177');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('152221', '内蒙古自治区', '兴安盟', '152200', '科右前旗', '152221', '122.069', '46.063');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('152222', '内蒙古自治区', '兴安盟', '152200', '科右中旗', '152222', '121.28', '45.03');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('152223', '内蒙古自治区', '兴安盟', '152200', '扎赉特旗', '152223', '122.909332', '46.725136');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('152224', '内蒙古自治区', '兴安盟', '152200', '突泉', '152224', '121.564856', '45.380986');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('152500', '内蒙古自治区', '锡林郭勒盟', '152500', '锡林郭勒', '152500', '116.090996', '43.944018');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('152501', '内蒙古自治区', '锡林郭勒盟', '152500', '二连浩特', '152501', '111.97981', '43.652895');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('152502', '内蒙古自治区', '锡林郭勒盟', '152500', '锡林浩特', '152502', '116.091903', '43.944301');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('152522', '内蒙古自治区', '锡林郭勒盟', '152500', '阿巴嘎旗', '152522', '114.970618', '44.022728');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('152523', '内蒙古自治区', '锡林郭勒盟', '152500', '苏左旗', '152523', '113.38', '43.52');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('152524', '内蒙古自治区', '锡林郭勒盟', '152500', '苏右旗', '152524', '112.39', '42.45');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('152525', '内蒙古自治区', '锡林郭勒盟', '152500', '东乌旗', '152525', '116.58', '45.31');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('152526', '内蒙古自治区', '锡林郭勒盟', '152500', '西乌旗', '152526', '117.36', '44.35');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('152527', '内蒙古自治区', '锡林郭勒盟', '152500', '太仆寺旗', '152527', '115.28728', '41.895199');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('152528', '内蒙古自治区', '锡林郭勒盟', '152500', '镶黄旗', '152528', '113.843869', '42.239229');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('152529', '内蒙古自治区', '锡林郭勒盟', '152500', '正镶白旗', '152529', '115.031423', '42.286807');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('152530', '内蒙古自治区', '锡林郭勒盟', '152500', '正蓝旗', '152530', '116.003311', '42.245895');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('152531', '内蒙古自治区', '锡林郭勒盟', '152500', '多伦', '152531', '116.477288', '42.197962');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('152900', '内蒙古自治区', '阿拉善盟', '152900', '阿拉善', '152900', '105.706422', '38.844814');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('152921', '内蒙古自治区', '阿拉善盟', '152900', '阿左旗', '152921', '105.111', '39.641');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('152922', '内蒙古自治区', '阿拉善盟', '152900', '阿右旗', '152922', '101.41', '39.13');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('152923', '内蒙古自治区', '阿拉善盟', '152900', '额济纳旗', '152923', '101.06944', '41.958813');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210100', '辽宁省', '沈阳市', '210100', '沈阳', '210100', '123.429096', '41.796767');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210102', '辽宁省', '沈阳市', '210100', '和平区', '210102', '123.406664', '41.788074');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210103', '辽宁省', '沈阳市', '210100', '沈河区', '210103', '123.445696', '41.795591');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210104', '辽宁省', '沈阳市', '210100', '大东区', '210104', '123.469956', '41.808503');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210105', '辽宁省', '沈阳市', '210100', '皇姑区', '210105', '123.405677', '41.822336');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210106', '辽宁省', '沈阳市', '210100', '铁西区', '210106', '123.350664', '41.787808');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210111', '辽宁省', '沈阳市', '210100', '苏家屯', '210111', '123.341604', '41.665904');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210112', '辽宁省', '沈阳市', '210100', '浑南', '210112', '123.458981', '41.741946');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210113', '辽宁省', '沈阳市', '210100', '沈北新区', '210113', '123.521471', '42.052312');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210114', '辽宁省', '沈阳市', '210100', '于洪区', '210114', '123.310829', '41.795833');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210115', '辽宁省', '沈阳市', '210100', '辽中区', '210115', '122.731269', '41.512725');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210123', '辽宁省', '沈阳市', '210100', '康平', '210123', '123.352703', '42.741533');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210124', '辽宁省', '沈阳市', '210100', '法库', '210124', '123.416722', '42.507045');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210181', '辽宁省', '沈阳市', '210100', '新民', '210181', '122.828868', '41.996508');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210200', '辽宁省', '大连市', '210200', '大连', '210200', '121.618622', '38.91459');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210202', '辽宁省', '大连市', '210200', '中山区', '210202', '121.64376', '38.921553');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210203', '辽宁省', '大连市', '210200', '西岗区', '210203', '121.616112', '38.914266');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210204', '辽宁省', '大连市', '210200', '沙河口', '210204', '121.593702', '38.912859');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210211', '辽宁省', '大连市', '210200', '甘井子', '210211', '121.582614', '38.975148');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210212', '辽宁省', '大连市', '210200', '旅顺', '210212', '121.26713', '38.812043');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210213', '辽宁省', '大连市', '210200', '金州', '210213', '121.789413', '39.052745');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210214', '辽宁省', '大连市', '210200', '普兰店', '210214', '121.9705', '39.401555');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210224', '辽宁省', '大连市', '210200', '长海', '210224', '122.587824', '39.272399');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210281', '辽宁省', '大连市', '210200', '瓦房店', '210281', '122.002656', '39.63065');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210283', '辽宁省', '大连市', '210200', '庄河', '210283', '122.970612', '39.69829');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210300', '辽宁省', '鞍山市', '210300', '鞍山', '210300', '122.995632', '41.110626');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210302', '辽宁省', '鞍山市', '210300', '铁东区', '210302', '122.994475', '41.110344');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210303', '辽宁省', '鞍山市', '210300', '铁西区', '210303', '122.971834', '41.11069');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210304', '辽宁省', '鞍山市', '210300', '立山', '210304', '123.024806', '41.150622');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210311', '辽宁省', '鞍山市', '210300', '千山', '210311', '122.949298', '41.068909');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210321', '辽宁省', '鞍山市', '210300', '台安', '210321', '122.429736', '41.38686');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210323', '辽宁省', '鞍山市', '210300', '岫岩', '210323', '123.28833', '40.281509');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210381', '辽宁省', '鞍山市', '210300', '海城', '210381', '122.752199', '40.852533');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210400', '辽宁省', '抚顺市', '210400', '抚顺', '210400', '124.097979', '41.922644');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210402', '辽宁省', '抚顺市', '210400', '新抚区', '210402', '123.902858', '41.86082');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210403', '辽宁省', '抚顺市', '210400', '东洲区', '210403', '124.047219', '41.866829');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210404', '辽宁省', '抚顺市', '210400', '望花区', '210404', '123.801509', '41.851803');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210411', '辽宁省', '抚顺市', '210400', '顺城区', '210411', '123.917165', '41.881132');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210421', '辽宁省', '抚顺市', '210400', '抚顺县', '210421', '123.9216', '41.88704');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210422', '辽宁省', '抚顺市', '210400', '新宾', '210422', '125.037547', '41.732456');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210423', '辽宁省', '抚顺市', '210400', '清原', '210423', '124.927192', '42.10135');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210500', '辽宁省', '本溪市', '210500', '本溪', '210500', '123.770519', '41.297909');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210502', '辽宁省', '本溪市', '210500', '平山区', '210502', '123.761231', '41.291581');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210503', '辽宁省', '本溪市', '210500', '溪湖', '210503', '123.765226', '41.330056');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210504', '辽宁省', '本溪市', '210500', '明山', '210504', '123.763288', '41.302429');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210505', '辽宁省', '本溪市', '210500', '南芬', '210505', '123.748381', '41.104093');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210521', '辽宁省', '本溪市', '210500', '本溪县', '210521', '124.17', '41.18');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210522', '辽宁省', '本溪市', '210500', '桓仁', '210522', '125.359195', '41.268997');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210600', '辽宁省', '丹东市', '210600', '丹东', '210600', '124.383044', '40.124296');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210602', '辽宁省', '丹东市', '210600', '元宝', '210602', '124.397814', '40.136483');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210603', '辽宁省', '丹东市', '210600', '振兴', '210603', '124.361153', '40.102801');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210604', '辽宁省', '丹东市', '210600', '振安', '210604', '124.427709', '40.158557');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210624', '辽宁省', '丹东市', '210600', '宽甸', '210624', '124.784867', '40.730412');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210681', '辽宁省', '丹东市', '210600', '东港', '210681', '124.149437', '39.883467');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210682', '辽宁省', '丹东市', '210600', '凤城', '210682', '124.071067', '40.457567');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210700', '辽宁省', '锦州市', '210700', '锦州', '210700', '121.135742', '41.119269');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210702', '辽宁省', '锦州市', '210700', '古塔', '210702', '121.130085', '41.115719');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210703', '辽宁省', '锦州市', '210700', '凌河', '210703', '121.151304', '41.114662');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210711', '辽宁省', '锦州市', '210700', '太和区', '210711', '121.107297', '41.105378');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210726', '辽宁省', '锦州市', '210700', '黑山', '210726', '122.117915', '41.691804');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210727', '辽宁省', '锦州市', '210700', '义县', '210727', '121.242831', '41.537224');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210781', '辽宁省', '锦州市', '210700', '凌海', '210781', '121.364236', '41.171738');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210782', '辽宁省', '锦州市', '210700', '北镇', '210782', '121.795962', '41.598764');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210800', '辽宁省', '营口市', '210800', '营口', '210800', '122.235151', '40.667432');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210802', '辽宁省', '营口市', '210800', '站前区', '210802', '122.253235', '40.669949');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210803', '辽宁省', '营口市', '210800', '西市区', '210803', '122.210067', '40.663086');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210804', '辽宁省', '营口市', '210800', '鲅鱼圈', '210804', '122.127242', '40.263646');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210811', '辽宁省', '营口市', '210800', '老边区', '210811', '122.382584', '40.682723');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210881', '辽宁省', '营口市', '210800', '盖州', '210881', '122.355534', '40.405234');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210882', '辽宁省', '营口市', '210800', '大石桥', '210882', '122.505894', '40.633973');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210900', '辽宁省', '阜新市', '210900', '阜新', '210900', '121.743125', '42.058607');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210902', '辽宁省', '阜新市', '210900', '海州区', '210902', '121.657639', '42.011162');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210903', '辽宁省', '阜新市', '210900', '新邱', '210903', '121.790541', '42.086603');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210904', '辽宁省', '阜新市', '210900', '太平', '210904', '121.677575', '42.011145');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210905', '辽宁省', '阜新市', '210900', '清河门', '210905', '121.42018', '41.780477');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210911', '辽宁省', '阜新市', '210900', '细河', '210911', '121.654791', '42.019218');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210921', '辽宁省', '阜新市', '210900', '阜新县', '210921', '121.763574', '42.07137');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('210922', '辽宁省', '阜新市', '210900', '彰武', '210922', '122.537444', '42.384823');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('211000', '辽宁省', '辽阳市', '211000', '辽阳', '211000', '123.18152', '41.269402');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('211002', '辽宁省', '辽阳市', '211000', '白塔区', '211002', '123.172611', '41.26745');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('211003', '辽宁省', '辽阳市', '211000', '文圣区', '211003', '123.188227', '41.266765');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('211004', '辽宁省', '辽阳市', '211000', '宏伟区', '211004', '123.200461', '41.205747');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('211005', '辽宁省', '辽阳市', '211000', '弓长岭', '211005', '123.431633', '41.157831');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('211011', '辽宁省', '辽阳市', '211000', '太子河', '211011', '123.185336', '41.251682');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('211021', '辽宁省', '辽阳市', '211000', '辽阳县', '211021', '123.079674', '41.216479');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('211081', '辽宁省', '辽阳市', '211000', '灯塔市', '211081', '123.325864', '41.427836');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('211100', '辽宁省', '盘锦市', '211100', '盘锦', '211100', '122.06957', '41.124484');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('211102', '辽宁省', '盘锦市', '211100', '双台子', '211102', '122.055733', '41.190365');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('211103', '辽宁省', '盘锦市', '211100', '兴隆台', '211103', '122.071624', '41.122423');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('211104', '辽宁省', '盘锦市', '211100', '大洼', '211104', '122.071708', '40.994428');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('211122', '辽宁省', '盘锦市', '211100', '盘山', '211122', '121.98528', '41.240701');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('211200', '辽宁省', '铁岭市', '211200', '铁岭', '211200', '123.725669', '42.223316');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('211202', '辽宁省', '铁岭市', '211200', '银州', '211202', '123.844877', '42.292278');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('211204', '辽宁省', '铁岭市', '211200', '清河区', '211204', '124.14896', '42.542978');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('211221', '辽宁省', '铁岭市', '211200', '铁岭县', '211221', '123.735372', '42.229226');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('211223', '辽宁省', '铁岭市', '211200', '西丰', '211223', '124.72332', '42.738091');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('211224', '辽宁省', '铁岭市', '211200', '昌图', '211224', '124.11017', '42.784441');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('211281', '辽宁省', '铁岭市', '211200', '调兵山', '211281', '123.545366', '42.450734');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('211282', '辽宁省', '铁岭市', '211200', '开原', '211282', '124.045551', '42.542141');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('211300', '辽宁省', '朝阳市', '211300', '朝阳', '211300', '120.451176', '41.576758');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('211302', '辽宁省', '朝阳市', '211300', '双塔', '211302', '120.44877', '41.579389');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('211303', '辽宁省', '朝阳市', '211300', '龙城', '211303', '120.413376', '41.576749');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('211321', '辽宁省', '朝阳市', '211300', '朝阳县', '211321', '120.25939', '41.241076');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('211322', '辽宁省', '朝阳市', '211300', '建平', '211322', '119.642363', '41.402576');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('211324', '辽宁省', '朝阳市', '211300', '喀左', '211324', '119.43', '41.05');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('211381', '辽宁省', '朝阳市', '211300', '北票', '211381', '120.766951', '41.803286');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('211382', '辽宁省', '朝阳市', '211300', '凌源', '211382', '119.404789', '41.243086');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('211400', '辽宁省', '葫芦岛市', '211400', '葫芦岛', '211400', '120.856394', '40.755572');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('211402', '辽宁省', '葫芦岛市', '211400', '连山区', '211402', '120.85937', '40.755143');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('211403', '辽宁省', '葫芦岛市', '211400', '龙港', '211403', '120.838569', '40.709991');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('211404', '辽宁省', '葫芦岛市', '211400', '南票', '211404', '120.752314', '41.098813');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('211421', '辽宁省', '葫芦岛市', '211400', '绥中', '211421', '120.342112', '40.328407');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('211422', '辽宁省', '葫芦岛市', '211400', '建昌', '211422', '119.807776', '40.812871');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('211481', '辽宁省', '葫芦岛市', '211400', '兴城', '211481', '120.729365', '40.619413');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220100', '吉林省', '长春市', '220100', '长春', '220100', '125.3245', '43.886841');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220102', '吉林省', '长春市', '220100', '南关', '220102', '125.337237', '43.890235');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220103', '吉林省', '长春市', '220100', '宽城区', '220103', '125.342828', '43.903823');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220104', '吉林省', '长春市', '220100', '朝阳区', '220104', '125.318042', '43.86491');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220105', '吉林省', '长春市', '220100', '二道区', '220105', '125.384727', '43.870824');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220106', '吉林省', '长春市', '220100', '绿园区', '220106', '125.272467', '43.892177');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220112', '吉林省', '长春市', '220100', '双阳', '220112', '125.659018', '43.525168');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220113', '吉林省', '长春市', '220100', '九台', '220113', '125.844682', '44.157155');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220122', '吉林省', '长春市', '220100', '农安', '220122', '125.175287', '44.431258');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220182', '吉林省', '长春市', '220100', '榆树', '220182', '126.550107', '44.827642');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220183', '吉林省', '长春市', '220100', '德惠', '220183', '125.703327', '44.533909');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220200', '吉林省', '吉林市', '220200', '吉林', '220200', '126.55302', '43.843577');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220202', '吉林省', '吉林市', '220200', '昌邑区', '220202', '126.570766', '43.851118');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220203', '吉林省', '吉林市', '220200', '龙潭', '220203', '126.561429', '43.909755');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220204', '吉林省', '吉林市', '220200', '船营', '220204', '126.55239', '43.843804');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220211', '吉林省', '吉林市', '220200', '丰满', '220211', '126.560759', '43.816594');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220221', '吉林省', '吉林市', '220200', '永吉', '220221', '126.501622', '43.667416');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220281', '吉林省', '吉林市', '220200', '蛟河', '220281', '127.342739', '43.720579');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220282', '吉林省', '吉林市', '220200', '桦甸', '220282', '126.745445', '42.972093');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220283', '吉林省', '吉林市', '220200', '舒兰', '220283', '126.947813', '44.410906');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220284', '吉林省', '吉林市', '220200', '磐石', '220284', '126.059929', '42.942476');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220300', '吉林省', '四平市', '220300', '四平', '220300', '124.370785', '43.170344');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220302', '吉林省', '四平市', '220300', '铁西', '220302', '124.360894', '43.176263');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220303', '吉林省', '四平市', '220300', '铁东', '220303', '124.388464', '43.16726');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220322', '吉林省', '四平市', '220300', '梨树', '220322', '124.335802', '43.30831');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220323', '吉林省', '四平市', '220300', '伊通', '220323', '125.303124', '43.345464');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220381', '吉林省', '四平市', '220300', '公主岭', '220381', '124.817588', '43.509474');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220382', '吉林省', '四平市', '220300', '双辽', '220382', '123.505283', '43.518275');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220400', '吉林省', '辽源市', '220400', '辽源', '220400', '125.145349', '42.902692');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220402', '吉林省', '辽源市', '220400', '龙山区', '220402', '125.145164', '42.902702');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220403', '吉林省', '辽源市', '220400', '西安区', '220403', '125.151424', '42.920415');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220421', '吉林省', '辽源市', '220400', '东丰', '220421', '125.529623', '42.675228');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220422', '吉林省', '辽源市', '220400', '东辽', '220422', '124.991995', '42.927724');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220500', '吉林省', '通化市', '220500', '通化', '220500', '125.936501', '41.721177');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220502', '吉林省', '通化市', '220500', '东昌区', '220502', '125.936716', '41.721233');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220503', '吉林省', '通化市', '220500', '二道江', '220503', '126.045987', '41.777564');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220521', '吉林省', '通化市', '220500', '通化县', '220521', '125.753121', '41.677918');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220523', '吉林省', '通化市', '220500', '辉南', '220523', '126.042821', '42.683459');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220524', '吉林省', '通化市', '220500', '柳河', '220524', '125.740536', '42.281484');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220581', '吉林省', '通化市', '220500', '梅河口', '220581', '125.687336', '42.530002');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220582', '吉林省', '通化市', '220500', '集安', '220582', '126.186204', '41.126276');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220600', '吉林省', '白山市', '220600', '白山', '220600', '126.427839', '41.942505');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220602', '吉林省', '白山市', '220600', '浑江', '220602', '126.428035', '41.943065');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220605', '吉林省', '白山市', '220600', '江源', '220605', '126.584229', '42.048109');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220621', '吉林省', '白山市', '220600', '抚松', '220621', '127.273796', '42.332643');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220622', '吉林省', '白山市', '220600', '靖宇', '220622', '126.808386', '42.389689');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220623', '吉林省', '白山市', '220600', '长白', '220623', '128.203384', '41.419361');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220681', '吉林省', '白山市', '220600', '临江', '220681', '126.919296', '41.810689');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220700', '吉林省', '松原市', '220700', '松原', '220700', '124.823608', '45.118243');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220702', '吉林省', '松原市', '220700', '宁江', '220702', '124.827851', '45.176498');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220721', '吉林省', '松原市', '220700', '前郭', '220721', '124.826808', '45.116288');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220722', '吉林省', '松原市', '220700', '长岭', '220722', '123.985184', '44.276579');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220723', '吉林省', '松原市', '220700', '乾安', '220723', '124.024361', '45.006846');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220781', '吉林省', '松原市', '220700', '扶余', '220781', '126.042758', '44.986199');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220800', '吉林省', '白城市', '220800', '白城', '220800', '122.841114', '45.619026');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220802', '吉林省', '白城市', '220800', '洮北', '220802', '122.842499', '45.619253');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220821', '吉林省', '白城市', '220800', '镇赉', '220821', '123.202246', '45.846089');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220822', '吉林省', '白城市', '220800', '通榆', '220822', '123.088543', '44.80915');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220881', '吉林省', '白城市', '220800', '洮南', '220881', '122.783779', '45.339113');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('220882', '吉林省', '白城市', '220800', '大安', '220882', '124.291512', '45.507648');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('222400', '吉林省', '延边朝鲜族自治州', '222400', '延边', '222400', '129.513228', '42.904823');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('222401', '吉林省', '延边朝鲜族自治州', '222400', '延吉', '222401', '129.51579', '42.906964');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('222402', '吉林省', '延边朝鲜族自治州', '222400', '图们', '222402', '129.846701', '42.966621');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('222403', '吉林省', '延边朝鲜族自治州', '222400', '敦化', '222403', '128.22986', '43.366921');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('222404', '吉林省', '延边朝鲜族自治州', '222400', '珲春', '222404', '130.365787', '42.871057');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('222405', '吉林省', '延边朝鲜族自治州', '222400', '龙井', '222405', '129.425747', '42.771029');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('222406', '吉林省', '延边朝鲜族自治州', '222400', '和龙', '222406', '129.008748', '42.547004');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('222424', '吉林省', '延边朝鲜族自治州', '222400', '汪清', '222424', '129.766161', '43.315426');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('222426', '吉林省', '延边朝鲜族自治州', '222400', '安图', '222426', '128.901865', '43.110994');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230100', '黑龙江省', '哈尔滨市', '230100', '哈尔滨', '230100', '126.642464', '45.756967');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230102', '黑龙江省', '哈尔滨市', '230100', '道里区', '230102', '126.612532', '45.762035');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230103', '黑龙江省', '哈尔滨市', '230100', '南岗区', '230103', '126.652098', '45.755971');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230104', '黑龙江省', '哈尔滨市', '230100', '道外区', '230104', '126.648838', '45.78454');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230108', '黑龙江省', '哈尔滨市', '230100', '平房区', '230108', '126.629257', '45.605567');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230109', '黑龙江省', '哈尔滨市', '230100', '松北区', '230109', '126.563066', '45.814656');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230110', '黑龙江省', '哈尔滨市', '230100', '香坊区', '230110', '126.667049', '45.713067');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230111', '黑龙江省', '哈尔滨市', '230100', '呼兰', '230111', '126.603302', '45.98423');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230112', '黑龙江省', '哈尔滨市', '230100', '阿城', '230112', '126.972726', '45.538372');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230113', '黑龙江省', '哈尔滨市', '230100', '双城区', '230113', '126.308784', '45.377942');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230123', '黑龙江省', '哈尔滨市', '230100', '依兰', '230123', '129.565594', '46.315105');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230124', '黑龙江省', '哈尔滨市', '230100', '方正', '230124', '128.836131', '45.839536');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230125', '黑龙江省', '哈尔滨市', '230100', '宾县', '230125', '127.48594', '45.759369');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230126', '黑龙江省', '哈尔滨市', '230100', '巴彦', '230126', '127.403602', '46.081889');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230127', '黑龙江省', '哈尔滨市', '230100', '木兰', '230127', '128.042675', '45.949826');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230128', '黑龙江省', '哈尔滨市', '230100', '通河', '230128', '128.747786', '45.977618');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230129', '黑龙江省', '哈尔滨市', '230100', '延寿', '230129', '128.331886', '45.455648');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230183', '黑龙江省', '哈尔滨市', '230100', '尚志', '230183', '127.968539', '45.214953');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230184', '黑龙江省', '哈尔滨市', '230100', '五常', '230184', '127.15759', '44.919418');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230200', '黑龙江省', '齐齐哈尔市', '230200', '齐齐哈尔', '230200', '123.95792', '47.342081');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230202', '黑龙江省', '齐齐哈尔市', '230200', '龙沙', '230202', '123.957338', '47.341736');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230203', '黑龙江省', '齐齐哈尔市', '230200', '建华', '230203', '123.955888', '47.354494');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230204', '黑龙江省', '齐齐哈尔市', '230200', '铁锋', '230204', '123.973555', '47.339499');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230205', '黑龙江省', '齐齐哈尔市', '230200', '昂昂溪', '230205', '123.813181', '47.156867');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230206', '黑龙江省', '齐齐哈尔市', '230200', '富拉尔基', '230206', '123.638873', '47.20697');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230207', '黑龙江省', '齐齐哈尔市', '230200', '碾子山', '230207', '122.887972', '47.51401');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230208', '黑龙江省', '齐齐哈尔市', '230200', '梅里斯', '230208', '123.754599', '47.311113');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230221', '黑龙江省', '齐齐哈尔市', '230200', '龙江', '230221', '123.187225', '47.336388');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230223', '黑龙江省', '齐齐哈尔市', '230200', '依安', '230223', '125.307561', '47.890098');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230224', '黑龙江省', '齐齐哈尔市', '230200', '泰来', '230224', '123.41953', '46.39233');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230225', '黑龙江省', '齐齐哈尔市', '230200', '甘南县', '230225', '123.506034', '47.917838');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230227', '黑龙江省', '齐齐哈尔市', '230200', '富裕', '230227', '124.469106', '47.797172');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230229', '黑龙江省', '齐齐哈尔市', '230200', '克山', '230229', '125.874355', '48.034342');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230230', '黑龙江省', '齐齐哈尔市', '230200', '克东', '230230', '126.249094', '48.03732');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230231', '黑龙江省', '齐齐哈尔市', '230200', '拜泉', '230231', '126.091911', '47.607363');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230281', '黑龙江省', '齐齐哈尔市', '230200', '讷河', '230281', '124.882172', '48.481133');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230300', '黑龙江省', '鸡西市', '230300', '鸡西', '230300', '130.975966', '45.300046');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230302', '黑龙江省', '鸡西市', '230300', '鸡冠区', '230302', '130.974374', '45.30034');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230303', '黑龙江省', '鸡西市', '230300', '恒山区', '230303', '130.910636', '45.213242');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230304', '黑龙江省', '鸡西市', '230300', '滴道区', '230304', '130.846823', '45.348812');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230305', '黑龙江省', '鸡西市', '230300', '梨树区', '230305', '130.697781', '45.092195');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230306', '黑龙江省', '鸡西市', '230300', '城子河', '230306', '131.010501', '45.338248');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230307', '黑龙江省', '鸡西市', '230300', '麻山', '230307', '130.481126', '45.209607');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230321', '黑龙江省', '鸡西市', '230300', '鸡东', '230321', '131.148907', '45.250892');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230381', '黑龙江省', '鸡西市', '230300', '虎林', '230381', '132.973881', '45.767985');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230382', '黑龙江省', '鸡西市', '230300', '密山', '230382', '131.874137', '45.54725');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230400', '黑龙江省', '鹤岗市', '230400', '鹤岗', '230400', '130.277487', '47.332085');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230402', '黑龙江省', '鹤岗市', '230400', '向阳区', '230402', '130.292478', '47.345372');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230403', '黑龙江省', '鹤岗市', '230400', '工农区', '230403', '130.276652', '47.331678');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230404', '黑龙江省', '鹤岗市', '230400', '南山区', '230404', '130.275533', '47.31324');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230405', '黑龙江省', '鹤岗市', '230400', '兴安区', '230405', '130.236169', '47.252911');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230406', '黑龙江省', '鹤岗市', '230400', '东山区', '230406', '130.31714', '47.337385');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230407', '黑龙江省', '鹤岗市', '230400', '兴山区', '230407', '130.30534', '47.35997');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230421', '黑龙江省', '鹤岗市', '230400', '萝北', '230421', '130.829087', '47.577577');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230422', '黑龙江省', '鹤岗市', '230400', '绥滨', '230422', '131.860526', '47.289892');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230500', '黑龙江省', '双鸭山市', '230500', '双鸭山', '230500', '131.157304', '46.643442');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230502', '黑龙江省', '双鸭山市', '230500', '尖山区', '230502', '131.15896', '46.642961');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230503', '黑龙江省', '双鸭山市', '230500', '岭东区', '230503', '131.163675', '46.591076');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230505', '黑龙江省', '双鸭山市', '230500', '四方台', '230505', '131.333181', '46.594347');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230506', '黑龙江省', '双鸭山市', '230500', '宝山区', '230506', '131.404294', '46.573366');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230521', '黑龙江省', '双鸭山市', '230500', '集贤', '230521', '131.13933', '46.72898');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230522', '黑龙江省', '双鸭山市', '230500', '友谊', '230522', '131.810622', '46.775159');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230523', '黑龙江省', '双鸭山市', '230500', '宝清', '230523', '132.206415', '46.328781');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230524', '黑龙江省', '双鸭山市', '230500', '饶河', '230524', '134.021162', '46.801288');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230600', '黑龙江省', '大庆市', '230600', '大庆', '230600', '125.11272', '46.590734');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230602', '黑龙江省', '大庆市', '230600', '萨尔图', '230602', '125.114643', '46.596356');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230603', '黑龙江省', '大庆市', '230600', '龙凤区', '230603', '125.145794', '46.573948');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230604', '黑龙江省', '大庆市', '230600', '让胡路', '230604', '124.868341', '46.653254');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230605', '黑龙江省', '大庆市', '230600', '红岗区', '230605', '124.889528', '46.403049');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230606', '黑龙江省', '大庆市', '230600', '大同区', '230606', '124.818509', '46.034304');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230621', '黑龙江省', '大庆市', '230600', '肇州', '230621', '125.273254', '45.708685');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230622', '黑龙江省', '大庆市', '230600', '肇源', '230622', '125.081974', '45.518832');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230623', '黑龙江省', '大庆市', '230600', '林甸', '230623', '124.877742', '47.186411');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230624', '黑龙江省', '大庆市', '230600', '杜尔伯特', '230624', '124.446259', '46.865973');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230700', '黑龙江省', '伊春市', '230700', '伊春', '230700', '128.899284', '47.726851');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230702', '黑龙江省', '伊春市', '230700', '伊春区', '230702', '128.913459', '47.733954');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230703', '黑龙江省', '伊春市', '230700', '南岔区', '230703', '129.28246', '47.137314');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230704', '黑龙江省', '伊春市', '230700', '友好区', '230704', '128.838961', '47.854303');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230705', '黑龙江省', '伊春市', '230700', '西林区', '230705', '129.311441', '47.479437');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230706', '黑龙江省', '伊春市', '230700', '翠峦', '230706', '128.671746', '47.726228');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230707', '黑龙江省', '伊春市', '230700', '新青', '230707', '129.52995', '48.288292');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230708', '黑龙江省', '伊春市', '230700', '美溪', '230708', '129.133411', '47.636102');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230709', '黑龙江省', '伊春市', '230700', '金山屯', '230709', '129.435944', '47.41295');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230710', '黑龙江省', '伊春市', '230700', '五营', '230710', '129.245028', '48.108204');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230711', '黑龙江省', '伊春市', '230700', '乌马河', '230711', '128.802941', '47.726961');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230712', '黑龙江省', '伊春市', '230700', '汤旺河', '230712', '129.57224', '48.453651');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230713', '黑龙江省', '伊春市', '230700', '带岭', '230713', '129.021151', '47.027532');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230714', '黑龙江省', '伊春市', '230700', '乌伊岭', '230714', '129.437847', '48.59112');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230715', '黑龙江省', '伊春市', '230700', '红星区', '230715', '129.388796', '48.238368');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230716', '黑龙江省', '伊春市', '230700', '上甘岭', '230716', '129.02508', '47.974859');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230722', '黑龙江省', '伊春市', '230700', '嘉荫', '230722', '130.397684', '48.891378');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230781', '黑龙江省', '伊春市', '230700', '铁力', '230781', '128.030561', '46.985772');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230800', '黑龙江省', '佳木斯市', '230800', '佳木斯', '230800', '130.361634', '46.809606');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230803', '黑龙江省', '佳木斯市', '230800', '向阳区', '230803', '130.361786', '46.809645');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230804', '黑龙江省', '佳木斯市', '230800', '前进区', '230804', '130.377684', '46.812345');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230805', '黑龙江省', '佳木斯市', '230800', '东风区', '230805', '130.403297', '46.822476');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230811', '黑龙江省', '佳木斯市', '230800', '郊区', '230811', '130.351588', '46.80712');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230822', '黑龙江省', '佳木斯市', '230800', '桦南', '230822', '130.570112', '46.240118');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230826', '黑龙江省', '佳木斯市', '230800', '桦川', '230826', '130.723713', '47.023039');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230828', '黑龙江省', '佳木斯市', '230800', '汤原', '230828', '129.904463', '46.730048');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230881', '黑龙江省', '佳木斯市', '230800', '同江', '230881', '132.510119', '47.651131');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230882', '黑龙江省', '佳木斯市', '230800', '富锦', '230882', '132.037951', '47.250747');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230883', '黑龙江省', '佳木斯市', '230800', '抚远', '230883', '134.294501', '48.364707');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230900', '黑龙江省', '七台河市', '230900', '七台河', '230900', '131.015584', '45.771266');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230902', '黑龙江省', '七台河市', '230900', '新兴区', '230902', '130.889482', '45.794258');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230903', '黑龙江省', '七台河市', '230900', '桃山区', '230903', '131.015848', '45.771217');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230904', '黑龙江省', '七台河市', '230900', '茄子河', '230904', '131.071561', '45.776587');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('230921', '黑龙江省', '七台河市', '230900', '勃利', '230921', '130.575025', '45.751573');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('231000', '黑龙江省', '牡丹江市', '231000', '牡丹江', '231000', '129.618602', '44.582962');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('231002', '黑龙江省', '牡丹江市', '231000', '东安区', '231002', '129.623292', '44.582399');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('231003', '黑龙江省', '牡丹江市', '231000', '阳明', '231003', '129.634645', '44.596328');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('231004', '黑龙江省', '牡丹江市', '231000', '爱民', '231004', '129.601232', '44.595443');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('231005', '黑龙江省', '牡丹江市', '231000', '西安区', '231005', '129.61311', '44.581032');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('231025', '黑龙江省', '牡丹江市', '231000', '林口', '231025', '130.268402', '45.286645');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('231081', '黑龙江省', '牡丹江市', '231000', '绥芬河', '231081', '131.164856', '44.396864');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('231083', '黑龙江省', '牡丹江市', '231000', '海林', '231083', '129.387902', '44.574149');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('231084', '黑龙江省', '牡丹江市', '231000', '宁安', '231084', '129.470019', '44.346836');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('231085', '黑龙江省', '牡丹江市', '231000', '穆棱', '231085', '130.527085', '44.91967');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('231086', '黑龙江省', '牡丹江市', '231000', '东宁', '231086', '131.125296', '44.063578');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('231100', '黑龙江省', '黑河市', '231100', '黑河', '231100', '127.499023', '50.249585');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('231102', '黑龙江省', '黑河市', '231100', '爱辉', '231102', '127.497639', '50.249027');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('231121', '黑龙江省', '黑河市', '231100', '嫩江', '231121', '125.229904', '49.177461');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('231123', '黑龙江省', '黑河市', '231100', '逊克', '231123', '128.476152', '49.582974');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('231124', '黑龙江省', '黑河市', '231100', '孙吴', '231124', '127.327315', '49.423941');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('231181', '黑龙江省', '黑河市', '231100', '北安', '231181', '126.508737', '48.245437');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('231182', '黑龙江省', '黑河市', '231100', '五大连池', '231182', '126.197694', '48.512688');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('231200', '黑龙江省', '绥化市', '231200', '绥化', '231200', '126.99293', '46.637393');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('231202', '黑龙江省', '绥化市', '231200', '北林', '231202', '126.990665', '46.634912');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('231221', '黑龙江省', '绥化市', '231200', '望奎', '231221', '126.484191', '46.83352');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('231222', '黑龙江省', '绥化市', '231200', '兰西', '231222', '126.289315', '46.259037');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('231223', '黑龙江省', '绥化市', '231200', '青冈', '231223', '126.112268', '46.686596');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('231224', '黑龙江省', '绥化市', '231200', '庆安', '231224', '127.510024', '46.879203');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('231225', '黑龙江省', '绥化市', '231200', '明水', '231225', '125.907544', '47.183527');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('231226', '黑龙江省', '绥化市', '231200', '绥棱', '231226', '127.111121', '47.247195');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('231281', '黑龙江省', '绥化市', '231200', '安达', '231281', '125.329926', '46.410614');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('231282', '黑龙江省', '绥化市', '231200', '肇东', '231282', '125.991402', '46.069471');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('231283', '黑龙江省', '绥化市', '231200', '海伦', '231283', '126.969383', '47.460428');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('232700', '黑龙江省', '大兴安岭地区', '232700', '大兴安岭', '232700', '124.711526', '52.335262');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('232701', '黑龙江省', '大兴安岭地区', '232700', '漠河', '232701', '122.536256', '52.972074');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('232721', '黑龙江省', '大兴安岭地区', '232700', '呼玛', '232721', '126.662105', '51.726998');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('232722', '黑龙江省', '大兴安岭地区', '232700', '塔河', '232722', '124.710516', '52.335229');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('232723', '黑龙江省', '大兴安岭地区', '232700', '大兴安岭地区直辖', '232723', '122.536256', '52.972074');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('310100', '上海市', '上海市', '310100', '上海', '310100', '121.472644', '31.231706');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('310101', '上海市', '上海市', '310100', '黄浦', '310101', '121.490317', '31.222771');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('310104', '上海市', '上海市', '310100', '徐汇', '310104', '121.43752', '31.179973');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('310105', '上海市', '上海市', '310100', '长宁区', '310105', '121.4222', '31.218123');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('310106', '上海市', '上海市', '310100', '静安', '310106', '121.448224', '31.229003');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('310107', '上海市', '上海市', '310100', '普陀区', '310107', '121.392499', '31.241701');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('310109', '上海市', '上海市', '310100', '虹口', '310109', '121.491832', '31.26097');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('310110', '上海市', '上海市', '310100', '杨浦', '310110', '121.522797', '31.270755');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('310112', '上海市', '上海市', '310100', '闵行', '310112', '121.375972', '31.111658');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('310113', '上海市', '上海市', '310100', '宝山', '310113', '121.489934', '31.398896');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('310114', '上海市', '上海市', '310100', '嘉定', '310114', '121.250333', '31.383524');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('310115', '上海市', '上海市', '310100', '浦东新区', '310115', '121.567706', '31.245944');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('310116', '上海市', '上海市', '310100', '金山', '310116', '121.330736', '30.724697');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('310117', '上海市', '上海市', '310100', '松江', '310117', '121.223543', '31.03047');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('310118', '上海市', '上海市', '310100', '青浦', '310118', '121.113021', '31.151209');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('310120', '上海市', '上海市', '310100', '奉贤', '310120', '121.458472', '30.912345');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('310151', '上海市', '上海市', '310100', '崇明', '310151', '121.397516', '31.626946');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320100', '江苏省', '南京市', '320100', '南京', '320100', '118.767413', '32.041544');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320102', '江苏省', '南京市', '320100', '玄武', '320102', '118.792199', '32.050678');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320104', '江苏省', '南京市', '320100', '秦淮', '320104', '118.786088', '32.033818');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320105', '江苏省', '南京市', '320100', '建邺', '320105', '118.732688', '32.004538');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320106', '江苏省', '南京市', '320100', '鼓楼', '320106', '118.769739', '32.066966');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320111', '江苏省', '南京市', '320100', '浦口', '320111', '118.625307', '32.05839');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320113', '江苏省', '南京市', '320100', '栖霞区', '320113', '118.808702', '32.102147');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320114', '江苏省', '南京市', '320100', '雨花台', '320114', '118.77207', '31.995946');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320115', '江苏省', '南京市', '320100', '江宁', '320115', '118.850621', '31.953418');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320116', '江苏省', '南京市', '320100', '六合', '320116', '118.85065', '32.340655');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320117', '江苏省', '南京市', '320100', '溧水', '320117', '119.028732', '31.653061');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320118', '江苏省', '南京市', '320100', '高淳', '320118', '118.87589', '31.327132');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320200', '江苏省', '无锡市', '320200', '无锡', '320200', '120.301663', '31.574729');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320205', '江苏省', '无锡市', '320200', '锡山', '320205', '120.357298', '31.585559');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320206', '江苏省', '无锡市', '320200', '惠山', '320206', '120.303543', '31.681019');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320211', '江苏省', '无锡市', '320200', '滨湖', '320211', '120.266053', '31.550228');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320213', '江苏省', '无锡市', '320200', '梁溪', '320213', '120.296595', '31.575706');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320214', '江苏省', '无锡市', '320200', '新吴', '320214', '120.352782', '31.550966');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320281', '江苏省', '无锡市', '320200', '江阴', '320281', '120.275891', '31.910984');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320282', '江苏省', '无锡市', '320200', '宜兴', '320282', '119.820538', '31.364384');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320300', '江苏省', '徐州市', '320300', '徐州', '320300', '117.184811', '34.261792');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320302', '江苏省', '徐州市', '320300', '鼓楼区', '320302', '117.192941', '34.269397');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320303', '江苏省', '徐州市', '320300', '云龙区', '320303', '117.194589', '34.254805');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320305', '江苏省', '徐州市', '320300', '贾汪', '320305', '117.450212', '34.441642');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320311', '江苏省', '徐州市', '320300', '泉山', '320311', '117.182225', '34.262249');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320312', '江苏省', '徐州市', '320300', '铜山', '320312', '117.183894', '34.19288');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320321', '江苏省', '徐州市', '320300', '丰县', '320321', '116.592888', '34.696946');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320322', '江苏省', '徐州市', '320300', '沛县', '320322', '116.937182', '34.729044');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320324', '江苏省', '徐州市', '320300', '睢宁', '320324', '117.95066', '33.899222');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320381', '江苏省', '徐州市', '320300', '新沂', '320381', '118.345828', '34.368779');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320382', '江苏省', '徐州市', '320300', '邳州', '320382', '117.963923', '34.314708');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320400', '江苏省', '常州市', '320400', '常州', '320400', '119.946973', '31.772752');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320402', '江苏省', '常州市', '320400', '天宁', '320402', '119.963783', '31.779632');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320404', '江苏省', '常州市', '320400', '钟楼', '320404', '119.948388', '31.78096');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320411', '江苏省', '常州市', '320400', '新北区', '320411', '119.974654', '31.824664');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320412', '江苏省', '常州市', '320400', '武进', '320412', '119.958773', '31.718566');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320413', '江苏省', '常州市', '320400', '金坛', '320413', '119.573395', '31.744399');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320481', '江苏省', '常州市', '320400', '溧阳', '320481', '119.487816', '31.427081');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320500', '江苏省', '苏州市', '320500', '苏州', '320500', '120.619585', '31.299379');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320505', '江苏省', '苏州市', '320500', '虎丘', '320505', '120.566833', '31.294845');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320506', '江苏省', '苏州市', '320500', '吴中', '320506', '120.624621', '31.270839');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320507', '江苏省', '苏州市', '320500', '相城', '320507', '120.618956', '31.396684');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320508', '江苏省', '苏州市', '320500', '姑苏', '320508', '120.622249', '31.311414');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320509', '江苏省', '苏州市', '320500', '吴江', '320509', '120.641601', '31.160404');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320571', '江苏省', '苏州市', '320500', '苏州工业园区', '320571', '120.72989', '31.33044');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320581', '江苏省', '苏州市', '320500', '常熟', '320581', '120.74852', '31.658156');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320582', '江苏省', '苏州市', '320500', '张家港', '320582', '120.543441', '31.865553');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320583', '江苏省', '苏州市', '320500', '昆山', '320583', '120.958137', '31.381925');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320585', '江苏省', '苏州市', '320500', '太仓', '320585', '121.112275', '31.452568');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320600', '江苏省', '南通市', '320600', '南通', '320600', '120.864608', '32.016212');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320602', '江苏省', '南通市', '320600', '崇川', '320602', '120.86635', '32.015278');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320611', '江苏省', '南通市', '320600', '港闸', '320611', '120.8339', '32.040299');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320612', '江苏省', '南通市', '320600', '通州区', '320612', '121.073171', '32.084287');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320623', '江苏省', '南通市', '320600', '如东', '320623', '121.186088', '32.311832');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320681', '江苏省', '南通市', '320600', '启东', '320681', '121.659724', '31.810158');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320682', '江苏省', '南通市', '320600', '如皋', '320682', '120.566324', '32.391591');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320684', '江苏省', '南通市', '320600', '海门', '320684', '121.176609', '31.893528');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320685', '江苏省', '南通市', '320600', '海安', '320685', '120.465995', '32.540289');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320700', '江苏省', '连云港市', '320700', '连云港', '320700', '119.178821', '34.600018');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320703', '江苏省', '连云港市', '320700', '连云', '320703', '119.347378', '34.763261');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320706', '江苏省', '连云港市', '320700', '海州', '320706', '119.179793', '34.601584');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320707', '江苏省', '连云港市', '320700', '赣榆', '320707', '119.128774', '34.839154');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320722', '江苏省', '连云港市', '320700', '东海', '320722', '118.766489', '34.522859');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320723', '江苏省', '连云港市', '320700', '灌云', '320723', '119.255741', '34.298436');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320724', '江苏省', '连云港市', '320700', '灌南', '320724', '119.352331', '34.092553');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320800', '江苏省', '淮安市', '320800', '淮安', '320800', '119.021265', '33.597506');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320803', '江苏省', '淮安市', '320800', '淮安区', '320803', '119.14634', '33.507499');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320804', '江苏省', '淮安市', '320800', '淮阴', '320804', '119.020817', '33.622452');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320812', '江苏省', '淮安市', '320800', '清江浦', '320812', '119.029713', '33.552726');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320813', '江苏省', '淮安市', '320800', '洪泽', '320813', '118.867875', '33.294975');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320826', '江苏省', '淮安市', '320800', '涟水', '320826', '119.266078', '33.771308');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320830', '江苏省', '淮安市', '320800', '盱眙', '320830', '118.493823', '33.00439');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320831', '江苏省', '淮安市', '320800', '金湖', '320831', '119.016936', '33.018162');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320900', '江苏省', '盐城市', '320900', '盐城', '320900', '120.139998', '33.377631');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320902', '江苏省', '盐城市', '320900', '亭湖', '320902', '120.136078', '33.383912');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320903', '江苏省', '盐城市', '320900', '盐都', '320903', '120.139753', '33.341288');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320904', '江苏省', '盐城市', '320900', '大丰', '320904', '120.470324', '33.199531');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320921', '江苏省', '盐城市', '320900', '响水', '320921', '119.579573', '34.19996');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320922', '江苏省', '盐城市', '320900', '滨海', '320922', '119.828434', '33.989888');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320923', '江苏省', '盐城市', '320900', '阜宁', '320923', '119.805338', '33.78573');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320924', '江苏省', '盐城市', '320900', '射阳', '320924', '120.257444', '33.773779');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320925', '江苏省', '盐城市', '320900', '建湖', '320925', '119.793105', '33.472621');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('320981', '江苏省', '盐城市', '320900', '东台', '320981', '120.314101', '32.853174');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('321000', '江苏省', '扬州市', '321000', '扬州', '321000', '119.421003', '32.393159');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('321002', '江苏省', '扬州市', '321000', '广陵', '321002', '119.442267', '32.392154');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('321003', '江苏省', '扬州市', '321000', '邗江', '321003', '119.397777', '32.377899');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('321012', '江苏省', '扬州市', '321000', '江都', '321012', '119.567481', '32.426564');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('321023', '江苏省', '扬州市', '321000', '宝应', '321023', '119.321284', '33.23694');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('321081', '江苏省', '扬州市', '321000', '仪征', '321081', '119.182443', '32.271965');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('321084', '江苏省', '扬州市', '321000', '高邮', '321084', '119.443842', '32.785164');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('321100', '江苏省', '镇江市', '321100', '镇江', '321100', '119.452753', '32.204402');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('321102', '江苏省', '镇江市', '321100', '京口', '321102', '119.454571', '32.206191');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('321111', '江苏省', '镇江市', '321100', '润州', '321111', '119.414877', '32.213501');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('321112', '江苏省', '镇江市', '321100', '丹徒', '321112', '119.433883', '32.128972');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('321181', '江苏省', '镇江市', '321100', '丹阳', '321181', '119.581911', '31.991459');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('321182', '江苏省', '镇江市', '321100', '扬中', '321182', '119.828054', '32.237266');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('321183', '江苏省', '镇江市', '321100', '句容', '321183', '119.167135', '31.947355');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('321200', '江苏省', '泰州市', '321200', '泰州', '321200', '119.915176', '32.484882');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('321202', '江苏省', '泰州市', '321200', '海陵', '321202', '119.920187', '32.488406');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('321203', '江苏省', '泰州市', '321200', '高港', '321203', '119.88166', '32.315701');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('321204', '江苏省', '泰州市', '321200', '姜堰', '321204', '120.148208', '32.508483');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('321281', '江苏省', '泰州市', '321200', '兴化', '321281', '119.840162', '32.938065');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('321282', '江苏省', '泰州市', '321200', '靖江', '321282', '120.26825', '32.018168');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('321283', '江苏省', '泰州市', '321200', '泰兴', '321283', '120.020228', '32.168784');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('321300', '江苏省', '宿迁市', '321300', '宿迁', '321300', '118.275162', '33.963008');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('321302', '江苏省', '宿迁市', '321300', '宿城', '321302', '118.278984', '33.937726');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('321311', '江苏省', '宿迁市', '321300', '宿豫', '321311', '118.330012', '33.941071');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('321322', '江苏省', '宿迁市', '321300', '沭阳', '321322', '118.775889', '34.129097');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('321323', '江苏省', '宿迁市', '321300', '泗阳', '321323', '118.681284', '33.711433');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('321324', '江苏省', '宿迁市', '321300', '泗洪', '321324', '118.211824', '33.456538');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330100', '浙江省', '杭州市', '330100', '杭州', '330100', '120.153576', '30.287459');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330102', '浙江省', '杭州市', '330100', '上城区', '330102', '120.171465', '30.250236');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330103', '浙江省', '杭州市', '330100', '下城区', '330103', '120.172763', '30.276271');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330104', '浙江省', '杭州市', '330100', '江干', '330104', '120.202633', '30.266603');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330105', '浙江省', '杭州市', '330100', '拱墅', '330105', '120.150053', '30.314697');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330106', '浙江省', '杭州市', '330100', '西湖', '330106', '120.147376', '30.272934');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330108', '浙江省', '杭州市', '330100', '滨江', '330108', '120.21062', '30.206615');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330109', '浙江省', '杭州市', '330100', '萧山', '330109', '120.27069', '30.162932');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330110', '浙江省', '杭州市', '330100', '余杭', '330110', '120.301737', '30.421187');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330111', '浙江省', '杭州市', '330100', '富阳', '330111', '119.949869', '30.049871');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330112', '浙江省', '杭州市', '330100', '临安', '330112', '119.715101', '30.231153');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330122', '浙江省', '杭州市', '330100', '桐庐', '330122', '119.685045', '29.797437');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330127', '浙江省', '杭州市', '330100', '淳安', '330127', '119.044276', '29.604177');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330182', '浙江省', '杭州市', '330100', '建德', '330182', '119.279089', '29.472284');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330200', '浙江省', '宁波市', '330200', '宁波', '330200', '121.549792', '29.868388');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330203', '浙江省', '宁波市', '330200', '海曙', '330203', '121.539698', '29.874452');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330205', '浙江省', '宁波市', '330200', '江北区', '330205', '121.559282', '29.888361');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330206', '浙江省', '宁波市', '330200', '北仑', '330206', '121.831303', '29.90944');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330211', '浙江省', '宁波市', '330200', '镇海', '330211', '121.713162', '29.952107');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330212', '浙江省', '宁波市', '330200', '鄞州', '330212', '121.558436', '29.831662');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330213', '浙江省', '宁波市', '330200', '奉化', '330213', '121.41089', '29.662348');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330225', '浙江省', '宁波市', '330200', '象山', '330225', '121.877091', '29.470206');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330226', '浙江省', '宁波市', '330200', '宁海', '330226', '121.432606', '29.299836');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330281', '浙江省', '宁波市', '330200', '余姚', '330281', '121.156294', '30.045404');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330282', '浙江省', '宁波市', '330200', '慈溪', '330282', '121.248052', '30.177142');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330300', '浙江省', '温州市', '330300', '温州', '330300', '120.672111', '28.000575');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330302', '浙江省', '温州市', '330300', '鹿城', '330302', '120.674231', '28.003352');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330303', '浙江省', '温州市', '330300', '龙湾', '330303', '120.763469', '27.970254');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330304', '浙江省', '温州市', '330300', '瓯海', '330304', '120.637145', '28.006444');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330305', '浙江省', '温州市', '330300', '洞头', '330305', '121.156181', '27.836057');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330324', '浙江省', '温州市', '330300', '永嘉', '330324', '120.690968', '28.153886');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330326', '浙江省', '温州市', '330300', '平阳', '330326', '120.564387', '27.6693');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330327', '浙江省', '温州市', '330300', '苍南', '330327', '120.406256', '27.507743');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330328', '浙江省', '温州市', '330300', '文成', '330328', '120.09245', '27.789133');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330329', '浙江省', '温州市', '330300', '泰顺', '330329', '119.71624', '27.557309');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330381', '浙江省', '温州市', '330300', '瑞安', '330381', '120.646171', '27.779321');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330382', '浙江省', '温州市', '330300', '乐清', '330382', '120.967147', '28.116083');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330400', '浙江省', '嘉兴市', '330400', '嘉兴', '330400', '120.750865', '30.762653');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330402', '浙江省', '嘉兴市', '330400', '南湖', '330402', '120.749953', '30.764652');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330411', '浙江省', '嘉兴市', '330400', '秀洲', '330411', '120.720431', '30.763323');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330421', '浙江省', '嘉兴市', '330400', '嘉善', '330421', '120.921871', '30.841352');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330424', '浙江省', '嘉兴市', '330400', '海盐', '330424', '120.942017', '30.522223');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330481', '浙江省', '嘉兴市', '330400', '海宁', '330481', '120.688821', '30.525544');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330482', '浙江省', '嘉兴市', '330400', '平湖', '330482', '121.014666', '30.698921');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330483', '浙江省', '嘉兴市', '330400', '桐乡', '330483', '120.551085', '30.629065');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330500', '浙江省', '湖州市', '330500', '湖州', '330500', '120.102398', '30.867198');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330502', '浙江省', '湖州市', '330500', '吴兴', '330502', '120.101416', '30.867252');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330503', '浙江省', '湖州市', '330500', '南浔', '330503', '120.417195', '30.872742');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330521', '浙江省', '湖州市', '330500', '德清', '330521', '119.967662', '30.534927');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330522', '浙江省', '湖州市', '330500', '长兴', '330522', '119.910122', '31.00475');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330523', '浙江省', '湖州市', '330500', '安吉', '330523', '119.687891', '30.631974');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330600', '浙江省', '绍兴市', '330600', '绍兴', '330600', '120.582112', '29.997117');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330602', '浙江省', '绍兴市', '330600', '越城', '330602', '120.585315', '29.996993');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330603', '浙江省', '绍兴市', '330600', '柯桥', '330603', '120.476075', '30.078038');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330604', '浙江省', '绍兴市', '330600', '上虞', '330604', '120.874185', '30.016769');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330624', '浙江省', '绍兴市', '330600', '新昌', '330624', '120.905665', '29.501205');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330681', '浙江省', '绍兴市', '330600', '诸暨', '330681', '120.244326', '29.713662');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330683', '浙江省', '绍兴市', '330600', '嵊州', '330683', '120.82888', '29.586606');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330700', '浙江省', '金华市', '330700', '金华', '330700', '119.649506', '29.089524');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330702', '浙江省', '金华市', '330700', '婺城', '330702', '119.652579', '29.082607');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330703', '浙江省', '金华市', '330700', '金东', '330703', '119.681264', '29.095835');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330723', '浙江省', '金华市', '330700', '武义', '330723', '119.819159', '28.896563');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330726', '浙江省', '金华市', '330700', '浦江', '330726', '119.893363', '29.451254');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330727', '浙江省', '金华市', '330700', '磐安', '330727', '120.44513', '29.052627');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330781', '浙江省', '金华市', '330700', '兰溪', '330781', '119.460521', '29.210065');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330782', '浙江省', '金华市', '330700', '义乌', '330782', '120.074911', '29.306863');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330783', '浙江省', '金华市', '330700', '东阳', '330783', '120.23334', '29.262546');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330784', '浙江省', '金华市', '330700', '永康', '330784', '120.036328', '28.895293');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330800', '浙江省', '衢州市', '330800', '衢州', '330800', '118.87263', '28.941708');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330802', '浙江省', '衢州市', '330800', '柯城', '330802', '118.873041', '28.944539');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330803', '浙江省', '衢州市', '330800', '衢江', '330803', '118.957683', '28.973195');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330822', '浙江省', '衢州市', '330800', '常山', '330822', '118.521654', '28.900039');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330824', '浙江省', '衢州市', '330800', '开化', '330824', '118.414435', '29.136503');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330825', '浙江省', '衢州市', '330800', '龙游', '330825', '119.172525', '29.031364');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330881', '浙江省', '衢州市', '330800', '江山', '330881', '118.627879', '28.734674');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330900', '浙江省', '舟山市', '330900', '舟山', '330900', '122.106863', '30.016028');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330902', '浙江省', '舟山市', '330900', '定海', '330902', '122.108496', '30.016423');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330903', '浙江省', '舟山市', '330900', '普陀', '330903', '122.301953', '29.945614');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330921', '浙江省', '舟山市', '330900', '岱山', '330921', '122.201132', '30.242865');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('330922', '浙江省', '舟山市', '330900', '嵊泗', '330922', '122.457809', '30.727166');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('331000', '浙江省', '台州市', '331000', '台州', '331000', '121.428599', '28.661378');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('331002', '浙江省', '台州市', '331000', '椒江', '331002', '121.431049', '28.67615');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('331003', '浙江省', '台州市', '331000', '黄岩', '331003', '121.262138', '28.64488');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('331004', '浙江省', '台州市', '331000', '路桥', '331004', '121.37292', '28.581799');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('331022', '浙江省', '台州市', '331000', '三门', '331022', '121.376429', '29.118955');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('331023', '浙江省', '台州市', '331000', '天台', '331023', '121.031227', '29.141126');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('331024', '浙江省', '台州市', '331000', '仙居', '331024', '120.735074', '28.849213');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('331081', '浙江省', '台州市', '331000', '温岭', '331081', '121.373611', '28.368781');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('331082', '浙江省', '台州市', '331000', '临海', '331082', '121.131229', '28.845441');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('331083', '浙江省', '台州市', '331000', '玉环', '331083', '121.232337', '28.12842');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('331100', '浙江省', '丽水市', '331100', '丽水', '331100', '119.921786', '28.451993');
INSERT INTO `greetingdb`.`provinces` (`district_id`, `province`, `city`, `city_geocode`, `district`, `district_geocode`, `lon`, `lat`) VALUES ('331102', '浙江省', '丽水市', '331100', '莲都', '331102', '119.922293', '28.451103');

-- ----------------------------
-- Table structure for service
-- ----------------------------
DROP TABLE IF EXISTS `service`;
CREATE TABLE `service`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `service_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '服务名',
  `service_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '服务类',
  `display` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否显示',
  `sort` int NOT NULL DEFAULT 99 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

INSERT INTO `greetingdb`.`service` (`id`, `service_name`, `service_class`, `display`, `sort`) VALUES (1, '天气预报', 'WeatherService', 0, 0);
INSERT INTO `greetingdb`.`service` (`id`, `service_name`, `service_class`, `display`, `sort`) VALUES (2, '舔狗日记', 'DogDiaryService', 1, 2);
INSERT INTO `greetingdb`.`service` (`id`, `service_name`, `service_class`, `display`, `sort`) VALUES (3, '正能量', 'PositiveEnergyService', 1, 3);
INSERT INTO `greetingdb`.`service` (`id`, `service_name`, `service_class`, `display`, `sort`) VALUES (4, '毒鸡汤', 'NegativeEnergyService', 1, 4);
INSERT INTO `greetingdb`.`service` (`id`, `service_name`, `service_class`, `display`, `sort`) VALUES (5, '每日一语', 'EveryDaySentenceService', 1, 5);
INSERT INTO `greetingdb`.`service` (`id`, `service_name`, `service_class`, `display`, `sort`) VALUES (6, '彩虹屁', 'RainbowFartService', 1, 6);
INSERT INTO `greetingdb`.`service` (`id`, `service_name`, `service_class`, `display`, `sort`) VALUES (7, '朋友圈', 'CircleOfFriendsService', 1, 7);
INSERT INTO `greetingdb`.`service` (`id`, `service_name`, `service_class`, `display`, `sort`) VALUES (8, '网易云', 'NeteaseCloudService', 1, 8);
INSERT INTO `greetingdb`.`service` (`id`, `service_name`, `service_class`, `display`, `sort`) VALUES (9, '自定义（未开通）', 'CustomerService', 1, 10);

-- ----------------------------
-- Procedure structure for delPerson
-- ----------------------------
DROP PROCEDURE IF EXISTS `delPerson`;
delimiter ;;
CREATE PROCEDURE `delPerson`(in p_id BIGINT)
BEGIN
	#Routine body goes here...
	-- 删除用户
	delete from greeting_service where greeting_id in (select id from person_greeting where person_id = p_id);
	delete from person_greeting where person_id = p_id;
	delete from person where id = p_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for personService
-- ----------------------------
DROP PROCEDURE IF EXISTS `personService`;
delimiter ;;
CREATE PROCEDURE `personService`(in p_id BIGINT, in p_open INT)
BEGIN
	#Routine body goes here...
	select p.open_greeting, p.email, p.memo, g.greeting_name, g.greeting_cron, s.service_name
	from person p
	left join person_greeting g on g.person_id = p.id
	left join greeting_service gs on g.id = gs.greeting_id
	left join service s on gs.service_id = s.id
	where p.id = p_id and p.open_greeting <> p_open
	order by p.id, g.greeting_name;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
