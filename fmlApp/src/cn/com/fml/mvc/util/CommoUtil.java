package cn.com.fml.mvc.util;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;

public class CommoUtil {

	public static Object mapToObject(Map<String, Object> map, Class<?> beanClass) throws Exception {    
        if (map == null)  
            return null;  
        Object obj = beanClass.newInstance();
        BeanUtils.populate(obj, map);
        return obj;  
    }  
    
    public static Map<String, Object> transBean2Map(Object obj) {  
    	  
        if(obj == null){
            return null;  
        }          
        Map<String, Object> map = new HashMap<String, Object>();  
        try {  
            BeanInfo beanInfo = Introspector.getBeanInfo(obj.getClass());  
            PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();  
            for (PropertyDescriptor property : propertyDescriptors) {  
                String key = property.getName();  
  
                // 过滤class属性  
                if (!key.equals("class")) {  
                    // 得到property对应的getter方法  
                    Method getter = property.getReadMethod();  
                    Object value = getter.invoke(obj);  
  
                    map.put(key, value);  
                }  
  
            }  
        } catch (Exception e) {
            System.out.println("transBean2Map Error " + e);
        }  
  
        return map;  
  
    }  
    
    public static boolean checkIsNotNull(Object... obj) {
    	boolean result = true;
    	for (Object o : obj ) {
    		if (o == null || String.valueOf(o).length() == 0) {
    			result = false;
    			break;
    		}
    	}
    	return result;
    }
	
}
