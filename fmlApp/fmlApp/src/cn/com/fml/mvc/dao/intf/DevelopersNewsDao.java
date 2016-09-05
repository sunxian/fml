package cn.com.fml.mvc.dao.intf;

import java.util.List;
import java.util.Map;

public interface DevelopersNewsDao {
	
	List<Map<String, Object>> queryNewsList(Long buildingId);
	
}
