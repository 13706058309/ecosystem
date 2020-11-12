package com.cykj.entity;

/**
 * 简历
 */
public class Resume {

  private long resumeId;
  private long userId;
  private String realName;
  private String clan;
  private String phone;
  private String politicalStatus;
  private String birthday;
  private String contactInfo;
  private String school;
  private String education;
  private long professionId;
  private String wrokYear;
  private String qualiCer;
  private String selfEva;
  private long isShow;
  private String address;
  private java.sql.Date updateTime;
  private long isGraduate;

  public Resume() {
  }

  public long getResumeId() {
    return resumeId;
  }

  public void setResumeId(long resumeId) {
    this.resumeId = resumeId;
  }


  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }


  public String getRealName() {
    return realName;
  }

  public void setRealName(String realName) {
    this.realName = realName;
  }


  public String getClan() {
    return clan;
  }

  public void setClan(String clan) {
    this.clan = clan;
  }


  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }


  public String getPoliticalStatus() {
    return politicalStatus;
  }

  public void setPoliticalStatus(String politicalStatus) {
    this.politicalStatus = politicalStatus;
  }


  public String getBirthday() {
    return birthday;
  }

  public void setBirthday(String birthday) {
    this.birthday = birthday;
  }


  public String getContactInfo() {
    return contactInfo;
  }

  public void setContactInfo(String contactInfo) {
    this.contactInfo = contactInfo;
  }


  public String getSchool() {
    return school;
  }

  public void setSchool(String school) {
    this.school = school;
  }


  public String getEducation() {
    return education;
  }

  public void setEducation(String education) {
    this.education = education;
  }


  public long getProfessionId() {
    return professionId;
  }

  public void setProfessionId(long professionId) {
    this.professionId = professionId;
  }


  public String getWrokYear() {
    return wrokYear;
  }

  public void setWrokYear(String wrokYear) {
    this.wrokYear = wrokYear;
  }


  public String getQualiCer() {
    return qualiCer;
  }

  public void setQualiCer(String qualiCer) {
    this.qualiCer = qualiCer;
  }


  public String getSelfEva() {
    return selfEva;
  }

  public void setSelfEva(String selfEva) {
    this.selfEva = selfEva;
  }


  public long getIsShow() {
    return isShow;
  }

  public void setIsShow(long isShow) {
    this.isShow = isShow;
  }


  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }


  public java.sql.Date getUpdateTime() {
    return updateTime;
  }

  public void setUpdateTime(java.sql.Date updateTime) {
    this.updateTime = updateTime;
  }


  public long getIsGraduate() {
    return isGraduate;
  }

  public void setIsGraduate(long isGraduate) {
    this.isGraduate = isGraduate;
  }

}
