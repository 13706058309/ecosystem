package com.cykj.entity;

/**
 *
 */
public class PostCellec {

  private long postCellecId;
  private long userId;
  private long pPostId;
  private String collecTime;


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

  public void setCollecTime(String collecTime) {
    this.collecTime = collecTime;
  }
}
