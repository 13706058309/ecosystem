package com.cykj.entity;

import java.util.List;

/**
 * 省份
 */
public class Province {

  private long provinceId;//主键ID
  private List<City> cityList;
  private String provinceName;//省份名字

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
