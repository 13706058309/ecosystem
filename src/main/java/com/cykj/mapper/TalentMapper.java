package com.cykj.mapper;

import com.cykj.entity.Talent;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
/**
 *人才表
 */
public interface TalentMapper {

    List<Talent>  findUnviTalentOnPage(Map<String,Object> map);

}
