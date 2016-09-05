package cn.com.fml.mvc.dao.intf;

import java.util.List;
import java.util.Map;

public interface TbCustomerDao {
	//客户首页
 int queryTimesByMonth();
 int queryTimesByYear();
 int queryTimesByWeek();
 List<Map<String, Object>> queryReports();
 //客户列表
 List<Map<String,Object>> queryCustomerList();
 //客户详情
 List<Map<String,Object>> queryCustomerDetail(Long customerId);
 List<Map<String,Object>> queryReportList(Long customerId);
 double queryminPrice(Long customerId);
 double querymaxPrice(Long customerId);
 List<String> queryTypes(Long customerId);
 List<String> queryAreas(Long customerId);
 List<String> queryHouseTypes(Long customerId);
 //经纪人客户
 List<Map<String,Object>> queryAgentCustomers(Map<String, Object> param);
 Long getAgentCustomersCount(Map<String, Object> param);
 
 //关键人客户
 List<Map<String,Object>> queryKeyCustomers(Map<String, Object> param);
 Long getKeyCustomersCount(Map<String, Object> param);
}
