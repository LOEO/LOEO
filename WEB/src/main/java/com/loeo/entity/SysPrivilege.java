package com.loeo.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by LT on 2015/11/4 0004.
 */
public class SysPrivilege extends BaseEntity implements Serializable {
    private String master;
    private String masterValue;
    private String access;
    private String accessValue;
    private String operation;

    public String getMaster() {
        return master;
    }

    public void setMaster(String master) {
        this.master = master;
    }

    public String getMasterValue() {
        return masterValue;
    }

    public void setMasterValue(String masterValue) {
        this.masterValue = masterValue;
    }

    public String getAccess() {
        return access;
    }

    public void setAccess(String access) {
        this.access = access;
    }

    public String getAccessValue() {
        return accessValue;
    }

    public void setAccessValue(String accessValue) {
        this.accessValue = accessValue;
    }

    public String getOperation() {
        return operation;
    }

    public void setOperation(String operation) {
        this.operation = operation;
    }

    public Integer getCreateUser() {
        return createUser;
    }

    public void setCreateUser(Integer createUser) {
        this.createUser = createUser;
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

        SysPrivilege sysPrivilege = (SysPrivilege) o;

        if (id != sysPrivilege.id) return false;
        if (master != null ? !master.equals(sysPrivilege.master) : sysPrivilege.master != null) return false;
        if (masterValue != null ? !masterValue.equals(sysPrivilege.masterValue) : sysPrivilege.masterValue != null)
            return false;
        if (access != null ? !access.equals(sysPrivilege.access) : sysPrivilege.access != null) return false;
        if (accessValue != null ? !accessValue.equals(sysPrivilege.accessValue) : sysPrivilege.accessValue != null)
            return false;
        if (operation != null ? !operation.equals(sysPrivilege.operation) : sysPrivilege.operation != null) return false;
        if (createUser != null ? !createUser.equals(sysPrivilege.createUser) : sysPrivilege.createUser != null)
            return false;
        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (master != null ? master.hashCode() : 0);
        result = 31 * result + (masterValue != null ? masterValue.hashCode() : 0);
        result = 31 * result + (access != null ? access.hashCode() : 0);
        result = 31 * result + (accessValue != null ? accessValue.hashCode() : 0);
        result = 31 * result + (operation != null ? operation.hashCode() : 0);
        return result;
    }
}
