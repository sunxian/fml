package cn.com.fml.mvc.service.intf;

import java.util.Map;

import cn.com.fml.mvc.common.PageBean;
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
	 public Boolean adminLogin(String name,String password)throws Exception;;
	 PageBean getAdminList(int pageNo, int pageSize, Map<String, Object> param) throws Exception;
	 
	 PageBean getAgentList(int pageNo, int pageSize, Map<String, Object> param) throws Exception;
	 
	 PageBean getKeyList(int pageNo, int pageSize, Map<String, Object> param) throws Exception;
	 //添加管理员
	 public Boolean addAdmin(String adminname,String password)throws Exception;
	 public Boolean deleteAdmin(String adminname)throws Exception;
}
