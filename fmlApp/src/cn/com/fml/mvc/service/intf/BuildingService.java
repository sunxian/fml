package cn.com.fml.mvc.service.intf;
import java.util.List;
import java.util.Map;

public interface BuildingService {
	
	List<Map<String, Object>> getHotBuilding(Long userId) throws Exception;
	
	Map<String, Object> getBuildingById(Long buildingId, Long roleId) throws Exception;
	
	List<Map<String, Object>> coopBuildingsById(Long buildingId, Long roleId) throws Exception;
}
