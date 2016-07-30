package cn.com.fml.mvc.dmo;

import java.io.Serializable;

public class TopImages implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String imageUrl;
	private String linkUrl;//链接地址
	private int priority;//优先级
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public String getLinkUrl() {
		return linkUrl;
	}
	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
	}
}
