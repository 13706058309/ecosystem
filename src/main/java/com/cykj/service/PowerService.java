package com.cykj.service;




import com.cykj.entity.Menu;
import com.cykj.entity.RoleInfo;

import java.util.List;

public interface PowerService {

    public List<Menu> findExistMenu(long roleId);
    public List<Menu> findNotExistMenu(long roleId);
    public int addPower(long roleId, List<String> menuIds);
    public int delPower(long roleId, List<String> menuIds);
    public List<RoleInfo> findRoles();
}
