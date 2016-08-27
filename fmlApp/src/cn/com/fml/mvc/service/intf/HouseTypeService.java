package cn.com.fml.mvc.service.intf;

import java.util.List;
import java.util.Map;

import cn.com.fml.mvc.common.PageBean;

public interface HouseTypeService {
	
	List<Map<String, Object>> mainHouseTypeList(Long buildingId) throws Exception;
	//户型管理
	PageBean getHouseTypeManagerList(int pageNo, int pageSize, Map<String, Object> param) throws Exception;
}
