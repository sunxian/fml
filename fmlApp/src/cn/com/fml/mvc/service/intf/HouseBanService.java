package cn.com.fml.mvc.service.intf;

import java.util.List;
import java.util.Map;

public interface HouseBanService {
	List<Map<String, Object>> queryHouseBanInfoList(Long buildingId) throws Exception;
	List<String> queryOtherhouseType()throws Exception;
}
