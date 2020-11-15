package com.cykj.controller;


import com.cykj.entity.Resume;
import com.cykj.entity.WorkExperience;
import com.cykj.service.ResumeService;
import com.cykj.service.impl.ResumeServiceImp;
import com.google.gson.Gson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/center")
public class CenterController {
    @Resource
    private ResumeService resumeService;
    @RequestMapping("/myCenter")
    public String myCenter(){
        return "MyCenter";
    }
    @RequestMapping("/center")
    public String cente(){
        return "jianli";
    }
    @RequestMapping("/jianli")
    public  String jianli(HttpServletRequest req){
        Resume resume=resumeService.resume(1);
        System.out.println(new Gson().toJson(resume));
        req.setAttribute("resume",resume);
        return "jianli";
    }
    @RequestMapping("/accountSet")
    public String accountSet(){
        return "AccountSet";
    }

    @RequestMapping("/userInfoUpdate")
    public @ResponseBody String userInfoUpdate(Resume resume,String education){
        System.out.println(new Gson().toJson(resume));
        return "succes";
    }
    @RequestMapping("/historyCommit")
    public @ResponseBody String historyCommit(WorkExperience workExperience){
        System.out.println(new Gson().toJson(workExperience));
        return "succes";
    }
    @RequestMapping("/historySave")
    public @ResponseBody String historySave(WorkExperience workExperience){
        System.out.println(new Gson().toJson(workExperience));
        return "succes";
    }
}
