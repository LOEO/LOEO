package com.leo.service.impl;

import com.leo.bean.MenuAndButton;
import com.leo.bean.ResourceOwnerPair;
import com.leo.bean.SysResourceTreeNode;
import com.leo.common.security.CustomSecurityMetadataSource;
import com.leo.common.security.SpringSecurityUtils;
import com.leo.dao.BaseDao;
import com.leo.dao.PrivilegeDao;
import com.leo.entity.SysPrivilege;
import com.leo.entity.SysResource;
import com.leo.service.AbsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by LT on 2016/09/28 21:05
 */
@Service
@Transactional
public class PrivilegeService extends AbsService<SysPrivilege> {
    private PrivilegeDao privilegeDao;
    private ResourceService resourceService;



    private CustomSecurityMetadataSource customSecurityMetadataSource;

    @Override
    public BaseDao<SysPrivilege> getBaseDao() {
        return this.privilegeDao;
    }

    public void save(List<MenuAndButton> list,String master,String masterValue) {
        privilegeDao.deleteByMasterAndValue(master,masterValue);
        if (list.size() > 0) {
            privilegeDao.batchInsert(convert2Privileges(list,master,masterValue));
        }
        customSecurityMetadataSource.initResources();
    }

    public List<MenuAndButton> getMenuAndButtonList(String master,String masterValue) {
        return privilegeDao.getMenuAndButtonList(master,masterValue);
    }

    public List<SysResource> getUserResource(Integer userId) {
        return privilegeDao.getUserResourceList(userId);
    }

    public List<SysResourceTreeNode> getResource(String master, String masterValue) {
        List<SysResource> resources = privilegeDao.getResource(master, masterValue);
        return resourceService.convertResourceTree(resources, 0);
    }

    public SysPrivilege convert2Privilege(MenuAndButton menuAndButton,String master,String masterValue) {
        SysPrivilege sysPrivilege = new SysPrivilege();
        sysPrivilege.setMaster(master);
        sysPrivilege.setMasterValue(masterValue);
        sysPrivilege.setAccess(menuAndButton.getType());
        sysPrivilege.setAccessValue(menuAndButton.getId().toString());
        sysPrivilege.setOperation("enable");
        sysPrivilege.setCreateUser(SpringSecurityUtils.getCurrentUserId());
        sysPrivilege.setUpdateUser(SpringSecurityUtils.getCurrentUserId());
        sysPrivilege.setCreateDt(new Date());
        sysPrivilege.setUpdateDt(new Date());
        return sysPrivilege;
    }

    public List<SysPrivilege> convert2Privileges(List<MenuAndButton> menuAndButtons,String master,String masterValue) {
        List<SysPrivilege> sysPrivileges = new ArrayList<SysPrivilege>();
        for(int i=0;i<menuAndButtons.size();i++) {
            sysPrivileges.add(convert2Privilege(menuAndButtons.get(i),master,masterValue));
        }
        return sysPrivileges;
    }

    public List<ResourceOwnerPair> getRoleResourceOwnerPair() {
        return privilegeDao.getRoleResourceOwnerPair();
    }

    public List<ResourceOwnerPair> getUserResourceOwnerPair() {
        return privilegeDao.getUserResourceOwnerPair();
    }

    @Resource
    public void setPrivilegeDao(PrivilegeDao privilegeDao) {
        this.privilegeDao = privilegeDao;
    }

    @Resource
    public void setResourceService(ResourceService resourceService) {
        this.resourceService = resourceService;
    }

    @Resource
    public void setCustomSecurityMetadataSource(CustomSecurityMetadataSource customSecurityMetadataSource) {
        this.customSecurityMetadataSource = customSecurityMetadataSource;
    }
}
