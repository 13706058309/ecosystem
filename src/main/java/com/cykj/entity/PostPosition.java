package com.cykj.entity;

import com.cykj.utils.MyUtil;

import java.util.Date;
import java.util.List;

/**
 * 发布岗位表
 */
public class PostPosition {

  private long pPostId;//主键ID
  private long companyId;//公司ID
  private String postName;//岗位名称
  private String workNature;//工作性质
  private long postId;//岗位ID
  private String department;//部门
  private long maxSalary;//最高工资
  private long minSalary;//最低工资
  private String workCity;//工资城市
  private String workYear;//工资省份
  private String education;//学历
  private String jobBenefits;//工资福利
  private String jobDescription;//工资描述
  private long postStandId;//发聘岗位状态
  private String releaseTime;//发布时间
  private String recruitsNum;//招收人数
  private String province;//省份
  private String detailAddress;//详细地址
  private String contact;//联系方式
  private String contactEmail;//联系邮箱
  private BackUser backUser;
  private List<Industry> industryList;


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

  public List<Industry> getIndustryList() {
    return industryList;
  }

  public void setIndustryList(List<Industry> industryList) {
    this.industryList = industryList;
  }

  public long getpPostId() {
    return pPostId;
  }

  public void setpPostId(long pPostId) {
    this.pPostId = pPostId;
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

  public void setReleaseTime(String releaseTime) {
    this.releaseTime = releaseTime;
  }

  public BackUser getBackUser() {
    return backUser;
  }

  public void setBackUser(BackUser backUser) {
    this.backUser = backUser;
  }



}
