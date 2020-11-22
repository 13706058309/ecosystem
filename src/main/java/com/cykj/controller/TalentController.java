package com.cykj.controller;


import com.cykj.entity.BackUserNum;
import com.cykj.entity.TableInfo;
import com.cykj.entity.Talent;
import com.cykj.entity.UserInfo;
import com.cykj.service.TalentService;
import com.google.gson.Gson;

import org.apache.commons.io.FileUtils;

import org.apache.poi.POIXMLDocument;
import org.apache.poi.POIXMLTextExtractor;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.*;

@Controller
@RequestMapping("/talent")
public class TalentController {
    @Resource
    private TalentService talentService;

    @RequestMapping("/upload")
    public @ResponseBody  String upload(MultipartFile upload, HttpServletRequest request, HttpServletResponse response) throws IOException {
            String path = request.getSession().getServletContext().getRealPath("/upload");
            String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
            File file = new File(path, date);
            if (!file.exists()) {
                file.mkdirs();
            }
                String fileName = upload.getOriginalFilename();
                if (fileName.trim() != null && !fileName.equals("")) {
                    fileName = UUID.randomUUID().toString() + fileName.substring(fileName.lastIndexOf("."));
                    upload.transferTo(new File(file, fileName));
                    String content = readWord(path + "\\" + date + "\\" + fileName);
                    String talentName = content.substring(content.indexOf("名") + 1, content.indexOf("院")).trim();
                    if(talentService.findTalent(talentName)){
                    String school = content.substring(content.indexOf("校") + 1, content.indexOf("出")).trim();
                    String birthday = content.substring(content.indexOf("月") + 1, content.indexOf("专")).trim();
                    String profession = content.substring(content.indexOf("业") + 1, content.indexOf("政")).trim();
                    String politicalStatus = content.substring(content.indexOf("貌") + 1, content.indexOf("最")).trim();
                    String education = content.substring(content.indexOf("历") + 1, content.indexOf("电")).trim();
                    String contactInfo = content.substring(content.indexOf("话") + 1, content.indexOf("住")).trim();
                    String address = content.substring(content.indexOf("址") + 1, content.indexOf("社")).trim();
                    String workExp = content.substring(content.indexOf("验") + 1, content.indexOf("技")).trim();
                    String certificate = content.substring(content.indexOf("书") + 1, content.indexOf("自")).trim();
                    String selfEva = content.substring(content.indexOf("价") + 1).trim();
                    Talent talent = new Talent(talentName,school,birthday,profession,politicalStatus,education,contactInfo,address,workExp,certificate,selfEva);
                    int i = talentService.addTalent(talent);
                    if(i>0){
                       return "导入成功";
                    }else{
                        return"导入失败";
                    }
                    }else{
                        return"简历重复";
                    }
            }
             return "";
    }

    public String readWord(String path) {
        String buffer = "";
        try {
            if (path.endsWith(".doc")) {
                InputStream is = new FileInputStream(new File(path));
                WordExtractor ex = new WordExtractor(is);
                buffer = ex.getText();
                ex.close();
            } else if (path.endsWith("docx")) {
                OPCPackage opcPackage = POIXMLDocument.openPackage(path);
                POIXMLTextExtractor extractor = new XWPFWordExtractor(opcPackage);
                buffer = extractor.getText();
                extractor.close();
            } else {
                System.out.println("此文件不是word文件！");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return buffer;
    }

    @RequestMapping("/talentList")
    public String userList(HttpServletRequest request) throws UnsupportedEncodingException {

        return "talentList";
    }

    @RequestMapping( "/download")
    public ResponseEntity<byte[]> download(HttpServletRequest request,String fileName) throws IOException {
        String realPath=request.getServletContext().getRealPath("/upload");
        realPath=realPath+"\\2020\\";
        File file=new File(realPath,fileName);
        HttpHeaders headers=new HttpHeaders();
        String downloadFileName=new String(fileName.getBytes("UTF-8"),"iso-8859-1");
        headers.setContentDispositionFormData("attachment",downloadFileName);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return  new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers, HttpStatus.CREATED);

    }
    @RequestMapping("/findTalent")
    public void findTalent(HttpServletResponse response,HttpServletRequest request) throws IOException {

        int limit = Integer.parseInt(request.getParameter("limit"));
        int page = Integer.parseInt(request.getParameter("page"));
        String school = request.getParameter("school");
        String profession = request.getParameter("profession");
        String endTime = request.getParameter("endTime");
        String beginTime = request.getParameter("beginTime");

        Map<String,Object> map = new HashMap<>();
        if(school!=null&&school.length()!=0){
            map.put("school",school);
        }
        if(profession!=null&&profession.length()!=0){
            map.put("profession",profession);
        }
        if(endTime!=null&&endTime.length()!=0){
            map.put("endTime",endTime);
        }
        if(beginTime!=null&&beginTime.length()!=0){
            map.put("beginTime",beginTime);
        }
        List<Talent> talents=talentService.findTalent(map,limit,page);

        TableInfo tableInfo=new TableInfo();
        int records = talentService.findRecords(map);
        tableInfo.setCode(0);
        tableInfo.setCount(records);
        tableInfo.setMsg("列表数据信息");
        tableInfo.setData(talents);
        String message=new Gson().toJson(tableInfo);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        out.write(message);
        out.flush();
        out.close();

    }

    @RequestMapping("/backUserNumMonth")
    public String  backUserNumMonth(HttpServletRequest request, HttpServletResponse response)  {
        List<BackUserNum> list=talentService.backUserNumMonth();
        request.setAttribute("list",list);
        String s="本月新增企业：";
        request.setAttribute("s",s);

        return "backUserNum";
    }
    @RequestMapping("/backUserNumWeek")
    public String  backUserNumWeek(HttpServletRequest request, HttpServletResponse response)  {
        List<BackUserNum> list=talentService.backUserNumWeek();
        request.setAttribute("list",list);
        String s="本周新增企业：";
        request.setAttribute("s",s);

        return "backUserNum";
    }
    @RequestMapping("/backUserNumHalfYear")
    public String  backUserNumHalfYear(HttpServletRequest request, HttpServletResponse response)  {
        List<BackUserNum> list=talentService.backUserNumHalfYear();
        request.setAttribute("list",list);
        String s="近半年新增企业：";
        request.setAttribute("s",s);

        return "backUserNum";
    }
    @RequestMapping("/userNumMonth")
    public String  userNumMonth(HttpServletRequest request, HttpServletResponse response)  {
        List<BackUserNum> list=talentService.userNumMonth();
        request.setAttribute("list",list);
        String s="本月新增用户：";
        request.setAttribute("s",s);

        return "UserNum";
    }
    @RequestMapping("/userNumWeek")
    public String  userNumWeek(HttpServletRequest request, HttpServletResponse response)  {
        List<BackUserNum> list=talentService.userNumWeek();
        request.setAttribute("list",list);
        String s="本周新增用户：";
        request.setAttribute("s",s);

        return "UserNum";
    }
    @RequestMapping("/userNumHalfYear")
    public String  userNumHalfYear(HttpServletRequest request, HttpServletResponse response)  {
        List<BackUserNum> list=talentService.userNumHalfYear();
        request.setAttribute("list",list);
        String s="近半年新增用户：";
        request.setAttribute("s",s);

        return "UserNum";
    }

}
