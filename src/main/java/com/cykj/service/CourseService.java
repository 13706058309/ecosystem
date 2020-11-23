package com.cykj.service;

import com.cykj.entity.Course;
import com.cykj.entity.TableInfo;

import java.util.List;
import java.util.Map;

public interface CourseService {
    public TableInfo findCourse(Map<String,Object> map,Integer page,Integer limit);
    public int deleteCourse(Integer courseId);
    public int updateCourseName(String courseName,Integer courseId);//更改课程名字
    public int updatecourseImgURL(String courseImgURL,Integer courseId);//更改路径
    public int updatecourseIntroduce(String courseIntroduce,Integer courseId);//更改课程介绍
    public int updatespeakerHeadImgUrl(String speakerHeadImgUrl,Integer courseId);//更改头像路径
//    public List<Course> findCourse();
//    public List<Course> search(String courseName);
}
