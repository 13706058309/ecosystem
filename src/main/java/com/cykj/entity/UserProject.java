package com.cykj.entity;

/**
 * 用户项目申请
 */
public class UserProject {
  private long id;
  private String orderNum;
  private long payMoney;
  private long paramId; //状态
  private long userId; //用户Id
  private long projectId; //项目Id


  public long getParamId() {
    return paramId;
  }

  public void setParamId(long paramId) {
    this.paramId = paramId;
  }


  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }


  public long getProjectId() {
    return projectId;
  }

  public void setProjectId(long projectId) {
    this.projectId = projectId;
  }

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }

  public String getOrderNum() {
    return orderNum;
  }

  public void setOrderNum(String orderNum) {
    this.orderNum = orderNum;
  }

  public long getPayMoney() {
    return payMoney;
  }

  public void setPayMoney(long payMoney) {
    this.payMoney = payMoney;
  }
}
