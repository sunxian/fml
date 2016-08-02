package cn.com.fml.mvc.service.impl;

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

}
