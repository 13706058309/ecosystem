package com.cykj.entity;

public class PageBean {
    private int limit;
    private int Page;
    private String beginTime;
    private String endTime;

    public PageBean() {
    }

    @Override
    public String toString() {
        return "PageBean{" +
                "limit=" + limit +
                ", Page=" + Page +
                ", beginTime='" + beginTime + '\'' +
                ", endTime='" + endTime + '\'' +
                '}';
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public int getPage() {
        return Page;
    }

    public void setPage(int page) {
        Page = page;
    }

    public String getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(String beginTime) {
        this.beginTime = beginTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }
}
