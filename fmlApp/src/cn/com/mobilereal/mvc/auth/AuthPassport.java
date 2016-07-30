package cn.com.mobilereal.mvc.auth;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * <p>Description: 添加自定义注解AuthPassport</p>
 * <p>Author: xie</p>
 * <p>Date: 2015年4月10日</p>
 */
@Documented
@Inherited
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface AuthPassport {
	boolean validate() default true;
}
