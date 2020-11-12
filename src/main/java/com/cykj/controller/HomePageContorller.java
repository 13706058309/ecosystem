package com.cykj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/homePage")

//跳转访问
public class HomePageContorller {
    @RequestMapping("/home")
    public String home(){
        System.out.println("汤鑫杰");
        return "HomePage";
    }
}
