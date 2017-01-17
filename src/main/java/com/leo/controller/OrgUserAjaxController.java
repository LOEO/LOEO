package com.leo.controller;

import com.leo.service.BaseService;
import com.leo.service.impl.OrgService;
import com.leo.service.impl.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by LT on 2014/12/21.
 */
@Controller
@RequestMapping("/orgUserAjax")
public class OrgUserAjaxController extends BaseController{
    private OrgService orgService;
    private UserService userService;

    @RequestMapping("user_list")
    @ResponseBody
    public Map<String,Object> userListData(int start,int limit,int orgId){
        return userService.findUserByOrgId(start, limit, orgId);
    }

    @RequestMapping("user_add")
    @ResponseBody
    public Map<String,Object> userAdd(@RequestParam Map<String,Object> formData){
       /* Map<String,Object> resultMap = new HashMap<String, Object>();
        String result = userService.saveUser(formData);
        if(!result.equals(SUCCESS)){
            resultMap.put(SUCCESS,false);
            resultMap.put("msg",result);
        }else{
            resultMap.put(SUCCESS,true);
        }
        return resultMap;*/
        return null;
    }


    @RequestMapping("user_delete")
    @ResponseBody
    public Map<String,Object> userDelete(@RequestParam("id") int id){
        Map<String,Object> resultMap = new HashMap<String, Object>();

        return resultMap;
    }


    @Override
    protected BaseService getBaseService() {
        return null;
    }
}
