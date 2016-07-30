package cn.com.fml.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import cn.com.fml.mvc.dmo.TsRole;
import cn.com.fml.mvc.service.intf.UserService;


@Controller
@RequestMapping(value="/account")
public class AccountController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/login", method={RequestMethod.GET})
	public String login() throws Exception{
		TsRole role = new TsRole();
		role.setCode("admin");
		userService.getRole(role);
		return "login";
	}
	
	@RequestMapping(value={"/index","/hello"},method=RequestMethod.GET)
	public ModelAndView index(String name,String pass){
		ModelAndView view = new ModelAndView();
		view.setViewName("index");
		return view;
	}
	
	@RequestMapping(value="home",method=RequestMethod.GET)
	public ModelAndView home(String name,String pass){
		ModelAndView view = new ModelAndView();
		view.setViewName("home");
		return view;
	}
}
