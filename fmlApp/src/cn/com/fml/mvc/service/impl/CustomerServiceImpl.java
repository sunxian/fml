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
	public int queryTimesByMonth() throws Exception {	
		return tbCustomerDao.queryTimesByMonth();
	}
	
	@Override
	public int queryTimesByYear() throws Exception {
		
		return tbCustomerDao.queryTimesByYear();
	}
	
	@Override
	public int queryTimesByWeek()throws Exception {
		return tbCustomerDao.queryTimesByWeek();
	}

	@Override
	public List<Map<String, Object>> queryReports()throws Exception {
		// TODO Auto-generated method stub
		return tbCustomerDao.queryReports();
	}

	@Override
	public double queryminPrice(Long customerId) throws Exception {
		// TODO Auto-generated method stub
		return tbCustomerDao.queryminPrice(customerId);
	}

	@Override
	public double querymaxPrice(Long customerId) throws Exception {
		// TODO Auto-generated method stub
		return tbCustomerDao.querymaxPrice(customerId);
	}

	@Override
	public List<String> queryTypes(Long customerId) throws Exception {
		// TODO Auto-generated method stub
		return tbCustomerDao.queryTypes(customerId);
	}

	@Override
	public List<String> queryAreas(Long customerId) throws Exception {
		// TODO Auto-generated method stub
		return tbCustomerDao.queryAreas(customerId);
	}

	@Override
	public List<String> queryHouseTypes(Long customerId) throws Exception {
		// TODO Auto-generated method stub
		return tbCustomerDao.queryHouseTypes(customerId);
	}

	@Override
	public List<Map<String, Object>> queryCustomerDetail(Long customerId)
			throws Exception {
		// TODO Auto-generated method stub
		return tbCustomerDao.queryCustomerDetail(customerId);
	}

	@Override
	public List<Map<String, Object>> queryReportList(Long customerId)
			throws Exception {
		// TODO Auto-generated method stub
		return tbCustomerDao.queryReportList(customerId);
	}

	
}
