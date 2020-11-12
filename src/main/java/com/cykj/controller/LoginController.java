package com.cykj.controller;

import com.cykj.entity.BackUser;
import com.cykj.entity.Menu;
import com.cykj.entity.UserInfo;
import com.cykj.service.LoginService;
import com.cykj.service.PowerService;
import com.cykj.util.MD5Utils;
import com.google.gson.internal.$Gson$Types;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/golog")
public class LoginController {

    @Resource
    private LoginService loginServiceImpl;
    @Resource
    private PowerService powerServiceImpl;



    //跳转登录界面
    @RequestMapping("/login")
    public String login(){
        return "Login";
    }

    //前端登录的动作
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

    //注册的动作
    @RequestMapping("regiest")
    public String regiest(){
        return null;
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

    @RequestMapping("adLog")
    public String adlog(String account, String pwd,String adminCode, HttpServletRequest request){
        System.out.println("执行后端登录动作");
        String adminNum = request.getParameter("adminNum");
        String adminPwd = new MD5Utils().md5(request.getParameter("adminPwd"));
//        String adminPwd=request.getParameter("adminPwd");
//        String adminCode=request.getParameter("adminCode");
//        String vCode=(String)request.getSession().getAttribute("vCode");
//        System.out.println(vCode+"  "+adminCode);
//        if(!vCode.equalsIgnoreCase(adminCode)){
//            response.getWriter().write("codeFailed");
//        }else{
        BackUser backUser=loginServiceImpl.adminLog(account,pwd);
        if (backUser!=null){

//                response.getWriter().write("success");
            request.getSession().setAttribute("admin",backUser);
            return "admin/main";
        }else{
//                response.getWriter().write("pwdFailed");
        }
//        }
        return null;
    }
    @RequestMapping("/adminMain")
    public String adminMain(HttpServletRequest request, HttpServletResponse response){
        BackUser backUser=(BackUser)request.getSession().getAttribute("adminInfo");
        if (backUser!=null){
            List<Menu> menuList=powerServiceImpl.findExistMenu(backUser.getRoleId());
            request.getSession().setAttribute("menuList",menuList);
            return "BackMain";
        }else{
            return "";
        }
    }
    @RequestMapping("/toMain")
    public String toMain(HttpServletRequest request, HttpServletResponse response) {
        BackUser backUser = new BackUser();
        backUser.setRoleId(1);
        backUser.setBUserName("测试1");
        request.getSession().setAttribute("adminInfo", backUser);
        List<Menu> menuList = powerServiceImpl.findExistMenu(backUser.getRoleId());
        request.getSession().setAttribute("menuList", menuList);
        return "BackMain";
    }


}
