package com.cykj.entity;

/**
 * 章节评论
 */
public class UnitAppraise {

  private long unitAppraiseId; //Id
  private long unitId;  //章节Id
  private long userId; //userId
  private UserInfo userInfo; //用户
  private String appraiseValue;
  private String appraiseTime;

  public UnitAppraise() {
  }

  public long getUnitAppraiseId() {
    return unitAppraiseId;
  }

  public void setUnitAppraiseId(long unitAppraiseId) {
    this.unitAppraiseId = unitAppraiseId;
  }


  public long getUnitId() {
    return unitId;
  }

  public void setUnitId(long unitId) {
    this.unitId = unitId;
  }

  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }


  public String getAppraiseValue() {
    return appraiseValue;
  }

  public void setAppraiseValue(String appraiseValue) {
    this.appraiseValue = appraiseValue;
  }

  public UserInfo getUserInfo() {
    return userInfo;
  }

  public void setUserInfo(UserInfo userInfo) {
    this.userInfo = userInfo;
  }

  public String getAppraiseTime() {
    return appraiseTime;
  }

  public void setAppraiseTime(String appraiseTime) {
    this.appraiseTime = appraiseTime;
  }
}
