package com.leo.dao;

import com.leo.bean.MenuAndButton;
import com.leo.bean.ResourceOwnerPair;
import com.leo.entity.SysPrivilege;
import com.leo.entity.SysResource;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by LT on 2016/09/28 21:04
 */
public interface PrivilegeDao extends BaseDao<SysPrivilege>{

    void deleteByMasterAndValue(@Param("master") String master,@Param("masterValue") String masterValue);

    void batchInsert(List<SysPrivilege> sysPrivileges);

    List<MenuAndButton> getMenuAndButtonList(@Param("master") String master,@Param("masterValue") String masterValue);

    List<SysResource> getResource(@Param("master") String master, @Param("masterValue") String masterValue);

    List<ResourceOwnerPair> getRoleResourceOwnerPair();

    List<ResourceOwnerPair> getUserResourceOwnerPair();

    List<SysResource> getUserResourceList(Integer userId);
}
