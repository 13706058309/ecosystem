package com.cykj.controller;

import com.cykj.entity.Course;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/txjtext")
public class TxjTestController {
    @RequestMapping("goBCM")
    public String goBackCourseManagement(){
        System.out.println("走入汤某人的测试控制类，即将访问 后台课程管理的JSP！！");

        return "BackCourseManagement";
    }

    @RequestMapping("findCourse")
    public String findCourse(){

        Course course =

                return null;
    }
}
