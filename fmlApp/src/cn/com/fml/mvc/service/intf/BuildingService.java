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

	Boolean  deleteBuilding(String buildingid);

	Boolean updateBuilding(TbBuilding building);
    TbBuilding  getBuildingToUpdate(String id);
}