package cn.com.fml.mvc.dao.intf;

import java.util.List;
import java.util.Map;

public interface TbCustomerDao {
 int queryTimesByMonth();
 int queryTimesByYear();
 int queryTimesByWeek();
 List<Map<String, Object>> queryReports();
}
