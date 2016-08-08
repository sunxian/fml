/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50713
Source Host           : localhost:3306
Source Database       : fml

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2016-08-08 17:39:47
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
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:逻辑删除',
  `AGENCY_CODE` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '机构编码',
  `PHONE_NO` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `NAME` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '机构名称',
  `BUSINESS_CITY_ID` bigint(20) DEFAULT NULL COMMENT '业务城市ID',
  `BUSINESS_CITY_NAME` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '业务城市名称',
  `AUTHENTICATION` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否已认证：0：未认证，1：已认证',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='中介公司';

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
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:逻辑删除',
  `TYPE` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '楼盘类型：1：房麦乐电商楼盘，2：放麦乐分销楼盘',
  `NAME` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '楼盘名称',
  `AVERAGE_PRICE` decimal(8,2) DEFAULT NULL COMMENT '均价',
  `ADDRESS` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '楼盘地址',
  `NEWS_UPDATE` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '最新动态。此字段需要删除，已经添加最新动态表',
  `LEAD_TIME` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '入住时间',
  `PROPERTY_TYPE` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '物业类型',
  `BUILDING_TYPE` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建筑类型',
  `RENOVATION_STATUS` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '装修状况',
  `HOUSEHOLDS` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '住户数',
  `VOLUME_RATIO` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '容积率',
  `GREENING_RATE` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '绿化率',
  `PARKING_SPACE` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '停车位',
  `PERIOD_OF_RIGHTS` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '产权年限',
  `DEVELOPERS_ID` bigint(20) DEFAULT NULL COMMENT '开发商ID',
  `DEVELOPERS_NAME` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '开发商名称',
  `PRE_SALE_PERMIT` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '预售许可',
  `PROPERTY_FEE` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '物业费',
  `PROPERTY_COMPANY` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '物业公司名称',
  `DEVELOPERS_DESC` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '开发商说明',
  `DESCP` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '楼盘描述',
  `FLAG` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '标签，值为定义在ts_code_detail里的code',
  `LONGITUDE` decimal(10,5) DEFAULT NULL COMMENT '经度',
  `LATITUDE` decimal(10,5) DEFAULT NULL COMMENT '纬度',
  `ZOOM` int(11) DEFAULT NULL COMMENT '地图放大级别',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='楼盘表';

-- ----------------------------
-- Records of tb_building
-- ----------------------------
INSERT INTO `tb_building` VALUES ('1', '2016-07-30 22:40:51', '2016-07-30 22:40:53', '0', null, '印象欧洲', '20000.00', '虎丘区上园路四号', '3月1日加推21#精装公寓', '预计2016年下半年15#、18#交房', '住宅', '板楼，小高层，高层', '毛坯', '1583户', '1.80', '30%', '住宅：机动车1588辆，非机动车2375辆；商业：机动车474辆，非机动车568辆', '70年', '1', '苏州金辉鑫元置业有限公司', '苏房预高新2016016号', '2.37元', '金辉物业', null, '印象欧洲占地面积50多万平米，约9900户。整体规划有...', 'NEW', null, null, null);

-- ----------------------------
-- Table structure for `tb_building_collection`
-- ----------------------------
DROP TABLE IF EXISTS `tb_building_collection`;
CREATE TABLE `tb_building_collection` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:逻辑删除',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '楼盘ID',
  `TS_USER_ID` bigint(20) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='楼盘收藏表';

-- ----------------------------
-- Records of tb_building_collection
-- ----------------------------
INSERT INTO `tb_building_collection` VALUES ('1', '2016-07-31 09:48:31', '2016-07-31 09:48:33', '0', '1', '1');

-- ----------------------------
-- Table structure for `tb_building_image`
-- ----------------------------
DROP TABLE IF EXISTS `tb_building_image`;
CREATE TABLE `tb_building_image` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:逻辑删除',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '楼盘id',
  `TS_ASSETS_ID` bigint(20) DEFAULT NULL COMMENT '资产表id',
  `TYPE` varchar(4) COLLATE utf8_bin DEFAULT NULL COMMENT '楼盘图片类型',
  `PRIORITY` int(11) DEFAULT NULL COMMENT '优先级',
  `REMARK` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='楼盘图片关联表';

-- ----------------------------
-- Records of tb_building_image
-- ----------------------------
INSERT INTO `tb_building_image` VALUES ('1', '2016-07-30 21:41:02', '2016-07-30 21:41:04', '0', '1', '3', '01', '1', '正面大图');
INSERT INTO `tb_building_image` VALUES ('2', '2016-07-30 21:43:16', '2016-07-30 21:43:18', '0', '1', null, '02', '1', '列表缩略图');
INSERT INTO `tb_building_image` VALUES ('3', '2016-07-31 11:12:23', '2016-07-31 11:12:25', '0', '1', '4', '03', '1', '楼盘详情页顶部图片');
INSERT INTO `tb_building_image` VALUES ('4', '2016-07-31 11:13:19', '2016-07-31 11:13:20', '0', '1', '5', '03', '2', '楼盘详情页顶部图片');
INSERT INTO `tb_building_image` VALUES ('5', '2016-07-31 11:14:07', '2016-07-31 11:14:09', '0', '1', '6', '03', '3', '楼盘详情页顶部图片');

-- ----------------------------
-- Table structure for `tb_building_label`
-- ----------------------------
DROP TABLE IF EXISTS `tb_building_label`;
CREATE TABLE `tb_building_label` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:逻辑删除',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '楼盘ID',
  `LABEL_NAME` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '标签名称',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='楼盘标签表';

-- ----------------------------
-- Records of tb_building_label
-- ----------------------------
INSERT INTO `tb_building_label` VALUES ('1', '2016-07-31 10:39:53', '2016-07-31 10:39:55', '0', '1', '老盘加推');
INSERT INTO `tb_building_label` VALUES ('2', '2016-07-31 10:40:28', '2016-07-31 10:40:30', '0', '1', '双卫');
INSERT INTO `tb_building_label` VALUES ('3', '2016-07-31 10:40:46', '2016-07-31 10:40:49', '0', '1', '住宅');
INSERT INTO `tb_building_label` VALUES ('4', '2016-07-31 10:41:04', '2016-07-31 10:41:06', '0', '1', '地铁');
INSERT INTO `tb_building_label` VALUES ('5', '2016-07-31 10:41:23', '2016-07-31 10:41:26', '0', '1', '高层');

-- ----------------------------
-- Table structure for `tb_commission`
-- ----------------------------
DROP TABLE IF EXISTS `tb_commission`;
CREATE TABLE `tb_commission` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:逻辑删除',
  `DEVELOPERS_ID` bigint(20) DEFAULT NULL COMMENT '开发商id',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '所属楼盘',
  `TYPE` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '类别',
  `TS_ROLE_ID` bigint(20) DEFAULT NULL COMMENT '该拥金所属角色',
  `AMOUNT` decimal(8,2) DEFAULT NULL COMMENT '佣金',
  `DESCP` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `SETTLEMENT_NODE` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '结佣节点',
  `SHOW_INDEX` int(11) DEFAULT NULL COMMENT '展示顺序',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='佣金表';

-- ----------------------------
-- Records of tb_commission
-- ----------------------------
INSERT INTO `tb_commission` VALUES ('1', '2016-07-31 13:33:01', '2016-07-31 13:33:03', '0', '1', '1', '93平方以上', '1', '8000.00', '房卖乐收到开发商款后结8000元。', '签约', '1');
INSERT INTO `tb_commission` VALUES ('2', '2016-07-31 13:33:58', '2016-07-31 13:34:01', '0', '1', '1', '别墅', '1', '20000.00', '房卖乐收到开发商款后结20000元。', '签约', '2');

-- ----------------------------
-- Table structure for `tb_cooperation_building`
-- ----------------------------
DROP TABLE IF EXISTS `tb_cooperation_building`;
CREATE TABLE `tb_cooperation_building` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:逻辑删除',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '楼盘ID',
  `COOPERATIONBUILDING_ID` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '合作楼盘ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='合作楼盘';

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
  `FOLLOW_UP_METHOD` varchar(0) DEFAULT NULL COMMENT '跟进方式：1：电话，2：带看，3：约看',
  `LEVEL` varchar(2) DEFAULT NULL COMMENT '客户等级：ABCDE',
  `REMARK` varchar(256) DEFAULT NULL COMMENT '备注信息',
  `EFFECTIVE_FLAG` char(1) DEFAULT NULL COMMENT '是否有效客户标志：1：有效，0：无效',
  `TS_USER` bigint(20) DEFAULT NULL COMMENT '客户所属用户表',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='客户表';

-- ----------------------------
-- Records of tb_customer
-- ----------------------------
INSERT INTO `tb_customer` VALUES ('1', '2016-08-02 10:40:31', '2016-08-02 10:40:20', '0', 'sun', '131131', '', '1', '无', '1', '1');

-- ----------------------------
-- Table structure for `tb_customer_intention`
-- ----------------------------
DROP TABLE IF EXISTS `tb_customer_intention`;
CREATE TABLE `tb_customer_intention` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) DEFAULT NULL COMMENT '1:逻辑删除',
  `TYPE` varchar(2) DEFAULT NULL COMMENT '意向类别：1：类型，2：最低价格，3：最高价格，4：区域，5：户型',
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
-- Table structure for `tb_customer_report`
-- ----------------------------
DROP TABLE IF EXISTS `tb_customer_report`;
CREATE TABLE `tb_customer_report` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:逻辑删除',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '报备楼盘ID',
  `STATUS` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '跟进状态：默认1：已报备，2：已带看，3：已成交，4：无效客户',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='客户报备楼盘表';

-- ----------------------------
-- Records of tb_customer_report
-- ----------------------------
INSERT INTO `tb_customer_report` VALUES ('1', '2016-08-08 11:06:07', '2016-08-08 11:06:09', '0', '1', '2');
INSERT INTO `tb_customer_report` VALUES ('2', '2016-08-06 11:06:55', '2016-08-08 11:07:06', '0', '1', '2');
INSERT INTO `tb_customer_report` VALUES ('3', '2016-07-08 12:27:22', '2016-07-09 12:27:29', '0', '1', '2');
INSERT INTO `tb_customer_report` VALUES ('4', '2016-08-08 14:43:34', '2016-08-08 14:43:40', '0', '1', '3');
INSERT INTO `tb_customer_report` VALUES ('5', '2016-06-02 14:44:02', '2016-06-02 14:44:15', '0', '1', '3');

-- ----------------------------
-- Table structure for `tb_developers`
-- ----------------------------
DROP TABLE IF EXISTS `tb_developers`;
CREATE TABLE `tb_developers` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:逻辑删除',
  `NAME` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '开发商名称',
  `COOP_STARTTIME` datetime DEFAULT NULL COMMENT '合作开始时间',
  `COOP_ENDTIME` datetime DEFAULT NULL COMMENT '合作结束时间',
  `PURCHASE_ENDTIME` datetime DEFAULT NULL COMMENT '认购截止时间',
  `COOP_BUILDING` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '合作房源',
  `RULE` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '开发商规则',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='开发商表';

-- ----------------------------
-- Records of tb_developers
-- ----------------------------
INSERT INTO `tb_developers` VALUES ('1', '2016-07-31 14:23:42', '2016-07-31 14:23:44', '0', '苏州金辉鑫元置业有限公司', '2016-07-31 14:23:59', '2016-07-31 14:24:02', null, '', null);

-- ----------------------------
-- Table structure for `tb_developers_news`
-- ----------------------------
DROP TABLE IF EXISTS `tb_developers_news`;
CREATE TABLE `tb_developers_news` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:逻辑删除',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '开发商ID',
  `TITLE` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '动态标题',
  `RELEASE_TIME` datetime DEFAULT NULL COMMENT '发布时间',
  `CONTENT` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '动态内容',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='最新动态';

-- ----------------------------
-- Records of tb_developers_news
-- ----------------------------
INSERT INTO `tb_developers_news` VALUES ('1', '2016-07-31 13:51:58', '2016-07-31 13:52:00', '0', '1', '环秀湖花园目前小高层11、13#在售', '2016-07-31 13:52:41', '环秀湖花园目前小高层11、13#在售，剩余20套左右房源，户型面积11#户型面积89㎡，均价19500元/㎡');
INSERT INTO `tb_developers_news` VALUES ('2', '2016-08-01 13:24:55', '2016-08-01 13:25:01', '0', '1', '环秀湖花园2万每平方米', '2016-08-01 13:26:33', '目前在售房源13楼，14楼');
INSERT INTO `tb_developers_news` VALUES ('3', '2016-08-01 17:04:16', '2016-08-01 17:04:20', '0', '2', '金水湾', '2016-08-09 17:04:41', '搞活动');

-- ----------------------------
-- Table structure for `tb_headlines`
-- ----------------------------
DROP TABLE IF EXISTS `tb_headlines`;
CREATE TABLE `tb_headlines` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:逻辑删除',
  `TITLE` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '动态标题',
  `RELEASE_TIME` datetime DEFAULT NULL COMMENT '发布时间',
  `CONTENT` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '动态内容',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='最新头条';

-- ----------------------------
-- Records of tb_headlines
-- ----------------------------
INSERT INTO `tb_headlines` VALUES ('1', '2016-07-30 20:08:23', '2016-07-30 20:08:24', '0', '买房新技能你get了吗？', '2016-07-30 20:08:43', '买房新技能你get了吗？测试数据');

-- ----------------------------
-- Table structure for `tb_hot_building`
-- ----------------------------
DROP TABLE IF EXISTS `tb_hot_building`;
CREATE TABLE `tb_hot_building` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:逻辑删除',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '楼盘id',
  `NAME` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '楼盘名称',
  `PRIORITY` int(11) DEFAULT NULL COMMENT '展示优先级',
  `DESCP` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '楼盘描述',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='精品楼盘表';

-- ----------------------------
-- Records of tb_hot_building
-- ----------------------------
INSERT INTO `tb_hot_building` VALUES ('1', '2016-07-30 21:54:47', '2016-07-30 21:54:49', '0', '1', '印象欧洲', '1', '印象欧洲占地面积50多万平米，约9900户。整体规划有...');

-- ----------------------------
-- Table structure for `tb_house_ban`
-- ----------------------------
DROP TABLE IF EXISTS `tb_house_ban`;
CREATE TABLE `tb_house_ban` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:逻辑删除',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '所属楼盘',
  `NAME` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '楼栋名称',
  `IMAGE_URL` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '楼栋图片地址',
  `OPEN_TIME` datetime DEFAULT NULL COMMENT '最新开盘时间',
  `LEAD_TIME` datetime DEFAULT NULL COMMENT '最新入住时间',
  `UNITS` int(11) DEFAULT NULL COMMENT '单元数',
  `HOUSE_RATIO` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '楼户比',
  `LAYERS` int(11) DEFAULT NULL COMMENT '楼层数',
  `SALING_HOUSES` int(11) DEFAULT NULL COMMENT '在售房源数',
  `IS_SALING_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '在售标识：1：在售，0：未售',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='楼栋信息';

-- ----------------------------
-- Records of tb_house_ban
-- ----------------------------
INSERT INTO `tb_house_ban` VALUES ('1', '2016-07-31 15:00:40', '2016-07-31 15:00:41', '0', '1', '9栋', 'http://1232323232.png', '2016-07-31 15:00:59', '2016-07-31 15:01:01', '2', '2楼4户', '18', '150', '1');

-- ----------------------------
-- Table structure for `tb_house_type`
-- ----------------------------
DROP TABLE IF EXISTS `tb_house_type`;
CREATE TABLE `tb_house_type` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:逻辑删除',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '所属楼盘',
  `TB_HOUSE_BAN_ID` bigint(20) DEFAULT NULL COMMENT '所属楼栋',
  `NAME` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '户型名称',
  `DESCP` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '户型描述',
  `IMAGE_URL` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '户型图片地址',
  `LIVING_ROOMS` int(11) DEFAULT NULL COMMENT '客厅数',
  `BEDROOMS` int(11) DEFAULT NULL COMMENT '卧室数',
  `TOILETS` int(11) DEFAULT NULL COMMENT '卫生间数目',
  `SQUARE` decimal(8,2) DEFAULT NULL COMMENT '面积',
  `UNIT_PRICE` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `POSITION` bigint(20) DEFAULT NULL COMMENT '位置\r\n            关联省市区表',
  `TOTAL_PRICE` decimal(10,2) DEFAULT NULL COMMENT '总价',
  `IS_MAIN_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否主力户型：1：主力户型，0：非主力户型',
  `IS_SALING_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '在售标识：1：在售，0：未售',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='户型表，检索查此表';

-- ----------------------------
-- Records of tb_house_type
-- ----------------------------
INSERT INTO `tb_house_type` VALUES ('1', '2016-07-31 14:54:22', '2016-07-31 14:54:24', '0', '1', '1', '2居1厅1卫', '高层标准层B1', 'http://232323232.png', '1', '3', '1', '98.00', '18000.00', null, '1600000.00', '1', '1');
INSERT INTO `tb_house_type` VALUES ('2', '2016-08-03 17:29:42', '2016-08-03 17:29:47', '0', '1', '1', '3居1厅2卫', '高层标准层B1', 'tp://232323432.png', '1', '3', '2', '120.00', '30000.00', null, '2000000.00', '0', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='户型标签/属性';

-- ----------------------------
-- Records of tb_house_type_label
-- ----------------------------
INSERT INTO `tb_house_type_label` VALUES ('1', '2016-08-03 14:38:44', '2016-08-03 14:38:47', '0', '1', '1', '1', '可售10套', '1');
INSERT INTO `tb_house_type_label` VALUES ('2', '2016-08-03 14:48:26', '2016-08-03 14:48:30', '0', '1', '1', '1', '南北通透', '1');
INSERT INTO `tb_house_type_label` VALUES ('3', '2016-08-03 14:49:48', '2016-08-03 14:49:50', '0', '1', '1', '1', '户型方正', '1');
INSERT INTO `tb_house_type_label` VALUES ('4', '2016-08-04 10:11:04', '2016-08-04 10:11:10', '0', '1', '1', '2', '可售20套', '1');

-- ----------------------------
-- Table structure for `tb_store`
-- ----------------------------
DROP TABLE IF EXISTS `tb_store`;
CREATE TABLE `tb_store` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:逻辑删除',
  `STORE_CODE` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '门店编码',
  `PHONE_NO` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '联系电话',
  `NAME` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '门店名称',
  `ADDRESS` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '门店地址',
  `TB_AGENCY_ID` bigint(20) DEFAULT NULL COMMENT '所属机构',
  `AGENCY_NAME` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '机构 名称',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='门店';

-- ----------------------------
-- Records of tb_store
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_user_commission`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_commission`;
CREATE TABLE `tb_user_commission` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:逻辑删除',
  `TS_USER_ID` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `TS_CUSTOMER_ID` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `CUSTOMER_NAME` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '客户姓名',
  `CUSTOMER_PHONE` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '客户手机号',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '所属楼盘',
  `BUILDING_NAME` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '楼盘名称',
  `TRADE_TIME` datetime DEFAULT NULL COMMENT '成交时间',
  `AMOUNT` decimal(8,2) DEFAULT NULL COMMENT '佣金金额',
  `STATUS` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '结佣状态：1：以结佣，0：未结佣',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户佣金表';

-- ----------------------------
-- Records of tb_user_commission
-- ----------------------------
INSERT INTO `tb_user_commission` VALUES ('1', '2016-08-08 10:40:27', '2016-08-08 10:40:30', '0', '1', '1', 'sun', '131132', '1', '金水湾', '2016-08-07 10:41:33', '10000.00', '1');
INSERT INTO `tb_user_commission` VALUES ('2', '2016-08-08 10:43:00', '2016-08-08 10:43:09', '0', '1', '2', 'sun1', '131131', '1', '金水湾', '2016-08-07 10:43:59', '10000.00', '1');
INSERT INTO `tb_user_commission` VALUES ('3', '2016-07-22 10:50:51', '2016-07-29 10:51:08', '0', '1', '3', 'sun3', '131133', '1', '金水湾', '2016-07-20 10:51:46', '10000.00', '1');

-- ----------------------------
-- Table structure for `ts_assets`
-- ----------------------------
DROP TABLE IF EXISTS `ts_assets`;
CREATE TABLE `ts_assets` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL,
  `FILE_NAME` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '文件名称',
  `CONTENT_TYPE` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '类型',
  `STORE_PATH` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '存储路径',
  `FILE_SIZE` int(11) DEFAULT NULL COMMENT '文件大小',
  `CODE` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '编码',
  `PRIORITY` int(11) DEFAULT NULL COMMENT '优先级',
  `IMAGE_URL` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '图片地址',
  `LINK_URL` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '跳转地址',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='资产表';

-- ----------------------------
-- Records of ts_assets
-- ----------------------------
INSERT INTO `ts_assets` VALUES ('1', '2016-07-30 18:33:55', '2016-07-30 18:33:58', '0', 'topImage1.png', null, null, null, '01', '1', 'https://image2.suning.cn/uimg/cms/img/146821740560176967.jpg', 'https://licai.suning.com/lcportal/portal/fund/list.htm?channelCode=PC_LCSY_daohang4');
INSERT INTO `ts_assets` VALUES ('2', '2016-07-30 18:34:22', '2016-07-30 18:34:25', '0', 'topImage2.png', null, null, null, '01', '2', 'https://image5.suning.cn/uimg/cms/img/146821169930457793.jpg', 'https://licai.suning.com/lcportal/portal/period/list.htm?channelCode=PC_LCSY_daohang3');
INSERT INTO `ts_assets` VALUES ('3', '2016-07-30 22:11:29', '2016-07-30 22:11:32', '0', 'hotBuildingImage.png', null, null, null, '02', '1', 'https://image5.suning.cn/uimg/cms/img/146821169930457793.jpg', null);
INSERT INTO `ts_assets` VALUES ('4', '2016-07-31 11:34:55', '2016-07-31 11:34:58', '0', 'topBuildingDetail1.png', null, null, null, '03', '1', 'https://image5.suning.cn/uimg/cms/img/146821169930457793.jpg', null);
INSERT INTO `ts_assets` VALUES ('5', '2016-07-31 11:36:08', '2016-07-31 11:36:10', '0', 'topBuildingDetail2.png', null, null, null, '03', '2', 'https://image5.suning.cn/uimg/cms/img/146821169930457793.jpg', null);
INSERT INTO `ts_assets` VALUES ('6', '2016-07-31 11:36:34', '2016-07-31 11:36:36', '0', 'topBuildingDetail3.png', null, null, null, '03', '3', 'https://image5.suning.cn/uimg/cms/img/146821169930457793.jpg', null);

-- ----------------------------
-- Table structure for `ts_code_detail`
-- ----------------------------
DROP TABLE IF EXISTS `ts_code_detail`;
CREATE TABLE `ts_code_detail` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:逻辑删除',
  `PARENT_ID` bigint(20) DEFAULT NULL,
  `CODE` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '键',
  `VALUE` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '值',
  `TS_CODE_LIST_ID` bigint(20) DEFAULT NULL COMMENT 'TS_CODE_LIST ID',
  `REMARK` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统参数详情表';

-- ----------------------------
-- Records of ts_code_detail
-- ----------------------------
INSERT INTO `ts_code_detail` VALUES ('1', '2016-07-30 22:24:13', '2016-07-30 22:24:15', '0', null, 'NEW', '1', '1', '新楼盘');

-- ----------------------------
-- Table structure for `ts_code_list`
-- ----------------------------
DROP TABLE IF EXISTS `ts_code_list`;
CREATE TABLE `ts_code_list` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:逻辑删除',
  `NAME` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '参数名称',
  `CODE` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '参数编码',
  `REMARK` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统参数列表';

-- ----------------------------
-- Records of ts_code_list
-- ----------------------------
INSERT INTO `ts_code_list` VALUES ('1', '2016-07-30 22:20:11', '2016-07-30 22:20:13', '0', '楼盘标签', 'BuildingLabel', '楼盘标签');

-- ----------------------------
-- Table structure for `ts_menu`
-- ----------------------------
DROP TABLE IF EXISTS `ts_menu`;
CREATE TABLE `ts_menu` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL,
  `TS_ROLE_ID` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `MENU_NAME` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '菜单名称',
  `LEVEL` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '菜单级别：1：一级菜单2：二级菜单3：三级菜单',
  `LINK_URL` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '链接地址',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜单表';

-- ----------------------------
-- Records of ts_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_role`
-- ----------------------------
DROP TABLE IF EXISTS `ts_role`;
CREATE TABLE `ts_role` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL,
  `NAME` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '角色名称',
  `CODE` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '角色编码',
  `REMARK` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色表';

-- ----------------------------
-- Records of ts_role
-- ----------------------------

-- ----------------------------
-- Table structure for `ts_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `ts_role_menu`;
CREATE TABLE `ts_role_menu` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL,
  `TS_ROLE_ID` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `TS_MENU_ID` bigint(20) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色菜单关联表';

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
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:逻辑删除',
  `USER_CODE` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `USER_NAME` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PHONE_NO` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `NAME` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `ID_CARD` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '身份证号',
  `ID_CARD_IMAGE_URL` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '身份证正面照片图片地址',
  `BUSINESS_CARD_IMAGE_URL` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '名片照片地址，置业顾问使用',
  `BUSINESS_CITY_ID` bigint(20) DEFAULT NULL COMMENT '业务城市ID',
  `BUSINESS_CITY_NAME` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TB_STORE_ID` bigint(20) DEFAULT NULL COMMENT '所属经济公司，经济人使用',
  `AUTHENTICATION` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否已认证：0：未认证，1：已认证',
  `LEVEL` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '用户级别：1：铁牌，2：铜牌，3：银牌，4：金牌',
  `ID_CARD_IMAGE_URL2` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '头像图片地址',
  `SEX` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '性别 1:男 2:女',
  `WORKING_SENIORITY` int(11) DEFAULT NULL COMMENT '从业年限',
  `DECLARATION` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '服务宣言',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户表';

-- ----------------------------
-- Records of ts_user
-- ----------------------------
INSERT INTO `ts_user` VALUES ('1', '2016-07-28 21:00:14', '2016-07-28 21:00:16', '0', '1', '2', '123456', '15909099900', 'bb', 'dfdfd', 'fdfddf', 'dfdfd', '1212', 'dfdfdf', '12', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `ts_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `ts_user_role`;
CREATE TABLE `ts_user_role` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL,
  `TS_USER_ID` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `TS_ROLE_ID` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户角色关联表';

-- ----------------------------
-- Records of ts_user_role
-- ----------------------------
