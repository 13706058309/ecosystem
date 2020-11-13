package com.cykj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.File;
import java.util.*;

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

    // 将数据导入到数据库
    @RequestMapping("/test")
    public void dataInsert(){
        Map<String,List<String>> map = new HashMap<>();
        File file = new File("D:\\迅雷下载\\VideoData");

        String[] fields = file.list();

        List<String> fieldList = arrayToList(fields);
        //此处进行领域表领域名fieldList。get(i)插入

        map.put("fieldList",fieldList);

        for (File field:file.listFiles()) {
            if (field.isDirectory()){
                map.put(field.getName(),arrayToList(field.list()));
                // 此处进行课程表课程名field.getName()插入

                for (File course:field.listFiles()){
                    map.put(course.getName(),arrayToList(course.list()));
                    // course.getName()插入
                }
            }
        }

        List<String> list = map.get("跑你妹");
        for(String str:list)
            System.out.println(str);
    }


    // 将String数组转换成List
    public List<String> arrayToList(String[] source){
        List<String> resultList = new ArrayList<>(source.length);
        for (String s : source) {
            resultList.add(s);
        }
        return resultList;
    }
}
