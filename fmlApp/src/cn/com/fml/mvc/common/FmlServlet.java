/*
 * Copyright (C), 2002-2016, 
 * FileName: FmlServlet.java
 * Author:   15050513
 * Date:     2016-8-11 下午04:25:33
 * Description: //模块目的、功能描述      
 * History: //修改记录
 * <author>      <time>      <version>    <desc>
 * 修改人姓名             修改时间            版本号                  描述
 */
package cn.com.fml.mvc.common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

/**
 * 〈一句话功能简述〉<br> 
 * 〈功能详细描述〉
 *
 * @author 15050513
 * @see [相关类/方法]（可选）
 * @since [产品/模块版本] （可选）
 */
public class FmlServlet extends HttpServlet {

    /**
     */
    private static final long serialVersionUID = 1L;
    
    Logger logger = Logger.getLogger(FmlServlet.class );

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
    
    @Override
    public void init() throws ServletException {
        super.init();
    }
}
