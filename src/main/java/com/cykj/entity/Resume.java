package com.cykj.entity;

import java.util.List;

/**
 * 简历
 */
public class Resume {

  private long resumeId;
  private long userId;
  private String realName;
  private String clan;
  private String photo;
  private String politicalStatus;
  private String birthday;
  private String contactInfo;
  private String school;
  private long educationId;
  private String profession;
  private String wrokYear;
  private String qualiCer;
  private String selfEva;
  private long isShow;
  private String address;
  private java.sql.Date updateTime;
  private long isGraduate;
  private long jobStandId; //就业状态
  private String industry; //意向行业
  private String sex;
  private String expectWork;

  private Education education;
  private List<EducationalBackground> educationalBackgrounds;
  private List<WorkExperience> workExperiences;
  private List<ProjectExperience> projectExperiences;

  public Resume() {
  }

  public String getExpectWork() {
    return expectWork;
  }

  public void setExpectWork(String expectWork) {
    this.expectWork = expectWork;
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

  public String getSex() {
    return sex;
  }

  public void setSex(String sex) {
    this.sex = sex;
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


  public String getPhoto() {
    return photo;
  }

  public void setPhoto(String photo) {
    this.photo = photo;
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

  public long getEducationId() {
    return educationId;
  }

  public void setEducationId(long educationId) {
    this.educationId = educationId;
  }

  public String getProfession() {
    return profession;
  }

  public void setProfession(String profession) {
    this.profession = profession;
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

  public long getJobStandId() {
    return jobStandId;
  }

  public void setJobStandId(long jobStandId) {
    this.jobStandId = jobStandId;
  }

  public String getIndustry() {
    return industry;
  }

  public void setIndustry(String industry) {
    this.industry = industry;
  }

  public Education getEducation() {
    return education;
  }

  public void setEducation(Education education) {
    this.education = education;
  }

  public List<EducationalBackground> getEducationalBackgrounds() {
    return educationalBackgrounds;
  }

  public void setEducationalBackgrounds(List<EducationalBackground> educationalBackgrounds) {
    this.educationalBackgrounds = educationalBackgrounds;
  }

  public List<WorkExperience> getWorkExperiences() {
    return workExperiences;
  }

  public void setWorkExperiences(List<WorkExperience> workExperiences) {
    this.workExperiences = workExperiences;
  }

  public List<ProjectExperience> getProjectExperiences() {
    return projectExperiences;
  }

  public void setProjectExperiences(List<ProjectExperience> projectExperiences) {
    this.projectExperiences = projectExperiences;
  }
}
