package cn.com.fml.mvc.service.intf;
import java.util.List;

import cn.com.fml.mvc.dmo.TbHotBuilding;

public interface HotBuildingService {
	public List<TbHotBuilding> getTbHotBuilding() throws Exception;
}
