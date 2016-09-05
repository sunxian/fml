package cn.com.fml.mvc.service.intf;

import java.util.List;
import java.util.Map;

import cn.com.fml.mvc.common.PageBean;
import cn.com.fml.mvc.dmo.TbHouseBan;

public interface HouseBanService {
	List<Map<String, Object>> queryHouseBanInfoList(Long buildingId) throws Exception;
	List<String> queryOtherhouseType()throws Exception;
	
	Boolean addHouseBan(List<TbHouseBan> houseBans)throws Exception;//添加楼栋
	PageBean getHouseBanList(int pageNo, int pageSize, Map<String, Object> param) throws Exception;//楼栋管理列表
	TbHouseBan getHouseBanToUpdate(Long id)throws Exception;//获取需要修改的楼栋
	Boolean updateHouseBan(TbHouseBan houseBan)throws Exception;//修改楼栋
}
