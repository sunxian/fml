package cn.com.fml.mvc.controller.app;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.fml.mvc.service.intf.CustomerService;
import cn.com.fml.mvc.service.intf.UserService;


@Controller
@RequestMapping(value="/app")
public class CustomerController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private CustomerService customerService;
	//客户首页
	@RequestMapping("/customerHome")
	@ResponseBody
	public Map<String, Object> homepage(HttpServletRequest request, HttpServletResponse resp) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String seeType = request.getParameter("seeType");
		if (StringUtils.isBlank(seeType) ) {
			map.put("errorCode", "01");
		}else if(seeType.equals("1")){
			int times=customerService.queryTimesByWeek();
			map.put("seeTimes", times);
		}else if(seeType.equals("2")){
			int times=customerService.queryTimesByMonth();
			map.put("seeTimes", times);
		}else if(seeType.equals("3")){
			int times=customerService.queryTimesByYear();
			map.put("seeTimes", times);
		}
		List<Map<String, Object>> reportsList=customerService.queryReports();
		map.put("reports", reportsList);
		return map;
	}
	
	@RequestMapping("/addCustomer")
	@ResponseBody
	public Map<String, Object> addCustomer(HttpServletRequest request, HttpServletResponse resp) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String buildingId = request.getParameter("name");
		String phone = request.getParameter("phone");
		String level = request.getParameter("level");
		String remark = request.getParameter("remark");
		String types = request.getParameter("types");
		String minPrice = request.getParameter("name");
		
		return map;
	}
	//客户详情
	@RequestMapping("/customerDetail")
	@ResponseBody
	public Map<String, Object> getCustomerDetail(HttpServletRequest request, HttpServletResponse resp) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
      
		return map;
	}
	
}
