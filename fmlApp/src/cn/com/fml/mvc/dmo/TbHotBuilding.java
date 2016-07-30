package cn.com.fml.mvc.dmo;

import java.io.Serializable;

public class TbHotBuilding extends BaseDmo implements Serializable {

	/**
	 * 精品楼盘
	 */
	private static final long serialVersionUID = 1L;
	private int tbBuildingId;//楼盘id
	private String name;//楼盘名称
	private String description;//楼盘描述
	private int label;//楼盘标签
	private String averagePrice;//均价
	private String imageUrl;//图片地址
	public int getTbBuildingId() {
		return tbBuildingId;
	}
	public void setTbBuildingId(int tbBuildingId) {
		this.tbBuildingId = tbBuildingId;
	}
	public String getName() {
		return name;
	}
	public int getLabel() {
		return label;
	}
	public void setLabel(int label) {
		this.label = label;
	}
	public String getAveragePrice() {
		return averagePrice;
	}
	public void setAveragePrice(String averagePrice) {
		this.averagePrice = averagePrice;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	

}
