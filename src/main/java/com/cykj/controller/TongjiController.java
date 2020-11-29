package com.cykj.controller;

import com.cykj.entity.BackUserNum;
import com.cykj.service.TongjiService;
import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/Tj")
public class TongjiController {

@Resource
private TongjiService tongjiService;

//    @RequestMapping("/userTj")
//    public String userTj(){
//        return "tongji/userTongji";
//    }
//
//    @RequestMapping("/adminTj")
//    public String adminTj(){
//        return "tongji/adminTongji";
//    }

    @RequestMapping("/userNumWeek")
    public  String userNumWeek(HttpServletRequest request){
        List<BackUserNum> list =tongjiService.userNumWeek();
        request.setAttribute("list",list);
        String s = "本周新增用户:";
        request.setAttribute("s",s);
        return "tongji/userTongji";
    }

    @RequestMapping("/userNumMon")
    public  String userNumMon(HttpServletRequest request){

        List<BackUserNum> list=tongjiService.userNumMonth();
        request.setAttribute("list",list);
        String s="本月新增用户:";
        request.setAttribute("s",s);

        return "tongji/userTongji";
    }

    @RequestMapping("/userNumHalfYear")
    public  String userNumHalfYear(HttpServletRequest request){

        List<BackUserNum> list=tongjiService.userNumHalfYear();
        request.setAttribute("list",list);
        String s="近半年新增用户:";
        request.setAttribute("s",s);

        return "tongji/userTongji";
    }


    @RequestMapping("/adminNumWeek")
    public String adminNumWeek(HttpServletRequest request){

        List<BackUserNum> list = tongjiService.adminNumWeek();
        request.setAttribute("list",list);
        String s = "本周新增企业:";
        request.setAttribute("s",s);

        return "tongji/adminTongji";
    }

    @RequestMapping("/adminNumMon")
    public String adminNumMon(HttpServletRequest request){

        List<BackUserNum> list=tongjiService.adminNumMon();
        request.setAttribute("list",list);
        String s="本月新增企业:";
        request.setAttribute("s",s);


        return "tongji/adminTongji";
    }

    @RequestMapping("/adminNumHalfYear")
    public String adminNumHalfYear(HttpServletRequest request){

        List<BackUserNum> list=tongjiService.adminNumHalfYear();
        request.setAttribute("list",list);
        String s="近半年新增企业:";
        request.setAttribute("s",s);


        return "tongji/adminTongji";
    }


}
