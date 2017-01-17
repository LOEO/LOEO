package com.leo.common.security;

import com.leo.bean.ResourceOwnerPair;

import java.util.List;

/**
 * Created by LT on 2016/11/27 13:24
 */
public interface SysResourceLoader {
    List<ResourceOwnerPair> load();
}
