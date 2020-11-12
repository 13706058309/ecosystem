package com.cykj.entity;

/**
 * 章节
 */
public class Unit {

  private long unitId; //Id
  private String unitName; //章节名称
  private String unitSpeaker; //
  private String unitSynopsis;
  private String videoUrl;
  private long timeLength;
  private long playTimes;
  private long unitNum;
  private long courseId;

  public Unit() {
  }

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


  public String getUnitSpeaker() {
    return unitSpeaker;
  }

  public void setUnitSpeaker(String unitSpeaker) {
    this.unitSpeaker = unitSpeaker;
  }


  public String getUnitSynopsis() {
    return unitSynopsis;
  }

  public void setUnitSynopsis(String unitSynopsis) {
    this.unitSynopsis = unitSynopsis;
  }


  public String getVideoUrl() {
    return videoUrl;
  }

  public void setVideoUrl(String videoUrl) {
    this.videoUrl = videoUrl;
  }


  public long getTimeLength() {
    return timeLength;
  }

  public void setTimeLength(long timeLength) {
    this.timeLength = timeLength;
  }


  public long getPlayTimes() {
    return playTimes;
  }

  public void setPlayTimes(long playTimes) {
    this.playTimes = playTimes;
  }


  public long getUnitNum() {
    return unitNum;
  }

  public void setUnitNum(long unitNum) {
    this.unitNum = unitNum;
  }


  public long getCourseId() {
    return courseId;
  }

  public void setCourseId(long courseId) {
    this.courseId = courseId;
  }

}
