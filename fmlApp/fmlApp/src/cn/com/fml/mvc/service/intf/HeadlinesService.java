package cn.com.fml.mvc.service.intf;

import java.util.List;
import java.util.Map;

import cn.com.fml.mvc.dmo.TbHeadlines;

public interface HeadlinesService {
	
	public List<TbHeadlines> getHeadlines() throws Exception;
	
	Map<String, Object> getTopOneHeadLines() throws Exception;
	
}
