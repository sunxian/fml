package cn.com.fml.mvc.dao.intf;

import cn.com.fml.mvc.dmo.TsUser;

public interface TsUserDao {

	public TsUser getUserByPhone(String phoneNo);
	
}
