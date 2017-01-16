package com.leo.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by LT on 2015/12/28 0028 22:37
 */
public class SysMenu extends BaseEntity implements Serializable {
    private String name;
    private String iconCls;
    private String link;
    private Integer pid;
    private Byte isLeaf;
    private Integer orde;
    private Byte enable;
    //private Set<SysButton> sysButtons = new HashSet<SysButton>();


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIconCls() {
        return iconCls;
    }

    public void setIconCls(String icon) {
        this.iconCls = icon;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Byte getIsLeaf() {
        return isLeaf;
    }

    public void setIsLeaf(Byte isLeaf) {
        this.isLeaf = isLeaf;
    }

    public Integer getOrde() {
        return orde;
    }

    public void setOrde(Integer orde) {
        this.orde = orde;
    }

    /*public Set<SysButton> getSysButtons() {
        return sysButtons;
    }

    public void setSysButtons(Set<SysButton> sysButtons) {
        this.sysButtons = sysButtons;
    }*/

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

    public Byte getEnable() {
        return enable;
    }

    public void setEnable(Byte enable) {
        this.enable = enable;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SysMenu sysMenu = (SysMenu) o;

        if (id != sysMenu.id) return false;
        if (name != null ? !name.equals(sysMenu.name) : sysMenu.name != null) return false;
        if (iconCls != null ? !iconCls.equals(sysMenu.iconCls) : sysMenu.iconCls != null) return false;
        if (link != null ? !link.equals(sysMenu.link) : sysMenu.link != null) return false;
        if (pid != null ? !pid.equals(sysMenu.pid) : sysMenu.pid != null) return false;
        if (isLeaf != null ? !isLeaf.equals(sysMenu.isLeaf) : sysMenu.isLeaf != null) return false;
        if (orde != null ? !orde.equals(sysMenu.orde) : sysMenu.orde != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (iconCls != null ? iconCls.hashCode() : 0);
        result = 31 * result + (link != null ? link.hashCode() : 0);
        result = 31 * result + (pid != null ? pid.hashCode() : 0);
        result = 31 * result + (isLeaf != null ? isLeaf.hashCode() : 0);
        result = 31 * result + (orde != null ? orde.hashCode() : 0);
        return result;
    }
}
