package cn.com.fml.mvc.service.intf;
import java.util.List;
import java.util.Map;

public interface BuildingService {
	
	List<Map<String, Object>> getHotBuilding() throws Exception;
	
}
