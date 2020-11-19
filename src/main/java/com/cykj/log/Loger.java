package com.cykj.log;


import java.lang.annotation.*;

@Target({ElementType.PARAMETER,ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented

public @interface Loger {


    public String operationType() default "";
    public String operationName() default "";
}
