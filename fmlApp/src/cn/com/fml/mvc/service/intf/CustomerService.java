package cn.com.fml.mvc.service.intf;

import java.util.List;
import java.util.Map;

import cn.com.fml.mvc.common.PageBean;

public interface CustomerService {
	//客户首页
	int queryTimesByMonth()throws Exception;
	 int queryTimesByYear()throws Exception;
	 int queryTimesByWeek()throws Exception;
	 List<Map<String, Object>> queryReports()throws Exception;
	 //客户列表
	 List<Map<String,Object>> queryCustomerList()throws Exception;
	//客户详情 
List<Map<String,Object>> queryCustomerDetail(Long customerId)throws Exception;
List<Map<String,Object>> queryReportList(Long customerId)throws Exception;
double queryminPrice(Long customerId)throws Exception;
	 double querymaxPrice(Long customerId)throws Exception;
 List<String> queryTypes(Long customerId)throws Exception;
 List<String> queryAreas(Long customerId)throws Exception;
	 List<String> queryHouseTypes(Long customerId)throws Exception;
	 //经纪人客户
	 PageBean getAgentCustomersList(int pageNo, int pageSize, Map<String, Object> param) throws Exception;
	 
	 //关键人客户
	 PageBean getKeyCustomersList(int pageNo, int pageSize, Map<String, Object> param) throws Exception;
}
