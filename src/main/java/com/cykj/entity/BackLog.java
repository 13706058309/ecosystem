package com.cykj.entity;

import org.springframework.stereotype.Component;

import com.cykj.utils.MyUtil;

import java.util.Date;

/**
 * 后台用户日志
 */
@Component
public class BackLog {

  private long bLogId;   //ID
  private long bUserId; //后台用户Id
  private BackUser backUser; //后台用户
  private String operaTime; //操作时间
  private String matter; //操作事件


  public BackLog() {
  }

  public long getbLogId() {
    return bLogId;
  }

  public void setbLogId(long bLogId) {
    this.bLogId = bLogId;
  }

  public long getbUserId() {
    return bUserId;
  }

  public void setbUserId(long bUserId) {
    this.bUserId = bUserId;
  }

  public BackUser getBackUser() {
    return backUser;
  }

  public void setBackUser(BackUser backUser) {
    this.backUser = backUser;
  }

  public String getOperaTime() {
    return operaTime;
  }

  public void setOperaTime(String operaTime) {
    this.operaTime = operaTime;
  }

  public String getMatter() {
    return matter;
  }

  public void setMatter(String matter) {
    this.matter = matter;
  }

  @Override
  public String toString() {
    return "BackLog{" +
            "bLogId=" + bLogId +
            ", bUserID=" + bUserId +
            ", backUser=" + backUser +
            ", operaTime='" + operaTime + '\'' +
            ", matter='" + matter + '\'' + '\'' +
            '}';
  }
}
