package com.cykj.controller;

import com.cykj.entity.Course;

import com.cykj.entity.CourseCollect;
import com.cykj.entity.Field;
import com.cykj.entity.TableInfo;
import com.cykj.log.Loger;
import com.cykj.entity.Unit;
import com.cykj.service.CourseCollectService;
import com.cykj.service.CourseService;
import com.cykj.service.FieldService;
import com.cykj.service.impl.CourseServiceImpl;
import com.google.gson.Gson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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

    @RequestMapping("/goBCM")
    @Loger(operationType = "走入管理表格",operationName = "走入管理表格数据")
    public String goBackCourseManagement(HttpServletRequest request){
        System.out.println("走入汤某人的测试控制类，即将访问 后台课程管理的JSP！！");

        List<Field> fieldList = courseServiceImpl.fieldList();
        request.setAttribute("fieldList",fieldList);
        return "BackCourseManagement";
    }

    @RequestMapping(value = "/findCourse",produces = "text/html;charset=UTF-8")
    @Loger(operationType = "录入表格数据",operationName = "录入表格数据")
    public @ResponseBody
    String getTableInfo(Integer page,Integer limit,String courseName,String fieldId){

        System.out.println("我获取到了courseName,值为："+courseName);
        System.out.println("我获取到了selectvalue,值为："+fieldId);
        Map<String,Object> map = new HashMap<>();
        if (courseName != null && courseName.length() != 0){
            map.put("courseName",courseName);
            //map.put("selectvalue",selectvalue);
            System.out.println("map有值，值为："+map);
        }
        else {
            map.put("courseName","");
            //map.put("selectvalue",selectvalue);
            System.out.println("搜索框為空，但是下拉框可能有值，值為："+map);
        }
        if (fieldId != null && fieldId.length() != 0){
            map.put("fieldId",fieldId);
            System.out.println("map有值，值为："+map);
        }
        TableInfo tableInfo = courseServiceImpl.findCourse(map,page,limit);
        return new Gson().toJson(tableInfo);
    }


    @RequestMapping("deleteCourse")
    @Loger(operationType = "表格执行删除",operationName = "表格执行删除")
    public void deleteCourse(HttpServletRequest req,HttpServletResponse resp,Integer courseId){
        System.out.println(courseId);
        System.out.println("走入删除 控制类");

//        Map<String,Object> map = new HashMap<>();
        if (courseId != 0){
//            map.put("courseId",courseId);
            int course = courseServiceImpl.deleteCourse(courseId);
        }

    }


    @RequestMapping("updateCourseName")//更改课程名称
    @Loger(operationType = "表格执行更改",operationName = "表格执行更改")
    public void updateCourseName(String courseName,Integer courseId) {
        System.out.println("走入更改控制类");
        System.out.println("courseName="+courseName+";courseId="+courseId);
        if ( courseName != null){
            int updatecourseName = courseServiceImpl.updateCourseName(courseName,courseId);
        }
    }


    //更改课程路径
    @RequestMapping("updatecourseImgUrl")
    @Loger(operationType = "表格执行更改",operationName = "表格执行更改")
    public void updatecourseImgUrl(String courseImgUrl,Integer courseId) {
        System.out.println("走入更改控制类");
        System.out.println("courseImgUrl="+courseImgUrl+";courseId="+courseId);
        if ( courseImgUrl != null){
            int updatecourseImgUrl = courseServiceImpl.updatecourseImgUrl(courseImgUrl,courseId);
        }
    }


    @RequestMapping("updatecourseIntroduce")//更改课程介绍
    @Loger(operationType = "表格执行更改",operationName = "表格执行更改")
    public void updatecourseIntroduce(String courseIntroduce,Integer courseId) {
        System.out.println("走入更改控制类");
        System.out.println("courseIntroduce="+courseIntroduce+";courseId="+courseId);
        if ( courseIntroduce != null){
            int updateCourseIntroduce = courseServiceImpl.updatecourseIntroduce(courseIntroduce,courseId);
        }
    }


    @RequestMapping("updatespeakerHeadImgUrl")//更改头像路径
    @Loger(operationType = "表格执行更改",operationName = "表格执行更改")
    public void updatespeakerHeadImgUrl(String speakerHeadImgUrl,Integer courseId) {
        System.out.println("走入更改控制类");
        System.out.println("speakerHeadImgUrl="+speakerHeadImgUrl+";courseId="+courseId);
        if ( speakerHeadImgUrl != null){
            int updateSpeakerHeadImgUrl = courseServiceImpl.updatespeakerHeadImgUrl(speakerHeadImgUrl,courseId);
        }
    }


    @RequestMapping("insertCourse")//更改头像路径
    @Loger(operationType = "表格执行新增",operationName = "表格执行新增")
    public void insertCourse(String courseName,Integer fieldId,String courseImgUrl,String speakerName
    ,String courseIntroduce,String collectionNumber,String speakerHeadImgUrl,String totalPlayTimes) {
        System.out.println("走入更改控制类");
        System.out.println("courseName:"+courseName+"；fieldId:"+fieldId+"；courseImgUrl:"+courseImgUrl
                +"；speakerName:"+speakerName+"；courseIntroduce:"+courseIntroduce +"；collectionNumber:"
                +collectionNumber+"；speakerHeadImgUrl:"+speakerHeadImgUrl+"；totalPlayTimes:"+totalPlayTimes);

        if (courseName != null && fieldId !=null && courseImgUrl !=null && speakerName != null &&
                courseIntroduce != null && collectionNumber !=null && speakerHeadImgUrl !=null && totalPlayTimes !=null){
            int insertCourse = courseServiceImpl.insertCourse(courseName,fieldId,courseImgUrl,speakerName,
                    courseIntroduce,collectionNumber,speakerHeadImgUrl,totalPlayTimes);
        }


    }




    @RequestMapping("findOption")//寻找下拉框
    @Loger(operationType = "表格执行新增",operationName = "表格执行新增")
    public void findOption() {
        System.out.println("走入控制类");

        String  findOption = courseServiceImpl.findOption();
    }


    /**
     * 初始化领域和课程信息并返回课程首页
     * @param request http请求对象
     * @return 课程首页的相对路径
     */
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
     * @param response 响应对象
     * @param fieldId   指定领域的ID
     * @param curr  layui中的当前页参数
     * @param limit layui中的每页数据条数
     * @param latest 最新课程
     * @param hot 最热课程
     * @return 无返回值
     */
    @RequestMapping("/selectCourseByFieldId")
    public void selectCourseByFieldId(HttpServletResponse response,String fieldId, int curr, int limit,String latest,String hot){
        if (fieldId==null){
            fieldId="0";
        }
        long fid = Long.parseLong(fieldId);
        // 获取指定领域下的所有课程信息
        List<Course> courses = courseServiceImpl.selectCourseByFieldId(fid,curr,limit,latest,hot);

        Map map = new HashMap();
        // 当查询条件相同，只是当前页不同时，只在第一页查询时获取当前条件下的数据总数
        if (curr==1 && (latest.equals("null")) &&  (hot.equals("null"))){
            map.put("count",courseServiceImpl.selectCount(fid));
        }
        if ( curr==1 && (!latest.equals("null") ||  !hot.equals("null"))){
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

    /**
     * 进入课程详情页
     * @param request
     * @param courseId 要查看的课程ID
     * @param userId  当前在线用户的ID
     * @return 课程详情页的相对路径
     */
    @RequestMapping("/detailPage")
    public String returnDetailPage(HttpServletRequest request,String courseId,String userId){
        // 查询查看的课程所属的详细信息
        Course course = courseServiceImpl.selectCourseById(courseId);
        // 查询与该课程相关的5门课程
        List relatedCourses = courseServiceImpl.selectRelatedCourses(courseId);
        // 查询该课程是否已被当前用户收藏
        CourseCollect isCollectedCourse = courseCollectServiceImpl.isCollectedByCourseIdAndUserId(courseId,userId);

        // 以上查询到的信息保存在request域中，加载详情页时，从此域中将数据取出并展示在页面上
        request.setAttribute("courseCollect",isCollectedCourse);
        request.setAttribute("course",course);
        request.setAttribute("relatedCourses",relatedCourses);
        return "coursePage/CourseDetailPage";
    }

    /**
     * 进入相关评价页
     * @return 相关评价页的相对路径
     */
    @RequestMapping("/evaluationPage")
    public String returnEvaluationPage(){ return  "coursePage/CourseEvaluationPage";}
}
