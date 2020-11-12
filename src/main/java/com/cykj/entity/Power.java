package com.cykj.entity;

/**
 * 权限   （暂时不用）
 */
public class Power {

  private long roleId;
  private long menuId;

  public Power() {
  }

  public long getRoleId() {
    return roleId;
  }

  public void setRoleId(long roleId) {
    this.roleId = roleId;
  }


  public long getMenuId() {
    return menuId;
  }

  public void setMenuId(long menuId) {
    this.menuId = menuId;
  }

}
