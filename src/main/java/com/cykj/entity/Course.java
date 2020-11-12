package com.cykj.entity;

import java.util.List;

/**
 * 课程
 */
public class Course {

  private long courseId; //课程Id
  private String courseName; //课程名称
  private long unitCount; //章节数量
  private List<Unit> unitList; //章节列表
  private long fieldId; //领域Id
  private Field field; //领域

  public Course() {
  }

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


  public long getUnitCount() {
    return unitCount;
  }

  public void setUnitCount(long unitCount) {
    this.unitCount = unitCount;
  }


  public long getFieldId() {
    return fieldId;
  }

  public void setFieldId(long fieldId) {
    this.fieldId = fieldId;
  }

  public List<Unit> getUnitList() {
    return unitList;
  }

  public void setUnitList(List<Unit> unitList) {
    this.unitList = unitList;
  }

  public Field getField() {
    return field;
  }

  public void setField(Field field) {
    this.field = field;
  }
}
