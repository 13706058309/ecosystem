package com.cykj.mapper;

import com.cykj.entity.BackUser;
import com.cykj.entity.CerUser;
import com.cykj.entity.UserInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
/**
 * 用户获取的证书记录
 */
public interface CerUserMapper {

    //根据用户ID查询已获得证书
    public List<CerUser> findceruserlist(@Param("userId")long userId);
}
