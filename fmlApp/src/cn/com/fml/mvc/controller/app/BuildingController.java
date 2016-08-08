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
import cn.com.fml.mvc.common.QueryParam;
import cn.com.fml.mvc.service.intf.AssetsService;
import cn.com.fml.mvc.service.intf.BuildingService;
import cn.com.fml.mvc.service.intf.HeadlinesService;
import cn.com.fml.mvc.util.CommoUtil;


@Controller
@RequestMapping(value="/app")
public class BuildingController {
	
	@Autowired
	private AssetsService assetsService;
	
	@Autowired
	private HeadlinesService headlinesService;
	
	@Autowired
	private BuildingService buildingService;
	
	@RequestMapping("/homepage")
	@ResponseBody
	public Map<String, Object> homepage(HttpServletRequest request, HttpServletResponse resp) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Map<String, Object>> assetsByCode = assetsService.queryAssetsByCode(FmlConstants.AssetsCode.HOME_PAGE_TOPIMAGE);
		map.put("topImages", assetsByCode);
		Map<String, Object> headLines = headlinesService.getTopOneHeadLines();
		map.put("categoryCode", headLines);
		List<Map<String, Object>> hotBuilding = buildingService.getHotBuilding(1L);
		map.put("hotBuilding", hotBuilding);
		
		return map;
	}
	
	@RequestMapping("/buildingDetail")
	@ResponseBody
	public Map<String, Object> buildingDetail(HttpServletRequest request, HttpServletResponse resp) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String buildingId = request.getParameter("id");
		if (StringUtils.isBlank(buildingId)) {
			map.put("errorCode", FmlConstants.ERROR_CODE_TYPE1);
			return map;
		}
		//TODO
		Long roleId = 1L;
		Map<String, Object> buildIngDetail = buildingService.getBuildingById(new Long(buildingId), roleId);
		map.putAll(buildIngDetail);
		
		return map;
	}
	
	@RequestMapping("/coopBuildings")
	@ResponseBody
	public Map<String, Object> coopBuildings(HttpServletRequest request, HttpServletResponse resp) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String buildingId = request.getParameter("id");
		if (StringUtils.isBlank(buildingId)) {
			map.put("errorCode", FmlConstants.ERROR_CODE_TYPE1);
			return map;
		}
		//TODO
		Long roleId = 1L;
		List<Map<String, Object>> coopBuildingsMap = buildingService.coopBuildingsById(new Long(buildingId), roleId);
		map.put("value", coopBuildingsMap);
		return map;
	}
	
	@RequestMapping("/buildingList")
	@ResponseBody
	public Map<String, Object> buildingList(HttpServletRequest request, HttpServletResponse resp) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		// 暂时没有处理检索条件。比较麻烦。初步考虑再搞一个检索表，该表包含楼盘所有属性值。但是范围类不太好处理
		String startIndex = request.getParameter("startIndex");
		
		QueryParam<Object> pager = new QueryParam<Object>();
		
		if (!CommoUtil.checkIsNotNull(startIndex)) {
			map.put("errorCode", FmlConstants.ERROR_CODE_TYPE1);
			return map;
		}
        int index = Integer.valueOf(startIndex);
        int pageSize = 10;
        String pageSizePar = request.getParameter("pageSize");
        if (CommoUtil.checkIsNotNull(pageSizePar)) {
        	pageSize = Integer.valueOf(pageSizePar);
        }
        int pageNumber = index/pageSize + 1;
        
		pager.setPageSize(pageSize);
		pager.setPageNumber(pageNumber);
		
		//TODO
		Long roleId = 1L;
		List<Map<String, Object>> coopBuildingsMap = buildingService.getBuildingsList(roleId);
		map.put("value", coopBuildingsMap);
		return map;
	}
	
	
	
}
