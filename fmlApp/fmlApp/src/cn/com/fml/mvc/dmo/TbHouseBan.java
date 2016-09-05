package cn.com.fml.mvc.dmo;
//楼栋类
public class TbHouseBan {
	private String id;//楼栋id
	private String buildingId;//所属楼盘id
	private String name;//楼栋名称
	private String  imageUrl;//楼栋图片地址
	private String openTime;//最新开盘时间
	private String  leadTime;//最新入住时间
	private String  units;//单元数
	private String  houseRatio;//楼户比
	private String  layers;//楼层数
	private String  salingHouses;//在售房源数
	private String  isSalingFlag;//在售标识
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBuildingId() {
		return buildingId;
	}
	public void setBuildingId(String buildingId) {
		this.buildingId = buildingId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public String getOpenTime() {
		return openTime;
	}
	public void setOpenTime(String openTime) {
		this.openTime = openTime;
	}
	public String getLeadTime() {
		return leadTime;
	}
	public void setLeadTime(String leadTime) {
		this.leadTime = leadTime;
	}
	public String getUnits() {
		return units;
	}
	public void setUnits(String units) {
		this.units = units;
	}
	public String getHouseRatio() {
		return houseRatio;
	}
	public void setHouseRatio(String houseRatio) {
		this.houseRatio = houseRatio;
	}
	public String getLayers() {
		return layers;
	}
	public void setLayers(String layers) {
		this.layers = layers;
	}
	public String getSalingHouses() {
		return salingHouses;
	}
	public void setSalingHouses(String salingHouses) {
		this.salingHouses = salingHouses;
	}
	public String getIsSalingFlag() {
		return isSalingFlag;
	}
	public void setIsSalingFlag(String isSalingFlag) {
		this.isSalingFlag = isSalingFlag;
	}

	
}
