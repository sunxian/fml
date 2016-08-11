package cn.com.fml.mvc.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fml.mvc.dao.intf.TbCommissionDao;
import cn.com.fml.mvc.service.intf.TbCommissonService;
@Service ("commissonService")
public class TbCommissonServiceImpl implements TbCommissonService {

	@Autowired
	private TbCommissionDao tbCommissionDao;

	@Override
	public List<Map<String, Object>> getCommissionById(Long id) {

		return tbCommissionDao.getCommissionById(id);
	}

	@Override
	public Map<String, Object> getMyCommission(String status) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		Double Already = 0.0;
		Double notsettled = 0.0;
		Double total = 0.0;
		if ("0".equals(status)) {
			Already = tbCommissionDao.getAmount(status);
		} else if ("1".equals(status)) {
			notsettled = tbCommissionDao.getAmount(status);
		} else {
			total = tbCommissionDao.getAmount(null);
		}
		List<Map<String, Object>> commissionList = tbCommissionDao
				.queryCommissionList();
		map.put("totalAmount", total);
		map.put("alreadyAmount", Already);
		map.put("notSettledAmount", notsettled);
		map.put("commissionList", commissionList);
		return map;
	}

}
