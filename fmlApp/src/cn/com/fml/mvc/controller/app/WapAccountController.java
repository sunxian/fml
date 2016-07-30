package cn.com.fml.mvc.controller.app;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.com.fml.mvc.dmo.TsUser;
import cn.com.fml.mvc.service.intf.UserService;


@Controller
@RequestMapping(value="/app/login")
public class WapAccountController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/login")
	@ResponseBody
	public Map<String, Object> login(HttpServletRequest request, HttpServletResponse resp) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		if (StringUtils.isBlank(phone) || StringUtils.isBlank(password)) {
			map.put("errorCode", "01");
		}
		TsUser user = userService.getUserByPhone(phone);
		if (user == null || !password.equals(user.getPassword())) {
			map.put("errorCode", "00");
		} else {
			map.put("return", user);
		}
		//JSONObject.toJSONString(map)
		return map;
	}
	
}
