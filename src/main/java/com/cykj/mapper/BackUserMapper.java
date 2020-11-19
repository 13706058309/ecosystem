package com.cykj.mapper;

import com.cykj.entity.BackUser;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 后台用户
 */
@Mapper
@Repository
public interface BackUserMapper {

    public List<BackUser> findCompany();

}
