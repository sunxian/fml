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
   DELETE_FLAG          char(1) comment '1:�߼�ɾ��',
   AGENCY_CODE          varchar(16) comment '��������',
   PHONE_NO             varchar(16),
   NAME                 varchar(32) comment '��������',
   BUSINESS_CITY_ID     bigint comment 'ҵ�����ID',
   BUSINESS_CITY_NAME   varchar(64) comment 'ҵ���������',
   AUTHENTICATION       char(1) comment '�Ƿ�����֤��0��δ��֤��1������֤',
   primary key (ID)
);

alter table TB_AGENCY comment '�н鹫˾';

/*==============================================================*/
/* Table: TB_BUILDING                                           */
/*==============================================================*/
create table TB_BUILDING
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:�߼�ɾ��',
   TYPE                 char(1) comment '¥�����ͣ�1�������ֵ���¥�̣�2�������ַ���¥��',
   NAME                 varchar(256) comment '¥������',
   AVERAGE_PRICE        decimal(8,2) comment '����',
   ADDRESS              varchar(256) comment '¥�̵�ַ',
   NEWS_UPDATE          varchar(256) comment '���¶�̬�����ֶ���Ҫɾ�����Ѿ�������¶�̬��',
   LEAD_TIME            varchar(256) comment '��סʱ��',
   PROPERTY_TYPE        varchar(32) comment '��ҵ����',
   BUILDING_TYPE        varchar(32) comment '��������',
   RENOVATION_STATUS    varchar(32) comment 'װ��״��',
   HOUSEHOLDS           varchar(32) comment 'ס����',
   VOLUME_RATIO         varchar(8) comment '�ݻ���',
   GREENING_RATE        varchar(8) comment '�̻���',
   PARKING_SPACE        varchar(256) comment 'ͣ��λ',
   PERIOD_OF_RIGHTS     varchar(32) comment '��Ȩ����',
   DEVELOPERS_ID        bigint comment '������ID',
   DEVELOPERS_NAME      varchar(128) comment '����������',
   PRE_SALE_PERMIT      varchar(256) comment 'Ԥ�����',
   PROPERTY_FEE         varchar(64) comment '��ҵ��',
   PROPERTY_COMPANY     varchar(256) comment '��ҵ��˾����',
   DEVELOPERS_DESC      varchar(256) comment '������˵��',
   LONGITUDE            decimal(10,5) comment '����',
   LATITUDE             decimal(10,5) comment 'γ��',
   ZOOM                 int comment '��ͼ�Ŵ󼶱�',
   primary key (ID)
);

alter table TB_BUILDING comment '¥�̱�';

/*==============================================================*/
/* Table: TB_BUILDING_IMAGE                                     */
/*==============================================================*/
create table TB_BUILDING_IMAGE
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:�߼�ɾ��',
   TB_BUILDING_ID       bigint comment '¥��id',
   TS_ASSETS_ID         bigint comment '�ʲ���id',
   TYPE                 varchar(4) comment '¥��ͼƬ����',
   PRIORITY             int comment '���ȼ�',
   REMARK               varchar(256) comment '��ע��Ϣ',
   primary key (ID)
);

alter table TB_BUILDING_IMAGE comment '¥��ͼƬ������';

/*==============================================================*/
/* Table: TB_BUILDING_LABEL                                     */
/*==============================================================*/
create table TB_BUILDING_LABEL
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:�߼�ɾ��',
   TB_BUILDING_ID       bigint comment '¥��ID',
   LABEL_ID             bigint comment '��ǩID �����ݱ�',
   SHOW_FLAG            char(1) comment '�Ƿ�չʾ��0��չʾ��1չʾ',
   primary key (ID)
);

alter table TB_BUILDING_LABEL comment '¥�̱�ǩ/����';

/*==============================================================*/
/* Table: TB_COMMISSION                                         */
/*==============================================================*/
create table TB_COMMISSION
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:�߼�ɾ��',
   DEVELOPERS_ID        bigint comment '������id',
   TB_BUILDING_ID       bigint comment '����¥��',
   TYPE                 char(2) comment '���',
   TS_ROLE_ID           bigint comment '��ӵ��������ɫ',
   AMOUNT               decimal(8,2) comment 'Ӷ��',
   DESCP                varchar(256) comment '����',
   SETTLEMENT_NODE      varchar(32) comment '��Ӷ�ڵ�',
   SHOW_INDEX           int comment 'չʾ˳��',
   primary key (ID)
);

alter table TB_COMMISSION comment 'Ӷ���';

/*==============================================================*/
/* Table: TB_COOPERATION_BUILDING                               */
/*==============================================================*/
create table TB_COOPERATION_BUILDING
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:�߼�ɾ��',
   TB_BUILDING_ID       bigint comment '¥��ID',
   COOPERATIONBUILDING_ID varchar(256) comment '����¥��ID',
   primary key (ID)
);

alter table TB_COOPERATION_BUILDING comment '����¥��';

/*==============================================================*/
/* Table: TB_CUSTOMER                                           */
/*==============================================================*/
create table TB_CUSTOMER
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:�߼�ɾ��',
   NAME                 varchar(32) comment '�ͻ�����',
   PNONE_NO             varchar(32) comment '�ͻ��ֻ���',
   FOLLOW_UP_METHOD     varchar(0) comment '������ʽ��1���绰��2��������3��Լ��',
   LEVEL                varchar(2) comment '�ͻ��ȼ���ABCDE',
   REMARK               varchar(256) comment '��ע��Ϣ',
   EFFECTIVE_FLAG       char(1) comment '�Ƿ���Ч�ͻ���־��1����Ч��0����Ч',
   primary key (ID)
);

alter table TB_CUSTOMER comment '�ͻ���';

/*==============================================================*/
/* Table: TB_CUSTOMER_INTENTION                                 */
/*==============================================================*/
create table TB_CUSTOMER_INTENTION
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:�߼�ɾ��',
   TYPE                 varchar(2) comment '�������1�����ͣ�2����ͼ۸�3����߼۸�4������5������',
   TS_CODE_DETAIL_ID    bigint comment 'ϵͳ������id',
   VALUE                varchar(128) comment '����ֵ',
   primary key (ID)
);

alter table TB_CUSTOMER_INTENTION comment '�ͻ����������';

/*==============================================================*/
/* Table: TB_CUSTOMER_REPORT                                    */
/*==============================================================*/
create table TB_CUSTOMER_REPORT
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:�߼�ɾ��',
   TB_BUILDING_ID       bigint comment '����¥��ID',
   STATUS               varchar(2) comment '����״̬��Ĭ��1���ѱ�����2���Ѵ�����3���ѳɽ���4����Ч�ͻ�',
   primary key (ID)
);

alter table TB_CUSTOMER_REPORT comment '�ͻ�����¥�̱�';

/*==============================================================*/
/* Table: TB_DEVELOPERS                                         */
/*==============================================================*/
create table TB_DEVELOPERS
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:�߼�ɾ��',
   NAME                 varchar(128) comment '����������',
   COOP_STARTTIME       datetime comment '������ʼʱ��',
   COOP_ENDTIME         datetime comment '��������ʱ��',
   PURCHASE_ENDTIME     datetime comment '�Ϲ���ֹʱ��',
   COOP_BUILDING        varchar(128) comment '������Դ',
   RULE                 varchar(128) comment '�����̹���',
   primary key (ID)
);

alter table TB_DEVELOPERS comment '�����̱�';

/*==============================================================*/
/* Table: TB_DEVELOPERS_NEWS                                    */
/*==============================================================*/
create table TB_DEVELOPERS_NEWS
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:�߼�ɾ��',
   TB_BUILDING_ID       bigint comment '������ID',
   TITLE                varchar(128) comment '��̬����',
   RELEASE_TIME         datetime comment '����ʱ��',
   CONTENT              varchar(1024) comment '��̬����',
   primary key (ID)
);

alter table TB_DEVELOPERS_NEWS comment '���¶�̬';

/*==============================================================*/
/* Table: TB_HEADLINES                                          */
/*==============================================================*/
create table TB_HEADLINES
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:�߼�ɾ��',
   TITLE                varchar(128) comment '��̬����',
   RELEASE_TIME         datetime comment '����ʱ��',
   CONTENT              varchar(1024) comment '��̬����',
   primary key (ID)
);

alter table TB_HEADLINES comment '����ͷ��';

/*==============================================================*/
/* Table: TB_HOT_BUILDING                                       */
/*==============================================================*/
create table TB_HOT_BUILDING
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:�߼�ɾ��',
   TB_BUILDING_ID       bigint comment '¥��id',
   NAME                 varchar(256) comment '¥������',
   PRIORITY             int comment 'չʾ���ȼ�',
   DESCP                varchar(256) comment '¥������',
   primary key (ID)
);

alter table TB_HOT_BUILDING comment '��Ʒ¥�̱�';

/*==============================================================*/
/* Table: TB_HOUSE_BAN                                          */
/*==============================================================*/
create table TB_HOUSE_BAN
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:�߼�ɾ��',
   TB_BUILDING_ID       bigint comment '����¥��',
   NAME                 varchar(128) comment '¥������',
   IMAGE_URL            varchar(256) comment '¥��ͼƬ��ַ',
   OPEN_TIME            datetime comment '���¿���ʱ��',
   LEAD_TIME            datetime comment '������סʱ��',
   UNITS                int comment '��Ԫ��',
   HOUSE_RATIO          varchar(32) comment '¥����',
   LAYERS               int comment '¥����',
   SALING_HOUSES        int comment '���۷�Դ��',
   IS_SALING_FLAG       char(1) comment '���۱�ʶ��1�����ۣ�0��δ��',
   primary key (ID)
);

alter table TB_HOUSE_BAN comment '¥����Ϣ';

/*==============================================================*/
/* Table: TB_HOUSE_TYPE                                         */
/*==============================================================*/
create table TB_HOUSE_TYPE
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:�߼�ɾ��',
   TB_BUILDING_ID       bigint comment '����¥��',
   TB_HOUSE_BAN_ID      bigint comment '����¥��',
   NAME                 varchar(128) comment '��������',
   DESCP                varchar(256) comment '��������',
   IMAGE_URL            varchar(256) comment '����ͼƬ��ַ',
   LIVING_ROOMS         int comment '������',
   BEDROOMS             int comment '������',
   TOILETS              int comment '��������Ŀ',
   SQUARE               dec(8,2) comment '���',
   UNIT_PRICE           decimal(10,2) comment '����',
   POSITION             bigint comment 'λ��
            ����ʡ������',
   TOTAL_PRICE          decimal(10,2) comment '�ܼ�',
   IS_MAIN_FLAG         char(1) comment '�Ƿ��������ͣ�1���������ͣ�0������������',
   IS_SALING_FLAG       char(1) comment '���۱�ʶ��1�����ۣ�0��δ��',
   primary key (ID)
);

alter table TB_HOUSE_TYPE comment '���ͱ�������˱�';

/*==============================================================*/
/* Table: TB_HOUSE_TYPE_LABEL                                   */
/*==============================================================*/
create table TB_HOUSE_TYPE_LABEL
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:�߼�ɾ��',
   TB_BUILDING_ID       bigint comment '¥��ID',
   TB_HOUSE_BAN_ID      bigint comment '¥��ID',
   TB_HOUSE_TYPE_ID     bigint comment '��������',
   LABEL_ID             bigint comment '������ ���ͱ�ǩ',
   SHOW_FLAG            char(1) comment '�Ƿ�չʾ��0��չʾ��1չʾ',
   primary key (ID)
);

alter table TB_HOUSE_TYPE_LABEL comment '���ͱ�ǩ/����';

/*==============================================================*/
/* Table: TB_STORE                                              */
/*==============================================================*/
create table TB_STORE
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:�߼�ɾ��',
   STORE_CODE           varchar(16) comment '�ŵ����',
   PHONE_NO             varchar(16) comment '��ϵ�绰',
   NAME                 varchar(32) comment '�ŵ�����',
   ADDRESS              varchar(256) comment '�ŵ��ַ',
   TB_AGENCY_ID         bigint comment '��������',
   AGENCY_NAME          varchar(64) comment '���� ����',
   primary key (ID)
);

alter table TB_STORE comment '�ŵ�';

/*==============================================================*/
/* Table: TB_USER_COMMISSION                                    */
/*==============================================================*/
create table TB_USER_COMMISSION
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:�߼�ɾ��',
   TS_USER_ID           bigint comment '�û�ID',
   TS_CUSTOMER_ID       bigint comment '�ͻ�ID',
   CUSTOMER_NAME        varchar(32) comment '�ͻ�����',
   CUSTOMER_PHONE       varchar(32) comment '�ͻ��ֻ���',
   TB_BUILDING_ID       bigint comment '����¥��',
   BUILDING_NAME        varchar(128) comment '¥������',
   TRADE_TIME           datetime comment '�ɽ�ʱ��',
   AMOUNT               decimal(8,2) comment 'Ӷ����',
   STATUS               char(1) comment '��Ӷ״̬��1���Խ�Ӷ��0��δ��Ӷ',
   primary key (ID)
);

alter table TB_USER_COMMISSION comment '�û�Ӷ���';

/*==============================================================*/
/* Table: TS_ASSETS                                             */
/*==============================================================*/
create table TS_ASSETS
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1),
   FILE_NAME            varchar(64) comment '�ļ�����',
   CONTENT_TYPE         varchar(16) comment '����',
   STORE_PATH           varchar(128) comment '�洢·��',
   FILE_SIZE            int comment '�ļ���С',
   CODE                 varchar(16) comment '����',
   PRIORITY             int comment '���ȼ�',
   IMAGE_URL            varchar(256) comment 'ͼƬ��ַ',
   LINK_URL             varchar(256) comment '��ת��ַ',
   primary key (ID)
);

alter table TS_ASSETS comment '�ʲ���';

/*==============================================================*/
/* Table: TS_CODE_DETAIL                                        */
/*==============================================================*/
create table TS_CODE_DETAIL
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:�߼�ɾ��',
   PARENT_ID            bigint,
   CODE                 varchar(32) comment '��',
   VALUE                varchar(128) comment 'ֵ',
   TS_CODE_LIST_ID      bigint comment 'TS_CODE_LIST ID',
   REMARK               varchar(128) comment '��ע',
   primary key (ID)
);

alter table TS_CODE_DETAIL comment 'ϵͳ���������';

/*==============================================================*/
/* Table: TS_CODE_LIST                                          */
/*==============================================================*/
create table TS_CODE_LIST
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:�߼�ɾ��',
   NAME                 varchar(32) comment '��������',
   CODE                 varchar(32) comment '��������',
   REMARK               varchar(128) comment '��ע',
   primary key (ID)
);

alter table TS_CODE_LIST comment 'ϵͳ�����б�';

/*==============================================================*/
/* Table: TS_MENU                                               */
/*==============================================================*/
create table TS_MENU
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1),
   TS_ROLE_ID           bigint comment '��ɫID',
   MENU_NAME            varchar(64) comment '�˵�����',
   LEVEL                varchar(2) comment '�˵�����1��һ���˵�2�������˵�3�������˵�',
   LINK_URL             varchar(128) comment '���ӵ�ַ',
   primary key (ID)
);

alter table TS_MENU comment '�˵���';

/*==============================================================*/
/* Table: TS_ROLE                                               */
/*==============================================================*/
create table TS_ROLE
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1),
   NAME                 varchar(64) comment '��ɫ����',
   CODE                 varchar(16) comment '��ɫ����',
   REMARK               varchar(128) comment '��ע',
   primary key (ID)
);

alter table TS_ROLE comment '��ɫ��';

/*==============================================================*/
/* Table: TS_ROLE_MENU                                          */
/*==============================================================*/
create table TS_ROLE_MENU
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1),
   TS_ROLE_ID           bigint comment '��ɫID',
   TS_MENU_ID           bigint comment '�û�ID',
   primary key (ID)
);

alter table TS_ROLE_MENU comment '��ɫ�˵�������';

/*==============================================================*/
/* Table: TS_USER                                               */
/*==============================================================*/
create table TS_USER
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1) comment '1:�߼�ɾ��',
   USER_CODE            varchar(32),
   USER_NAME            varchar(128),
   PASSWORD             varchar(64),
   PHONE_NO             varchar(16),
   NAME                 varchar(32) comment '����',
   ID_CARD              varchar(32) comment '���֤��',
   ID_CARD_IMAGE_URL    varchar(128) comment '���֤������ƬͼƬ��ַ',
   BUSINESS_CARD_IMAGE_URL varchar(128) comment '��Ƭ��Ƭ��ַ����ҵ����ʹ��',
   BUSINESS_CITY_ID     bigint comment 'ҵ�����ID',
   BUSINESS_CITY_NAME   varchar(64),
   TB_STORE_ID          bigint comment '�������ù�˾��������ʹ��',
   AUTHENTICATION       char(1) comment '�Ƿ�����֤��0��δ��֤��1������֤',
   LEVEL                varchar(2) comment '�û�����1�����ƣ�2��ͭ�ƣ�3�����ƣ�4������',
   ID_CARD_IMAGE_URL2   varchar(128) comment 'ͷ��ͼƬ��ַ',
   SEX                  char comment '�Ա� 1:�� 2:Ů',
   WORKING_SENIORITY    int comment '��ҵ����',
   DECLARATION          varchar(128) comment '��������',
   primary key (ID)
);

alter table TS_USER comment '�û���';

/*==============================================================*/
/* Table: TS_USER_ROLE                                          */
/*==============================================================*/
create table TS_USER_ROLE
(
   ID                   bigint not null auto_increment,
   CREATE_TIME          datetime,
   UPDATE_TIME          datetime,
   DELETE_FLAG          char(1),
   TS_USER_ID           bigint comment '�û�ID',
   TS_ROLE_ID           bigint comment '��ɫID',
   primary key (ID)
);

alter table TS_USER_ROLE comment '�û���ɫ������';


/*==============================================================*/
/* ���ݳ�ʼ��                                          */
/*==============================================================*/

INSERT INTO `fml`.`tb_hot_building` (`ID`, `CREATE_TIME`, `UPDATE_TIME`, `DELETE_FLAG`, `TB_BUILDING_ID`, `NAME`, `PRIORITY`, `DESCP`) VALUES ('1', '2016-07-30 21:54:47', '2016-07-30 21:54:49', '0', '1', 'ӡ��ŷ��', '1', 'ӡ��ŷ��ռ�����50����ƽ�ף�Լ9900��������滮��...');
INSERT INTO `fml`.`tb_building` (`ID`, `CREATE_TIME`, `UPDATE_TIME`, `DELETE_FLAG`, `TYPE`, `NAME`, `AVERAGE_PRICE`, `ADDRESS`, `NEWS_UPDATE`, `LEAD_TIME`, `PROPERTY_TYPE`, `BUILDING_TYPE`, `RENOVATION_STATUS`, `HOUSEHOLDS`, `VOLUME_RATIO`, `GREENING_RATE`, `PARKING_SPACE`, `PERIOD_OF_RIGHTS`, `DEVELOPERS_ID`, `DEVELOPERS_NAME`, `PRE_SALE_PERMIT`, `PROPERTY_FEE`, `PROPERTY_COMPANY`, `DEVELOPERS_DESC`, `LONGITUDE`, `LATITUDE`, `ZOOM`) VALUES ('1', '2016-07-30 22:40:51', '2016-07-30 22:40:53', '0', NULL, 'ӡ��ŷ��', '20000.00', '��������԰·�ĺ�', '3��1�ռ���21#��װ��Ԣ', 'Ԥ��2016���°���15#��18#����', 'סլ', '��¥��С�߲㣬�߲�', 'ë��', '1583��', '1.80', '30%', 'סլ��������1588�����ǻ�����2375������ҵ��������474�����ǻ�����568��', '70��', NULL, '���ݽ����Ԫ��ҵ���޹�˾', '�շ�Ԥ����2016016��', '2.37Ԫ', '�����ҵ', NULL, NULL, NULL, NULL);
INSERT INTO `fml`.`tb_building_image` (`ID`, `CREATE_TIME`, `UPDATE_TIME`, `DELETE_FLAG`, `TB_BUILDING_ID`, `TS_ASSETS_ID`, `TYPE`, `PRIORITY`, `REMARK`) VALUES ('1', '2016-07-30 21:41:02', '2016-07-30 21:41:04', '0', '1', '3', '01', '1', '�����ͼ');
INSERT INTO `fml`.`tb_building_image` (`ID`, `CREATE_TIME`, `UPDATE_TIME`, `DELETE_FLAG`, `TB_BUILDING_ID`, `TS_ASSETS_ID`, `TYPE`, `PRIORITY`, `REMARK`) VALUES ('2', '2016-07-30 21:43:16', '2016-07-30 21:43:18', '0', '1', NULL, '02', '1', '�б�����ͼ');
INSERT INTO `fml`.`ts_assets` (`ID`, `CREATE_TIME`, `UPDATE_TIME`, `DELETE_FLAG`, `FILE_NAME`, `CONTENT_TYPE`, `STORE_PATH`, `FILE_SIZE`, `CODE`, `PRIORITY`, `IMAGE_URL`, `LINK_URL`) VALUES ('1', '2016-07-30 18:33:55', '2016-07-30 18:33:58', '0', 'topImage1.png', NULL, NULL, NULL, '01', '1', 'https://image2.suning.cn/uimg/cms/img/146821740560176967.jpg', 'https://licai.suning.com/lcportal/portal/fund/list.htm?channelCode=PC_LCSY_daohang4');
INSERT INTO `fml`.`ts_assets` (`ID`, `CREATE_TIME`, `UPDATE_TIME`, `DELETE_FLAG`, `FILE_NAME`, `CONTENT_TYPE`, `STORE_PATH`, `FILE_SIZE`, `CODE`, `PRIORITY`, `IMAGE_URL`, `LINK_URL`) VALUES ('2', '2016-07-30 18:34:22', '2016-07-30 18:34:25', '0', 'topImage2.png', NULL, NULL, NULL, '01', '2', 'https://image5.suning.cn/uimg/cms/img/146821169930457793.jpg', 'https://licai.suning.com/lcportal/portal/period/list.htm?channelCode=PC_LCSY_daohang3');
INSERT INTO `fml`.`ts_assets` (`ID`, `CREATE_TIME`, `UPDATE_TIME`, `DELETE_FLAG`, `FILE_NAME`, `CONTENT_TYPE`, `STORE_PATH`, `FILE_SIZE`, `CODE`, `PRIORITY`, `IMAGE_URL`, `LINK_URL`) VALUES ('3', '2016-07-30 22:11:29', '2016-07-30 22:11:32', '0', 'hotBuildingImage.png', NULL, NULL, NULL, '02', '1', 'https://image5.suning.cn/uimg/cms/img/146821169930457793.jpg', NULL);
INSERT INTO `fml`.`tb_building_label` (`ID`, `CREATE_TIME`, `UPDATE_TIME`, `DELETE_FLAG`, `TB_BUILDING_ID`, `LABEL_ID`, `SHOW_FLAG`) VALUES ('1', '2016-07-30 22:27:37', '2016-07-30 22:27:39', '0', '1', NULL, '1');
INSERT INTO `fml`.`ts_code_detail` (`ID`, `CREATE_TIME`, `UPDATE_TIME`, `DELETE_FLAG`, `PARENT_ID`, `CODE`, `VALUE`, `TS_CODE_LIST_ID`, `REMARK`) VALUES ('1', '2016-07-30 22:24:13', '2016-07-30 22:24:15', '0', NULL, 'NEW', '1', '1', '��¥��');
INSERT INTO `fml`.`ts_code_detail` (`ID`, `CREATE_TIME`, `UPDATE_TIME`, `DELETE_FLAG`, `PARENT_ID`, `CODE`, `VALUE`, `TS_CODE_LIST_ID`, `REMARK`) VALUES ('2', '2016-07-30 22:24:55', '2016-07-30 22:24:56', '0', NULL, 'HEART', '2', '1', '��ע');
INSERT INTO `fml`.`ts_code_list` (`ID`, `CREATE_TIME`, `UPDATE_TIME`, `DELETE_FLAG`, `NAME`, `CODE`, `REMARK`) VALUES ('1', '2016-07-30 22:20:11', '2016-07-30 22:20:13', '0', '¥�̱�ǩ', 'BuildingLabel', '¥�̱�ǩ');
INSERT INTO `fml`.`tb_headlines` (`ID`, `CREATE_TIME`, `UPDATE_TIME`, `DELETE_FLAG`, `TITLE`, `RELEASE_TIME`, `CONTENT`) VALUES ('1', '2016-07-30 20:08:23', '2016-07-30 20:08:24', '0', '���¼�����get����', '2016-07-30 20:08:43', '���¼�����get���𣿲�������');






