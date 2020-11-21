package com.cykj.mapper;

import com.cykj.entity.Parameter;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
/**
 * 参数表
 */
public interface ParameterMapper {
    /**
     * 根据条件查询参数集合
     * @param condition
     * @return
     */
    List<Parameter> findParameter(@Param("condition") Map<String,Object> condition);
}
