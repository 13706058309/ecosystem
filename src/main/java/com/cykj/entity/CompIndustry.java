package com.cykj.entity;

/**
 * 公司 ----- 行业
 */
public class CompIndustry {
private  long compAndIndID;
  private long compId;
  private long industryId;

  public CompIndustry() {
  }

  public long getCompAndIndID() {
    return compAndIndID;
  }

  public void setCompAndIndID(long compAndIndID) {
    this.compAndIndID = compAndIndID;
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
