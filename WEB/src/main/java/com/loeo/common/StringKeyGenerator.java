package com.loeo.common;

import org.springframework.cache.interceptor.KeyGenerator;

import java.lang.reflect.Method;

/**
 * Created by LT on 2017/02/12 23:05
 */
public class StringKeyGenerator implements KeyGenerator {
    public Object generate(Object target, Method method, Object... params) {
        StringBuilder stringBuilder = new StringBuilder(target.getClass().getName());
        stringBuilder.append(".");
        stringBuilder.append(method.getName());
        stringBuilder.append("(");
        if (params != null) {
            for (int i=0;i<params.length;i++) {
                stringBuilder.append(params);
                if (i <= params.length - 1) {
                    stringBuilder.append(",");
                }
            }
        }
        stringBuilder.append(")");
        return stringBuilder.toString();
    }
}
