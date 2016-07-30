/*
 * Copyright (C), 2002-2013, 苏宁易购电子商务有限公司
 * FileName: TokenHandler.java
 * Author:   13040440
 * Date:     2013-10-8 上午10:01:30
 * Description: //模块目的、功能描述      
 * History: //修改记录
 * <author>      <time>      <version>    <desc>
 * 修改人姓名             修改时间            版本号                  描述
 */
package cn.com.fml.mvc.common;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * 防重复提交处理类
 * 
 * @author 13040440
 */
public class TokenHandler {
    public static String tokenValue;
    
    static Map<String, String> tokenMap = new HashMap<String, String>();
    
    public static final String TOKEN = "token";

    private static final Logger LOGGER = LoggerFactory.getLogger(TokenHandler.class);

    // 根据请求，生成一个唯一值的token
    @SuppressWarnings("unchecked")
    public static synchronized  String generateGUID(HttpSession session) {
        String token = "";
        try {
            Object obj = session.getAttribute(TOKEN);
            if (obj != null) {
                tokenMap = (Map<String, String>) session.getAttribute(TOKEN);
            }
            token = UUID.randomUUID().toString().replace("-", "").toUpperCase();
            tokenMap.put("tokenName" + "." + token, token);

            session.setAttribute(TOKEN, tokenMap);

            tokenValue = token;

        } catch (IllegalStateException e) {
            LOGGER.debug("generateGUID() mothod find bug,by token session...");
        }
        return token;

    }

    /**
     * 验证表单token值和session中的token值是否一致
     * @param request
     * @return true :重复提交 ；false： 非重复提交
     */
    @SuppressWarnings("unchecked")
    public static boolean validToken(HttpServletRequest request) {
        //没加放重复标签的，一律认为不重复，这里出现问题别找我
        LOGGER.debug("==校验表单是否重复提交==");
        String inputToken = getInputToken(request);
        if (inputToken == null) {
            LOGGER.debug("token is not valid!inputToken is NULL");
            return false;
        }

        HttpSession session = request.getSession();
        Map<String, String> tokenMap = (Map<String, String>) session.getAttribute(TOKEN);
        if (tokenMap == null || tokenMap.size() < 1) {
            LOGGER.debug("token is not valid!sessionToken is NULL");
            return true;
        }

        String sessionToken = tokenMap.get("tokenName." + "." + inputToken);
        if (!inputToken.equals(sessionToken)) {
            LOGGER.debug("token is not valid!inputToken='" + inputToken + "',sessionToken = '" + sessionToken + "'");
            return true;
        }

        tokenMap.remove("tokenName" + "." + inputToken);
        session.setAttribute(TOKEN, tokenMap);
        return false;
    }

    // 获取表单中token值
    public static String getInputToken(HttpServletRequest request) {
        if(null == request){
            LOGGER.debug("request is empty , Could not find token name in params.");
            return null;
        }else{
            Object obj = request.getParameter("tokenName");
            if(null == obj){
                LOGGER.debug("Could not find token name in params.");
                return null;
            }else{
                return String.valueOf(obj);
            }
        }
    }
}
