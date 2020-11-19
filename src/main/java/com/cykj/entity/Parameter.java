package com.cykj.entity;

/**
 * 参数表
 */
public class Parameter {

  private long paramId;  //id
  private String paramName; //参数名称
  private String paramType; //参数类型
  private String paramValues; // 值

  public Parameter() {
  }

  public long getParamId() {
    return paramId;
  }

  public void setParamId(long paramId) {
    this.paramId = paramId;
  }


  public String getParamName() {
    return paramName;
  }

  public void setParamName(String paramName) {
    this.paramName = paramName;
  }


  public String getParamType() {
    return paramType;
  }

  public void setParamType(String paramType) {
    this.paramType = paramType;
  }


  public String getParamValues() {
    return paramValues;
  }

  public void setParamValues(String paramValues) {
    this.paramValues = paramValues;
  }

  @Override
  public String toString() {
    return "Parameter{" +
            "paramId=" + paramId +
            ", paramName='" + paramName + '\'' +
            ", paramType='" + paramType + '\'' +
            ", paramValues='" + paramValues + '\'' +
            '}';
  }
}
