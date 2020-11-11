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

    @RequestMapping("/changePwd")
    public String changePwd(){
        return "comp/BackChangePwd";
    }

    @RequestMapping("/backUniverTalent")
    public String backUniverTalent(){
        return "comp/BackUniversityTalent";
    }

    @RequestMapping("/backCompFindUser")
    public String backCompFindUser(){
        return "comp/BackCompFindUser";
    }

    @RequestMapping("/findPwd")
    public String findPwd(){
        return "comp/BackFindPwd";
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
}


