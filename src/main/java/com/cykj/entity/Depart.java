package com.cykj.entity;

import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 部门
 */
@Component
public class Depart {

  private long departId;//部门ID
  private long industryId;//行业ID
  private String departName;//部门名称

  public Depart() {
  }

  public Depart(long departId, long industryId, String departName) {
    this.departId = departId;
    this.industryId = industryId;
    this.departName = departName;
  }

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
