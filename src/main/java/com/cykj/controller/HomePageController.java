package com.cykj.controller;
import com.cykj.entity.*;
import com.cykj.service.CityService;
import com.cykj.service.CompanyService;
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
    private CityService cityService;

    @Resource
    private CompanyService companyService;

    @RequestMapping("/home")
    public String home(HttpServletRequest request,String city){
//城市集合
        List<City> cityList = homePageService.cityList();
        request.setAttribute("cityList",cityList);
//        三级菜单 第一层 的集合
        List<Industry> industry = homePageService.findIndustry();
        request.setAttribute("industry",industry);
//        热门企业
        System.err.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!" + city);
        if (city!=null) {
            city = city.trim();
            List<BackUser> homeCompany = homePageService.CompanyCity(city);
            request.setAttribute("homeCompany", homeCompany);
//        最新岗位
            List<PostPosition> postList = homePageService.postList(city);
            request.setAttribute("postList", postList);
        }
        return "HomePage";
    }

    @RequestMapping("/findDepart")
    @ResponseBody
    public String findDepart(HttpServletRequest request,String industryId ){
        //        三级菜单 第二层 的集合
        String departJson = null;
        if (industryId!=null){
            Map<String,List<Position>> map = new HashMap<>();
            List<Depart> departList = homePageService.findDepart(Integer.parseInt(industryId));
            for (Depart dep: departList) {
                List<Position> post = homePageService.findPost(dep.getDepartId());
                map.put(dep.getDepartName(),post);
            }
            departJson = new Gson().toJson(map);
        }
        return departJson;
    }


//    公司主页控制层
    @RequestMapping("/companylist")
    public String company(HttpServletRequest request,String chooseCity,String chooseType ,String chooseFinan,String chooseScale,String curr,String limit){
        //城市集合
        List<City> cityList = cityService.cityList();
        request.setAttribute("cityList",cityList);
//        公司首页集合
        Map conditionMap = new HashMap<>();
        if (chooseCity!=null && !chooseCity.equals("全国") && !chooseCity.equals("".trim())){
            conditionMap.put("chooseCity",chooseCity);
        }
        if (chooseType!=null && !chooseType.equals("不限") && !chooseType.equals("".trim())){
            conditionMap.put("chooseType",chooseType);
        }
        if (chooseFinan!=null && !chooseFinan.equals("不限") && !chooseFinan.equals("".trim())){
            conditionMap.put("chooseFinan",chooseFinan);
        }
        if (chooseScale!=null && !chooseScale.equals("不限") && !chooseScale.equals("".trim())){
            conditionMap.put("chooseScale",chooseScale);
        }
        int n=0;
        int li=4;
        if (curr==null ){
            n=1;

        }else {
            n=Integer.parseInt(curr);
        }
        conditionMap.put("curr",(n-1)*li);
        conditionMap.put("limit",li);
//        根据条件查找企业信息
        List<BackUser> backUserList = companyService.findCompany(conditionMap);
        List<BackUser> backUsers = companyService.findCount(conditionMap);
        int companys = backUsers.size();  //查询公司总数

        request.setAttribute("companyList",companys);
        request.setAttribute("backUserList",backUserList);
        request.setAttribute("chooseType",chooseType);
        request.setAttribute("chooseCity",chooseCity);
        request.setAttribute("chooseFinan",chooseFinan);
        request.setAttribute("chooseScale",chooseScale);
        request.setAttribute("curr",(n-1)*li);
        return "Companylist";
    }

//    公司简介
    @RequestMapping("/compProfile")
    public String profile(HttpServletRequest request,int bUserId){
        BackUser backUser = companyService.findProfile(bUserId);
        List<PostPosition> postPositions = companyService.findPost(bUserId);
        int size = postPositions.size();  //该公司在招岗位数

        request.setAttribute("backUser",backUser);
        request.setAttribute("postPositions",postPositions);
        request.setAttribute("size",size);
        return "CompanyProfile";
    }


}
