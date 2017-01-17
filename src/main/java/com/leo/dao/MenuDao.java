package com.leo.dao;

import com.leo.bean.MenuAndButton;
import com.leo.entity.SysMenu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by LT on 2016/09/22 23:47
 */
public interface MenuDao extends BaseDao<SysMenu>{
    List<SysMenu> list(Integer pid);

    List<SysMenu> getUserMenuList(@Param("userId") Integer userId);

    void setIsLeaf(Byte isLeaf);
}
