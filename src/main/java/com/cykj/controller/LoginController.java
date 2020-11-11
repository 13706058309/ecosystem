package com.cykj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/golog")
public class LoginController {

    @RequestMapping("/login")
    public String login(){
        return "Login";
    }


    @RequestMapping("/reg")
    public String reg(){
        return  "Regiest";
    }

    @RequestMapping("/forget")
    public String forget(){
        return "ForgetPass";
    }

//    @RequestMapping("/admin")
//    public String admin(){
//        return "adminLog";
//    }

}
