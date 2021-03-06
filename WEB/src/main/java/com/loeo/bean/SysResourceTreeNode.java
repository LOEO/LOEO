package com.loeo.bean;

import com.loeo.entity.SysResource;

import java.util.List;

/**
 * Created by LT on 2016/11/05 11:40
 */
public class SysResourceTreeNode extends SysResource {
    private String checkState;
    private List<SysResourceTreeNode> children;
    public SysResourceTreeNode(SysResource resource) {
        this.setId(resource.getId());
        this.setName(resource.getName());
        this.setLink(resource.getLink());
        this.setType(resource.getType());
        this.setPid(resource.getPid());
        this.setDescp(resource.getDescp());
        this.setIconCls(resource.getIconCls());
        this.setCode(resource.getCode());
        this.setCreateDt(resource.getCreateDt());
        this.setCreateUser(resource.getCreateUser());
        this.setUpdateDt(resource.getUpdateDt());
        this.setUpdateUser(resource.getUpdateUser());
        this.setEnable(resource.getEnable());
        this.setIsLeaf(resource.getIsLeaf());
        this.setOrde(resource.getOrde());
        this.setChecked(resource.isChecked()==null?Boolean.FALSE:resource.isChecked());
        if (this.isChecked()) {
            if (this.getIsLeaf() == 0) {
                this.checkState = "indeterminate";
                this.setChecked(false);
            }else{
                this.checkState="checked";
            }
        }else{
            this.checkState = "unchecked";
        }
    }

    public List<SysResourceTreeNode> getChildren() {
        return children;
    }

    public void setChildren(List<SysResourceTreeNode> children) {
        this.children = children;
    }

    public String getCheckState() {
        return checkState;
    }

    public void setCheckState(String checkState) {
        this.checkState = checkState;
    }
}
