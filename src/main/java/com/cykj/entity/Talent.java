package com.cykj.entity;

import java.util.Date;

/**
 *人才表
 */
public class Talent {

  private long talentId;
  private String talentName;
  private String school;
  private String birthday;
  private String contactInfo;
  private String profession;
  private String politicalStatus;
  private String workExp;
  private String jobPlan;
  private String selfEva;
  private String education;
  private String entryTime;
  private CompAndtalent compAndtalent;

  public Talent() {
  }

  public long getTalentId() {
    return talentId;
  }

  public void setTalentId(long talentId) {
    this.talentId = talentId;
  }


  public String getTalentName() {
    return talentName;
  }

  public void setTalentName(String talentName) {
    this.talentName = talentName;
  }


  public String getSchool() {
    return school;
  }

  public void setSchool(String school) {
    this.school = school;
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


  public String getProfession() {
    return profession;
  }

  public void setProfession(String profession) {
    this.profession = profession;
  }


  public String getPoliticalStatus() {
    return politicalStatus;
  }

  public void setPoliticalStatus(String politicalStatus) {
    this.politicalStatus = politicalStatus;
  }


  public String getWorkExp() {
    return workExp;
  }

  public void setWorkExp(String workExp) {
    this.workExp = workExp;
  }


  public String getJobPlan() {
    return jobPlan;
  }

  public void setJobPlan(String jobPlan) {
    this.jobPlan = jobPlan;
  }


  public String getSelfEva() {
    return selfEva;
  }

  public void setSelfEva(String selfEva) {
    this.selfEva = selfEva;
  }

  public String getEntryTime() {
    return entryTime;
  }

  public void setEntryTime(String entryTime) {
    this.entryTime = entryTime;
  }

  public String getEducation() {
    return education;
  }

  public void setEducation(String education) {
    this.education = education;
  }

  public CompAndtalent getCompAndtalent() {
    return compAndtalent;
  }

  public void setCompAndtalent(CompAndtalent compAndtalent) {
    this.compAndtalent = compAndtalent;
  }

  @Override
  public String toString() {
    return "Talent{" +
            "talentId=" + talentId +
            ", talentName='" + talentName + '\'' +
            ", school='" + school + '\'' +
            ", birthday='" + birthday + '\'' +
            ", contactInfo='" + contactInfo + '\'' +
            ", profession='" + profession + '\'' +
            ", politicalStatus='" + politicalStatus + '\'' +
            ", workExp='" + workExp + '\'' +
            ", jobPlan='" + jobPlan + '\'' +
            ", selfEva='" + selfEva + '\'' +
            ", education='" + education + '\'' +
            ", entryTime=" + entryTime +
            ", compAndtalent=" + compAndtalent +
            '}';
  }
}
