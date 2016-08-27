package cn.com.fml.mvc.common;

import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

public class FmlFilter implements Filter {

    /** 斜杠 */
    private static final String STR_SLASH = "/";
	
    /**
     */
    private static final long serialVersionUID = 1L;
    
    Logger logger = Logger.getLogger(FmlFilter.class );
    
	@Override
	public void destroy() {
		
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
			FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession(true);
        String currentURI = request.getRequestURI();
        String targerURI = currentURI.substring(currentURI.indexOf(STR_SLASH, 1));
        
        /*if (!"/app/login".equals(targerURI)) {
        	String token = request.getParameter("token");
        	if (StringUtils.isBlank(token)) {
        		token = (String) request.getAttribute("token");
        	}
        	if (StringUtils.isBlank(token)) {
                response.setContentType("text/json");
                response.setDateHeader("Expires", 0);
                PrintWriter out = response.getWriter();
                out.println("{\"errorCode\": \"01\"}");
                out.flush();
                out.close();
                return;
        	} else {
        		ConcurrentHashMap<String, Object> tokens = (ConcurrentHashMap<String, Object>)session.getAttribute("token");
        		if (tokens == null || tokens.get(token) == null) {
                    response.setContentType("text/json");
                    response.setDateHeader("Expires", 0);
                    PrintWriter out = response.getWriter();
                    out.println("{\"errorCode\": \"01\"}");
                    out.flush();
                    out.close();
                    return;
        		}
        	}
        }*/
        filterChain.doFilter(request, response);
	}

	@SuppressWarnings("rawtypes")
    @Override
	public void init(FilterConfig config) throws ServletException {
	    ServletContext context = config.getServletContext();
        logger.info("读取application.properties到context");
        String path = "WEB-INF\\classes\\application.properties";
        InputStream in = context.getResourceAsStream(path);
        Properties p = new Properties();
        try {
            p.load(in);
            Iterator<?> it = p.entrySet().iterator();
            while (it.hasNext()) {
                Map.Entry entry = (Map.Entry) it.next();
                Object key = entry.getKey();
                Object value = entry.getValue();
                context.setAttribute(key.toString(), value);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                in.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
	}

}
