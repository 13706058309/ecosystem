package com.cykj.controller;

import com.cykj.entity.Course;
import com.cykj.entity.TableInfo;
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
@RequestMapping("/txjtext")
public class TxjTestController {
    @Resource
private CourseServiceImpl courseServiceimpl;


    @RequestMapping("goBCM")
    public String goBackCourseManagement(){
        System.out.println("走入汤某人的测试控制类，即将访问 后台课程管理的JSP！！");

        return "BackCourseManagement";
    }

    @RequestMapping(value = "/findCourse",produces = "text/html;charset=UTF-8")
    public @ResponseBody
    String getTableInfo(Integer page,Integer limit,String courseName){
        System.out.println("我获取到了courseName,值为："+courseName);
        Map<String,Object> map = new HashMap<>();
        if (courseName != null && courseName.length() !=0){
            map.put("courseName",courseName);
        }else {
            map.put("courseName","");
        }
        TableInfo tableInfo = courseServiceimpl.findCourse(map,page,limit);
        return new Gson().toJson(tableInfo);
    }

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
