package com.cykj.controller;

import com.cykj.entity.UserInfo;
import com.cykj.service.LoginService;
import com.google.gson.internal.$Gson$Types;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping("/golog")
public class LoginController {

    @Resource
    private LoginService loginServiceImpl;



    //跳转登录界面
    @RequestMapping("/login")
    public String login(){
        return "Login";
    }

    @RequestMapping("log")
    public String log(String account,String pwd){
        System.out.println("执行前端用户登录!");
        String repath = null;
        UserInfo userInfo = loginServiceImpl.log(account, pwd);
        if (userInfo != null){
            repath = "";
        } else {
            repath = "Login";
        }
        return repath;
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
