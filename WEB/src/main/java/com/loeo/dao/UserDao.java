package com.loeo.dao;

import com.loeo.entity.SysRole;
import com.loeo.entity.SysUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by LT on 2016/8/23 0023 22:45
 */
public interface UserDao extends BaseDao<SysUser>{
    List<SysUser> findAll();

    SysUser findById(int id);

    SysUser findByUserName(String name);

    List<SysUser> findUserByProperty(String[] property, Object[] values);

    void deleteUserRoleByUserId(@Param("userId") Integer userId);

    void saveUserRole(@Param("roles") List<SysRole> roles,@Param("userId") Integer userId);
}
