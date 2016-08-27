package cn.com.fml.mvc.controller.app;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.fml.mvc.service.intf.UserService;


@Controller
@RequestMapping(value="/app")
public class CustomerController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/customerHome")
	@ResponseBody
	public Map<String, Object> homepage(HttpServletRequest request, HttpServletResponse resp) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		
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
	
	
}
