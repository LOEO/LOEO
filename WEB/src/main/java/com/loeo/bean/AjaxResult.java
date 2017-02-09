package com.loeo.bean;

import com.loeo.enums.AjaxState;

import java.io.Serializable;

/**
 * Created by LT on 2016/9/18 23:00
 */
public class AjaxResult implements Serializable{
    private String msg;
    private String state;
    private Object data;

    public AjaxResult(AjaxState state, String msg) {
        this.msg = msg;
        this.state = state.getState();
    }

    public AjaxResult(AjaxState state, String msg,Object data) {
        this(state,msg);
        this.data = data;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
