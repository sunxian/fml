package cn.com.fml.mvc.service.intf;

import java.util.List;
import java.util.Map;

public interface HouseTypeService {
	
	List<Map<String, Object>> mainHouseTypeList(Long buildingId) throws Exception;
	
}
