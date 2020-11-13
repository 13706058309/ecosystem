package com.cykj.entity;


public class Course {

  private long courseId;
  private String courseName;
  private String courseImgUrl;
  private String speakerName;
  private String courseIntroduce;
  private java.sql.Timestamp uploadTime;
  private long collectionNumber;
  private long fieldId;
  private String speakerHeadImgUrl;


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


  public String getCourseImgUrl() {
    return courseImgUrl;
  }

  public void setCourseImgUrl(String courseImgUrl) {
    this.courseImgUrl = courseImgUrl;
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


  public java.sql.Timestamp getUploadTime() {
    return uploadTime;
  }

  public void setUploadTime(java.sql.Timestamp uploadTime) {
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

}
