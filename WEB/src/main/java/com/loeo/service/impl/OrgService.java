package com.loeo.service.impl;

import com.loeo.common.consts.Message;
import com.loeo.dao.BaseDao;
import com.loeo.dao.OrgDao;
import com.loeo.entity.SysOrg;
import com.loeo.exception.BaseException;
import com.loeo.service.AbsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by LT on 2015-04-20.
 */
@Service
@Transactional
public class OrgService extends AbsService<SysOrg> {
    private OrgDao orgDao;

    public List<SysOrg> getOrgList() {
        return orgDao.getOrgList();
    }

    @Override
    protected boolean beforeInsert(SysOrg sysOrg) {
        SysOrg parent = orgDao.getById(sysOrg.getPid());
        if (parent.getLeaf().equals("true")) {
            orgDao.updateLeafById(parent.getId(), "false");
        }
        sysOrg.setLeaf("true");
        return true;
    }

    @Override
    protected boolean beforeUpdate(SysOrg sysOrg) {
        return super.beforeUpdate(sysOrg);
    }

    @Override
    protected boolean beforeDelete(Integer id) {
        SysOrg sysOrg = orgDao.getById(id);
        if (sysOrg.getLeaf().equals("false")) {
            throw new BaseException(Message.NOT_A_LEAF_CAN_NOT_DELETED);
        }
        List<SysOrg> orgs = orgDao.getOrgList(sysOrg.getPid());
        if (orgs.size() == 1) {
            orgDao.updateLeafById(sysOrg.getPid(), "true");
        }
        return true;
    }

    @Resource
    public void setOrgDao(OrgDao orgDao) {
        this.orgDao = orgDao;
    }

    @Override
    public BaseDao<SysOrg> getBaseDao() {
        return orgDao;
    }
}
