package com.cykj.entity;

import java.util.List;

/**
 * 领域
 */
public class Field {

  private long fieldId;  //Id
  private String fieldName; //领域名称

  private List<Course> courses;

  public long getFieldId() {
    return fieldId;
  }

  public void setFieldId(long fieldId) {
    this.fieldId = fieldId;
  }


  public String getFieldName() {
    return fieldName;
  }

  public void setFieldName(String fieldName) {
    this.fieldName = fieldName;
  }


  public List<Course> getCourses() {
    return courses;
  }

  public void setCourses(List<Course> courses) {
    this.courses = courses;
  }
}
