package com.cykj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/zsgl")
public class ZSController {

    //证书管理表格跳转
    @RequestMapping("/tb")
    public String table(){
        return "table";
    }


}
