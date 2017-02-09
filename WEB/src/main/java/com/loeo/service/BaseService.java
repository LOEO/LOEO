package com.loeo.service;

import com.loeo.bean.Page;

import java.util.Map;

/**
 * Created by LT on 2016/9/18 0018 13:28
 */
public interface BaseService<T> {
    void save(Map<String,Object> params);

    void save(T t);

    void deleteById(Integer id);

    Page getByPage(Map<String,Object> params);

    T getById(Object id);
}
