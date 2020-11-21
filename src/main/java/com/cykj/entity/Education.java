package com.cykj.entity;

/**
 * 专业
 */
public class Education {

  private long educationId;//学历ID
  private String education;//学历名称

  public Education() {
  }

  public long getEducationId() {
    return educationId;
  }

  public void setEducationId(long educationId) {
    this.educationId = educationId;
  }

  public String getEducation() {
    return education;
  }

  public void setEducation(String education) {
    this.education = education;
  }
}
