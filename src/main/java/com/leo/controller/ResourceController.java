package com.leo.controller;

import com.leo.bean.AjaxResult;
import com.leo.bean.SysResourceTreeNode;
import com.leo.common.security.SpringSecurityUtils;
import com.leo.entity.SysResource;
import com.leo.service.BaseService;
import com.leo.service.impl.ResourceService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by LT on 2016/11/05 13:20
 */
@Controller
@RequestMapping("resource")
public class ResourceController extends BaseController {
    private ResourceService resourceService;

    @RequestMapping("page")
    public String page() {
        return "system/resource";
    }

    @RequestMapping("list")
    @ResponseBody
    public List<SysResourceTreeNode> list() {
        return resourceService.getResourceTree();
    }

    @RequestMapping({"add","edit"})
    @ResponseBody
    public AjaxResult save(@RequestParam Map<String,Object> formData) {
        return this.doSave(formData);
    }

    @RequestMapping("delete")
    @ResponseBody
    public AjaxResult delete(Integer id,Integer pid) {
        resourceService.delete(id, pid);
        return super.DELETE_SUCCESS;
    }

    @RequestMapping("userMenuList")
    @ResponseBody
    public List<SysResource> userMenuList() {
        return resourceService.getUserMenuList(SpringSecurityUtils.getCurrentUserId());
    }




    @Override
    protected BaseService getBaseService() {
        return resourceService;
    }

    @Resource
    public void setResourceService(ResourceService resourceService) {
        this.resourceService = resourceService;
    }
}
