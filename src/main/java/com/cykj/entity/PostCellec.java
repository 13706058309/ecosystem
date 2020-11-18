package com.cykj.entity;

import com.cykj.utils.MyUtil;

import java.util.Date;

/**
 *岗位收藏
 */
public class PostCellec {

  private long postCellecId;//主键ID
  private long userId;//用户ID
  private long pPostId;//收藏岗位的ID
  private String collecTime;//收藏时间


  public long getPostCellecId() {
    return postCellecId;
  }

  public void setPostCellecId(long postCellecId) {
    this.postCellecId = postCellecId;
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

  public long getpPostId() {
    return pPostId;
  }

  public void setpPostId(long pPostId) {
    this.pPostId = pPostId;
  }

  public String getCollecTime() {
    return collecTime;
  }

  public void setCollecTime(Date collecTime) {
    this.collecTime = MyUtil.getFoatTime(collecTime);
  }
}
