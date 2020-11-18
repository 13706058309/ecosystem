package com.cykj.mapper;

import com.cykj.entity.BackUser;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * 后台用户
 */
@Mapper
@Repository
public interface BackUserMapper {

    int register(BackUser backUser);
    BackUser isRepeat(String account);
}
