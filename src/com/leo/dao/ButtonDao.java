package com.leo.dao;

import com.leo.entity.SysButton;

import java.util.List;

/**
 * Created by LT on 2016/8/23 0023 22:49
 */
public interface ButtonDao extends BaseDao<SysButton>{
    List<SysButton> list(Integer menuId);
}
