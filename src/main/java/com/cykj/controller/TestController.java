package com.cykj.controller;

import com.cykj.service.BackCompService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping("/test")
public class TestController {
    @Resource
    private BackCompService backCompServiceImpl;

    @RequestMapping("/testComp")
    public String test(){
        return "comp/BackCompInfo";
    }


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



    @RequestMapping("/findPwd")
    public String findPwd(){
        return "BackFindPwd";
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
}
