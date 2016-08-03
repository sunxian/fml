package cn.com.fml.mvc.dao.intf;

import java.util.List;
import java.util.Map;

public interface HouseTypeDao {
	
	List<Map<String, Object>> queryHouseTypeList(Long buildingId);//楼盘详情主力户型
	List<Map<String, Object>> queryHouseTypeList1(Long buildingId);//主力户型接口
}
