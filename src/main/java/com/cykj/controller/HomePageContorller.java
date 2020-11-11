package com.cykj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/homePage")
public class HomePageContorller {
    @RequestMapping("/home")
    public String home(){
        return "HomePage";
    }

    @RequestMapping("/naviga")
    public String naviga(){
        return "HomePageNaviga";
    }

    @RequestMapping("/A")
    public String aEnd(){
        return "AEndToEnd";
    }
}
