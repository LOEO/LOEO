package com.loeo.enums;

/**
 * Created by LT on 2016/09/18 23:13
 */
public enum  AjaxState {
    SUCCESS("SUCCESS"),
    FAILED("FAILED");

    private AjaxState(String state) {
        this.state = state;
    }
    private String state;

    public String getState() {
        return this.state;
    }
}
