package com.leo.common.security;

import com.leo.common.consts.Message;
import org.springframework.security.access.AccessDecisionManager;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;

import java.util.Collection;

/**
 * Created by LT on 2016/11/04 0:28
 */
public class CustomAccessDecisionManager implements AccessDecisionManager {
    public void decide(Authentication authentication, Object object, Collection<ConfigAttribute> configAttributes) throws AccessDeniedException, InsufficientAuthenticationException {
        String userPrivilegeCode = "USER_" + ((UserDetail) authentication.getPrincipal()).getUser().getId();
        if (configAttributes != null) {
            for (ConfigAttribute configAttribute : configAttributes) {
                //判断用户是否拥有权限
                if(configAttribute.getAttribute().equals(userPrivilegeCode)){
                    return;
                }
                //判断用户的角色是否拥有权限
                for (GrantedAuthority authority : authentication.getAuthorities()) {
                    if (("ROLE_"+authority.getAuthority()).equals(configAttribute.getAttribute())) {
                        return;
                    }
                }
            }
            throw new AccessDeniedException(Message.AUTHENTICATED_FAILED);
        }
    }

    public boolean supports(ConfigAttribute attribute) {
        return true;
    }

    public boolean supports(Class<?> clazz) {
        return true;
    }
}
