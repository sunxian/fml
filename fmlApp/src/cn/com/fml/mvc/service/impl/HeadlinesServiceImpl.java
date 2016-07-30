package cn.com.fml.mvc.service.impl;

import java.util.List;

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
		// TODO Auto-generated method stub
		return tbHeadlinesDao.getTbHeadlines();
	}

}
