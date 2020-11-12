package com.cykj.entity;

/**
 * 项目测试
 */
public class ProjectTest {

  private long testId;
  private long cerRecordId;
  private long bUserId;
  private String docUrl;
  private double testScore;
  private long states;

  public ProjectTest() {
  }

  public long getTestId() {
    return testId;
  }

  public void setTestId(long testId) {
    this.testId = testId;
  }


  public long getCerRecordId() {
    return cerRecordId;
  }

  public void setCerRecordId(long cerRecordId) {
    this.cerRecordId = cerRecordId;
  }


  public long getBUserId() {
    return bUserId;
  }

  public void setBUserId(long bUserId) {
    this.bUserId = bUserId;
  }


  public String getDocUrl() {
    return docUrl;
  }

  public void setDocUrl(String docUrl) {
    this.docUrl = docUrl;
  }


  public double getTestScore() {
    return testScore;
  }

  public void setTestScore(double testScore) {
    this.testScore = testScore;
  }


  public long getStates() {
    return states;
  }

  public void setStates(long states) {
    this.states = states;
  }

}
