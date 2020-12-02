package com.cykj.mapper;

import com.cykj.entity.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface UserMapper {

    public List<Menu> findMenusByPid(@Param("pId") Integer pId);

    public List<FrontUser> findUser();

    public boolean changeUserState(@Param("userId") int userId, @Param("accStandId") String accStandId);//修改前端用户状态

    public int deleteUser(@Param("userId") Integer userId, @Param("accStandId") Integer accStandId);//删除前端用户

    public List<BackUser> findBackUser();//管理员信息

    public boolean changeBackUserState(@Param("bUserId") int bUserId, @Param("stateId") String stateId);//修改后端状态

    public int deleteBackUser(@Param("bUserId") Integer bUserId, @Param("stateId") Integer stateId);//删除后端用户

    public List<FrontUser> findUserOnPage(Map<String, Object> map);//前端分页

    public int findNumOnPage(Map<String, Object> map);//前端数据总条数

    public BackUser register(String account);//查找账号是否已存在

    public int reg(BackUser backUser);//后台管理员新增

    public List<BackUser> backFindsUserOnPage(Map<String, Object> map);//后台分页

    public int backFindsNumOnPage(Map<String, Object> map);//后台数据总条数

    public List<BackUser> compNameFindsUserOnPage(Map<String, Object> map);//企业分页

    public int compNameFindsNumOnPage(Map<String, Object> map);//企业数据总条数

    public boolean changeEnterpriseState(@Param("bUserId") int bUserId, @Param("stateId") String stateId);//修改企业id

    public boolean resetPassword(@Param("bUserId") int bUserId, @Param("pwd") String pwd);//重置密码

    public List<RoleInfo> getAll();//管理员搜索动态角色

    public int addSchool(BackUser backUser);//新增高校

    public BackUser query(String contactInfo);

    public List<RoleInfo> findRole();//新增管理员，高校等动态角色

    public BackUser findByID(int bUserId);
}
