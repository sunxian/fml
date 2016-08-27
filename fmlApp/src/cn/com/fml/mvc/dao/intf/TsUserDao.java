package cn.com.fml.mvc.dao.intf;

import java.util.List;
import java.util.Map;

import cn.com.fml.mvc.dmo.TsUser;

public interface TsUserDao {

	public TsUser getUserByPhone(String phoneNo);
	public TsUser selectAdminByName(String name);
//List<Map<String, Object>> getadminList(Map<String, Object> param);
	List<TsUser> getadminList(Map<String, Object> param);
	Long getadminListCount(Map<String, Object> param);
	
	//获取经济人
	List<Map<String,Object>> getAgentList(Map<String, Object> param);
	Long getAgentListCount(Map<String, Object> param);
	//获取关键人
	List<Map<String,Object>> getKeyList(Map<String, Object> param);
	Long getKeyListCount(Map<String, Object> param);
	//添加管理员
	public Boolean addAdmin(String adminname,String password);
	public Boolean deleteAdmin(String adminname);
}
 