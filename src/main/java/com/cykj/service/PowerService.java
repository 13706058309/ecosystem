package com.cykj.service;




import com.cykj.entity.Menu;
import com.cykj.entity.RoleInfo;

import java.util.List;

public interface PowerService {
    /**
     * 根据角色Id查询已赋予的权限
     * @param roleId
     * @return
     */
    public List<Menu> findExistMenu(long roleId);

    /**
     * 查询角色没有的权限
     * @param roleId 角色Id
     * @return
     */
    public List<Menu> findNotExistMenu(long roleId);

    /**
     * 添加权限
     * @param roleId
     * @param menuIds
     * @return
     */
    public int addPower(long roleId, List<String> menuIds);

    /**
     * 删除权限
     * @param roleId
     * @param menuIds
     * @return
     */
    public int delPower(long roleId, List<String> menuIds);

    /**
     * 查询所有角色
     * @return
     */
    public List<RoleInfo> findRoles();
}
