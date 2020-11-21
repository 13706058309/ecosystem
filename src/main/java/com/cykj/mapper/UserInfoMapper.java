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

     UserInfo log(Map<String,Object> map);
     BackUser adminLog(Map<String,Object> map);
     int register(UserInfo userInfo);
     UserInfo isRepeat(String account);
}
