package com.cykj.controller;

import com.cykj.entity.City;
import com.cykj.entity.Depart;
import com.cykj.entity.Industry;
import com.cykj.entity.Position;
import com.cykj.service.HomePageService;
import com.google.gson.Gson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/homePage")
public class HomePageController {
    @Resource
    private HomePageService homePageService;


    @RequestMapping("/home")
    public String home(HttpServletRequest request){

//        三级菜单 第一层 的集合
        List<Industry> industry = homePageService.findIndustry();
        request.setAttribute("industry",industry);
        List<City> cityList = homePageService.cityList();
        request.setAttribute("cityList",cityList);
////        三级菜单第二层 的集合
//        Map<Depart,List<Position>> map = new HashMap<>();
//        //通过第二层拿到第三层 的集合
//        for (Industry indus:industry) {
//            List<Depart> departs = industryServiceImpl.findDepart(indus.getIndustryId());
//            for (Depart depart: departs) {
//                List<Position> post = industryServiceImpl.findPost(depart.getDepartId());
//                map.put(depart,post);
//            }
//        }
//        request.setAttribute("departAdnPositionMap",map);
        return "HomePage";
    }

    @RequestMapping("/A")
    public String aEnd(){
        return "AEndToEnd";
    }

    @RequestMapping("/companylist")
    public String company(){
        return "Companylist";
    }




}
