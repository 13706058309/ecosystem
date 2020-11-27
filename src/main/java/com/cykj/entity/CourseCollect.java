package com.cykj.entity;


/**
 * 课程收藏
 */
public class CourseCollect {
  private long collectId; //主键Id
  private long courseId; //收藏的课程Id
  private long userId; //收藏人Id
//  private UserInfo user; //收藏人
  private String collectTime; //收藏时间


  public long getCollectId() {
    return collectId;
  }

  public void setCollectId(long collectId) {
    this.collectId = collectId;
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

//  public UserInfo getUser() {
//    return user;
//  }
//
//  public void setUser(UserInfo user) {
//    this.user = user;
//  }

  public String getCollectTime() {
    return collectTime;
  }

  public void setCollectTime(String collectTime) {
    this.collectTime = collectTime;
  }
}
