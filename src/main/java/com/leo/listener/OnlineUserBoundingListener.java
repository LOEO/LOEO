package com.leo.listener;

import com.leo.entity.SysUser;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by LT on 14-7-17.
 */
public class OnlineUserBoundingListener implements HttpSessionBindingListener {
    private SysUser sysUser;

    public OnlineUserBoundingListener(){
    }

    public OnlineUserBoundingListener(SysUser sysUser){
        this.sysUser = sysUser;
    }

    public void valueBound(HttpSessionBindingEvent httpSessionBindingEvent) {
        HttpSession session = httpSessionBindingEvent.getSession();
        ServletContext application = session.getServletContext();
        session.setAttribute("curUserName", sysUser.getUsername());
        session.setAttribute("curUser", sysUser);
        // 把用户名放入在线列表
        Map<String,SysUser> onlineUsers = (Map<String, SysUser>) application.getAttribute("users");
        // 第一次使用前，需要初始化
        if (onlineUsers == null) {
            onlineUsers = new HashMap<String, SysUser>();
            application.setAttribute("users", onlineUsers);
        }
        if (!onlineUsers.containsKey(sysUser.getUsername())) {
            onlineUsers.put(sysUser.getUsername(), sysUser);
        }
        application.setAttribute("onlineUsers",onlineUsers.size());
    }

    public void valueUnbound(HttpSessionBindingEvent httpSessionBindingEvent) {
        HttpSession session = httpSessionBindingEvent.getSession();
        ServletContext application = session.getServletContext();
        HashMap<String,SysUser> onlineUsers = (HashMap<String, SysUser>) application.getAttribute("users");
        onlineUsers.remove(this.sysUser.getUsername());
        application.setAttribute("onlineUsers",onlineUsers.size());
    }
}
