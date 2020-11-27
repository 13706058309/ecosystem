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
  private String projectCondition;//申请要求
  private String publishTime; //发布时间
  private long userId;
  private UserInfo userInfo; //承接人实体类
  private long stateId;// 状态Id
  private Parameter states; //状态实体类
  private long money;
  private String docUrl; //需求文件
  private String projectUrl;//项目文件
  private long fieldId;
  private Parameter field;
  private String pOrderNum;
  private long trueMoney;

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

  public long getbUserId() {
    return bUserId;
  }

  public void setbUserId(long bUserId) {
    this.bUserId = bUserId;
  }

  public BackUser getBackUser() {
    return backUser;
  }

  public void setBackUser(BackUser backUser) {
    this.backUser = backUser;
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

  public String getProjectCondition() {
    return projectCondition;
  }

  public void setProjectCondition(String projectCondition) {
    this.projectCondition = projectCondition;
  }

  public String getPublishTime() {
    return publishTime;
  }

  public void setPublishTime(String publishTime) {
    this.publishTime = publishTime;
  }

  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }

  public UserInfo getUserInfo() {
    return userInfo;
  }

  public void setUserInfo(UserInfo userInfo) {
    this.userInfo = userInfo;
  }

  public long getStateId() {
    return stateId;
  }

  public void setStateId(long stateId) {
    this.stateId = stateId;
  }

  public Parameter getStates() {
    return states;
  }

  public void setStates(Parameter states) {
    this.states = states;
  }

  public long getMoney() {
    return money;
  }

  public void setMoney(long money) {
    this.money = money;
  }

  public String getDocUrl() {
    return docUrl;
  }

  public void setDocUrl(String docUrl) {
    this.docUrl = docUrl;
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

  public String getpOrderNum() {
    return pOrderNum;
  }

  public void setpOrderNum(String pOrderNum) {
    this.pOrderNum = pOrderNum;
  }

  public long getTrueMoney() {
    return trueMoney;
  }

  public void setTrueMoney(long trueMoney) {
    this.trueMoney = trueMoney;
  }

  public String getProjectUrl() {
    return projectUrl;
  }

  public void setProjectUrl(String projectUrl) {
    this.projectUrl = projectUrl;
  }
}
