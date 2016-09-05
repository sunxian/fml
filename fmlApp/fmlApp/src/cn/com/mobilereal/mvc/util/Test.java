package cn.com.mobilereal.mvc.util;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.TreeMap;

public class Test {

	/**
	 * @param args
	 * @throws ClassNotFoundException 
	 */
	public static void main(String[] args) throws ClassNotFoundException {
		
		TestBeanNew t = new TestBeanNew();
		t.setId(1l);
		t.setName("a2");
		t.setPhone("111");
		t.setAddress("b");
		
		TestBeanNew t2 = new TestBeanNew();
		t2.setId(1l);
		t2.setName("ab");
		t2.setPhone("111");
		t2.setAddress("b");
		
		List<TestBeanNew> list = new ArrayList<TestBeanNew>();
		list.add(t);
		list.add(t2);
		
		compare(list);
		for (TestBeanNew o : list) {
			System.out.println(o.getName());
		}
		
		/*Class<?> clazz = Class.forName(t.getClass().getName());
		Class<?> superclass = clazz.getSuperclass();
		
		Field[] fields = superclass.getDeclaredFields();
        for (Field fl : fields) {
            Object value = invokeGetMethod(t, fl.getName(), null);
            if (null == value) {
                System.out.println(fl.getName());
            } else {
            	System.out.println(fl.getName()+":"+value.toString());

            }
        }*/
	}

    private static Object invokeGetMethod(Object clazz, String fieldName, Object[] args) {
        String methodName = fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1);
        Method method = null;
        try {
            method = Class.forName(clazz.getClass().getName()).getDeclaredMethod("get" + methodName);
            return method.invoke(clazz);
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }
    
    private static void compare(List<TestBeanNew> list){
    	Collections.sort(list, new Comparator<TestBeanNew>() {
			@Override
			public int compare(TestBeanNew o1, TestBeanNew o2) {
				return o1.getName().compareTo(o2.getName());
			}
		});
    }
}
