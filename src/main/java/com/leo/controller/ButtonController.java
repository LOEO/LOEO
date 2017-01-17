package com.leo.controller;

import com.leo.bean.AjaxResult;
import com.leo.entity.SysButton;
import com.leo.service.BaseService;
import com.leo.service.impl.ButtonService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by LT on 2015/12/10 0010.
 */
@Controller
@RequestMapping("button")
public class ButtonController extends BaseController {
    private ButtonService buttonService;

    @RequestMapping("page")
    public String page() {
        return "system/button/button";
    }

    @RequestMapping("list")
    @ResponseBody
    public List<SysButton> list(Integer menuId) {
        return buttonService.list(menuId);
    }

    @RequestMapping("save")
    @ResponseBody
    public AjaxResult save(@RequestParam Map<String, Object> formData) {
        return this.doSave(formData);
    }

    @RequestMapping("delete")
    @ResponseBody
    public AjaxResult delete(Integer id) {
        return this.doDeleteById(id);
    }

    @Resource
    public void setButtonService(ButtonService buttonService) {
        this.buttonService = buttonService;
    }

    @Override
    protected BaseService getBaseService() {
        return this.buttonService;
    }
}
