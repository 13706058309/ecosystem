package com.cykj.entity;

import java.util.List;

/**
 * 菜单
 */
public class Menu {

  private long id; //id
  private String title; //名称
  private String url; //路径
  private long pId; //父Id
  private List<Menu> children; //子节点
  private boolean spread; //展开节点
  public Menu() {
    spread=true;
  }

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getUrl() {
    return url;
  }

  public void setUrl(String url) {
    this.url = url;
  }


  public long getPId() {
    return pId;
  }

  public void setPId(long pId) {
    this.pId = pId;
  }

  public long getpId() {
    return pId;
  }

  public void setpId(long pId) {
    this.pId = pId;
  }

  public List<Menu> getChildren() {
    return children;
  }

  public void setChildren(List<Menu> children) {
    this.children = children;
  }

  public boolean isSpread() {
    return spread;
  }

  public void setSpread(boolean spread) {
    this.spread = spread;
  }
}
