package com.leo.interceptor.spring;

import com.leo.bean.AjaxResult;
import com.leo.common.consts.Message;
import com.leo.enums.AjaxState;
import org.apache.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;

/**
 * Created by LT on 2016/9/18 0018 12:40
 */
public class ControllerInterceptor{
    private Logger logger = Logger.getLogger(this.getClass());
    protected Object intercept(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
        try {
            return proceedingJoinPoint.proceed();
        } catch (Throwable t) {
            logger.error(t);
            if (t instanceof RuntimeException && t.getCause()!=null) {
                if (t.getCause() instanceof org.springframework.dao.DuplicateKeyException) {
                    return new AjaxResult(AjaxState.FAILED, Message.DUPLICATE_KEY);
                }
            }
            return new AjaxResult(AjaxState.FAILED,t.getMessage());
        }
    }
}
