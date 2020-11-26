package com.cykj.mapper;

import com.cykj.entity.*;
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
    Talent findTalentByID(@Param("talentID") int talentID);
    List<Talent> findTalent(Map<String,Object> map);
    int findRecords(Map<String, Object> map);
    int addTalent(Talent talent);
    List<Positions> findPosition(Map<String,Object> map);
    int findPositionRecords(Map<String, Object> map);
    Talent selectTalent( String contactInfo);

    CompAndtalent selectCompAndtalent(@Param("companyID") int companyID, @Param("c") char c);

    int addCompAndtalent(@Param("companyID") int companyID,@Param("c") char c);


    int changeSchoolInfo(Map<String, Object> map);

    BackUser findShoolByID(int i);


    List<Positions> selectPosition(Map<String, Object> map);


    int selectPositionRecords(Map<String, Object> map);

    int changePosition(Map<String, Object> map);

    Position lookPosition(@Param("postName") String postName);

    int addPosition(@Param("postName") String postName, @Param("departId")   Long departId);


    Depart lookDepart(@Param("departName")String departName);

    int addDepart(@Param("departName")String departName,@Param("industryId") Long industryId);

    Industry lookIndustry(@Param("industryName") String industryName);

    int addIndustry(@Param("industryName") String industryName);
}

