package com.cykj.entity;

/**
 * 企业发布的项目
 */
public class ProjectInfo {
  private long projectId; //项目ID
  private long bUserId; //企业Id
  private BackUser backUser;//企业实体类
  private String projectName; //项目标题
  private String projectSynopsis; //项目描述
  private String publishTime; //发布时间
  private long userId;
  private UserInfo userInfo; //承接人实体类
  private Parameter states; //状态实体类
  private String money;
  private String docUrl;
  private long fieldId;
  private Parameter field;

  public ProjectInfo() {
  }

  @Override
  public String toString() {
    return "ProjectInfo{" +
            "projectId=" + projectId +
            ", bUserId=" + bUserId +
            ", backUser=" + backUser.toString() +
            ", projectName='" + projectName + '\'' +
            ", projectSynopsis='" + projectSynopsis + '\'' +
            ", publishTime='" + publishTime + '\'' +
            ", userId=" + userId +
            ", userInfo=" + userInfo.toString() +
            ", states=" + states.toString() +
            ", money='" + money + '\'' +
            ", docUrl='" + docUrl + '\'' +
            '}';
  }

  public long getProjectId() {
    return projectId;
  }

  public void setProjectId(long projectId) {
    this.projectId = projectId;
  }


  public String getProjectName() {
    return projectName;
  }

  public void setProjectName(String projectName) {
    this.projectName = projectName;
  }


  public String getProjectSynopsis() {
    return projectSynopsis;
  }

  public void setProjectSynopsis(String projectSynopsis) {
    this.projectSynopsis = projectSynopsis;
  }


  public String getPublishTime() {
    return publishTime;
  }

  public void setPublishTime(String publishTime) {
    this.publishTime = publishTime;
  }


  public long getbUserId() {
    return bUserId;
  }

  public void setbUserId(long bUserId) {
    this.bUserId = bUserId;
  }

  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }


  public String getMoney() {
    return money;
  }

  public void setMoney(String money) {
    this.money = money;
  }


  public String getDocUrl() {
    return docUrl;
  }

  public void setDocUrl(String docUrl) {
    this.docUrl = docUrl;
  }

  public BackUser getBackUser() {
    return backUser;
  }

  public void setBackUser(BackUser backUser) {
    this.backUser = backUser;
  }

  public UserInfo getUserInfo() {
    return userInfo;
  }

  public void setUserInfo(UserInfo userInfo) {
    this.userInfo = userInfo;
  }

  public Parameter getStates() {
    return states;
  }

  public void setStates(Parameter states) {
    this.states = states;
  }

  public long getFieldId() {
    return fieldId;
  }

  public void setFieldId(long fieldId) {
    this.fieldId = fieldId;
  }

  public Parameter getField() {
    return field;
  }

  public void setField(Parameter field) {
    this.field = field;
  }
}
