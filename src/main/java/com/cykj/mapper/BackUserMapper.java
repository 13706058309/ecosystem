package com.cykj.mapper;

import com.cykj.entity.BackUser;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 后台用户
 */
@Mapper
@Repository
public interface BackUserMapper {
    /**
     * 查询企业
     * @param condition
     * @return
     */
    List<BackUser> findBackUser(Map<String,Object> condition);

}
