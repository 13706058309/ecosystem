package com.cykj.service;

import com.cykj.entity.Course;
import com.cykj.entity.TableInfo;

import java.util.List;
import java.util.Map;

public interface CourseService {
    public TableInfo findCourse(Map<String,Object> map,Integer page,Integer limit);
//    public List<Course> findCourse();
//    public List<Course> search(String courseName);
}
