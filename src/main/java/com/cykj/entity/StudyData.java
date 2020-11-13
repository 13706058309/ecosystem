package com.cykj.entity;

/**
 * 学习资料
 */
public class StudyData {

  private long dataId;
  private long unitId;
  private String dataName;
  private long dataSize;
  private String dataUrl;

  public StudyData() {
  }

  public long getDataId() {
    return dataId;
  }

  public void setDataId(long dataId) {
    this.dataId = dataId;
  }


  public long getUnitId() {
    return unitId;
  }

  public void setUnitId(long unitId) {
    this.unitId = unitId;
  }


  public String getDataName() {
    return dataName;
  }

  public void setDataName(String dataName) {
    this.dataName = dataName;
  }


  public long getDataSize() {
    return dataSize;
  }

  public void setDataSize(long dataSize) {
    this.dataSize = dataSize;
  }


  public String getDataUrl() {
    return dataUrl;
  }

  public void setDataUrl(String dataUrl) {
    this.dataUrl = dataUrl;
  }

}
