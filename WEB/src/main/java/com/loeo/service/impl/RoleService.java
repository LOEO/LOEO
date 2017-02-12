package com.loeo.service.impl;

import com.loeo.dao.BaseDao;
import com.loeo.dao.RoleDao;
import com.loeo.entity.SysRole;
import com.loeo.service.AbsService;
import org.springframework.cache.annotation.Cacheable;
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

    //@Cacheable(value = "webCache")
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
