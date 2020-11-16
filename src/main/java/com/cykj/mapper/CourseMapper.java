package com.cykj.mapper;

import com.cykj.entity.Course;
import com.cykj.entity.Field;
import com.cykj.entity.Unit;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
/**
 * 课程
 */
public interface CourseMapper {
    List<Course> findCourseOnPage(Map<String, Object> map);

    int findNumOnPage(Map<String, Object> map);


//public List<Course> findCourse();
//public List<Course> search(String courseName);
}
