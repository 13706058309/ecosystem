package com.cykj.entity;

import java.util.List;

/**
 * 城市
 */
public class City {

  private long cityId; //城市Id
  private String cityName; //城市名称
  private List<Province> provinces;  //下属省份集合

  public City() {
  }

  public long getCityId() {
    return cityId;
  }

  public void setCityId(long cityId) {
    this.cityId = cityId;
  }

  public List<Province> getProvinces() {
    return provinces;
  }

  public void setProvinces(List<Province> provinces) {
    this.provinces = provinces;
  }

  public String getCityName() {
    return cityName;
  }

  public void setCityName(String cityName) {
    this.cityName = cityName;
  }

}
