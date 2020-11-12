package com.cykj.entity;

/**
 * 教育背景
 */
public class EducationalBackground {

  private long ebId;
  private String school;
  private String major;
  private String education;
  private String schBeginTime;
  private String schEndTime;
  private String schExperience;


  public long getEbId() {
    return ebId;
  }

  public void setEbId(long ebId) {
    this.ebId = ebId;
  }


  public String getSchool() {
    return school;
  }

  public void setSchool(String school) {
    this.school = school;
  }


  public String getMajor() {
    return major;
  }

  public void setMajor(String major) {
    this.major = major;
  }


  public String getEducation() {
    return education;
  }

  public void setEducation(String education) {
    this.education = education;
  }

  public void setSchBeginTime(String schBeginTime) {
    this.schBeginTime = schBeginTime;
  }

  public void setSchEndTime(String schEndTime) {
    this.schEndTime = schEndTime;
  }


  public String getSchExperience() {
    return schExperience;
  }

  public void setSchExperience(String schExperience) {
    this.schExperience = schExperience;
  }

}
