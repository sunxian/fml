package cn.com.fml.mvc.service.intf;

import java.util.List;
import java.util.Map;

import cn.com.fml.mvc.common.PageBean;
import cn.com.fml.mvc.dmo.TbHouseType;

public interface HouseTypeService {
	
	List<Map<String, Object>> mainHouseTypeList(Long buildingId) throws Exception;
	//户型管理
	PageBean getHouseTypeManagerList(int pageNo, int pageSize, Map<String, Object> param) throws Exception;
	//添加户型
    Boolean addHouseType(TbHouseType houseType)throws Exception ;
  //删除户型
    Boolean deleteHouseType(Long houseTypeId)throws Exception ;
  //修改户型
    Boolean updateHouseType(TbHouseType houseType);
  //取得需要修改的户型
	TbHouseType getHouseTypeToUpdate(Long houseTypeId);
	
}
