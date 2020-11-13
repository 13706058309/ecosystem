package com.cykj.entity;

/**
 * 教育背景
 */
public class EducationalBackground {

  private long ebId;
  private String ebSchool;
  private String major;
  private String ebEducation;
  private String schBeginTime;
  private String schEndTime;
  private String schExperience;


  public long getEbId() {
    return ebId;
  }

  public void setEbId(long ebId) {
    this.ebId = ebId;
  }

  public String getSchBeginTime() {
    return schBeginTime;
  }

  public String getSchEndTime() {
    return schEndTime;
  }

  public String getEbSchool() {
    return ebSchool;
  }

  public void setEbSchool(String ebSchool) {
    this.ebSchool = ebSchool;
  }

  public String getEbEducation() {
    return ebEducation;
  }

  public void setEbEducation(String ebEducation) {
    this.ebEducation = ebEducation;
  }

  public String getMajor() {
    return major;
  }

  public void setMajor(String major) {
    this.major = major;
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
