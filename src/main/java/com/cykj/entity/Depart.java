package com.cykj.entity;

/**
 * 部门
 */
public class Depart {

  private long departId;//部门ID
  private long industryId;//行业ID
  private String departName;//部门名称


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
