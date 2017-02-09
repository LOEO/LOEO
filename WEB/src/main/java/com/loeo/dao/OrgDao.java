package com.loeo.dao;

import com.loeo.entity.SysOrg;

import java.util.List;

/**
 * Created by LT on 2016/8/23 0023 22:47
 */
public interface OrgDao {
    List<SysOrg> getOrgList();

    List<SysOrg> getOrgList(int pid);

    List<SysOrg> getOrgList(String hql, Object... values);

    SysOrg getOrgById(int id);

    boolean addOrg(SysOrg sysOrg);

    boolean updateOrg(SysOrg sysOrg);

    boolean deleteOrg(SysOrg sysOrg);

    boolean deleteOrgById(int id);
}
