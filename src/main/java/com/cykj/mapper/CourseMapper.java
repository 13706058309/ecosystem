package com.cykj.mapper;

import com.cykj.entity.Course;
import com.cykj.entity.Field;
import com.cykj.entity.Unit;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
@Repository
/**
 * 课程
 */
public interface CourseMapper {
    List<Course> findCourseOnPage(Map<String, Object> map);

    List<Field> fieldList();

    int findNumOnPage(Map<String, Object> map);

    int deleteCourse(Integer courseId);

    int updateCourseName(String courseName,Integer courseId);//更改课程名字

    int updatecourseImgURL(String courseImgURL,Integer courseId);//更改路径

    int updatecourseIntroduce(String courseIntroduce,Integer courseId);//更改课程介绍

    int updatespeakerHeadImgUrl(String speakerHeadImgUrl,Integer courseId);//更改头像路径

    int insertCourse(String courseName,Integer fieldId,String courseImgURL,String speakerName
            ,String courseIntroduce,String collectionNumber,String speakerHeadImgUrl,String totalPlayTimes);//新增课程


    String findOption();
//public List<Course> findCourse();
//public List<Course> search(String courseName);
}
