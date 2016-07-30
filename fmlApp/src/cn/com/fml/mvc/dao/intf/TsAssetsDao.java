package cn.com.fml.mvc.dao.intf;

import java.util.List;

import cn.com.fml.mvc.dmo.TsAssets;

public interface TsAssetsDao {

	public int insertTsAssets(TsAssets tsAssets);
	
	List<TsAssets> queryAssetsByCode(String code);
	
	String queryHotBuildBigImage(Long buildId);
}
