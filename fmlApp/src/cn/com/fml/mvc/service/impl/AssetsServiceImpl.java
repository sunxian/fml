package cn.com.fml.mvc.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fml.mvc.dao.intf.TsAssetsDao;
import cn.com.fml.mvc.dmo.TsAssets;
import cn.com.fml.mvc.service.intf.AssetsService;


@Service("assetsService")
public class AssetsServiceImpl implements AssetsService {
	@Autowired
	private TsAssetsDao tsAssetsDao;

	public List<Map<String, Object>> queryAssetsByCode(String code) throws Exception {
		List<TsAssets> list = tsAssetsDao.queryAssetsByCode(code);
		if (CollectionUtils.isEmpty(list)) {
			return null;
		}
		ArrayList<Map<String, Object>> retList = new ArrayList<Map<String, Object>>();
		for (TsAssets assets : list) {
			HashMap<String,Object> map = new HashMap<String, Object>();
			map.put("imageUrl", assets.getImageUrl());
			map.put("linkUrl", assets.getLinkUrl());
			map.put("priority", assets.getPriority());
			retList.add(map);
		}
		return retList;
	}

}
