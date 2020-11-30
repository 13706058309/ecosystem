package com.cykj.entity;


import java.util.Date;

public class PayRecord {

  private long payId;
  private long score;
  private long compId;
  private String detail;
  private String state;
  private Date happenTime;

  public PayRecord() {
  }

  public PayRecord(long score, long compId, String detail, String state) {
    this.score = score;
    this.compId = compId;
    this.detail = detail;
    this.state = state;
  }

  public long getPayId() {
    return payId;
  }

  public void setPayId(long payId) {
    this.payId = payId;
  }


  public long getScore() {
    return score;
  }

  public void setScore(long score) {
    this.score = score;
  }


  public long getCompId() {
    return compId;
  }

  public void setCompId(long compId) {
    this.compId = compId;
  }


  public String getDetail() {
    return detail;
  }

  public void setDetail(String detail) {
    this.detail = detail;
  }


  public String getState() {
    return state;
  }

  public void setState(String state) {
    this.state = state;
  }


  public Date getHappenTime() {
    return happenTime;
  }

  public void setHappenTime(Date happenTime) {
    this.happenTime = happenTime;
  }
}
