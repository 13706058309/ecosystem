package com.cykj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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

}
