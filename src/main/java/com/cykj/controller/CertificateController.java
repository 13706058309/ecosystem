package com.cykj.controller;


import com.baidu.aip.ocr.AipOcr;
import com.cykj.entity.*;
import com.cykj.log.Loger;
import com.cykj.service.CerRecordService;
import com.cykj.service.CerUserService;
import com.cykj.service.CertificateService;
import com.google.gson.Gson;
import org.apache.commons.io.FileUtils;
import org.json.JSONObject;
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
import javax.xml.crypto.Data;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping(value = "/zhengshu")
public class CertificateController {

    @Resource
    CerUserService cerUserService;

    @Resource
    CertificateService certificateService;

    @Resource
    CerRecordService cerRecordService;

    /*
     * 首页证书部分
     */

    //跳转证书首页
    @RequestMapping("/cshouye")
    public String shouye(HttpServletRequest request) {

        UserInfo userInfo = (UserInfo) request.getSession().getAttribute("qUser");

        List<Certificate> certificateList = certificateService.findcertificatelist();
        if (userInfo!=null){
        List<CerUser> cerUserList = cerUserService.findceruserlist(userInfo.getUserId());
        if (cerUserList.size() > 0){
            for (int i=0;i<certificateList.size();i++){
                for (int j= 0;j<cerUserList.size();j++){
                    if (certificateList.get(i).getFieldId()==cerUserList.get(j).getCerRecord().getFileId()&&certificateList.get(i).getFieldId()!=2){
                        certificateList.get(i).setCershowState(0);
                    }
                }
            }
        }
        }
        request.getSession().setAttribute("certificateList",certificateList);

        return "certificate/CertificateHome";
    }

    //跳转证书首页下申请详情
        @RequestMapping("/cxiangqing")
    public String shenqingxiangqing(HttpServletRequest request,String filename,String fileid) {
        request.setAttribute("filename",filename);
        request.setAttribute("fileid",fileid);

        return "certificate/ApplicationDetails";
    }

    //跳转申请证书前判断
    @RequestMapping("/zhengshupanduaan")
    public @ResponseBody String zhengshupanduan(HttpServletRequest request) {
        String msg = "";
//        UserInfo userInfo = (UserInfo) request.getSession().getAttribute("user");
//        String userInfo = "1";
//        if (userInfo.equals(1)){
            msg="success";
//        }else{
//            msg="faile";
//        }
        return msg;
    }
    //跳转申请证书页面
    @RequestMapping("/sqzhengshu")
    public String shenqingzhengshu(HttpServletRequest request,String filename,String fileid) {


        System.out.println("12433223423423423");
        Certificate certificate = certificateService.findCerFee(fileid);
        request.setAttribute("cerfee",certificate.getCertificationFee());
        request.setAttribute("filenames",filename);
        request.setAttribute("fileids",fileid);
        return "certificate/ApplicationCertificate";
    }
    //上传身份证正面
    @RequestMapping("/shenfenupload")
    public @ResponseBody
    String Card(MultipartFile file) throws Exception{
        String key = "pk";
        System.out.println(file);
        //1048576字节不能超过
        byte[] by1 = file.getBytes();
        AipOcr client1 = new AipOcr("22969184","3hEEXMwHgCmInoWgVc2RfjUk","SSmHm66z2m7rbMKokPLLigEhtSRI7P3B");
        JSONObject jo_fr = client1.idcard(by1,"front",new HashMap<String, String>());    //正面
        System.out.println("正面：" + jo_fr);

        return jo_fr.toString();
    }


    //跳转申请证书后判断
    @RequestMapping("/upupzhengshu")
    public @ResponseBody String querenzhengshu(HttpServletRequest request,String username,String usernumber,String phone,String fileid) throws ParseException {
        String msg = "";

        UserInfo userInfo = (UserInfo) request.getSession().getAttribute("qUser");


        long fileid1 = Long.parseLong(fileid);
        String dangqiantime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        CerRecord cerRecord = cerRecordService.findcerRecordid(userInfo.getUserId(),fileid1);
        if (cerRecord!=null){
            if (cerRecord.getStateId()==22){
                msg="22";
            }else if (cerRecord.getStateId()==23){
                msg="23";
            }else if (cerRecord.getStateId()==24){

                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                //开始时间
                Date startDate = sdf.parse(cerRecord.getBeginTime());
                //结束时间
                Date endDate = sdf.parse(dangqiantime);
                //得到相差的天数 betweenDate
                long betweenDate = (endDate.getTime() - startDate.getTime())/(60*60*24*1000);
                if (0<=betweenDate && betweenDate<=3){
                    msg="24";
                }else if (betweenDate>3){
                    //创建一条数据
                    CerRecord cerRecord1 = new CerRecord();
                    cerRecord1.setUserId(userInfo.getUserId());
                    cerRecord1.setFileId(fileid1);
                    cerRecord1.setStateId(23);
                    cerRecord1.setTrueName(username);
                    cerRecord1.setIdNumber(usernumber);
                    cerRecord1.setBeginTime(dangqiantime);
                    cerRecord1.setTurnoverTime(dangqiantime);
                    cerRecord1.setCerPhone(phone);
                    int n = cerRecordService.insertCerRecord(cerRecord1);
                    if (n>0){
                        System.out.println("加入申请记录成功");
                        int k = cerRecordService.findzssqlastid();
                        msg= k+"";
                    }
                }
            }else {
                msg="500";
            }
        }else {
            //创建一条数据
            CerRecord cerRecord2 = new CerRecord();
            cerRecord2.setUserId(userInfo.getUserId());
            cerRecord2.setFileId(fileid1);
            cerRecord2.setStateId(23);
            cerRecord2.setTrueName(username);
            cerRecord2.setIdNumber(usernumber);
            cerRecord2.setBeginTime(dangqiantime);
            cerRecord2.setTurnoverTime(dangqiantime);
            cerRecord2.setCerPhone(phone);
            int n = cerRecordService.insertCerRecord(cerRecord2);
            if (n>0){
                System.out.println("加入申请记录成功");
                int k = cerRecordService.findzssqlastid();
                msg= k+"";
            }
        }

        return msg;
    }

    /*
     * 个人中心证书部分
     */

    //个人中心申请证书列表
    @RequestMapping("/zxzsliebiao")
    public  String zhongxinzhengshuliebiao() {

        return "certificate/ApplicationForm";
    }

    @RequestMapping(value = "/getcersqlist",produces = "text/html;charset=utf-8")
    public @ResponseBody
    String finddoclist(String page, String limit, String top, String down, String fieldName,HttpServletRequest request) {

        Map<String, Object> usersMap = new LinkedHashMap<>();
        UserInfo userInfo = (UserInfo) request.getSession().getAttribute("qUser");
        if (fieldName != null  && !"".equals(fieldName.trim())) {
            usersMap.put("fieldName","%"+fieldName+"%" );
        }

        if (top != null && !"".equals(top.trim())) {
            usersMap.put("top",top);
        }
        if (down != null  && !"".equals(down.trim())){
            usersMap.put("down",down);
        }
        usersMap.put("userid",userInfo.getUserId());
        // 查找数据条数

        int count = cerRecordService.findcersqlistsize(usersMap);  // 查找数据条数
        // 查找数据条数
        int page1 = Integer.parseInt(page);
        int limit1 = Integer.parseInt(limit);
        int page_temp = page1;
        int limit_temp = limit1;
        if (count < page1 * limit1) {
            limit1 = count - (page1 - 1) * limit1;
        }
        page1 = (page_temp - 1) * limit_temp;
        usersMap.put("page",page1);
        usersMap.put("limit",limit1);

        List<CerRecord> cerRecordList =cerRecordService.findcersqlist(usersMap);
        System.out.println("集合"+cerRecordList.size());
        TableInfo tableinfo = new TableInfo();
        tableinfo.setCode(0);
        tableinfo.setCount(count);
        tableinfo.setMsg("申请证书列表数据信息");
        tableinfo.setData(cerRecordList);
        String listJson = new Gson().toJson(tableinfo);

        return listJson;
    }


    //修改申请证书状态为申请失败
    @RequestMapping(value = "/xiugaicersqzhuangtai")
    public @ResponseBody
    String xiugaizhuangtai(long cerid) {
        String msg ="";
        long standid = 24;
        int n = cerRecordService.upcersqstandid(standid,cerid);
        if (n!=0){
            msg = "success";
        }else {
            msg = "fail";
        }
        return msg;
    }
    //下载证书项目需求
    @RequestMapping(value = "/filedownload",method = RequestMethod.GET)
    public ResponseEntity<byte[]> download(HttpServletRequest request, String fileid) throws IOException {

        System.out.println("当前是下载情况");
        //获取下载文件路径
        String realpath   = request.getServletContext().getRealPath("/wtqupload");
        System.out.println("下载的路径是"+realpath);

        Certificate certificate= certificateService.findCerFee(fileid);
        String lujing= certificate.getCerRequirement();
        realpath = realpath+lujing.substring(0,lujing.lastIndexOf("/")+1);

        String filename  = lujing.substring(lujing.lastIndexOf("/")+1);

        File file = new File(realpath,filename);//吧下载文件构成文件处理，  filename 前台传送的文件名称
        System.out.println(file.getAbsoluteFile());

        HttpHeaders httpHeaders = new HttpHeaders();//设置头信息
        String downfilename = new String(filename.getBytes("UTF-8"),"iso-8859-1");
        //设置想要的文件名
        httpHeaders.setContentDispositionFormData("attachment",downfilename);
        httpHeaders.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        //MEDIATYpe 互联网媒介类型  contentype  具体请求的媒体类型信息
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),httpHeaders, HttpStatus.CREATED);
    }
    
    //申请证书获取证书费用
    @RequestMapping(value = "/getzssqfeiyong")
    public @ResponseBody
    String huoquzssqfeiyong(String fileid) {
        String msg ="";
        Certificate certificate = certificateService.findCerFee(fileid);
        msg = certificate.getCertificationFee()+"";
        return msg;
    }
    //个人中心已获得证书图示
    @RequestMapping("/zxzstushi")
    public  String zhongxinzhengshutushi(HttpServletRequest request) {
        UserInfo userInfo = (UserInfo) request.getSession().getAttribute("qUser");
        List<CerUser> cerUserList =  cerUserService.findceruserlist(userInfo.getUserId());
        request.setAttribute("cerUserList",cerUserList);
        return "certificate/CertificateGraphic";
    }
    //个人中心开发证书项目
    @RequestMapping("/zxzskaifa")
    public  String zhongxinzhengshuxiangmu(HttpServletRequest request) {
        UserInfo userInfo = (UserInfo) request.getSession().getAttribute("qUser");
        List<CerRecord> cerRecordList = cerRecordService.findcerKFList(userInfo.getUserId()+"");
        request.setAttribute("kaifacerRecordList",cerRecordList);
        return "certificate/DevelopmentProject";
    }
    //用户上传项目
    @RequestMapping("/fileupload")
    public @ResponseBody
    String upload(@RequestParam("fileup")MultipartFile multipartFile,@RequestParam("cerid") String cerid,HttpServletRequest request) throws IOException, ParseException {
        System.out.println("8888888888888888888888888888888888888888888888");
        String msg = "";
        //获取文件名，以及重命名文件
        String fileName = multipartFile.getOriginalFilename();
        String zip = fileName.substring(fileName.lastIndexOf(".")+1);

        String dangqiantime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        CerRecord cerRecord = cerRecordService.findcerRecordup(cerid);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        //开始时间
        Date startDate = sdf.parse(cerRecord.getTurnoverTime());
        //结束时间
        Date endDate = sdf.parse(dangqiantime);
        //得到相差的天数 betweenDate
        long betweenDate = (endDate.getTime() - startDate.getTime())/(60*60*24*1000);
        System.out.println("时间差异:"+betweenDate);
        if (zip.equals("zip")){
            if (betweenDate>=0&&betweenDate<=10) {
                //获取上传目录
                String path = request.getSession().getServletContext().getRealPath("/wtqupload");

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
                String docurl = "/"+ date+"/"+fileName;
                int n = cerRecordService.upcerdocurl(docurl,"27",cerid);
                if (n>0){
                    //文件上传
                    multipartFile.transferTo(new File(file, fileName));

                    msg = "success";
                }else{
                    msg ="fail";
                }
            }else{
                long c = Long.parseLong(cerid);
                int z =  cerRecordService.upcersqstandid(24,c);
                if (z>0){
                    msg="time";
                }else {
                    msg ="fail";
                }
            }
        }else{
            msg = "nozip";
        }
        System.out.println("dangqian"+cerid);
        System.out.println(msg);
        return msg;
    }

    //用户下载测试报告
    @RequestMapping(value = "/csbgdownload",method = RequestMethod.GET)
    public ResponseEntity<byte[]> ceshibaogaodownload(HttpServletRequest request, String cerid) throws IOException {

        System.out.println("当前是下载情况");
        //获取下载文件路径
        String realpath   = request.getServletContext().getRealPath("/wtqupload");
//        String realpath   = this.getClass().getClassLoader().getResource("").getPath()+"static";
        System.out.println("下载的路径是"+realpath);

        CerRecord cerRecord = cerRecordService.findcerRecordup(cerid);

        String lujing= cerRecord.getCerTestReport();
        String filename  = lujing.substring(lujing.lastIndexOf("/")+1);
        realpath= realpath+lujing.substring(0,lujing.lastIndexOf("/")+1);
        File file = new File(realpath,filename);//吧下载文件构成文件处理，  filename 前台传送的文件名称
        System.out.println(file.getAbsoluteFile());

        HttpHeaders httpHeaders = new HttpHeaders();//设置头信息
        String downfilename = new String(filename.getBytes("UTF-8"),"iso-8859-1");
        //设置想要的文件名
        httpHeaders.setContentDispositionFormData("attachment",downfilename);
        httpHeaders.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        //MEDIATYpe 互联网媒介类型  contentype  具体请求的媒体类型信息
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),httpHeaders, HttpStatus.CREATED);
    }

    //用户下载最终报告
    @RequestMapping(value = "/finaldownload",method = RequestMethod.GET)
    public ResponseEntity<byte[]> finalreportdownload(HttpServletRequest request, String cerid) throws IOException {

        System.out.println("当前是下载情况");
        //获取下载文件路径
        String realpath   = request.getServletContext().getRealPath("/wtqupload");
//        String realpath = this.getClass().getClassLoader().getResource("").getPath()+"static";
        System.out.println("下载的路径是"+realpath);

        CerRecord cerRecord = cerRecordService.findcerRecordup(cerid);
        String lujing= cerRecord.getCerFinalReport();
        String filename  = lujing.substring(lujing.lastIndexOf("/")+1);
        realpath= realpath+lujing.substring(0,lujing.lastIndexOf("/")+1);

        File file = new File(realpath,filename);//吧下载文件构成文件处理，  filename 前台传送的文件名称
        System.out.println(file.getAbsoluteFile());

        HttpHeaders httpHeaders = new HttpHeaders();//设置头信息
        String downfilename = new String(filename.getBytes("UTF-8"),"iso-8859-1");
        //设置想要的文件名
        httpHeaders.setContentDispositionFormData("attachment",downfilename);
        httpHeaders.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        //MEDIATYpe 互联网媒介类型  contentype  具体请求的媒体类型信息
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),httpHeaders, HttpStatus.CREATED);
    }
}