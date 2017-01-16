package com.leo.service.impl;

import com.leo.bean.MenuAndButton;
import com.leo.common.consts.SystemConfig;
import com.leo.common.security.SpringSecurityUtils;
import com.leo.dao.BaseDao;
import com.leo.dao.MenuDao;
import com.leo.entity.BaseEntity;
import com.leo.entity.SysMenu;
import com.leo.service.AbsService;
import com.leo.util.EntityUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by LT on 2016/09/22 23:51
 */
@Service
public class MenuService extends AbsService<SysMenu> {
    private MenuDao menuDao;

    public List<SysMenu> list(Integer pid) {
        return menuDao.list(pid);
    }

    public List<SysMenu> getUserMenuList(Integer userId) {
        return menuDao.getUserMenuList(userId);
    }
    @Override
    protected boolean beforeInsert(SysMenu sysMenu) {
        SysMenu parent = menuDao.getById(sysMenu.getPid());
        parent.setIsLeaf((byte) 0);
        menuDao.update(parent);
        return true;
    }



    public void deleteMenu(Integer id,Integer pid) {
        super.deleteById(id);
        List<SysMenu> sysMenus = menuDao.list(pid);
        if (sysMenus.size()==0) {
            SysMenu sysMenu = new SysMenu();
            sysMenu.setId(pid);
            sysMenu.setIsLeaf((byte) 1);
            menuDao.update(sysMenu);
        }
    }

    @Resource
    public void setMenuDao(MenuDao menuDao) {
        this.menuDao = menuDao;
    }

    @Override
    public BaseDao<SysMenu> getBaseDao() {
        return this.menuDao;
    }

}
