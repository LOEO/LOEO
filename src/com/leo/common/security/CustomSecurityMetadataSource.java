package com.leo.common.security;

import com.leo.bean.ResourceOwnerPair;
import com.leo.service.impl.PrivilegeService;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.*;

/**
 * Created by LT on 2016/11/03 23:52
 */
public class CustomSecurityMetadataSource implements FilterInvocationSecurityMetadataSource {
    private Map<String, Collection<ConfigAttribute>> resourceMap = new HashMap<String, Collection<ConfigAttribute>>();
    private PrivilegeService privilegeService;

    public void initResources() {
        List<ResourceOwnerPair> resourceOwnerPairs = privilegeService.getRoleResourceOwnerPair();
        addResource(resourceOwnerPairs, "ROLE_");
        resourceOwnerPairs = privilegeService.getUserResourceOwnerPair();
        addResource(resourceOwnerPairs, "USER_");
    }

    private void addResource(List<ResourceOwnerPair> resourceOwnerPairs, String ownerPrefix) {
        for (ResourceOwnerPair resourceOwnerPair : resourceOwnerPairs) {
            Collection<ConfigAttribute> configAttributes = this.resourceMap.get(resourceOwnerPair.getLink());
            if (StringUtils.isEmpty(resourceOwnerPair.getLink()) || resourceOwnerPair.getOwner() == null) continue;
            SecurityConfig securityConfig = new SecurityConfig(ownerPrefix + resourceOwnerPair.getOwner());
            if (configAttributes == null) {
                configAttributes = new ArrayList<ConfigAttribute>();
                this.resourceMap.put(resourceOwnerPair.getLink(), configAttributes);
            }
            configAttributes.add(securityConfig);
        }
    }

    public Collection<ConfigAttribute> getAttributes(Object object) throws IllegalArgumentException {
        String requestPath = ((FilterInvocation) object).getRequestUrl();
        if (requestPath.indexOf("?") != -1) {
            requestPath = requestPath.substring(0, requestPath.indexOf("?"));
        }
        return resourceMap.get(requestPath);
    }

    public Collection<ConfigAttribute> getAllConfigAttributes() {
        return null;
    }

    public boolean supports(Class<?> clazz) {
        return true;
    }

    @Resource
    public void setPrivilegeService(PrivilegeService privilegeService) {
        this.privilegeService = privilegeService;
    }
}
