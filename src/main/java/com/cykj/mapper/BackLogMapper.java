package com.cykj.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * 后台用户日志
 */
@Mapper
@Repository
public interface BackLogMapper {

    void insertLog(@Param("buserid") int buserid,@Param("matter") String  matter);
}
