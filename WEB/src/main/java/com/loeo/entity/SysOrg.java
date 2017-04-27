package com.loeo.entity;

import java.io.Serializable;

/**
 * Created by LT on 2015/11/4 0004.
 */

public class SysOrg extends BaseEntity implements Serializable {
    private String name;
    private Integer pid;
    private String descp;
    private String leaf;

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
