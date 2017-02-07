package com.leo.dao;

import com.leo.entity.SysResource;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Created by LT on 2016/11/05 11:14
 */
public interface ResourceDao extends BaseDao<SysResource>{
    List<SysResource> list(Map<String,Object> params);

    Integer count(Integer pid);

    List<SysResource> getUserMenuList(Integer userId);

    List<SysResource> getResource(Integer id, String type);

    List<SysResource> getAuthorisedButtonsByMenuId(@Param("menuId") Integer menuId, @Param("userId")Integer userId);
}
