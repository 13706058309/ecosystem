package com.cykj.entity;


public class Unit {

  private long unitId;//章节ID
  private String unitName;//章节名
  private String videoUrl;//播放链接
  private String timeLength;//时长
  private long playTimes;//播放量
  private long preUnitId;//前一章节ID
  private long courseId;//所属课程Id


  public long getUnitId() {
    return unitId;
  }

  public void setUnitId(long unitId) {
    this.unitId = unitId;
  }


  public String getUnitName() {
    return unitName;
  }

  public void setUnitName(String unitName) {
    this.unitName = unitName;
  }


  public String getVideoUrl() {
    return videoUrl;
  }

  public void setVideoUrl(String videoUrl) {
    this.videoUrl = videoUrl;
  }


  public String getTimeLength() {
    return timeLength;
  }

  public void setTimeLength(String timeLength) {
    this.timeLength = timeLength;
  }


  public long getPlayTimes() {
    return playTimes;
  }

  public void setPlayTimes(long playTimes) {
    this.playTimes = playTimes;
  }


  public long getPreUnitId() {
    return preUnitId;
  }

  public void setPreUnitId(long preUnitId) {
    this.preUnitId = preUnitId;
  }


  public long getCourseId() {
    return courseId;
  }

  public void setCourseId(long courseId) {
    this.courseId = courseId;
  }

}
