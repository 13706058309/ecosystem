package com.cykj.entity;

/**
 * 部门
 */
public class Depart {

  private long departId;
  private long industryId;
  private String departName;

  @Override
  public String toString() {
    return "Depart{" +
            "departId=" + departId +
            ", industryId=" + industryId +
            ", departName='" + departName + '\'' +
            '}';
  }

  public long getDepartId() {
    return departId;
  }

  public void setDepartId(long departId) {
    this.departId = departId;
  }


  public long getIndustryId() {
    return industryId;
  }

  public void setIndustryId(long industryId) {
    this.industryId = industryId;
  }


  public String getDepartName() {
    return departName;
  }

  public void setDepartName(String departName) {
    this.departName = departName;
  }

}
