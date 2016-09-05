package cn.com.fml.mvc.dao.intf;

import java.util.List;
import java.util.Map;

import cn.com.fml.mvc.dmo.TbHouseType;

public interface HouseTypeDao {
	List<Map<String, Object>> queryHouseTypeList(Long buildingId);//楼盘详情主力户型
	List<Map<String, Object>> mainHouseTypeList(Long buildingId);//主力户型接口
	List<Map<String, Object>> getHouseTypeManagerList(Map<String, Object> param);//户型管理列表
	Long getHouseTypeManagerListCount(Map<String, Object> param);//取得户型管理列表数目
	Boolean addHouseType(TbHouseType houseType);//添加户型
	Boolean updateHouseType(TbHouseType houseType);//修改户型
	TbHouseType getHouseTypeToUpdate(Long houseTypeId);//取得需要修改的户型
	Boolean deleteHouseType(Long houseTypeId);//删除户型
}
