package cn.com.fml.mvc.dao.intf;

import java.util.List;
import java.util.Map;

public interface TbCommissionDao {
	
	List<Map<String, Object>> getCommissionById(Long id);
	
}
