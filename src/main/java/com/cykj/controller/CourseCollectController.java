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

    /**
     * 当前登录用户收藏课程
     * @param response 响应对象
     * @param courseId 要收藏的课程ID
     * @param userId 当前登录用户ID
     * @param collectTime 收藏时间
     * @throws IOException
     */
    @RequestMapping("/collectCourse")
    public void collectCourse(HttpServletResponse response,String courseId, String userId, String collectTime) throws IOException {
        // 保存用户收藏的课程信息
        int result = courseCollectServiceImpl.addCollectionByCourseIdAndUserId(courseId,userId,collectTime);
        if (result>0){
            // 课程表的被收藏字段值加1
            courseServiceImpl.increaseCollectionNumberByCourseId(courseId);
            response.getWriter().write("collectSuccess");
        }else {
            response.getWriter().write("collectFail");
        }
    }

    /**
     * 用户取消课程的收藏
     * @param response 响应对象
     * @param courseId 要取消收藏的课程ID
     * @param userId 当前登录用户ID
     * @throws IOException
     */
    @RequestMapping("/cancelCollectCourse")
    public void cancelCollectCourse(HttpServletResponse response,String courseId, String userId) throws IOException {
        // 删除对该课程的收藏记录
        int result = courseCollectServiceImpl.deleteCollectionByCourseIdAndUserId(courseId,userId);
        if (result>0){
            // 课程表的被收藏字段值减1
            courseServiceImpl.decreaseCollectionNumberByCourseId(courseId);
            response.getWriter().write("cancelSuccess");
        }else {
            response.getWriter().write("cancelFail");
        }
    }

    /**
     * 进入当前的呢过路用户的关注课程页
     * @return 关注课程页的相对路径
     */
    @RequestMapping("/collectionPage")
    public String returnCollectionPage(){
        return "coursePage/CourseCollectionPage";
    }

    /**
     * 查询当前登录用户的收藏的所有课程
     * @param response 响应对象
     * @param userId 当前登录用户ID
     * @throws IOException
     */
    @RequestMapping("/collectCourses")
    public void selectCollectCourses(HttpServletResponse response,String userId) throws IOException {
        // 根据当前登录用户的userId查询收藏的课程
        List<Course> courses = courseCollectServiceImpl.selectCollectCoursesByUserId(userId);
        String jsonData = new Gson().toJson(courses);
        response.getWriter().write(jsonData);
    }
}
