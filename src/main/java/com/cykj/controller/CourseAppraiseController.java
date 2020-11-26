package com.cykj.controller;

import com.cykj.entity.CourseAppraise;
import com.cykj.entity.Unit;
import com.cykj.service.CourseAppraiseService;
import com.cykj.service.CourseService;
import com.cykj.service.UnitService;
import com.google.gson.Gson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/courseAppraise")
public class CourseAppraiseController {
    @Resource
    private CourseAppraiseService courseAppraiseServiceImpl;
    @Resource
    private UnitService unitServiceImpl;
    @Resource
    private CourseService courseServiceImpl;

    @RequestMapping("/evaluationPage")
    public String getEvaluationPage(HttpServletRequest request,String courseId){
        int totalNums =  courseAppraiseServiceImpl.selectCountByCourseId(courseId);
        // 课程ID的回返，前台异步获取评价数据时需要该ID，故回返到评价页
        request.setAttribute("courseId",courseId);
        request.setAttribute("totalNums",totalNums);
        return "coursePage/CourseEvaluationPage";
    }

    @RequestMapping("/loadMore")
    public void loadMore(HttpServletResponse response,String courseId,String unitId,String page,String limit){
//        System.out.println("courseId: "+courseId+"    unitId: "+unitId);
        List<CourseAppraise> evaluations = null;
        if (courseId!=null){
            evaluations = courseAppraiseServiceImpl.selectAppraiseByCourseId(courseId,page,limit);
        }else if (unitId!=null){
            evaluations = courseAppraiseServiceImpl.selectAppraiseByUnitId(unitId,page,limit);
        }
        // 将条件查询获得的评价列表转换成JSON格式，再以流的形式返回给ajax
        String jsonData = new Gson().toJson(evaluations);
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

    @RequestMapping("/playPage")
    public String getPlayPage(HttpServletRequest request,String unitId){
        int totalNums =  courseAppraiseServiceImpl.selectCountByUnitId(unitId);
        List<Unit> unitList = unitServiceImpl.selectUnitsByUnitId(unitId);
        Unit currPlayUnit = unitServiceImpl.selectUnitInfoByUnitId(unitId);
        String currCourseName = courseServiceImpl.selectCourseNameByCourseId(currPlayUnit.getCourseId());
        // 章节ID的回返，前台异步获取评价数据时需要该ID，故回返到评价页
        request.setAttribute("unitId",unitId);
        request.setAttribute("totalNums",totalNums);
        request.setAttribute("unitList",unitList);
        request.setAttribute("currPlayUnit",currPlayUnit);
        request.setAttribute("currCourseName",currCourseName);
        return "coursePage/CoursePlayPage";
    }

    @RequestMapping("/publish")
    public void publishEvaluation(HttpServletResponse response,String unitId,String userId,String appraiseText,String appraiseTime){

        System.out.println("unitId: "+unitId+"   userId: "+userId+"   appraiseText: "+appraiseText+"   appraiseTime: "+appraiseTime);
        long courseId = courseAppraiseServiceImpl.selectCourseIdByUnitId(unitId);
        String result = courseAppraiseServiceImpl.addAppraise(courseId,userId,appraiseText,appraiseTime);

        try {
            if (result == null){
                response.getWriter().write("success");
            }else {
                response.getWriter().write("false");
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
