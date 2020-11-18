package com.cykj.controller;


import com.cykj.entity.*;
import com.cykj.service.ResumeService;
import com.cykj.service.impl.ResumeServiceImp;
import com.google.gson.Gson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/center")
public class CenterController {
    private int resumeId;
    private int userId;
    @Resource
    private ResumeService resumeService;
    @RequestMapping("/myCenter")
    public String myCenter(){
        return "MyCenter";
    }

    @RequestMapping("/resumeInfo")
    public String resumeInfo(HttpServletRequest req){
        userId=1;
        int page=0;
        int curr=1;
        int limit=2;
        List<PostPosition> posts=resumeService.findPosts(userId,page,limit);
        List<PostPosition> postsCount=resumeService.findPostsCount(userId);
        int count=postsCount.size();

        req.setAttribute("posts",posts);
        req.setAttribute("count",count);
        req.setAttribute("limit",limit);
        req.setAttribute("curr",curr);
        System.out.println(new Gson().toJson(posts));
        return "resumeInfo";
    }
    @RequestMapping("/resumeCommit")
    public String resumeCommit(HttpServletRequest req){
        userId=1;
        int page=0;
        int curr=1;
        int limit=2;
        List<PostPosition> posts=resumeService.findPosts(userId,page,limit);
        List<PostPosition> postsCount=resumeService.findPostsCount(userId);
        int count=postsCount.size();

        req.setAttribute("postss",posts);
        req.setAttribute("count",count);
        req.setAttribute("limit",limit);
        req.setAttribute("curr",curr);
        System.out.println(new Gson().toJson(posts));
        return "resumeInfo";
    }
    @RequestMapping("/interview")
    public String interview(HttpServletRequest req){
        userId=1;
        int page=0;
        int curr=1;
        int limit=2;
        List<PostPosition> posts=resumeService.findPosts(userId,page,limit);
        List<PostPosition> postsCount=resumeService.findPostsCount(userId);
        int count=postsCount.size();

        req.setAttribute("posts",posts);
        req.setAttribute("count",count);
        req.setAttribute("limit",limit);
        req.setAttribute("curr",curr);
        System.out.println(new Gson().toJson(posts));
        return "resumeInfo";
    }
    @RequestMapping("/communication")
    public String communication(HttpServletRequest req){
        userId=1;
        int page=0;
        int curr=1;
        int limit=2;
        List<PostPosition> posts=resumeService.findPosts(userId,page,limit);
        List<PostPosition> postsCount=resumeService.findPostsCount(userId);
        int count=postsCount.size();

        req.setAttribute("posts",posts);
        req.setAttribute("count",count);
        req.setAttribute("limit",limit);
        req.setAttribute("curr",curr);
        System.out.println(new Gson().toJson(posts));
        return "resumeInfo";
    }
    @RequestMapping("/resumePage")
    public String resumePage(HttpServletRequest req,int curr,int limit){
        userId=1;
        List<PostPosition> posts=resumeService.findPosts(userId,(curr-1)*limit,limit);
        List<PostPosition> postsCount=resumeService.findPostsCount(userId);
        int count=postsCount.size();

        req.setAttribute("posts",posts);
        req.setAttribute("count",count);
        req.setAttribute("limit",limit);
        req.setAttribute("curr",curr);
        System.out.println(new Gson().toJson(posts));
        return "resumeInfo";
    }
    @RequestMapping("/postDel")
    public @ResponseBody String postDel(int pPostId){
//        System.out.println(new Gson().toJson(resume));
        userId=1;
        int n=resumeService.positionDel(userId,pPostId);
        String msg="lose";
        if (n>0){
            msg="succes";
        }
        return msg;
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
        resumeId=(int)resume.getResumeId();
        return "jianli";
    }
    @RequestMapping("/accountSet")
    public String accountSet(){
        return "AccountSet";
    }

    @RequestMapping("/userInfoUpdate")
    public @ResponseBody String userInfoUpdate(Resume resume,String education){
//        System.out.println(new Gson().toJson(resume));
        int n=resumeService.resumeUpdate(resume);
        String msg="lose";
        if (n>0){
            msg="succes";
        }
        return msg;
    }

//    工作经历
    @RequestMapping("/historyCommit")
    public @ResponseBody String historyCommit(WorkExperience workExperience){
        System.out.println(new Gson().toJson(workExperience));
        boolean flag=resumeService.workInsert(workExperience,resumeId);
        String msg="lose";
        if (flag){
            msg="succes";
        }
        return msg;
    }
    @RequestMapping("/historySave")
    public @ResponseBody String historySave(WorkExperience workExperience){
        System.out.println(new Gson().toJson(workExperience));
        int n=resumeService.workUpdate(workExperience);
        String msg="lose";
        if (n>0){
            msg="succes";
        }
        return msg;
    }
    @RequestMapping("/historyDelete")
    public @ResponseBody String historyDelect(int weId){
        System.out.println(weId+"?????????????????");
        int n=resumeService.rwDel(weId,resumeId);
        String msg="lose";
        if (n>0){
            msg="succes";
        }
        return msg;
    }

//    项目经历
    @RequestMapping("/projectCommit")
    public @ResponseBody String projectCommit(ProjectExperience projectExperience){
        System.out.println(new Gson().toJson(projectExperience));
        System.out.println("???????????????????????????");
        boolean flag=resumeService.projectInsert(projectExperience,resumeId);
        String msg="lose";
        if (flag){
            msg="succes";
        }
        return msg;
    }
    @RequestMapping("/projectSave")
    public @ResponseBody String projectSave(ProjectExperience projectExperience){
//        System.out.println(new Gson().toJson(projectExperience));
        int n=resumeService.projectUpdate(projectExperience);
        String msg="lose";
        if (n>0){
            msg="succes";
        }
        return msg;
    }
    @RequestMapping("/projectDelete")
    public @ResponseBody String projectDelect(int peId){
        System.out.println("peid="+peId);
        int n=resumeService.rpDel(peId,resumeId);
        String msg="lose";
        if (n>0){
            msg="succes";
        }
        return msg;
    }


//    教育背景
    @RequestMapping("/educationCommit")
    public @ResponseBody String educationCommit(EducationalBackground educationalBackground){
//        System.out.println(new Gson().toJson(educationalBackground));
        boolean flag=resumeService.educationInsert(educationalBackground,resumeId);
        String msg="lose";
        if (flag){
            msg="succes";
        }
        return msg;
    }
    @RequestMapping("/educationSave")
    public @ResponseBody String educationSave(EducationalBackground educationalBackground){
//        System.out.println(new Gson().toJson(educationalBackground));
        int n=resumeService.educationUpdate(educationalBackground);
        String msg="lose";
        if (n>0){
            msg="succes";
        }
        return msg;
    }
    @RequestMapping("/educationDelete")
    public @ResponseBody String educationDelect(int ebId){
        System.out.println("edid="+ebId);
        int n=resumeService.reDel(ebId,resumeId);
        String msg="lose";
        if (n>0){
            msg="succes";
        }
        return msg;
    }
    @RequestMapping("/expectWorkUpdate")
    public @ResponseBody String expectWorkUpdate(Resume resume){
        int n=resumeService.expectWorkUpdate(resume);
        String msg="lose";
        if (n>0){
            msg="succes";
        }
        return msg;
    }

    @RequestMapping("/selfEvaUpdate")
    public @ResponseBody String selfEvaUpdate(Resume resume){
        int n=resumeService.selfEvaUpdate(resume);
        String msg="lose";
        if (n>0){
            msg="succes";
        }
        return msg;
    }
}
