package com.cykj.entity;

/**
 * 投递简历
 */
public class Delivery {

  private long deliveryId;
  private long userId;
  private long pPostId;
  private long deliStandId;
  private String feedBackInfo;
  private java.sql.Date feedBackTime;
  private long isRead;


  public long getDeliveryId() {
    return deliveryId;
  }

  public void setDeliveryId(long deliveryId) {
    this.deliveryId = deliveryId;
  }


  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }


  public long getPPostId() {
    return pPostId;
  }

  public void setPPostId(long pPostId) {
    this.pPostId = pPostId;
  }


  public long getDeliStandId() {
    return deliStandId;
  }

  public void setDeliStandId(long deliStandId) {
    this.deliStandId = deliStandId;
  }


  public String getFeedBackInfo() {
    return feedBackInfo;
  }

  public void setFeedBackInfo(String feedBackInfo) {
    this.feedBackInfo = feedBackInfo;
  }


  public java.sql.Date getFeedBackTime() {
    return feedBackTime;
  }

  public void setFeedBackTime(java.sql.Date feedBackTime) {
    this.feedBackTime = feedBackTime;
  }


  public long getIsRead() {
    return isRead;
  }

  public void setIsRead(long isRead) {
    this.isRead = isRead;
  }

}
