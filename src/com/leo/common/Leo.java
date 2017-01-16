package com.leo.common;

import com.leo.entity.SysUser;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by LT on 2015/11/21 0021.
 */
@Repository
public class Leo {
    public static int USER_COUNT=0;
    public static Map<String, SysUser> USERS = new HashMap<String, SysUser>();
}
