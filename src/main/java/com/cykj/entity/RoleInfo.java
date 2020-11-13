package com.cykj.entity;

/**
 * 角色
 */
public class RoleInfo {

  private long roleId;
  private long bUserId;
  private String roleName;

  public RoleInfo() {
  }

  public long getRoleId() {
    return roleId;
  }

  public void setRoleId(long roleId) {
    this.roleId = roleId;
  }


  public long getBUserId() {
    return bUserId;
  }

  public void setBUserId(long bUserId) {
    this.bUserId = bUserId;
  }


  public String getRoleName() {
    return roleName;
  }

  public void setRoleName(String roleName) {
    this.roleName = roleName;
  }

}
