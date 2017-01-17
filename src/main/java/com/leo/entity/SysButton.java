package com.leo.entity;


import java.io.Serializable;

/**
 * Created by LT on 2015/12/28 0028 22:37
 */
public class SysButton extends BaseEntity implements Serializable {
    private String name;
    private String clazz;
    private String iconCls;
    private String script;
    private Integer menuId;
    private Integer orde;
    private String enable;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getClazz() {
        return clazz;
    }

    public void setClazz(String clazz) {
        this.clazz = clazz;
    }

    public String getIconCls() {
        return iconCls;
    }

    public void setIconCls(String iconCls) {
        this.iconCls = iconCls;
    }

    public String getScript() {
        return script;
    }

    public void setScript(String script) {
        this.script = script;
    }

    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }

    public Integer getOrde() {
        return orde;
    }

    public void setOrde(Integer orde) {
        this.orde = orde;
    }

    public String getEnable() {
        return enable;
    }

    public void setEnable(String enable) {
        this.enable = enable;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SysButton sysButton = (SysButton) o;

        if (!super.id.equals(sysButton.id)) return false;
        if (!menuId.equals(sysButton.menuId)) return false;
        if (!orde.equals( sysButton.orde)) return false;
        if (name != null ? !name.equals(sysButton.name) : sysButton.name != null) return false;
        if (clazz != null ? !clazz.equals(sysButton.clazz) : sysButton.clazz != null) return false;
        if (iconCls != null ? !iconCls.equals(sysButton.iconCls) : sysButton.iconCls != null) return false;
        if (script != null ? !script.equals(sysButton.script) : sysButton.script != null) return false;
        if (enable != null ? !enable.equals(sysButton.enable) : sysButton.enable != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (clazz != null ? clazz.hashCode() : 0);
        result = 31 * result + (iconCls != null ? iconCls.hashCode() : 0);
        result = 31 * result + (script != null ? script.hashCode() : 0);
        result = 31 * result + menuId;
        result = 31 * result + orde;
        result = 31 * result + (enable != null ? enable.hashCode() : 0);
        return result;
    }
}
