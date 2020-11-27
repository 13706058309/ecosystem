package com.cykj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/Tj")
public class TongjiController {



    @RequestMapping("/userTj")
    public String userTj(){
        return "userTongji";
    }

    @RequestMapping("/adminTj")
    public String adminTj(){
        return "adminTongji";
    }

    @RequestMapping("/userNum")
    public @ResponseBody String userNum(){
        return "";
    }

}
