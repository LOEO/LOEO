package com.loeo.controller;

import com.fasterxml.jackson.annotation.JsonView;
import com.loeo.bean.AjaxResult;
import com.loeo.bean.Page;
import com.loeo.entity.SysRole;
import com.loeo.service.BaseService;
import com.loeo.service.impl.RoleService;
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
@RequestMapping("role")
public class RoleController extends BaseController {
    private RoleService roleService;

    @RequestMapping("page")
    public String page() {
        return "system/role";
    }

    @RequestMapping("list")
    @ResponseBody
    @JsonView(SysRole.WithoutSysUsers.class)
    public Page list(@RequestParam Map<String, Object> params) {
        return super.doListByPage(params);
    }

    @RequestMapping({"add","edit"})
    @ResponseBody
    public AjaxResult save(@RequestParam Map<String, Object> formData) {
        return super.doSave(formData);
    }

    @RequestMapping("delete")
    @ResponseBody
    public AjaxResult delete(int id) {
        return super.doDeleteById(id);
    }

    @RequestMapping("getUserHasRoles")
    @ResponseBody
    public List<SysRole> getUserHasRoles(int userId) {
        return roleService.getUserHasRoles(userId);
    }

    @RequestMapping("getUserNotHasRoles")
    @ResponseBody
    public List<SysRole> getUserNotHasRoles(int userId) {
        return roleService.getUserNotHasRoles(userId);
    }

    @Resource
    public void setRoleService(RoleService roleService) {
        this.roleService = roleService;
    }

    @Override
    protected BaseService getBaseService() {
        return this.roleService;
    }
}
