package com.cykj.entity;

/**
 * 公司 ----- 行业
 */
public class CompIndustry {

  private long compId;
  private long industryId;

  public CompIndustry() {
  }

  public long getCompId() {
    return compId;
  }

  public void setCompId(long compId) {
    this.compId = compId;
  }


  public long getIndustryId() {
    return industryId;
  }

  public void setIndustryId(long industryId) {
    this.industryId = industryId;
  }

}
