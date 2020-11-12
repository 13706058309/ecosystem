package com.cykj.entity;

import org.springframework.stereotype.Component;

/**
 * 前台用户
 */
@Component
public class UserInfo {

  private long userId; //用户Id
  private String userName; //用户名
  private String account; //账号
  private String pwd; //密码
  private String telephone; //手机号码
  private long accStandId; // 账号状态
  private long jobStandId; //就业状态
  private String address; //地址
  private long isOpen; // 是否公开
  private String industry; //意向行业

  public UserInfo() {

  }

  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }


  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }


  public String getAccount() {
    return account;
  }

  public void setAccount(String account) {
    this.account = account;
  }


  public String getPwd() {
    return pwd;
  }

  public void setPwd(String pwd) {
    this.pwd = pwd;
  }


  public String getTelephone() {
    return telephone;
  }

  public void setTelephone(String telephone) {
    this.telephone = telephone;
  }


  public long getAccStandId() {
    return accStandId;
  }

  public void setAccStandId(long accStandId) {
    this.accStandId = accStandId;
  }


  public long getJobStandId() {
    return jobStandId;
  }

  public void setJobStandId(long jobStandId) {
    this.jobStandId = jobStandId;
  }


  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }


  public long getIsOpen() {
    return isOpen;
  }

  public void setIsOpen(long isOpen) {
    this.isOpen = isOpen;
  }


  public String getIndustry() {
    return industry;
  }

  public void setIndustry(String industry) {
    this.industry = industry;
  }

}
