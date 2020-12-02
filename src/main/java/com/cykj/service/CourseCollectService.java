package com.cykj.service;

import com.cykj.entity.Course;
import com.cykj.entity.CourseCollect;

import java.util.List;
import java.util.Map;

public interface CourseCollectService {
    public CourseCollect isCollectedByCourseIdAndUserId(String courseId,String userId);
    public int addCollectionByCourseIdAndUserId(String courseId,String userId,String collectTime);
    public int deleteCollectionByCourseIdAndUserId(String courseId,String userId);
    public List<Course> selectCollectCoursesByUserId(String userId);
}
