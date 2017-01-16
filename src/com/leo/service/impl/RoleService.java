package com.leo.service.impl;

import com.leo.dao.BaseDao;
import com.leo.dao.RoleDao;
import com.leo.entity.SysRole;
import com.leo.service.AbsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by LT on 2015/12/10 0010.15:35
 */
@Service
@Transactional
public class RoleService extends AbsService<SysRole> {
    private RoleDao roleDao;

    public List<SysRole> getUserHasRoles(Integer userId) {
        return roleDao.getUserHasRoles(userId);
    }

    public List<SysRole> getUserNotHasRoles(Integer userId) {
        return roleDao.getUserNotHasRoles(userId);
    }

    @Resource
    public void setRoleDao(RoleDao roleDao) {
        this.roleDao = roleDao;
    }

    @Override
    public BaseDao<SysRole> getBaseDao() {
        return this.roleDao;
    }
}
