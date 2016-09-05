package cn.com.fml.mvc.service.intf;
import java.util.List;
import java.util.Map;

import cn.com.fml.mvc.common.PageBean;
import cn.com.fml.mvc.dmo.TbBuilding;

public interface BuildingService {
	
	List<Map<String, Object>> getHotBuilding(Long userId) throws Exception;
	
	Map<String, Object> getBuildingById(Long buildingId, Long roleId) throws Exception;
	
	List<Map<String, Object>> coopBuildingsById(Long buildingId, Long roleId) throws Exception;
	
	List<Map<String, Object>> getBuildingsList(Map<String, Object> param) throws Exception;
	
	PageBean getProjectList(int pageNo, int pageSize, Map<String, Object> param) throws Exception;
	
	public Boolean addBuilding(TbBuilding tbBuilding);
     //删除楼盘
	Boolean  deleteBuilding(String buildingid);
     //更新楼盘
	Boolean updateBuilding(TbBuilding building);
	 //获取楼盘更改信息
    TbBuilding  getBuildingToUpdate(String id);
}