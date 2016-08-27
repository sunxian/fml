package cn.com.fml.mvc.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fml.mvc.common.PageBean;
import cn.com.fml.mvc.dao.intf.HouseTypeDao;
import cn.com.fml.mvc.dao.intf.TbHotBuildingDao;
import cn.com.fml.mvc.service.intf.HouseTypeService;

@Service("houseTypeService")
public class HouseTypeServiceImpl implements HouseTypeService {
	
	@Autowired
	private HouseTypeDao houseTypeDao;
	
	
	@Autowired
	private TbHotBuildingDao tbHotBuildingDao;
	
	@Override
	public List<Map<String, Object>> mainHouseTypeList(Long buildingId) throws Exception {
		
		List<Map<String,Object>> list = houseTypeDao.mainHouseTypeList(buildingId);
		if (!CollectionUtils.isEmpty(list)) {
			for (Map<String,Object> map : list) {
				List<String> labelList = tbHotBuildingDao.getHouseTypeLabel(buildingId);
				map.put("labels", labelList);
			}
		}
		return list;
	}

	@Override
	public PageBean getHouseTypeManagerList(int pageNo, int pageSize,
			Map<String, Object> param) throws Exception {
		 Long count = houseTypeDao.getHouseTypeManagerListCount(param);
		    PageBean pageBean = new PageBean(pageNo, count.intValue());
		    param.put("startIndex", pageBean.getStartIndex());
		    param.put("pageSize", pageSize);
		    List<Map<String, Object>> list = houseTypeDao.getHouseTypeManagerList(param);
		    pageBean.setList(list);
	        return pageBean;	
	}



}