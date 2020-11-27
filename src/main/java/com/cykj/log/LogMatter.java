package com.cykj.log;

import com.cykj.entity.BackLog;
import com.cykj.entity.BackUser;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;

@Aspect
@Component
public class LogMatter {

    @Resource
    LogService logService;//获取日志service对象

    @Pointcut("execution(* com.cykj.controller.*.*(..))")//修改
    public void logpoint() {

    }

    @AfterReturning("logpoint()")
    public void after(JoinPoint joinPoint) throws ClassNotFoundException {
        String name = joinPoint.getTarget().getClass().getName();//获取到类名
        System.out.println("classname=======" +name);
        Object[] args = joinPoint.getArgs();//获取到参数的集合
        for (int i = 0;i<args.length;i++){
            System.out.println(args[i]);
        }
        String methodName = joinPoint.getSignature().getName();//获取到执行的方法名
        System.out.println("methodName=======" + methodName);
        Class aClass = Class.forName(name);//获得类对象

        System.out.println(aClass.getName());

        Method[] methods = aClass.getMethods();//获取方法集合
        String operaName = "";
        for (Method method : methods) {//遍历方法

            if (method.getName().equals(methodName)) {//找到相同的方法名
                System.out.println(method.getName() + "--------------");
                Class[] clazzs = method.getParameterTypes();//取得方法中的参数集合
                if (clazzs.length == args.length) {//如果参数数量一样说明是通过方法
                    System.out.println(method.getAnnotation(Loger.class));
                        operaName = method.getAnnotation(Loger.class).operationName();//获取到注解中的参数
                    break;
                }
            }
        }
        //获取到request对象
        RequestAttributes ra = RequestContextHolder.getRequestAttributes();
        ServletRequestAttributes sra = (ServletRequestAttributes) ra;
        HttpServletRequest request = sra.getRequest();
        //获取session中的对象
        BackUser backUser=new BackUser();
//        BackUser backUser = (BackUser) request.getSession().getAttribute("admin");
        backUser.setbUserId(3);
        BackLog backLog = new BackLog();
        if (backUser == null) {//如果不存在对象，则是管理员在操作
            backLog.setbUserId(15);
        } else {
            backLog.setbUserId(backUser.getbUserId());
        }
        backLog.setMatter(operaName);
        logService.addLog(backLog);//数据库添加一个日志
    }

//    @Before("logpoint()")
//    public void before() {
//        System.out.println("前置通知");
//    }


}
