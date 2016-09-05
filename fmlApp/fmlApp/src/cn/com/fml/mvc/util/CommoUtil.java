package cn.com.fml.mvc.util;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;

import com.spatial4j.core.context.SpatialContext;
import com.spatial4j.core.shape.Point;
import com.spatial4j.core.shape.Rectangle;

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
	
    /**
     * 
     * 功能描述: <br>
     * 〈功能详细描述〉
     * 根据传入的经纬度以及距离获取在这一区间里的经纬度范围
     *
     * @param lng
     * @param lat
     * @param radius
     * @return
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    public static Rectangle getRectangle(BigDecimal lng, BigDecimal lat, BigDecimal radius) {
        SpatialContext geo = SpatialContext.GEO;
        //DistanceUtils.KM_TO_DEG
        double KM_TO_DEG = 0.008993203677616635;
        Rectangle rectangle = geo.getDistCalc().calcBoxByDistFromPt(
                geo.makePoint(lng.doubleValue(), lat.doubleValue()), radius.doubleValue() * KM_TO_DEG, geo, null);
        return rectangle;
    }
    
    /**
     * 
     * 功能描述: <br>
     * 〈功能详细描述〉
     *
     * @param lon1移动设备经度
     * @param lat1移动设备纬度
     * @param lon2商户经度
     * @param lat2商户纬度
     * @return
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    public static double getDistanceByLngLat(double lon1, double lat1, double lon2, double lat2) {
        double DEG_TO_KM = 111.19507973436875;
        SpatialContext geo = SpatialContext.GEO;
        Point point1 = geo.makePoint(lon1, lat1);
        Point point2 = geo.makePoint(lon2, lat2);
        double distance = geo.getDistCalc().distance(point1, point2) * DEG_TO_KM;
        //升级jdk到1.7后使用下面的方法获取距离
        /*double distance = geo.calcDistance(geo.makePoint(lon1, lat1), geo.makePoint(lon2, lat2)) 
            * DEG_TO_KM;*/
        return distance;
    }
    
    public static void main(String[] args) {
        double lon1 = 116.312528, lat1 = 39.983733;
        double lon2 = 116.312328, lat2 = 39.983743;
        CommoUtil.getDistanceByLngLat(lon1, lat1, lon2, lat2);
        //0.01707637271515995
    }
}
