package com.cykj.controller;

import com.cykj.entity.Course;
import com.cykj.entity.TableInfo;
import com.cykj.interceptor.Loger;
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

@Controller
@RequestMapping("/course")
public class CourseController {
    @Resource
private CourseServiceImpl courseServiceImpl;


    @RequestMapping("goBCM")
    @Loger(operationType = "走入管理表格",operationName = "走入管理表格数据")

    public String goBackCourseManagement(){
        System.out.println("走入汤某人的测试控制类，即将访问 后台课程管理的JSP！！");

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
    @RequestMapping("updatecourseImgURL")
    @Loger(operationType = "表格执行更改",operationName = "表格执行更改")
    public void updatecourseImgURL(String courseImgURL,Integer courseId) {
        System.out.println("走入更改控制类");
        System.out.println("courseImgURL="+courseImgURL+";courseId="+courseId);
        if ( courseImgURL != null){
            int updatecourseImgURL = courseServiceImpl.updatecourseImgURL(courseImgURL,courseId);
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
    public void insertCourse(String courseName,Integer fieldId,String courseImgURL,String speakerName
    ,String courseIntroduce,String collectionNumber,String speakerHeadImgUrl,String totalPlayTimes) {
        System.out.println("走入更改控制类");
        System.out.println("courseName:"+courseName+"；fieldId:"+fieldId+"；courseImgURL:"+courseImgURL
                +"；speakerName:"+speakerName+"；courseIntroduce:"+courseIntroduce +"；collectionNumber:"
                +collectionNumber+"；speakerHeadImgUrl:"+speakerHeadImgUrl+"；totalPlayTimes:"+totalPlayTimes);

        if (courseName != null && fieldId !=null && courseImgURL !=null && speakerName != null &&
                courseIntroduce != null && collectionNumber !=null && speakerHeadImgUrl !=null && totalPlayTimes !=null){
            int insertCourse = courseServiceImpl.insertCourse(courseName,fieldId,courseImgURL,speakerName,
                    courseIntroduce,collectionNumber,speakerHeadImgUrl,totalPlayTimes);
        }


    }



    //    @RequestMapping("updateCourse")
//    @Loger(operationType = "表格执行更改",operationName = "表格执行更改")
//    public void updateCourse(Integer courseId_table,String courseName_table,String courseImgURL_table,String courseIntroduce_table,String speakerHeadImgUrl_table
//    ,String courseName,String courseIntroduce,String courseImgURL,String speakerHeadImgUrl){
//        System.out.println("走入更改控制类");
//        System.out.println("面板上的获取值："+courseId_table+courseName_table+courseImgURL_table+courseIntroduce_table+speakerHeadImgUrl_table);
//        System.out.println("输入框的获取值："+courseName+courseIntroduce+courseImgURL+speakerHeadImgUrl);
//
//        Map<String,Object> map = new HashMap<>();
//
//        map.put("courseId_table",courseId_table);
//        map.put("courseName_table",courseName_table);
//        map.put("courseImgURL_table",courseImgURL_table);
//        map.put("courseIntroduce_table",courseIntroduce_table);
//        map.put("speakerHeadImgUrl_table",speakerHeadImgUrl_table);
//        map.put("courseName",courseName);
//        map.put("courseIntroduce",courseIntroduce);
//        map.put("courseImgURL",courseImgURL);
//        map.put("speakerHeadImgUrl",speakerHeadImgUrl);
//
//        int course = courseServiceImpl.updateCourse(map);
//
//
////        Map<String,Object> map = new HashMap<>();
//        if (courseId_table != 0){
////            map.put("courseId",courseId);
////            int course = courseServiceImpl.deleteCourse(courseId);
//        }//








//    @RequestMapping("findCourse")
//    public void  findCourse(HttpServletRequest req, HttpServletResponse resp) throws IOException {
//        System.out.println("已经走到了控制类的findCourse");
//        List<Course> courseList = null;
//        courseList =courseServiceimpl.findCourse();
//        TableInfo tableInfo = new TableInfo();
//        tableInfo.setCode(0);
//        tableInfo.setCount(100);
//        tableInfo.setMsg("信息");
//        tableInfo.setData(courseList);
//
//        String remsg = new Gson().toJson(tableInfo);
//        System.out.println("打印remsg:"+remsg);
//        resp.setContentType("text/html;charset=UTF-8");
//        PrintWriter out = resp.getWriter();
//        out.write(remsg);
//        out.flush();
//        out.close();
//
//    }



//    @RequestMapping("search")
//    public void  search(HttpServletRequest req, HttpServletResponse resp,String courseName) throws IOException {
//        System.out.println("哇哦！ 响应成功，走入search！");
//        System.out.println("courseName的值为:"+courseName);
//        List<Course> courseList = null;
//        courseList =courseServiceimpl.search(courseName);
//        TableInfo tableInfo = new TableInfo();
//        tableInfo.setCode(0);
//        tableInfo.setCount(100);
//        tableInfo.setMsg("信息");
//        tableInfo.setData(courseList);
//
//        String remsg = new Gson().toJson(tableInfo);
//        System.out.println("打印remsg:"+remsg);
//        resp.setContentType("text/html;charset=UTF-8");
//        PrintWriter out = resp.getWriter();
//        out.write(remsg);
//        out.flush();
//        out.close();
//
//    }
}
