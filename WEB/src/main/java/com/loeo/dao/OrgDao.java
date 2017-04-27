package com.loeo.dao;

import com.loeo.entity.SysOrg;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by LT on 2016/8/23 0023 22:47
 */
public interface OrgDao extends BaseDao<SysOrg> {
    List<SysOrg> getOrgList();

    List<SysOrg> getOrgList(@Param("pid") int pid);

    List<SysOrg> getOrgList(String hql, Object... values);

    void updateLeafById(@Param("id") Integer id, @Param("leaf") String leaf);

    boolean deleteOrgById(int id);
}
