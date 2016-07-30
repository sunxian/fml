package cn.com.fml.mvc.controller.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.com.fml.mvc.service.intf.HotBuildingService;

/**
 * @author hasee
 * 楼盘首页
 *
 */
@Controller
@RequestMapping(value="/app/loupanhome")
public class LoupanHomepageController {
	@Autowired
private HotBuildingService hotBuildingService;
	
	
}
