package cn.com.fml.mvc.controller.app;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.com.fml.mvc.dmo.TbHeadlines;
import cn.com.fml.mvc.service.intf.HeadlinesService;

/**
 * @author hasee
 * 最新头条
 *
 */
@Controller
@RequestMapping(value="/app/headlines")
public class WapHeadlinesController {
	@Autowired
	private HeadlinesService headlinesService;
	@RequestMapping("/headlines")
	@ResponseBody
	public Map<String, Object> getHeadlines(HttpServletRequest request, HttpServletResponse resp) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<TbHeadlines> list=headlinesService.getHeadlines();
		 //list=(List<TbHeadlines>) headlinesService.getHeadlines();
		if(list==null)
			{map.put("error", "00");}//未查询到数据
 else {
			map.put("success", list);
		}
		return map;
	}
}