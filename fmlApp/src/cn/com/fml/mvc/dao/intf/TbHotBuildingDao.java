package cn.com.fml.mvc.dao.intf;
import java.util.List;
import java.util.Map;

/**
 * @author hasee
 * 获得精品楼盘信息
 *
 */
public interface TbHotBuildingDao {
	
	List<Map<String, Object>> getCollectionBuilding(Long userId);
	
	List<Map<String, Object>> getHotBuilding(Long userId);
	
	Map<String, Object> getBuildingById(Long buildingId);
	
	List<String> getBuildingLabel(Long buildingId);
	
	List<String> getHouseTypeLabel(Long buildingId);
	
	List<Map<String, Object>> getCommissionByBuildingId(Map<String, Object> param);
	
	List<Map<String, Object>> getCoopBuildings(Long buildingId);
	
	Map<String, Object> getBuildingRegion(Long buildingId);
	
}
