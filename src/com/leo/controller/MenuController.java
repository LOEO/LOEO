package com.leo.controller;

import com.leo.bean.AjaxResult;
import com.leo.common.security.SpringSecurityUtils;
import com.leo.entity.SysMenu;
import com.leo.service.BaseService;
import com.leo.service.impl.MenuService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by LT on 2014/12/21.
 */
@Controller
@RequestMapping("/menu")
public class MenuController extends BaseController{
    private MenuService menuService;

    @RequestMapping("page")
    public String page() {
        return "system/menu/menu";
    }

    @RequestMapping("save")
    @ResponseBody
    public AjaxResult save(@RequestParam Map<String,Object> formData){
        return this.doSave(formData);
    }
    @RequestMapping("list")
    @ResponseBody
    public List<SysMenu> list(@RequestParam(required = false) Integer pid){
        return menuService.list(pid);
    }

    @RequestMapping("userMenuList")
    @ResponseBody
    public List<SysMenu> userMenuList() {
        return menuService.getUserMenuList(SpringSecurityUtils.getCurrentUserId());
    }

    @RequestMapping("delete")
    @ResponseBody
    public AjaxResult delete(Integer id,Integer pid){
        menuService.deleteMenu(id,pid);
        return super.DELETE_SUCCESS;
    }



    @Resource
    public void setMenuService(MenuService menuService) {
        this.menuService = menuService;
    }

    @Override
    protected BaseService getBaseService() {
        return this.menuService;
    }
}
