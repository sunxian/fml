package cn.com.mobilereal.mvc.action;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import cn.com.mobilereal.mvc.models.AccountModel;

@Controller
@RequestMapping(value="/databind")
@SessionAttributes(value="sessionaccountmodel")
public class DataBindController {

	@RequestMapping(value="/parambind",method={RequestMethod.GET})
	public ModelAndView paramBind(){
		ModelAndView view = new ModelAndView();
		view.setViewName("parambind");
		return view;
	}
	
	@RequestMapping(value="/parambind",method={RequestMethod.POST})
	public ModelAndView paramBind(HttpServletRequest request, @RequestParam("urlParam") String urlParam, 
			@RequestParam("formParam") String formParam, @RequestParam("formFile") MultipartFile formFile){
		
		//如果不用注解自动绑定，我们还可以像下面一样手动获取数据
		String urlParam1 = ServletRequestUtils.getStringParameter(request, "urlParam", null);
        String formParam1 = ServletRequestUtils.getStringParameter(request, "formParam", null);
        MultipartFile formFile1 = ((MultipartHttpServletRequest) request).getFile("formFile");
		
		ModelAndView view = new ModelAndView();
		view.addObject("urlParam", urlParam);
		view.addObject("formParam", formParam);
		view.addObject("formFileName", formFile.getOriginalFilename());
		
		view.addObject("urlParam1", urlParam1);
		view.addObject("formParam1", formParam1);
		view.addObject("formFile1", formFile1.getOriginalFilename());
		
		view.setViewName("parambindresult");
		return view;
	}
	
	@RequestMapping(value="/modelautobind", method={RequestMethod.GET})
	public String modelAutoBind(HttpServletRequest request, Model model){
		model.addAttribute("accountmodel", new AccountModel());
		return "modelautobind"; 
	}
	
	@RequestMapping(value="/modelautobind", method={RequestMethod.POST})
	//public String modelAutoBind(HttpServletRequest request, Model model, AccountModel accountMode){
	//model.addAttribute("accountmodel", accountMode);
	public String modelAutoBind(HttpServletRequest request, @ModelAttribute("accountmodel") AccountModel accountModel){
		return "modelautobindresult"; 
	}
	
	@RequestMapping(value="/cookiebind", method={RequestMethod.GET})
	public String cookieBind(HttpServletRequest request, Model model, @CookieValue(value="JSESSIONID", defaultValue="") String jsessionId){
		model.addAttribute("jsessionId", jsessionId);
		return "cookiebindresult";
	}
	
	@RequestMapping(value="/requestheaderbind", method={RequestMethod.GET})
	public String requestHeaderBind(HttpServletRequest request, Model model, @RequestHeader(value="User-Agent", defaultValue="") String userAgent){
		model.addAttribute("userAgent", userAgent);
		return "requestheaderbindresult";
	}
	
	/**
	 * <p>由于我们在controller上指定了@SessionAttributes，所以在@ModelAttribute(“xxx”)注解的参数会直接在@SessionAttributes中查找名为”xxx”的对象，
	 * 如果没有找到则调用@ModelAttribute(“xxx”)注解的方法返回对象并存入@SessionAttributes（如果没有找到且没有@ModelAttribute(“xxx”)
	 * 注解的方法就会抛出HttpSessionRequiredException）。</p>
	 * @return
	 */
	@ModelAttribute("sessionaccountmodel")
	public AccountModel initAccountModel(){
		return new AccountModel();
	}
	
	@RequestMapping(value="/usernamebind", method = {RequestMethod.GET})
	public String userNameBind(Model model, AccountModel accountModel){
		model.addAttribute("sessionaccountmodel", new AccountModel());
		return "usernamebind";
	}
	
	@RequestMapping(value="/usernamebind", method = {RequestMethod.POST})
	public String userNameBindPost(@ModelAttribute("sessionaccountmodel") AccountModel accountModel){
		return "redirect:passwordbind";
	}
	
	@RequestMapping(value="/passwordbind", method = {RequestMethod.GET})
	public String passwordBind(@ModelAttribute("sessionaccountmodel") AccountModel accountModel){
		return "passwordbind";
	}
	
	/**
	 * <p>当执行到最后一步就可以调用SessionStatus.setComplete()方法把@SessionAttributes
	 * 中保存对象销毁了（不会清除HttpSession中的数据）。</p>
	 * @param accountModel
	 * @param status
	 * @return
	 */
	@RequestMapping(value="/passwordbind", method = {RequestMethod.POST})
	public String passwordBindPost(@ModelAttribute("sessionaccountmodel") AccountModel accountModel, SessionStatus status){
		status.setComplete();
		return "sessionmodelbindresult";
	}
	
	@RequestMapping(value="/requestbodybind", method={RequestMethod.GET})
	public String requestBodyBind(Model model){
		model.addAttribute("accountmodel", new AccountModel());
		return "requestbodybind";
	}
	
	@RequestMapping(value="/requestbodybind", method = {RequestMethod.POST})
	public @ResponseBody AccountModel requestBodyBind(@RequestBody AccountModel accountModel){
	            
	    return accountModel;
	}
}
