package com.cykj.entity;

import com.cykj.utils.MyUtil;

import java.util.Date;

/**
 * 发布岗位表
 */
public class PostPosition {

  private long pPostId;
  private long companyId;
  private String postName;
  private String workNature;
  private long postId;
  private String department;
  private long maxSalary;
  private long minSalary;
  private String workCity;
  private String workYear;
  private String education;
  private String jobBenefits;
  private String jobDescription;
  private long postStandId;
  private String releaseTime;
  private String recruitsNum;
  private String province;
  private String detailAddress;
  private String contact;
  private String contactEmail;


  @Override
  public String toString() {
    return "PostPosition{" +
            "pPostId=" + pPostId +
            ", companyId=" + companyId +
            ", postName='" + postName + '\'' +
            ", workNature='" + workNature + '\'' +
            ", postId=" + postId +
            ", department='" + department + '\'' +
            ", maxSalary=" + maxSalary +
            ", minSalary=" + minSalary +
            ", workCity='" + workCity + '\'' +
            ", workYear='" + workYear + '\'' +
            ", education='" + education + '\'' +
            ", jobBenefits='" + jobBenefits + '\'' +
            ", jobDescription='" + jobDescription + '\'' +
            ", postStandId=" + postStandId +
            ", releaseTime='" + releaseTime + '\'' +
            ", recruitsNum='" + recruitsNum + '\'' +
            ", province='" + province + '\'' +
            ", detailAddress='" + detailAddress + '\'' +
            ", contact='" + contact + '\'' +
            ", contactEmail='" + contactEmail + '\'' +
            '}';
  }

  public PostPosition() {
  }

  public long getPPostId() {
    return pPostId;
  }

  public void setPPostId(long pPostId) {
    this.pPostId = pPostId;
  }


  public long getCompanyId() {
    return companyId;
  }

  public void setCompanyId(long companyId) {
    this.companyId = companyId;
  }


  public String getPostName() {
    return postName;
  }

  public void setPostName(String postName) {
    this.postName = postName;
  }


  public String getWorkNature() {
    return workNature;
  }

  public void setWorkNature(String workNature) {
    this.workNature = workNature;
  }


  public long getPostId() {
    return postId;
  }

  public void setPostId(long postId) {
    this.postId = postId;
  }


  public String getDepartment() {
    return department;
  }

  public void setDepartment(String department) {
    this.department = department;
  }


  public long getMaxSalary() {
    return maxSalary;
  }

  public void setMaxSalary(long maxSalary) {
    this.maxSalary = maxSalary;
  }


  public long getMinSalary() {
    return minSalary;
  }

  public void setMinSalary(long minSalary) {
    this.minSalary = minSalary;
  }


  public String getWorkCity() {
    return workCity;
  }

  public void setWorkCity(String workCity) {
    this.workCity = workCity;
  }


  public String getWorkYear() {
    return workYear;
  }

  public void setWorkYear(String workYear) {
    this.workYear = workYear;
  }


  public String getEducation() {
    return education;
  }

  public void setEducation(String education) {
    this.education = education;
  }


  public String getJobBenefits() {
    return jobBenefits;
  }

  public void setJobBenefits(String jobBenefits) {
    this.jobBenefits = jobBenefits;
  }


  public String getJobDescription() {
    return jobDescription;
  }

  public void setJobDescription(String jobDescription) {
    this.jobDescription = jobDescription;
  }


  public long getPostStandId() {
    return postStandId;
  }

  public void setPostStandId(long postStandId) {
    this.postStandId = postStandId;
  }


  public String getReleaseTime() {
    return releaseTime;
  }

  public void setReleaseTime(Date releaseTime) {
    this.releaseTime = MyUtil.getFoatTime(releaseTime);
  }

  public String getRecruitsNum() {
    return recruitsNum;
  }

  public void setRecruitsNum(String recruitsNum) {
    this.recruitsNum = recruitsNum;
  }


  public String getProvince() {
    return province;
  }

  public void setProvince(String province) {
    this.province = province;
  }

  public String getDetailAddress() {
    return detailAddress;
  }

  public void setDetailAddress(String detailAddress) {
    this.detailAddress = detailAddress;
  }

  public String getContact() {
    return contact;
  }

  public void setContact(String contact) {
    this.contact = contact;
  }

  public String getContactEmail() {
    return contactEmail;
  }

  public void setContactEmail(String contactEmail) {
    this.contactEmail = contactEmail;
  }
}
