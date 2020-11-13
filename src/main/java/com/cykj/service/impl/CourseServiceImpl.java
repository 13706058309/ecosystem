package com.cykj.service.impl;

import com.cykj.entity.Course;
import com.cykj.mapper.CourseMapper;
import com.cykj.service.CourseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CourseServiceImpl implements CourseService {
    @Resource
    private CourseMapper courseMapper;
    @Override
    public List<Course> findCourse() {
        System.out.println("已经走到了CourseServiceImpl!");
        return courseMapper.findCourse();
    }
}
