package com.cykj.entity;

import com.cykj.utils.MyUtil;

import java.util.Date;

/**
 * 投递简历
 */
public class Delivery {

  private long deliveryId;//主键ID
  private long userId;//用户ID
  private long pPostId;//招聘岗位ID
  private long deliStandId;//投递简历的状态
  private String feedBackInfo;//反馈的消息
  private String feedBackTime;//反馈时间
  private long isRead;//是否读过
  private String deliTime;//投递时间


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


  public String getFeedBackTime() {
    return feedBackTime;
  }

  public void setFeedBackTime(String feedBackTime) {
    this.feedBackTime = feedBackTime;
  }

  public long getIsRead() {
    return isRead;
  }

  public void setIsRead(long isRead) {
    this.isRead = isRead;
  }

  public String getDeliTime() {
    return deliTime;
  }

  public void setDeliTime(Date deliTime) {
    this.deliTime = MyUtil.getFoatTime(deliTime);
  }
}
