package cn.com.fml.mvc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fml.mvc.dao.intf.TsAssetsDao;
import cn.com.fml.mvc.dmo.TsAssets;
import cn.com.fml.mvc.service.intf.UploadFileService;


@Service("uploadFileService")
public class UploadFileServiceImpl implements UploadFileService {
	@Autowired
	private TsAssetsDao tsAssetsDao;

	public void setTsAssetsDao(TsAssetsDao tsAssetsDao) {
		this.tsAssetsDao = tsAssetsDao;
	}

	public int saveTsAssets(TsAssets tsAssets) {
		int result = tsAssetsDao.insertTsAssets(tsAssets);
		return result;
	}

}
