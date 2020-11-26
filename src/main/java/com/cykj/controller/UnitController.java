package com.cykj.controller;

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
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/unit")
public class UnitController {
    @Resource
    UnitService unitServiceImpl;

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
