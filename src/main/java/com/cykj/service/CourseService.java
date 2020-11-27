package com.cykj.service;

import com.cykj.entity.Course;
import com.cykj.entity.Field;
import com.cykj.entity.TableInfo;
import com.cykj.entity.Unit;

import java.util.List;
import java.util.Map;

public interface CourseService {
    public TableInfo findCourse(Map<String,Object> map,Integer page,Integer limit);
    public List<Field> fieldList();
    public int deleteCourse(Integer courseId);
    public int updateCourseName(String courseName,Integer courseId);//更改课程名字
    public int updatecourseImgUrl(String courseImgUrl,Integer courseId);//更改路径
    public int updatecourseIntroduce(String courseIntroduce,Integer courseId);//更改课程介绍
    public int updatespeakerHeadImgUrl(String speakerHeadImgUrl,Integer courseId);//更改头像路径
    public int insertCourse(String courseName,Integer fieldId,String courseImgUrl,String speakerName
            ,String courseIntroduce,String collectionNumber,String speakerHeadImgUrl,String totalPlayTimes);//增加课程

    public String findOption();

//    public List<Course> findCourse();
//    public List<Course> search(String courseName);
    public List<Course> selectCourseByFieldId(long fieldId,int curr,int limit,String latest,String hot);

    public int selectCount(long fieldId);

    public List<Course> hotCourses();

    public Course selectCourseById(String courseId);

    public List selectRelatedCourses(String courseId);

    public String selectCourseNameByCourseId(long courseId);
}
