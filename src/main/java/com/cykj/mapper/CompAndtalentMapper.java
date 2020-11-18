package com.cykj.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
/**
 * 公司----人才
 */
public interface CompAndtalentMapper {
    int delUnviTalent(@Param("standID") int standID,@Param("compAndTalId") int compAndTalId);
}
