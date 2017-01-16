package com.leo.service.impl;

import com.leo.dao.BaseDao;
import com.leo.dao.ButtonDao;
import com.leo.dao.RoleDao;
import com.leo.entity.SysButton;
import com.leo.service.AbsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by LT on 2015/12/10 0010.15:35
 */
@Service
@Transactional
public class ButtonService extends AbsService<SysButton> {
    private ButtonDao buttonDao;

    public List<SysButton> list(Integer menuId) {
       return buttonDao.list(menuId);
    }

    @Resource
    public void setButtonDao(ButtonDao buttonDao) {
        this.buttonDao = buttonDao;
    }

    @Override
    public BaseDao<SysButton> getBaseDao() {
        return this.buttonDao;
    }
}
