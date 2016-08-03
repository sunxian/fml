package cn.com.fml.mvc.controller.app;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.print.DocFlavor.STRING;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.fml.mvc.service.intf.HouseBanService;

/**
 * @author hasee
 *楼栋信息接口
 */
@Controller
@RequestMapping("/app")
public class HouseBanController {
	@Autowired
	private HouseBanService houseBanService;
	@ResponseBody
	@RequestMapping("/houseBanInfo")
	public Map<String, Object> getHouseBanInfo(HttpServletRequest request, HttpServletResponse resp) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String buildingId=request.getParameter("id");
		List<Map<String, Object>> houseBanInfo = houseBanService.queryHouseBanList1(new Long(buildingId));
		map.put("success", houseBanInfo);
		List<String> otherHouseType=houseBanService.queryOtherhouseType();	
		map.put("otherHouseType",otherHouseType);
		map.get("success");
		return map;
	}

}
