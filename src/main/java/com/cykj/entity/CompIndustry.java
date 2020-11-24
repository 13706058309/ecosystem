package com.cykj.entity;

/**
 * 公司 ----- 行业
 */
public class CompIndustry {

  private long compAndIndId;
  private long compId;
  private long industryId;

  private  BackUser backUser;
  private  Industry industry;

  public CompIndustry() {
  }

  public CompIndustry(long compId, long industryId, BackUser backUser, Industry industry) {
    this.compId = compId;
    this.industryId = industryId;
    this.backUser = backUser;
    this.industry = industry;
  }

  @Override
  public String toString() {
    return "CompIndustry{" +
            "compAndIndID=" + compAndIndID +
            ", compId=" + compId +
            ", industryId=" + industryId +
            ", backUser=" + backUser +
            ", industry=" + industry +
            '}';
  }

  public long getCompAndIndID() {
    return compAndIndID;
  }

  public void setCompAndIndID(long compAndIndID) {
    this.compAndIndID = compAndIndID;
  }

  public BackUser getBackUser() {
    return backUser;
  }

  public void setBackUser(BackUser backUser) {
    this.backUser = backUser;
  }

  public Industry getIndustry() {
    return industry;
  }

  public void setIndustry(Industry industry) {
    this.industry = industry;
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

  public long getCompAndIndId() {
    return compAndIndId;
  }

  public void setCompAndIndId(long compAndIndId) {
    this.compAndIndId = compAndIndId;
  }
}
