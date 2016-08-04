package cn.com.fml.mvc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fml.mvc.dao.intf.HouseBanDao;
import cn.com.fml.mvc.service.intf.HouseBanService;
@Service("houseBanService")
public class HouseBanServiceImpl implements HouseBanService {
	@Autowired
private HouseBanDao houseBanDao;
	@Override
	public List<Map<String, Object>> queryHouseBanList1(Long buildingId)
			throws Exception {
		
		return houseBanDao.queryHouseBanList1(buildingId);
	}

	@Override
	public List<String> queryOtherhouseType() throws Exception {
		
		return houseBanDao.queryOtherhouseType();
	}

}
