package cn.com.fml.mvc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.com.fml.mvc.dmo.TbBuilding;
import cn.com.fml.mvc.dmo.TsRole;
import cn.com.fml.mvc.dmo.TsUser;
import cn.com.fml.mvc.service.intf.BuildingService;
import cn.com.fml.mvc.service.intf.CustomerService;
import cn.com.fml.mvc.service.intf.HouseTypeService;
import cn.com.fml.mvc.service.intf.UserService;


@Controller
@RequestMapping(value="/project")
public class ProjectController extends BaseController{
    
    Logger logger  =  Logger.getLogger(ProjectController.class );
    
    @Autowired
    private BuildingService buildingService;
    @Autowired
    private UserService userService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private HouseTypeService houseTypeService;
    @RequestMapping("/list")
    @ResponseBody
    public ModelAndView homepage(HttpServletRequest request, HttpServletResponse resp) throws Exception {
        ModelAndView view = new ModelAndView();
        String name = request.getParameter("name");
        String id = request.getParameter("id");
        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("name", name);
        param.put("id", id);
        this.pageBean = buildingService.getProjectList(this.pageNo, this.pageSize, param);
        view.addObject("pageBean", this.pageBean);
        view.setViewName("project/list");
        return view;        
    }
    
    //楼盘管理
    @RequestMapping("/building")
    @ResponseBody
    public ModelAndView buildingpage(HttpServletRequest request, HttpServletResponse resp) throws Exception {
        ModelAndView view = new ModelAndView();
        String name = request.getParameter("name");
        String id = request.getParameter("id");
        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("name", name);
        param.put("id", id);
        this.pageBean = buildingService.getProjectList(this.pageNo, this.pageSize, param);
        view.addObject("pageBean", this.pageBean);
        view.setViewName("project/building");
        return view;        
    }
    //户型管理
    @RequestMapping("/houseType")
    @ResponseBody
    public ModelAndView housetypepage(HttpServletRequest request, HttpServletResponse resp) throws Exception {
        ModelAndView view = new ModelAndView();
        String name = request.getParameter("name");
        String id = request.getParameter("id");
        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("name", name);
        param.put("id", id);
        this.pageBean =houseTypeService.getHouseTypeManagerList(pageNo, pageSize, param);
        view.addObject("pageBean", this.pageBean);
        view.setViewName("project/houseType");
        return view;        
    }
    //管理员管理
    @RequestMapping("/admin")
    @ResponseBody
    public ModelAndView adminpage(HttpServletRequest request, HttpServletResponse resp) throws Exception {
        ModelAndView view = new ModelAndView();
        String name = request.getParameter("name");
        String id = request.getParameter("id");
        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("name", name);
        param.put("id", id);
        this.pageBean = userService.getAdminList(this.pageNo, this.pageSize, param);
        System.out.println(pageBean.toString());
        view.addObject("pageBean", this.pageBean);
        view.setViewName("project/admin");
        return view;        
    }
    //转到添加管理员
    @RequestMapping("/addAdmin")
    @ResponseBody
    public ModelAndView addadmin(HttpServletRequest request, HttpServletResponse resp) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("project/addAdmin");
        return view;        
    }
  //转到添加楼盘
    @RequestMapping("/addBuilding")
    @ResponseBody
    public ModelAndView addbuilding(HttpServletRequest request, HttpServletResponse resp ) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("project/addBuilding");
        return view;        
    }
    //转到添加户型
    @RequestMapping("/addHouseType")
    @ResponseBody
    public ModelAndView addhouseType(HttpServletRequest request, HttpServletResponse resp ) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("project/addHouseType");
        return view;        
    }
    //转到更新楼盘页面
    @RequestMapping("/updateBuilding")
    @ResponseBody
    public ModelAndView updatebuilding(HttpServletRequest request,HttpServletResponse resp ) throws Exception {
        ModelAndView view = new ModelAndView();
        String id=request.getParameter("id");
       TbBuilding building= buildingService.getBuildingToUpdate(id);
        view.setViewName("project/updateBuilding");
        view.addObject("building", building);
        return view;        
    }
    
    //添加楼盘
    @RequestMapping("/addBuildingToDb")
    @ResponseBody
    public ModelAndView addbuildingToDB(HttpServletRequest request,HttpServletResponse resp, @ModelAttribute("building") TbBuilding building) throws Exception {
        ModelAndView view = new ModelAndView();
        buildingService.addBuilding(building);
        view.setViewName("project/building");
        return view;        
    }
    //更新楼盘
    @RequestMapping("/updateBuildingToDb")
    @ResponseBody
    public ModelAndView updateBuilding(HttpServletRequest request, @ModelAttribute("building") TbBuilding building) throws Exception {
        ModelAndView view = new ModelAndView();
        buildingService.updateBuilding(building);
        view.setViewName("project/building");
        return view;        
    }
    //删除楼盘
@RequestMapping("/deleteBuilding")
    @ResponseBody
    public ModelAndView deleteBuilding(HttpServletRequest request,HttpServletResponse resp ) throws Exception {
        ModelAndView view = new ModelAndView();
        String buildingId=request.getParameter("id");
        buildingService.deleteBuilding(buildingId);   
        view.setViewName("project/building");
        return view;        
    }
    
    
    
    
    
    //添加管理员
    @RequestMapping(value="/addAdminToDB",method={RequestMethod.POST})
    @ResponseBody
    public ModelAndView addadmintodb(HttpServletRequest request,HttpServletResponse resp,@ModelAttribute("admin") TsUser admin) throws Exception {
        ModelAndView view = new ModelAndView();
       // String adminname = request.getParameter("adminname");
      // String password = request.getParameter("password");
        String adminname=admin.getUserName();
        String password=admin.getPassword();
        userService.addAdmin(adminname, password);
        view.setViewName("project/admin");
        return view;       
        
    }
  //删除管理员
    @RequestMapping(value="/deleteAdmin")
    @ResponseBody
    public ModelAndView deleteadmintodb(HttpServletRequest request, HttpServletResponse resp,@ModelAttribute("admin") TsUser admin) throws Exception {
        ModelAndView view = new ModelAndView();
       //String adminname = admin.getUserName();
       String adminname=request.getParameter("userName");
        userService.deleteAdmin(adminname);
        view.setViewName("project/admin");
        return view;       
    }


	//经济人
    @RequestMapping("/agent")
    @ResponseBody
    public ModelAndView Agentpage(HttpServletRequest request, HttpServletResponse resp) throws Exception {
        ModelAndView view = new ModelAndView();
        String name = request.getParameter("name");
        String id = request.getParameter("id");
        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("name", name);
        param.put("id", id);
        this.pageBean = userService.getAgentList(this.pageNo, this.pageSize, param);
        view.addObject("pageBean", this.pageBean);
        view.setViewName("project/agent");
        return view;        
    }
    //关键人
    @RequestMapping("/key")
    @ResponseBody
    public ModelAndView Keypage(HttpServletRequest request, HttpServletResponse resp) throws Exception {
        ModelAndView view = new ModelAndView();
        String name = request.getParameter("name");
        String id = request.getParameter("id");
        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("name", name);
        param.put("id", id);
        this.pageBean = userService.getKeyList(this.pageNo, this.pageSize, param);
        view.addObject("pageBean", this.pageBean);
        view.setViewName("project/key");
        return view;        
    }
    
  //经纪人客户
    @RequestMapping("/agentCustomers")
    @ResponseBody
    public ModelAndView agentCustomerspage(HttpServletRequest request, HttpServletResponse resp) throws Exception {
        ModelAndView view = new ModelAndView();
        String name = request.getParameter("name");
        String id = request.getParameter("id");
        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("name", name);
        param.put("id", id);
        this.pageBean =customerService.getAgentCustomersList(this.pageNo, this.pageSize, param);
        view.addObject("pageBean", this.pageBean);
        view.setViewName("project/agentCustomers");
        return view;        
    }
    //关键人客户
    @RequestMapping("/keyCustomers")
    @ResponseBody
    public ModelAndView keyCustomerspage(HttpServletRequest request, HttpServletResponse resp) throws Exception {
        ModelAndView view = new ModelAndView();
        String name = request.getParameter("name");
        String id = request.getParameter("id");
        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("name", name);
        param.put("id", id);
        this.pageBean =customerService.getKeyCustomersList(this.pageNo, this.pageSize, param);
        view.addObject("pageBean", this.pageBean);
        view.setViewName("project/keyCustomers");
        return view;        
    }
    
}
