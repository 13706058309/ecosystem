package com.cykj.entity;

/**
 * 专业
 */
public class Profession {

  private long professionId;
  private String profession;

  public Profession() {
  }

  public long getProfessionId() {
    return professionId;
  }

  public void setProfessionId(long professionId) {
    this.professionId = professionId;
  }


  public String getProfession() {
    return profession;
  }

  public void setProfession(String profession) {
    this.profession = profession;
  }

}
