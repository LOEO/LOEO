package com.loeo.common.security;

import com.loeo.entity.SysRole;
import com.loeo.entity.SysUser;
import com.loeo.service.impl.RoleService;
import com.loeo.service.impl.UserService;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by LT on 2016/5/31 0031 20:59
 */
@Component
public class UserDetailService implements UserDetailsService {
    private UserService userService;

    private RoleService roleService;

    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        SysUser  user =  userService.findUserByUsername(username);
        if (user != null) {
            UserDetail userDetail = new UserDetail(user);
            List<SysRole> roles =  roleService.getUserHasRoles(user.getId());
            //设置获取用户拥有的角色
            userDetail.setAuthorities(roles);
            return userDetail;
        }
        return null;
    }

    @Resource
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Resource
    public void setRoleService(RoleService roleService) {
        this.roleService = roleService;
    }
}
