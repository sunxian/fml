package cn.com.fml.mvc.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fml.mvc.common.FmlConstants;
import cn.com.fml.mvc.dao.intf.DevelopersNewsDao;
import cn.com.fml.mvc.dao.intf.HouseBanDao;
import cn.com.fml.mvc.dao.intf.HouseTypeDao;
import cn.com.fml.mvc.dao.intf.TbHotBuildingDao;
import cn.com.fml.mvc.dao.intf.TsAssetsDao;
import cn.com.fml.mvc.service.intf.BuildingService;

@Service("buildingService")
public class BuildingServiceImpl implements BuildingService{
	
	@Autowired
	private TbHotBuildingDao tbHotBuildingDao;
	
	@Autowired
	private TsAssetsDao tsAssetsDao;
	
	@Autowired
	private DevelopersNewsDao developersNewsDao;
	
	@Autowired
	private HouseTypeDao houseTypeDao;
	
	@Autowired
	private HouseBanDao houseBanDao;
	
	@Override
	public List<Map<String, Object>> getHotBuilding(Long userId) throws Exception {
		
		List<Map<String, Object>> collectionList = tbHotBuildingDao.getCollectionBuilding(userId);
		List<Map<String, Object>> hotList = tbHotBuildingDao.getHotBuilding(userId);
		if (!CollectionUtils.isEmpty(collectionList)) {
			collectionList.addAll(hotList);
			for (Map<String, Object> map : collectionList) {
				Object buildingId = map.get("id");
				List<String> imageUrl = queryBuildIngImage(buildingId, FmlConstants.AssetsCode.HOME_PAGE_TOPIMAGE);
				if (!CollectionUtils.isEmpty(imageUrl)) {
					map.put("imageUrl", imageUrl.get(0));
				} else {
					map.put("imageUrl", "");
				}
			}
		}

		return collectionList;
	}

	@Override
	public Map<String, Object> getBuildingById(Long buildingId, Long roleId) throws Exception {
		Map<String, Object> map = tbHotBuildingDao.getBuildingById(buildingId);
		//获取楼盘详情页顶部图片
		List<String> list = queryBuildIngImage(buildingId, FmlConstants.AssetsCode.DETAIL_PAGE_TOPIMAGE);
		map.put("topImages", list);
		//获取标签列表
		List<String> label = tbHotBuildingDao.getBuildingLabel(buildingId);
		map.put("labels", label);
		//获取最新动态
		List<Map<String,Object>> newsList = developersNewsDao.queryNewsList(buildingId);
		int total = 0;
		if (!CollectionUtils.isEmpty(newsList)) {
			total = newsList.size();
			Map<String, Object> newsMap = newsList.get(0);
			newsMap.put("total", total);
			map.put("newsList", newsMap);
		}
		//获取楼盘佣金信息
		List<Map<String,Object>> commissionInfo = getCommissionInfo(buildingId, roleId);
		map.put("commissionList", commissionInfo);
		//主力户型列表
		List<Map<String,Object>> houseTypeList = houseTypeDao.queryHouseTypeList(buildingId);
		if (!CollectionUtils.isEmpty(houseTypeList)) {
			map.put("mainHouseTypeList", houseTypeList);
		}
		//楼栋信息
		List<Map<String,Object>> banList = houseBanDao.queryHouseBanList(buildingId);
		if (!CollectionUtils.isEmpty(banList)) {
			map.put("houseBan", banList);
		}
		return map;
	}
	
	@Override
	public List<Map<String, Object>> coopBuildingsById(Long buildingId, Long roleId) throws Exception {
		List<Map<String, Object>> coopBuildings = tbHotBuildingDao.getCoopBuildings(buildingId);
		if (!CollectionUtils.isEmpty(coopBuildings)) {
			for (Map<String, Object> map : coopBuildings) {
				//获取合作楼盘列表缩略图
				List<String> list = queryBuildIngImage(map.get("id"), FmlConstants.AssetsCode.LIST_PAGE_SNAPSHORT);
				String imageUrl = "";
				if (!CollectionUtils.isEmpty(list)) {
					imageUrl = list.get(0);
				}
				map.put("imageUrl", imageUrl);
				//获取合作楼盘佣金信息
				List<Map<String,Object>> commissionInfo = getCommissionInfo(buildingId, roleId);
				String commission = "";
				if (!CollectionUtils.isEmpty(commissionInfo)) {
					Object commObj = commissionInfo.get(0).get("amount");
					commission = commObj!= null ? commObj.toString() : "";
				}
				map.put("commission", commission);
				//房间区间，面积区间
				Map<String, Object> region = tbHotBuildingDao.getBuildingRegion(buildingId);
				map.putAll(region);
				//获取标签列表
				List<String> label = tbHotBuildingDao.getBuildingLabel(buildingId);
				map.put("labels", label);
			}
		}
		
		return coopBuildings;
	}
	
	@Override
	public List<Map<String, Object>> getBuildingsList(Long roleId) throws Exception {
		List<Map<String, Object>> buildingsList = tbHotBuildingDao.getBuildingsList();
		if (!CollectionUtils.isEmpty(buildingsList)) {
			for (Map<String, Object> map : buildingsList) {
				Long buildingId = new Long(map.get("id").toString());
				//获取楼盘列表缩略图
				List<String> list = queryBuildIngImage(map.get("id"), FmlConstants.AssetsCode.LIST_PAGE_SNAPSHORT);
				String imageUrl = "";
				if (!CollectionUtils.isEmpty(list)) {
					imageUrl = list.get(0);
				}
				map.put("imageUrl", imageUrl);
				//获取楼盘佣金信息
				List<Map<String,Object>> commissionInfo = getCommissionInfo(buildingId, roleId);
				String commission = "";
				if (!CollectionUtils.isEmpty(commissionInfo)) {
					Object commObj = commissionInfo.get(0).get("amount");
					commission = commObj!= null ? commObj.toString() : "";
				}
				map.put("amount", commission);
				map.put("count", commissionInfo.size());
				//房间区间，面积区间
				Map<String, Object> region = tbHotBuildingDao.getBuildingRegion(buildingId);
				map.putAll(region);
			}
		}
		
		return buildingsList;
	}
	
	private List<String> queryBuildIngImage(Object buildingId, String typeCode) {
		HashMap<String,Object> parm = new HashMap<String, Object>();
		parm.put("buildId", buildingId);
		parm.put("typeCode", typeCode);
		List<String> list = tsAssetsDao.queryBuildImage(parm);
		return list;
	}
	
	private List<Map<String, Object>> getCommissionInfo(Long buildingId, Long roleId) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("buildingId", buildingId);
		param.put("roleId", roleId);
		List<Map<String,Object>> commissionInfo = tbHotBuildingDao.getCommissionByBuildingId(param);
		return commissionInfo;
	}

}
