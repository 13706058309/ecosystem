package com.cykj.entity;

import org.springframework.stereotype.Component;

/**
 * 用户项目申请
 */
@Component
public class UserProject {
  private long id;
  private String orderNum;
  private long payMoney;
  private long paramId; //状态
  private Parameter states; //状态实体类
  private long userId; //用户Id
  private long projectId; //项目Id
  private ProjectInfo projectInfo; //项目实体类
  private String appTime;


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

  public Parameter getStates() {
    return states;
  }

  public void setStates(Parameter states) {
    this.states = states;
  }

  public ProjectInfo getProjectInfo() {
    return projectInfo;
  }

  public void setProjectInfo(ProjectInfo projectInfo) {
    this.projectInfo = projectInfo;
  }

  public String getAppTime() {
    return appTime;
  }

  public void setAppTime(String appTime) {
    this.appTime = appTime;
  }
}
