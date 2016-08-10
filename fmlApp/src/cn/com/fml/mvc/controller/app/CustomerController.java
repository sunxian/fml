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

import cn.com.fml.mvc.dao.intf.TbCustomerDao;
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
	//客户列表
	@RequestMapping("/customerList")
	@ResponseBody
	public Map<String, Object> getcustomerList(HttpServletRequest request, HttpServletResponse resp) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> customerList=customerService.queryCustomerList();
		map.put("value",customerList);
		
		return map;
	}
	//客户详情
	@RequestMapping("/customerDetail")
	@ResponseBody
	public Map<String, Object> getCustomerDetail(HttpServletRequest request,
			HttpServletResponse resp) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String customerId = request.getParameter("customerId");
		if (StringUtils.isBlank(customerId)) {
			map.put("errorCode", "01");
			return map;
		}
		List<String> area = customerService.queryAreas(new Long(customerId));
		double minprice = customerService.queryminPrice(new Long(customerId));
		double maxprice = customerService.querymaxPrice(new Long(customerId));
		map.put("area", area);
		map.put("minPrice", minprice);
		map.put("maxPrice", maxprice);
		List<String> types = customerService.queryTypes(new Long(customerId));
		List<String> houseTypes = customerService.queryHouseTypes(new Long(
				customerId));
		map.put("types", types);
		map.put("houseTypes", houseTypes);
		List<Map<String, Object>> custumerdetaillist = customerService
				.queryCustomerDetail(new Long(customerId));
		for(Map<String, Object>  custumerdetailMap:custumerdetaillist){
			map.putAll(custumerdetailMap);
		}
		
		List<Map<String, Object>> reportList = customerService
				.queryReportList(new Long(customerId));
		map.put("reportList", reportList);
		map.putAll(map);
		return map;
	}
}