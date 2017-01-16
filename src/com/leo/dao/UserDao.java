package com.leo.dao;

import com.leo.entity.SysRole;
import com.leo.entity.SysUser;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.access.method.P;

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
