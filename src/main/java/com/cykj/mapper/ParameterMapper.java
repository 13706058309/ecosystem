package com.cykj.mapper;

import com.cykj.entity.Parameter;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
/**
 * 参数表
 */
public interface ParameterMapper {

    Parameter findDownFee(@Param("paramID") int paramID);

    int changeFeeStand(@Param("standID") int standID);
}
