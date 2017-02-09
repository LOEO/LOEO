package com.loeo.controller;

import com.alibaba.fastjson.JSON;
import com.loeo.bean.AjaxResult;
import com.loeo.bean.MenuAndButton;
import com.loeo.bean.SysResourceTreeNode;
import com.loeo.common.security.SpringSecurityUtils;
import com.loeo.entity.SysResource;
import com.loeo.service.BaseService;
import com.loeo.service.impl.PrivilegeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by LT on 2016/09/28 22:02
 */
@Controller
@RequestMapping("privilege")
public class PrivilegeController extends BaseController {
    private PrivilegeService privilegeService;

    @RequestMapping("page")
    public String page() {
        return "system/privilege";
    }

    @RequestMapping("save")
    @ResponseBody
    public AjaxResult save(String nodes,String master,String masterValue) {
        List<MenuAndButton> menuAndButtons = JSON.parseArray(nodes,MenuAndButton.class);
        privilegeService.save(menuAndButtons,master,masterValue);
        return super.SAVE_SUCCESS;
    }

    @RequestMapping("menuAndButtonList")
    @ResponseBody
    public List<MenuAndButton> menuAndButtonList(String master,String masterValue) {
        return privilegeService.getMenuAndButtonList(master,masterValue);
    }

    @RequestMapping("getResource")
    @ResponseBody
    public List<SysResourceTreeNode> getResource(String master, String masterValue) {
        return privilegeService.getResource(master,masterValue);
    }

    @RequestMapping("getUserResource")
    @ResponseBody
    public List<SysResource> getUserResource() {
        return privilegeService.getUserResource(SpringSecurityUtils.getCurrentUserId());
    }

    @RequestMapping("getButtons")
    @ResponseBody
    public List<SysResource> getButtons() {
        SpringSecurityUtils.getCurrentUserId();

        return null;
    }

    @Override
    protected BaseService getBaseService() {
        return this.privilegeService;
    }

    @Resource
    public void setPrivilegeService(PrivilegeService privilegeService) {
        this.privilegeService = privilegeService;
    }
}
