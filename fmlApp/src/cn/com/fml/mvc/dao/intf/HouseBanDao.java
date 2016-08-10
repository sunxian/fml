package cn.com.fml.mvc.dao.intf;

import java.util.List;
import java.util.Map;

public interface HouseBanDao {
	
	List<Map<String, Object>> queryHouseBanList(Long buildingId);
	List<Map<String, Object>> queryHouseBanInfoList(Long buildingId);
	List<String> queryOtherhouseType();
}
