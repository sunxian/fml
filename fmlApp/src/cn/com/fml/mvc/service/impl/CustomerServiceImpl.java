package cn.com.fml.mvc.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fml.mvc.common.PageBean;
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
//客户详情
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
	
//客户列表
	@Override
	public List<Map<String, Object>> queryCustomerList() throws Exception {
		// TODO Auto-generated method stub
		List<Map<String, Object>> customerList=tbCustomerDao.queryCustomerList();
//		if (!CollectionUtils.isEmpty(customerList)){
//		for(Map<String, Object> map:customerList){
//			//map.get("name");

//		}
//		}
		return customerList;
	}

@Override
public PageBean getAgentCustomersList(int pageNo, int pageSize,
		Map<String, Object> param) throws Exception {
	// TODO Auto-generated method stub
	Long count = tbCustomerDao.getAgentCustomersCount(param);
    PageBean pageBean = new PageBean(pageNo, count.intValue());
    param.put("startIndex", pageBean.getStartIndex());
    param.put("pageSize", pageSize);
    List<Map<String,Object>> list =tbCustomerDao.queryAgentCustomers(param);	
    //0：未报备，1：已报备（未带看），2：已带看（待成交），3：已成交（未结佣），4：已结佣，5：无效客户',
    for(Map<String,Object> item:list){
    	String status=null;
    
		if(item.get("status")==null){
			item.put("status", "未报备");}
		else{
			status= (String) item.get("status");
    	switch (Integer.parseInt(status)) {
    	case 0:
   		item.put("status", "未报备");
  		break;
    	case 1:
    		item.put("status", "已报备");
   		break;
    	case 2:
    		item.put("status", "已带看");
   		break;
    	case 3:
    		item.put("status", "已成交");
    	
   		break;
    	case 4:
    		item.put("status", "已结佣");
    		break;
    	case 5:
    		item.put("status", "无效客户");
    		break;
    	default:
   		break;
    }}
    }
    pageBean.setList(list);
    return pageBean;
	
}

@Override
public PageBean getKeyCustomersList(int pageNo, int pageSize,
		Map<String, Object> param) throws Exception {
	Long count = tbCustomerDao.getKeyCustomersCount(param);
    PageBean pageBean = new PageBean(pageNo, count.intValue());
    param.put("startIndex", pageBean.getStartIndex());
    param.put("pageSize", pageSize);
    List<Map<String,Object>> list =tbCustomerDao.queryKeyCustomers(param);	
    //0：未报备，1：已报备（未带看），2：已带看（待成交），3：已成交（未结佣），4：已结佣，5：无效客户',
    for(Map<String,Object> item:list){
    	String status=null;
    
		if(item.get("status")==null){
			item.put("status", "未报备");}
		else{
			status= (String) item.get("status");
    	switch (Integer.parseInt(status)) {
    	case 0:
   		item.put("status", "未报备");
  		break;
    	case 1:
    		item.put("status", "已报备");
   		break;
    	case 2:
    		item.put("status", "已带看");
   		break;
    	case 3:
    		item.put("status", "已成交");
    	
   		break;
    	case 4:
    		item.put("status", "已结佣");
    		break;
    	case 5:
    		item.put("status", "无效客户");
    		break;
    	default:
   		break;
    }}
    }
	 
 
    pageBean.setList(list);
    return pageBean;
}

	
}
