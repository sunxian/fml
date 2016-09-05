package cn.com.fml.mvc.dao.intf;
import java.util.List;
import java.util.Map;

/**
 * 
 * 获得主数据
 *
 */
public interface MainDataDao {
	
	List<Map<String, Object>> getAreaData(Long areaId);
	
}
