package com.cykj.service;

import com.cykj.entity.TableInfo;

import java.util.Map;

public interface UnitService {
    public TableInfo findCourse(Integer page,Integer limit,String unitName);
//    public int deleteCourse(Integer courseId);
//    public int updateCourseName(String courseName, Integer courseId);//更改课程名字
//    public int updatecourseImgURL(String courseImgURL, Integer courseId);//更改路径
//    public int updatecourseIntroduce(String courseIntroduce, Integer courseId);//更改课程介绍
//    public int updatespeakerHeadImgUrl(String speakerHeadImgUrl, Integer courseId);//更改头像路径
//    public int insertCourse(String courseName, Integer fieldId, String courseImgURL, String speakerName
//            , String courseIntroduce, String collectionNumber, String speakerHeadImgUrl, String totalPlayTimes);//增加课程





//    public List<Course> findCourse();
//    public List<Course> search(String courseName);
}
