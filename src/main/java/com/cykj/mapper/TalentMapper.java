package com.cykj.mapper;

import com.cykj.entity.Talent;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
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
    int findUnviTalentOnPageNum(Map<String,Object> map);

    List<Talent> findTalent(Map<String,Object> map);
    int findRecords(Map<String, Object> map);
    int addTalent(Talent talent);

    Talent selectTalent(String talentName);

    Talent findTalentByID(@Param("talentID") int talentID);

}

