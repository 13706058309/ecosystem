package com.cykj.entity;

/**
 * 视频审核记录
 */
public class Review {

  private long reviewId;
  private long cerRecordId;
  private long bUserId;
  private String reviewTime;
  private String vedioUrl;
  private double reviewScore;
  private long states;

  public Review() {
  }

  public long getReviewId() {
    return reviewId;
  }

  public void setReviewId(long reviewId) {
    this.reviewId = reviewId;
  }


  public long getCerRecordId() {
    return cerRecordId;
  }

  public void setCerRecordId(long cerRecordId) {
    this.cerRecordId = cerRecordId;
  }


  public long getBUserId() {
    return bUserId;
  }

  public void setBUserId(long bUserId) {
    this.bUserId = bUserId;
  }

  public long getbUserId() {
    return bUserId;
  }

  public void setbUserId(long bUserId) {
    this.bUserId = bUserId;
  }

  public String getReviewTime() {
    return reviewTime;
  }

  public void setReviewTime(String reviewTime) {
    this.reviewTime = reviewTime;
  }

  public String getVedioUrl() {
    return vedioUrl;
  }

  public void setVedioUrl(String vedioUrl) {
    this.vedioUrl = vedioUrl;
  }


  public double getReviewScore() {
    return reviewScore;
  }

  public void setReviewScore(double reviewScore) {
    this.reviewScore = reviewScore;
  }


  public long getStates() {
    return states;
  }

  public void setStates(long states) {
    this.states = states;
  }

}
