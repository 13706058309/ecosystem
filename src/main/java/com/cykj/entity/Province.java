package com.cykj.entity;

import java.util.List;

/**
 * 省份
 */
public class Province {

  private long provinceId;
  private List<City> cityList;
  private String provinceName;

  public Province() {
  }

  public long getProvinceId() {
    return provinceId;
  }

  public void setProvinceId(long provinceId) {
    this.provinceId = provinceId;
  }


  public String getProvinceName() {
    return provinceName;
  }

  public void setProvinceName(String provinceName) {
    this.provinceName = provinceName;
  }

  public Province(long provinceId, List<City> cityList, String provinceName) {
    this.provinceId = provinceId;
    this.cityList = cityList;
    this.provinceName = provinceName;
  }
}
