package com.cykj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test")
public class TestController {
    @RequestMapping("/testComp")
    public String test(){
        return "comp/BackCompInfo";
    }

//    @RequestMapping("/testComp")
//    public String test()
//    {
//        System.out.println("运行界面");
//        return "Main_Page";
//    }

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



    @RequestMapping("/findPwd")
    public String findPwd(){
        return "BackFindPwd";
    }
}
