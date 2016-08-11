package cn.com.fml.mvc.service.intf;

import java.util.List;
import java.util.Map;

public interface TbCommissonService {
	//佣金详情
	public List<Map<String, Object>> getCommissionById(Long id) throws Exception;
	//用户佣金
	Map<String, Object> getMyCommission(String status)throws Exception;
	
	
}
