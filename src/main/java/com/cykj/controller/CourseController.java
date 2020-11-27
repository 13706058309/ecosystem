package com.cykj.controller;

import com.cykj.entity.Course;

import com.cykj.entity.CourseCollect;
import com.cykj.entity.Field;
import com.cykj.entity.Unit;
import com.cykj.service.CourseCollectService;
import com.cykj.service.CourseService;
import com.cykj.service.FieldService;
import com.google.gson.Gson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import java.util.List;

@Controller
@RequestMapping("/course")
public class CourseController {
    @Resource
    private CourseService courseServiceImpl;
    @Resource
    private FieldService fieldServiceImpl;
    @Resource
    private CourseCollectService courseCollectServiceImpl;

    // 初始化领域和课程信息并返回课程首页
    @RequestMapping("/homePage")
    public String returnHomePage(HttpServletRequest request){
        // 获取所有领域
        List<Field> fields = fieldServiceImpl.selectAllFieldName();
        List<Course> hotCourses = courseServiceImpl.hotCourses();

        request.getSession().setAttribute("fields",fields);
        request.setAttribute("hotCourses",hotCourses);
        request.setAttribute("count",courseServiceImpl.selectCount(0));
        return "coursePage/CourseHomePage";
    }

    /**
     * 根据领域ID和分页参数获取指定领域下的所有课程，分页展示
     * @param request 请求对象
     * @param response 响应对象
     * @param fieldId   指定领域的ID
     * @param curr  layui中的当前页参数
     * @param limit layui中的每页数据条数
     * @param latest 最新课程
     * @param hot 最热课程
     * @return
     */
    @RequestMapping("/selectCourseByFieldId")
    public void selectCourseByFieldId(HttpServletRequest request, HttpServletResponse response,String fieldId, int curr, int limit,String latest,String hot){
        if (fieldId==null){
            fieldId="0";
        }
//        System.out.println("fieldId: "+fieldId+"   curr: "+curr+"   limit: "+limit+"   latest: "+latest+"   hot: "+hot);
        long fid = Long.parseLong(fieldId);
        // 获取指定领域下的所有课程信息
        List<Course> courses = courseServiceImpl.selectCourseByFieldId(fid,curr,limit,latest,hot);

        Map map = new HashMap();
        // 当查询条件相同，只是当前页不同时，只在第一页查询时获取当前条件下的数据总数
        if (curr==1 && (latest.equals("null")) &&  (hot.equals("null"))){
            map.put("count",courseServiceImpl.selectCount(fid));
        }
        if ( curr==1 && (!latest.equals("null") ||  !hot.equals("null"))){
            System.out.println(123);
            map.put("count",limit);
        }

        // 将条件查询获得的课程列表转换成JSON格式，再以流的形式返回给ajax
        map.put("fieldId",fieldId);
        map.put("courses",courses);
        String jsonData = new Gson().toJson(map);
        PrintWriter out = null;
        try {
            out = response.getWriter();
            out.write(jsonData);
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // 返回课程详情页
    @RequestMapping("/detailPage")
    public String returnDetailPage(HttpServletRequest request,String courseId,String userId){
        // 查询当前课程的详细信息，显示在课程详情页。如课程名，课程图片，播放量，被收藏次数等
        Course course = courseServiceImpl.selectCourseById(courseId);
        // 查询与当前课程相关的其他课程信息
        List relatedCourses = courseServiceImpl.selectRelatedCourses(courseId);
        // 查询当前课程是否已被当前登录用户收藏
        CourseCollect courseCollect = courseCollectServiceImpl.isCollectedByCourseIdAndUserId(courseId,userId);

        // 已收藏
        if (courseCollect!=null){
            request.setAttribute("courseCollect",courseCollect);
        }
        request.setAttribute("course",course);
        request.setAttribute("relatedCourses",relatedCourses);
        return "coursePage/CourseDetailPage";
    }

    // 返回相关评价页
    @RequestMapping("/evaluationPage")
    public String returnEvaluationPage(){ return  "coursePage/CourseEvaluationPage";}
}
