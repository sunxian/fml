package cn.com.fml.mvc.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import cn.com.fml.mvc.common.PageBean;
import cn.com.fml.mvc.dmo.TsUser;
import cn.com.fml.mvc.util.CommoUtil;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;


public class BaseController {
    
    /**
     * 分页查询结果
     */
    protected PageBean pageBean;
    /**
     * 分页的页号
     */
    protected int pageNo = 1;
    /**
     * 每页的记录数
     */
    protected int pageSize = 10;
    
    /**
     * 列表页面做编辑与删除用
     */
    protected Long[] chk;
    
	
	protected JSONObject getJSONObjectFormBody(HttpServletRequest request, HttpServletResponse response) throws IOException {
	    JSONObject parse = new JSONObject();
		request.setCharacterEncoding("UTF-8");
		BufferedReader br= new BufferedReader(new InputStreamReader(request.getInputStream(), "UTF-8"));
		String line="";
		String res="";
		while(null != (line=br.readLine())){
			res += line;
		}
		if (CommoUtil.checkIsNotNull(res)) {
		    parse = (JSONObject)JSONObject.parse(res);
		}
		return parse;
	}
	
	protected JSONArray getJSONArrayFormBody(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
        request.setCharacterEncoding("UTF-8");
        BufferedReader br= new BufferedReader(new InputStreamReader(request.getInputStream(), "UTF-8"));
        String line="";
        String res="";
        while(null != (line=br.readLine())){
            res += line;
        }
        JSONArray array = null;
        if (res.startsWith("[") && res.endsWith("]")) {
        	array = JSONArray.parseArray(res);
        } else {
        	res = "[" + res + "]";
        	array = JSONArray.parseArray(res);
        }
        /*for(int i = 0; i < array.size(); i++) {
            JSONObject user = array.getJSONObject(i);
        }*/
        return array;
        
    }
	
	@SuppressWarnings("unchecked")
    protected TsUser getLoginUser(HttpServletRequest request) {
	    TsUser user = null;
	    String token = request.getParameter("token");
	    if (StringUtils.isBlank(token)) {
	        token = (String) request.getAttribute("token");
	    }
	    if (StringUtils.isNotBlank(token)) {
    	    HttpSession session = request.getSession(true);
    	    ConcurrentHashMap<String, Object> tokens = (ConcurrentHashMap<String, Object>)session.getAttribute("token");
    	    if (tokens != null && tokens.get(token) != null) {
    	        user = (TsUser) tokens.get(token);
    	    }
	    }
	    return user;
	}
	
	protected String getValueFromProperties(String key) {
	    WebApplicationContext webApplicationContext = ContextLoader.getCurrentWebApplicationContext();  
        ServletContext servletContext = webApplicationContext.getServletContext();
        Object obj = servletContext.getAttribute(key);
        if (obj != null) {
            return obj.toString();
        } else {
            return "";
        }
	}

    public PageBean getPageBean() {
        return pageBean;
    }

    public void setPageBean(PageBean pageBean) {
        this.pageBean = pageBean;
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public Long[] getChk() {
        return chk;
    }

    public void setChk(Long[] chk) {
        this.chk = chk;
    }
	
	
}
