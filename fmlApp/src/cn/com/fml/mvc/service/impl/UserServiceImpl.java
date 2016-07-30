package cn.com.fml.mvc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		// TODO Auto-generated method stub
		
	}

	

}
