package cn.com.fml.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cn.com.fml.mvc.dmo.TsUser;
import cn.com.fml.mvc.service.intf.UserService;
@Controller
@RequestMapping("/admin")
public class AdminLoginController {
	@Autowired
	UserService adminService;
	@RequestMapping(value="/login",method={RequestMethod.POST})
public String login(HttpServletRequest request,HttpServletResponse response,@ModelAttribute("admin") TsUser admin) throws Exception {
//		String adminname=request.getParameter("userName");
//		String password=request.getParameter("password");
		String adminname=admin.getUserName();
		String password=admin.getPassword();
		
		boolean isLogin=adminService.adminLogin(adminname, password);
		if(isLogin){
			HttpSession session=request.getSession();
		    session.setAttribute("admin",admin);
			return "project/list";
			
	}
	return "AdminLogin";
		
	
	}
	
	
	
/*	@RequestMapping(value="/detail/{id}",method=RequestMethod.GET)
	public ModelAndView getDetail(@PathVariable(value="id") Integer sid){
		ModelAndView m1=new ModelAndView();
		m1.addObject("id", sid);
		m1.setViewName("page1");
		return m1;
	}
*/
	
		@RequestMapping(value="/detail",method=RequestMethod.GET)
		public String getDetail(){
//			ModelAndView m1=new ModelAndView();
//			m1.addObject("id", sid);
//			m1.setViewName("page1");
			return "login";
		}
	
}
