package com.cykj.controller;

import com.cykj.entity.TableInfo;

import com.cykj.log.Loger;
import com.cykj.service.impl.CourseServiceImpl;
import com.cykj.service.impl.UnitServiceImpl;
import com.google.gson.Gson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.cykj.entity.StudyData;
import com.cykj.service.UnitService;
import com.google.gson.Gson;
import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/unit")
public class UnitController {


    @Resource
    private UnitService unitServiceImpl;


    @RequestMapping("goBUM")
    @Loger(operationType = "走入章节管理表格",operationName = "走入章节管理表格数据")
    public String goBackCourseManagement(){
        System.out.println("走入汤某人的测试控制类，即将访问 后台章节管理的JSP！！");

        return "BackUnitManagement";
    }

    @RequestMapping(value = "/findUnit",produces = "text/html;charset=UTF-8")
    @Loger(operationType = "录入章节表格数据",operationName = "录入章节表格数据")
    public @ResponseBody
    String getTableInfo(Integer page,Integer limit,String unitName){

        TableInfo tableInfo = unitServiceImpl.findCourse(page,limit,unitName);
        return new Gson().toJson(tableInfo);
    }
//
//
    @RequestMapping("deleteUnit")
    @Loger(operationType = "表格执行删除",operationName = "表格执行删除")
    public void deleteCourse(HttpServletRequest req, HttpServletResponse resp, Integer unitId){

        if (unitId != 0){
            int course = unitServiceImpl.deleteCourse(unitId);
        }

    }


//更改课程名称
    @RequestMapping("updateUnitName")
    @Loger(operationType = "表格执行章节更改",operationName = "表格执行章节更改")
    public void updateCourseName(String unitName,Integer unitId) {
        System.out.println("走入更改控制类");
        System.out.println("unitName="+unitName+";unitId="+unitId);
        if ( unitName != null){
            int updateunitName = unitServiceImpl.updateUnitName(unitName,unitId);
        }
    }



    //查找框 根据ID查 上一章 课程名称
    @RequestMapping("selectunitName")
    @Loger(operationType = "表格执行章节搜索",operationName = "表格执行章节搜索")
    public void selectunitName(Integer unitId) {
        System.out.println("走入控制类");
        System.out.println("unitId="+unitId);
        if ( unitId != null){
            int selectunitName = unitServiceImpl.selectunitName(unitId);
        }
    }



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
//    @RequestMapping("insertCourse")//更改头像路径
//    @Loger(operationType = "表格执行新增",operationName = "表格执行新增")
//    public void insertCourse(String courseName,Integer fieldId,String courseImgURL,String speakerName
//    ,String courseIntroduce,String collectionNumber,String speakerHeadImgUrl,String totalPlayTimes) {
//        System.out.println("走入更改控制类");
//        System.out.println("courseName:"+courseName+"；fieldId:"+fieldId+"；courseImgURL:"+courseImgURL
//                +"；speakerName:"+speakerName+"；courseIntroduce:"+courseIntroduce +"；collectionNumber:"
//                +collectionNumber+"；speakerHeadImgUrl:"+speakerHeadImgUrl+"；totalPlayTimes:"+totalPlayTimes);
//
//        if (courseName != null && fieldId !=null && courseImgURL !=null && speakerName != null &&
//                courseIntroduce != null && collectionNumber !=null && speakerHeadImgUrl !=null && totalPlayTimes !=null){
//            int insertCourse = courseServiceImpl.insertCourse(courseName,fieldId,courseImgURL,speakerName,
//                    courseIntroduce,collectionNumber,speakerHeadImgUrl,totalPlayTimes);
//        }
//
//
//    }












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


    // 返回课程目录页
    @RequestMapping("/cataloguePage")
    public String returnCataloguePage(HttpServletRequest request, String courseId){
        List units = unitServiceImpl.selectUnitsByCourseId(courseId);
        request.getSession().setAttribute("units",units);
        return "coursePage/CourseCataloguePage";
    }

    // 返回章节资料列表
    @RequestMapping("/unitFiles")
    public void returnUnitFiles(HttpServletResponse response,String unitId){
        List<StudyData> files = unitServiceImpl.selectUnitFileByUnitId(unitId);
        String jsonTopics = new Gson().toJson(files);

        try {
            response.getWriter().write(jsonTopics);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // 下载用户选择的章节资料
    @RequestMapping("/downloadFile")
    public ResponseEntity<byte[]> downloadFileByDataId(HttpServletRequest request,String fileUrl,String dataId) throws IOException {
        //获取下载文件的真实路径(从数据中获取，根据dataId)
        String realPath = request.getServletContext().getRealPath("/unitFiles");
        realPath += "\\"+fileUrl;//HTTP请求中含有服务器不允许的字符---->\，故而路径开头的\改在此处拼接，不在数据库存储
        System.out.println(fileUrl);
        //把下载文件构成一个文件处理，fileName：前台传过来的文件名称
        System.out.println(realPath);
        File file = new File(realPath);
        System.out.println(file.getAbsoluteFile());
        //设置头信息
        HttpHeaders headers = new HttpHeaders();
        String downloadFileName = new String(file.getName().getBytes("UTF-8"),"iso-8859-1");
        // 设置响应的文件名
        headers.setContentDispositionFormData("attachment",downloadFileName);
        // MediaType：互联网媒介类型，contextType：具体请求中的媒体类型信息
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers, HttpStatus.CREATED);
//        return null;
    }
}
