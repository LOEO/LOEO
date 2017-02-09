package com.loeo.service.impl;

import com.loeo.dao.OrgDao;
import com.loeo.entity.SysOrg;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by LT on 2015-04-20.
 */
@Service
@Transactional
public class OrgService {
    private OrgDao orgDao;

    public List<SysOrg> getOrgList(int pid) {
        return orgDao.getOrgList(pid);
    }

    public boolean addOrg(SysOrg sysOrg) {
        if(sysOrg.getPid()!=0){
            SysOrg parent = orgDao.getOrgById(sysOrg.getPid());
            parent.setLeaf("false");
        }
        return orgDao.addOrg(sysOrg);
    }

    public boolean updateOrg(int id,String name,String descp) {
        SysOrg sysOrg = orgDao.getOrgById(id);
        sysOrg.setName(name);
        sysOrg.setDescp(descp);
        return orgDao.updateOrg(sysOrg);
    }

    public boolean deleteOrg(int id,int pid) {
        orgDao.deleteOrgById(id);
        List<SysOrg> orgs = orgDao.getOrgList(pid);
        if(orgs == null || orgs.size() == 0){
            SysOrg sysOrg = orgDao.getOrgById(pid);
            sysOrg.setLeaf("true");
        }
        return true;
    }

    public OrgDao getOrgDao() {
        return orgDao;
    }

    @Resource
    public void setOrgDao(OrgDao orgDao) {
        this.orgDao = orgDao;
    }

}
