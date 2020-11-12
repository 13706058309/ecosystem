package com.cykj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/golog")
public class LoginController {

    //跳转登录界面
    @RequestMapping("/login")
    public String login(){
        return "Login";
    }

    //跳转注册界面
    @RequestMapping("/reg")
    public String reg(){
        return  "Regiest";
    }

    //跳转忘记密码界面
    @RequestMapping("/forget")
    public String forget(){
        return "ForgetPass";
    }

//    @RequestMapping("/admin")
//    public String admin(){
//        return "adminLog";
//    }

}
