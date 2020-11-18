package com.cykj.service.impl;

import com.cykj.entity.Course;
import com.cykj.entity.TableInfo;
import com.cykj.mapper.CourseMapper;
import com.cykj.service.CourseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class CourseServiceImpl implements CourseService {
        @Resource
    private CourseMapper courseMapper;
    @Override
    public TableInfo findCourse(Map<String, Object> map, Integer page, Integer limit) {
        map.put("limit",limit);
        map.put("offset",(page - 1) * limit);
        System.out.println("CourseServiceImpl里map的值为："+map);
        List<Course> allOnPage = courseMapper.findCourseOnPage(map);
        int numOnPage = courseMapper.findNumOnPage(map);
        TableInfo tableInfo = new TableInfo(0,"后台用户信息数据",numOnPage,allOnPage);
        return tableInfo;
    }

    @Override
    public int deleteCourse(Integer courseId) {
        int course = courseMapper.deleteCourse(courseId);
        return  course;
    }

//    @Resource
//    private CourseMapper courseMapper;
//    @Override
//    public List<Course> findCourse() {
//        System.out.println("已经走到了CourseServiceImpl! 显示列表方法");
//        return courseMapper.findCourse();
//    }
//
//    @Override
//    public List<Course> search(String courseName) {
//        System.out.println("已经走到了CourseServiceImpl! 搜索按钮监听");
//        System.out.println("CourseServiceImpl里的courseName值为："+courseName);
//        return courseMapper.search(courseName);
//    }
}
