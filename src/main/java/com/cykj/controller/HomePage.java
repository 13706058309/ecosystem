package com.cykj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/homePage")
public class HomePage {
    @RequestMapping("/home")
    public String home(){
        return "HomePage";
    }
}
