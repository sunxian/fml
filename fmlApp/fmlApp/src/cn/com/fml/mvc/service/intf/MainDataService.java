package cn.com.fml.mvc.service.intf;
import java.util.List;
import java.util.Map;

public interface MainDataService {
	
	List<Map<String, Object>> getAreaData(Long areaId) throws Exception;
	
}
