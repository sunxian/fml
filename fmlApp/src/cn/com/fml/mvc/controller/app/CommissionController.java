package cn.com.fml.mvc.controller.app;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.com.fml.mvc.service.intf.TbCommissonService;
/**
 * @author hasee
 * 佣金详情
 *
 */
@Controller
@RequestMapping("/app")
public class CommissionController {
	
	@Autowired
	private TbCommissonService commissonService;
	@RequestMapping("/commission")
	@ResponseBody
	public Map<String, Object> getCommission(HttpServletRequest request, HttpServletResponse resp) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String id=request.getParameter("id");
		List<Map<String, Object>> commissionlist = commissonService.getCommissionById(new Long(id));
		map.put("success", commissionlist);
		map.put("coopStarttime", "8月1号");
		map.put("coopEndtime", "10月1号");
		map.put("purchaseEndtime", "2016.10.1");
		map.put("coopBuilding", "所以在售房源");
		map.put("rule", "30天保护期");
		return map;
	}
	//我的佣金
	@RequestMapping("/commissionList")
	@ResponseBody
	public Map<String, Object> getCommissionList(HttpServletRequest request, HttpServletResponse resp) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String status=request.getParameter("status");
		Map<String, Object> myCommissionMap=commissonService.getMyCommission(status);
		map.putAll(myCommissionMap);
		return map;
		
		
		
}
}