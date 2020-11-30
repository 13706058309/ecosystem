package com.cykj.service.impl;

import com.cykj.entity.Course;
import com.cykj.entity.CourseCollect;
import com.cykj.mapper.CourseCollectMapper;
import com.cykj.service.CourseCollectService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CourseCollectServiceImpl implements CourseCollectService {
    @Resource
    private CourseCollectMapper courseCollectMapper;

    @Override
    public CourseCollect isCollectedByCourseIdAndUserId(String courseId, String userId) {
        Map<String,Long> parameterMap = new HashMap<>();
        parameterMap.put("courseId",Long.parseLong(courseId));
        parameterMap.put("userId",Long.parseLong(userId));
        return courseCollectMapper.isCollectedByCourseIdAndUserId(parameterMap);
    }

    @Override
    public int addCollectionByCourseIdAndUserId(String courseId, String userId, String collectTime) {
        Map<String,Object> parameterMap = new HashMap<>();
        parameterMap.put("courseId",Long.parseLong(courseId));
        parameterMap.put("userId",Long.parseLong(userId));
        parameterMap.put("collectTime",collectTime);
        return courseCollectMapper.addCollectionByCourseIdAndUserId(parameterMap);
    }

    @Override
    public int deleteCollectionByCourseIdAndUserId(String courseId, String userId) {
        Map<String,Long> parameterMap = new HashMap<>();
        parameterMap.put("courseId",Long.parseLong(courseId));
        parameterMap.put("userId",Long.parseLong(userId));
        return courseCollectMapper.deleteCollectionByCourseIdAndUserId(parameterMap);
    }

    @Override
    public List<Course> selectCollectCoursesByUserId(String userId) {
        return courseCollectMapper.selectCollectCoursesByUserId(Long.parseLong(userId));
    }
}
