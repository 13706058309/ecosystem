package com.cykj.entity;

import java.util.List;

/**
 * 行业
 */
public class Industry {

  private long industryId;//行业ID
  private String industryName;//行业名称
  private List<Depart> departs;
  public Industry() {
  }

  public Industry(long industryId, String industryName) {
    this.industryId = industryId;
    this.industryName = industryName;
  }

  @Override
  public String toString() {
    return "Industry{" +
            "industryId=" + industryId +
            ", industryName='" + industryName + '\'' +
            '}';
  }

  public long getIndustryId() {
    return industryId;
  }

  public void setIndustryId(long industryId) {
    this.industryId = industryId;
  }


  public String getIndustryName() {
    return industryName;
  }

  public void setIndustryName(String industryName) {
    this.industryName = industryName;
  }

  public List<Depart> getDeparts() {
    return departs;
  }

  public void setDeparts(List<Depart> departs) {
    this.departs = departs;
  }


}
