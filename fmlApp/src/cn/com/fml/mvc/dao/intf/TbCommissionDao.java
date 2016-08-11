package cn.com.fml.mvc.dao.intf;

import java.util.List;
import java.util.Map;

public interface TbCommissionDao {
	//佣金详情
	List<Map<String, Object>> getCommissionById(Long id);
	//用户佣金
	Double getAmount(String status);
	//佣金列表
	 List<Map<String, Object>> queryCommissionList();
	
}
