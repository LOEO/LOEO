package com.leo.dao;

import java.util.List;
import java.util.Map;

/**
 * Created by LT on 2016/09/23 20:22
 */
public interface BaseDao<T> {
    void insert(T t);

    void update(T t);

    void deleteById(Integer id);

    List<T> getByPage(Map<String,Object> params);

    T getById(Object id);
}
