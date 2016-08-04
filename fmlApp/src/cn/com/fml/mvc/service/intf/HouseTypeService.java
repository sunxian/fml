package cn.com.fml.mvc.service.intf;

import java.util.List;
import java.util.Map;

public interface HouseTypeService {
	List<Map<String, Object>> queryHouseTypeList1(Long buildingId) throws Exception;
	
	
}
