package cn.com.fml.mvc.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.com.fml.mvc.dao.intf.TbHotBuildingDao;
import cn.com.fml.mvc.dao.intf.TsAssetsDao;
import cn.com.fml.mvc.service.intf.BuildingService;

@Service("buildingService")
public class BuildingServiceImpl implements BuildingService{
	
	@Autowired
	private TbHotBuildingDao tbHotBuildingDao;
	
	@Autowired
	private TsAssetsDao tsAssetsDao;
	
	@Override
	public List<Map<String, Object>> getHotBuilding() throws Exception {
		
		List<Map<String, Object>> list = tbHotBuildingDao.getHotBuilding();
		if (!CollectionUtils.isEmpty(list)) {
			for (Map<String, Object> map : list) {
				Object buildingId = map.get("id");
				String imageUrl = tsAssetsDao.queryHotBuildBigImage((Long)buildingId);
				map.put("imageUrl", imageUrl);
			}
		}
		return list;
	}

}
