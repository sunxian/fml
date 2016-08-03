package cn.com.fml.mvc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fml.mvc.dao.intf.HouseTypeDao;
import cn.com.fml.mvc.service.intf.HouseTypeService;
@Service("houseTypeService")
public class HouseTypeServiceImpl implements HouseTypeService {
	@Autowired
private HouseTypeDao houseBanDao;
	@Override
	public List<Map<String, Object>> queryHouseTypeList1(Long buildingId)
			throws Exception {
		
		return houseBanDao.queryHouseTypeList1(buildingId);
		
	

}}
