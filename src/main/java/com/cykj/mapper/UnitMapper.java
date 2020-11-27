package com.cykj.mapper;

import com.cykj.entity.Course;
import com.cykj.entity.Unit;
import com.cykj.entity.StudyData;
import com.cykj.entity.Unit;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

import java.util.List;

@Mapper
@Repository
/**
 * 章节
 */
public interface UnitMapper {

    List<Unit> findUnitOnPage(Map<String, Object> map);

    int findNumOnPage(Map<String, Object> map);

    int deleteUnit(Integer unitId);

    int updateunitName(String unitName,Integer unitId);//更改章节名字

    int selectunitName(Integer unitId);//更改章节名字

//
//    int updatecourseImgURL(String courseImgURL,Integer courseId);//更改路径
//
//    int updatecourseIntroduce(String courseIntroduce,Integer courseId);//更改课程介绍
//
//    int updatespeakerHeadImgUrl(String speakerHeadImgUrl,Integer courseId);//更改头像路径
//
//    int insertCourse(String courseName,Integer fieldId,String courseImgURL,String speakerName
//            ,String courseIntroduce,String collectionNumber,String speakerHeadImgUrl,String totalPlayTimes);//新增课程

    public List<Unit> selectUnitsByCourseId(long courseId);
    public List<StudyData> selectUnitFileByUnitId(long unitId);
    public List<Unit> selectUnitsByUnitId(long unitId);
    public Unit selectUnitInfoByUnitId(long unitId);
}
