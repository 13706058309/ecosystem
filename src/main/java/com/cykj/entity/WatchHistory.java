package com.cykj.entity;


/**
 * 观看历史
 */
public class WatchHistory {

  private long courseId;
  private long historyId;
  private long userId;
  private java.sql.Date wacthTime;

  public WatchHistory() {
  }

  public long getCourseId() {
    return courseId;
  }

  public void setCourseId(long courseId) {
    this.courseId = courseId;
  }


  public long getHistoryId() {
    return historyId;
  }

  public void setHistoryId(long historyId) {
    this.historyId = historyId;
  }


  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }


  public java.sql.Date getWacthTime() {
    return wacthTime;
  }

  public void setWacthTime(java.sql.Date wacthTime) {
    this.wacthTime = wacthTime;
  }

}
