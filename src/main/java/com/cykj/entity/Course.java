package com.cykj.entity;


import java.sql.Timestamp;

public class Course {

  private long courseId;
  private String courseName;
  private String courseImgURL;
  private String speakerName;
  private String courseIntroduce;
  private java.sql.Timestamp uploadTime;
  private long collectionNumber;
  private long fieldId;
  private String speakerHeadImgUrl;
  private long totalPlayTimes;

  public long getCourseId() {
    return courseId;
  }

  public void setCourseId(long courseId) {
    this.courseId = courseId;
  }

  public String getCourseName() {
    return courseName;
  }

  public void setCourseName(String courseName) {
    this.courseName = courseName;
  }

  public String getCourseImgURL() {
    return courseImgURL;
  }

  public void setCourseImgURL(String courseImgURL) {
    this.courseImgURL = courseImgURL;
  }

  public String getSpeakerName() {
    return speakerName;
  }

  public void setSpeakerName(String speakerName) {
    this.speakerName = speakerName;
  }

  public String getCourseIntroduce() {
    return courseIntroduce;
  }

  public void setCourseIntroduce(String courseIntroduce) {
    this.courseIntroduce = courseIntroduce;
  }

  public Timestamp getUploadTime() {
    return uploadTime;
  }

  public void setUploadTime(Timestamp uploadTime) {
    this.uploadTime = uploadTime;
  }

  public long getCollectionNumber() {
    return collectionNumber;
  }

  public void setCollectionNumber(long collectionNumber) {
    this.collectionNumber = collectionNumber;
  }

  public long getFieldId() {
    return fieldId;
  }

  public void setFieldId(long fieldId) {
    this.fieldId = fieldId;
  }

  public String getSpeakerHeadImgUrl() {
    return speakerHeadImgUrl;
  }

  public void setSpeakerHeadImgUrl(String speakerHeadImgUrl) {
    this.speakerHeadImgUrl = speakerHeadImgUrl;
  }

  public long getTotalPlayTimes() {
    return totalPlayTimes;
  }

  public void setTotalPlayTimes(long totalPlayTimes) {
    this.totalPlayTimes = totalPlayTimes;
  }
}
