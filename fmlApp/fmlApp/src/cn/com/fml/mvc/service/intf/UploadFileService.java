package cn.com.fml.mvc.service.intf;

import cn.com.fml.mvc.dmo.TsAssets;


public interface UploadFileService {

	/**
	 * 保存附件
	 * @param tsRole
	 * @return
	 * @throws Exception
	 */
	public int saveTsAssets(TsAssets tsAssets) throws Exception;

}
