package com.cykj.entity;


public class Course {

  private long courseId;
  private String courseName;
  private String courseImgUrl;//课程图像路径
  private String speakerName;
  private String courseIntroduce;
  private String uploadTime;
  private long collectionNumber;
  private long fieldId;
  private String speakerHeadImgUrl;
  private long totalPlayTimes;

  private long unitNumber;//课程所属的章节数
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


  public String getUploadTime() {
    return uploadTime;
  }

  public void setUploadTime(String uploadTime) {
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

  public long getUnitNumber() {
    return unitNumber;
  }

  public void setUnitNumber(long unitNumber) {
    this.unitNumber = unitNumber;
  }

  public long getTotalPlayTimes() {
    return totalPlayTimes;
  }

  public void setTotalPlayTimes(long totalPlayTimes) {
    this.totalPlayTimes = totalPlayTimes;
  }
}
