package com.cykj.service.impl;

import com.cykj.entity.Menu;
import com.cykj.entity.RoleInfo;
import com.cykj.mapper.PowerMapper;
import com.cykj.service.PowerService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class PowerServiceImpl implements PowerService {

    @Resource
    PowerMapper powerMapper;

    /**
     * 根据角色Id查询已赋予的权限
     * @param roleId
     * @return
     */
    @Override
    public List<Menu> findExistMenu(long roleId) {
        List<Menu> existList =powerMapper.findExistMenu(roleId,0);
        for (int i=0;i<existList.size();i++){
            List<Menu> list_exist=powerMapper.findExistMenu(roleId,existList.get(i).getId());
            if (list_exist.size()>0){
                existList.get(i).setChildren(list_exist);
            }
        }

        return existList;
    }
    /**
     * 查询角色没有的权限
     * @param roleId 角色Id
     * @return
     */
    @Override
    public List<Menu> findNotExistMenu(long  roleId) {
        List<Menu> notExistList =powerMapper.findNotExistMenu(roleId,0);
        for (int i=0;i<notExistList.size();i++){
            List<Menu> list_notExist=powerMapper.findNotExistMenu(roleId,notExistList.get(i).getId());
            if (list_notExist.size()>0){
                notExistList.get(i).setChildren(list_notExist);
            }
        }
        return  notExistList;
    }
    /**
     * 添加权限
     * @param roleId
     * @param menuIds
     * @return
     */
    @Override
    public int addPower(long  roleId,List<String> menuIds) {
        int n=powerMapper.addPower(roleId,menuIds);
        return n;
    }

    /**
     * 删除权限
     * @param roleId
     * @param menuIds
     * @return
     */
    @Override
    public int delPower(long  roleId,List<String> menuIds) {
        int n=powerMapper.delPower(roleId,menuIds);
        return n;
    }


    /**
     * 查询所有角色
     * @return
     */
    @Override
    public List<RoleInfo> findRoles() {
        List<RoleInfo> roleList=powerMapper.findRoles();
        return roleList;
    }

}
