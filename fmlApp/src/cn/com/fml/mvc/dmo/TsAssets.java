package cn.com.fml.mvc.dmo;

import java.io.Serializable;

public class TsAssets extends BaseDmo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String fileName;
	
	private String contentType;
	
	private String storePath;
	
	private long fileSize;

	private String code;


	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public String getStorePath() {
		return storePath;
	}

	public void setStorePath(String storePath) {
		this.storePath = storePath;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

}
