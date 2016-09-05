package cn.com.fml.mvc.service.intf;

import java.util.List;
import java.util.Map;


public interface AssetsService {

	List<Map<String, Object>> queryAssetsByCode(String code) throws Exception;

}
