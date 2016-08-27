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

import cn.com.fml.mvc.service.intf.MainDataService;

@Controller
@RequestMapping(value="/app")
public class MainDataController {
	
	@Autowired
	private MainDataService mainDataService;
	
	@RequestMapping("/getAreaData")
	@ResponseBody
	public Map<String, Object> getAreaData(HttpServletRequest request, HttpServletResponse resp) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String idStr = request.getParameter("id");
		Long areaId = 0L;
		if (StringUtils.isNotBlank(idStr)) {
			areaId = Long.parseLong(idStr);
		}
		List<Map<String,Object>> list = mainDataService.getAreaData(areaId);
		map.put("value", list);
		return map;
	}
	
}
