package com.cykj.entity;

/**
 * 用户获取的证书记录
 */
public class CerUser {

  private long cuid;//主键ID
  private long cerId; //记录Id
  private CerRecord cerRecord;//申请证书记录
  private String gainTime; //获取时间
  private long bUserId; //审核人
  private BackUser backUser;  //审核人
  private long userId; //获取人Id
  private UserInfo user;  //获取人
  private String name;//证书名
  private String url;//证书路径

  public CerUser() {
  }

  public long getCuid() {
    return cuid;
  }

  public void setCuid(long cuid) {
    this.cuid = cuid;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getUrl() {
    return url;
  }

  public void setUrl(String url) {
    this.url = url;
  }

  public CerRecord getCerRecord() {
    return cerRecord;
  }

  public void setCerRecord(CerRecord cerRecord) {
    this.cerRecord = cerRecord;
  }


  public long getCerId() {
    return cerId;
  }

  public void setCerId(long cerId) {
    this.cerId = cerId;
  }


  public String getGainTime() {
    return gainTime;
  }

  public void setGainTime(String gainTime) {
    this.gainTime = gainTime;
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


  public UserInfo getUser() {
    return user;
  }

  public void setUser(UserInfo user) {
    this.user = user;
  }

  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }

}
