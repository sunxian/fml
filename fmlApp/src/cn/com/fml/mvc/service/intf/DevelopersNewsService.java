package cn.com.fml.mvc.service.intf;

import java.util.List;
import java.util.Map;

public interface DevelopersNewsService {
	
public List<Map<String,Object>> getDevelopersNews(Long buildingid) throws Exception;
}
