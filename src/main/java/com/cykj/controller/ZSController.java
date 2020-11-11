package com.cykj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/zsgl")
public class ZSController {


    @RequestMapping("/zs")
    public String zs(){
        return "ZSGL";
    }

    @RequestMapping("/tb")
    public String table(){
        return "table";
    }


}
