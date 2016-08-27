package cn.com.fml.mvc.dao.intf;

import java.util.List;
import java.util.Map;

public interface HouseTypeDao {
	List<Map<String, Object>> queryHouseTypeList(Long buildingId);//楼盘详情主力户型
	List<Map<String, Object>> mainHouseTypeList(Long buildingId);//主力户型接口
	List<Map<String, Object>> getHouseTypeManagerList(Map<String, Object> param);//户型管理列表
	Long getHouseTypeManagerListCount(Map<String, Object> param);//取得户型管理列表数目
}
