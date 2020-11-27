package com.cykj.service;

import com.cykj.entity.CourseCollect;

import java.util.Map;

public interface CourseCollectService {
    public CourseCollect isCollectedByCourseIdAndUserId(String courseId,String userId);
    public int addCollectionByCourseIdAndUserId(String courseId,String userId,String collectTime);
    public int deleteCollectionByCourseIdAndUserId(String courseId,String userId);
}
