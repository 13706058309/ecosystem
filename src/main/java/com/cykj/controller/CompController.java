package com.cykj.controller;

import com.cykj.entity.PageBean;
import com.cykj.entity.PostPosition;
import com.cykj.entity.Talent;
import com.cykj.service.BackCompService;
import com.google.gson.Gson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/rec")
public class CompController {
    @Resource
    private BackCompService backCompService;


    @RequestMapping("/findUnviTalent")
    public @ResponseBody String findUnviTalent(PageBean pageBean, Talent talent){
        Map<String,Object> map = new HashMap<>();
        int compID = 3;
        map.put("compID",compID);
        if(pageBean.getBeginTime()!=null&&!pageBean.getBeginTime().equals("")){
            map.put("beginTime",pageBean.getBeginTime());
        }
        if(pageBean.getEndTime()!=null&&!pageBean.getEndTime().equals("")){
            map.put("endTime",pageBean.getEndTime());
        }
        if(talent.getTalentName()!=null){
            map.put("talentName","%"+talent.getTalentName()+"%");
        }
        if(talent.getProfession()!=null){
            map.put("profession","%"+talent.getProfession()+"%");
        }
        if(talent.getSchool()!=null){
            map.put("school","%"+talent.getSchool()+"%");
        }
        map.put("limit",pageBean.getLimit());
        map.put("offset",(pageBean.getPage()-1)*pageBean.getLimit());
        return new Gson().toJson(backCompService.findUnviTalent(map));
    }

    @RequestMapping("/delUnviTalent")
    public @ResponseBody String delUnviTalent(int compAndTalId){
        int n = backCompService.delUnviTalent(15,compAndTalId);
        String msg = "";
        if(n>0){
            msg="删除成功";
        }else{
            msg="删除失败";
        }
        return msg;
    }

    @RequestMapping("/findAllIndustry")
    public @ResponseBody String findAllIndustry(){
        return new Gson().toJson(backCompService.findAll());
    }

    @RequestMapping("/findDepartByID")
    public @ResponseBody String findDepartByID(int industryID){
        return new Gson().toJson(backCompService.findDepartByID(industryID));
    }


    @RequestMapping("/findPositionByID")
    public @ResponseBody String findPositionByID(int departID){
        return  new Gson().toJson(backCompService.findPositionByID(departID));
    }

    @RequestMapping("/findAllProvince")
    public @ResponseBody String findAllProvince(){
        return  new Gson().toJson(backCompService.findAllProvince());
    }

    @RequestMapping("/findCityByID")
    public @ResponseBody String findCityByID(int provinceID){
        return  new Gson().toJson(backCompService.findCityByID(provinceID));
    }

    @RequestMapping("/postPosition")
    public @ResponseBody String postPosition(PostPosition postPosition){
        System.out.println(postPosition);
        return null;
    }
}
