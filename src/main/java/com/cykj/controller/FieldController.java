package com.cykj.controller;

import com.cykj.entity.TableInfo;

import com.cykj.log.Loger;
import com.cykj.service.impl.FieldServiceImpl;
import com.cykj.service.impl.UnitServiceImpl;
import com.google.gson.Gson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/field")
public class FieldController {

    @Resource
    private FieldServiceImpl fieldServiceImpl;


    @RequestMapping("goBFM")
    @Loger(operationType = "走入领域管理表格",operationName = "走入领域管理表格数据")
    public String goBackCourseManagement(){
        System.out.println("走入汤某人的测试控制类，即将访问 后台领域管理的JSP！！");

        return "BackFieldManagement";
    }

    @RequestMapping(value = "/findField",produces = "text/html;charset=UTF-8")
    @Loger(operationType = "录入领域表格数据",operationName = "录入领域表格数据")
    public @ResponseBody
    String getTableInfo(Integer page,Integer limit,String fieldName){

        System.out.println("我获取到了fieldName,值为："+fieldName);

        TableInfo tableInfo = fieldServiceImpl.findField(page,limit,fieldName);
        return new Gson().toJson(tableInfo);
    }
//
//
    @RequestMapping("deleteField")
    @Loger(operationType = "表格执行删除",operationName = "表格执行删除")
    public void deleteField(Integer fieldId){
        System.out.println(fieldId);
        System.out.println("走入删除 控制类");

        if (fieldId != 0){
            int field = fieldServiceImpl.deleteField(fieldId);
        }

    }
//
//
////更改课程名称
//    @RequestMapping("updateUnitName")
//    @Loger(operationType = "表格执行章节更改",operationName = "表格执行章节更改")
//    public void updateCourseName(String unitName,Integer unitId) {
//        System.out.println("走入更改控制类");
//        System.out.println("unitName="+unitName+";unitId="+unitId);
//        if ( unitName != null){
//            int updateunitName = fieldServiceImpl.updateUnitName(unitName,unitId);
//        }
//    }
//
//
//
//    //查找框 根据ID查 上一章 课程名称
//    @RequestMapping("selectunitName")
//    @Loger(operationType = "表格执行章节搜索",operationName = "表格执行章节搜索")
//    public void selectunitName(Integer unitId) {
//        System.out.println("走入控制类");
//        System.out.println("unitId="+unitId);
//        if ( unitId != null){
//            int selectunitName = fieldServiceImpl.selectunitName(unitId);
//        }
//    }



//
//
//    //更改课程路径
//    @RequestMapping("updatecourseImgURL")
//    @Loger(operationType = "表格执行更改",operationName = "表格执行更改")
//    public void updatecourseImgURL(String courseImgURL,Integer courseId) {
//        System.out.println("走入更改控制类");
//        System.out.println("courseImgURL="+courseImgURL+";courseId="+courseId);
//        if ( courseImgURL != null){
//            int updatecourseImgURL = courseServiceImpl.updatecourseImgURL(courseImgURL,courseId);
//        }
//    }
//
//
//    @RequestMapping("updatecourseIntroduce")//更改课程介绍
//    @Loger(operationType = "表格执行更改",operationName = "表格执行更改")
//    public void updatecourseIntroduce(String courseIntroduce,Integer courseId) {
//        System.out.println("走入更改控制类");
//        System.out.println("courseIntroduce="+courseIntroduce+";courseId="+courseId);
//        if ( courseIntroduce != null){
//            int updateCourseIntroduce = courseServiceImpl.updatecourseIntroduce(courseIntroduce,courseId);
//        }
//    }
//
//
//    @RequestMapping("updatespeakerHeadImgUrl")//更改头像路径
//    @Loger(operationType = "表格执行更改",operationName = "表格执行更改")
//    public void updatespeakerHeadImgUrl(String speakerHeadImgUrl,Integer courseId) {
//        System.out.println("走入更改控制类");
//        System.out.println("speakerHeadImgUrl="+speakerHeadImgUrl+";courseId="+courseId);
//        if ( speakerHeadImgUrl != null){
//            int updateSpeakerHeadImgUrl = courseServiceImpl.updatespeakerHeadImgUrl(speakerHeadImgUrl,courseId);
//        }
//    }
//
//
    @RequestMapping("insertField")//新增领域
    @Loger(operationType = "表格执行新增领域",operationName = "表格执行新增领域")
    public void insertField(String fieldName) {
        System.out.println("走入更改控制类");
        System.out.println("fieldName:"+fieldName);

        if (fieldName != null ){
            int insertField = fieldServiceImpl.insertField(fieldName);
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
