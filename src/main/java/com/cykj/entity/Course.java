package com.cykj.entity;


public class Course {

  private long courseId;// 课程ID
  private String courseName;//课程名
  private String courseImgUrl;//课程图像路径
  private String speakerName;//讲师名
  private String courseIntroduce;//课程详情
  private String uploadTime;//发布时间
  private long collectionNumber;//被收藏次数
  private long fieldId;//所属领域名
  private String speakerHeadImgUrl;//讲师头像
  private long totalPlayTimes;//课程的总播放量

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
