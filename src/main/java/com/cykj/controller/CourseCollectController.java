package com.cykj.controller;

import com.cykj.service.CourseCollectService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/collect")
public class CourseCollectController {
    @Resource
    private CourseCollectService courseCollectServiceImpl;

    @RequestMapping("/collectCourse")
    public void collectCourse(HttpServletResponse response,String courseId, String userId, String collectTime) throws IOException {
        int result = courseCollectServiceImpl.addCollectionByCourseIdAndUserId(courseId,userId,collectTime);
//        System.out.println(result);
        if (result>0){
            response.getWriter().write("collectSuccess");
        }else {
            response.getWriter().write("collectFail");
        }
    }

    @RequestMapping("/cancelCollectCourse")
    public void cancelCollectCourse(HttpServletResponse response,String courseId, String userId) throws IOException {
        int result = courseCollectServiceImpl.deleteCollectionByCourseIdAndUserId(courseId,userId);
        if (result>0){
            response.getWriter().write("cancelSuccess");
        }else {
            response.getWriter().write("cancelFail");
        }
    }
}
