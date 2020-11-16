package com.cykj.controller;

import com.baidu.aip.ocr.AipOcr;
import com.cykj.entity.CerRecord;
import com.cykj.entity.CerUser;
import com.cykj.entity.Certificate;
import com.cykj.entity.UserInfo;
import com.cykj.service.CerRecordService;
import com.cykj.service.CerUserService;
import com.cykj.service.CertificateService;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

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

//        UserInfo userInfo = (UserInfo) request.getSession().getAttribute("tuser");
//        List<CerUser> cerUserList = cerUserService.findceruserlist(userInfo.getUserId());
        List<Certificate> certificateList = certificateService.findcertificatelist();

        for (int i=0;i<certificateList.size();i++){
            certificateList.get(i).setCershowState(1);
        }
//        if (cerUserList.size() != 0){
//
//            for (int i=0;i>certificateList.size();i++){
//                for (int j= 0;j>cerUserList.size();j++){
//                    if (certificateList.get(i).getCerId()==cerUserList.get(j).getCerId()){
//                        certificateList.get(i).setCershowState(0);
//                    }else {
//                        certificateList.get(i).setCershowState(1);
//                    }
//                }
//            }
//        }else {

//        }

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
    @RequestMapping("/zhengshupanduaan")
    public @ResponseBody String querenzhengshu(HttpServletRequest request,String username,String usernumber,int phone,long fileid) throws ParseException {
        String msg = "";
        UserInfo userInfo = (UserInfo) request.getSession().getAttribute("qUser");
        userInfo.setUserId(1);
        String dangqiantime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        CerRecord cerRecord = cerRecordService.findcerRecordid(userInfo.getUserId(),fileid);
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
                    cerRecord1.setStateId(userInfo.getUserId());
                    cerRecord1.setFileId(fileid);
                    cerRecord1.setStateId(23);
                    cerRecord1.setTrueName(username);
                    cerRecord1.setIdNumber(usernumber);
                    cerRecord1.setBeginTime(dangqiantime);
                    cerRecord1.setCerPhone(phone);
                    int n = cerRecordService.insertCerRecord(cerRecord1);
                    if (n>0){
                        msg="success";
                    }
                }
            }else {
                msg="500";
            }
        }else {
            //创建一条数据
            CerRecord cerRecord2 = new CerRecord();
            cerRecord2.setStateId(userInfo.getUserId());
            cerRecord2.setFileId(fileid);
            cerRecord2.setStateId(23);
            cerRecord2.setTrueName(username);
            cerRecord2.setIdNumber(usernumber);
            cerRecord2.setBeginTime(dangqiantime);
            cerRecord2.setCerPhone(phone);
            int n = cerRecordService.insertCerRecord(cerRecord2);
            if (n>0){
                msg="success";
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
    //个人中心已获得证书图示
    @RequestMapping("/zxzstushi")
    public  String zhongxinzhengshutushi() {
        return "certificate/CertificateGraphic";
    }
    //个人中心开发证书项目
    @RequestMapping("/zxzskaifa")
    public  String zhongxinzhengshuxiangmu() {
        return "certificate/DevelopmentProject";
    }


}