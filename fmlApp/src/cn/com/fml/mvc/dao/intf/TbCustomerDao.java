package cn.com.fml.mvc.dao.intf;

import java.util.List;
import java.util.Map;

public interface TbCustomerDao {
 int queryTimesByMonth();
 int queryTimesByYear();
 int queryTimesByWeek();
 List<Map<String, Object>> queryReports();
 
 //客户详情
 List<Map<String,Object>> queryCustomerDetail(Long customerId);
 List<Map<String,Object>> queryReportList(Long customerId);
 double queryminPrice(Long customerId);
 double querymaxPrice(Long customerId);
 List<String> queryTypes(Long customerId);
 List<String> queryAreas(Long customerId);
 List<String> queryHouseTypes(Long customerId);

}
