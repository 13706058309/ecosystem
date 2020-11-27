package com.cykj.interceptor;

import java.lang.annotation.*;

@Target({ElementType.PARAMETER,ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented

public @interface Loger {

    public String operationType() default "";//自定义注解
    public String operationName() default "";

}
