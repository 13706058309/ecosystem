package com.cykj.controller;


import com.cykj.entity.*;
import com.cykj.service.ResumeService;
import com.cykj.service.impl.ResumeServiceImp;
import com.cykj.utils.PhoneCodeUtil;
import com.google.gson.Gson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/center")
public class CenterController {
    private int resumeId;
    private int userId;
    String workCity="厦门市";
    String workYear="工作经验";
    String education="学历要求";
    String salary="薪资要求";
    String finanStage="融资阶段";
    String scale="公司规模";
    String releaseTime="发布时间";
    String search="";
    String position="职位类型";

    @Resource
    private ResumeService resumeService;
    @RequestMapping("/myCenter")
    public String myCenter(){
        return "MyCenter";
    }

    @RequestMapping("/resumeInfo")
    public String resumeInfo(HttpServletRequest req){
        UserInfo user= (UserInfo) req.getSession().getAttribute("qUser");
        userId= (int) user.getUserId();
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
        UserInfo user= (UserInfo) req.getSession().getAttribute("qUser");
        userId= (int) user.getUserId();
        int page=0;
        int curr=1;
        int limit=2;
        List<PostPosition> posts=resumeService.deliveryPosts(userId,page,limit);
        List<PostPosition> postsCount=resumeService.deliveryPostsCount(userId);
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
        UserInfo user= (UserInfo) req.getSession().getAttribute("qUser");
        userId= (int) user.getUserId();
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
        UserInfo user= (UserInfo) req.getSession().getAttribute("qUser");
        userId= (int) user.getUserId();
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
    @RequestMapping("/resumeCommitPage")
    public String resumeCommitPage(HttpServletRequest req,int curr,int limit){
        UserInfo user= (UserInfo) req.getSession().getAttribute("qUser");
        userId= (int) user.getUserId();
        List<PostPosition> posts=resumeService.deliveryPosts(userId,(curr-1)*limit,limit);
        List<PostPosition> postsCount=resumeService.deliveryPostsCount(userId);
        int count=postsCount.size();

        req.setAttribute("postss",posts);
        req.setAttribute("count",count);
        req.setAttribute("limit",limit);
        req.setAttribute("curr",curr);
        System.out.println(new Gson().toJson(posts));
        return "resumeInfo";
    }

    @RequestMapping("/deliveryInfo")
    public String deliveryInfo(HttpServletRequest req){
        UserInfo user= (UserInfo) req.getSession().getAttribute("qUser");
        userId= (int) user.getUserId();
        int page=0;
        int curr=1;
        int limit=2;
        List<PostPosition> posts=resumeService.deliveryInfo(userId,page,limit);
        List<PostPosition> postsCount=resumeService.deliveryInfoCount(userId);
        int count=postsCount.size();

        req.setAttribute("postsss",posts);
        req.setAttribute("count",count);
        req.setAttribute("limit",limit);
        req.setAttribute("curr",curr);
        System.out.println(new Gson().toJson(posts));
        return "resumeInfo";
    }
    @RequestMapping("/deliveryInfoPage")
    public String deliveryInfoPage(HttpServletRequest req,int curr,int limit){
        UserInfo user= (UserInfo) req.getSession().getAttribute("qUser");
        userId= (int) user.getUserId();
        List<PostPosition> posts=resumeService.deliveryInfo(userId,(curr-1)*limit,limit);
        List<PostPosition> postsCount=resumeService.deliveryInfoCount(userId);
        int count=postsCount.size();

        req.setAttribute("postsss",posts);
        req.setAttribute("count",count);
        req.setAttribute("limit",limit);
        req.setAttribute("curr",curr);
        System.out.println(new Gson().toJson(posts));
        return "resumeInfo";
    }


    @RequestMapping("/resumePage")
    public String resumePage(HttpServletRequest req,int curr,int limit){
        UserInfo user= (UserInfo) req.getSession().getAttribute("qUser");
        userId= (int) user.getUserId();
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

        int n=resumeService.positionDel(userId,pPostId);
        String msg="lose";
        if (n>0){
            msg="succes";
        }
        return msg;
    }

    @RequestMapping("/savePwd")
    public @ResponseBody String savePwd(HttpServletRequest req,String oldpwd,String newpwd){
        UserInfo user= (UserInfo) req.getSession().getAttribute("qUser");
        userId= (int) user.getUserId();
        int n=0;
        Map map=new HashMap();
        map.put("userId",userId);
        map.put("oldpwd",oldpwd);
        map.put("newpwd",newpwd);
        UserInfo userInfo=resumeService.findpwd(map);
        if (null==userInfo){
            return "lose";
        }else {
            n=resumeService.savepwd(map);
        }
        String msg="";
        if (n>0){
            msg="succes";
        }
        return msg;
    }

    @RequestMapping("/saveShow")
    public @ResponseBody String saveShow(HttpServletRequest req,String isOpen){
        UserInfo user= (UserInfo) req.getSession().getAttribute("qUser");
        userId= (int) user.getUserId();

        Map map=new HashMap();
        map.put("userId",userId);
        map.put("isOpen",isOpen);
        int n=resumeService.saveShow(map);

        String msg="false";
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
        UserInfo user= (UserInfo) req.getSession().getAttribute("qUser");
        userId= (int) user.getUserId();
        Resume resume=resumeService.resume(userId);
        System.out.println(new Gson().toJson(resume));
        req.setAttribute("resume",resume);
        resumeId=(int)resume.getResumeId();
        return "jianli";
    }
    @RequestMapping("/accountSet")
    public String accountSet(HttpServletRequest req){
        UserInfo user= (UserInfo) req.getSession().getAttribute("qUser");
        userId= (int) user.getUserId();
        UserInfo userInfo=resumeService.findUser(userId);
        req.setAttribute("user",userInfo);
        return "AccountSet";
    }


//    简历信息修改
    @RequestMapping("/userInfoUpdate")
    public @ResponseBody String userInfoUpdate(HttpServletRequest req,Resume resume,String education,String time){
//        System.out.println(new Gson().toJson(resume));
//        String time=new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss").format(updateTime);
        UserInfo user= (UserInfo) req.getSession().getAttribute("qUser");
        userId= (int) user.getUserId();
        req.setAttribute("updateTime",time);
        resume.setUpdateTime(time);
        resume.setUserId(userId);
        int n=resumeService.resumeUpdate(resume);
        String msg="lose";
        if (n>0){
            msg="succes";
        }
        return msg;
    }

//    工作经历
    @RequestMapping("/historyCommit")
    public @ResponseBody String historyCommit(HttpServletRequest req,WorkExperience workExperience,String time){
        UserInfo user= (UserInfo) req.getSession().getAttribute("qUser");
        userId= (int) user.getUserId();
        Resume resume=new Resume();
        System.out.println(new Gson().toJson(workExperience));
        req.setAttribute("updateTime",time);
        resume.setUpdateTime(time);
        resume.setUserId(userId);
        boolean flag=resumeService.workInsert(workExperience,resumeId,resume);
        String msg="lose";
        if (flag){
            msg="succes";
        }
        return msg;
    }
    @RequestMapping("/historySave")
    public @ResponseBody String historySave(HttpServletRequest req,WorkExperience workExperience,String time){
        UserInfo user= (UserInfo) req.getSession().getAttribute("qUser");
        userId= (int) user.getUserId();
        Resume resume=new Resume();
        req.setAttribute("updateTime",time);
        resume.setUpdateTime(time);
        resume.setUserId(userId);
        System.out.println(new Gson().toJson(workExperience));
        int n=resumeService.workUpdate(workExperience,resume);
        String msg="lose";
        if (n>0){
            msg="succes";
        }
        return msg;
    }
    @RequestMapping("/historyDelete")
    public @ResponseBody String historyDelect(HttpServletRequest req,int weId,String time){
        Resume resume=new Resume();
        req.setAttribute("updateTime",time);
        resume.setUpdateTime(time);
        resume.setUserId(userId);
        System.out.println(weId+"?????????????????");
        int n=resumeService.rwDel(weId,resumeId,resume);
        String msg="lose";
        if (n>0){
            msg="succes";
        }
        return msg;
    }

//    项目经历
    @RequestMapping("/projectCommit")
    public @ResponseBody String projectCommit(HttpServletRequest req,ProjectExperience projectExperience,String time){
        Resume resume=new Resume();
        req.setAttribute("updateTime",time);
        resume.setUpdateTime(time);
        resume.setUserId(userId);
        System.out.println(new Gson().toJson(projectExperience));
        System.out.println("???????????????????????????");
        boolean flag=resumeService.projectInsert(projectExperience,resumeId,resume);
        String msg="lose";
        if (flag){
            msg="succes";
        }
        return msg;
    }
    @RequestMapping("/projectSave")
    public @ResponseBody String projectSave(HttpServletRequest req,ProjectExperience projectExperience,String time){
        Resume resume=new Resume();
        req.setAttribute("updateTime",time);
        resume.setUpdateTime(time);
        resume.setUserId(userId);
//        System.out.println(new Gson().toJson(projectExperience));
        int n=resumeService.projectUpdate(projectExperience,resume);
        String msg="lose";
        if (n>0){
            msg="succes";
        }
        return msg;
    }
    @RequestMapping("/projectDelete")
    public @ResponseBody String projectDelect(int peId,String time){
        Resume resume=new Resume();
        resume.setUpdateTime(time);
        resume.setUserId(userId);
        System.out.println("peid="+peId);
        int n=resumeService.rpDel(peId,resumeId,resume);
        String msg="lose";
        if (n>0){
            msg="succes";
        }
        return msg;
    }


//    教育背景
    @RequestMapping("/educationCommit")
    public @ResponseBody String educationCommit(EducationalBackground educationalBackground,String time){
//        System.out.println(new Gson().toJson(educationalBackground));
        Resume resume=new Resume();
        resume.setUpdateTime(time);
        resume.setUserId(userId);
        boolean flag=resumeService.educationInsert(educationalBackground,resumeId,resume);
        String msg="lose";
        if (flag){
            msg="succes";
        }
        return msg;
    }
    @RequestMapping("/educationSave")
    public @ResponseBody String educationSave(EducationalBackground educationalBackground,HttpServletRequest req,String time){
//        System.out.println(new Gson().toJson(educationalBackground));
        Resume resume=new Resume();
        resume.setUpdateTime(time);
        resume.setUserId(userId);
        int n=resumeService.educationUpdate(educationalBackground,resume);
        String msg="lose";
        if (n>0){
            msg="succes";
        }
        return msg;
    }
    @RequestMapping("/educationDelete")
    public @ResponseBody String educationDelect(int ebId,String time){
        System.out.println("edid="+ebId);

        Resume resume=new Resume();
        resume.setUpdateTime(time);
        resume.setUserId(userId);
        int n=resumeService.reDel(ebId,resumeId,resume);
        String msg="lose";
        if (n>0){
            msg="succes";
        }
        return msg;
    }
    @RequestMapping("/expectWorkUpdate")
    public @ResponseBody String expectWorkUpdate(Resume resume,HttpServletRequest req,String time){
//        Resume resume=new Resume();

        resume.setUpdateTime(time);
        resume.setUserId(userId);
        int n=resumeService.expectWorkUpdate(resume);
        String msg="lose";
        if (n>0){
            msg="succes";
        }
        return msg;
    }

    @RequestMapping("/selfEvaUpdate")
    public @ResponseBody String selfEvaUpdate(Resume resume,HttpServletRequest req,String time){
//        Resume resume=new Resume();

        resume.setUpdateTime(time);
        resume.setUserId(userId);
        int n=resumeService.selfEvaUpdate(resume);
        String msg="lose";
        if (n>0){
            msg="succes";
        }
        return msg;
    }




    @RequestMapping("/pageJob")
    public String job(HttpServletRequest req,String findPosition){
        int page=0;
        int curr=1;
        int limit=10;
        Map map=new HashMap();
        map.put("workCity",workCity);
        map.put("page",page);
        map.put("limit",limit);
        if (null==findPosition||findPosition.equals("".trim())||findPosition.equals("职位类型")){
            position="职位类型";
        }else if (findPosition.equals("不限")){
            position=findPosition;
        }else {
            position=findPosition;
            map.put("position",findPosition);
        }

        List<Position> positions=resumeService.positions();
        req.setAttribute("positions",positions);
        List<City>citys=resumeService.citys();
        req.setAttribute("citys",citys);

        List<PostPosition> postPositions=resumeService.jobs(map);
        List<PostPosition> jobsCount=resumeService.jobsCount(map);
        System.out.println(new Gson().toJson(postPositions));
        int count=jobsCount.size();

        req.setAttribute("count",count);
        req.setAttribute("limit",limit);
        req.setAttribute("curr",curr);
        req.setAttribute("jobs",postPositions);
        req.setAttribute("findworkYear",workYear);
        req.setAttribute("findEducation",education);
        req.setAttribute("findSalary",salary);
        req.setAttribute("findFinanStage",finanStage);
        req.setAttribute("findScale",scale);
        req.setAttribute("findReleaseTime",releaseTime);
        req.setAttribute("search",search);
        req.setAttribute("workCity",workCity);
        req.setAttribute("position",position);


        return "FindJob";
    }



    @RequestMapping("/clearjob")
    public String clearjob(HttpServletRequest req){
        int page=0;
        int curr=1;
        int limit=10;
        Map map=new HashMap();
        map.put("workCity",workCity);
        map.put("page",page);
        map.put("limit",limit);
        workYear="工作经验";
        education="学历要求";
        salary="薪资要求";
        finanStage="融资阶段";
        scale="公司规模";
        releaseTime="发布时间";
        if (search.equals("".trim())){

        }else {
            map.put("search","%"+search+"%");
        }

        List<PostPosition> postPositions=resumeService.jobs(map);
        List<PostPosition> jobsCount=resumeService.jobsCount(map);
        int count=jobsCount.size();

        req.setAttribute("count",count);
        req.setAttribute("limit",limit);
        req.setAttribute("curr",curr);
        req.setAttribute("jobs",postPositions);
        req.setAttribute("findworkYear",workYear);
        req.setAttribute("findEducation",education);
        req.setAttribute("findSalary",salary);
        req.setAttribute("findFinanStage",finanStage);
        req.setAttribute("findScale",scale);
        req.setAttribute("findReleaseTime",releaseTime);
        req.setAttribute("search",search);
        req.setAttribute("workCity",workCity);

        return "FindJob";
    }

    @RequestMapping("/searchJob")
    public String serachJob(HttpServletRequest req,String findSearch,String findWorkCity){
        int page=0;
        int curr=1;
        int limit=10;

        Map map=new HashMap();
        map.put("workCity",findWorkCity);
        search=findSearch;
        if (findSearch.equals("".trim())){

        }else {
            map.put("search","%"+findSearch+"%");
        }
        workCity=findWorkCity;
        map.put("page",page);
        map.put("limit",limit);
        workYear="工作经验";
        education="学历要求";
        salary="薪资要求";
        finanStage="融资阶段";
        scale="公司规模";
        releaseTime="发布时间";

        List<PostPosition> postPositions=resumeService.jobs(map);
        List<PostPosition> jobsCount=resumeService.jobsCount(map);
        int count=jobsCount.size();

        req.setAttribute("count",count);
        req.setAttribute("limit",limit);
        req.setAttribute("curr",curr);
        req.setAttribute("jobs",postPositions);
        req.setAttribute("findworkYear",workYear);
        req.setAttribute("findEducation",education);
        req.setAttribute("findSalary",salary);
        req.setAttribute("findFinanStage",finanStage);
        req.setAttribute("findScale",scale);
        req.setAttribute("findReleaseTime",releaseTime);
        req.setAttribute("search",findSearch);
        req.setAttribute("workCity",findWorkCity);

        return "FindJob";
    }

    @RequestMapping("/findJob")
    public String findJob(HttpServletRequest req,String findSearch,String findworkYear,String findWorkCity,String findEducation,String findSalary,String findFinanStage,String findScale,String findReleaseTime){
        int page=0;
        int curr=1;
        int limit=10;
        workCity=findWorkCity;
        Map map=new HashMap();
        if (findWorkCity.equals("全国")){

        }else {
            map.put("workCity",findWorkCity);
        }

        map.put("page",page);
        map.put("limit",limit);
        System.out.println(findWorkCity+"!!!!!!!!!");
        System.out.println(findEducation+"??????????");
        search=findSearch;
        if (findSearch.equals("".trim())||findSearch==null){

        }else {
            map.put("search","%"+findSearch+"%");
        }
        if (findSalary.equals("薪资要求")||findSalary==null ){
        }else if (findSalary.equals("不限")){
            salary=findSalary;
        }else {
            int min=0;
            int max=0;
            if (findSalary.equals("3K及以下")){
                min=0;
                max=3;
                map.put("min",min);
                map.put("max",max);
            }else if (findSalary.equals("3-5K")){
                min=3;
                max=5;
                map.put("min",min);
                map.put("max",max);
            }else if (findSalary.equals("5-10K")){
                min=5;
                max=10;
                map.put("min",min);
                map.put("max",max);
            }else if (findSalary.equals("10-15K")){
                min=10;
                max=15;
                map.put("min",min);
                map.put("max",max);
            }else if (findSalary.equals("15-20K")){
                min=15;
                max=20;
                map.put("min",min);
                map.put("max",max);
            }else if (findSalary.equals("20-30K")){
                min=20;
                max=30;
                map.put("min",min);
                map.put("max",max);
            }else if (findSalary.equals("30-50K")){
                min=30;
                max=50;
                map.put("min",min);
                map.put("max",max);
            }else if (findSalary.equals("50K及以上")){
                map.put("min2",50);
            }

            salary=findSalary;

        }
        if (findEducation.equals("学历要求")||findEducation==null ){

        }else if (findEducation.equals("不限")){
            education=findEducation;
        }else {
            education=findEducation;
            map.put("education",education);
        }
        if (findworkYear.equals("工作经验")||findworkYear==null ){

        }else if (findworkYear.equals("不限")){
            workYear=findworkYear;
        }else {
            workYear=findworkYear;
            map.put("workYear",workYear);
        }
        if (findScale.equals("公司规模")||findScale==null ){

        }else if (findScale.equals("不限")){
            scale=findScale;
        }else {
            scale=findScale;
            map.put("scale",scale);
        }
        if (findFinanStage.equals("融资阶段")||findFinanStage==null ){

        }else if (findFinanStage.equals("不限")){
            finanStage=findFinanStage;
        }else {
            finanStage=findFinanStage;
            map.put("finanStage",finanStage);
        }
        if (findReleaseTime.equals("发布时间")||findReleaseTime==null ){

        }else if (findReleaseTime.equals("不限")){
            releaseTime=findReleaseTime;
        }else {
            int time=0;

            if (findReleaseTime.equals("一天以内")){
                time=1;
                map.put("releaseTime",time);
            }else if (findReleaseTime.equals("三天以内")){
                time=3;
                map.put("releaseTime",time);
            }else if (findReleaseTime.equals("七天以内")){
                time=7;
                map.put("releaseTime",time);
            }else if (findReleaseTime.equals("十五天以内")){
                time=15;
                map.put("releaseTime",time);
            }else if (findReleaseTime.equals("一个月以内")){
              map.put("releaseTime2",1);
            }
            releaseTime=findReleaseTime;

        }
        System.out.println(workYear+"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        List<PostPosition> postPositions=resumeService.jobs(map);
        List<PostPosition> jobsCount=resumeService.jobsCount(map);
        int count=jobsCount.size();

        req.setAttribute("count",count);
        req.setAttribute("limit",limit);
        req.setAttribute("curr",curr);
        req.setAttribute("jobs",postPositions);
        req.setAttribute("findworkYear",workYear);
        req.setAttribute("findEducation",education);
        req.setAttribute("findSalary",salary);
        req.setAttribute("findFinanStage",finanStage);
        req.setAttribute("findScale",scale);
        req.setAttribute("findReleaseTime",releaseTime);
        req.setAttribute("search",findSearch);
        req.setAttribute("workCity",findWorkCity);

        return "FindJob";
    }
    @RequestMapping("/job")
    public String pageJob(HttpServletRequest req,String findworkYear,String findSearch,String findWorkCity,String findEducation,String findSalary,String findFinanStage,String findScale,String findReleaseTime,String curr,String limit,String findPosition){
        UserInfo user= (UserInfo) req.getSession().getAttribute("qUser");
        if (user==null){

        }else {
            userId= (int) user.getUserId();
            System.out.println(new Gson().toJson(user));
        }


        System.out.println(findworkYear+"1111"+findSearch+findWorkCity+findEducation+findSalary+findFinanStage+findScale+findReleaseTime+curr+limit+findPosition+"2222222222");
        int page=0;
        if (limit==null){
            limit="10";
        }
        if (curr==null){
            curr="1";
        }

        List<Position> positions=resumeService.positions();
        req.setAttribute("positions",positions);
        List<City>citys=resumeService.citys();
        req.setAttribute("citys",citys);
//        int curr=1;
//        int limit=2;
        Map map=new HashMap();
        if (null==findPosition||findPosition.equals("".trim())||findPosition.equals("职位类型")){
            position="职位类型";
        }else if (findPosition.equals("不限")){
            position=findPosition;
        }else {
            position=findPosition;
            map.put("position",findPosition);
        }

        if (findWorkCity==null){
            System.out.println("99999");
        }else if (findWorkCity.equals("全国")){
            System.out.println("88888");
            workCity=findWorkCity;
        }else {
            System.out.println("77777");
            workCity=findWorkCity;
            map.put("workCity",findWorkCity);
        }
        System.out.println(workCity+"???????????????????");
        search=findSearch;
        if (findSearch==null||findSearch.equals("".trim())){

        }else {
            map.put("search","%"+findSearch+"%");
        }
        map.put("workCity",workCity);
        map.put("page",(Integer.parseInt(curr)-1)*Integer.parseInt(limit));
        map.put("limit",Integer.parseInt(limit));
        System.out.println(findEducation+"??????????");
        if (findSalary==null ||findSalary.equals("薪资要求")){
            System.out.println("1111111111111111");
        }else if (findSalary.equals("不限")){
            salary=findSalary;
            System.out.println("222222222222222");
        }else {
            int min=0;
            int max=0;
            if (findSalary.equals("3K及以下")){
                min=0;
                max=3;
                map.put("min",min);
                map.put("max",max);
            }else if (findSalary.equals("3-5K")){
                min=3;
                max=5;
                map.put("min",min);
                map.put("max",max);
            }else if (findSalary.equals("5-10K")){
                min=5;
                max=10;
                map.put("min",min);
                map.put("max",max);
            }else if (findSalary.equals("10-15K")){
                min=10;
                max=15;
                map.put("min",min);
                map.put("max",max);
            }else if (findSalary.equals("15-20K")){
                min=15;
                max=20;
                map.put("min",min);
                map.put("max",max);
            }else if (findSalary.equals("20-30K")){
                min=20;
                max=30;
                map.put("min",min);
                map.put("max",max);
            }else if (findSalary.equals("30-50K")){
                min=30;
                max=50;
                map.put("min",min);
                map.put("max",max);
            }else if (findSalary.equals("50K及以上")){
                map.put("min2",50);
            }
            System.out.println("33333333333333");
            salary=findSalary;

        }
        if (findEducation==null|| findEducation.equals("学历要求")){

        }else if (findEducation.equals("不限")){
            education=findEducation;
        }else {
            education=findEducation;
            map.put("education",education);
        }
        if (findworkYear==null||findworkYear.equals("工作经验") ){

        }else if (findworkYear.equals("不限")){
            workYear=findworkYear;
        }else {
            workYear=findworkYear;
            map.put("workYear",workYear);
        }
        if (findScale==null||findScale.equals("公司规模") ){

        }else if (findScale.equals("不限")){
            scale=findScale;
        }else {
            scale=findScale;
            map.put("scale",scale);
        }
        if (findFinanStage==null||findFinanStage.equals("融资阶段") ){

        }else if (findFinanStage.equals("不限")){
            finanStage=findFinanStage;
        }else {
            finanStage=findFinanStage;
            map.put("finanStage",finanStage);
        }
        if (findReleaseTime==null||findReleaseTime.equals("发布时间") ){

        }else if (findReleaseTime.equals("不限")){
            finanStage=findFinanStage;
        }else {
            int time=0;

            if (findReleaseTime.equals("一天以内")){
                time=1;
                map.put("releaseTime",time);
            }else if (findReleaseTime.equals("三天以内")){
                time=3;
                map.put("releaseTime",time);
            }else if (findReleaseTime.equals("七天以内")){
                time=7;
                map.put("releaseTime",time);
            }else if (findReleaseTime.equals("十五天以内")){
                time=15;
                map.put("releaseTime",time);
            }else if (findReleaseTime.equals("一个月以内")){
                map.put("releaseTime2",1);
            }
            releaseTime=findReleaseTime;

        }
//        workCity=findWorkCity;
        System.out.println(workYear+"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        List<PostPosition> postPositions=resumeService.jobs(map);
        List<PostPosition> jobsCount=resumeService.jobsCount(map);
        int count=jobsCount.size();

        req.setAttribute("count",count);
        req.setAttribute("limit",limit);
        req.setAttribute("curr",curr);
        req.setAttribute("jobs",postPositions);
        req.setAttribute("findworkYear",workYear);
        req.setAttribute("findEducation",education);
        req.setAttribute("findSalary",salary);
        req.setAttribute("findFinanStage",finanStage);
        req.setAttribute("findScale",scale);
        req.setAttribute("findReleaseTime",releaseTime);
        req.setAttribute("search",findSearch);
        System.out.println(workCity+"$$$$$$$$$$$$$$$$$$$$");
        req.setAttribute("workCity",workCity);
        req.setAttribute("position",position);

        return "FindJob";
    }

    @RequestMapping("/postInfo")
    public String postInfo(HttpServletRequest req,int lid){
        PostPosition post=resumeService.findPost(lid);
        req.setAttribute("post",post);
        return "postInfo";
    }
//    投递简历
    @RequestMapping("/sendResume")
    public @ResponseBody String sendResume(HttpServletRequest req,int pPostId){
        UserInfo user= (UserInfo) req.getSession().getAttribute("qUser");
        userId= (int) user.getUserId();
        Resume r=resumeService.resume(userId);
        Delivery delivery=resumeService.findDelivery(userId,pPostId);
        if (null!=delivery){
            return "repetition";
        }
        if (r.getClan().equals("".trim())||r.getBirthday().equals("".trim())||r.getSchool().equals("".trim())||r.getEducation().getEducation().equals("".trim())||r.getSelfEva().equals("".trim())||r.getAddress().equals("".trim())||r.getExpectWork().equals("".trim())||r.getProjectExperiences().size()==0||r.getWorkExperiences().size()==0||r.getEducationalBackgrounds().size()==0){
            return "lose";
        }
        int n=resumeService.sendResume(userId,pPostId);
        String msg="lose";
        if (n>0){
            msg="succes";
        }
        return msg;
    }


    @RequestMapping("/photoUpdate")
    public @ResponseBody String photoUpdate(MultipartFile imgFile, HttpServletRequest req) throws Exception {

//        创建文件夹路径
//        String path=this.getClass().getClassLoader().getResource("").getPath();
//        String path=CenterController.class.getClassLoader().getResource("static/user").getPath();
//        File fff=new File(path,"static/user");
        String path=req.getSession().getServletContext().getRealPath("/resumePhoto");

//        子文件夹
        String date=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        File file=new File(path,date);
        if (!file.exists()){
            file.mkdirs();
        }
//        获取文件名
        String fileName=imgFile.getOriginalFilename();
        fileName= UUID.randomUUID().toString()+fileName.substring(fileName.lastIndexOf("."));
        System.out.println(UUID.randomUUID().toString());
//        上传文件
        System.out.println(path+"?????");
        System.out.println(imgFile.getOriginalFilename().substring(0,imgFile.getOriginalFilename().lastIndexOf(".")));
        System.out.println(imgFile.getOriginalFilename());
        imgFile.transferTo(new File(file,fileName));

        Resume resume=new Resume();
        resume.setUserId(userId);
        resume.setPhoto("/resumePhoto/"+date+"/"+fileName);
        int n=resumeService.updatePhoto(resume);
        UserInfo userInfo=new UserInfo();
        userInfo.setUserId(userId);
        userInfo.setHeadImgUrl("/resumePhoto/"+date+"/"+fileName);
        n=resumeService.updateHeadImgUrl(userInfo);

        return "succes";
    }

//    修改手机号码--获取验证码
    @RequestMapping("/vCodeMenu")
    public @ResponseBody String vCodeMenu(HttpServletRequest req,String newPhone){
        String code = "";
        for(int i=0;i<4;i++){
            int num = (int)(1+Math.random()*9);
            code += num;
        }
        if (resumeService.findTtelephone(newPhone).size()!=0){
            return "lose";
        }
        req.getSession().setAttribute("vCodeMenu",code);
        req.getSession().setAttribute("newPhone",newPhone);
        System.out.println(code+"???????????????????"+newPhone);
        return "succes";
    }

    @RequestMapping("/updatePhone")
    public @ResponseBody String updatePhone(HttpServletRequest req,String vCode){
        String newPhone= (String) req.getSession().getAttribute("newPhone");

        System.out.println(vCode);
        System.out.println(req.getSession().getAttribute("vCodeMenu"));
        if (vCode.equals(req.getSession().getAttribute("vCodeMenu"))){
            System.out.println("11111111111");
            UserInfo userInfo=new UserInfo();
            userInfo.setUserId(userId);
            userInfo.setTelephone(newPhone);
            int n=resumeService.updatePhone(userInfo);
            if (n>0){
                System.out.println("22222222");
                return "succes";
            }
        }
        return "lose";
    }


    @RequestMapping("/saveName")
    public @ResponseBody String saveName(HttpServletRequest req,String newName){
        UserInfo userInfo=new UserInfo();
        userInfo.setUserId(userId);
        userInfo.setUserName(newName);
        int n=resumeService.updateName(userInfo);
        if (n>0){
            UserInfo u=(UserInfo) req.getSession().getAttribute("qUser");
            u.setUserName(newName);

            req.getSession().setAttribute("qUser",u);
            return "succes";
        }
        return "lose";
    }
}
