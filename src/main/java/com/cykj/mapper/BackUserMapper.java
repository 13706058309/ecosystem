package com.cykj.mapper;

import com.cykj.entity.BackUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * 后台用户
 */
@Mapper
@Repository
public interface BackUserMapper {
    BackUser findCompByID(int compID);

    int changeCompInfo(Map<String,Object> map);

    int changePwd(@Param("pwd") String pwd,@Param("compID") int compID);

    String findPwd(@Param("compID") int compID);
}
