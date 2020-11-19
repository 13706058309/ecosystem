package com.cykj.entity;

/**
 * 角色
 */
public class RoleInfo {

  private long roleId;
  private String roleName;

  public RoleInfo() {
  }

  public long getRoleId() {
    return roleId;
  }

  public void setRoleId(long roleId) {
    this.roleId = roleId;
  }

  public String getRoleName() {
    return roleName;
  }

  public void setRoleName(String roleName) {
    this.roleName = roleName;
  }

}
