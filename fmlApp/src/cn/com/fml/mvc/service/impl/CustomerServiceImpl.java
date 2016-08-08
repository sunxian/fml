package cn.com.fml.mvc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fml.mvc.dao.intf.TbCustomerDao;
import cn.com.fml.mvc.service.intf.CustomerService;
@Service("customerService")
public class CustomerServiceImpl implements CustomerService{
	@Autowired
private TbCustomerDao tbCustomerDao;
	
	@Override
	public int queryTimesByMonth() {	
		return tbCustomerDao.queryTimesByMonth();
	}
	
	@Override
	public int queryTimesByYear() {
		
		return tbCustomerDao.queryTimesByYear();
	}
	
	@Override
	public int queryTimesByWeek() {
		return tbCustomerDao.queryTimesByWeek();
	}

	@Override
	public List<Map<String, Object>> queryReports() {
		// TODO Auto-generated method stub
		return tbCustomerDao.queryReports();
	}

}
