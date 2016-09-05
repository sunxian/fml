package cn.com.fml.mvc.dao.intf;

import java.util.List;
import java.util.Map;

import cn.com.fml.mvc.dmo.HouseBanForm;
import cn.com.fml.mvc.dmo.TbHouseBan;

public interface HouseBanDao {
	
	List<Map<String, Object>> queryHouseBanList(Long buildingId);
	List<Map<String, Object>> queryHouseBanInfoList(Long buildingId);
	List<String> queryOtherhouseType();
	
	Boolean addHouseBan(List<TbHouseBan> houseBans);
	List<Map<String, Object>> HouseBanManagerList(Map<String, Object> param);
	Long getHouseBanManagerCount(Map<String, Object> param);
	TbHouseBan selectHouseBanToUpdate(long id);
	Boolean updateHouseBan(TbHouseBan houseBan);
}
