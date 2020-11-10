package com.cykj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("/test")
public class TestController {
    @RequestMapping("/testComp")
    public String test(){
        return "BackCompInfo";
    }

    @RequestMapping("/changePwd")
    public String changePwd(){
        return "BackChangePwd";
    }

    @RequestMapping("/backUniverTalent")
    public String backUniverTalent(){
        return "comp/BackUniversityTalent";
    }

    @RequestMapping("/backCompFindUser")
    public String backCompFindUser(){
        return "BackCompFindUser";
    }

    @RequestMapping("/findPwd")
    public String findPwd(){
        return "BackFindPwd";
    }

    @RequestMapping("/compReg")
    public String compReg(){
        return "comp/BackCompReg";
    }

    @RequestMapping("/postPosition")
    public String postPosition(){
        return "comp/BackPostPosition";
    }
}


