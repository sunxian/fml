package cn.com.fml.mvc.dao.intf;

import java.util.List;
import java.util.Map;

import cn.com.fml.mvc.dmo.TsAssets;

public interface TsAssetsDao {

	public int insertTsAssets(TsAssets tsAssets);
	
	List<TsAssets> queryAssetsByCode(String code);
	
	List<String> queryBuildImage(Map<String, Object> parm);
}
