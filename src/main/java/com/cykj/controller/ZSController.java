package com.cykj.controller;

import com.cykj.entity.CerRecord;
import com.cykj.entity.Certificate;
import com.cykj.entity.TableInfo;
//import com.cykj.log.Loger;
import com.cykj.service.CerRecordService;
import com.cykj.service.CertificateService;
import com.google.gson.Gson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/zsgl")
public class ZSController {

    @Resource
    CertificateService certificateServiceImpl;
    @Resource
    CerRecordService cerRecordServiceImpl;


    //证书管理表格跳转
    @RequestMapping("/certb")
//    @Loger(operationName = "跳转证书管理的表格")
    public String certb(){
        return "certificate/BackCerZs";
    }


    @RequestMapping("/getZs")
//    @Loger(operationName = "证书分页")
    public @ResponseBody String getZs(String page, String limit){
        System.out.println("证书分页");
        List<Certificate> certificates = certificateServiceImpl.findAll(page, limit);
        TableInfo tableInfo = new TableInfo(0,"证书分页列表",certificates.size(),certificates);
        System.out.println("证书分页列表"+certificates);
        return new Gson().toJson(tableInfo);
    }

    //申请记录管理表格跳转
    @RequestMapping("/rectb")
    public String rectb(){
        return "certificate/BackRecord";
    }

    @RequestMapping("/getJl")
    public @ResponseBody String getJl(String page, String limit){
        List<CerRecord> cerRecords = cerRecordServiceImpl.allPage(page, limit);
        TableInfo tableInfo = new TableInfo(0,"查询记录列表",cerRecords.size(),cerRecords);
        System.out.println("查询记录列表"+cerRecords.toString());
        return new Gson().toJson(tableInfo);
    }

    @RequestMapping("/delZs")
    public @ResponseBody String del(int cerId){
        System.out.println("执行删除!");
        String msg = "";
        int n = certificateServiceImpl.deleteZs(cerId);
        if (n>0){
            msg = "delSuccess";
        } else {
            msg = "delFiald";
        }
        return msg;
    }

    @RequestMapping("/change")
    public @ResponseBody String change(int userId,int stateId){
        String msg = "";
        Map<String,Object> map = new HashMap<>();
        map.put("userId",userId);
        map.put("stateId",stateId);
        int n = cerRecordServiceImpl.upSta(map);
        if (n > 0){
            msg="changeSucc";
        }
        return msg;
    }


}
