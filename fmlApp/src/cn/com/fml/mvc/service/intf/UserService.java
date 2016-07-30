package cn.com.fml.mvc.service.intf;

import cn.com.fml.mvc.dmo.TsRole;
import cn.com.fml.mvc.dmo.TsUser;


public interface UserService {

	/**
	 * 取得用户信息
	 * 
	 * @author JLC
	 * @return User对象
	 * @throws Exception
	 */
	public TsRole getRole(TsRole tsRole) throws Exception;
	
	public TsUser getUserByPhone(String phoneNo) throws Exception;

}
