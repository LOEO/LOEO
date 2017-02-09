package com.loeo.common.security;

import com.loeo.bean.ResourceOwnerPair;

import java.util.List;

/**
 * Created by LT on 2016/11/27 13:24
 */
public interface SysResourceLoader {
    List<ResourceOwnerPair> load();
}
