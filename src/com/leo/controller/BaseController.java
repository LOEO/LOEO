package com.leo.controller;

import com.leo.bean.AjaxResult;
import com.leo.bean.Page;
import com.leo.common.consts.Message;
import com.leo.enums.AjaxState;
import com.leo.service.BaseService;

import java.util.Map;

/**
 * Created by LT on 2015/12/13 0013 21:53
 */
public abstract class BaseController {
    protected static final AjaxResult SAVE_SUCCESS = new AjaxResult(AjaxState.SUCCESS, Message.SAVE_SUCCESS);
    protected static final AjaxResult DELETE_SUCCESS = new AjaxResult(AjaxState.SUCCESS, Message.DELETE_SUCCESS);

    protected Page doListByPage(Map<String, Object> params) {
        return getBaseService().getByPage(params);
    }

    protected AjaxResult doSave(Map<String,Object> formData) {
        getBaseService().save(formData);
        return SAVE_SUCCESS;
    }

    protected AjaxResult doDeleteById(Integer id) {
        getBaseService().deleteById(id);
        return DELETE_SUCCESS;
    }
    protected abstract BaseService getBaseService();
}
