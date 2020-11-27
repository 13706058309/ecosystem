package com.cykj.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 后台用户日志
 */
@Mapper
@Repository
public interface BackLogMapper {


    List<BackLog> findLogOnPage(Map<String, Object> map);
    int findLogNum(Map<String, Object> map);
    int addBackLog(BackLog backLog);

    void insertLog(@Param("buserid") int buserid,@Param("matter") String  matter);
}
