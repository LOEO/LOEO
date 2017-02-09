package com.loeo.bean;

import com.loeo.common.consts.SystemConfig;

import java.util.List;

/**
 * Created by LT on 2016/9/15 0015 18:47
 */
public class Page {
    private int pageNO;
    private int pageSize;
    private int total;
    private int dbIndex;
    private List rows;

    public Page(int pageNO, int pageSize) {
        this.pageNO = pageNO;
        this.pageSize = pageSize;
        calc();
    }

    public Page(Object pageNO, Object pageSize) {
        try {
            this.pageNO = Integer.parseInt(pageNO.toString());
            this.pageSize = Integer.parseInt(pageSize.toString());
        } catch (Exception e) {
            this.pageNO = SystemConfig.PAGE;
            this.pageSize = SystemConfig.PAGE;
        }
        calc();
    }

    private void calc() {
        dbIndex = (pageNO - 1) * pageSize;
    }

    public int getPageNO() {
        return pageNO;
    }

    public void setPageNO(int pageNO) {
        this.pageNO = pageNO;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getDbIndex() {
        return dbIndex;
    }

    public List getRows() {
        return rows;
    }

    public void setRows(List rows) {
        this.rows = rows;
    }
}
