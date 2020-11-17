package com.cykj.entity;

import java.util.Date;

/**
 *人才表
 */
public class Talent {

  private long talentId;//人才ID
  private String talentName;//名字
  private String school;//学校
  private String birthday;//出生年月日
  private String contactInfo;//联系方式
  private String profession;//专业
  private String politicalStatus;//政治面貌
  private String workExp;//工作经验
  private String jobPlan;//职业规划
  private String selfEva;//自我评价
  private String education;//学历
  private String entryTime;//上传时间
  private String address;//地址
  private String certificate;//技能证书
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

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public String getCertificate() {
    return certificate;
  }

  public void setCertificate(String certificate) {
    this.certificate = certificate;
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
