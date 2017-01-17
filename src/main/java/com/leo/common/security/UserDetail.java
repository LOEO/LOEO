package com.leo.common.security;

import com.leo.entity.SysRole;
import com.leo.entity.SysUser;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.*;

/**
 * Created by LT on 2016/6/17 0017 23:08
 */
public class UserDetail implements UserDetails {
    private SysUser user;

    private Collection<? extends GrantedAuthority> authorities;

    public UserDetail(SysUser user) {
        this.user = user;
    }
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return authorities;
    }

    /*public void setAuthorities(List<String> auths) {
        List<GrantedAuthority> list = new ArrayList<GrantedAuthority>();
        for(String auth:auths){
            list.add(new SimpleGrantedAuthority(auth));
        }
        this.authorities = list;
    }*/

    public void setAuthorities(List<SysRole> roles) {
        Set<GrantedAuthority> list = new HashSet<GrantedAuthority>();
        for (SysRole role : roles) {
            list.add(new SimpleGrantedAuthority(role.getCode()));
        }
        list.add(new SimpleGrantedAuthority("ROLE_USER"));
        this.authorities = list;
    }

    public String getPassword() {
        return user.getPassword();
    }

    public String getUsername() {
        return user.getUsername();
    }

    public boolean isAccountNonExpired() {
        return true;
    }

    public boolean isAccountNonLocked() {
        return true;
    }

    public boolean isCredentialsNonExpired() {
        return true;
    }

    public boolean isEnabled() {
        return user.getEnable()==1;
    }

    public SysUser getUser() {
        return user;
    }

    public void setUser(SysUser user) {
        this.user = user;
    }
}
