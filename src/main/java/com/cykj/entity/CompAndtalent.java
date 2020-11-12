package com.cykj.entity;

/**
 * 公司----人才
 */
public class CompAndtalent {

  private long compAndTalId;
  private long talent;
  private long compId;
  private long stand;

  public CompAndtalent() {
  }

  public long getCompAndTalId() {
    return compAndTalId;
  }

  public void setCompAndTalId(long compAndTalId) {
    this.compAndTalId = compAndTalId;
  }


  public long getTalent() {
    return talent;
  }

  public void setTalent(long talent) {
    this.talent = talent;
  }


  public long getCompId() {
    return compId;
  }

  public void setCompId(long compId) {
    this.compId = compId;
  }


  public long getStand() {
    return stand;
  }

  public void setStand(long stand) {
    this.stand = stand;
  }

}
