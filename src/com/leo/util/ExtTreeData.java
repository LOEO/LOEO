package com.leo.util;

import java.util.List;
import java.util.Map;

/**
 * Created by LT on 2015-04-19.
 */
public class ExtTreeData {
    private List children;
    private Map<String,Object> treeData;

    public List getChildren() {
        return children;
    }

    public void setChildren(List children) {
        this.children = children;
    }

    public <T> Map createTreeData(List<T> list){
        return null;
    }
}
