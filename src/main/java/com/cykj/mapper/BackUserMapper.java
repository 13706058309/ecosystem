package com.cykj.mapper;

import com.cykj.entity.BackUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

import java.util.Map;

/**
 * 后台用户
 */
@Mapper
@Repository
public interface BackUserMapper {
    BackUser findCompByID(int compID);

    int changeCompInfo(Map<String,Object> map);

//    根据条件查找公司信息
    public List<BackUser> findCompany(Map map);
//    查找公司数量
    public List<BackUser> findCount(Map map);
//    根据城市查找公司
    public List<BackUser> CompanyCity(@Param("city") String city);
//    根据ID查公司简介
    public BackUser findProfile(@Param("bUserId") int bUserId);


    int changePwd(@Param("pwd") String pwd,@Param("compID") int compID);

    String findPwd(@Param("compID") int compID);
    //通过手机号找用户
    BackUser findByPhone(@Param("phone") String phone);
    //通过手机修改密码
    int changePwdByPhone(@Param("pwd") String pwd,@Param("phone") String phone);
    int register(BackUser backUser);
    BackUser isRepeat(String account);

    //添加公司用户
    int addComp(BackUser backUser);
    //通过账号找角色
    BackUser findByAccount(@Param("account") String account);
    //查找刚插入数据的ID
    int findID();


}
