package cn.com.fml.mvc.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fml.mvc.common.PageBean;
import cn.com.fml.mvc.dao.intf.HouseTypeDao;
import cn.com.fml.mvc.dao.intf.TbHotBuildingDao;
import cn.com.fml.mvc.dmo.TbHouseType;
import cn.com.fml.mvc.service.intf.HouseTypeService;

@Service("houseTypeService")
public class HouseTypeServiceImpl implements HouseTypeService {
	
	@Autowired
	private HouseTypeDao houseTypeDao;
	
	
	@Autowired
	private TbHotBuildingDao tbHotBuildingDao;
	
	@Override
	public List<Map<String, Object>> mainHouseTypeList(Long buildingId) throws Exception {
		
		List<Map<String,Object>> list = houseTypeDao.mainHouseTypeList(buildingId);
		if (!CollectionUtils.isEmpty(list)) {
			for (Map<String,Object> map : list) {
				List<String> labelList = tbHotBuildingDao.getHouseTypeLabel(buildingId);
				map.put("labels", labelList);
			}
		}
		return list;
	}

	@Override
	public PageBean getHouseTypeManagerList(int pageNo, int pageSize,
			Map<String, Object> param) throws Exception {
		 Long count = houseTypeDao.getHouseTypeManagerListCount(param);
		    PageBean pageBean = new PageBean(pageNo, count.intValue());
		    param.put("startIndex", pageBean.getStartIndex());
		    param.put("pageSize", pageSize);
		    List<Map<String, Object>> list = houseTypeDao.getHouseTypeManagerList(param);
		    for(Map<String,Object> item:list){
		    	String isSaling=null;   	
				if(item.get("isSalingFlag")==null){
					item.put("isSalingFlag", "未售");}
				else{
					isSaling= (String) item.get("isSalingFlag");
		    	switch (Integer.parseInt(isSaling)) {
		    	case 0:
		   		item.put("isSalingFlag", "未售");
		  		break;
		    	case 1:
		    		item.put("isSalingFlag", "在售");
		   		break;
		    
		    	default:
		   		break;
		    }}
				String isMainType=null;
				if(item.get("isMainFlag")==null){
					item.put("isMainFlag", "");}
				else{
					isMainType= (String) item.get("isMainFlag");
		    	switch (Integer.parseInt(isMainType)) {
		    	case 0:
		   		item.put("isMainFlag", "非主力户型");
		  		break;
		    	case 1:
		    		item.put("isMainFlag", "主力户型");
		   		break;
		    
		    	default:
		   		break;
		    }}
		    }
		    pageBean.setList(list);
	        return pageBean;	
	}

@Override
    public Boolean addHouseType(TbHouseType houseType) throws Exception {
          // TODO Auto-generated method stub
          return houseTypeDao.addHouseType(houseType);
    }

@Override
public Boolean deleteHouseType(Long houseTypeId) throws Exception {
	// TODO Auto-generated method stub
	return houseTypeDao.deleteHouseType(houseTypeId);
}

@Override
public TbHouseType getHouseTypeToUpdate(Long houseTypeId) {
	// TODO Auto-generated method stub
	return houseTypeDao.getHouseTypeToUpdate(houseTypeId);
}

@Override
public Boolean updateHouseType(TbHouseType houseType) {
	// TODO Auto-generated method stub
	return houseTypeDao.updateHouseType(houseType);
}





}