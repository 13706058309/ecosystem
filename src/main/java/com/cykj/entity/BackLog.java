package com.cykj.entity;

import com.cykj.utils.MyUtil;

import java.util.Date;

/**
 * 后台用户日志
 */
public class BackLog {

  private long bLogId;   //ID
  private long bUserID; //后台用户Id
  private BackUser backUser; //后台用户
  private String operaTime; //操作时间
  private String matter; //操作事件


  public BackLog() {
  }

  public long getBLogId() {
    return bLogId;
  }

  public void setBLogId(long bLogId) {
    this.bLogId = bLogId;
  }


  public BackUser getBUserId() {
    return backUser;
  }

  public void setBUserId(BackUser backUser) {
    this.backUser = backUser;
  }

  public long getbUserID() {
    return bUserID;
  }

  public void setbUserID(long bUserID) {
    this.bUserID = bUserID;
  }

  public String getOperaTime() {
    return operaTime;
  }

  public long getbLogId() {
    return bLogId;
  }

  public void setbLogId(long bLogId) {
    this.bLogId = bLogId;
  }

  public BackUser getBackUser() {
    return backUser;
  }

  public void setBackUser(BackUser backUser) {
    this.backUser = backUser;
  }

  public void setOperaTime(Date operaTime) {
    this.operaTime = MyUtil.getDetailFoatTime(operaTime);
  }


  public String getMatter() {
    return matter;
  }

  public void setMatter(String matter) {
    this.matter = matter;
  }

}
