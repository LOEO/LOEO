package com.loeo.service;

import com.loeo.bean.Page;
import com.loeo.common.security.SpringSecurityUtils;
import com.loeo.dao.BaseDao;
import com.loeo.entity.BaseEntity;
import com.loeo.util.EntityUtil;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.lang.reflect.ParameterizedType;
import java.util.Date;
import java.util.Map;

/**
 * Created by LT on 2016/09/23 20:29
 */
@Transactional
public abstract class AbsService<T extends BaseEntity> implements BaseService<T> {
    protected Class<T> entityClass;

    public AbsService() {
        entityClass  =  (Class < T > ) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[ 0 ];
    }

    public T getById(Object id) {
        return getBaseDao().getById(id);
    }

    @Transactional(isolation = Isolation.READ_UNCOMMITTED, propagation = Propagation.NOT_SUPPORTED)
    public void save(Map<String,Object> formData) {
        T t = EntityUtil.buildEntity(entityClass, formData);
        save(t);
    }

    public void save(T t) {
        t.setUpdateUser(SpringSecurityUtils.getCurrentUserId());
        t.setUpdateDt(new Date());
        if (t.getId() == null) {
            t.setCreateUser(SpringSecurityUtils.getCurrentUserId());
            t.setCreateDt(new Date());
            insert(t);
        } else {
            update(t);
        }
    }

    public void deleteById(Integer id) {
        delete(id);
    }

    public Page getByPage(Map<String,Object> params) {
        Page p = new Page(params.get("page"), params.get("rows"));
        params.put("page", p);
        p.setRows(getBaseDao().getByPage(params));
        return p;
    }

    private void insert(T t) {
        if (beforeInsert(t)) {
            getBaseDao().insert(t);
            afterInsert(t);
        }
    }

    private void update(T t) {
        if (beforeUpdate(t)) {
            getBaseDao().update(t);
            afterUpdate(t);
        }
    }

    private void delete(Integer id) {
        if (beforeDelete(id)) {
            getBaseDao().deleteById(id);
            afterDelete(id);
        }
    }

    protected boolean beforeInsert(T t) {
        return true;
    }

    protected boolean beforeUpdate(T t) {
        return true;
    }

    protected boolean beforeDelete(Integer id) {
        return true;
    }

    protected boolean afterInsert(T t) {
        return true;
    }

    protected boolean afterUpdate(T t) {
        return true;
    }

    protected boolean afterDelete(Integer id) {
        return true;
    }

    public abstract BaseDao<T> getBaseDao();

}
