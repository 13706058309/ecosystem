package com.cykj.service;

import com.cykj.entity.Course;
import com.cykj.entity.Unit;

import java.util.List;
import java.util.Map;

public interface CourseService {
    public List<Course> selectCourseByFieldId(long fieldId,int curr,int limit,String latest,String hot);

    public int selectCount(long fieldId);

    public List<Course> hotCourses();

    public Course selectCourseById(String courseId);

    public List selectRelatedCourses(String courseId);

    public String selectCourseNameByCourseId(long courseId);
}
