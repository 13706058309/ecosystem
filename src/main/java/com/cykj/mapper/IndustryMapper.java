package com.cykj.mapper;

import com.cykj.entity.Industry;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
/**
 * 行业
 */
public interface IndustryMapper {

    public  List<Industry> findIndustry ();
}
