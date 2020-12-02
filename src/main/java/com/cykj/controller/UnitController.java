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

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

    /****************************************************************************************/

    /**
     * 返回课程目录页
     * @param request 请求对象
     * @param courseId 章节目录所属的课程ID
     * @return 课程目录页的相对路径
     */
    @RequestMapping("/cataloguePage")
    public String returnCataloguePage(HttpServletRequest request, String courseId){
        // 根据课程ID查询出该课程下的所有章节目录
        List units = unitServiceImpl.selectUnitsByCourseId(courseId);
        request.getSession().setAttribute("units",units);
        return "coursePage/CourseCataloguePage";
    }

    /**
     * 返回章节资料列表
     * @param response 响应对象
     * @param unitId 资料所属的章节ID
     */
    @RequestMapping("/unitFiles")
    public void returnUnitFiles(HttpServletResponse response,String unitId){
        // 根据章节ID查询该章节下的资料文件
        List<StudyData> files = unitServiceImpl.selectUnitFileByUnitId(unitId);
        String jsonTopics = new Gson().toJson(files);
        //将查询结果响应给前端
        try {
            response.getWriter().write(jsonTopics);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 下载用户选择的章节资料
     * @param request 请求对象
     * @param fileUrl 资料的路径
     * @return 返回响应
     * @throws IOException
     */
    @RequestMapping("/downloadFile")
    public ResponseEntity<byte[]> downloadFileByDataId(HttpServletRequest request,String fileUrl) throws IOException {
        //获取下载文件的真实路径(从数据中获取，根据dataId)
        String realPath = request.getServletContext().getRealPath("/unitFiles");
        realPath += "\\"+fileUrl;//HTTP请求中含有服务器不允许的字符---->\，故而路径开头的\改在此处拼接，不在数据库存储

        //把下载文件构成一个文件处理，fileName：前台传过来的文件名称
        File file = new File(realPath);

        //设置头信息
        HttpHeaders headers = new HttpHeaders();
        String downloadFileName = new String(file.getName().getBytes("UTF-8"),"iso-8859-1");
        // 设置响应的文件名
        headers.setContentDispositionFormData("attachment",downloadFileName);
        // MediaType：互联网媒介类型，contextType：具体请求中的媒体类型信息
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers, HttpStatus.CREATED);
    }
}
