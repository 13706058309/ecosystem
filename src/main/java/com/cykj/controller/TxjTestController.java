package com.cykj.controller;

import com.cykj.entity.Course;
import com.cykj.entity.TableInfo;
import com.cykj.service.impl.CourseServiceImpl;
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
@RequestMapping("/txjtext")
public class TxjTestController {
    @Resource
private CourseServiceImpl courseServiceimpl;


    @RequestMapping("goBCM")
    public String goBackCourseManagement(){
        System.out.println("走入汤某人的测试控制类，即将访问 后台课程管理的JSP！！");

        return "BackCourseManagement";
    }

    @RequestMapping("findCourse")
    public void  findCourse(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        System.out.println("已经走到了控制类的findCourse");
        List<Course> courseList = null;
        courseList =courseServiceimpl.findCourse();
        TableInfo tableInfo = new TableInfo();
        tableInfo.setCode(0);
        tableInfo.setCount(100);
        tableInfo.setMsg("信息");
        tableInfo.setData(courseList);

        String remsg = new Gson().toJson(tableInfo);
        System.out.println("打印remsg:"+remsg);
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        out.write(remsg);
        out.flush();
        out.close();

    }
}
