package com.loeo.controller;

import com.loeo.bean.AjaxResult;
import com.loeo.entity.SysOrg;
import com.loeo.service.BaseService;
import com.loeo.service.impl.OrgService;
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
@RequestMapping("/org")
public class OrgController extends BaseController {
    private OrgService orgService;

    @RequestMapping("page")
    public String page() {
        return "system/org";
    }

    @RequestMapping({"add", "edit"})
    @ResponseBody
    public AjaxResult save(@RequestParam Map<String, Object> params) {
        return super.doSave(params);
    }

    @RequestMapping("loadTree")
    @ResponseBody
    public List<SysOrg> list() {
        return orgService.getOrgList();
    }

    @RequestMapping("delete")
    @ResponseBody
    public AjaxResult delete(Integer id) {
        return super.doDeleteById(id);
    }

    @Resource
    public void setOrgService(OrgService orgService) {
        this.orgService = orgService;
    }

    @Override
    protected BaseService getBaseService() {
        return orgService;
    }
}
