package com.cykj.controller;

//import com.cykj.log.Loger;
import com.cykj.service.BackCompService;
import jdk.nashorn.internal.runtime.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/test")
public class TestController {
    @Resource
    private BackCompService backCompServiceImpl;



    @RequestMapping("/userManage")
    public String userManage()
    {
        System.out.println("运行界面");
        return "UserManage";
    }

    @RequestMapping("/enterpriseManage")
    public String enterpriseManage()
    {
        System.out.println("运行界面");
        return "EnterpriseManage";
    }

    @RequestMapping("/changePwd")
    public String changePwd(){
        return "comp/BackChangePwd";
    }


    @RequestMapping("/compReg")
    public String compReg(){
        return "comp/BackCompReg";
    }

    @RequestMapping("/postPosition")
    public String postPosition(){
        return "comp/BackPostPosition";
    }

    @RequestMapping("/backScerrningResumes")
    public String backScerrningResumes(){
        return "comp/BackScerrningResumes";
    }

    @RequestMapping("/backOffline")
    public String backOffline(){
        return "comp/BackOfflinePosition";
    }

    @RequestMapping("/backOnline")
    public String backOnline(){
        return "comp/BackOnlinePosition";
    }

    @RequestMapping("/reg")
    public String reg(){
        return "comp/BackReg";
    }

    @RequestMapping("/findPwd")
    public String findPwd(){
        return "comp/BackFindPwd";
    }

    @RequestMapping("/unPass")
    public String unPass(){
        return "comp/BackUnPassResume";
    }

    @RequestMapping("/pass")
    public String pass(){
        return "comp/BackPassResume";
    }

    @RequestMapping("/deterResume")
    public String deterResume(){
        return "comp/BackDeterResume";
    }

    @RequestMapping("/waitResume")
    public String waitResume(){
        return "comp/BackWaitResume";
    }

    @RequestMapping("/unviTalent")
    public String unviTalent(){
        return "comp/BackUniversityTalent";
    }

    @RequestMapping("/findUser")
    public String findUser(){
        return "comp/BackCompFindUser";
    }

    @RequestMapping("/st")
    public String st(){
        return "Login";
    }

    @RequestMapping("/ss")
    public String ss(){
        return "Register";
    }

    @RequestMapping("/sb")
    public String sb(){
        return "adminLog";
    }

    @RequestMapping("/testMap")
    public String testMap(){
        return "comp/TestMap";
    }

    @RequestMapping("/Buju")
    public String Buju(){
        return "comp/Buju";
    }
    @RequestMapping("/tete")
    public String tete(){
        return "tst";
    }



}
