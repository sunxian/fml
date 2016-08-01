package cn.com.fml.mvc.service.impl;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.com.fml.mvc.dao.intf.DevelopersNewsDao;
import cn.com.fml.mvc.service.intf.DevelopersNewsService;
@Service("developersNewsService")
public class DevelopersNewsServiceImpl implements DevelopersNewsService{
	@Autowired
	private DevelopersNewsDao developersNewsDao;
	@Override
	public List<Map<String, Object>> getDevelopersNews(Long buildingId) throws Exception {
		// TODO Auto-generated method stub
		List<Map<String,Object>> newsList = developersNewsDao.queryNewsList(buildingId);
		return newsList;
	}

}
