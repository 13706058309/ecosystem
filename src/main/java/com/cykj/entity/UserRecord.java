package com.cykj.entity;

import com.cykj.utils.MyUtil;

import java.util.Date;

/**
 * 用户聊天记录
 */
public class UserRecord {

  private long userRecId;
  private long userId;
  private long companyId;
  private String recored;
  private String recoredTime;

  public UserRecord() {
  }

  public long getUserRecId() {
    return userRecId;
  }

  public void setUserRecId(long userRecId) {
    this.userRecId = userRecId;
  }


  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }


  public long getCompanyId() {
    return companyId;
  }

  public void setCompanyId(long companyId) {
    this.companyId = companyId;
  }


  public String getRecored() {
    return recored;
  }

  public void setRecored(String recored) {
    this.recored = recored;
  }


  public String getRecoredTime() {
    return recoredTime;
  }

  public void setRecoredTime(Date recoredTime) {
    this.recoredTime = MyUtil.getDetailFoatTime(recoredTime);
  }
}
