package cn.com.fml.mvc.service.intf;

import java.util.List;
import java.util.Map;

public interface CustomerService {
	int queryTimesByMonth()throws Exception;
	 int queryTimesByYear()throws Exception;
	 int queryTimesByWeek()throws Exception;
	 List<Map<String, Object>> queryReports()throws Exception;
	 
List<Map<String,Object>> queryCustomerDetail(Long customerId)throws Exception;
List<Map<String,Object>> queryReportList(Long customerId)throws Exception;
double queryminPrice(Long customerId)throws Exception;
	 double querymaxPrice(Long customerId)throws Exception;
 List<String> queryTypes(Long customerId)throws Exception;
 List<String> queryAreas(Long customerId)throws Exception;
	 List<String> queryHouseTypes(Long customerId)throws Exception;
}
