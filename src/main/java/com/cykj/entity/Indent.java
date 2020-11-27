package com.cykj.entity;

public class Indent {
    private long orderID;
    private long compID;
    private String money;
    private String orderNum;
    private String detail;
    private String account;

    public Indent() {
    }

    public Indent(long orderID, long compID, String money, String orderNum, String detail, String account) {
        this.orderID = orderID;
        this.compID = compID;
        this.money = money;
        this.orderNum = orderNum;
        this.detail = detail;
        this.account = account;
    }

    public Indent(long compID, String money, String orderNum, String detail, String account) {
        this.compID = compID;
        this.money = money;
        this.orderNum = orderNum;
        this.detail = detail;
        this.account = account;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "orderID=" + orderID +
                ", compID=" + compID +
                ", money='" + money + '\'' +
                ", orderNum='" + orderNum + '\'' +
                ", detail='" + detail + '\'' +
                ", account='" + account + '\'' +
                '}';
    }

    public long getOrderID() {
        return orderID;
    }

    public void setOrderID(long orderID) {
        this.orderID = orderID;
    }

    public long getCompID() {
        return compID;
    }

    public void setCompID(long compID) {
        this.compID = compID;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public String getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }
}
