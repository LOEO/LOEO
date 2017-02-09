package com.loeo.interceptor.spring;

import com.loeo.common.security.SpringSecurityUtils;
import com.loeo.exception.BaseException;
import org.apache.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;

import java.util.Arrays;

/**
 * Created by LT on 2016/9/18 0018 12:43
 */
public abstract class BaseInterceptor {
    private Logger logger = Logger.getLogger(this.getClass());
    public Object intercept(ProceedingJoinPoint proceedingJoinPoint) {
        String username = null;
        String methodName = null;
        String args = null;
        try {
            methodName = proceedingJoinPoint.getSignature().toString();
            args = Arrays.asList(proceedingJoinPoint.getArgs()).toString();
            username = SpringSecurityUtils.getCurrentUsername();
            long start = System.currentTimeMillis();
            logger.info(String.format("用户(%s)开始调用：<%s>,参数为：%s",username,methodName, args));
            Object result =  doIntercept(proceedingJoinPoint);
            logger.info(String.format("用户(%s)结束调用：<%s>,参数为：%s,用时：%s毫秒",username,methodName, args,System.currentTimeMillis()-start));
            return result;
        } catch (Throwable throwable) {
            logger.error(String.format("用户(%s)异常调用<%s>,参数为：%s",username,methodName, args),throwable);
            if (throwable instanceof BaseException) {
                throw (BaseException) throwable;
            }
            throw new RuntimeException(throwable);
        }
    }

    protected abstract Object doIntercept(ProceedingJoinPoint proceedingJoinPoint) throws Throwable;
}
