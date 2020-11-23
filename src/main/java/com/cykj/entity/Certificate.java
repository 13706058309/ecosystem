package com.cykj.entity;

/**
 * 证书
 */
public class Certificate {

  private long cerId; //id
  private long fieldId;//领域Id
  private Field field; //领域实体类

  private String imgUrl; // 图片地址

  private String cerSketch;//证书简述
  private String cerTrait;//证书特点
  private String cerHeadPortrait;//证书头像
  private int cershowState;//展示状态
  private String cerChangeTime;//变更时间
  private int certificationFee;//证书费用
  private String cerRequirement;//证书需求路径


  public Certificate() {
  }

  @Override
  public String toString() {
    return "Certificate{" +
            "cerId=" + cerId +
            ", fieldId=" + fieldId +
            ", field=" + field +
            ", imgUrl='" + imgUrl + '\'' +
            ", cerSketch='" + cerSketch + '\'' +
            ", cerTrait='" + cerTrait + '\'' +
            ", cerHeadPortrait='" + cerHeadPortrait + '\'' +
            ", cershowState=" + cershowState +
            ", cerChangeTime='" + cerChangeTime + '\'' +
            ", certificationFee=" + certificationFee +
            ", cerRequirement='" + cerRequirement + '\'' +
            '}';
  }

  public String getCerRequirement() {
    return cerRequirement;
  }

  public void setCerRequirement(String cerRequirement) {
    this.cerRequirement = cerRequirement;
  }

  public int getCertificationFee() {
    return certificationFee;
  }

  public void setCertificationFee(int certificationFee) {
    this.certificationFee = certificationFee;
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

  public String getCerSketch() {
    return cerSketch;
  }

  public void setCerSketch(String cerSketch) {
    this.cerSketch = cerSketch;
  }

  public String getCerTrait() {
    return cerTrait;
  }

  public void setCerTrait(String cerTrait) {
    this.cerTrait = cerTrait;
  }

  public String getCerHeadPortrait() {
    return cerHeadPortrait;
  }

  public void setCerHeadPortrait(String cerHeadPortrait) {
    this.cerHeadPortrait = cerHeadPortrait;
  }

  public int getCershowState() {
    return cershowState;
  }

  public void setCershowState(int cershowState) {
    this.cershowState = cershowState;
  }

  public String getCerChangeTime() {
    return cerChangeTime;
  }

  public void setCerChangeTime(String cerChangeTime) {
    this.cerChangeTime = cerChangeTime;
  }
}
