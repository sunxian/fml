package cn.com.fml.mvc.controller.app;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.fml.mvc.common.FmlConstants;
import cn.com.fml.mvc.controller.BaseController;
import cn.com.fml.mvc.dmo.TsUser;
import cn.com.fml.mvc.service.intf.AssetsService;
import cn.com.fml.mvc.service.intf.BuildingService;
import cn.com.fml.mvc.service.intf.HeadlinesService;
import cn.com.fml.mvc.util.CommoUtil;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.spatial4j.core.shape.Rectangle;


@Controller
@RequestMapping(value="/app")
public class BuildingController extends BaseController{
    
    Logger logger  =  Logger.getLogger(BuildingController.class );
    
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
        TsUser loginUser = getLoginUser(request);
        Long roleId = null;
        if (loginUser != null) {
            roleId = loginUser.getTsRoleId();
        } else {
            map.put("errorCode", FmlConstants.ERROR_CODE_TYPE3);
            return map;
        }
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
        TsUser loginUser = getLoginUser(request);
        Long roleId = null;
        if (loginUser != null) {
            roleId = loginUser.getTsRoleId();
        } else {
            map.put("errorCode", FmlConstants.ERROR_CODE_TYPE3);
            return map;
        }
        List<Map<String, Object>> coopBuildingsMap = buildingService.coopBuildingsById(new Long(buildingId), roleId);
        map.put("value", coopBuildingsMap);
        return map;
    }
    
    @RequestMapping("/buildingList")
    @ResponseBody
    public Map<String, Object> buildingList(HttpServletRequest request, HttpServletResponse resp) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        
        JSONObject body = getJSONObjectFormBody(request, resp);
        logger.info("buildingList body参数：" + body);

        
        String startIndex = request.getParameter("startIndex");
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

        Map<String, Object> param = new HashMap<String, Object>();
        if (body.isEmpty()) {
            param.put("noCondition", true);
        }
        param.put("startIndex", index);
        param.put("pageSize", pageSize);
        
        if (CommoUtil.checkIsNotNull(body.get("totalPrice"))) {
            String totalPrice = (String) body.get("totalPrice");
            float minPrice = 0;
            float maxPrice = 0;
            if (StringUtils.isNotBlank(totalPrice)) {
                String[] prices = totalPrice.split("-");
                if (prices != null) {
                    minPrice = Float.parseFloat(prices[0]);
                    maxPrice = Float.parseFloat(prices[1]);
                }
            }
            param.put("minPrice", minPrice);
            param.put("maxPrice", maxPrice);
        }
        if (CommoUtil.checkIsNotNull(body.get("square"))) {
            String square = (String) body.get("square");
            float minSquare = 0;
            float maxSquare = 0;
            if (StringUtils.isNotBlank(square)) {
                String[] squares = square.split("-");
                if (squares != null) {
                    minSquare = Float.parseFloat(squares[0]);
                    maxSquare = Float.parseFloat(squares[1]);
                }
            }
            param.put("minSquare", minSquare);
            param.put("maxSquare", maxSquare);
        }
        //0为四室以上
        if (CommoUtil.checkIsNotNull(body.get("houseType"))) {
            String houseType = (String) body.get("houseType");
            param.put("houseType", houseType);
        }
        //标签
        JSONArray likes = new JSONArray();
        JSONArray hates = new JSONArray();
        if (body.get("likes") != null) {
            likes = (JSONArray) body.get("likes");
            param.put("likes", likes);
        }
        if (body.get("hates") != null) {
            hates = (JSONArray) body.get("hates");
            param.put("hates", hates);
        }
        if (CommoUtil.checkIsNotNull(body.get("areaId"), body.get("level"))) {
            //区域id
            Object areaId = body.get("areaId");
            //行政级别
            Object level = (String) body.get("level");
            param.put("areaId", areaId);
            param.put("level", level);
        }
        
        if (CommoUtil.checkIsNotNull(body.get("lng"), body.get("lat"), body.get("radius"))) {
            //经纬度，范围区间
            BigDecimal lng = (BigDecimal) body.get("lng");
            BigDecimal lat = (BigDecimal) body.get("lat");
            BigDecimal radius = (BigDecimal) body.get("radius");
            if (CommoUtil.checkIsNotNull(lng, lat, radius)) {
                Rectangle rectangle = CommoUtil.getRectangle(lng, lat, radius);
                double minLng = rectangle.getMinX();
                double maxLng = rectangle.getMaxX();
                double minLat = rectangle.getMinY();
                double maxLat = rectangle.getMinY();
                logger.info("buildingList 传入值 lng：" + lng + ",lat:" + lat + ",radius:" + radius);
                logger.info("buildingList 计算出经度范围：" + rectangle.getMinX() + "-" + rectangle.getMaxX());
                logger.info("buildingList 计算出纬度范围：" + rectangle.getMinY() + "-" + rectangle.getMaxY());
                param.put("minLng", minLng);
                param.put("maxLng", maxLng);
                param.put("minLat", minLat);
                param.put("maxLat", maxLat);
            }
        }
        if (CommoUtil.checkIsNotNull(body.get("userLng"), body.get("userLat"))) {
            param.put("userLng", body.get("userLng"));
            param.put("userLat", body.get("userLat"));
        }
        
        TsUser loginUser = getLoginUser(request);
        Long roleId = null;
        if (loginUser != null) {
            roleId = loginUser.getTsRoleId();
        } else {
            map.put("errorCode", FmlConstants.ERROR_CODE_TYPE3);
            return map;
        }
        param.put("roleId", roleId);
        List<Map<String, Object>> coopBuildingsMap = buildingService.getBuildingsList(param);
        map.put("value", coopBuildingsMap);
        logger.info("buildingList map返回值：" + map);
        return map;
    }
    
    
    
}
