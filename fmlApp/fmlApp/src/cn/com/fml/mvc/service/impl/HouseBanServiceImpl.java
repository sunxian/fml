package cn.com.fml.mvc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fml.mvc.common.PageBean;
import cn.com.fml.mvc.dao.intf.HouseBanDao;
import cn.com.fml.mvc.dmo.TbHouseBan;
import cn.com.fml.mvc.service.intf.HouseBanService;

@Service("houseBanService")
public class HouseBanServiceImpl implements HouseBanService {
	@Autowired
	private HouseBanDao houseBanDao;

	@Override
	public List<Map<String, Object>> queryHouseBanInfoList(Long buildingId)
			throws Exception {

		return houseBanDao.queryHouseBanInfoList(buildingId);
	}

	@Override
	public List<String> queryOtherhouseType() throws Exception {
		return houseBanDao.queryOtherhouseType();
	}

	// 添加楼栋
	@Override
	public Boolean addHouseBan(List<TbHouseBan> houseBans) throws Exception {
		// TODO Auto-generated method stub
		return houseBanDao.addHouseBan(houseBans);
	}

	// 楼栋管理列表
	@Override
	public PageBean getHouseBanList(int pageNo, int pageSize,
			Map<String, Object> param) throws Exception {
		Long count = houseBanDao.getHouseBanManagerCount(param);
		PageBean pageBean = new PageBean(pageNo, count.intValue());
		param.put("startIndex", pageBean.getStartIndex());
		param.put("pageSize", pageSize);
		List<Map<String, Object>> list = houseBanDao.HouseBanManagerList(param);
		pageBean.setList(list);
		return pageBean;
	}

	// 获取需要修改的楼栋
	@Override
	public TbHouseBan getHouseBanToUpdate(Long id) throws Exception {
		// TODO Auto-generated method stub
		return houseBanDao.selectHouseBanToUpdate(id);
	}

	// 修改楼栋
	@Override
	public Boolean updateHouseBan(TbHouseBan houseBan) throws Exception {
		// TODO Auto-generated method stub
		return houseBanDao.updateHouseBan(houseBan);
	}

}
