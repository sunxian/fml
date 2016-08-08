package cn.com.fml.mvc.common;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;

public class FmlFilter implements Filter {

    /** 斜杠 */
    private static final String STR_SLASH = "/";
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@SuppressWarnings("unchecked")
	@Override
public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
			FilterChain filterChain) throws IOException, ServletException {
       HttpServletRequest request = (HttpServletRequest) servletRequest;
       HttpServletResponse response = (HttpServletResponse) servletResponse;
 //    HttpSession session = request.getSession(true);
    //  String currentURI = request.getRequestURI();
//        String targerURI = currentURI.substring(currentURI.indexOf(STR_SLASH, 1));
//        
//        if (!"/app/login".equals(targerURI)) {
//        	String token = request.getParameter("token");
//        	if (StringUtils.isBlank(token)) {
//        		token = (String) request.getAttribute("token");
//        	}
//        	if (StringUtils.isBlank(token)) {
//                response.setContentType("text/json");
//                response.setDateHeader("Expires", 0);
//                PrintWriter out = response.getWriter();
//                out.println("{\"errorCode\": \"01\"}");
//                out.flush();
//                out.close();
//                return;
//        	} else {
//        		ConcurrentHashMap<String, Object> tokens = (ConcurrentHashMap<String, Object>)session.getAttribute("token");
//        		if (tokens == null || tokens.get(token) == null) {
//                    response.setContentType("text/json");
//                    response.setDateHeader("Expires", 0);
//                    PrintWriter out = response.getWriter();
//                    out.println("{\"errorCode\": \"01\"}");
//                    out.flush();
//                    out.close();
//                    return;
//        		}
//        	}
//        }
        filterChain.doFilter(request, response);
       
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
