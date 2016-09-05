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

import cn.com.fml.mvc.common.FmlConstants;
import cn.com.fml.mvc.service.intf.DevelopersNewsService;
/**
 * @author hasee
 * 最新动态
 *
 */
@Controller
@RequestMapping("/app")
public class DevelopersNewsController {
	@Autowired 
	 private DevelopersNewsService developersNewsService;
	@RequestMapping("/newslist")
	@ResponseBody
	public Map<String, Object> getNewsList(HttpServletRequest request, HttpServletResponse resp) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		String buildingId= request.getParameter("id");
		List<Map<String, Object>> newsList=developersNewsService.getDevelopersNews(new Long(buildingId));
		if (StringUtils.isBlank(buildingId)) {
			map.put("errorCode", FmlConstants.ERROR_CODE_TYPE1);
			return map;
		}
		map.put("success",newsList);
		return map;
	}
}