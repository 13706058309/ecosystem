package com.cykj.service.impl;

import com.cykj.entity.*;
import com.cykj.mapper.UserMapper;
import com.cykj.service.UserService;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpI implements UserService {

    @Resource
    private UserMapper userMapper;

    @Override
    public List<Menu> findMenus(int pId) {
        System.out.println("后台主界面");
        return userMapper.findMenusByPid(pId);
    }


    @Override
    public boolean changeUserState(String userId, String accStandId) {
        System.out.println("修改状态---" + accStandId);
        return userMapper.changeUserState(Integer.parseInt(userId), accStandId);
    }

    @Override
    public int deleteUser(Integer userId,Integer accStandId) {

        return userMapper.deleteUser(userId,accStandId);
    }

    @Override
    public boolean changeBackUserState(String bUserId, String stateId) {
        return userMapper.changeBackUserState(Integer.parseInt(bUserId), stateId);
    }

    @Override
    public int deleteBackUser(Integer bUserId,Integer stateId) {
        return userMapper.deleteBackUser(bUserId,stateId);
    }

    @Override
//    @Loger(operationName = "用户查询")//用户名查询
    public TableInfo findAllOnPage(Map<String, Object> map, int curPage, int limit) {
        map.put("limit", limit);
        map.put("offset", (curPage - 1) * limit);

        List<FrontUser> allOnPage = userMapper.findUserOnPage(map);
        int numOnPage = userMapper.findNumOnPage(map);
        TableInfo tableInfo = new TableInfo(0, "前台用户信息数据", numOnPage, allOnPage);
        return tableInfo;
    }

    @Override
//    @Loger(operationName = "后台用户查询")//后台用户名查询
    public TableInfo backFindsAllOnPage(Map<String, Object> map, int curPage, int limit) {
        map.put("limit",limit);
        map.put("offset",(curPage-1)*limit);
        List<BackUser> allOnPage = userMapper.backFindsUserOnPage(map);
        int numOnPage = userMapper.backFindsNumOnPage(map);
        TableInfo tableInfo = new TableInfo(0,"后台用户信息数据",numOnPage,allOnPage);
        return tableInfo;
    }

    @Override
    public TableInfo compNameFindsAllOnPage(Map<String, Object> map, int curPage, int limit) {
        map.put("limit",limit);
        map.put("offset",(curPage-1)*limit);
        List<BackUser> allOnPage = userMapper.compNameFindsUserOnPage(map);
        int numOnPage = userMapper.compNameFindsNumOnPage(map);
        TableInfo tableInfo = new TableInfo(0,"后台用户信息数据",numOnPage,allOnPage);
        return tableInfo;
    }

    @Override
    public int reg(BackUser backUser) {
        int n = userMapper.reg(backUser);
        return n;
    }

    @Override
    public int addSchool(BackUser backUser) {
        int n = userMapper.addSchool(backUser);
        return n;
    }

    @Override
    public boolean changeEnterpriseState(String bUserId,String stateId) {
        return userMapper.changeEnterpriseState(Integer.parseInt(bUserId),stateId);
    }

    @Override
    public boolean resetPassword(String bUserId, String pwd) {
        return userMapper.resetPassword(Integer.parseInt(bUserId),pwd);
    }

    @Override
    public List<RoleInfo> getAll() {
        System.out.println("管理员的动态值");
        List<RoleInfo> list = userMapper.getAll();
        return list;
    }

    @Override
    public List<RoleInfo> findRole() {
        List<RoleInfo> list = userMapper.findRole();
        return list;
    }

    @Override
    public boolean query(String contactInfo) {
        BackUser query = userMapper.query(contactInfo);
        System.out.println("来到service");
        return query==null;
    }

    @Override
    public BackUser findByID(int bUserId) {
        return userMapper.findByID(bUserId);
    }

    @Override
    public boolean register(String account) {
        BackUser register = userMapper.register(account);
        return register==null;
    }





}
