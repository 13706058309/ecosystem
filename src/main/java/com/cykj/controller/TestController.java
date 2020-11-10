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
        return "BackUniversityTalent";
    }
}
