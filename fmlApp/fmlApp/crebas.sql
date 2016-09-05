/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50713
Source Host           : localhost:3306
Source Database       : fml

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2016-09-04 10:09:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_agency`
-- ----------------------------
DROP TABLE IF EXISTS `tb_agency`;
CREATE TABLE `tb_agency` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) DEFAULT NULL COMMENT '1:逻辑删除',
  `AGENCY_CODE` varchar(16) DEFAULT NULL COMMENT '机构编码',
  `NAME` varchar(32) DEFAULT NULL COMMENT '机构名称',
  `BUSINESS_CITY_ID` bigint(20) DEFAULT NULL COMMENT '业务城市ID',
  `BUSINESS_CITY_NAME` varchar(64) DEFAULT NULL COMMENT '业务城市名称',
  `AUTHENTICATION` char(1) DEFAULT NULL COMMENT '是否已认证：0 审核中、1 已认证、2 未通过\r\n            ',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='中介公司';

-- ----------------------------
-- Records of tb_agency
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_building`
-- ----------------------------
DROP TABLE IF EXISTS `tb_building`;
CREATE TABLE `tb_building` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) DEFAULT NULL COMMENT '1:逻辑删除',
  `TYPE` char(1) DEFAULT NULL COMMENT '楼盘类型：1：房麦乐电商楼盘，2：放麦乐分销楼盘',
  `NAME` varchar(256) DEFAULT NULL COMMENT '楼盘名称',
  `AVERAGE_PRICE` decimal(8,2) DEFAULT NULL COMMENT '均价',
  `ADDRESS` varchar(256) DEFAULT NULL COMMENT '楼盘地址',
  `NEWS_UPDATE` varchar(256) DEFAULT NULL COMMENT '最新动态。此字段需要删除，已经添加最新动态表',
  `LEAD_TIME` varchar(256) DEFAULT NULL COMMENT '入住时间',
  `PROPERTY_TYPE` varchar(32) DEFAULT NULL COMMENT '物业类型',
  `BUILDING_TYPE` varchar(32) DEFAULT NULL COMMENT '建筑类型',
  `RENOVATION_STATUS` varchar(32) DEFAULT NULL COMMENT '装修状况',
  `HOUSEHOLDS` varchar(32) DEFAULT NULL COMMENT '住户数',
  `VOLUME_RATIO` varchar(8) DEFAULT NULL COMMENT '容积率',
  `GREENING_RATE` varchar(8) DEFAULT NULL COMMENT '绿化率',
  `PARKING_SPACE` varchar(256) DEFAULT NULL COMMENT '停车位',
  `PERIOD_OF_RIGHTS` varchar(32) DEFAULT NULL COMMENT '产权年限',
  `DEVELOPERS_ID` bigint(20) DEFAULT NULL COMMENT '开发商ID',
  `DEVELOPERS_NAME` varchar(128) DEFAULT NULL COMMENT '开发商名称',
  `PRE_SALE_PERMIT` varchar(256) DEFAULT NULL COMMENT '预售许可',
  `PROPERTY_FEE` varchar(64) DEFAULT NULL COMMENT '物业费',
  `PROPERTY_COMPANY` varchar(256) DEFAULT NULL COMMENT '物业公司名称',
  `DEVELOPERS_DESC` varchar(256) DEFAULT NULL COMMENT '开发商说明',
  `DESCP` varchar(256) DEFAULT NULL COMMENT '楼盘描述',
  `FLAG` varchar(32) DEFAULT NULL COMMENT '标签，值为定义在ts_code_detail里的code',
  `AREAID` bigint(20) DEFAULT NULL COMMENT '区域id',
  `AREA_LEVEL` int(11) DEFAULT NULL COMMENT '区域行政级别',
  `LONGITUDE` decimal(10,6) DEFAULT NULL COMMENT '经度',
  `LATITUDE` decimal(10,6) DEFAULT NULL COMMENT '纬度',
  `ZOOM` int(11) DEFAULT NULL COMMENT '地图放大级别',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='楼盘表';

-- ----------------------------
-- Records of tb_building
-- ----------------------------
INSERT INTO `tb_building` VALUES ('1', '2016-07-30 22:40:51', '2016-07-30 22:40:53', '0', '1', '印象欧洲', '60000.00', '虎丘区上园路四号', '3月1日加推21#精装公寓', '预计2016年下半年15#、18#交房', '住宅', '板楼，小高层，高层', '毛坯', '1583户', '1.80', '30%', '住宅：机动车1588辆，非机动车2375辆；商业：机动车474辆，非机动车568辆', '70年', '1', '苏州金辉鑫元置业有限公司', '苏房预高新2016016号', '2.37元', '金辉物业', '', '印象欧洲占地面积50多万平米，约9900户。整体规划有...', 'NEW', '1', '1', '22.000000', '11.000000', '1');
INSERT INTO `tb_building` VALUES ('9', null, null, '1', '1', 'asfaa', '11.00', '11', null, '11', '11', '11', '1', '111', '1', '1', '1', '1', null, '1', '1', '1', '1', '1', '1', null, '1', '1', '1.000000', '1.000000', '1');
INSERT INTO `tb_building` VALUES ('10', null, null, '1', '1', '1122311', '1.00', '1', null, '1', '1', '1', '1', '1', '1', '1', '111111111', '1', null, '22', '1', '1', '1', '12', '', null, '2', '1', '1.000000', '1.000000', '1');
INSERT INTO `tb_building` VALUES ('11', null, null, '1', '1', 'dsas', '1111.00', '111', null, '11', '111', '11', '1', '111', '1', '1', '1', 'qqww', null, 'q', '111', '1', 'dd', '111', 'dadaasfafa', null, '1', '1', '1.000000', '1.000000', '1');
INSERT INTO `tb_building` VALUES ('12', null, null, '0', '1', '中新翡翠', '50000.00', '苏州', null, '201608', '1', '高层', '精装', '1000', '12%', '90%', '1222', '70', null, '房麦乐', '许可', '1111', '房麦乐', '房麦乐', '房麦乐', null, '1', '1', '12.000000', '11.000000', '1');
INSERT INTO `tb_building` VALUES ('13', null, null, '1', '1', '荷澜庭', '2222.00', '苏州', null, '2018', '1', '1', '毛坯', '1000', '111', '20%', '111', '70', null, '11', '222', '22', '啊啊', '2222', '环境优美', null, '1', '1', '2.000000', '2.000000', '1');
INSERT INTO `tb_building` VALUES ('14', null, null, '1', '1', '1', '1.00', '1', null, '1', '1', '1', '1', '1', '1', '1', '1', '1', null, '1', '1', '1', '1', '1', '1', null, '1', '1', '1.000000', '1.000000', '1');

-- ----------------------------
-- Table structure for `tb_building_collection`
-- ----------------------------
DROP TABLE IF EXISTS `tb_building_collection`;
CREATE TABLE `tb_building_collection` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) DEFAULT NULL COMMENT '1:逻辑删除',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '楼盘ID',
  `TS_USER_ID` bigint(20) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='楼盘收藏表';

-- ----------------------------
-- Records of tb_building_collection
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_building_image`
-- ----------------------------
DROP TABLE IF EXISTS `tb_building_image`;
CREATE TABLE `tb_building_image` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) DEFAULT NULL COMMENT '1:逻辑删除',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '楼盘id',
  `TS_ASSETS_ID` bigint(20) DEFAULT NULL COMMENT '资产表id',
  `TYPE` varchar(4) DEFAULT NULL COMMENT '楼盘图片类型',
  `PRIORITY` int(11) DEFAULT NULL COMMENT '优先级',
  `REMARK` varchar(256) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='楼盘图片关联表';

-- ----------------------------
-- Records of tb_building_image
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_building_label`
-- ----------------------------
DROP TABLE IF EXISTS `tb_building_label`;
CREATE TABLE `tb_building_label` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) DEFAULT NULL COMMENT '1:逻辑删除',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '楼盘ID',
  `LABEL_NAME` varchar(64) DEFAULT NULL COMMENT '标签名称',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='楼盘标签表';

-- ----------------------------
-- Records of tb_building_label
-- ----------------------------
INSERT INTO `tb_building_label` VALUES ('1', '2016-08-29 14:00:31', '2016-08-29 14:00:34', '0', '1', '双位');
INSERT INTO `tb_building_label` VALUES ('2', '2016-08-29 14:01:17', '2016-08-29 14:01:20', '0', '1', '地铁');

-- ----------------------------
-- Table structure for `tb_building_party`
-- ----------------------------
DROP TABLE IF EXISTS `tb_building_party`;
CREATE TABLE `tb_building_party` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) DEFAULT NULL COMMENT '1:逻辑删除',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '楼盘id',
  `TS_ROLE_NAME` varchar(64) DEFAULT NULL COMMENT '角色名称 CONSULANT：咨询师，ASSISTANT：助理',
  `TS_USER_ID` bigint(20) DEFAULT NULL COMMENT '用户id',
  `NAME` varchar(32) DEFAULT NULL COMMENT '姓名',
  `PHONE` varchar(16) DEFAULT NULL COMMENT '手机号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='楼盘关系人表';

-- ----------------------------
-- Records of tb_building_party
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_commission`
-- ----------------------------
DROP TABLE IF EXISTS `tb_commission`;
CREATE TABLE `tb_commission` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) DEFAULT NULL COMMENT '1:逻辑删除',
  `DEVELOPERS_ID` bigint(20) DEFAULT NULL COMMENT '开发商id',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '所属楼盘',
  `TYPE` varchar(128) DEFAULT NULL COMMENT '类别',
  `TS_ROLE_ID` bigint(20) DEFAULT NULL COMMENT '该拥金所属角色',
  `AMOUNT` decimal(8,2) DEFAULT NULL COMMENT '佣金',
  `DESCP` varchar(256) DEFAULT NULL COMMENT '描述',
  `SETTLEMENT_NODE` varchar(32) DEFAULT NULL COMMENT '结佣节点',
  `SHOW_INDEX` int(11) DEFAULT NULL COMMENT '展示顺序',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='佣金表';

-- ----------------------------
-- Records of tb_commission
-- ----------------------------
INSERT INTO `tb_commission` VALUES ('1', '2016-08-27 14:16:40', '2016-08-27 14:16:46', '0', '1', '1', '别墅', '1', '8000.00', '1.合作时间：20162.认购截止', '开发商佣金到帐后结后用', null);
INSERT INTO `tb_commission` VALUES ('2', '2016-08-30 15:34:59', '2016-08-30 15:35:01', '0', '1', '1', '93yishang', '2', '10000.00', '1.合作时间：20162.认购截止', '开发商佣金到帐后结后用', null);

-- ----------------------------
-- Table structure for `tb_cooperation_building`
-- ----------------------------
DROP TABLE IF EXISTS `tb_cooperation_building`;
CREATE TABLE `tb_cooperation_building` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) DEFAULT NULL COMMENT '1:逻辑删除',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '楼盘ID',
  `COOPERATIONBUILDING_ID` varchar(256) DEFAULT NULL COMMENT '合作楼盘ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合作楼盘';

-- ----------------------------
-- Records of tb_cooperation_building
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_customer`
-- ----------------------------
DROP TABLE IF EXISTS `tb_customer`;
CREATE TABLE `tb_customer` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) DEFAULT NULL COMMENT '1:逻辑删除',
  `NAME` varchar(32) DEFAULT NULL COMMENT '客户姓名',
  `PNONE_NO` varchar(32) DEFAULT NULL COMMENT '客户手机号',
  `LEVEL` varchar(2) DEFAULT NULL COMMENT '客户等级：ABCDE,写跟进时可以修改',
  `REMARK` varchar(256) DEFAULT NULL COMMENT '备注信息',
  `EFFECTIVE_FLAG` char(1) DEFAULT NULL COMMENT '是否有效客户标志：1：有效，0：无效',
  `FIRST_LETTER` varchar(2) DEFAULT NULL COMMENT '客户姓名首字母',
  `TS_USER_ID` bigint(20) DEFAULT NULL COMMENT '客户所属用户表',
  `SEX` char(1) DEFAULT NULL COMMENT '性别 1:男 2:女',
  `AGE` int(11) DEFAULT NULL COMMENT '年龄',
  `MARITAL_STATUS` char(1) DEFAULT NULL COMMENT '婚姻状况 0：未婚，1：已婚',
  `FAMILY_MEMBERS` int(11) DEFAULT NULL COMMENT '家庭架构：1单身2小两口3三口之家4四口及以上',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='客户表';

-- ----------------------------
-- Records of tb_customer
-- ----------------------------
INSERT INTO `tb_customer` VALUES ('1', '2016-08-02 10:40:31', '2016-08-02 10:40:20', '0', '张二狗', '131131', '1', '无', '1', 's', '3', '男', '20', 's', '1');
INSERT INTO `tb_customer` VALUES ('2', '2016-08-10 11:00:05', '2016-08-10 11:00:15', '0', '张惠妹', '131132', '1', 'wu', '1', 't', '3', '女', '20', 's', '1');
INSERT INTO `tb_customer` VALUES ('3', '2016-08-22 11:08:29', '2016-08-22 11:08:32', '0', '刘德华', '13513628910', '1', '购买别墅意向', '1', 'l', '2', '男', '60', 's', '2');
INSERT INTO `tb_customer` VALUES ('4', '2016-08-22 12:54:04', '2016-08-22 12:54:07', '0', '宋仲基', '13113412345', '1', '意向强', '1', 's', '2', '男', '25', 's', '3');
INSERT INTO `tb_customer` VALUES ('5', '2016-08-22 16:01:24', '2016-08-22 16:01:26', '0', '姚明', '12312323456', '1', '别墅', '1', 'y', '2', '男', '35', 's', '3');

-- ----------------------------
-- Table structure for `tb_customer_flow`
-- ----------------------------
DROP TABLE IF EXISTS `tb_customer_flow`;
CREATE TABLE `tb_customer_flow` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) DEFAULT NULL COMMENT '1:逻辑删除',
  `TB_CUSTOMER_REPORT_ID` bigint(20) DEFAULT NULL COMMENT '客户报备楼盘表ID',
  `STATUS_TYPE` varchar(2) DEFAULT NULL COMMENT '四大流程状态类别：1：已报备（未带看），2：已带看（待成交），3：已成交（未结佣），5：已结佣',
  `STATUS_INFO` varchar(64) DEFAULT NULL COMMENT '四大流程状态对应的描述：报备：有效、无效，带看：保护期剩余天数，成交：已认购，结佣：已结佣',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='跟单流程表，包括：报备、带看、成交、结佣四个大流程';

-- ----------------------------
-- Records of tb_customer_flow
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_customer_flow_detail`
-- ----------------------------
DROP TABLE IF EXISTS `tb_customer_flow_detail`;
CREATE TABLE `tb_customer_flow_detail` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) DEFAULT NULL COMMENT '1:逻辑删除',
  `TB_CUSTOMER_FLOW_ID` bigint(20) DEFAULT NULL COMMENT '跟单流程表ID',
  `STATUS_TYPE` varchar(2) DEFAULT NULL COMMENT '小流程类别:待定',
  `STATUS_INFO` varchar(128) DEFAULT NULL COMMENT '小流程对应状态描述',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='跟单流程详情表';

-- ----------------------------
-- Records of tb_customer_flow_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_customer_flow_up`
-- ----------------------------
DROP TABLE IF EXISTS `tb_customer_flow_up`;
CREATE TABLE `tb_customer_flow_up` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) DEFAULT NULL COMMENT '1:逻辑删除',
  `TS_USER_ID` bigint(20) DEFAULT NULL COMMENT '所属用户id',
  `TB_CUSTOMER_ID` bigint(20) DEFAULT NULL COMMENT '客户id',
  `FOLLOW_UP_METHOD` char(1) DEFAULT NULL COMMENT '跟进方式：1：电话 2：约看 3：带看',
  `REMARK` varchar(256) DEFAULT NULL COMMENT '备注信息',
  `LEVEL` varchar(2) DEFAULT NULL COMMENT '客户等级：ABCDE',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户跟进表';

-- ----------------------------
-- Records of tb_customer_flow_up
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_customer_intention`
-- ----------------------------
DROP TABLE IF EXISTS `tb_customer_intention`;
CREATE TABLE `tb_customer_intention` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) DEFAULT NULL COMMENT '1:逻辑删除',
  `TYPE` varchar(2) DEFAULT NULL COMMENT '意向类别：1：类型，2：最低价格，3：最高价格，4：区域，5：户型，6：物业类型，7：置业目的',
  `TS_CODE_DETAIL_ID` bigint(20) DEFAULT NULL COMMENT '系统参数表id',
  `VALUE` varchar(128) DEFAULT NULL COMMENT '属性值',
  `TB_CUSTOMER_ID` bigint(20) DEFAULT NULL COMMENT '客户ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='客户购房意向表';

-- ----------------------------
-- Records of tb_customer_intention
-- ----------------------------
INSERT INTO `tb_customer_intention` VALUES ('1', '2016-08-08 15:31:55', '2016-08-08 15:31:58', '0', '1', '1', '别墅', '1');
INSERT INTO `tb_customer_intention` VALUES ('2', '2016-08-08 15:34:45', '2016-08-08 15:34:50', '0', '2', '1', '10000', '1');
INSERT INTO `tb_customer_intention` VALUES ('3', '2016-08-08 15:36:18', '2016-08-08 15:36:22', '0', '3', '1', '30000', '1');
INSERT INTO `tb_customer_intention` VALUES ('4', '2016-08-08 15:37:58', '2016-08-08 15:38:00', '0', '4', '1', '园区', '1');
INSERT INTO `tb_customer_intention` VALUES ('5', '2016-08-08 15:38:33', '2016-08-08 15:38:36', '0', '5', '1', '不限', '1');
INSERT INTO `tb_customer_intention` VALUES ('6', '2016-08-08 16:34:43', '2016-08-08 16:34:46', '0', '4', '1', '吴中区', '1');
INSERT INTO `tb_customer_intention` VALUES ('7', '2016-08-08 16:36:54', '2016-08-08 16:36:56', '0', '1', '1', '三室', '1');

-- ----------------------------
-- Table structure for `tb_customer_intention_building`
-- ----------------------------
DROP TABLE IF EXISTS `tb_customer_intention_building`;
CREATE TABLE `tb_customer_intention_building` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) DEFAULT NULL COMMENT '1:逻辑删除',
  `TB_CUSTOMER_ID` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '意向楼盘id',
  `BUILDING_NAME` varchar(128) DEFAULT NULL COMMENT '楼盘名称',
  `TB_USER_ID` bigint(20) DEFAULT NULL COMMENT '所属用户id',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='客户意向楼盘表';

-- ----------------------------
-- Records of tb_customer_intention_building
-- ----------------------------
INSERT INTO `tb_customer_intention_building` VALUES ('1', '2016-08-22 13:01:45', '2016-08-22 13:01:49', '0', '3', '1', '印象欧洲', '2');
INSERT INTO `tb_customer_intention_building` VALUES ('2', '2016-08-22 13:03:20', '2016-08-22 13:03:22', '0', '4', '1', '印象欧洲', '2');

-- ----------------------------
-- Table structure for `tb_customer_report`
-- ----------------------------
DROP TABLE IF EXISTS `tb_customer_report`;
CREATE TABLE `tb_customer_report` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) DEFAULT NULL COMMENT '1:逻辑删除',
  `TS_USER_ID` bigint(20) DEFAULT NULL COMMENT '所属用户id',
  `TB_CUSTOMER_ID` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '报备楼盘ID',
  `STATUS` varchar(2) DEFAULT NULL COMMENT '跟进状态：0：未报备，1：已报备（未带看），2：已带看（待成交），3：已成交（未结佣），5：已结佣，6：无效客户',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='客户报备楼盘表';

-- ----------------------------
-- Records of tb_customer_report
-- ----------------------------
INSERT INTO `tb_customer_report` VALUES ('1', '2016-08-22 13:21:37', '2016-08-22 13:21:40', '0', '2', '3', '1', '2');
INSERT INTO `tb_customer_report` VALUES ('2', '2016-08-22 15:41:51', '2016-08-22 15:41:53', '0', '2', '4', '1', '1');

-- ----------------------------
-- Table structure for `tb_developers`
-- ----------------------------
DROP TABLE IF EXISTS `tb_developers`;
CREATE TABLE `tb_developers` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) DEFAULT NULL COMMENT '1:逻辑删除',
  `NAME` varchar(128) DEFAULT NULL COMMENT '开发商名称',
  `COOP_STARTTIME` datetime DEFAULT NULL COMMENT '合作开始时间',
  `COOP_ENDTIME` datetime DEFAULT NULL COMMENT '合作结束时间',
  `PURCHASE_ENDTIME` datetime DEFAULT NULL COMMENT '认购截止时间',
  `COOP_BUILDING` varchar(128) DEFAULT NULL COMMENT '合作房源',
  `RULE` varchar(128) DEFAULT NULL COMMENT '开发商规则',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='开发商表';

-- ----------------------------
-- Records of tb_developers
-- ----------------------------
INSERT INTO `tb_developers` VALUES ('1', '2016-08-30 15:45:49', '2016-08-30 15:45:51', '0', 'fangml', '2016-08-30 15:45:33', '2016-08-30 15:45:36', '2016-08-30 15:45:39', '所以在售房源', '老客户以电话30天回访记录为规定规则');

-- ----------------------------
-- Table structure for `tb_developers_news`
-- ----------------------------
DROP TABLE IF EXISTS `tb_developers_news`;
CREATE TABLE `tb_developers_news` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) DEFAULT NULL COMMENT '1:逻辑删除',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '开发商ID',
  `TITLE` varchar(128) DEFAULT NULL COMMENT '动态标题',
  `RELEASE_TIME` datetime DEFAULT NULL COMMENT '发布时间',
  `CONTENT` varchar(1024) DEFAULT NULL COMMENT '动态内容',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='最新动态';

-- ----------------------------
-- Records of tb_developers_news
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_headlines`
-- ----------------------------
DROP TABLE IF EXISTS `tb_headlines`;
CREATE TABLE `tb_headlines` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) DEFAULT NULL COMMENT '1:逻辑删除',
  `TITLE` varchar(128) DEFAULT NULL COMMENT '动态标题',
  `RELEASE_TIME` datetime DEFAULT NULL COMMENT '发布时间',
  `CONTENT` varchar(1024) DEFAULT NULL COMMENT '动态内容',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='最新头条';

-- ----------------------------
-- Records of tb_headlines
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_hot_building`
-- ----------------------------
DROP TABLE IF EXISTS `tb_hot_building`;
CREATE TABLE `tb_hot_building` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) DEFAULT NULL COMMENT '1:逻辑删除',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '楼盘id',
  `NAME` varchar(256) DEFAULT NULL COMMENT '楼盘名称',
  `PRIORITY` int(11) DEFAULT NULL COMMENT '展示优先级',
  `DESCP` varchar(256) DEFAULT NULL COMMENT '楼盘描述',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='精品楼盘表';

-- ----------------------------
-- Records of tb_hot_building
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_house_ban`
-- ----------------------------
DROP TABLE IF EXISTS `tb_house_ban`;
CREATE TABLE `tb_house_ban` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) DEFAULT NULL COMMENT '1:逻辑删除',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '所属楼盘',
  `NAME` varchar(128) DEFAULT NULL COMMENT '楼栋名称',
  `IMAGE_URL` varchar(256) DEFAULT NULL COMMENT '楼栋图片地址',
  `OPEN_TIME` datetime DEFAULT NULL COMMENT '最新开盘时间',
  `LEAD_TIME` datetime DEFAULT NULL COMMENT '最新入住时间',
  `UNITS` int(11) DEFAULT NULL COMMENT '单元数',
  `HOUSE_RATIO` varchar(32) DEFAULT NULL COMMENT '楼户比',
  `LAYERS` int(11) DEFAULT NULL COMMENT '楼层数',
  `SALING_HOUSES` int(11) DEFAULT NULL COMMENT '在售房源数',
  `IS_SALING_FLAG` char(1) DEFAULT NULL COMMENT '在售标识：1：在售，0：未售',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='楼栋信息';

-- ----------------------------
-- Records of tb_house_ban
-- ----------------------------
INSERT INTO `tb_house_ban` VALUES ('1', '2016-08-27 14:44:17', '2016-08-27 14:44:21', '0', '1', '4#', 'http://ng', '2016-09-01 00:00:00', '2017-09-01 00:00:00', '8', '1梯2户', '34', '100', '1');
INSERT INTO `tb_house_ban` VALUES ('2', '2016-08-27 14:50:51', '2016-08-27 14:50:54', '0', '1', '2#', 'http://12', '2016-08-27 00:00:00', '2016-12-01 00:00:00', '3', '1梯2户', '22', '10', '1');
INSERT INTO `tb_house_ban` VALUES ('3', null, null, null, null, '2016-09-01 00:00:00', null, '2016-09-01 00:00:00', '2016-09-01 00:00:00', '1', '2', '1', '1', '1');
INSERT INTO `tb_house_ban` VALUES ('24', null, null, '0', '1', '34#', null, '2016-02-03 00:00:00', '2016-02-03 00:00:00', '1', '1', '1', '1', '1');
INSERT INTO `tb_house_ban` VALUES ('25', null, null, '0', '13', '36#', null, '2011-01-01 00:00:00', '2011-01-01 00:00:00', '1', '2', '2', '1', '1');
INSERT INTO `tb_house_ban` VALUES ('26', null, null, '0', '12', '344', null, '2018-02-03 00:00:00', '2018-02-03 00:00:00', '1', '1', '1', '111', '1');
INSERT INTO `tb_house_ban` VALUES ('27', null, null, '0', '1', '2#', null, '2016-02-03 00:00:00', '2016-02-03 00:00:00', '3', '3', '3', '3', '1');
INSERT INTO `tb_house_ban` VALUES ('28', null, null, '0', '1', '45#', null, '2016-02-03 00:00:00', '2016-02-03 00:00:00', '3', '1', '1', '1', '1');
INSERT INTO `tb_house_ban` VALUES ('29', null, null, '0', '1', '60#', null, '2016-02-04 00:00:00', '2016-02-04 00:00:00', '1', '1', '1', '1', '1');
INSERT INTO `tb_house_ban` VALUES ('30', null, null, '0', '12', '23', null, '2017-01-01 00:00:00', '2017-01-01 00:00:00', '1', '1', '1', '1', '1');
INSERT INTO `tb_house_ban` VALUES ('31', null, null, '0', '12', '35#', null, '2017-03-18 00:00:00', '2017-03-18 00:00:00', '2', '1', '1', '1', '1');
INSERT INTO `tb_house_ban` VALUES ('32', null, null, '0', '12', '11', null, '2016-03-03 00:00:00', '2016-03-03 00:00:00', '1', '1', '1', '1', '1');
INSERT INTO `tb_house_ban` VALUES ('33', null, null, '0', '12', '22', null, '2017-01-01 00:00:00', '2017-01-01 00:00:00', '1', '1', '1', '1', '1');
INSERT INTO `tb_house_ban` VALUES ('34', null, null, '0', '12', '13#', null, '2016-02-02 00:00:00', '2016-02-02 00:00:00', '1', '1', '1', '11', '1');
INSERT INTO `tb_house_ban` VALUES ('35', null, null, '0', '12', '1', null, '2016-02-02 00:00:00', '2016-02-02 00:00:00', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for `tb_house_type`
-- ----------------------------
DROP TABLE IF EXISTS `tb_house_type`;
CREATE TABLE `tb_house_type` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) DEFAULT NULL COMMENT '1:逻辑删除',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '所属楼盘',
  `TB_HOUSE_BAN_ID` bigint(20) DEFAULT NULL COMMENT '所属楼栋',
  `NAME` varchar(128) DEFAULT NULL COMMENT '户型名称',
  `DESCP` varchar(256) DEFAULT NULL COMMENT '户型描述',
  `IMAGE_URL` varchar(256) DEFAULT NULL COMMENT '户型图片地址',
  `LIVING_ROOMS` int(11) DEFAULT NULL COMMENT '客厅数',
  `BEDROOMS` int(11) DEFAULT NULL COMMENT '卧室数',
  `TOILETS` int(11) DEFAULT NULL COMMENT '卫生间数目',
  `SQUARE` decimal(8,2) DEFAULT NULL COMMENT '面积',
  `UNIT_PRICE` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `POSITION` bigint(20) DEFAULT NULL COMMENT '位置\r\n            关联省市区表',
  `TOTAL_PRICE` decimal(10,2) DEFAULT NULL COMMENT '总价',
  `IS_MAIN_FLAG` char(1) DEFAULT NULL COMMENT '是否主力户型：1：主力户型，0：非主力户型',
  `IS_SALING_FLAG` char(1) DEFAULT NULL COMMENT '在售标识：1：在售，0：未售',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='户型表，检索查此表';

-- ----------------------------
-- Records of tb_house_type
-- ----------------------------
INSERT INTO `tb_house_type` VALUES ('1', '2016-08-22 16:59:55', '2016-08-22 16:59:58', '0', '1', '1', '三室一厅两卫', 'ss', 'http://123', '2', '3', '2', '90.00', '1.50', '1', '200.00', '0', '1');
INSERT INTO `tb_house_type` VALUES ('2', '2016-08-27 15:42:47', '2016-08-27 15:42:49', '0', '1', null, '三室一厅两卫', 'aaaa', 'http://234', '2', '3', '1', '120.00', '2.00', '1', '300.00', '1', '1');
INSERT INTO `tb_house_type` VALUES ('3', '2016-09-02 15:39:19', '2016-09-02 15:39:22', '0', '1', '1', '高层', 'ss', 'http://345', '3', '1', '1', '111.00', '11.00', '111', '1111.00', '1', '1');
INSERT INTO `tb_house_type` VALUES ('5', null, null, '1', '13', '25', '高层标准', '环境好aaa', null, '1', '1', '111', '12.00', '1111.00', null, '1.00', null, '1');
INSERT INTO `tb_house_type` VALUES ('6', null, null, '1', '13', '25', '的确我的手', '1', null, '1', '11', '11', '1.00', '1.00', null, '1.00', null, '1');

-- ----------------------------
-- Table structure for `tb_house_type_label`
-- ----------------------------
DROP TABLE IF EXISTS `tb_house_type_label`;
CREATE TABLE `tb_house_type_label` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) DEFAULT NULL COMMENT '1:逻辑删除',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '楼盘ID',
  `TB_HOUSE_BAN_ID` bigint(20) DEFAULT NULL COMMENT '楼栋ID',
  `TB_HOUSE_TYPE_ID` bigint(20) DEFAULT NULL COMMENT '所属户型',
  `LABEL_NAME` varchar(64) DEFAULT NULL COMMENT '主数据 户型标签',
  `SHOW_FLAG` char(1) DEFAULT NULL COMMENT '是否展示：0不展示，1展示',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='户型标签/属性';

-- ----------------------------
-- Records of tb_house_type_label
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_order`
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) DEFAULT NULL COMMENT '1:逻辑删除',
  `TS_USER_ID` bigint(20) DEFAULT NULL COMMENT '所属用户id',
  `TB_CUSTOMER_ID` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '楼盘ID',
  `ORDER_ID` varchar(64) DEFAULT NULL COMMENT '订单编号',
  `PAYMENT` float DEFAULT NULL COMMENT '应收团购费元',
  `ALREADY_PAYMENT` float DEFAULT NULL COMMENT '已收团购费元',
  `HOUSING_INFO` varchar(64) DEFAULT NULL COMMENT '房源信息',
  `ORDER_TIME` datetime DEFAULT NULL COMMENT '订单时间',
  `ORDER_TYPE` varchar(32) DEFAULT NULL COMMENT '订单类型',
  `ORDER_STATUS` varchar(32) DEFAULT NULL COMMENT '订单状态',
  `SOURCE` varchar(32) DEFAULT NULL COMMENT '来源',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of tb_order
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_scan_record`
-- ----------------------------
DROP TABLE IF EXISTS `tb_scan_record`;
CREATE TABLE `tb_scan_record` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) DEFAULT NULL COMMENT '1:逻辑删除',
  `SCAN_USER_ID` bigint(20) DEFAULT NULL COMMENT '助理或者咨询师id',
  `TS_USER_ID` bigint(20) DEFAULT NULL COMMENT '经纪人Id',
  `TB_CUSTOMER_ID` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '楼盘ID',
  `CHANNEL` varchar(32) DEFAULT NULL COMMENT '渠道类型',
  `SOURCE` varchar(128) DEFAULT NULL COMMENT '来源',
  `CONFIRM_FLAG` varchar(1) DEFAULT NULL COMMENT '1:确认成功',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='扫码记录表';

-- ----------------------------
-- Records of tb_scan_record
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_store`
-- ----------------------------
DROP TABLE IF EXISTS `tb_store`;
CREATE TABLE `tb_store` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) DEFAULT NULL COMMENT '1:逻辑删除',
  `STORE_CODE` varchar(16) DEFAULT NULL COMMENT '门店编码',
  `PHONE_NO` varchar(16) DEFAULT NULL COMMENT '联系电话',
  `NAME` varchar(32) DEFAULT NULL COMMENT '门店名称',
  `ADDRESS` varchar(256) DEFAULT NULL COMMENT '门店地址',
  `TB_AGENCY_ID` bigint(20) DEFAULT NULL COMMENT '所属机构',
  `AGENCY_NAME` varchar(64) DEFAULT NULL COMMENT '机构 名称',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='门店';

-- ----------------------------
-- Records of tb_store
-- ----------------------------
INSERT INTO `tb_store` VALUES ('1', '2016-08-20 14:04:47', '2016-08-20 14:04:49', '0', 'aa', '11', 'cc', 'aa', '1', '房麦乐');
INSERT INTO `tb_store` VALUES ('2', '2016-08-20 14:49:19', '2016-08-20 14:49:21', '0', 'a', '122', 'ss', 'we', '2', '房麦乐网络科技');

-- ----------------------------
-- Table structure for `tb_user_commission`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_commission`;
CREATE TABLE `tb_user_commission` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) DEFAULT NULL COMMENT '1:逻辑删除',
  `TS_USER_ID` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `TS_CUSTOMER_ID` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `CUSTOMER_NAME` varchar(32) DEFAULT NULL COMMENT '客户姓名',
  `CUSTOMER_PHONE` varchar(32) DEFAULT NULL COMMENT '客户手机号',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '所属楼盘',
  `BUILDING_NAME` varchar(128) DEFAULT NULL COMMENT '楼盘名称',
  `TRADE_TIME` datetime DEFAULT NULL COMMENT '成交时间',
  `AMOUNT` decimal(8,2) DEFAULT NULL COMMENT '佣金金额',
  `STATUS` char(1) DEFAULT NULL COMMENT '结佣状态：1：已结佣，0：未结佣',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户佣金表';

-- ----------------------------
-- Records of tb_user_commission
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_area`
-- ----------------------------
DROP TABLE IF EXISTS `ts_area`;
CREATE TABLE `ts_area` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `AREANAME` varchar(128) DEFAULT NULL COMMENT '名称',
  `PARENTID` bigint(20) DEFAULT NULL,
  `SHORTNAME` varchar(128) DEFAULT NULL COMMENT '简称',
  `LNG` decimal(10,6) DEFAULT NULL COMMENT '经度',
  `LAT` decimal(10,6) DEFAULT NULL COMMENT '纬度',
  `LEVEL` int(11) DEFAULT NULL COMMENT '级别',
  `POSITION` varchar(128) DEFAULT NULL COMMENT '位置',
  `SORT` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='省市区表';

-- ----------------------------
-- Records of ts_area
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_assets`
-- ----------------------------
DROP TABLE IF EXISTS `ts_assets`;
CREATE TABLE `ts_assets` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) DEFAULT NULL,
  `FILE_NAME` varchar(64) DEFAULT NULL COMMENT '文件名称',
  `CONTENT_TYPE` varchar(16) DEFAULT NULL COMMENT '类型',
  `STORE_PATH` varchar(128) DEFAULT NULL COMMENT '存储路径',
  `FILE_SIZE` int(11) DEFAULT NULL COMMENT '文件大小',
  `CODE` varchar(16) DEFAULT NULL COMMENT '编码',
  `PRIORITY` int(11) DEFAULT NULL COMMENT '优先级',
  `IMAGE_URL` varchar(256) DEFAULT NULL COMMENT '图片地址',
  `LINK_URL` varchar(256) DEFAULT NULL COMMENT '跳转地址',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='资产表';

-- ----------------------------
-- Records of ts_assets
-- ----------------------------
INSERT INTO `ts_assets` VALUES ('1', '2016-07-30 18:33:55', '2016-07-30 18:33:58', '0', 'topImage1.png', null, null, null, '01', '1', 'https://image2.suning.cn/uimg/cms/img/146821740560176967.jpg', 'https://licai.suning.com/lcportal/portal/fund/list.htm?channelCode=PC_LCSY_daohang4');
INSERT INTO `ts_assets` VALUES ('2', '2016-07-30 18:34:22', '2016-07-30 18:34:25', '0', 'topImage2.png', null, null, null, '01', '2', 'https://image5.suning.cn/uimg/cms/img/146821169930457793.jpg', 'https://licai.suning.com/lcportal/portal/period/list.htm?channelCode=PC_LCSY_daohang3');
INSERT INTO `ts_assets` VALUES ('3', '2016-07-30 22:11:29', '2016-07-30 22:11:32', '0', 'hotBuildingImage.png', null, null, null, '02', '1', 'https://image5.suning.cn/uimg/cms/img/146821169930457793.jpg', null);
INSERT INTO `ts_assets` VALUES ('4', '2016-07-31 11:34:55', '2016-07-31 11:34:58', '0', 'topBuildingDetail1.png', null, null, null, '03', '1', 'https://image5.suning.cn/uimg/cms/img/146821169930457793.jpg', null);
INSERT INTO `ts_assets` VALUES ('5', '2016-07-31 11:36:08', '2016-07-31 11:36:10', '0', 'topBuildingDetail2.png', null, null, null, '03', '2', 'https://image5.suning.cn/uimg/cms/img/146821169930457793.jpg', null);
INSERT INTO `ts_assets` VALUES ('6', '2016-07-31 11:36:34', '2016-07-31 11:36:36', '0', 'topBuildingDetail3.png', null, null, null, '03', '3', 'https://image5.suning.cn/uimg/cms/img/146821169930457793.jpg', null);
INSERT INTO `ts_assets` VALUES ('7', '2016-08-25 09:48:06', '2016-08-25 09:48:09', '0', '1', null, null, null, null, null, 'C:\\Users\\Public\\Pictures\\Sample Pictures\\Lighthouse.jpg', null);

-- ----------------------------
-- Table structure for `ts_code_detail`
-- ----------------------------
DROP TABLE IF EXISTS `ts_code_detail`;
CREATE TABLE `ts_code_detail` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) DEFAULT NULL COMMENT '1:逻辑删除',
  `PARENT_ID` bigint(20) DEFAULT NULL,
  `CODE` varchar(32) DEFAULT NULL COMMENT '键',
  `VALUE` varchar(128) DEFAULT NULL COMMENT '值',
  `TS_CODE_LIST_ID` bigint(20) DEFAULT NULL COMMENT 'TS_CODE_LIST ID',
  `REMARK` varchar(128) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统参数详情表';

-- ----------------------------
-- Records of ts_code_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_code_list`
-- ----------------------------
DROP TABLE IF EXISTS `ts_code_list`;
CREATE TABLE `ts_code_list` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) DEFAULT NULL COMMENT '1:逻辑删除',
  `NAME` varchar(32) DEFAULT NULL COMMENT '参数名称',
  `CODE` varchar(32) DEFAULT NULL COMMENT '参数编码',
  `REMARK` varchar(128) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统参数列表';

-- ----------------------------
-- Records of ts_code_list
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_menu`
-- ----------------------------
DROP TABLE IF EXISTS `ts_menu`;
CREATE TABLE `ts_menu` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) DEFAULT NULL,
  `TS_ROLE_ID` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `MENU_NAME` varchar(64) DEFAULT NULL COMMENT '菜单名称',
  `LEVEL` varchar(2) DEFAULT NULL COMMENT '菜单级别：1：一级菜单2：二级菜单3：三级菜单',
  `LINK_URL` varchar(128) DEFAULT NULL COMMENT '链接地址',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of ts_menu
-- ----------------------------
INSERT INTO `ts_menu` VALUES ('1', null, null, null, '1', '1', '1', '1');
INSERT INTO `ts_menu` VALUES ('3', null, null, '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for `ts_role`
-- ----------------------------
DROP TABLE IF EXISTS `ts_role`;
CREATE TABLE `ts_role` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) DEFAULT NULL,
  `NAME` varchar(64) DEFAULT NULL COMMENT '角色名称',
  `CODE` varchar(16) DEFAULT NULL COMMENT '角色编码',
  `REMARK` varchar(128) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of ts_role
-- ----------------------------
INSERT INTO `ts_role` VALUES ('1', '2016-08-10 16:14:14', '2016-08-10 16:14:16', '0', '关键人', 'KEY', null);
INSERT INTO `ts_role` VALUES ('2', '2016-08-10 16:14:57', '2016-08-10 16:14:59', '0', '经纪人', 'AGENT', null);
INSERT INTO `ts_role` VALUES ('3', '2016-08-14 21:09:41', '2016-08-14 21:09:43', '0', '经济机构管理员', 'AGENTADMIN', null);
INSERT INTO `ts_role` VALUES ('4', '2016-08-14 21:32:00', '2016-08-14 21:32:02', '0', '咨询师', 'CONSULANT', null);
INSERT INTO `ts_role` VALUES ('5', '2016-08-14 21:33:44', '2016-08-14 21:33:46', '0', '后台管理员', 'ADMIN', null);
INSERT INTO `ts_role` VALUES ('6', '2016-08-14 21:34:42', '2016-08-14 21:34:43', '0', '项目助理', 'ASSISTANT ', null);

-- ----------------------------
-- Table structure for `ts_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `ts_role_menu`;
CREATE TABLE `ts_role_menu` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) DEFAULT NULL,
  `TS_ROLE_ID` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `TS_MENU_ID` bigint(20) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色菜单关联表';

-- ----------------------------
-- Records of ts_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_user`
-- ----------------------------
DROP TABLE IF EXISTS `ts_user`;
CREATE TABLE `ts_user` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) DEFAULT NULL COMMENT '1:逻辑删除',
  `USER_CODE` varchar(32) DEFAULT NULL,
  `USER_NAME` varchar(128) DEFAULT NULL,
  `PASSWORD` varchar(64) DEFAULT NULL,
  `PHONE_NO` varchar(16) DEFAULT NULL,
  `NAME` varchar(32) DEFAULT NULL COMMENT '姓名',
  `ID_CARD` varchar(32) DEFAULT NULL COMMENT '身份证号',
  `ID_CARD_IMAGE_URL` varchar(128) DEFAULT NULL COMMENT '身份证正面照片图片地址',
  `BUSINESS_CARD_IMAGE_URL` varchar(128) DEFAULT NULL COMMENT '名片照片地址，置业顾问使用',
  `BUSINESS_CITY_ID` bigint(20) DEFAULT NULL COMMENT '业务城市ID',
  `BUSINESS_CITY_NAME` varchar(64) DEFAULT NULL,
  `TB_STORE_ID` bigint(20) DEFAULT NULL COMMENT '所属经济公司，经济人使用',
  `AUTHENTICATION` char(1) DEFAULT NULL COMMENT '是否已认证：0：未认证，1：已认证',
  `LEVEL` varchar(2) DEFAULT NULL COMMENT '用户级别：1：铁牌，2：铜牌，3：银牌，4：金牌',
  `HEADIMAGE_URL` varchar(128) DEFAULT NULL COMMENT '头像图片地址',
  `SEX` char(1) DEFAULT NULL COMMENT '性别 1:男 2:女',
  `WORKING_SENIORITY` int(11) DEFAULT NULL COMMENT '从业年限',
  `DECLARATION` varchar(128) DEFAULT NULL COMMENT '服务宣言',
  `TS_ROLE_ID` bigint(20) DEFAULT NULL COMMENT '角色id',
  `ROLE_CODE` varchar(16) DEFAULT NULL COMMENT '角色编码',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of ts_user
-- ----------------------------
INSERT INTO `ts_user` VALUES ('1', '2016-07-28 21:00:14', '2016-07-28 21:00:16', '0', '1', 'sun', '1', '15909099900', 'bb', 'dfdfd', 'fdfddf', 'dfdfd', '1212', 'dfdfdf', '12', null, null, null, null, null, null, '5', 'admin');
INSERT INTO `ts_user` VALUES ('2', '2016-08-19 10:03:13', '2016-08-19 10:03:15', '0', '2', '黄立俊', '123', '13012054690', 'ss', 'aaaa', 'aaaa', 'aaaaa', '12', 'ddddd', '2', null, null, null, '男', null, null, '1', 'key');
INSERT INTO `ts_user` VALUES ('3', '2016-08-20 13:59:39', '2016-08-20 13:59:42', '0', '3', '李栋', '111', '13513511111', 'ss', '123', '111', '11', '11', '11', '1', null, null, null, '男', null, null, '2', 'agent');
INSERT INTO `ts_user` VALUES ('4', null, null, '0', null, 'wang', '123', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'admin');
INSERT INTO `ts_user` VALUES ('5', null, null, '0', null, 'root', '123', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'admin');

-- ----------------------------
-- Table structure for `ts_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `ts_user_role`;
CREATE TABLE `ts_user_role` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) DEFAULT NULL,
  `TS_USER_ID` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `TS_ROLE_ID` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色关联表（作废）';

-- ----------------------------
-- Records of ts_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_validate_record`
-- ----------------------------
DROP TABLE IF EXISTS `ts_validate_record`;
CREATE TABLE `ts_validate_record` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) DEFAULT NULL COMMENT '1:逻辑删除',
  `PHONE` varchar(16) DEFAULT NULL COMMENT '手机号',
  `VCODE` varchar(8) DEFAULT NULL COMMENT '验证码',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='验证码表';

-- ----------------------------
-- Records of ts_validate_record
-- ----------------------------
