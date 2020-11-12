package com.cykj.entity;

/**
 * 项目经历
 */
public class ProjectExperience {

  private long peId;
  private String proName;
  private String proPost;
  private String proBeginTime;
  private String proEndTime;
  private String proDescription;
  private String proPerformance;

  public ProjectExperience() {
  }

  public long getPeId() {
    return peId;
  }

  public void setPeId(long peId) {
    this.peId = peId;
  }


  public String getProName() {
    return proName;
  }

  public void setProName(String proName) {
    this.proName = proName;
  }

  public String getProPost() {
    return proPost;
  }

  public void setProPost(String proPost) {
    this.proPost = proPost;
  }

  public String getProDescription() {
    return proDescription;
  }

  public void setProDescription(String proDescription) {
    this.proDescription = proDescription;
  }


  public String getProPerformance() {
    return proPerformance;
  }

  public void setProPerformance(String proPerformance) {
    this.proPerformance = proPerformance;
  }

}
