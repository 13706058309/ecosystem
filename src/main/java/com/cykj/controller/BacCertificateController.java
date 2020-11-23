package com.cykj.controller;

import com.cykj.entity.CerRecord;
import com.cykj.entity.CerUser;
import com.cykj.entity.TableInfo;
import com.cykj.service.CerRecordService;
import com.cykj.service.CerUserService;
import com.cykj.service.CertificateService;
import com.google.gson.Gson;
import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping(value = "/backzhengshu")
public class BacCertificateController {
    @Resource
    CerUserService cerUserService;

    @Resource
    CertificateService certificateService;

    @Resource
    CerRecordService cerRecordService;


    //后台已获得证书界面
    @RequestMapping("/yhdzhengshuliebiao")
    public String zhengshuliebiao() {

        return "certificate/GetBackCertificate";
    }

    //后台测试证书界面
    @RequestMapping("/ceshizhengshuliebiao")
    public String zhongxinzhengshuliebiao() {

        return "certificate/backCeShiZS";
    }
    //后台评审证书界面
    @RequestMapping("/pingshenzhengshuliebiao")
    public String pingshenzhengshuliebiao() {

        return "certificate/BackCertificateReview";
    }


    //后台已获得证书集合
    @RequestMapping(value = "/getbackceruserlist", produces = "text/html;charset=utf-8")
    public @ResponseBody
    String finddoclist(String page, String limit, String top, String down, String fieldName, String bUserName, String trueName) {

        Map<String, Object> usersMap = new LinkedHashMap<>();

        if (fieldName != null && !"".equals(fieldName.trim())) {
            usersMap.put("fieldName", "%" + fieldName + "%");
        }
        if (trueName != null && !"".equals(trueName.trim())) {
            usersMap.put("trueName", "%" + trueName + "%");
        }
        if (bUserName != null && !"".equals(bUserName.trim())) {
            usersMap.put("bUserName", "%" + bUserName + "%");
        }

        if (top != null && !"".equals(top.trim())) {
            usersMap.put("top", top);
        }
        if (down != null && !"".equals(down.trim())) {
            usersMap.put("down", down);
        }

        int count = cerUserService.findceruserlistsize(usersMap);  // 查找数据条数
        // 查找数据条数
        int page1 = Integer.parseInt(page);
        int limit1 = Integer.parseInt(limit);
        int page_temp = page1;
        int limit_temp = limit1;
        if (count < page1 * limit1) {
            limit1 = count - (page1 - 1) * limit1;
        }
        page1 = (page_temp - 1) * limit_temp;
        usersMap.put("page", page1);
        usersMap.put("limit", limit1);

        List<CerUser> cerUserList = cerUserService.backfindceruserlist(usersMap);
        System.out.println("集合" + cerUserList.size());
        TableInfo tableinfo = new TableInfo();
        tableinfo.setCode(0);
        tableinfo.setCount(count);
        tableinfo.setMsg("已获得证书列表数据信息");
        tableinfo.setData(cerUserList);
        String listJson = new Gson().toJson(tableinfo);

        return listJson;
    }

    //后台用户下载评审视频
    @RequestMapping(value = "/psvideodownload", method = RequestMethod.GET)
    public ResponseEntity<byte[]> finalreportdownload(HttpServletRequest request, String cerid) throws IOException {

        System.out.println("当前是下载情况");
        //获取下载文件路径
//        String realpath   = request.getServletContext().getRealPath("/wtqupload");
        String realpath = this.getClass().getClassLoader().getResource("").getPath() + "static";
        System.out.println("下载的路径是" + realpath);

        CerRecord cerRecord = cerRecordService.findcerRecordup(cerid);
        String lujing = cerRecord.getCerReviewVideo();
        String filename = lujing.substring(lujing.lastIndexOf("/") + 1);

        File file = new File(realpath, filename);//吧下载文件构成文件处理，  filename 前台传送的文件名称
        System.out.println(file.getAbsoluteFile());

        HttpHeaders httpHeaders = new HttpHeaders();//设置头信息
        String downfilename = new String(filename.getBytes("UTF-8"), "iso-8859-1");
        //设置想要的文件名
        httpHeaders.setContentDispositionFormData("attachment", downfilename);
        httpHeaders.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        //MEDIATYpe 互联网媒介类型  contentype  具体请求的媒体类型信息
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), httpHeaders, HttpStatus.CREATED);
    }

    //测试集合
    @RequestMapping(value = "/getbackcerceshilist", produces = "text/html;charset=utf-8")
    public @ResponseBody
    String findcercslist(String page, String limit) {

        Map<String, Object> usersMap = new LinkedHashMap<>();

        int count = cerRecordService.findcerCSlistsize();  // 查找数据条数
        // 查找数据条数
        int page1 = Integer.parseInt(page);
        int limit1 = Integer.parseInt(limit);
        int page_temp = page1;
        int limit_temp = limit1;
        if (count < page1 * limit1) {
            limit1 = count - (page1 - 1) * limit1;
        }
        page1 = (page_temp - 1) * limit_temp;
        usersMap.put("page", page1);
        usersMap.put("limit", limit1);

        List<CerRecord> cerRecordList = cerRecordService.findcerCSlist(usersMap);
        System.out.println("集合" + cerRecordList.size());
        TableInfo tableinfo = new TableInfo();
        tableinfo.setCode(0);
        tableinfo.setCount(count);
        tableinfo.setMsg("测试人员证书数据信息");
        tableinfo.setData(cerRecordList);
        String listJson = new Gson().toJson(tableinfo);

        return listJson;
    }

    //后台下载证书项目进行评价
    @RequestMapping(value = "/backzsxmdownload", method = RequestMethod.GET)
    public ResponseEntity<byte[]> xiazaixiangmudownload(HttpServletRequest request, String cerid) throws IOException {

        System.out.println("当前是下载情况");
        //获取下载文件路径
        String realpath = request.getServletContext().getRealPath("/wtqupload");
//        String realpath = this.getClass().getClassLoader().getResource("").getPath()+"static";
        System.out.println("下载的路径是" + realpath);

        CerRecord cerRecord = cerRecordService.findcerRecordup(cerid);
        String lujing = cerRecord.getDocUrl();
        String filename = lujing.substring(lujing.lastIndexOf("/") + 1);

        File file = new File(realpath, filename);//吧下载文件构成文件处理，  filename 前台传送的文件名称
        System.out.println(file.getAbsoluteFile());

        HttpHeaders httpHeaders = new HttpHeaders();//设置头信息
        String downfilename = new String(filename.getBytes("UTF-8"), "iso-8859-1");
        //设置想要的文件名
        httpHeaders.setContentDispositionFormData("attachment", downfilename);
        httpHeaders.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        //MEDIATYpe 互联网媒介类型  contentype  具体请求的媒体类型信息
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), httpHeaders, HttpStatus.CREATED);
    }


    //测试人员上传测试报告
    @RequestMapping("/ceshifileupload")
    public @ResponseBody
    String upload(@RequestParam("file") MultipartFile multipartFile, String cerid, HttpServletRequest request) throws IOException, ParseException {
        System.out.println("8888888888888888888888888888888888888888888888");
        String msg = "";
        System.out.println("当前id"+cerid);
        //获取文件名，以及重命名文件
        String fileName = multipartFile.getOriginalFilename();
        //获取上传目录
        String path = this.getClass().getClassLoader().getResource("").getPath() + "static/wtqfile";

        //获取当天日期为后面创建日期
        String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        //创建以日期来区分的文件夹目录
        File file = new File(path, date);
        if (!file.exists()) {
            file.mkdirs();//创建子目录
        }
        System.out.println("123213123123123" + path);
        fileName = UUID.randomUUID().toString() + fileName.substring(fileName.lastIndexOf("."));
        System.out.println("file" + file);
        System.out.println(fileName);

        String prosturl = "/wtqfile/" + date + "/" + fileName;
        int n = cerRecordService.upcertestreport(prosturl,cerid);
        TableInfo tableInfo = new TableInfo();
        if (n > 0) {
            multipartFile.transferTo(new File(file, fileName));


            tableInfo.setCode(0);
            tableInfo.setMsg("success");
            msg = new Gson().toJson(tableInfo);
        } else {


            tableInfo.setCode(0);
            tableInfo.setMsg("fail");
            msg = new Gson().toJson(tableInfo);
        }

        return msg;
    }

    //测试人员打分测试分数
    @RequestMapping(value = "/uptestsorce")
    public @ResponseBody
    String xiugaizhuangtai(String cerid,String score) {
        String msg ="";
        int sscore = Integer.parseInt(score);
        if (0<sscore && sscore<=29){
            int n = cerRecordService.upcertestrescore(score,"28",cerid);
            if (n!=0){
                msg = "success";
            }else {
                msg = "fail";
            }
        }else {
            int n = cerRecordService.upcertestrescore(score,"29",cerid);
            if (n!=0){
                msg = "success";
            }else {
                msg = "fail";
            }
        }
        return msg;
    }

    //测试集合
    @RequestMapping(value = "/getbackcerpingshenlist", produces = "text/html;charset=utf-8")
    public @ResponseBody
    String findcerpslist(String page, String limit,String top,String down,String fieldName,String trueName) {

        Map<String, Object> usersMap = new LinkedHashMap<>();
        if (fieldName != null  && !"".equals(fieldName.trim())) {
            usersMap.put("fieldName","%"+fieldName+"%" );
        }
        if (trueName != null  && !"".equals(trueName.trim())) {
            usersMap.put("trueName","%"+trueName+"%" );
        }

        if (top != null && !"".equals(top.trim())) {
            usersMap.put("top",top);
        }
        if (down != null  && !"".equals(down.trim())){
            usersMap.put("down",down);
        }
        int count = cerRecordService.findcerPSlistsize(usersMap);  // 查找数据条数
        // 查找数据条数
        int page1 = Integer.parseInt(page);
        int limit1 = Integer.parseInt(limit);
        int page_temp = page1;
        int limit_temp = limit1;
        if (count < page1 * limit1) {
            limit1 = count - (page1 - 1) * limit1;
        }
        page1 = (page_temp - 1) * limit_temp;
        usersMap.put("page", page1);
        usersMap.put("limit", limit1);

        List<CerRecord> cerRecordList = cerRecordService.findcerPSlist(usersMap);
        System.out.println("集合" + cerRecordList.size());
        TableInfo tableinfo = new TableInfo();
        tableinfo.setCode(0);
        tableinfo.setCount(count);
        tableinfo.setMsg("评审人员证书数据信息");
        tableinfo.setData(cerRecordList);
        String listJson = new Gson().toJson(tableinfo);

        return listJson;
    }
}
