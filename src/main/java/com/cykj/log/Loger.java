package com.cykj.log;

import java.lang.annotation.*;

@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.PARAMETER,ElementType.METHOD})
@Documented
public @interface Loger {

    public String operationType() default "";
    public String operationName() default "";

}
