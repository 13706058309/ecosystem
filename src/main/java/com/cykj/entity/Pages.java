package com.cykj.entity;

public class Pages {

    //分页
    private int page;
    private int limit;
    private String bUserName;
    private String beginTime;
    private String endTime;
    private String topic;
    private String type;
    private String stand;


    public Pages() {
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public String getbUserName() {
        return bUserName;
    }

    public void setbUserName(String bUserName) {
        this.bUserName = bUserName;
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

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getStand() {
        return stand;
    }

    public void setStand(String stand) {
        this.stand = stand;
    }


    @Override
    public String toString() {
        return "Pages{" +
                "page=" + page +
                ", limit=" + limit +
                ", bUserName='" + bUserName + '\'' +
                ", beginTime='" + beginTime + '\'' +
                ", endTime='" + endTime + '\'' +
                ", topic='" + topic + '\'' +
                ", type='" + type + '\'' +
                ", stand='" + stand + '\'' +
                '}';
    }
}
