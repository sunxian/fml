package cn.com.fml.mvc.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fml.mvc.dao.intf.TbHeadlinesDao;
import cn.com.fml.mvc.dmo.TbHeadlines;
import cn.com.fml.mvc.service.intf.HeadlinesService;

@Service("headlinesService")
public class HeadlinesServiceImpl implements HeadlinesService {
	
	@Autowired
	private TbHeadlinesDao tbHeadlinesDao;
	
	@Override
	public List<TbHeadlines> getHeadlines() throws Exception{
		
		return tbHeadlinesDao.getTbHeadlines();
		
	}
	
	@Override
	public Map<String, Object> getTopOneHeadLines() throws Exception {
		TbHeadlines headLines = tbHeadlinesDao.getTopOneHeadLines();
		Map<String, Object> map = new HashMap<String, Object>();
		if (headLines != null) {
			map.put("id", headLines.getId());
			map.put("title", headLines.getTitle());
		}
		return map;
	}

}
