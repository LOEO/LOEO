package com.loeo.service;

/**
 * Created by LT on 2017/02/06 23:28
 */
public class TestServiceImpl implements TestService {
    public String test(String input) {
        return "msg:"+input;
    }
}
