package com.cykj.mapper;

import com.cykj.entity.BackUser;
import com.cykj.entity.UserInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
/**
 * 前台用户
 */
public interface UserInfoMapper {

    public UserInfo log(@Param("account")String account,@Param("pwd")String pwd);
    public BackUser adminLog(@Param("account")String account,@Param("pwd")String pwd);
}
