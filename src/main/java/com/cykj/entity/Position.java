package com.cykj.entity;

/**
 * 岗位
 */
public class Position {

  private long postId;
  private long departId;
  private String postName;

  public Position() {
  }

  @Override
  public String toString() {
    return "Position{" +
            "postId=" + postId +
            ", departId=" + departId +
            ", postName='" + postName + '\'' +
            '}';
  }

  public long getPostId() {
    return postId;
  }

  public void setPostId(long postId) {
    this.postId = postId;
  }


  public long getDepartId() {
    return departId;
  }

  public void setDepartId(long departId) {
    this.departId = departId;
  }


  public String getPostName() {
    return postName;
  }

  public void setPostName(String postName) {
    this.postName = postName;
  }

}
