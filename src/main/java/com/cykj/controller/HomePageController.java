package com.cykj.controller;

import com.cykj.entity.City;
import com.cykj.entity.Depart;
import com.cykj.entity.Industry;
import com.cykj.entity.Position;
import com.cykj.service.HomePageService;
import com.google.gson.Gson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @Resource
    private Depart depart;


    @RequestMapping("/home")
    public String home(HttpServletRequest request ){
//城市集合
        List<City> cityList = homePageService.cityList();
        request.setAttribute("cityList",cityList);
//        三级菜单 第一层 的集合
        List<Industry> industry = homePageService.findIndustry();
        request.setAttribute("industry",industry);

        return "HomePage";
    }

    @RequestMapping("/findDepart")
    @ResponseBody
    public String findDepart(HttpServletRequest request,String industryId ){
        //        三级菜单 第二层 的集合
        System.out.println("第二层"+industryId);
        String departJson = null;
        if (industryId!=null){
            Map<String,List<Position>> map = new HashMap<>();
            List<Depart> departList = homePageService.findDepart(Integer.parseInt(industryId));
            for (Depart dep: departList) {
                List<Position> post = homePageService.findPost(dep.getDepartId());
                map.put(dep.getDepartName(),post);
            }
            departJson = new Gson().toJson(map);
            System.out.println("departJson:"+departJson);
        }
        return departJson;
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
