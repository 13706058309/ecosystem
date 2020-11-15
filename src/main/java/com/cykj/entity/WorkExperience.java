package com.cykj.entity;

/**
 * 工作经验
 */
public class WorkExperience {

  private long weId;
  private String companyName;
  private String companyTrade;
  private String companyPost;
  private String beginTime;
  private String endTime;
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


  public String getBeginTime() {
    return beginTime;
  }

  public void setBeginTime(String beginTime) {
    this.beginTime = beginTime;
  }

  public String getEndTime() {
    return endTime;
  }

  public void setEndTime(String endTime) {
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
