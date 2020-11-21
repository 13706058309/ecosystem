package com.cykj.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
/**
 * 公司 ----- 行业
 */
public interface CompIndustryMapper {
    //添加一条数据
    int addCompAndInd(@Param("compID") int compID, @Param("industryID") int industryID);
}
