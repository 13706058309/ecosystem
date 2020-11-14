package com.cykj.controller;

import com.cykj.entity.*;
import com.cykj.service.BackCompService;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/rec")
public class CompController {
    @Resource
    private BackCompService backCompService;

    //查找高校推荐的人才
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
    //删除高校推荐人才
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
    //查找所有行业
    @RequestMapping("/findAllIndustry")
    public @ResponseBody String findAllIndustry(){
        return new Gson().toJson(backCompService.findAll());
    }
    //通过企业ID查找所有部门
    @RequestMapping("/findDepartByID")
    public @ResponseBody String findDepartByID(int industryID){
        return new Gson().toJson(backCompService.findDepartByID(industryID));
    }

    //通过部门ID查找所有岗位
    @RequestMapping("/findPositionByID")
    public @ResponseBody String findPositionByID(int departID){
        return  new Gson().toJson(backCompService.findPositionByID(departID));
    }
    //查找所有省份
    @RequestMapping("/findAllProvince")
    public @ResponseBody String findAllProvince(){
        return  new Gson().toJson(backCompService.findAllProvince());
    }
    //通过省份ID查找城市
    @RequestMapping("/findCityByID")
    public @ResponseBody String findCityByID(int provinceID){
        return  new Gson().toJson(backCompService.findCityByID(provinceID));
    }
    //公司上线岗位
    @RequestMapping("/postPosition")
    public @ResponseBody String postPosition(PostPosition postPosition,HttpServletRequest request){
        postPosition.setCompanyId(3);
        String msg = backCompService.postPosition(postPosition);
        return msg;
    }
    //企业查看上线的岗位
    @RequestMapping("/findOnlinePosition")
    public @ResponseBody String findOnlinePosition(PageBean pageBean,String postName,HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
//        BackUser backUser = (BackUser) request.getSession().getAttribute("admin");
//        int compID = (int) backUser.getbUserId();
        int compID = 3;
        map.put("compID",compID);
        map.put("standID",6);
        if(pageBean.getBeginTime()!=null&&!pageBean.getBeginTime().equals("")){
            map.put("beginTime",pageBean.getBeginTime());
        }
        if(pageBean.getEndTime()!=null&&!pageBean.getEndTime().equals("")){
            map.put("endTime",pageBean.getEndTime());
        }
        if(postName!=null&&!postName.equals("")){
            map.put("postName","%"+postName+"%");
        }
        map.put("limit",pageBean.getLimit());
        map.put("offset",(pageBean.getPage()-1)*pageBean.getLimit());

        return new Gson().toJson(backCompService.findPosition(map));
    }
    //删除岗位
    @RequestMapping("/delPositionStand")
    public @ResponseBody String delPositionStand(int pPostId,HttpServletRequest request){

        Map<String,Object> map = new HashMap<>();
//        BackUser backUser = (BackUser) request.getSession().getAttribute("admin");
//        int compID = (int) backUser.getbUserId();
        int compID = 3;
        map.put("compID",compID);
        map.put("standID",8);
        map.put("pPostID",pPostId);
        int n = backCompService.changePostPositionStand(map);

        return n>0?"删除成功":"删除失败";
    }

    //下线岗位
    @RequestMapping("/offLinePosition")
    public @ResponseBody String offLinePosition(int pPostId, HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
//        BackUser backUser = (BackUser) request.getSession().getAttribute("admin");
//        int compID = (int) backUser.getbUserId();
        int compID = 3;
        map.put("compID",compID);
        map.put("standID",7);
        map.put("pPostID",pPostId);
        int n = backCompService.changePostPositionStand(map);

        return n>0?"1":"2";
    }
    //查找下线的岗位
    @RequestMapping("/findOfflinePosition")
    public @ResponseBody String findOfflinePosition(PageBean pageBean,String postName,HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
//        BackUser backUser = (BackUser) request.getSession().getAttribute("admin");
//        int compID = (int) backUser.getbUserId();
        int compID = 3;
        map.put("compID",compID);
        map.put("standID",7);
        if(pageBean.getBeginTime()!=null&&!pageBean.getBeginTime().equals("")){
            map.put("beginTime",pageBean.getBeginTime());
        }
        if(pageBean.getEndTime()!=null&&!pageBean.getEndTime().equals("")){
            map.put("endTime",pageBean.getEndTime());
        }
        if(postName!=null&&!postName.equals("")){
            map.put("postName","%"+postName+"%");
        }
        map.put("limit",pageBean.getLimit());
        map.put("offset",(pageBean.getPage()-1)*pageBean.getLimit());

        return new Gson().toJson(backCompService.findPosition(map));
    }
    //重新上线岗位
    @RequestMapping("/onLinePosition")
    public @ResponseBody String onLinePosition(String position){
        PostPosition postPosition = new Gson().fromJson(position,PostPosition.class);
        String result = backCompService.rePostPosition(postPosition);
        return result;
    }
    //企业查询过滤简历
    @RequestMapping("/findScerResumes")
    public @ResponseBody String findScerResumes(PageBean pageBean, Resume resume,String postName){
        Map<String,Object> map = new HashMap<>();
//        BackUser backUser = (BackUser) request.getSession().getAttribute("admin");
//        int compID = (int) backUser.getbUserId();
        if(pageBean.getBeginTime()!=null&&!pageBean.getBeginTime().equals("")){
            map.put("beginTime",pageBean.getBeginTime());
        }
        if(pageBean.getEndTime()!=null&&!pageBean.getEndTime().equals("")){
            map.put("endTime",pageBean.getEndTime());
        }
        if(postName!=null&&!postName.equals("")){
            map.put("postName","%"+postName+"%");
        }
        if(resume.getEducationId()!=0){
            map.put("educationId",resume.getEducationId());
        }
        if(resume.getWrokYear()!=0){
            map.put("wrokYear",resume.getWrokYear());
        }
        if(resume.getIsGraduate()!=0){
            map.put("isGraduate",resume.getIsGraduate());
        }
        System.out.println("lsjdf"+resume.getEducationId());
        map.put("limit",pageBean.getLimit());
        map.put("offset",(pageBean.getPage()-1)*pageBean.getLimit());
        int compID = 3;
        map.put("compID",compID);
        map.put("standID",20);
        TableInfo tableInfo = backCompService.findAllResume(map);

        return new Gson().toJson(tableInfo);
    }
    //批量过滤简历
    @RequestMapping("/scerrResume")
    public @ResponseBody String scerrResume(String msg){
        List<Resume> list = new Gson().fromJson(msg,new TypeToken<List<Resume>>(){}.getType());

        int successNum = backCompService.changeDeliStand(list,10);
        return successNum+"";
    }
    //过滤当个简历
    @RequestMapping("/scerrResumeOne")
    public @ResponseBody String scerrResumeOne(int deliID){
        int n = backCompService.changeDeliStand(deliID,10);
        return n+"";
    }
    //企业查询被过滤的简历
    @RequestMapping("/findunPassResumes")
    public @ResponseBody String findunPassResumes(PageBean pageBean, String postName){
        Map<String,Object> map = new HashMap<>();
//        BackUser backUser = (BackUser) request.getSession().getAttribute("admin");
//        int compID = (int) backUser.getbUserId();
        if(pageBean.getBeginTime()!=null&&!pageBean.getBeginTime().equals("")){
            map.put("beginTime",pageBean.getBeginTime());
        }
        if(pageBean.getEndTime()!=null&&!pageBean.getEndTime().equals("")){
            map.put("endTime",pageBean.getEndTime());
        }
        if(postName!=null&&!postName.equals("")){
            map.put("postName","%"+postName+"%");
        }

        map.put("limit",pageBean.getLimit());
        map.put("offset",(pageBean.getPage()-1)*pageBean.getLimit());
        int compID = 3;
        map.put("compID",compID);
        map.put("standID",10);
        TableInfo tableInfo = backCompService.findAllResume(map);

        return new Gson().toJson(tableInfo);
    }

    //待定单个简历
    @RequestMapping("/deterResumeOne")
    public @ResponseBody String deterResumeOne(int deliID){
        int n = backCompService.changeDeliStand(deliID,11);
        return n+"";
    }

    //批量待定单个简历
    @RequestMapping("/deterResume")
    public @ResponseBody String deterResume(String msg){
        List<Resume> list = new Gson().fromJson(msg,new TypeToken<List<Resume>>(){}.getType());

        int successNum = backCompService.changeDeliStand(list,11);
        return successNum+"";
    }

    //删除单个简历
    @RequestMapping("/delResumeOne")
    public @ResponseBody String delResumeOne(int deliID){
        int n = backCompService.delResume(deliID,9);
        return n+"";
    }

    //批量删除简历
    @RequestMapping("/delResume")
    public @ResponseBody String delResume(String msg){

        List<Resume> list = new Gson().fromJson(msg,new TypeToken<List<Resume>>(){}.getType());
        int successNum = backCompService.delResume(list,9);
        return successNum+"";
    }

    //企业查询被过滤的简历
    @RequestMapping("/findDeterResumes")
    public @ResponseBody String findDeterResumes(PageBean pageBean, String postName,String userName){
        Map<String,Object> map = new HashMap<>();
//        BackUser backUser = (BackUser) request.getSession().getAttribute("admin");
//        int compID = (int) backUser.getbUserId();

        if(postName!=null&&!postName.equals("")){
            map.put("postName","%"+postName+"%");
        }
        if(userName!=null&&!userName.equals("")){
            map.put("userName","%"+userName+"%");
        }

        map.put("limit",pageBean.getLimit());
        map.put("offset",(pageBean.getPage()-1)*pageBean.getLimit());
        int compID = 3;
        map.put("compID",compID);
        map.put("standID",11);
        TableInfo tableInfo = backCompService.findAllResume(map);

        return new Gson().toJson(tableInfo);
    }
}
