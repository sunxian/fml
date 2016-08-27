package cn.com.fml.mvc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.com.fml.mvc.dao.intf.MainDataDao;
import cn.com.fml.mvc.service.intf.MainDataService;

@Service("mainDataService")
public class MainDataServiceImpl implements MainDataService {
	
	@Autowired
	private MainDataDao mainDataDao;

	@Override
	public List<Map<String, Object>> getAreaData(Long areaId) throws Exception {
		
		List<Map<String, Object>> list = mainDataDao.getAreaData(areaId);
		return list;
		
	}
	

}
