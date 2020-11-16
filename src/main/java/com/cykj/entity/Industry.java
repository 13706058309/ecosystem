package com.cykj.entity;

/**
 * 行业
 */
public class Industry {

  private long industryId;
  private String industryName;

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

}
