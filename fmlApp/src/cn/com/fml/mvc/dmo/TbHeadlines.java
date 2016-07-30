package cn.com.fml.mvc.dmo;

import java.io.Serializable;
import java.sql.Timestamp;
public class TbHeadlines extends BaseDmo implements Serializable  {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String title;//标题
	private String longTitle="房麦乐";//长标题
	public String getLongTitle() {
		return longTitle;
	}
	public void setLongTitle(String longTitle) {
		this.longTitle = longTitle;
	}
	private Timestamp releaseTime;//发布时间
	private String content;//动态内容
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}


	public Timestamp getReleaseTime() {
		return releaseTime;
	}
	public void setReleaseTime(Timestamp releaseTime) {
		this.releaseTime = releaseTime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
