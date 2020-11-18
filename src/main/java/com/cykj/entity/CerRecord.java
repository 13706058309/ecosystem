package com.cykj.entity;


/**
 * 证书申请记录
 */
public class CerRecord {

  private long cerRecordId;  //记录ID
  private long userId; //用户ID
  private UserInfo user; //用户实体类
  private long fileId; //领域ID
  private Field field; //领域实体类
  private long stateId; //状态ID
  private Parameter state; //实体类状态
  private String docUrl; //提交的项目路径
  private String trueName; //真实姓名
  private String idNumber; //身份证号码
  private String beginTime; //申请时间
  private int cerPhone;//联系号码

  public CerRecord() {
  }

  public int getCerPhone() {
    return cerPhone;
  }

  public void setCerPhone(int cerPhone) {
    this.cerPhone = cerPhone;
  }

  public long getCerRecordId() {
    return cerRecordId;
  }

  public void setCerRecordId(long cerRecordId) {
    this.cerRecordId = cerRecordId;
  }


  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }

  public UserInfo getUser() {
    return user;
  }

  public void setUser(UserInfo user) {
    this.user = user;
  }

  public Field getField() {
    return field;
  }

  public void setField(Field field) {
    this.field = field;
  }

  public Parameter getState() {
    return state;
  }

  public String getBeginTime() {
    return beginTime;
  }

  public void setState(Parameter state) {
    this.state = state;
  }

  public void setBeginTime(String beginTime) {
    this.beginTime = beginTime;
  }

  public long getFileId() {
    return fileId;
  }

  public void setFileId(long fileId) {
    this.fileId = fileId;
  }


  public long getStateId() {
    return stateId;
  }

  public void setStateId(long stateId) {
    this.stateId = stateId;
  }


  public String getDocUrl() {
    return docUrl;
  }

  public void setDocUrl(String docUrl) {
    this.docUrl = docUrl;
  }


  public String getTrueName() {
    return trueName;
  }

  public void setTrueName(String trueName) {
    this.trueName = trueName;
  }


  public String getIdNumber() {
    return idNumber;
  }

  public void setIdNumber(String idNumber) {
    this.idNumber = idNumber;
  }
}


