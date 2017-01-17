package com.leo.controller;

import com.alibaba.fastjson.JSON;
import com.leo.bean.AjaxResult;
import com.leo.bean.Page;
import com.leo.entity.SysRole;
import com.leo.entity.SysUser;
import com.leo.service.BaseService;
import com.leo.service.impl.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by LT on 2014/12/21.
 */
@Controller
@RequestMapping("/user")
@SessionAttributes({"curUserName", "curUser"})
public class UserController extends BaseController {
    private UserService userService;

    @RequestMapping("page")
    public String userList(ModelMap modelMap) {
        return "system/user/user_list";
    }

    @RequestMapping("register")
    @ResponseBody
    public String userRegister(@RequestParam Map<String, String> map) {
        return userService.userRegister(map);
    }

    @RequestMapping(value = "list", produces = "application/json")
    @ResponseBody
    public Page userList(@RequestParam Map<String, Object> params) {
        return userService.getByPage(params);
    }

    @RequestMapping("save")
    @ResponseBody
    public AjaxResult save(@RequestParam Map<String, Object> formData) {
        return this.doSave(formData);
    }

    @RequestMapping("delete")
    @ResponseBody
    public AjaxResult userDelete(@RequestParam("id") int id) {
        return this.doDeleteById(id);
    }

    @RequestMapping("saveUserRole")
    @ResponseBody
    public AjaxResult saveUserRole(String roles,Integer userId) {
        List<SysRole> roleList = JSON.parseArray(roles, SysRole.class);
        userService.saveUserRole(roleList,userId);
        return super.SAVE_SUCCESS;
    }

    @RequestMapping("user_profile_uploadAvatar")
    @ResponseBody
    public String uploadAvatar(String avatar, HttpServletRequest req, ModelMap modelMap) {
        String username = modelMap.get("curUserName").toString();
        String filename = System.currentTimeMillis() + ".jpg";
        String path = req.getServletContext().getRealPath("/upload");
        SysUser sysUser = userService.uploadAvatar(username, avatar, path, filename);
        if (sysUser != null) {
            modelMap.put("curUser", sysUser);
            return "";
        }
        return "fail";
    }

    @RequestMapping
    public String logout(HttpSession session) {
        session.invalidate();
        return "login";
    }

    @Resource
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Override
    protected BaseService getBaseService() {
        return this.userService;
    }
}
