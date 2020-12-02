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

    /**
     * 进入课程的评价页
     * @param request 请求对象
     * @param courseId 评价所属的课程Id
     * @return 课程评价页的相对路径
     */
    @RequestMapping("/evaluationPage")
    public String getEvaluationPage(HttpServletRequest request,String courseId){
        // 查询出courseId表示的课程下的评价数量
        int totalNums =  courseAppraiseServiceImpl.selectCountByCourseId(courseId);
        // 课程ID的回返，前台异步获取评价数据时需要该ID，故回返到评价页
        request.setAttribute("courseId",courseId);
        // 将查询出的评价数量保存在request域中，前台从中取出保存在一个div中，作为计算评价总页数的条件
        request.setAttribute("totalNums",totalNums);
        return "coursePage/CourseEvaluationPage";
    }

    /**
     * 查询剩余未显示的评价中指定数量的评价
     * 如果是课程详情页的评价，则前台会传courseId参数，不传unitId参数
     * 如果是视频播放页的评价，则前台会传unitId参数，不传courseId参数
     * @param response 响应对象
     * @param courseId 评价所属的课程Id
     * @param unitId 当前播放章节视频的ID，根据该ID查询出该章节所属的课程ID，再根据课程ID，获取评价信息
     * @param page 评价是分页显示的，故该参数表示此次查询出的评价所在的页码
     * @param limit 每页显示的评价条数
     */
    @RequestMapping("/loadMore")
    public void loadMore(HttpServletResponse response,String courseId,String unitId,String page,String limit){
        List<CourseAppraise> evaluations = null;
        if (courseId!=null){
            // 课程详情页中，点击“相关评价”，根据课程ID查询出第page页的评价内容
            evaluations = courseAppraiseServiceImpl.selectAppraiseByCourseId(courseId,page,limit);
        }else if (unitId!=null){
            // 视频播放页，点击“发表评论”，根据章节ID查询出章节所属的课程ID，再根据课程ID查询出第page页的评价内容
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

    /**
     * 进入视频播放页
     * @param request 请求对象
     * @param unitId 要播放的章节ID
     * @return 视频播放页的相对路径
     */
    @RequestMapping("/playPage")
    public String getPlayPage(HttpServletRequest request,String unitId){
        // 课程表中的播放量字段增加1
        courseServiceImpl.updateTotalPlayTimesByUnitId(unitId);

        // 根据播放章节ID查询出当前播放章节所属课程下的章节数，所有章节，当前播放章节信息，方便用户在视频播放区域右侧，选择其他章节进行播放
        int totalNums =  courseAppraiseServiceImpl.selectCountByUnitId(unitId);
        List<Unit> unitList = unitServiceImpl.selectUnitsByUnitId(unitId);
        Unit currPlayUnit = unitServiceImpl.selectUnitInfoByUnitId(unitId);
        // 查询出当前播放章节所属的课程名，展示在视频播放区域的下面
        String currCourseName = courseServiceImpl.selectCourseNameByCourseId(currPlayUnit.getCourseId());
        // 章节ID的回返，前台异步获取评价数据时需要该ID，故回返到评价页
        request.setAttribute("unitId",unitId);
        // 将以上查询到的信息保存在request域中，前台从该域取出数据并进行展示
        request.setAttribute("totalNums",totalNums);
        request.setAttribute("unitList",unitList);
        request.setAttribute("currPlayUnit",currPlayUnit);
        request.setAttribute("currCourseName",currCourseName);
        return "coursePage/CoursePlayPage";
    }

    /**
     * 保存当前用户对当前播放播放视频所属课程的评价信息
     * @param response 响应对象
     * @param unitId 当前播放视频的章节ID
     * @param userId 当前登录用户ID
     * @param appraiseText 评价内容
     * @param appraiseTime 评价时的时间
     */
    @RequestMapping("/publish")
    public void publishEvaluation(HttpServletResponse response,String unitId,String userId,String appraiseText,String appraiseTime){
        long courseId = courseAppraiseServiceImpl.selectCourseIdByUnitId(unitId);
        // 将评价信息保存在数据库中
        String result = courseAppraiseServiceImpl.addAppraise(courseId,userId,appraiseText,appraiseTime);

        // 将保存的结果告知用户，若数据成功插入数据库，则发送一个success给前台，前台提示感谢评价
        // 若数据插入数据库失败，则发送一个false给前台，前台提示服务器繁忙，请稍后再试
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
