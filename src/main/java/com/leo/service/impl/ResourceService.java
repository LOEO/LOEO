package com.leo.service.impl;

import com.leo.bean.SysResourceTreeNode;
import com.leo.dao.BaseDao;
import com.leo.dao.ResourceDao;
import com.leo.entity.SysResource;
import com.leo.service.AbsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by LT on 2016/11/05 11:38
 */
@Service
@Transactional
public class ResourceService extends AbsService<SysResource> {
    private ResourceDao resourceDao;

    public List<SysResourceTreeNode> getResourceTree() {
        List<SysResource> sysResource = resourceDao.list(null);
        return convertResourceTree(sysResource, 0);
    }

    public List<SysResourceTreeNode> convertResourceTree(List<SysResource> resources,Integer id) {
        List<SysResourceTreeNode> children = new ArrayList<SysResourceTreeNode>();
        for (SysResource resource : resources) {
            if (resource.getPid().equals(id)) {
                SysResourceTreeNode treeNode = new SysResourceTreeNode(resource);
                children.add(treeNode);
                if (treeNode.getIsLeaf() != 1) {
                    treeNode.setChildren(convertResourceTree(resources, treeNode.getId()));
                }
            }
        }
        return children;
    }

    @Override
    protected boolean beforeInsert(SysResource sysResource) {
        if (sysResource.getPid() != 0) {
            SysResource parent = resourceDao.getById(sysResource.getPid());
            parent.setIsLeaf((byte) 0);
            resourceDao.update(parent);
        }
        return true;
    }

    public void delete(Integer id,Integer pid) {
        int count = resourceDao.count(pid);
        if (count==1) {
            SysResource sysResource = new SysResource();
            sysResource.setId(pid);
            sysResource.setIsLeaf((byte) 1);
            resourceDao.update(sysResource);
        }
        super.deleteById(id);
    }

    public List<SysResource> getUserMenuList(Integer userId) {
        return resourceDao.getUserMenuList(userId);
    }

    @Override
    public BaseDao<SysResource> getBaseDao() {
        return resourceDao;
    }

    @Resource
    public void setResourceDao(ResourceDao resourceDao) {
        this.resourceDao = resourceDao;
    }
}
