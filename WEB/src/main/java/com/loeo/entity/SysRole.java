package com.loeo.entity;

import com.fasterxml.jackson.annotation.JsonView;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by LT on 2015/11/4 0004.
 */
public class SysRole extends BaseEntity implements Serializable {
    public interface WithoutSysUsers{}
    public interface WithSysUsers extends WithoutSysUsers{}
    private String name;
    private String code;
    private String descp;
    private Byte enable;
    private Set<SysUser> sysUsers = new HashSet<SysUser>();

    @JsonView(WithSysUsers.class)
    public Set<SysUser> getSysUsers() {
        return sysUsers;
    }

    public void setSysUsers(Set<SysUser> sysUsers) {
        this.sysUsers = sysUsers;
    }

    @JsonView(WithoutSysUsers.class)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @JsonView(WithoutSysUsers.class)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @JsonView(WithoutSysUsers.class)
    public String getDescp() {
        return descp;
    }

    public void setDescp(String descp) {
        this.descp = descp;
    }

    @JsonView(WithoutSysUsers.class)
    public Byte getEnable() {
        return enable;
    }

    public void setEnable(Byte enable) {
        this.enable = enable;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SysRole sysRole = (SysRole) o;

        if (!id.equals(sysRole.id)) return false;
        if (name != null ? !name.equals(sysRole.name) : sysRole.name != null) return false;
        if (descp != null ? !descp.equals(sysRole.descp) : sysRole.descp != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (descp != null ? descp.hashCode() : 0);
        return result;
    }
}
