package com.cykj.controller;

import com.cykj.entity.Course;
import com.cykj.service.CourseCollectService;
import com.cykj.service.CourseService;
import com.google.gson.Gson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/collect")
public class CourseCollectController {
    @Resource
    private CourseCollectService courseCollectServiceImpl;
    @Resource
    private CourseService courseServiceImpl;

    @RequestMapping("/collectCourse")
    public void collectCourse(HttpServletResponse response,String courseId, String userId, String collectTime) throws IOException {
        int result = courseCollectServiceImpl.addCollectionByCourseIdAndUserId(courseId,userId,collectTime);
        if (result>0){
            // 课程表的被收藏字段值加1
            courseServiceImpl.increaseCollectionNumberByCourseId(courseId);
            response.getWriter().write("collectSuccess");
        }else {
            response.getWriter().write("collectFail");
        }
    }

    @RequestMapping("/cancelCollectCourse")
    public void cancelCollectCourse(HttpServletResponse response,String courseId, String userId) throws IOException {
        int result = courseCollectServiceImpl.deleteCollectionByCourseIdAndUserId(courseId,userId);
        if (result>0){
            // 课程表的被收藏字段值减1
            courseServiceImpl.decreaseCollectionNumberByCourseId(courseId);
            response.getWriter().write("cancelSuccess");
        }else {
            response.getWriter().write("cancelFail");
        }
    }

    @RequestMapping("/collectionPage")
    public String returnCollectionPage(){
        return "coursePage/CourseCollectionPage";
    }

    @RequestMapping("/collectCourses")
    public void selectCollectCourses(HttpServletResponse response,String userId) throws IOException {
        List<Course> courses = courseCollectServiceImpl.selectCollectCoursesByUserId(userId);
        String jsonData = new Gson().toJson(courses);
        response.getWriter().write(jsonData);
    }
}
