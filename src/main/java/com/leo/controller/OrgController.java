package com.leo.controller;

import com.leo.service.BaseService;
import com.leo.service.impl.OrgService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by LT on 2014/12/21.
 */
@Controller
@RequestMapping("/org")
public class OrgController extends BaseController{
    private OrgService orgService;

    @RequestMapping("page")
    public String page() {
        return "system/org";
    }
    @RequestMapping("save")
    @ResponseBody
    public Map<String,Object> save(@RequestParam Map<String,String> map){
        Map<String,Object> resultMap = new HashMap<String, Object>();

        return resultMap;
    }

    @RequestMapping("list")
    @ResponseBody
    public Map<String,Object> list(@RequestParam("node") int pid){
        Map<String,Object> result = new HashMap<String,Object>();

        return result;
    }

    @RequestMapping("org_edit")
    @ResponseBody
    public Map<String,Object> edit(int id,String name,String descp) {
        Map<String, Object> result = new HashMap<String, Object>();

        return result;
    }

    @RequestMapping("delete")
    @ResponseBody
    public Map<String,Object> delete(int id,int pid){
        Map<String,Object> result = new HashMap<String,Object>();

        return result;
    }

    @Resource
    public void setOrgService(OrgService orgService) {
        this.orgService = orgService;
    }

    @Override
    protected BaseService getBaseService() {
        return null;
    }
}
