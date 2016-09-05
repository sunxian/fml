package cn.com.fml.mvc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fml.mvc.common.PageBean;
import cn.com.fml.mvc.dao.intf.TsRoleDao;
import cn.com.fml.mvc.dao.intf.TsUserDao;
import cn.com.fml.mvc.dmo.TsRole;
import cn.com.fml.mvc.dmo.TsUser;
import cn.com.fml.mvc.service.intf.UserService;


@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private TsRoleDao tsRoleDao;
	
	@Autowired
	private TsUserDao tsUserDao;

	public void setTsRoleDao(TsRoleDao tsRoleDao) {
		this.tsRoleDao = tsRoleDao;
	}

	public void setTsUserDao(TsUserDao tsUserDao) {
		this.tsUserDao = tsUserDao;
	}

	@Override
	public TsRole getRole(TsRole tsRole) throws Exception {
		return tsRoleDao.getTsRole(tsRole);
	}

	@Override
	public TsUser getUserByPhone(String phoneNo) throws Exception {
		return tsUserDao.getUserByPhone(phoneNo);
		
	}
	@Override
	public Boolean adminLogin(String name, String password) {
		
		TsUser admin=tsUserDao.selectAdminByName(name);
		if(admin!=null){
		if(name.equals(admin.getUserName())&&password.equals(admin.getPassword()))
		{
			return true;
		}
		}
		return false;
		
		}

	@Override
	public PageBean getAdminList(int pageNo, int pageSize,
			Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		    Long count = tsUserDao.getadminListCount(param);
		    PageBean pageBean = new PageBean(pageNo, count.intValue());
		    param.put("startIndex", pageBean.getStartIndex());
		    param.put("pageSize", pageSize);
		   // List<Map<String, Object>> list = tsUserDao.getadminList(param);	
		    List<TsUser> list = tsUserDao.getadminList(param);	
		    pageBean.setList(list);
	        return pageBean;
		
	}

	@Override
	public PageBean getAgentList(int pageNo, int pageSize,
			Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		 Long count = tsUserDao.getAgentListCount(param);
		    PageBean pageBean = new PageBean(pageNo, count.intValue());
		    param.put("startIndex", pageBean.getStartIndex());
		    param.put("pageSize", pageSize);
		    List<Map<String,Object>> list = tsUserDao.getAgentList(param);	
		    pageBean.setList(list);
	        return pageBean;
	}

	@Override
	public PageBean getKeyList(int pageNo, int pageSize,
			Map<String, Object> param) throws Exception {
		
		Long count = tsUserDao.getKeyListCount(param);
	    PageBean pageBean = new PageBean(pageNo, count.intValue());
	    param.put("startIndex", pageBean.getStartIndex());
	    param.put("pageSize", pageSize);
	    List<Map<String,Object>> list = tsUserDao.getKeyList(param);	
	    pageBean.setList(list);
        return pageBean;

}

	@Override
	public Boolean addAdmin(String adminname, String password) {
		// TODO Auto-generated method stub
		return tsUserDao.addAdmin(adminname, password);
		
	}

	@Override
	public Boolean deleteAdmin(String adminname) {
		// TODO Auto-generated method stub
		return tsUserDao.deleteAdmin(adminname);
	}
}