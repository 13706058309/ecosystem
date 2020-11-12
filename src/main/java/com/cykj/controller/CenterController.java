package com.cykj.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/center")
public class CenterController {
    @RequestMapping("/myCenter")
    public String myCenter(){
        return "MyCenter";
    }
    @RequestMapping("/center")
    public String cente(){
        return "Center";
    }
    @RequestMapping("/jianli")
    public String jianli(){
        return "jianli";
    }
    @RequestMapping("/accountSet")
    public String accountSet(){
        return "AccountSet";
    }
}
