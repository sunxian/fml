/*
Navicat MySQL Data Transfer

Source Server         : fml
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : fml

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2016-07-31 15:31:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_agency
-- ----------------------------
DROP TABLE IF EXISTS `tb_agency`;
CREATE TABLE `tb_agency` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:�߼�ɾ��',
  `AGENCY_CODE` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '��������',
  `PHONE_NO` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `NAME` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '��������',
  `BUSINESS_CITY_ID` bigint(20) DEFAULT NULL COMMENT 'ҵ�����ID',
  `BUSINESS_CITY_NAME` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'ҵ���������',
  `AUTHENTICATION` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '�Ƿ�����֤��0��δ��֤��1������֤',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='�н鹫˾';

-- ----------------------------
-- Records of tb_agency
-- ----------------------------

-- ----------------------------
-- Table structure for tb_building
-- ----------------------------
DROP TABLE IF EXISTS `tb_building`;
CREATE TABLE `tb_building` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:�߼�ɾ��',
  `TYPE` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '¥�����ͣ�1�������ֵ���¥�̣�2�������ַ���¥��',
  `NAME` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '¥������',
  `AVERAGE_PRICE` decimal(8,2) DEFAULT NULL COMMENT '����',
  `ADDRESS` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '¥�̵�ַ',
  `NEWS_UPDATE` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '���¶�̬�����ֶ���Ҫɾ�����Ѿ�������¶�̬��',
  `LEAD_TIME` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '��סʱ��',
  `PROPERTY_TYPE` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '��ҵ����',
  `BUILDING_TYPE` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '��������',
  `RENOVATION_STATUS` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'װ��״��',
  `HOUSEHOLDS` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'ס����',
  `VOLUME_RATIO` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '�ݻ���',
  `GREENING_RATE` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '�̻���',
  `PARKING_SPACE` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT 'ͣ��λ',
  `PERIOD_OF_RIGHTS` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '��Ȩ����',
  `DEVELOPERS_ID` bigint(20) DEFAULT NULL COMMENT '������ID',
  `DEVELOPERS_NAME` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '����������',
  `PRE_SALE_PERMIT` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT 'Ԥ�����',
  `PROPERTY_FEE` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '��ҵ��',
  `PROPERTY_COMPANY` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '��ҵ��˾����',
  `DEVELOPERS_DESC` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '������˵��',
  `DESCP` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '¥������',
  `FLAG` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '��ǩ��ֵΪ������ts_code_detail���code',
  `LONGITUDE` decimal(10,5) DEFAULT NULL COMMENT '����',
  `LATITUDE` decimal(10,5) DEFAULT NULL COMMENT 'γ��',
  `ZOOM` int(11) DEFAULT NULL COMMENT '��ͼ�Ŵ󼶱�',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='¥�̱�';

-- ----------------------------
-- Records of tb_building
-- ----------------------------
INSERT INTO `tb_building` VALUES ('1', '2016-07-30 22:40:51', '2016-07-30 22:40:53', '0', null, 'ӡ��ŷ��', '20000.00', '��������԰·�ĺ�', '3��1�ռ���21#��װ��Ԣ', 'Ԥ��2016���°���15#��18#����', 'סլ', '��¥��С�߲㣬�߲�', 'ë��', '1583��', '1.80', '30%', 'סլ��������1588�����ǻ�����2375������ҵ��������474�����ǻ�����568��', '70��', '1', '���ݽ����Ԫ��ҵ���޹�˾', '�շ�Ԥ����2016016��', '2.37Ԫ', '�����ҵ', null, 'ӡ��ŷ��ռ�����50����ƽ�ף�Լ9900��������滮��...', 'NEW', null, null, null);

-- ----------------------------
-- Table structure for tb_building_collection
-- ----------------------------
DROP TABLE IF EXISTS `tb_building_collection`;
CREATE TABLE `tb_building_collection` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:�߼�ɾ��',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '¥��ID',
  `TS_USER_ID` bigint(20) DEFAULT NULL COMMENT '�û�id',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='¥���ղر�';

-- ----------------------------
-- Records of tb_building_collection
-- ----------------------------
INSERT INTO `tb_building_collection` VALUES ('1', '2016-07-31 09:48:31', '2016-07-31 09:48:33', '0', '1', '1');

-- ----------------------------
-- Table structure for tb_building_image
-- ----------------------------
DROP TABLE IF EXISTS `tb_building_image`;
CREATE TABLE `tb_building_image` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:�߼�ɾ��',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '¥��id',
  `TS_ASSETS_ID` bigint(20) DEFAULT NULL COMMENT '�ʲ���id',
  `TYPE` varchar(4) COLLATE utf8_bin DEFAULT NULL COMMENT '¥��ͼƬ����',
  `PRIORITY` int(11) DEFAULT NULL COMMENT '���ȼ�',
  `REMARK` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '��ע��Ϣ',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='¥��ͼƬ������';

-- ----------------------------
-- Records of tb_building_image
-- ----------------------------
INSERT INTO `tb_building_image` VALUES ('1', '2016-07-30 21:41:02', '2016-07-30 21:41:04', '0', '1', '3', '01', '1', '�����ͼ');
INSERT INTO `tb_building_image` VALUES ('2', '2016-07-30 21:43:16', '2016-07-30 21:43:18', '0', '1', null, '02', '1', '�б�����ͼ');
INSERT INTO `tb_building_image` VALUES ('3', '2016-07-31 11:12:23', '2016-07-31 11:12:25', '0', '1', '4', '03', '1', '¥������ҳ����ͼƬ');
INSERT INTO `tb_building_image` VALUES ('4', '2016-07-31 11:13:19', '2016-07-31 11:13:20', '0', '1', '5', '03', '2', '¥������ҳ����ͼƬ');
INSERT INTO `tb_building_image` VALUES ('5', '2016-07-31 11:14:07', '2016-07-31 11:14:09', '0', '1', '6', '03', '3', '¥������ҳ����ͼƬ');

-- ----------------------------
-- Table structure for tb_building_label
-- ----------------------------
DROP TABLE IF EXISTS `tb_building_label`;
CREATE TABLE `tb_building_label` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:�߼�ɾ��',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '¥��ID',
  `LABEL_NAME` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '��ǩ����',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='¥�̱�ǩ��';

-- ----------------------------
-- Records of tb_building_label
-- ----------------------------
INSERT INTO `tb_building_label` VALUES ('1', '2016-07-31 10:39:53', '2016-07-31 10:39:55', '0', '1', '���̼���');
INSERT INTO `tb_building_label` VALUES ('2', '2016-07-31 10:40:28', '2016-07-31 10:40:30', '0', '1', '˫��');
INSERT INTO `tb_building_label` VALUES ('3', '2016-07-31 10:40:46', '2016-07-31 10:40:49', '0', '1', 'סլ');
INSERT INTO `tb_building_label` VALUES ('4', '2016-07-31 10:41:04', '2016-07-31 10:41:06', '0', '1', '����');
INSERT INTO `tb_building_label` VALUES ('5', '2016-07-31 10:41:23', '2016-07-31 10:41:26', '0', '1', '�߲�');

-- ----------------------------
-- Table structure for tb_commission
-- ----------------------------
DROP TABLE IF EXISTS `tb_commission`;
CREATE TABLE `tb_commission` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:�߼�ɾ��',
  `DEVELOPERS_ID` bigint(20) DEFAULT NULL COMMENT '������id',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '����¥��',
  `TYPE` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '���',
  `TS_ROLE_ID` bigint(20) DEFAULT NULL COMMENT '��ӵ��������ɫ',
  `AMOUNT` decimal(8,2) DEFAULT NULL COMMENT 'Ӷ��',
  `DESCP` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '����',
  `SETTLEMENT_NODE` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '��Ӷ�ڵ�',
  `SHOW_INDEX` int(11) DEFAULT NULL COMMENT 'չʾ˳��',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Ӷ���';

-- ----------------------------
-- Records of tb_commission
-- ----------------------------
INSERT INTO `tb_commission` VALUES ('1', '2016-07-31 13:33:01', '2016-07-31 13:33:03', '0', '1', '1', '93ƽ������', '1', '8000.00', '�������յ������̿���8000Ԫ��', 'ǩԼ', '1');
INSERT INTO `tb_commission` VALUES ('2', '2016-07-31 13:33:58', '2016-07-31 13:34:01', '0', '1', '1', '����', '1', '20000.00', '�������յ������̿���20000Ԫ��', 'ǩԼ', '2');

-- ----------------------------
-- Table structure for tb_cooperation_building
-- ----------------------------
DROP TABLE IF EXISTS `tb_cooperation_building`;
CREATE TABLE `tb_cooperation_building` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:�߼�ɾ��',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '¥��ID',
  `COOPERATIONBUILDING_ID` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '����¥��ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='����¥��';

-- ----------------------------
-- Records of tb_cooperation_building
-- ----------------------------

-- ----------------------------
-- Table structure for tb_customer
-- ----------------------------
DROP TABLE IF EXISTS `tb_customer`;
CREATE TABLE `tb_customer` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:�߼�ɾ��',
  `NAME` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '�ͻ�����',
  `PNONE_NO` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '�ͻ��ֻ���',
  `FOLLOW_UP_METHOD` varchar(0) COLLATE utf8_bin DEFAULT NULL COMMENT '������ʽ��1���绰��2��������3��Լ��',
  `LEVEL` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '�ͻ��ȼ���ABCDE',
  `REMARK` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '��ע��Ϣ',
  `EFFECTIVE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '�Ƿ���Ч�ͻ���־��1����Ч��0����Ч',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='�ͻ���';

-- ----------------------------
-- Records of tb_customer
-- ----------------------------

-- ----------------------------
-- Table structure for tb_customer_intention
-- ----------------------------
DROP TABLE IF EXISTS `tb_customer_intention`;
CREATE TABLE `tb_customer_intention` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:�߼�ɾ��',
  `TYPE` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '�������1�����ͣ�2����ͼ۸�3����߼۸�4������5������',
  `TS_CODE_DETAIL_ID` bigint(20) DEFAULT NULL COMMENT 'ϵͳ������id',
  `VALUE` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '����ֵ',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='�ͻ����������';

-- ----------------------------
-- Records of tb_customer_intention
-- ----------------------------

-- ----------------------------
-- Table structure for tb_customer_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_customer_report`;
CREATE TABLE `tb_customer_report` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:�߼�ɾ��',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '����¥��ID',
  `STATUS` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '����״̬��Ĭ��1���ѱ�����2���Ѵ�����3���ѳɽ���4����Ч�ͻ�',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='�ͻ�����¥�̱�';

-- ----------------------------
-- Records of tb_customer_report
-- ----------------------------

-- ----------------------------
-- Table structure for tb_developers
-- ----------------------------
DROP TABLE IF EXISTS `tb_developers`;
CREATE TABLE `tb_developers` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:�߼�ɾ��',
  `NAME` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '����������',
  `COOP_STARTTIME` datetime DEFAULT NULL COMMENT '������ʼʱ��',
  `COOP_ENDTIME` datetime DEFAULT NULL COMMENT '��������ʱ��',
  `PURCHASE_ENDTIME` datetime DEFAULT NULL COMMENT '�Ϲ���ֹʱ��',
  `COOP_BUILDING` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '������Դ',
  `RULE` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '�����̹���',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='�����̱�';

-- ----------------------------
-- Records of tb_developers
-- ----------------------------
INSERT INTO `tb_developers` VALUES ('1', '2016-07-31 14:23:42', '2016-07-31 14:23:44', '0', '���ݽ����Ԫ��ҵ���޹�˾', '2016-07-31 14:23:59', '2016-07-31 14:24:02', null, '', null);

-- ----------------------------
-- Table structure for tb_developers_news
-- ----------------------------
DROP TABLE IF EXISTS `tb_developers_news`;
CREATE TABLE `tb_developers_news` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:�߼�ɾ��',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '������ID',
  `TITLE` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '��̬����',
  `RELEASE_TIME` datetime DEFAULT NULL COMMENT '����ʱ��',
  `CONTENT` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '��̬����',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='���¶�̬';

-- ----------------------------
-- Records of tb_developers_news
-- ----------------------------
INSERT INTO `tb_developers_news` VALUES ('1', '2016-07-31 13:51:58', '2016-07-31 13:52:00', '0', '1', '�������԰ĿǰС�߲�11��13#����', '2016-07-31 13:52:41', '�������԰ĿǰС�߲�11��13#���ۣ�ʣ��20�����ҷ�Դ���������11#�������89�O������19500Ԫ/�O');

-- ----------------------------
-- Table structure for tb_headlines
-- ----------------------------
DROP TABLE IF EXISTS `tb_headlines`;
CREATE TABLE `tb_headlines` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:�߼�ɾ��',
  `TITLE` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '��̬����',
  `RELEASE_TIME` datetime DEFAULT NULL COMMENT '����ʱ��',
  `CONTENT` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '��̬����',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='����ͷ��';

-- ----------------------------
-- Records of tb_headlines
-- ----------------------------
INSERT INTO `tb_headlines` VALUES ('1', '2016-07-30 20:08:23', '2016-07-30 20:08:24', '0', '���¼�����get����', '2016-07-30 20:08:43', '���¼�����get���𣿲�������');

-- ----------------------------
-- Table structure for tb_hot_building
-- ----------------------------
DROP TABLE IF EXISTS `tb_hot_building`;
CREATE TABLE `tb_hot_building` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:�߼�ɾ��',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '¥��id',
  `NAME` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '¥������',
  `PRIORITY` int(11) DEFAULT NULL COMMENT 'չʾ���ȼ�',
  `DESCP` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '¥������',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='��Ʒ¥�̱�';

-- ----------------------------
-- Records of tb_hot_building
-- ----------------------------
INSERT INTO `tb_hot_building` VALUES ('1', '2016-07-30 21:54:47', '2016-07-30 21:54:49', '0', '1', 'ӡ��ŷ��', '1', 'ӡ��ŷ��ռ�����50����ƽ�ף�Լ9900��������滮��...');

-- ----------------------------
-- Table structure for tb_house_ban
-- ----------------------------
DROP TABLE IF EXISTS `tb_house_ban`;
CREATE TABLE `tb_house_ban` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:�߼�ɾ��',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '����¥��',
  `NAME` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '¥������',
  `IMAGE_URL` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '¥��ͼƬ��ַ',
  `OPEN_TIME` datetime DEFAULT NULL COMMENT '���¿���ʱ��',
  `LEAD_TIME` datetime DEFAULT NULL COMMENT '������סʱ��',
  `UNITS` int(11) DEFAULT NULL COMMENT '��Ԫ��',
  `HOUSE_RATIO` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '¥����',
  `LAYERS` int(11) DEFAULT NULL COMMENT '¥����',
  `SALING_HOUSES` int(11) DEFAULT NULL COMMENT '���۷�Դ��',
  `IS_SALING_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '���۱�ʶ��1�����ۣ�0��δ��',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='¥����Ϣ';

-- ----------------------------
-- Records of tb_house_ban
-- ----------------------------
INSERT INTO `tb_house_ban` VALUES ('1', '2016-07-31 15:00:40', '2016-07-31 15:00:41', '0', '1', '9��', 'http://1232323232.png', '2016-07-31 15:00:59', '2016-07-31 15:01:01', '2', '2¥4��', '18', '150', '1');

-- ----------------------------
-- Table structure for tb_house_type
-- ----------------------------
DROP TABLE IF EXISTS `tb_house_type`;
CREATE TABLE `tb_house_type` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:�߼�ɾ��',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '����¥��',
  `TB_HOUSE_BAN_ID` bigint(20) DEFAULT NULL COMMENT '����¥��',
  `NAME` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '��������',
  `DESCP` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '��������',
  `IMAGE_URL` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '����ͼƬ��ַ',
  `LIVING_ROOMS` int(11) DEFAULT NULL COMMENT '������',
  `BEDROOMS` int(11) DEFAULT NULL COMMENT '������',
  `TOILETS` int(11) DEFAULT NULL COMMENT '��������Ŀ',
  `SQUARE` decimal(8,2) DEFAULT NULL COMMENT '���',
  `UNIT_PRICE` decimal(10,2) DEFAULT NULL COMMENT '����',
  `POSITION` bigint(20) DEFAULT NULL COMMENT 'λ��\r\n            ����ʡ������',
  `TOTAL_PRICE` decimal(10,2) DEFAULT NULL COMMENT '�ܼ�',
  `IS_MAIN_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '�Ƿ��������ͣ�1���������ͣ�0������������',
  `IS_SALING_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '���۱�ʶ��1�����ۣ�0��δ��',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='���ͱ�������˱�';

-- ----------------------------
-- Records of tb_house_type
-- ----------------------------
INSERT INTO `tb_house_type` VALUES ('1', '2016-07-31 14:54:22', '2016-07-31 14:54:24', '0', '1', '1', '2��1��1��', '�߲��׼��B1', 'http://232323232.png', '1', '3', '1', '98.00', '18000.00', null, '1600000.00', '1', '1');

-- ----------------------------
-- Table structure for tb_house_type_label
-- ----------------------------
DROP TABLE IF EXISTS `tb_house_type_label`;
CREATE TABLE `tb_house_type_label` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:�߼�ɾ��',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '¥��ID',
  `TB_HOUSE_BAN_ID` bigint(20) DEFAULT NULL COMMENT '¥��ID',
  `TB_HOUSE_TYPE_ID` bigint(20) DEFAULT NULL COMMENT '��������',
  `LABEL_ID` bigint(20) DEFAULT NULL COMMENT '������ ���ͱ�ǩ',
  `SHOW_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '�Ƿ�չʾ��0��չʾ��1չʾ',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='���ͱ�ǩ/����';

-- ----------------------------
-- Records of tb_house_type_label
-- ----------------------------

-- ----------------------------
-- Table structure for tb_store
-- ----------------------------
DROP TABLE IF EXISTS `tb_store`;
CREATE TABLE `tb_store` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:�߼�ɾ��',
  `STORE_CODE` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '�ŵ����',
  `PHONE_NO` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '��ϵ�绰',
  `NAME` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '�ŵ�����',
  `ADDRESS` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '�ŵ��ַ',
  `TB_AGENCY_ID` bigint(20) DEFAULT NULL COMMENT '��������',
  `AGENCY_NAME` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '���� ����',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='�ŵ�';

-- ----------------------------
-- Records of tb_store
-- ----------------------------

-- ----------------------------
-- Table structure for tb_user_commission
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_commission`;
CREATE TABLE `tb_user_commission` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:�߼�ɾ��',
  `TS_USER_ID` bigint(20) DEFAULT NULL COMMENT '�û�ID',
  `TS_CUSTOMER_ID` bigint(20) DEFAULT NULL COMMENT '�ͻ�ID',
  `CUSTOMER_NAME` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '�ͻ�����',
  `CUSTOMER_PHONE` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '�ͻ��ֻ���',
  `TB_BUILDING_ID` bigint(20) DEFAULT NULL COMMENT '����¥��',
  `BUILDING_NAME` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '¥������',
  `TRADE_TIME` datetime DEFAULT NULL COMMENT '�ɽ�ʱ��',
  `AMOUNT` decimal(8,2) DEFAULT NULL COMMENT 'Ӷ����',
  `STATUS` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '��Ӷ״̬��1���Խ�Ӷ��0��δ��Ӷ',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='�û�Ӷ���';

-- ----------------------------
-- Records of tb_user_commission
-- ----------------------------

-- ----------------------------
-- Table structure for ts_assets
-- ----------------------------
DROP TABLE IF EXISTS `ts_assets`;
CREATE TABLE `ts_assets` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL,
  `FILE_NAME` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '�ļ�����',
  `CONTENT_TYPE` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '����',
  `STORE_PATH` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '�洢·��',
  `FILE_SIZE` int(11) DEFAULT NULL COMMENT '�ļ���С',
  `CODE` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '����',
  `PRIORITY` int(11) DEFAULT NULL COMMENT '���ȼ�',
  `IMAGE_URL` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT 'ͼƬ��ַ',
  `LINK_URL` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '��ת��ַ',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='�ʲ���';

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
-- Table structure for ts_code_detail
-- ----------------------------
DROP TABLE IF EXISTS `ts_code_detail`;
CREATE TABLE `ts_code_detail` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:�߼�ɾ��',
  `PARENT_ID` bigint(20) DEFAULT NULL,
  `CODE` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '��',
  `VALUE` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'ֵ',
  `TS_CODE_LIST_ID` bigint(20) DEFAULT NULL COMMENT 'TS_CODE_LIST ID',
  `REMARK` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '��ע',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='ϵͳ���������';

-- ----------------------------
-- Records of ts_code_detail
-- ----------------------------
INSERT INTO `ts_code_detail` VALUES ('1', '2016-07-30 22:24:13', '2016-07-30 22:24:15', '0', null, 'NEW', '1', '1', '��¥��');

-- ----------------------------
-- Table structure for ts_code_list
-- ----------------------------
DROP TABLE IF EXISTS `ts_code_list`;
CREATE TABLE `ts_code_list` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:�߼�ɾ��',
  `NAME` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '��������',
  `CODE` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '��������',
  `REMARK` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '��ע',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='ϵͳ�����б�';

-- ----------------------------
-- Records of ts_code_list
-- ----------------------------
INSERT INTO `ts_code_list` VALUES ('1', '2016-07-30 22:20:11', '2016-07-30 22:20:13', '0', '¥�̱�ǩ', 'BuildingLabel', '¥�̱�ǩ');

-- ----------------------------
-- Table structure for ts_menu
-- ----------------------------
DROP TABLE IF EXISTS `ts_menu`;
CREATE TABLE `ts_menu` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL,
  `TS_ROLE_ID` bigint(20) DEFAULT NULL COMMENT '��ɫID',
  `MENU_NAME` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '�˵�����',
  `LEVEL` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '�˵�����1��һ���˵�2�������˵�3�������˵�',
  `LINK_URL` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '���ӵ�ַ',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='�˵���';

-- ----------------------------
-- Records of ts_menu
-- ----------------------------

-- ----------------------------
-- Table structure for ts_role
-- ----------------------------
DROP TABLE IF EXISTS `ts_role`;
CREATE TABLE `ts_role` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL,
  `NAME` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '��ɫ����',
  `CODE` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '��ɫ����',
  `REMARK` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '��ע',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='��ɫ��';

-- ----------------------------
-- Records of ts_role
-- ----------------------------

-- ----------------------------
-- Table structure for ts_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `ts_role_menu`;
CREATE TABLE `ts_role_menu` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL,
  `TS_ROLE_ID` bigint(20) DEFAULT NULL COMMENT '��ɫID',
  `TS_MENU_ID` bigint(20) DEFAULT NULL COMMENT '�û�ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='��ɫ�˵�������';

-- ----------------------------
-- Records of ts_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for ts_user
-- ----------------------------
DROP TABLE IF EXISTS `ts_user`;
CREATE TABLE `ts_user` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:�߼�ɾ��',
  `USER_CODE` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `USER_NAME` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PHONE_NO` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `NAME` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '����',
  `ID_CARD` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '���֤��',
  `ID_CARD_IMAGE_URL` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '���֤������ƬͼƬ��ַ',
  `BUSINESS_CARD_IMAGE_URL` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '��Ƭ��Ƭ��ַ����ҵ����ʹ��',
  `BUSINESS_CITY_ID` bigint(20) DEFAULT NULL COMMENT 'ҵ�����ID',
  `BUSINESS_CITY_NAME` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TB_STORE_ID` bigint(20) DEFAULT NULL COMMENT '�������ù�˾��������ʹ��',
  `AUTHENTICATION` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '�Ƿ�����֤��0��δ��֤��1������֤',
  `LEVEL` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '�û�����1�����ƣ�2��ͭ�ƣ�3�����ƣ�4������',
  `ID_CARD_IMAGE_URL2` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'ͷ��ͼƬ��ַ',
  `SEX` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '�Ա� 1:�� 2:Ů',
  `WORKING_SENIORITY` int(11) DEFAULT NULL COMMENT '��ҵ����',
  `DECLARATION` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '��������',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='�û���';

-- ----------------------------
-- Records of ts_user
-- ----------------------------
INSERT INTO `ts_user` VALUES ('1', '2016-07-28 21:00:14', '2016-07-28 21:00:16', '0', '1', '2', '123456', '15909099900', 'bb', 'dfdfd', 'fdfddf', 'dfdfd', '1212', 'dfdfdf', '12', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for ts_user_role
-- ----------------------------
DROP TABLE IF EXISTS `ts_user_role`;
CREATE TABLE `ts_user_role` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DELETE_FLAG` char(1) COLLATE utf8_bin DEFAULT NULL,
  `TS_USER_ID` bigint(20) DEFAULT NULL COMMENT '�û�ID',
  `TS_ROLE_ID` bigint(20) DEFAULT NULL COMMENT '��ɫID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='�û���ɫ������';

-- ----------------------------
-- Records of ts_user_role
-- ----------------------------
