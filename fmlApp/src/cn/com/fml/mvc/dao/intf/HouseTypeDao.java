package cn.com.fml.mvc.dao.intf;

import java.util.List;
import java.util.Map;

public interface HouseTypeDao {
	
	List<Map<String, Object>> queryHouseTypeList(Long buildingId);
	
}
