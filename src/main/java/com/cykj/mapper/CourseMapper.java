package com.cykj.mapper;

import com.cykj.entity.Course;
import com.cykj.entity.Unit;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface CourseMapper {
    /**
     * 根据领域ID查询课程信息，ID为0时，查询所有
     * @param conditionMap
     * @return 返回课程列表
     */
    public List<Course> selectCourseByFieldId(Map<String,Object> conditionMap);

    public int selectCount(long fieldId);

    /**
     * 查询5门播放量最多的课程
     * @return
     */
    public List<Course> hotCourses();

    /**
     * 根据课程ID查询课程的相关信息
     * @param courseId
     * @return
     */
    public Course selectCourseById(long courseId);

    /**
     * 根据课程ID查询和该课程相关的5门播放量最多的课程
     * @param courseId
     * @return
     */
    public List selectRelatedCourses(long courseId);

    public String selectCourseNameByCourseId(long courseId);
}
