package cn.com.fml.mvc.dao.intf;

import java.util.List;

import cn.com.fml.mvc.dmo.TbHeadlines;
/**
 * @author hasee
 * 获取最新头条
 *
 */
public interface TbHeadlinesDao {
    public List<TbHeadlines> getTbHeadlines();
    }