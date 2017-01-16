package com.leo.dao;

import com.leo.entity.SysRole;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by LT on 2016/8/23 0023 22:49
 */
public interface RoleDao extends BaseDao<SysRole>{

    List<SysRole> getUserHasRoles(@Param("userId") Integer userId);

    List<SysRole> getUserNotHasRoles(@Param("userId") Integer userId);
}
