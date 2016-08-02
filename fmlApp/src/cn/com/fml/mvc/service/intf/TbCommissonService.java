package cn.com.fml.mvc.service.intf;

import java.util.List;
import java.util.Map;

public interface TbCommissonService {
	
	public List<Map<String, Object>> getCommissionById(Long id) throws Exception;

}
