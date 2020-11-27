package com.cykj.mapper;

import com.cykj.entity.BackUser;
import com.cykj.entity.UserInfo;
import org.apache.catalina.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Mapper
@Repository
/**
 * 前台用户
 */
public interface UserInfoMapper {

     //前端登录
     UserInfo log(Map<String,Object> map);
     //前端短信登录
     UserInfo mesLog(Map<String,Object> map);
     //后端登录
     BackUser adminLog(Map<String,Object> map);
     //前端注册
     int register(UserInfo userInfo);
     //判断账号是否重复
     UserInfo isRepeat(String account);
     //查询手机
     UserInfo findPhone(@Param("phone") String phone );
     //通过手机找回密码
     int changPasswordByPhone(@Param("pwd") String pwd,@Param("phone") String phone);
}
