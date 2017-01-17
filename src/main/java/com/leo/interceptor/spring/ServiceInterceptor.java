package com.leo.interceptor.spring;

import org.apache.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;

/**
 * Created by LT on 2016/9/18 0018 11:54
 */
public class ServiceInterceptor extends BaseInterceptor{
    private static Logger logger = Logger.getLogger(ServiceInterceptor.class);
    @Override
    protected Object doIntercept(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
        return proceedingJoinPoint.proceed();
    }
}
