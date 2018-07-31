/*
Navicat MySQL Data Transfer

Source Server         : 本机
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : marketing_manager

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-07-31 12:48:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user_a
-- ----------------------------
DROP TABLE IF EXISTS `user_a`;
CREATE TABLE `user_a` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) DEFAULT NULL COMMENT '名称类型',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `consume_cycle` varchar(255) DEFAULT NULL COMMENT '消费周期',
  `intervel` varchar(255) DEFAULT NULL COMMENT '指标区间',
  `score` int(11) DEFAULT NULL COMMENT '得分',
  `membership` int(11) DEFAULT NULL COMMENT '会员人数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='A件单价表';

-- ----------------------------
-- Records of user_a
-- ----------------------------

-- ----------------------------
-- Table structure for user_c
-- ----------------------------
DROP TABLE IF EXISTS `user_c`;
CREATE TABLE `user_c` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) DEFAULT NULL COMMENT '名称类型',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `consume_cycle` varchar(255) DEFAULT NULL COMMENT '消费周期',
  `intervel` varchar(255) DEFAULT NULL COMMENT '指标区间',
  `score` int(11) DEFAULT NULL COMMENT '得分',
  `membership` int(11) DEFAULT NULL COMMENT '会员人数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='C年消费表';

-- ----------------------------
-- Records of user_c
-- ----------------------------

-- ----------------------------
-- Table structure for user_consume_record
-- ----------------------------
DROP TABLE IF EXISTS `user_consume_record`;
CREATE TABLE `user_consume_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_num` varchar(11) DEFAULT NULL COMMENT '单据号',
  `type` tinyint(4) DEFAULT NULL COMMENT '消费类型',
  `type_str` varchar(25) DEFAULT NULL COMMENT '消费类型',
  `payable` decimal(10,0) DEFAULT NULL COMMENT '应付金额',
  `payment` decimal(10,0) DEFAULT NULL COMMENT '实付金额',
  `cash` decimal(10,0) DEFAULT NULL COMMENT '现金支付',
  `store_value` decimal(10,0) DEFAULT NULL COMMENT '储值支付',
  `integral_offset` decimal(10,0) DEFAULT NULL COMMENT '积分抵现',
  `bank_card` decimal(10,0) DEFAULT NULL COMMENT '银行卡支付',
  `coupon` decimal(10,0) DEFAULT NULL COMMENT '优惠券支付',
  `other` decimal(10,0) DEFAULT NULL COMMENT '其他支付',
  `mobile` decimal(10,0) DEFAULT NULL COMMENT '移动支付',
  `obtain_integral` decimal(10,0) DEFAULT NULL COMMENT '获得积分',
  `notes` text COMMENT '备注',
  `shop` varchar(25) DEFAULT NULL COMMENT '消费店面',
  `shop_id` int(11) DEFAULT NULL COMMENT '消费店面id',
  `submit_time` datetime DEFAULT NULL COMMENT '提交时间',
  `consume_time` datetime DEFAULT NULL COMMENT '消费时间',
  `is_del` tinyint(4) DEFAULT NULL COMMENT '是否删除 0 未删除 1 已删除',
  `user_id` int(11) DEFAULT NULL COMMENT '会员id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='消费记录表';

-- ----------------------------
-- Records of user_consume_record
-- ----------------------------
INSERT INTO `user_consume_record` VALUES ('1', '11111', '1', '11', '11', '11', '11', '11', '11', null, null, null, null, null, null, null, null, null, null, null, '1');

-- ----------------------------
-- Table structure for user_coupon_list
-- ----------------------------
DROP TABLE IF EXISTS `user_coupon_list`;
CREATE TABLE `user_coupon_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_name` varchar(25) DEFAULT NULL COMMENT '优惠券名称',
  `coupon_num` int(11) DEFAULT NULL COMMENT '优惠券券号',
  `receive_num` int(11) DEFAULT NULL COMMENT '接收张数',
  `available_num` int(11) DEFAULT NULL COMMENT '可用张数',
  `validity` datetime DEFAULT NULL COMMENT '有效期',
  `operate_id` int(11) DEFAULT NULL COMMENT '操作员id',
  `operate` varchar(25) DEFAULT NULL COMMENT '操作员',
  `shop` varchar(25) DEFAULT NULL COMMENT '操作店面',
  `shop_id` int(11) DEFAULT NULL COMMENT '操作店面id',
  `time` datetime DEFAULT NULL COMMENT '发送时间',
  `notes` text COMMENT '备注',
  `is_del` varchar(25) DEFAULT NULL COMMENT '是否删除 0 未删除 1 已删除',
  `is_verify` tinyint(4) DEFAULT NULL COMMENT '是否核销 0 未核销 1已核销',
  `user_id` int(11) DEFAULT NULL COMMENT '会员id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='优惠券列表';

-- ----------------------------
-- Records of user_coupon_list
-- ----------------------------

-- ----------------------------
-- Table structure for user_discount
-- ----------------------------
DROP TABLE IF EXISTS `user_discount`;
CREATE TABLE `user_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_name` varchar(25) DEFAULT NULL COMMENT '规则名称',
  `rule_id` tinyint(4) DEFAULT NULL COMMENT '规则名称id',
  `belong_shop` varchar(25) DEFAULT NULL COMMENT '所属店面',
  `shop_id` int(11) DEFAULT NULL COMMENT '所属店面id',
  `project` varchar(25) DEFAULT NULL COMMENT '消费项目',
  `date` datetime DEFAULT NULL COMMENT '专属日期',
  `discount` decimal(10,0) DEFAULT NULL COMMENT '折扣',
  `integral_multiple` int(11) DEFAULT NULL COMMENT '积分倍数',
  `limit_date` varchar(25) DEFAULT NULL COMMENT '限定日期',
  `is_del` tinyint(4) DEFAULT NULL COMMENT '是否删除 0未删除1 已删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员折扣表';

-- ----------------------------
-- Records of user_discount
-- ----------------------------

-- ----------------------------
-- Table structure for user_exchange_rules
-- ----------------------------
DROP TABLE IF EXISTS `user_exchange_rules`;
CREATE TABLE `user_exchange_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `offset` decimal(10,0) DEFAULT NULL COMMENT '抵现百分比',
  `exchange` decimal(10,0) DEFAULT NULL COMMENT '积分兑换礼品百分比',
  `integral` int(11) DEFAULT NULL COMMENT '积分抵现(抵现的积分数)',
  `offset_limit` decimal(10,0) DEFAULT NULL COMMENT '抵现上限百分比',
  `level_id` tinyint(4) DEFAULT NULL COMMENT '会员级别序号',
  `level_name` varchar(25) DEFAULT NULL COMMENT '会员级别名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='积分兑换规则表';

-- ----------------------------
-- Records of user_exchange_rules
-- ----------------------------
INSERT INTO `user_exchange_rules` VALUES ('1', '55', '55', '55', '60', null, null);
INSERT INTO `user_exchange_rules` VALUES ('2', '44', '44', '44', '44', null, null);

-- ----------------------------
-- Table structure for user_f
-- ----------------------------
DROP TABLE IF EXISTS `user_f`;
CREATE TABLE `user_f` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) DEFAULT NULL COMMENT '名称类型',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `consume_cycle` varchar(255) DEFAULT NULL COMMENT '消费周期',
  `intervel` varchar(255) DEFAULT NULL COMMENT '指标区间',
  `score` int(11) DEFAULT NULL COMMENT '得分',
  `membership` int(11) DEFAULT NULL COMMENT '会员人数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='F次数表';

-- ----------------------------
-- Records of user_f
-- ----------------------------

-- ----------------------------
-- Table structure for user_gift_exchange
-- ----------------------------
DROP TABLE IF EXISTS `user_gift_exchange`;
CREATE TABLE `user_gift_exchange` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gift_id` int(11) DEFAULT NULL COMMENT '礼品编码',
  `gift_name` varchar(25) DEFAULT NULL COMMENT '礼品名称',
  `number` int(11) DEFAULT NULL COMMENT '礼品数量',
  `exchange_num` varchar(25) DEFAULT NULL COMMENT '兑换数量',
  `integral` int(11) DEFAULT NULL COMMENT '所需积分',
  `notes` text COMMENT '备注',
  `operate` varchar(25) DEFAULT NULL COMMENT '操作',
  `is_del` tinyint(4) DEFAULT NULL COMMENT '是否删除 0未删除1已删除',
  `user_id` int(11) DEFAULT NULL COMMENT '会员id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='礼品兑换表';

-- ----------------------------
-- Records of user_gift_exchange
-- ----------------------------

-- ----------------------------
-- Table structure for user_i
-- ----------------------------
DROP TABLE IF EXISTS `user_i`;
CREATE TABLE `user_i` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) DEFAULT NULL COMMENT '名称类型',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `consume_cycle` varchar(255) DEFAULT NULL COMMENT '消费周期',
  `intervel` varchar(255) DEFAULT NULL COMMENT '指标区间',
  `score` int(11) DEFAULT NULL COMMENT '得分',
  `membership` int(11) DEFAULT NULL COMMENT '会员人数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='I转介数表';

-- ----------------------------
-- Records of user_i
-- ----------------------------

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '会员id',
  `card_number` int(11) DEFAULT NULL COMMENT '会员卡号',
  `user_name` varchar(25) DEFAULT NULL COMMENT '会员姓名',
  `sex_id` tinyint(4) DEFAULT NULL COMMENT '性别id 1男 2 女 0保密',
  `sex` varchar(25) DEFAULT NULL COMMENT '性别',
  `nation` varchar(25) DEFAULT NULL COMMENT '民族',
  `id_number` char(18) DEFAULT NULL COMMENT '身份证号',
  `birthday_type` tinyint(4) DEFAULT NULL COMMENT '生日类型 1公历 2 农历',
  `birthday` varchar(25) DEFAULT NULL COMMENT '生日',
  `admission_type` tinyint(4) DEFAULT NULL COMMENT '入会类型',
  `admission_method` varchar(25) DEFAULT NULL COMMENT '入会方式',
  `phone` int(11) DEFAULT NULL COMMENT '手机号码',
  `tel_phone` int(11) DEFAULT NULL COMMENT '固定电话',
  `email` varchar(25) DEFAULT NULL COMMENT '邮箱',
  `level_id` int(11) DEFAULT NULL COMMENT '会员级别序号',
  `level_name` varchar(25) DEFAULT NULL COMMENT '会员级别',
  `adviser` varchar(25) DEFAULT NULL COMMENT '形象顾问',
  `referee_card` int(11) DEFAULT NULL COMMENT '推荐人卡号',
  `referee` varchar(25) DEFAULT NULL COMMENT '推荐人',
  `card` int(11) DEFAULT NULL COMMENT '会员卡号',
  `sale_amount` decimal(10,0) DEFAULT NULL COMMENT '售卡金额',
  `commission` varchar(25) DEFAULT NULL COMMENT '提成人',
  `payment_method` varchar(25) DEFAULT NULL COMMENT '支付方式',
  `payment_type` tinyint(4) DEFAULT NULL COMMENT '支付方式 1支付宝 2微信 3 银行卡 4 现金',
  `shop_belong_code` varchar(25) DEFAULT NULL COMMENT '所属门店地区代码',
  `shop_belong` varchar(25) DEFAULT NULL COMMENT '所属门店',
  `shop_register_code` varchar(25) DEFAULT NULL COMMENT '登记门店地区码',
  `shop_register` varchar(25) DEFAULT NULL COMMENT '登记门店',
  `brand_id` int(11) DEFAULT NULL COMMENT '品牌id',
  `brand` varchar(25) DEFAULT NULL COMMENT '品牌',
  `wx` varchar(11) DEFAULT NULL COMMENT '微信号',
  `qq` varchar(25) DEFAULT NULL COMMENT 'qq号',
  `is_validity` tinyint(4) DEFAULT NULL COMMENT '是否有有效期 0没有 1 有',
  `is_print` tinyint(4) DEFAULT NULL COMMENT '是否打印 0不打印 1 打印',
  `picture` varchar(25) DEFAULT NULL COMMENT '照片',
  `region_code` varchar(25) DEFAULT NULL COMMENT '所属地区码',
  `region` varchar(25) DEFAULT NULL COMMENT '所属地区',
  `address` varchar(25) DEFAULT NULL COMMENT '详细地址',
  `notes` text COMMENT '备注',
  `residual_integral` int(11) DEFAULT NULL COMMENT '剩余总积分',
  `used_integral` int(11) DEFAULT NULL COMMENT '已用积分',
  `offset_integral` int(11) DEFAULT NULL COMMENT '剩余抵现积分',
  `gift_integral` int(11) DEFAULT NULL COMMENT '剩余礼品积分',
  `total_integral` varchar(25) DEFAULT NULL COMMENT '总积分',
  `stored` varchar(255) DEFAULT NULL COMMENT '已用储值',
  `residual_storage` varchar(255) DEFAULT NULL COMMENT '剩余储值',
  `total_storage` varchar(255) DEFAULT NULL COMMENT '总储值',
  `frozen_storage` varchar(255) DEFAULT NULL COMMENT '总冻结储值',
  `consume_times` int(11) DEFAULT NULL COMMENT '消费次数',
  `consume_piece` int(11) DEFAULT NULL COMMENT '消费件数',
  `total_consume` decimal(10,0) DEFAULT NULL COMMENT '总消费额',
  `expire_time` datetime DEFAULT NULL COMMENT '到期时间',
  `first_shopping` datetime DEFAULT NULL COMMENT '首次购物时间',
  `last_shopping` datetime DEFAULT NULL COMMENT '最后购物时间',
  `recent_shopping` datetime DEFAULT NULL COMMENT '最近购物日期',
  `sonsume_days` int(11) DEFAULT NULL COMMENT '消费天数',
  `consume_years` int(11) DEFAULT NULL COMMENT '消费年数',
  `exchange_times` int(11) DEFAULT NULL COMMENT '兑换次数',
  `total_referral` varchar(255) DEFAULT NULL COMMENT '总转介绍',
  `del` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除 0 未删除 1 删除',
  `r_name` varchar(255) DEFAULT NULL COMMENT '末消费的天数',
  `r_type` tinyint(4) DEFAULT NULL COMMENT '类型',
  `r_score` int(11) DEFAULT NULL COMMENT '得分',
  `f_name` varchar(255) DEFAULT NULL COMMENT 'F(次数)',
  `f_type` tinyint(4) DEFAULT NULL COMMENT '类型',
  `f_score` int(11) DEFAULT NULL COMMENT '得分',
  `m_name` varchar(255) DEFAULT NULL COMMENT 'M(金额)',
  `m_type` tinyint(4) DEFAULT NULL COMMENT '类型',
  `m_score` int(11) DEFAULT NULL COMMENT '得分',
  `i_name` varchar(255) DEFAULT NULL COMMENT 'I(转介绍)',
  `i_type` tinyint(4) DEFAULT NULL COMMENT '类型',
  `i_score` int(11) DEFAULT NULL COMMENT '得分',
  `rfmi_score` int(11) DEFAULT NULL COMMENT 'RFMI(总得分)',
  `n_name` varchar(255) DEFAULT NULL COMMENT 'N(件数)',
  `n_type` tinyint(4) DEFAULT NULL COMMENT '类型',
  `n_score` int(11) DEFAULT NULL COMMENT '得分',
  `p_name` varchar(255) DEFAULT NULL COMMENT 'P(客单件)',
  `p_type` tinyint(4) DEFAULT NULL COMMENT '类型',
  `p_score` int(11) DEFAULT NULL COMMENT '得分',
  `a_name` varchar(255) DEFAULT NULL COMMENT 'A(件单价)',
  `a_type` tinyint(4) DEFAULT NULL COMMENT '类型',
  `a_score` int(11) DEFAULT NULL COMMENT '得分',
  `j_name` varchar(255) DEFAULT NULL COMMENT 'J(连带率)',
  `j_type` tinyint(4) DEFAULT NULL COMMENT '类型',
  `j_score` int(11) DEFAULT NULL COMMENT '得分',
  `c_name` varchar(255) DEFAULT NULL COMMENT 'C(年消费)',
  `c_type` tinyint(4) DEFAULT NULL COMMENT '类型',
  `c_score` int(11) DEFAULT NULL COMMENT '得分',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='会员信息表';

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', '1', '1', '22', '1', '1', null, '11', '1', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('2', '2', '123456', '测试1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for user_integral_record
-- ----------------------------
DROP TABLE IF EXISTS `user_integral_record`;
CREATE TABLE `user_integral_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `integral` int(11) DEFAULT NULL COMMENT '积分',
  `way` tinyint(4) DEFAULT NULL COMMENT '途径',
  `way_str` varchar(25) DEFAULT NULL COMMENT '途径',
  `doc_num` varchar(25) DEFAULT NULL COMMENT '单据号',
  `surplus` int(11) DEFAULT NULL COMMENT '当前余额',
  `notes` text COMMENT '备注',
  `operate` varchar(25) DEFAULT NULL COMMENT '操作员',
  `operate_id` int(11) DEFAULT NULL COMMENT '操作员',
  `shop` varchar(25) DEFAULT NULL COMMENT '操作店面',
  `shop_id` int(11) DEFAULT NULL COMMENT '操作店面',
  `time` datetime DEFAULT NULL COMMENT '积分时间',
  `is_revoke` tinyint(4) DEFAULT NULL COMMENT '是否撤销 0未撤销 1已撤销',
  `is_del` tinyint(4) DEFAULT NULL COMMENT '是否删除 0未删除 1已删除',
  `user_id` int(11) DEFAULT NULL COMMENT '会员id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='积分记录表';

-- ----------------------------
-- Records of user_integral_record
-- ----------------------------

-- ----------------------------
-- Table structure for user_integral_rules
-- ----------------------------
DROP TABLE IF EXISTS `user_integral_rules`;
CREATE TABLE `user_integral_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) DEFAULT NULL COMMENT '积分规则类型1满件积分2消费积分',
  `full_amount` decimal(10,0) DEFAULT NULL COMMENT '消费满金额',
  `piece` int(11) DEFAULT NULL COMMENT '件数',
  `consume_amount` decimal(10,0) DEFAULT NULL COMMENT '消费金额',
  `integral` int(11) DEFAULT NULL COMMENT '积分',
  `level_id` tinyint(4) DEFAULT NULL COMMENT '会员级别序号',
  `level_name` varchar(25) DEFAULT NULL COMMENT '会员级别名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='积分规则表';

-- ----------------------------
-- Records of user_integral_rules
-- ----------------------------
INSERT INTO `user_integral_rules` VALUES ('1', '1', '50', '3', null, '50', null, null);
INSERT INTO `user_integral_rules` VALUES ('2', '2', '100', null, null, '80', null, null);

-- ----------------------------
-- Table structure for user_j
-- ----------------------------
DROP TABLE IF EXISTS `user_j`;
CREATE TABLE `user_j` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) DEFAULT NULL COMMENT '名称类型',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `consume_cycle` varchar(255) DEFAULT NULL COMMENT '消费周期',
  `intervel` varchar(255) DEFAULT NULL COMMENT '指标区间',
  `score` int(11) DEFAULT NULL COMMENT '得分',
  `membership` int(11) DEFAULT NULL COMMENT '会员人数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='J连带率表';

-- ----------------------------
-- Records of user_j
-- ----------------------------

-- ----------------------------
-- Table structure for user_level
-- ----------------------------
DROP TABLE IF EXISTS `user_level`;
CREATE TABLE `user_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员级别id',
  `level_id` int(11) DEFAULT NULL COMMENT '会员级别序号',
  `level_name` varchar(10) DEFAULT NULL COMMENT '会员级别名称',
  `sale_card_amount` int(11) DEFAULT NULL COMMENT '售卡金额',
  `validity_type` tinyint(4) DEFAULT NULL COMMENT '有效期类型',
  `validity` varchar(25) DEFAULT NULL COMMENT '有效期',
  `referral_integral` int(11) DEFAULT NULL COMMENT '推荐人积分',
  `function` tinyint(4) DEFAULT NULL COMMENT '推荐功能0关闭1开启',
  `cards_num` int(11) DEFAULT NULL COMMENT '卡片总数',
  `wx_member` tinyint(4) DEFAULT NULL COMMENT '微信会员 0不是 1 是',
  `rights` varchar(255) DEFAULT NULL COMMENT '会员权益',
  `notes` text COMMENT '备注',
  `is_del` tinyint(4) NOT NULL DEFAULT '0' COMMENT '物理删除 0 未删除1删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='会员级别表';

-- ----------------------------
-- Records of user_level
-- ----------------------------
INSERT INTO `user_level` VALUES ('1', '1', '333', '30', '1', 'asfd', '100', '0', '5', '0', null, '423', '0');
INSERT INTO `user_level` VALUES ('9', '2', 'huangtong', '50', null, null, null, null, null, null, null, null, '1');
INSERT INTO `user_level` VALUES ('10', '3', 'huangtong', '50', null, null, null, null, null, null, null, null, '0');
INSERT INTO `user_level` VALUES ('11', '4', 'huangtong', '50', null, null, null, null, null, null, null, null, '0');
INSERT INTO `user_level` VALUES ('12', '5', 'huangtong', '50', null, null, null, null, null, null, null, null, '0');
INSERT INTO `user_level` VALUES ('13', '6', 'huangtong', '50', null, null, null, null, null, null, null, null, '0');
INSERT INTO `user_level` VALUES ('14', '7', 'huangtong', '50', null, null, null, null, null, null, null, null, '0');
INSERT INTO `user_level` VALUES ('15', '8', 'huangtong', '50', null, null, null, null, null, null, null, null, '1');
INSERT INTO `user_level` VALUES ('16', '9', 'huangtong', '50', null, null, null, null, null, null, null, null, '1');
INSERT INTO `user_level` VALUES ('17', '10', 'huangtong', '50', null, null, null, null, null, null, null, null, '1');
INSERT INTO `user_level` VALUES ('18', '5', 'huangtong', '50', null, null, null, null, null, null, null, null, '1');
INSERT INTO `user_level` VALUES ('19', '5', 'huangtong', '50', null, null, null, null, null, null, null, null, '1');

-- ----------------------------
-- Table structure for user_level_validity
-- ----------------------------
DROP TABLE IF EXISTS `user_level_validity`;
CREATE TABLE `user_level_validity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `validity_id` tinyint(4) DEFAULT NULL COMMENT '级别有效期id',
  `validity` varchar(25) DEFAULT NULL COMMENT '级别有效期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员级别有效期表';

-- ----------------------------
-- Records of user_level_validity
-- ----------------------------

-- ----------------------------
-- Table structure for user_m
-- ----------------------------
DROP TABLE IF EXISTS `user_m`;
CREATE TABLE `user_m` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) DEFAULT NULL COMMENT '名称类型',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `consume_cycle` varchar(255) DEFAULT NULL COMMENT '消费周期',
  `intervel` varchar(255) DEFAULT NULL COMMENT '指标区间',
  `score` int(11) DEFAULT NULL COMMENT '得分',
  `membership` int(11) DEFAULT NULL COMMENT '会员人数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='M金额表';

-- ----------------------------
-- Records of user_m
-- ----------------------------

-- ----------------------------
-- Table structure for user_n
-- ----------------------------
DROP TABLE IF EXISTS `user_n`;
CREATE TABLE `user_n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) DEFAULT NULL COMMENT '名称类型',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `consume_cycle` varchar(255) DEFAULT NULL COMMENT '消费周期',
  `intervel` varchar(255) DEFAULT NULL COMMENT '指标区间',
  `score` int(11) DEFAULT NULL COMMENT '得分',
  `membership` int(11) DEFAULT NULL COMMENT '会员人数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='N件数表';

-- ----------------------------
-- Records of user_n
-- ----------------------------

-- ----------------------------
-- Table structure for user_p
-- ----------------------------
DROP TABLE IF EXISTS `user_p`;
CREATE TABLE `user_p` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) DEFAULT NULL COMMENT '名称类型',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `consume_cycle` varchar(255) DEFAULT NULL COMMENT '消费周期',
  `intervel` varchar(255) DEFAULT NULL COMMENT '指标区间',
  `score` int(11) DEFAULT NULL COMMENT '得分',
  `membership` int(11) DEFAULT NULL COMMENT '会员人数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='P客单价表';

-- ----------------------------
-- Records of user_p
-- ----------------------------

-- ----------------------------
-- Table structure for user_pieces
-- ----------------------------
DROP TABLE IF EXISTS `user_pieces`;
CREATE TABLE `user_pieces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pieces` int(11) DEFAULT NULL COMMENT '件数',
  `total_pieces` int(11) DEFAULT NULL COMMENT '总消费件数',
  `notes` text COMMENT '备注',
  `operate_id` int(11) DEFAULT NULL COMMENT '操作员id',
  `operate` varchar(25) DEFAULT NULL COMMENT '操作员',
  `shop_id` int(11) DEFAULT NULL COMMENT '操作店面id',
  `shop` varchar(25) DEFAULT NULL COMMENT '操作店面',
  `time` datetime DEFAULT NULL COMMENT '积分时间',
  `is_revoke` tinyint(4) DEFAULT NULL COMMENT '是否撤销 0 未撤销 1 已撤销',
  `is_del` tinyint(4) DEFAULT NULL COMMENT '是否删除 0 未删除 1已删除',
  `user_id` int(11) DEFAULT NULL COMMENT '会员id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='消费件数表';

-- ----------------------------
-- Records of user_pieces
-- ----------------------------

-- ----------------------------
-- Table structure for user_r
-- ----------------------------
DROP TABLE IF EXISTS `user_r`;
CREATE TABLE `user_r` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) DEFAULT NULL COMMENT '名称类型',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `intervel` varchar(255) DEFAULT NULL COMMENT '指标区间',
  `score` int(11) DEFAULT NULL COMMENT '得分',
  `membership` int(11) DEFAULT NULL COMMENT '会员人数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='R时间表';

-- ----------------------------
-- Records of user_r
-- ----------------------------

-- ----------------------------
-- Table structure for user_recharge_rules
-- ----------------------------
DROP TABLE IF EXISTS `user_recharge_rules`;
CREATE TABLE `user_recharge_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) DEFAULT NULL COMMENT '类型 1 规则充值 2 快速充值 3消费返利',
  `level_id` int(11) DEFAULT NULL COMMENT '会员级别序号',
  `level_name` varchar(25) DEFAULT NULL COMMENT '会员级别',
  `recharge_amount` decimal(10,0) DEFAULT NULL COMMENT '充值金额（元）',
  `present_amount` decimal(10,0) DEFAULT NULL COMMENT '额外赠送（元）',
  `present_intergral` int(11) DEFAULT NULL COMMENT '赠送（积分）',
  `duration` varchar(25) DEFAULT NULL COMMENT '使用期限',
  `store_value_ratio` decimal(10,0) DEFAULT NULL COMMENT '赠送储值比例',
  `intergal_ratio` decimal(10,0) DEFAULT NULL COMMENT '赠送积分比例',
  `rebates` decimal(10,0) DEFAULT NULL COMMENT '消费返利',
  `consume_amount` decimal(10,0) DEFAULT NULL COMMENT '消费金额',
  `is_del` tinyint(4) NOT NULL DEFAULT '0' COMMENT '物理删除 0 未删除1删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='充值规则表';

-- ----------------------------
-- Records of user_recharge_rules
-- ----------------------------
INSERT INTO `user_recharge_rules` VALUES ('1', '1', '1', '最强王者', '100', '10', '10', '6个月', '20', '20', '20', '500', '0');

-- ----------------------------
-- Table structure for user_return_bill
-- ----------------------------
DROP TABLE IF EXISTS `user_return_bill`;
CREATE TABLE `user_return_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) DEFAULT NULL COMMENT '编号',
  `project` varchar(25) DEFAULT NULL COMMENT '消费项目',
  `amount` decimal(10,0) DEFAULT NULL COMMENT '金额',
  `number` int(11) DEFAULT NULL COMMENT '数量',
  `return_num` int(11) DEFAULT NULL COMMENT '退货数量',
  `notes` text COMMENT '备注',
  `user_id` int(11) DEFAULT NULL COMMENT '会员id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='退货单列表';

-- ----------------------------
-- Records of user_return_bill
-- ----------------------------

-- ----------------------------
-- Table structure for user_services
-- ----------------------------
DROP TABLE IF EXISTS `user_services`;
CREATE TABLE `user_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level_name` varchar(25) DEFAULT NULL COMMENT '会员级别名称',
  `level_id` int(11) DEFAULT NULL COMMENT '会员级别序号',
  `services_id` tinyint(4) DEFAULT NULL COMMENT '服务id',
  `services_name` varchar(25) DEFAULT NULL COMMENT '服务名称',
  `services_times` int(11) DEFAULT NULL COMMENT '服务次数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='会员服务表';

-- ----------------------------
-- Records of user_services
-- ----------------------------
INSERT INTO `user_services` VALUES ('0', '最强王者', '1', null, '飘落', '55');
INSERT INTO `user_services` VALUES ('2', '钻石级别', '2', null, '散落', '44');

-- ----------------------------
-- Table structure for user_service_plan
-- ----------------------------
DROP TABLE IF EXISTS `user_service_plan`;
CREATE TABLE `user_service_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '会员id',
  `user_name` varchar(25) DEFAULT NULL COMMENT '会员',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  `theme` varchar(25) DEFAULT NULL COMMENT '主题',
  `time` datetime DEFAULT NULL COMMENT '服务时间',
  `project` varchar(25) DEFAULT NULL COMMENT '服务项目',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='服务计划表';

-- ----------------------------
-- Records of user_service_plan
-- ----------------------------

-- ----------------------------
-- Table structure for user_standard
-- ----------------------------
DROP TABLE IF EXISTS `user_standard`;
CREATE TABLE `user_standard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level_id` int(11) DEFAULT NULL COMMENT '会员级别编号',
  `level_name` varchar(25) DEFAULT NULL COMMENT '会员级别名称',
  `duration` varchar(25) DEFAULT NULL COMMENT '时间',
  `referrals_num` int(11) DEFAULT NULL COMMENT '转介绍人数',
  `total_amount` int(11) DEFAULT NULL COMMENT '消费总金额',
  `total_integral` decimal(10,0) DEFAULT NULL COMMENT '累计总积分',
  `first_amount` decimal(10,0) DEFAULT NULL COMMENT '首次消费金额',
  `once_amount` decimal(10,0) DEFAULT NULL COMMENT '单次消费金额',
  `once_recharge_amount` decimal(10,0) DEFAULT NULL COMMENT '单次充值金额',
  `auto_upgrade` tinyint(4) NOT NULL DEFAULT '0' COMMENT '自动升级是否开启 0关闭 1 开启',
  `reminder_upgrade` tinyint(4) NOT NULL DEFAULT '0' COMMENT '提示升级开启或关闭 0关闭 1开启',
  `is_del` tinyint(4) NOT NULL DEFAULT '0' COMMENT '物理删除 0 未删除1删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='晋升标准表';

-- ----------------------------
-- Records of user_standard
-- ----------------------------
INSERT INTO `user_standard` VALUES ('1', '1', '最强王者', '6个月', '3', '1111', '111', '11', '11', '11', '0', '0', '0');
INSERT INTO `user_standard` VALUES ('2', '2', '钻石级别', '6个月', '5', '222', '22', '2', '2', '2', '0', '0', '0');

-- ----------------------------
-- Table structure for user_store_record
-- ----------------------------
DROP TABLE IF EXISTS `user_store_record`;
CREATE TABLE `user_store_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,0) DEFAULT NULL COMMENT '储值金额',
  `type` tinyint(4) DEFAULT NULL COMMENT '途径',
  `type_str` varchar(25) DEFAULT NULL COMMENT '途径',
  `doc_num` int(11) DEFAULT NULL COMMENT '单据号',
  `receipts` decimal(10,0) DEFAULT NULL COMMENT '实收金额',
  `surplus` decimal(10,0) DEFAULT NULL COMMENT '当前余额',
  `operate_id` int(11) DEFAULT NULL COMMENT '操作员id',
  `operate` varchar(25) DEFAULT NULL COMMENT '操作员',
  `operate_time` datetime DEFAULT NULL COMMENT '操作时间',
  `notes` text COMMENT '备注',
  `is_revoke` tinyint(4) DEFAULT NULL COMMENT '是否撤销 0 未撤销1 已撤销',
  `is_del` tinyint(4) DEFAULT NULL COMMENT '是否删除 0未删除 1已删除 ',
  `user_id` int(11) DEFAULT NULL COMMENT '会员id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='储值记录表';

-- ----------------------------
-- Records of user_store_record
-- ----------------------------

-- ----------------------------
-- Table structure for user_times
-- ----------------------------
DROP TABLE IF EXISTS `user_times`;
CREATE TABLE `user_times` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) DEFAULT NULL COMMENT '消费类型',
  `type_str` varchar(25) DEFAULT NULL COMMENT '消费类型',
  `way` tinyint(4) DEFAULT NULL COMMENT '途径',
  `way_str` varchar(25) DEFAULT NULL COMMENT '途径',
  `doc_num` int(11) DEFAULT NULL COMMENT '单据号',
  `product_name` varchar(25) DEFAULT NULL COMMENT '产品名称',
  `payable` decimal(10,0) DEFAULT NULL COMMENT '应付金额',
  `payment` decimal(10,0) DEFAULT NULL COMMENT '实付金额',
  `total_times` int(11) DEFAULT NULL COMMENT '总次数',
  `available_times` int(11) DEFAULT NULL COMMENT '可用次数',
  `used_times` int(11) DEFAULT NULL COMMENT '已用次数',
  `overdue_times` int(11) DEFAULT NULL COMMENT '过期次数',
  `notes` text COMMENT '备注',
  `operate_id` int(11) DEFAULT NULL COMMENT '操作员id',
  `operate` varchar(25) DEFAULT NULL COMMENT '操作员',
  `shop_id` int(11) DEFAULT NULL COMMENT '操作店面id',
  `shop` varchar(25) DEFAULT NULL COMMENT '操作店面',
  `time` datetime DEFAULT NULL COMMENT '积分时间',
  `is_revoke` tinyint(4) DEFAULT NULL COMMENT '是否撤销0未撤销1已撤销',
  `is_del` tinyint(4) DEFAULT NULL COMMENT '是否删除 0 未删除 1 已删除',
  `user_id` int(11) DEFAULT NULL COMMENT '会员id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='消费次数表';

-- ----------------------------
-- Records of user_times
-- ----------------------------

-- ----------------------------
-- Table structure for user_track_record
-- ----------------------------
DROP TABLE IF EXISTS `user_track_record`;
CREATE TABLE `user_track_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '会员id',
  `content` text COMMENT '内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `creator` varchar(25) DEFAULT NULL COMMENT '创建人',
  `operate` varchar(25) DEFAULT NULL COMMENT '操作',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='跟踪记录表';

-- ----------------------------
-- Records of user_track_record
-- ----------------------------
