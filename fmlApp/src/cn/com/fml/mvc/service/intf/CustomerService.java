package cn.com.fml.mvc.service.intf;

import java.util.List;
import java.util.Map;

public interface CustomerService {
	int queryTimesByMonth();
	 int queryTimesByYear();
	 int queryTimesByWeek();
	 List<Map<String, Object>> queryReports();
}
