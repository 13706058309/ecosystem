package com.cykj.entity;

/**
 * 证书
 */
public class Certificate {

  private long cerId; //id
  private long fieldId;//领域Id
  private Field field; //领域实体类
  private String imgUrl; // 图片地址


  public Certificate() {
  }

  public long getCerId() {
    return cerId;
  }

  public void setCerId(long cerId) {
    this.cerId = cerId;
  }

  public long getFieldId() {
    return fieldId;
  }

  public void setFieldId(long fieldId) {
    this.fieldId = fieldId;
  }

  public Field getField() {
    return field;
  }

  public void setField(Field field) {
    this.field = field;
  }

  public String getImgUrl() {
    return imgUrl;
  }

  public void setImgUrl(String imgUrl) {
    this.imgUrl = imgUrl;
  }

}
