package cn.com.fml.mvc.controller.app;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.fml.mvc.common.FmlConstants;
import cn.com.fml.mvc.dmo.TsUser;
import cn.com.fml.mvc.service.intf.UserService;
import cn.com.fml.mvc.util.CommoUtil;


@Controller
@RequestMapping(value="/app")
public class AccountController {
	
	@Autowired
	private UserService userService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/login")
	@ResponseBody
	public Map<String, Object> login(HttpServletRequest request, HttpServletResponse resp) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		if (StringUtils.isBlank(phone) || StringUtils.isBlank(password)) {
			map.put("errorCode", FmlConstants.ERROR_CODE_TYPE1);
		}
		TsUser user = userService.getUserByPhone(phone);
		if (user == null || !password.equals(user.getPassword())) {
			map.put("errorCode", FmlConstants.ERROR_CODE_TYPE2);
		} else {
			HttpSession session = request.getSession(true);
			
			String token = UUID.randomUUID().toString().replace("-", "");
			
			ConcurrentHashMap<String, Object> tokens = (ConcurrentHashMap<String, Object>)session.getAttribute("token");
			if (tokens == null) {
				tokens = new ConcurrentHashMap<String, Object>();
			}
			if (tokens.get(token) == null) {
				tokens.put(token, user);
			}
			session.setAttribute("token", tokens);
			map = CommoUtil.transBean2Map(user);
			map.put("token", token);
		}
		//JSONObject.toJSONString(map)
		return map;
	}
	
	
}
