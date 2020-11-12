package com.cykj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/course")
public class CourseController {
    // 返回课程首页
    @RequestMapping("/homePage")
    public String returnHomePage(){
        return "coursePage/CourseHomePage";
    }

    // 返回课程详情页
    @RequestMapping("/detailPage")
    public String returnDetailPage(){
        return "coursePage/CourseDetailPage";
    }

    // 返回课程目录页
    @RequestMapping("/cataloguePage")
    public String returnCataloguePage(){
        return "coursePage/CourseCataloguePage";
    }

    // 返回相关评价页
    @RequestMapping("/evaluationPage")
    public String returnEvaluationPage(){ return  "coursePage/CourseEvaluationPage";}
}
