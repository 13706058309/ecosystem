package com.cykj.service;

import com.cykj.entity.*;

import java.util.List;
import java.util.Map;

public interface UserService {

    public  List<Menu> findMenus(int pId);//后台主菜单

    public boolean changeUserState(String userId, String accStandId);//修改前端状态

    public int deleteUser(Integer userId, Integer accStandId);//删除前端用户

    public boolean changeBackUserState(String bUserId, String stateId);//修改后端状态

    public int deleteBackUser(Integer bUserId, Integer stateId);//删除后端用户

    public TableInfo findAllOnPage(Map<String, Object> map, int page, int limit);//用户信息分页

    public TableInfo backFindsAllOnPage(Map<String, Object> map, int page, int limit);//管理员信息分页

    public TableInfo compNameFindsAllOnPage(Map<String, Object> map, int page, int limit);//企业信息分页

    public boolean register(String account);//新增后台管理员查询账号是否重复

    public int reg(BackUser backUser);//新增后台管理员

    public int addSchool(BackUser backUser);//新增高校

    public boolean changeEnterpriseState(String bUserId, String stateId);//修改企业id

    public boolean resetPassword(String bUserId, String pwd);//重置密码

    public List<RoleInfo> getAll();//动态值

    public List<RoleInfo> findRole();//动态值

    public boolean query(String contactInfo);//手机号是否重复

    public BackUser findByID(int bUserId);//下载
}
