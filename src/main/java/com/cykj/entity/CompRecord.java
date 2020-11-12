package com.cykj.entity;

/**
 * 公司记录
 */
public class CompRecord {

  private long compRecId;
  private long userId;
  private long companyId;
  private String recored;
  private String recoredTime;

  public CompRecord() {
  }

  public long getCompRecId() {
    return compRecId;
  }

  public void setCompRecId(long compRecId) {
    this.compRecId = compRecId;
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

  public void setRecoredTime(String recoredTime) {
    this.recoredTime = recoredTime;
  }
}
