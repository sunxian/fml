package cn.com.mobilereal.mvc.action;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.SQLException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cn.com.mobilereal.mvc.auth.AuthPassport;

@Controller
@RequestMapping(value="/helloworld")
public class HelloWorldController extends BaseController{
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(HttpServletRequest request){
		//对应的是WebContent目录下的WEB-INF目录下的jsp目录下的demo下的index.jsp
		//请查看配置文件springMvc3-servlet.xml仔细体会一下
		return "demo/index";   
	}
	
	@AuthPassport
	@RequestMapping(value={"/index","/hello"},method=RequestMethod.GET)
	public ModelAndView index(String name,String pass){
		ModelAndView view = new ModelAndView();
		view.addObject("message", "Hello World!");
		view.setViewName("test");
		return view;
	}
	/*@RequestMapping(value={"/index","/hello"},method=RequestMethod.GET)
	public ModelAndView index() throws SQLException{
		throw new SQLException("数据库异常。");
	}*/
	
	@RequestMapping(value="detail/{id}" ,method=RequestMethod.GET)
	public ModelAndView getDetail(@PathVariable(value="id") Integer id){
		ModelAndView view = new ModelAndView();
		view.addObject("id", id);
		view.setViewName("detail");
		return view;
	}
	
	@RequestMapping(value="/*", method=RequestMethod.GET)
	public ModelAndView urlTest(){
		ModelAndView view = new ModelAndView();
		view.setViewName("urlTest");
		return view;
	}
	
	@RequestMapping(value="/reg/{name:\\w+}-{age:\\d+}", method=RequestMethod.GET)
	public ModelAndView regUrlTest(@PathVariable(value="name") String name, @PathVariable(value="age") int age){
		ModelAndView view = new ModelAndView();
		view.addObject("name", name);
		view.addObject("age", age);
		view.setViewName("regurltest");
		return view;
	}
	
	@RequestMapping(value="/paramstest", params={"example1=AA","example2=BB"}, method={RequestMethod.GET})
	public ModelAndView paramsTest(){
		ModelAndView view = new ModelAndView();
		//view.addObject("example", example);
		view.setViewName("paramstest");
		return view;
	}
	
	public static String makeMD5(String password) {
		MessageDigest md;
		   try {
		    // 生成一个MD5加密计算摘要
		    md = MessageDigest.getInstance("MD5");
		    String uuid = UUID.randomUUID().toString().replace("-", "");
		    password = password + uuid;
		    // 计算md5函数
		    md.update(password.getBytes());
		    // digest()最后确定返回md5 hash值，返回值为8为字符串。因为md5 hash值是16位的hex值，实际上就是8位的字符
		    // BigInteger函数则将8位的字符串转换成16位hex值，用字符串来表示；得到字符串形式的hash值
		    String pwd = new BigInteger(1, md.digest()).toString(16);
		    System.err.println(pwd);
		    return pwd;
		   } catch (Exception e) {
		    e.printStackTrace();
		   }
		   return password;
		}
	
	public static void main(String[] args) {
		makeMD5("1234567");
	}
}
