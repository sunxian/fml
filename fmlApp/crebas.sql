/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/7/30 23:10:38                           */
/*==============================================================*/


drop table if exists TB_AGENCY;

drop table if exists TB_BUILDING;

drop table if exists TB_BUILDING_IMAGE;

drop table if exists TB_BUILDING_LABEL;

drop table if exists TB_COMMISSION;

drop table if exists TB_COOPERATION_BUILDING;

drop table if exists TB_CUSTOMER;

drop table if exists TB_CUSTOMER_INTENTION;

drop table if exists TB_CUSTOMER_REPORT;

drop table if exists TB_DEVELOPERS;

drop table if exists TB_DEVELOPERS_NEWS;

drop table if exists TB_HEADLINES;

drop table if exists TB_HOT_BUILDING;

drop table if exists TB_HOUSE_BAN;

drop table if exists TB_HOUSE_TYPE;

drop table if exists TB_HOUSE_TYPE_LABEL;

drop table if exists TB_STORE;

drop table if exists TB_USER_COMMISSION;

drop table if exists TS_ASSETS;

drop table if exists TS_CODE_DETAIL;

drop table if exists TS_CODE_LIST;

drop table if exists TS_MENU;

drop table if exists TS_ROLE;

drop table if exists TS_ROLE_MENU;

drop table if exists TS_USER;

drop table if exists TS_USER_ROLE;

/*==============================================================*/
/* Table: TB_AGENCY                                             */
/*==============================================================*/
create table TB_AGENCY
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:逻辑删除',
   AGENCY_CODE          varchar(16) comment '机构编码',
   PHONE_NO             varchar(16),
   NAME                 varchar(32) comment '机构名称',
   BUSINESS_CITY_ID     bigint comment '业务城市ID',
   BUSINESS_CITY_NAME   varchar(64) comment '业务城市名称',
   AUTHENTICATION       char(1) comment '是否已认证：0：未认证，1：已认证',
   primary key (ID)
);

alter table TB_AGENCY comment '中介公司';

/*==============================================================*/
/* Table: TB_BUILDING                                           */
/*==============================================================*/
create table TB_BUILDING
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:逻辑删除',
   TYPE                 char(1) comment '楼盘类型：1：房麦乐电商楼盘，2：放麦乐分销楼盘',
   NAME                 varchar(256) comment '楼盘名称',
   AVERAGE_PRICE        decimal(8,2) comment '均价',
   ADDRESS              varchar(256) comment '楼盘地址',
   NEWS_UPDATE          varchar(256) comment '最新动态。此字段需要删除，已经添加最新动态表',
   LEAD_TIME            varchar(256) comment '入住时间',
   PROPERTY_TYPE        varchar(32) comment '物业类型',
   BUILDING_TYPE        varchar(32) comment '建筑类型',
   RENOVATION_STATUS    varchar(32) comment '装修状况',
   HOUSEHOLDS           varchar(32) comment '住户数',
   VOLUME_RATIO         varchar(8) comment '容积率',
   GREENING_RATE        varchar(8) comment '绿化率',
   PARKING_SPACE        varchar(256) comment '停车位',
   PERIOD_OF_RIGHTS     varchar(32) comment '产权年限',
   DEVELOPERS_ID        bigint comment '开发商ID',
   DEVELOPERS_NAME      varchar(128) comment '开发商名称',
   PRE_SALE_PERMIT      varchar(256) comment '预售许可',
   PROPERTY_FEE         varchar(64) comment '物业费',
   PROPERTY_COMPANY     varchar(256) comment '物业公司名称',
   DEVELOPERS_DESC      varchar(256) comment '开发商说明',
   LONGITUDE            decimal(10,5) comment '经度',
   LATITUDE             decimal(10,5) comment '纬度',
   ZOOM                 int comment '地图放大级别',
   primary key (ID)
);

alter table TB_BUILDING comment '楼盘表';

/*==============================================================*/
/* Table: TB_BUILDING_IMAGE                                     */
/*==============================================================*/
create table TB_BUILDING_IMAGE
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:逻辑删除',
   TB_BUILDING_ID       bigint comment '楼盘id',
   TS_ASSETS_ID         bigint comment '资产表id',
   TYPE                 varchar(4) comment '楼盘图片类型',
   PRIORITY             int comment '优先级',
   REMARK               varchar(256) comment '备注信息',
   primary key (ID)
);

alter table TB_BUILDING_IMAGE comment '楼盘图片关联表';

/*==============================================================*/
/* Table: TB_BUILDING_LABEL                                     */
/*==============================================================*/
create table TB_BUILDING_LABEL
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:逻辑删除',
   TB_BUILDING_ID       bigint comment '楼盘ID',
   LABEL_ID             bigint comment '标签ID 主数据表',
   SHOW_FLAG            char(1) comment '是否展示：0不展示，1展示',
   primary key (ID)
);

alter table TB_BUILDING_LABEL comment '楼盘标签/属性';

/*==============================================================*/
/* Table: TB_COMMISSION                                         */
/*==============================================================*/
create table TB_COMMISSION
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:逻辑删除',
   DEVELOPERS_ID        bigint comment '开发商id',
   TB_BUILDING_ID       bigint comment '所属楼盘',
   TYPE                 char(2) comment '类别',
   TS_ROLE_ID           bigint comment '该拥金所属角色',
   AMOUNT               decimal(8,2) comment '佣金',
   DESCP                varchar(256) comment '描述',
   SETTLEMENT_NODE      varchar(32) comment '结佣节点',
   SHOW_INDEX           int comment '展示顺序',
   primary key (ID)
);

alter table TB_COMMISSION comment '佣金表';

/*==============================================================*/
/* Table: TB_COOPERATION_BUILDING                               */
/*==============================================================*/
create table TB_COOPERATION_BUILDING
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:逻辑删除',
   TB_BUILDING_ID       bigint comment '楼盘ID',
   COOPERATIONBUILDING_ID varchar(256) comment '合作楼盘ID',
   primary key (ID)
);

alter table TB_COOPERATION_BUILDING comment '合作楼盘';

/*==============================================================*/
/* Table: TB_CUSTOMER                                           */
/*==============================================================*/
create table TB_CUSTOMER
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:逻辑删除',
   NAME                 varchar(32) comment '客户姓名',
   PNONE_NO             varchar(32) comment '客户手机号',
   FOLLOW_UP_METHOD     varchar(0) comment '跟进方式：1：电话，2：带看，3：约看',
   LEVEL                varchar(2) comment '客户等级：ABCDE',
   REMARK               varchar(256) comment '备注信息',
   EFFECTIVE_FLAG       char(1) comment '是否有效客户标志：1：有效，0：无效',
   primary key (ID)
);

alter table TB_CUSTOMER comment '客户表';

/*==============================================================*/
/* Table: TB_CUSTOMER_INTENTION                                 */
/*==============================================================*/
create table TB_CUSTOMER_INTENTION
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:逻辑删除',
   TYPE                 varchar(2) comment '意向类别：1：类型，2：最低价格，3：最高价格，4：区域，5：户型',
   TS_CODE_DETAIL_ID    bigint comment '系统参数表id',
   VALUE                varchar(128) comment '属性值',
   primary key (ID)
);

alter table TB_CUSTOMER_INTENTION comment '客户购房意向表';

/*==============================================================*/
/* Table: TB_CUSTOMER_REPORT                                    */
/*==============================================================*/
create table TB_CUSTOMER_REPORT
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:逻辑删除',
   TB_BUILDING_ID       bigint comment '报备楼盘ID',
   STATUS               varchar(2) comment '跟进状态：默认1：已报备，2：已带看，3：已成交，4：无效客户',
   primary key (ID)
);

alter table TB_CUSTOMER_REPORT comment '客户报备楼盘表';

/*==============================================================*/
/* Table: TB_DEVELOPERS                                         */
/*==============================================================*/
create table TB_DEVELOPERS
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:逻辑删除',
   NAME                 varchar(128) comment '开发商名称',
   COOP_STARTTIME       datetime comment '合作开始时间',
   COOP_ENDTIME         datetime comment '合作结束时间',
   PURCHASE_ENDTIME     datetime comment '认购截止时间',
   COOP_BUILDING        varchar(128) comment '合作房源',
   RULE                 varchar(128) comment '开发商规则',
   primary key (ID)
);

alter table TB_DEVELOPERS comment '开发商表';

/*==============================================================*/
/* Table: TB_DEVELOPERS_NEWS                                    */
/*==============================================================*/
create table TB_DEVELOPERS_NEWS
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:逻辑删除',
   TB_BUILDING_ID       bigint comment '开发商ID',
   TITLE                varchar(128) comment '动态标题',
   RELEASE_TIME         datetime comment '发布时间',
   CONTENT              varchar(1024) comment '动态内容',
   primary key (ID)
);

alter table TB_DEVELOPERS_NEWS comment '最新动态';

/*==============================================================*/
/* Table: TB_HEADLINES                                          */
/*==============================================================*/
create table TB_HEADLINES
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:逻辑删除',
   TITLE                varchar(128) comment '动态标题',
   RELEASE_TIME         datetime comment '发布时间',
   CONTENT              varchar(1024) comment '动态内容',
   primary key (ID)
);

alter table TB_HEADLINES comment '最新头条';

/*==============================================================*/
/* Table: TB_HOT_BUILDING                                       */
/*==============================================================*/
create table TB_HOT_BUILDING
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:逻辑删除',
   TB_BUILDING_ID       bigint comment '楼盘id',
   NAME                 varchar(256) comment '楼盘名称',
   PRIORITY             int comment '展示优先级',
   DESCP                varchar(256) comment '楼盘描述',
   primary key (ID)
);

alter table TB_HOT_BUILDING comment '精品楼盘表';

/*==============================================================*/
/* Table: TB_HOUSE_BAN                                          */
/*==============================================================*/
create table TB_HOUSE_BAN
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:逻辑删除',
   TB_BUILDING_ID       bigint comment '所属楼盘',
   NAME                 varchar(128) comment '楼栋名称',
   IMAGE_URL            varchar(256) comment '楼栋图片地址',
   OPEN_TIME            datetime comment '最新开盘时间',
   LEAD_TIME            datetime comment '最新入住时间',
   UNITS                int comment '单元数',
   HOUSE_RATIO          varchar(32) comment '楼户比',
   LAYERS               int comment '楼层数',
   SALING_HOUSES        int comment '在售房源数',
   IS_SALING_FLAG       char(1) comment '在售标识：1：在售，0：未售',
   primary key (ID)
);

alter table TB_HOUSE_BAN comment '楼栋信息';

/*==============================================================*/
/* Table: TB_HOUSE_TYPE                                         */
/*==============================================================*/
create table TB_HOUSE_TYPE
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:逻辑删除',
   TB_BUILDING_ID       bigint comment '所属楼盘',
   TB_HOUSE_BAN_ID      bigint comment '所属楼栋',
   NAME                 varchar(128) comment '户型名称',
   DESCP                varchar(256) comment '户型描述',
   IMAGE_URL            varchar(256) comment '户型图片地址',
   LIVING_ROOMS         int comment '客厅数',
   BEDROOMS             int comment '卧室数',
   TOILETS              int comment '卫生间数目',
   SQUARE               dec(8,2) comment '面积',
   UNIT_PRICE           decimal(10,2) comment '单价',
   POSITION             bigint comment '位置
            关联省市区表',
   TOTAL_PRICE          decimal(10,2) comment '总价',
   IS_MAIN_FLAG         char(1) comment '是否主力户型：1：主力户型，0：非主力户型',
   IS_SALING_FLAG       char(1) comment '在售标识：1：在售，0：未售',
   primary key (ID)
);

alter table TB_HOUSE_TYPE comment '户型表，检索查此表';

/*==============================================================*/
/* Table: TB_HOUSE_TYPE_LABEL                                   */
/*==============================================================*/
create table TB_HOUSE_TYPE_LABEL
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:逻辑删除',
   TB_BUILDING_ID       bigint comment '楼盘ID',
   TB_HOUSE_BAN_ID      bigint comment '楼栋ID',
   TB_HOUSE_TYPE_ID     bigint comment '所属户型',
   LABEL_ID             bigint comment '主数据 户型标签',
   SHOW_FLAG            char(1) comment '是否展示：0不展示，1展示',
   primary key (ID)
);

alter table TB_HOUSE_TYPE_LABEL comment '户型标签/属性';

/*==============================================================*/
/* Table: TB_STORE                                              */
/*==============================================================*/
create table TB_STORE
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:逻辑删除',
   STORE_CODE           varchar(16) comment '门店编码',
   PHONE_NO             varchar(16) comment '联系电话',
   NAME                 varchar(32) comment '门店名称',
   ADDRESS              varchar(256) comment '门店地址',
   TB_AGENCY_ID         bigint comment '所属机构',
   AGENCY_NAME          varchar(64) comment '机构 名称',
   primary key (ID)
);

alter table TB_STORE comment '门店';

/*==============================================================*/
/* Table: TB_USER_COMMISSION                                    */
/*==============================================================*/
create table TB_USER_COMMISSION
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:逻辑删除',
   TS_USER_ID           bigint comment '用户ID',
   TS_CUSTOMER_ID       bigint comment '客户ID',
   CUSTOMER_NAME        varchar(32) comment '客户姓名',
   CUSTOMER_PHONE       varchar(32) comment '客户手机号',
   TB_BUILDING_ID       bigint comment '所属楼盘',
   BUILDING_NAME        varchar(128) comment '楼盘名称',
   TRADE_TIME           datetime comment '成交时间',
   AMOUNT               decimal(8,2) comment '佣金金额',
   STATUS               char(1) comment '结佣状态：1：以结佣，0：未结佣',
   primary key (ID)
);

alter table TB_USER_COMMISSION comment '用户佣金表';

/*==============================================================*/
/* Table: TS_ASSETS                                             */
/*==============================================================*/
create table TS_ASSETS
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1),
   FILE_NAME            varchar(64) comment '文件名称',
   CONTENT_TYPE         varchar(16) comment '类型',
   STORE_PATH           varchar(128) comment '存储路径',
   FILE_SIZE            int comment '文件大小',
   CODE                 varchar(16) comment '编码',
   PRIORITY             int comment '优先级',
   IMAGE_URL            varchar(256) comment '图片地址',
   LINK_URL             varchar(256) comment '跳转地址',
   primary key (ID)
);

alter table TS_ASSETS comment '资产表';

/*==============================================================*/
/* Table: TS_CODE_DETAIL                                        */
/*==============================================================*/
create table TS_CODE_DETAIL
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:逻辑删除',
   PARENT_ID            bigint,
   CODE                 varchar(32) comment '键',
   VALUE                varchar(128) comment '值',
   TS_CODE_LIST_ID      bigint comment 'TS_CODE_LIST ID',
   REMARK               varchar(128) comment '备注',
   primary key (ID)
);

alter table TS_CODE_DETAIL comment '系统参数详情表';

/*==============================================================*/
/* Table: TS_CODE_LIST                                          */
/*==============================================================*/
create table TS_CODE_LIST
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:逻辑删除',
   NAME                 varchar(32) comment '参数名称',
   CODE                 varchar(32) comment '参数编码',
   REMARK               varchar(128) comment '备注',
   primary key (ID)
);

alter table TS_CODE_LIST comment '系统参数列表';

/*==============================================================*/
/* Table: TS_MENU                                               */
/*==============================================================*/
create table TS_MENU
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1),
   TS_ROLE_ID           bigint comment '角色ID',
   MENU_NAME            varchar(64) comment '菜单名称',
   LEVEL                varchar(2) comment '菜单级别：1：一级菜单2：二级菜单3：三级菜单',
   LINK_URL             varchar(128) comment '链接地址',
   primary key (ID)
);

alter table TS_MENU comment '菜单表';

/*==============================================================*/
/* Table: TS_ROLE                                               */
/*==============================================================*/
create table TS_ROLE
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1),
   NAME                 varchar(64) comment '角色名称',
   CODE                 varchar(16) comment '角色编码',
   REMARK               varchar(128) comment '备注',
   primary key (ID)
);

alter table TS_ROLE comment '角色表';

/*==============================================================*/
/* Table: TS_ROLE_MENU                                          */
/*==============================================================*/
create table TS_ROLE_MENU
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1),
   TS_ROLE_ID           bigint comment '角色ID',
   TS_MENU_ID           bigint comment '用户ID',
   primary key (ID)
);

alter table TS_ROLE_MENU comment '角色菜单关联表';

/*==============================================================*/
/* Table: TS_USER                                               */
/*==============================================================*/
create table TS_USER
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:逻辑删除',
   USER_CODE            varchar(32),
   USER_NAME            varchar(128),
   PASSWORD             varchar(64),
   PHONE_NO             varchar(16),
   NAME                 varchar(32) comment '姓名',
   ID_CARD              varchar(32) comment '身份证号',
   ID_CARD_IMAGE_URL    varchar(128) comment '身份证正面照片图片地址',
   BUSINESS_CARD_IMAGE_URL varchar(128) comment '名片照片地址，置业顾问使用',
   BUSINESS_CITY_ID     bigint comment '业务城市ID',
   BUSINESS_CITY_NAME   varchar(64),
   TB_STORE_ID          bigint comment '所属经济公司，经济人使用',
   AUTHENTICATION       char(1) comment '是否已认证：0：未认证，1：已认证',
   LEVEL                varchar(2) comment '用户级别：1：铁牌，2：铜牌，3：银牌，4：金牌',
   ID_CARD_IMAGE_URL2   varchar(128) comment '头像图片地址',
   SEX                  char comment '性别 1:男 2:女',
   WORKING_SENIORITY    int comment '从业年限',
   DECLARATION          varchar(128) comment '服务宣言',
   primary key (ID)
);

alter table TS_USER comment '用户表';

/*==============================================================*/
/* Table: TS_USER_ROLE                                          */
/*==============================================================*/
create table TS_USER_ROLE
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1),
   TS_USER_ID           bigint comment '用户ID',
   TS_ROLE_ID           bigint comment '角色ID',
   primary key (ID)
);

alter table TS_USER_ROLE comment '用户角色关联表';


/*==============================================================*/
/* 数据初始化                                          */
/*==============================================================*/

INSERT INTO `fml`.`tb_hot_building` (`ID`, `CREATE_TIME`, `UPDATE_TIME`, `DELETE_FLAG`, `TB_BUILDING_ID`, `NAME`, `PRIORITY`, `DESCP`) VALUES ('1', '2016-07-30 21:54:47', '2016-07-30 21:54:49', '0', '1', '印象欧洲', '1', '印象欧洲占地面积50多万平米，约9900户。整体规划有...');
INSERT INTO `fml`.`tb_building` (`ID`, `CREATE_TIME`, `UPDATE_TIME`, `DELETE_FLAG`, `TYPE`, `NAME`, `AVERAGE_PRICE`, `ADDRESS`, `NEWS_UPDATE`, `LEAD_TIME`, `PROPERTY_TYPE`, `BUILDING_TYPE`, `RENOVATION_STATUS`, `HOUSEHOLDS`, `VOLUME_RATIO`, `GREENING_RATE`, `PARKING_SPACE`, `PERIOD_OF_RIGHTS`, `DEVELOPERS_ID`, `DEVELOPERS_NAME`, `PRE_SALE_PERMIT`, `PROPERTY_FEE`, `PROPERTY_COMPANY`, `DEVELOPERS_DESC`, `LONGITUDE`, `LATITUDE`, `ZOOM`) VALUES ('1', '2016-07-30 22:40:51', '2016-07-30 22:40:53', '0', NULL, '印象欧洲', '20000.00', '虎丘区上园路四号', '3月1日加推21#精装公寓', '预计2016年下半年15#、18#交房', '住宅', '板楼，小高层，高层', '毛坯', '1583户', '1.80', '30%', '住宅：机动车1588辆，非机动车2375辆；商业：机动车474辆，非机动车568辆', '70年', NULL, '苏州金辉鑫元置业有限公司', '苏房预高新2016016号', '2.37元', '金辉物业', NULL, NULL, NULL, NULL);
INSERT INTO `fml`.`tb_building_image` (`ID`, `CREATE_TIME`, `UPDATE_TIME`, `DELETE_FLAG`, `TB_BUILDING_ID`, `TS_ASSETS_ID`, `TYPE`, `PRIORITY`, `REMARK`) VALUES ('1', '2016-07-30 21:41:02', '2016-07-30 21:41:04', '0', '1', '3', '01', '1', '正面大图');
INSERT INTO `fml`.`tb_building_image` (`ID`, `CREATE_TIME`, `UPDATE_TIME`, `DELETE_FLAG`, `TB_BUILDING_ID`, `TS_ASSETS_ID`, `TYPE`, `PRIORITY`, `REMARK`) VALUES ('2', '2016-07-30 21:43:16', '2016-07-30 21:43:18', '0', '1', NULL, '02', '1', '列表缩略图');
INSERT INTO `fml`.`ts_assets` (`ID`, `CREATE_TIME`, `UPDATE_TIME`, `DELETE_FLAG`, `FILE_NAME`, `CONTENT_TYPE`, `STORE_PATH`, `FILE_SIZE`, `CODE`, `PRIORITY`, `IMAGE_URL`, `LINK_URL`) VALUES ('1', '2016-07-30 18:33:55', '2016-07-30 18:33:58', '0', 'topImage1.png', NULL, NULL, NULL, '01', '1', 'https://image2.suning.cn/uimg/cms/img/146821740560176967.jpg', 'https://licai.suning.com/lcportal/portal/fund/list.htm?channelCode=PC_LCSY_daohang4');
INSERT INTO `fml`.`ts_assets` (`ID`, `CREATE_TIME`, `UPDATE_TIME`, `DELETE_FLAG`, `FILE_NAME`, `CONTENT_TYPE`, `STORE_PATH`, `FILE_SIZE`, `CODE`, `PRIORITY`, `IMAGE_URL`, `LINK_URL`) VALUES ('2', '2016-07-30 18:34:22', '2016-07-30 18:34:25', '0', 'topImage2.png', NULL, NULL, NULL, '01', '2', 'https://image5.suning.cn/uimg/cms/img/146821169930457793.jpg', 'https://licai.suning.com/lcportal/portal/period/list.htm?channelCode=PC_LCSY_daohang3');
INSERT INTO `fml`.`ts_assets` (`ID`, `CREATE_TIME`, `UPDATE_TIME`, `DELETE_FLAG`, `FILE_NAME`, `CONTENT_TYPE`, `STORE_PATH`, `FILE_SIZE`, `CODE`, `PRIORITY`, `IMAGE_URL`, `LINK_URL`) VALUES ('3', '2016-07-30 22:11:29', '2016-07-30 22:11:32', '0', 'hotBuildingImage.png', NULL, NULL, NULL, '02', '1', 'https://image5.suning.cn/uimg/cms/img/146821169930457793.jpg', NULL);
INSERT INTO `fml`.`tb_building_label` (`ID`, `CREATE_TIME`, `UPDATE_TIME`, `DELETE_FLAG`, `TB_BUILDING_ID`, `LABEL_ID`, `SHOW_FLAG`) VALUES ('1', '2016-07-30 22:27:37', '2016-07-30 22:27:39', '0', '1', NULL, '1');
INSERT INTO `fml`.`ts_code_detail` (`ID`, `CREATE_TIME`, `UPDATE_TIME`, `DELETE_FLAG`, `PARENT_ID`, `CODE`, `VALUE`, `TS_CODE_LIST_ID`, `REMARK`) VALUES ('1', '2016-07-30 22:24:13', '2016-07-30 22:24:15', '0', NULL, 'NEW', '1', '1', '新楼盘');
INSERT INTO `fml`.`ts_code_detail` (`ID`, `CREATE_TIME`, `UPDATE_TIME`, `DELETE_FLAG`, `PARENT_ID`, `CODE`, `VALUE`, `TS_CODE_LIST_ID`, `REMARK`) VALUES ('2', '2016-07-30 22:24:55', '2016-07-30 22:24:56', '0', NULL, 'HEART', '2', '1', '关注');
INSERT INTO `fml`.`ts_code_list` (`ID`, `CREATE_TIME`, `UPDATE_TIME`, `DELETE_FLAG`, `NAME`, `CODE`, `REMARK`) VALUES ('1', '2016-07-30 22:20:11', '2016-07-30 22:20:13', '0', '楼盘标签', 'BuildingLabel', '楼盘标签');
INSERT INTO `fml`.`tb_headlines` (`ID`, `CREATE_TIME`, `UPDATE_TIME`, `DELETE_FLAG`, `TITLE`, `RELEASE_TIME`, `CONTENT`) VALUES ('1', '2016-07-30 20:08:23', '2016-07-30 20:08:24', '0', '买房新技能你get了吗？', '2016-07-30 20:08:43', '买房新技能你get了吗？测试数据');






