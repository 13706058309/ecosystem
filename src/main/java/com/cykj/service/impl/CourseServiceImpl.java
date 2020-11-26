package com.cykj.service.impl;

import com.cykj.entity.Course;
import com.cykj.mapper.CourseMapper;
import com.cykj.service.CourseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CourseServiceImpl implements CourseService {
    @Resource
    private CourseMapper courseMapper;

    /**
     * 根据领域ID查询该领域下的课程信息
     * @param fieldId 领域ID
     * @param curr 当前页
     * @param limit 每页条数
     * @return 返回指定领域下当前页的课程列表
     */
    @Override
    public List<Course> selectCourseByFieldId(long fieldId,int curr,int limit,String latest,String hot) {
        // 查询参数组装
        Map<String,Object> conditionMap = new HashMap<>();
        conditionMap.put("fieldId",fieldId);
        conditionMap.put("curr",(curr-1)*limit);
        conditionMap.put("limit",limit);
//        conditionMap.put("latest",latest);
//        conditionMap.put("hot",hot);

        if (!latest.equals("null")){
            conditionMap.put("latest",latest);
        }

        if (!hot.equals("null")){
            conditionMap.put("hot",hot);
        }
        return courseMapper.selectCourseByFieldId(conditionMap);
    }

    /**
     * 根据领域ID，最新（上传时间最新）和最热（播放量最多）得到课程数，未指定ID时，得到所有课程的数量
     * @param fieldId 领域ID
     * @return 返回与条件匹配的数据量
     */
    @Override
    public int selectCount(long fieldId) {

        return courseMapper.selectCount(fieldId);
    }

    /**
     * 查询5门播放量最多的课程
     * @return
     */
    @Override
    public List<Course> hotCourses() {
        return courseMapper.hotCourses();
    }

    @Override
    public Course selectCourseById(String courseId) {
        return courseMapper.selectCourseById(Long.parseLong(courseId));
    }

    @Override
    public List selectRelatedCourses(String courseId){
        return courseMapper.selectRelatedCourses(Long.parseLong(courseId));
    }

    @Override
    public String selectCourseNameByCourseId(long courseId){
        return courseMapper.selectCourseNameByCourseId(courseId);
    }
}
