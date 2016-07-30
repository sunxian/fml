package cn.com.fml.mvc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.com.fml.mvc.dao.intf.TbHotBuildingDao;
import cn.com.fml.mvc.dmo.TbHotBuilding;
import cn.com.fml.mvc.service.intf.HotBuildingService;
@Service("hotBuildingService")
public class HotBuildingServiceImpl implements HotBuildingService{
	@Autowired
private TbHotBuildingDao tbHotBuildingDao;
	@Override
	public List<TbHotBuilding> getTbHotBuilding() throws Exception {
		// TODO Auto-generated method stub
		return tbHotBuildingDao.getTbHotBuilding();
	}

}
