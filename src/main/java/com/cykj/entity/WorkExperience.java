package com.cykj.entity;

/**
 * 工作经验
 */
public class WorkExperience {

  private long weId;
  private String companyName;
  private String companyTrade;
  private String companyPost;
  private java.sql.Date beginTime;
  private java.sql.Date endTime;
  private String duties;
  private String performance;

  public WorkExperience() {
  }

  public long getWeId() {
    return weId;
  }

  public void setWeId(long weId) {
    this.weId = weId;
  }


  public String getCompanyName() {
    return companyName;
  }

  public void setCompanyName(String companyName) {
    this.companyName = companyName;
  }


  public String getCompanyTrade() {
    return companyTrade;
  }

  public void setCompanyTrade(String companyTrade) {
    this.companyTrade = companyTrade;
  }


  public String getCompanyPost() {
    return companyPost;
  }

  public void setCompanyPost(String companyPost) {
    this.companyPost = companyPost;
  }


  public java.sql.Date getBeginTime() {
    return beginTime;
  }

  public void setBeginTime(java.sql.Date beginTime) {
    this.beginTime = beginTime;
  }


  public java.sql.Date getEndTime() {
    return endTime;
  }

  public void setEndTime(java.sql.Date endTime) {
    this.endTime = endTime;
  }


  public String getDuties() {
    return duties;
  }

  public void setDuties(String duties) {
    this.duties = duties;
  }


  public String getPerformance() {
    return performance;
  }

  public void setPerformance(String performance) {
    this.performance = performance;
  }

}
