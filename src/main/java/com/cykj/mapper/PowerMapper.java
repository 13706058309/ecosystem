package com.cykj.mapper;

import com.cykj.entity.Menu;
import com.cykj.entity.RoleInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
/**
 * 权限   （暂时不用）
 */
public interface PowerMapper {
    public List<Menu> findExistMenu(@Param("roleId") long  roleId, @Param("pId") long  pId);
    public List<Menu> findNotExistMenu(@Param("roleId") long  roleId, @Param("pId") long  pId);
    public int addPower(@Param("roleId") long  roleId, @Param("menuIds") List<String> menuIds);
    public int delPower(@Param("roleId") long  roleId, @Param("menuIds") List<String> menuIds);
    public List<RoleInfo> findRoles();
}
