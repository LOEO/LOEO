package com.leo.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by LT on 2015/11/4 0004.
 */

public class SysOrg implements Serializable {

    private int id;
    private String name;
    private Integer pid;
    private String descp;
    private String leaf;
    private Integer createUser;
    private Date createDt;
    private Integer updateUser;
    private Date updateDt;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getDescp() {
        return descp;
    }

    public void setDescp(String descp) {
        this.descp = descp;
    }

    public String getLeaf() {
        return leaf;
    }

    public void setLeaf(String leaf) {
        this.leaf = leaf;
    }

    public Integer getCreateUser() {
        return createUser;
    }

    public void setCreateUser(Integer createUser) {
        this.createUser = createUser;
    }

    public Date getCreateDt() {
        return createDt;
    }

    public void setCreateDt(Date createDt) {
        this.createDt = createDt;
    }

    public Integer getUpdateUser() {
        return updateUser;
    }

    public void setUpdateUser(Integer updateUser) {
        this.updateUser = updateUser;
    }

    public Date getUpdateDt() {
        return updateDt;
    }

    public void setUpdateDt(Date updateDt) {
        this.updateDt = updateDt;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SysOrg sysOrg = (SysOrg) o;

        if (id != sysOrg.id) return false;
        if (name != null ? !name.equals(sysOrg.name) : sysOrg.name != null) return false;
        if (pid != null ? !pid.equals(sysOrg.pid) : sysOrg.pid != null) return false;
        if (descp != null ? !descp.equals(sysOrg.descp) : sysOrg.descp != null) return false;
        if (leaf != null ? !leaf.equals(sysOrg.leaf) : sysOrg.leaf != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (pid != null ? pid.hashCode() : 0);
        result = 31 * result + (descp != null ? descp.hashCode() : 0);
        result = 31 * result + (leaf != null ? leaf.hashCode() : 0);
        return result;
    }
}
