package cn.com.fml.mvc.dmo;

import java.io.Serializable;

public class TsUser extends BaseDmo implements Serializable {

	/**  NAME                 varchar(32) comment '姓名',
   ID_CARD              varchar(32) comment '身份证号',
   ID_CARD_IMAGE_URL    varchar(128) comment '身份证正面照片图片地址',
   BUSINESS_CARD_IMAGE_URL varchar(128) comment '名片照片地址，置业顾问使用',
   BUSINESS_CITY_ID     bigint comment '业务城市ID',
   BUSINESS_CITY_NAME   varchar(64),
   TB_STORE_ID          bigint comment '所属经济公司，经济人使用',
   AUTHENTICATION       char(1) comment '是否已认证：0：未认证，1：已认证',
   LEVEL                varchar(2) comment '用户级别：1：铁牌，2：铜牌，3：银牌，4：金牌',
   ID_CARD_IMAGE_URL2   varchar(128) comment '头像图片地址',
   SEX                  char comment '性别',
   WORKING_SENIORITY    int comment '从业年限',
   DECLARATION          varchar(128) comment '服务宣言',
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String userCode;
	
	private String userName;
	
	private String password;

	private String phoneNo;
	
	private String name;
	
	private String idCard;
	
	private String idCardImageUrl;
	
	private String businessCardImageUrl;
	
	private String businessCityId;
	
	private String businessCityName;
	
	private String tbStoreId;
	
	private String authentication;
	
	private String level;
	
	private String idCardImageUrl2;
	
	private String sex;
	
	private String workingSeniority;
	
	private String declaration;

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public String getIdCardImageUrl() {
		return idCardImageUrl;
	}

	public void setIdCardImageUrl(String idCardImageUrl) {
		this.idCardImageUrl = idCardImageUrl;
	}

	public String getBusinessCardImageUrl() {
		return businessCardImageUrl;
	}

	public void setBusinessCardImageUrl(String businessCardImageUrl) {
		this.businessCardImageUrl = businessCardImageUrl;
	}

	public String getBusinessCityId() {
		return businessCityId;
	}

	public void setBusinessCityId(String businessCityId) {
		this.businessCityId = businessCityId;
	}

	public String getBusinessCityName() {
		return businessCityName;
	}

	public void setBusinessCityName(String businessCityName) {
		this.businessCityName = businessCityName;
	}

	public String getTbStoreId() {
		return tbStoreId;
	}

	public void setTbStoreId(String tbStoreId) {
		this.tbStoreId = tbStoreId;
	}

	public String getAuthentication() {
		return authentication;
	}

	public void setAuthentication(String authentication) {
		this.authentication = authentication;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getIdCardImageUrl2() {
		return idCardImageUrl2;
	}

	public void setIdCardImageUrl2(String idCardImageUrl2) {
		this.idCardImageUrl2 = idCardImageUrl2;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getWorkingSeniority() {
		return workingSeniority;
	}

	public void setWorkingSeniority(String workingSeniority) {
		this.workingSeniority = workingSeniority;
	}

	public String getDeclaration() {
		return declaration;
	}

	public void setDeclaration(String declaration) {
		this.declaration = declaration;
	}
	
	
}
