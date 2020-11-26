package com.cykj.entity;


public class CourseAppraise {

  private long courseAppraiseId;
  private long courseId;
  private long userId;
  private String appraiseText;
  private String appraiseTime;

  private UserInfo userInfo;


  public long getCourseAppraiseId() {
    return courseAppraiseId;
  }

  public void setCourseAppraiseId(long courseAppraiseId) {
    this.courseAppraiseId = courseAppraiseId;
  }


  public long getCourseId() {
    return courseId;
  }

  public void setCourseId(long courseId) {
    this.courseId = courseId;
  }


  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }


  public String getAppraiseText() {
    return appraiseText;
  }

  public void setAppraiseText(String appraiseText) {
    this.appraiseText = appraiseText;
  }


  public String getAppraiseTime() {
    return appraiseTime;
  }

  public void setAppraiseTime(String appraiseTime) {
    this.appraiseTime = appraiseTime;
  }

  public UserInfo getUserInfo() {
    return userInfo;
  }

  public void setUserInfo(UserInfo userInfo) {
    this.userInfo = userInfo;
  }
}
