package cn.com.fml.mvc.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import cn.com.fml.mvc.dmo.TbBuilding;
import cn.com.fml.mvc.dmo.TbHouseBan;
import cn.com.fml.mvc.dmo.TbHouseType;
import cn.com.fml.mvc.dmo.TsRole;
import cn.com.fml.mvc.dmo.TsUser;
import cn.com.fml.mvc.service.intf.BuildingService;
import cn.com.fml.mvc.service.intf.CustomerService;
import cn.com.fml.mvc.service.intf.HouseBanService;
import cn.com.fml.mvc.service.intf.HouseTypeService;
import cn.com.fml.mvc.service.intf.TbCommissonService;
import cn.com.fml.mvc.service.intf.UserService;

@Controller
@RequestMapping(value = "/project")
public class ProjectController extends BaseController {
	Logger logger = Logger.getLogger(ProjectController.class);
	@Autowired
	private BuildingService buildingService;
	@Autowired
	private UserService userService;
	@Autowired
	private CustomerService customerService;
	@Autowired
	private HouseTypeService houseTypeService;
	@Autowired
	private HouseBanService houseBanService;
	@Autowired
	private TbCommissonService commissonService;

	@RequestMapping("/list")
	@ResponseBody
	public ModelAndView homepage(HttpServletRequest request,
			HttpServletResponse resp) throws Exception {
		ModelAndView view = new ModelAndView();
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("name", name);
		param.put("id", id);
		this.pageBean = buildingService.getProjectList(this.pageNo,
				this.pageSize, param);
		view.addObject("pageBean", this.pageBean);
		view.setViewName("project/building");
		return view;
	}
	// 经济人管理
	@RequestMapping("/agent")
	public ModelAndView Agentpage(HttpServletRequest request,
			HttpServletResponse resp) throws Exception {
		ModelAndView view = new ModelAndView();
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("name", name);
		param.put("id", id);
		this.pageBean = userService.getAgentList(this.pageNo, this.pageSize,
				param);
		view.addObject("pageBean", this.pageBean);
		view.setViewName("project/agent");
		return view;
	}

	// 关键人管理
	@RequestMapping("/key")
	public ModelAndView Keypage(HttpServletRequest request,
			HttpServletResponse resp) throws Exception {
		ModelAndView view = new ModelAndView();
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("name", name);
		param.put("id", id);
		this.pageBean = userService.getKeyList(this.pageNo, this.pageSize,
				param);
		view.addObject("pageBean", this.pageBean);
		view.setViewName("project/key");
		return view;
	}

	// 经纪人客户管理
	@RequestMapping("/agentCustomers")
	public ModelAndView agentCustomerspage(HttpServletRequest request,
			HttpServletResponse resp) throws Exception {
		ModelAndView view = new ModelAndView();
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("name", name);
		param.put("id", id);
		this.pageBean = customerService.getAgentCustomersList(this.pageNo,
				this.pageSize, param);
		view.addObject("pageBean", this.pageBean);
		view.setViewName("project/agentCustomers");
		return view;
	}

	// 关键人客户管理
	@RequestMapping("/keyCustomers")
	public ModelAndView keyCustomerspage(HttpServletRequest request,
			HttpServletResponse resp) throws Exception {
		ModelAndView view = new ModelAndView();
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("name", name);
		param.put("id", id);
		this.pageBean = customerService.getKeyCustomersList(this.pageNo,
				this.pageSize, param);
		view.addObject("pageBean", this.pageBean);
		view.setViewName("project/keyCustomers");
		return view;
	}
	// 楼盘管理
	@RequestMapping("/building")
	public ModelAndView buildingpage(HttpServletRequest request,
			HttpServletResponse resp) throws Exception {
		ModelAndView view = new ModelAndView();
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("name", name);
		param.put("id", id);
		this.pageBean = buildingService.getProjectList(this.pageNo,
				this.pageSize, param);
		view.addObject("pageBean", this.pageBean);
		view.setViewName("project/building");
		return view;
	}

	// 楼栋管理
	@RequestMapping(value = "/houseBan")
	public ModelAndView houseBanpage(HttpServletRequest request,
			HttpServletResponse resp) throws Exception {
		ModelAndView view = new ModelAndView();
		String buildingName = request.getParameter("building");
		String name = request.getParameter("name");
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("buildingName", buildingName);
		param.put("name", name);
		this.pageBean = houseBanService.getHouseBanList(this.pageNo,
				this.pageSize, param);
		view.addObject("pageBean", this.pageBean);
		view.setViewName("project/houseBan");
		return view;
	}

	// 佣金管理
	@RequestMapping("/commission")
	public ModelAndView page(HttpServletRequest request,
			HttpServletResponse resp) throws Exception {
		ModelAndView view = new ModelAndView();
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("name", name);
		param.put("id", id);
		this.pageBean = commissonService.getCommissionManagerList(this.pageNo,
				this.pageSize, param);
		view.addObject("pageBean", this.pageBean);
		view.setViewName("project/commission");
		return view;
	}

	// 户型管理
	@RequestMapping("/houseType")
	public ModelAndView housetypepage(HttpServletRequest request,
			HttpServletResponse resp) throws Exception {
		ModelAndView view = new ModelAndView();
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("name", name);
		param.put("id", id);
		this.pageBean = houseTypeService.getHouseTypeManagerList(pageNo,
				pageSize, param);
		view.addObject("pageBean", this.pageBean);
		view.setViewName("project/houseType");
		return view;
	}

	// 管理员管理
	@RequestMapping("/admin")
	public ModelAndView adminpage(HttpServletRequest request,
			HttpServletResponse resp) throws Exception {
		ModelAndView view = new ModelAndView();
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("name", name);
		param.put("id", id);
		this.pageBean = userService.getAdminList(this.pageNo, this.pageSize,
				param);
		System.out.println(pageBean.toString());
		view.addObject("pageBean", this.pageBean);
		view.setViewName("project/admin");
		return view;
	}

	// 转到添加管理员
	@RequestMapping("/addAdmin")
	public ModelAndView addadmin(HttpServletRequest request,
			HttpServletResponse resp) throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("project/addAdmin");
		return view;
	}

	// 转到添加楼盘
	@RequestMapping("/addBuilding")
	public ModelAndView addbuilding(HttpServletRequest request,
			HttpServletResponse resp) throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("project/addBuilding");
		return view;
	}

	// 转到添加楼栋
	@RequestMapping("/addHouseBan")
	public ModelAndView addHouseBan(HttpServletRequest request,
			HttpServletResponse resp) throws Exception {
		String buildingId = request.getParameter("id");
		return new ModelAndView("project/addHouseBan", "buildingId", buildingId);
	}

	// 转到添加户型
	@RequestMapping("/addHouseType")
	public ModelAndView addhouseType(HttpServletRequest request,
			HttpServletResponse resp) throws Exception {
		ModelAndView view = new ModelAndView();
		String houseBanId = request.getParameter("houseBanId");
		String buildingId = request.getParameter("buildingId");
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("houseBanId", houseBanId);
		param.put("buildingId", buildingId);
		view.addAllObjects(param);
		view.setViewName("project/addHouseType");
		return view;
	}

	// 转到更新楼盘页面
	@RequestMapping("/updateBuilding")
	public ModelAndView updatebuilding(HttpServletRequest request,
			HttpServletResponse resp) throws Exception {
		ModelAndView view = new ModelAndView();
		String id = request.getParameter("id");
		TbBuilding building = buildingService.getBuildingToUpdate(id);
		view.setViewName("project/updateBuilding");
		view.addObject("building", building);
		return view;
	}

	// 转到更新楼栋页面
	@RequestMapping("/updateHouseBan")
	public ModelAndView updatehouseBan(HttpServletRequest request,
			HttpServletResponse resp) throws Exception {
		ModelAndView view = new ModelAndView();
		String id = request.getParameter("id");
		TbHouseBan houseBan = houseBanService.getHouseBanToUpdate(new Long(id));
		view.setViewName("project/updateHouseBan");
		view.addObject("houseBan", houseBan);
		return view;
	}

	// 转到修改户型页面
	@RequestMapping("/updateHouseType")
	public ModelAndView updatehouseType(HttpServletRequest request,
			HttpServletResponse resp) throws Exception {
		ModelAndView view = new ModelAndView();
		String id = request.getParameter("id");
		TbHouseType houseType = houseTypeService.getHouseTypeToUpdate(new Long(
				id));
		view.setViewName("project/updateHouseType");
		view.addObject("houseType", houseType);
		return view;
	}

	// 添加楼盘
	@RequestMapping("/addBuildingToDb")
	public String addbuildingToDB(HttpServletRequest request,
			HttpServletResponse resp,
			@ModelAttribute("building") TbBuilding building) throws Exception {
		buildingService.addBuilding(building);		
		return "redirect:building";
	}

	// 更新楼盘
	@RequestMapping("/updateBuildingToDb")
	public String updateBuilding(HttpServletRequest request,
			@ModelAttribute("building") TbBuilding building) throws Exception {
		buildingService.updateBuilding(building);
		return "redirect:building";
	}

	// 删除楼盘
	@RequestMapping("/deleteBuilding")
	public String deleteBuilding(HttpServletRequest request,
			HttpServletResponse resp) throws Exception {	
		String buildingId = request.getParameter("id");
		buildingService.deleteBuilding(buildingId);
		return "redirect:building";
	}

	// 添加楼栋
	@RequestMapping(value = "/addHouseBanToDb", method = { RequestMethod.POST }, consumes = "application/json")
	public String addHouseBanToDb(HttpServletRequest request,
			HttpServletResponse resp, @RequestBody List<TbHouseBan> houseBans)
			throws Exception {
		houseBanService.addHouseBan(houseBans);
		return "forward:houseBan";
	}

	// 更新楼栋
	@RequestMapping("/updateHouseBanToDb")
	@ResponseBody
	public String updateHouseBanToDb(HttpServletRequest request,
			@ModelAttribute("houseBan") TbHouseBan houseBan) throws Exception {
		houseBanService.updateHouseBan(houseBan);
		return "redirect:houseBan";
	}

	// 添加户型
	@RequestMapping(value = "/addHouseTypeToDb", method = { RequestMethod.POST })
	public String addHouseTypeToDb(HttpServletRequest request,
			HttpServletResponse resp,
			@ModelAttribute("houseType") TbHouseType houseType)
			throws Exception {
		houseTypeService.addHouseType(houseType);
		return "redirect:houseType";
	}

	// 更新户型
	@RequestMapping("/updateHouseTypeToDb")
	public String updateHouseTypeToDb(HttpServletRequest request,
			@ModelAttribute("houseType") TbHouseType houseType)
			throws Exception {

		houseTypeService.updateHouseType(houseType);

		return "redirect:houseType";
	}

	// 删除户型
	@RequestMapping("/deleteHouseType")
	public String deleteHouseType(HttpServletRequest request,
			HttpServletResponse resp) throws Exception {
		String houseTypeId = request.getParameter("id");
		houseTypeService.deleteHouseType(new Long(houseTypeId));
		return "redirect:houseType";
	}

	// 添加管理员
	@RequestMapping(value = "/addAdminToDB", method = { RequestMethod.POST })
	public String addadmintodb(HttpServletRequest request,
			HttpServletResponse resp, @ModelAttribute("admin") TsUser admin)
			throws Exception {
		

		String adminname = admin.getUserName();
		String password = admin.getPassword();
		userService.addAdmin(adminname, password);
		return "redirect:admin";
	}

	// 删除管理员
	@RequestMapping(value = "/deleteAdmin")
	public String deleteadmintodb(HttpServletRequest request,
			HttpServletResponse resp, @ModelAttribute("admin") TsUser admin)
			throws Exception {
		
		// String adminname = admin.getUserName();
		String adminname = request.getParameter("userName");
		userService.deleteAdmin(adminname);
		return "redirect:admin";
	}

	

}
