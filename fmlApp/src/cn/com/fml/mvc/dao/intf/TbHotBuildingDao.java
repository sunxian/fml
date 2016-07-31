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
	
	List<Map<String, Object>> getHotBuilding();
	
}
