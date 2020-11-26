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
  private Parameter states; //用户状态
  private long jobStandId; //就业状态

  private String address; //地址
  private long isOpen; // 是否公开

  private String headImgUrl; //用户头像路径

  private String regTime;//注册时间

  public UserInfo() {

  }

  public String getRegTime() {
    return regTime;
  }

  public void setRegTime(String regTime) {
    this.regTime = regTime;
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

  @Override
  public String toString() {
    return "UserInfo{" +
            "userId=" + userId +
            ", userName='" + userName + '\'' +
            ", account='" + account + '\'' +
            ", pwd='" + pwd + '\'' +
            ", telephone='" + telephone + '\'' +
            ", accStandId=" + accStandId +
            ", states=" + states +
            ", jobStandId=" + jobStandId +
            ", address='" + address + '\'' +
            ", isOpen=" + isOpen +
            ", regTime='" + regTime + '\'' +
            '}';
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




  public Parameter getStates() {
    return states;
  }

  public void setStates(Parameter states) {
    this.states = states;
  }

  public String getHeadImgUrl() {
    return headImgUrl;
  }

  public void setHeadImgUrl(String headImgUrl) {
    this.headImgUrl = headImgUrl;
  }
}
