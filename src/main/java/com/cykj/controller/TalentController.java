package com.cykj.controller;


import com.cykj.entity.*;
import com.cykj.service.TalentService;

import com.google.gson.Gson;

import org.apache.commons.io.FileUtils;

import org.apache.poi.POIXMLDocument;
import org.apache.poi.POIXMLTextExtractor;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
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
//            String path = request.getSession().getServletContext().getRealPath("/upload");
//            String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
//            File file = new File(path, date);
//            if (!file.exists()) {
//                file.mkdirs();
//            }
//                String fileName = upload.getOriginalFilename();
//                if (fileName.trim() != null && !fileName.equals("")) {
//                    fileName = UUID.randomUUID().toString() + fileName.substring(fileName.lastIndexOf("."));
//                    upload.transferTo(new File(file, fileName));


                   //1.获取文件名
                    String sname = upload.getOriginalFilename();
                    //2.上传之后的名字
                    String newsname= System.currentTimeMillis()+sname;
                  //3.拿到一个位置，把文件放到的位置(默认是webapp下的)
                    String path = request.getServletContext().getRealPath("/upload");
                     //4.拼接路径
                    File temfile = new File(path+File.separator+newsname);
                    upload.transferTo(temfile);
                    //6.读取文件
                    FileInputStream in = new FileInputStream(temfile);

                    //7.通过poi解析流HSSFWorkbook处理流得到的对象，就是封装的excel文件所有的数据
                    HSSFWorkbook worstu = new HSSFWorkbook(in);

                    //8.获取excel文件里面的工作表sheet,下表从0开始，
                    HSSFSheet sheet = worstu.getSheetAt(0);

                    //9.获取工作表数据，从第二行数据开始读取，读到最后一行结束getLastRowNum()
                    int sum = sheet.getLastRowNum();

                    //10.用for循环取到每行，然后在取到每一行的每一个单元格里的数据，在封装到实体里，然后添加到数据库中
                    //for循环i开始用1而不用0的原因：因为sheet工作表的第一行不是数据而是表明数据的字段
                    for(int i=1;i<=sum;i++) {
                        //取到每一行数据
                        HSSFRow row = sheet.getRow(i);

                        //取到每一行第一个单元格的数据
//                        String sson = String.valueOf((int)row.getCell(0).getNumericCellValue());
                        String talentName = row.getCell(0).getStringCellValue();
                        //取到每一行第二个单元格的数据
                        String school = row.getCell(1).getStringCellValue();

                        //取到每一行第三个单元格的数据
                        String birthday = row.getCell(2).getStringCellValue();

                        //取到每一行第四个单元格的数据
                        String contactInfo = String.valueOf((long)row.getCell(3).getNumericCellValue());

                        //取到每一行第五个单元格的数据
                        String profession = row.getCell(4).getStringCellValue();

                        //取到每一行第六个单元格的数据
                        String politicalStatus = row.getCell(5).getStringCellValue();

                        //取到每一行第七个单元格的数据
                        String workExp = row.getCell(6).getStringCellValue();

                        //取到每一行第八个单元格的数据
                        String selfEva = row.getCell(7).getStringCellValue();
                        String education = row.getCell(8).getStringCellValue();

                        String address = row.getCell(9).getStringCellValue();

                        String certificate = row.getCell(10).getStringCellValue();


//                        //取到每一行第九个单元格的数据
//                        int smax = (int)row.getCell(8).getNumericCellValue();
//
//                        //取到每一行第十个个单元格的数据
//                        int srole = (int)row.getCell(9).getNumericCellValue();
                        if (talentName.equals("")||school.equals("")||birthday.equals("")||profession.equals("")||politicalStatus.equals("")||education.equals("")
                            ||contactInfo.equals("")||address.equals("")||workExp.equals("")||certificate.equals("")||selfEva.equals("")){
                        return "表格填写不完整";
                    }
                        if(talentService.findTalent(talentName)){
                        Talent talent = new Talent(talentName,school,birthday,profession,politicalStatus,education,contactInfo,address,workExp,certificate,selfEva);
                         int a= talentService.addTalent(talent);
                            if(a>0){
                                if(i==sum){
                                    return "导入成功";
                                }

                            }else{
                                return"导入失败";
                            }
                        }else{
                            return"简历重复";
                        }

                    }





//                    String content = readWord(path + "\\" + date + "\\" + fileName);
//                    String talentName = content.substring(content.indexOf("名") + 1, content.indexOf("院")).trim();
//                    if(talentService.findTalent(talentName)){
//                    String school = content.substring(content.indexOf("校") + 1, content.indexOf("出")).trim();
//                    String birthday = content.substring(content.indexOf("月") + 1, content.indexOf("专")).trim();
//                    String profession = content.substring(content.indexOf("业") + 1, content.indexOf("政")).trim();
//                    String politicalStatus = content.substring(content.indexOf("貌") + 1, content.indexOf("最")).trim();
//                    String education = content.substring(content.indexOf("历") + 1, content.indexOf("电")).trim();
//                    String contactInfo = content.substring(content.indexOf("话") + 1, content.indexOf("住")).trim();
//                    String address = content.substring(content.indexOf("址") + 1, content.indexOf("社")).trim();
//                    String workExp = content.substring(content.indexOf("验") + 1, content.indexOf("技")).trim();
//                    String certificate = content.substring(content.indexOf("书") + 1, content.indexOf("自")).trim();
//                    String selfEva = content.substring(content.indexOf("价") + 1).trim();
//                    if (talentName.equals("")||school.equals("")||birthday.equals("")||profession.equals("")||politicalStatus.equals("")||education.equals("")
//                            ||contactInfo.equals("")||address.equals("")||workExp.equals("")||certificate.equals("")||selfEva.equals("")){
//                        return "简历填写不完整";
//                    }
//                    Talent talent = new Talent(talentName,school,birthday,profession,politicalStatus,education,contactInfo,address,workExp,certificate,selfEva);
//                    int i = talentService.addTalent(talent);
//                    if(i>0){
//                       return "导入成功";
//                    }else{
//                        return"导入失败";
//                    }
//                    }else{
//                        return"简历重复";
//                    }
//            }
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
    @RequestMapping("/schoolInfo")
    public String schoolInfo(HttpServletRequest request) throws UnsupportedEncodingException {
        BackUser bUser = (BackUser) request.getSession().getAttribute("admin");
        if (bUser!=null){
            int compID = (int) bUser.getbUserId();
            BackUser shool= talentService.findShoolByID(compID);
            request.setAttribute("shool",shool);
        }

        return "schoolInfo";
    }
    @RequestMapping("/changeSchoolInfo")
    public @ResponseBody String changeSchoolInfo(BackUser backUser,HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
        String compName=request.getParameter("newCompName");
        String bUserName=request.getParameter("bUserName");
        String infoIntr=request.getParameter("infoIntr");
        String email=request.getParameter("email");
        String address=request.getParameter("address");
        String coreValue=request.getParameter("coreValue");
        String contactInfo=request.getParameter("contactInfo");
        BackUser bUser = (BackUser) request.getSession().getAttribute("admin");
        long compID = bUser.getbUserId();
        map.put("schoolID",compID);
        if(compName!=null){
            map.put("compName",compName);
        }
        if(bUserName!=null){
            map.put("bUserName",bUserName);
        }
        if(infoIntr!=null){
            map.put("infoIntr",infoIntr);
        }
        if(email!=null){
            map.put("email",email);
        }
        if(address!=null){
            map.put("address",address);
        }
        if(coreValue!=null){
            map.put("coreValue",coreValue);
        }
        if(contactInfo!=null){
            map.put("contactInfo",contactInfo);
        }

        return talentService.changeSchoolInfo(map);

    }

    @RequestMapping("/positionList")
    public String positionList(HttpServletRequest request) throws UnsupportedEncodingException {

        return "positionList";
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

    @RequestMapping("/findPosition")
    public void findPosition(HttpServletResponse response,HttpServletRequest request) throws IOException {

        int limit = Integer.parseInt(request.getParameter("limit"));
        int page = Integer.parseInt(request.getParameter("page"));
        String postName = request.getParameter("postName");
        String industryName = request.getParameter("industryName");
        Map<String,Object> map = new HashMap<>();
        if(postName!=null&&postName.length()!=0){
            map.put("postName",postName);
        }
        if(industryName!=null&&industryName.length()!=0){
            map.put("industryName",industryName);
        }

        List<Positions> talents=talentService.findPosition(map,limit,page);

        TableInfo tableInfo=new TableInfo();
        int records = talentService.findPositionRecords(map);
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
    @RequestMapping("/recommendSure")
    public @ResponseBody  String recommendSure(HttpServletRequest request) throws IOException {
        int companyID = Integer.parseInt(request.getParameter("companyID"));
        String talentIds = request.getParameter("talentIds");
        char[] talentIdsChar=talentIds.toCharArray();
        if (talentIdsChar.length==1){
            if(talentService.findCompAndtalent(companyID,talentIdsChar[0])){
                int a= talentService.addCompAndtalent(companyID,talentIdsChar[0]);
                if(a>0){
                    return  "推荐成功";
                }else{
                    return  "推荐失败";
                }
            }else{
                return  "该人才已推荐过了";
            }
        }else {
            for (int i = 0; i < talentIdsChar.length; i += 2) {
                if (talentService.findCompAndtalent(companyID, talentIdsChar[i])) {
                    int a = talentService.addCompAndtalent(companyID, talentIdsChar[i]);
                    if (a > 0) {
                        if(i==talentIdsChar.length-1){
                            return "成功推荐"+(i+2)/2+"名人才";
                        }

                    } else {
                        return "推荐失败";
                    }
                } else {
                    return "存在已推荐过的人才，请重新选择";
                }
            }
        }
    return "";
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
