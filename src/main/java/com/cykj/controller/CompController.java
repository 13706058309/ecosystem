package com.cykj.controller;

import com.cykj.entity.*;
import com.cykj.log.Loger;
import com.cykj.service.BackCompService;
import com.cykj.util.MD5Utils;
import com.cykj.utils.GaoDeMapUtil;
import com.cykj.utils.MyUtil;
import com.cykj.utils.PhoneCodeUtil;
import com.cykj.utils.WordUtil;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.zip.Inflater;

@Controller
@RequestMapping("/rec")
public class CompController {
    @Resource
    private BackCompService backCompService;

    //查找高校推荐的人才

    @RequestMapping("/findUnviTalent")
    public @ResponseBody String findUnviTalent(PageBean pageBean, Talent talent,HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
        BackUser backUser = (BackUser) request.getSession().getAttribute("admin");
//        int compID = 3;
        int compID = (int) backUser.getbUserId();
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
//    @Loger(operationType="后端日志",operationName="企业删除高校人才")
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
    //批量删除高校推荐人才
    @RequestMapping("/delAllUnviTalent")
//    @Loger(operationType="后端日志",operationName="企业批量删除高校人才")
    public @ResponseBody String delAllUnviTalent(String msg){
        List<Talent> list = new Gson().fromJson(msg,new TypeToken<List<Talent>>(){}.getType());
        int s = 0;
        for (Talent talent : list) {
            int n = backCompService.delUnviTalent(15, (int) talent.getCompAndtalent().getCompAndTalId());
            if(n>0) s++;
        }
        return "成功删除"+s+"个";
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
//    @Loger(operationType="后端日志",operationName="上线岗位")
    public @ResponseBody String postPosition(PostPosition postPosition,HttpServletRequest request){
        BackUser backUser = (BackUser) request.getSession().getAttribute("admin");
//        int compID = 3;
        System.out.println(backUser.getProduct()+"-"+backUser.getFinanStage()+"-"+backUser.getHomePage()+"-"+backUser.getScale()+"-"+backUser.getCoreValue()+"-"
                +backUser.getInfoIntr()+"-"+backUser.getLogo());
        if(backUser.getProduct()==null||backUser.getFinanStage()==null||backUser.getHomePage()==null||backUser.getScale()==null
        ||backUser.getCoreValue()==null||backUser.getInfoIntr()==null||backUser.getLogo()==null){
            return "3";
        }

        int compID = (int) backUser.getbUserId();
        postPosition.setCompanyId(compID);
        String msg = backCompService.postPosition(postPosition);
        return msg;
    }
    //企业查看上线的岗位
    @RequestMapping("/findOnlinePosition")
    public @ResponseBody String findOnlinePosition(PageBean pageBean,String postName,HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
        BackUser backUser = (BackUser) request.getSession().getAttribute("admin");
        int compID = (int) backUser.getbUserId();
//        int compID = 3;
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
//    @Loger(operationType="后端日志",operationName="删除岗位")
    public @ResponseBody String delPositionStand(int pPostId,HttpServletRequest request){

        Map<String,Object> map = new HashMap<>();
        BackUser backUser = (BackUser) request.getSession().getAttribute("admin");
        int compID = (int) backUser.getbUserId();
//        int compID = 3;
        map.put("compID",compID);
        map.put("standID",8);
        map.put("pPostID",pPostId);
        int n = backCompService.changePostPositionStand(map);

        return n>0?"删除成功":"删除失败";
    }

    //下线岗位
    @RequestMapping("/offLinePosition")
//    @Loger(operationType="后端日志",operationName="下线岗位")
    public @ResponseBody String offLinePosition(int pPostId, HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
        BackUser backUser = (BackUser) request.getSession().getAttribute("admin");
        int compID = (int) backUser.getbUserId();
//        int compID = 3;
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
        BackUser backUser = (BackUser) request.getSession().getAttribute("admin");
        int compID = (int) backUser.getbUserId();
//        int compID = 3;
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
//    @Loger(operationType="后端日志",operationName="重新上线岗位")
    public @ResponseBody String onLinePosition(String position,HttpServletRequest request){
        BackUser backUser = (BackUser) request.getSession().getAttribute("admin");
        long compID = backUser.getbUserId();
        PostPosition postPosition = new Gson().fromJson(position,PostPosition.class);

        String result = backCompService.rePostPosition(postPosition,compID);
        return result;
    }
    //企业查询过滤简历
    @RequestMapping("/findScerResumes")
    public @ResponseBody String findScerResumes(PageBean pageBean, Resume resume,String postName,HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
        BackUser backUser = (BackUser) request.getSession().getAttribute("admin");
        int compID = (int) backUser.getbUserId();
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
//        int compID = 3;
        map.put("compID",compID);
        map.put("standID",20);
        TableInfo tableInfo = backCompService.findScreeResume(map);

        return new Gson().toJson(tableInfo);
    }
    //批量过滤简历
    @RequestMapping("/scerrResume")
//    @Loger(operationType="后端日志",operationName="企业批量过滤简历")
    public @ResponseBody String scerrResume(String msg){
        List<Delivery> list = new Gson().fromJson(msg,new TypeToken<List<Delivery>>(){}.getType());
        int successNum = backCompService.changeDeliStand(list,10);
        return successNum+"";
    }
    //过滤当个简历
    @RequestMapping("/scerrResumeOne")
//    @Loger(operationType="后端日志",operationName="企业过滤单个简历")
    public @ResponseBody String scerrResumeOne(int deliID){
        int n = backCompService.changeDeliStand(deliID,10);
        return n+"";
    }
    //企业查询被拒绝的简历
    @RequestMapping("/findunPassResumes")
    public @ResponseBody String findunPassResumes(PageBean pageBean, String postName,HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
        BackUser backUser = (BackUser) request.getSession().getAttribute("admin");
        int compID = (int) backUser.getbUserId();
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
//        int compID = 3;
        map.put("compID",compID);
        map.put("standID",10);
        TableInfo tableInfo = backCompService.findAllResume(map);

        return new Gson().toJson(tableInfo);
    }

    //待定单个简历
    @RequestMapping("/deterResumeOne")
//    @Loger(operationType="后端日志",operationName="企业待定简历")
    public @ResponseBody String deterResumeOne(int deliID){
        int n = backCompService.changeDeliStand(deliID,11);
        return n+"";
    }

    //批量待定单个简历
    @RequestMapping("/deterResume")
//    @Loger(operationType="后端日志",operationName="企业批量待定简历")
    public @ResponseBody String deterResume(String msg){
        List<Delivery> list = new Gson().fromJson(msg,new TypeToken<List<Delivery>>(){}.getType());

        int successNum = backCompService.changeDeliStand(list,11);
        return successNum+"";
    }

    //删除单个简历
    @RequestMapping("/delResumeOne")
//    @Loger(operationType="后端日志",operationName="企业删除单个简历")
    public @ResponseBody String delResumeOne(int deliID){
        int n = backCompService.delResume(deliID,9);
        return n+"";
    }

    //删除已通知面试的单个简历
    @RequestMapping("/delPassResumeOne")
//    @Loger(operationType="后端日志",operationName="删除已通知面试简历")
    public @ResponseBody String delPassResumeOne(int deliID){
        int n = backCompService.changeDeliStand(deliID,21);
        return n+"";
    }

    //批量删除简历
    @RequestMapping("/delResume")
//    @Loger(operationType="后端日志",operationName="企业批量高校人才")
    public @ResponseBody String delResume(String msg){

        List<Delivery> list = new Gson().fromJson(msg,new TypeToken<List<Delivery>>(){}.getType());
        int successNum = backCompService.delResume(list,9);
        return successNum+"";
    }

    //批量删除通知面试简历
    @RequestMapping("/delPassResume")
//    @Loger(operationType="后端日志",operationName="企业批量删除通知面试的简历")
    public @ResponseBody String delPassResume(String msg){

        List<Delivery> list = new Gson().fromJson(msg,new TypeToken<List<Delivery>>(){}.getType());
        int successNum = backCompService.changeDeliStand(list,21);
        return successNum+"";
    }

    //企业查询被过滤的简历
    @RequestMapping("/findDeterResumes")
    public @ResponseBody String findDeterResumes(PageBean pageBean, String postName,String userName,HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
        BackUser backUser = (BackUser) request.getSession().getAttribute("admin");
        int compID = (int) backUser.getbUserId();

        if(postName!=null&&!postName.equals("")){
            map.put("postName","%"+postName+"%");
        }
        if(userName!=null&&!userName.equals("")){
            map.put("userName","%"+userName+"%");
        }

        map.put("limit",pageBean.getLimit());
        map.put("offset",(pageBean.getPage()-1)*pageBean.getLimit());
//        int compID = 3;
        map.put("compID",compID);
        map.put("standID",11);
        TableInfo tableInfo = backCompService.findAllResume(map);

        return new Gson().toJson(tableInfo);
    }

    //通知面试简历
    @RequestMapping("/passResume")
//    @Loger(operationType="后端日志",operationName="企业通知面试")
    public @ResponseBody String passResume(int deliID,String msg){
        int n = backCompService.passResume(deliID,12,msg);
        return n+"";
    }

    //企业查询收到的简历简历
    @RequestMapping("/findWaitResumes")
    public @ResponseBody String findWaitResumes(PageBean pageBean, String postName,String evdu,HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
        BackUser backUser = (BackUser) request.getSession().getAttribute("admin");
        int compID = (int) backUser.getbUserId();
        if(pageBean.getBeginTime()!=null&&!pageBean.getBeginTime().equals("")){
            map.put("beginTime",pageBean.getBeginTime());
        }
        if(pageBean.getEndTime()!=null&&!pageBean.getEndTime().equals("")){
            map.put("endTime",pageBean.getEndTime());
        }
        if(postName!=null&&!postName.equals("")){
            map.put("postName","%"+postName+"%");
        }

        if(evdu!=null&&!evdu.equals("")&&!evdu.equals("0")){
            map.put("evdu",evdu);
        }

        map.put("limit",pageBean.getLimit());
        map.put("offset",(pageBean.getPage()-1)*pageBean.getLimit());
//        int compID = 3;
        map.put("compID",compID);
        map.put("standID",20);
        TableInfo tableInfo = backCompService.findAllResume(map);

        return new Gson().toJson(tableInfo);
    }

    //企业查询通知面试简历
    @RequestMapping("/findPassResumes")
    public @ResponseBody String findPassResumes(PageBean pageBean, String postName,String userName,HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
        BackUser backUser = (BackUser) request.getSession().getAttribute("admin");
        int compID = (int) backUser.getbUserId();
        if(pageBean.getBeginTime()!=null&&!pageBean.getBeginTime().equals("")){
            map.put("beginTime",pageBean.getBeginTime());
        }
        if(pageBean.getEndTime()!=null&&!pageBean.getEndTime().equals("")){
            map.put("endTime",pageBean.getEndTime());
        }
        if(postName!=null&&!postName.equals("")){
            map.put("postName","%"+postName+"%");
        }

        if(userName!=null&&!userName.equals("")){
            map.put("userName","%"+userName+"%");
        }

        map.put("limit",pageBean.getLimit());
        map.put("offset",(pageBean.getPage()-1)*pageBean.getLimit());
//        int compID = 3;
        map.put("compID",compID);
        map.put("standID",12);
        TableInfo tableInfo = backCompService.findAllResume(map);

        return new Gson().toJson(tableInfo);
    }
    //查找岗位名字
    @RequestMapping("/findPostName")
    public @ResponseBody String findPostName(int postID){
        return backCompService.findPostName(postID);
    }
    //修改发布的岗位
    @RequestMapping("/changePostPosition")
    //    @Loger(operationType="后端日志",operationName="企业发布岗位")
    public @ResponseBody String changePostPosition(PostPosition postPosition){
        return backCompService.updatePostPosition(postPosition);
    }
    //企业修改发布岗位的岗位类型
    @RequestMapping("/changePostID")
    //    @Loger(operationType="后端日志",operationName="企业修改岗位类型")
    public @ResponseBody String changePostID(PostPosition postPosition){
        String msg = backCompService.updatePostPosition(postPosition);
        String postName = backCompService.findPostName((int) postPosition.getPostId());
        return msg.equals("1")? postName:"2";
    }
    //企业查找用户简历
    @RequestMapping("/compFindResume")
    public @ResponseBody String compFindResume(PageBean pageBean,Resume resume){
        Map<String,Object> map = new HashMap<>();
//        BackUser backUser = (BackUser) request.getSession().getAttribute("admin");
//        int compID = (int) backUser.getbUserId();

        if(resume.getEducationId()!=0){
            map.put("educationId",resume.getEducationId());
        }
        if(resume.getWrokYear()!=0){
            map.put("wrokYear",resume.getWrokYear());
        }
        if(resume.getIsGraduate()!=0){
            map.put("isGraduate",resume.getIsGraduate());
        }
        if(resume.getProfession()!=null&&!resume.getProfession().equals("")){
            map.put("profession","%"+resume.getProfession()+"%");
        }
        if(resume.getSex()!=null&&!resume.getSex().equals("不限")){
            map.put("sex",resume.getSex());
        }
        map.put("limit",pageBean.getLimit());
        map.put("offset",(pageBean.getPage()-1)*pageBean.getLimit());

        TableInfo tableInfo = backCompService.findUserResume(map);

        return new Gson().toJson(tableInfo);
    }
    //查找简历详细信息
    @RequestMapping("/findResumeDetail")
    public @ResponseBody String findResumeDetail(int resumeID){
        return new Gson().toJson(backCompService.findResumeDetail(resumeID));
    }
    //进入企业信息页面
    @RequestMapping("/testComps")
    public String test(HttpServletRequest request, HttpServletResponse response){
        BackUser backUsers = (BackUser) request.getSession().getAttribute("admin");
        int compID = (int) backUsers.getbUserId();
        BackUser backUser = backCompService.findCompByID(compID);
        request.setAttribute("comp",backUser);
        return "comp/Buju";
    }

    @RequestMapping("/changeCompInfo")
    //    @Loger(operationType="后端日志",operationName="企业修改企业信息")
    public @ResponseBody String changeCompInfo(BackUser backUser, HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
        BackUser bUser = (BackUser) request.getSession().getAttribute("admin");
        int compID = (int) bUser.getbUserId();
        map.put("compID",compID);
        if(backUser.getAddress()!=null&&GaoDeMapUtil.getLocation(backUser.getAddress()).equals("null%null")){
            return "5";
        }
        if(backUser.getInfoIntr()!=null){
            map.put("infoIntr",backUser.getInfoIntr());
        }

        if(backUser.getAddress()!=null){
            String location = GaoDeMapUtil.getLocation(backUser.getAddress());
            backUser.setLat(location.split("%")[1]);
            backUser.setLng(location.split("%")[0]);
            map.put("address",backUser.getAddress());
        }

        if(backUser.getCoreValue()!=null){
            map.put("coreValue",backUser.getCoreValue());
        }

        if(backUser.getScale()!=null){
            map.put("scale",backUser.getScale());
        }

        if(backUser.getHomePage()!=null){
            map.put("homePage",backUser.getHomePage());
        }

        if(backUser.getFinanStage()!=null){
            map.put("finanStage",backUser.getFinanStage());
        }

        if(backUser.getProduct()!=null){
            map.put("product",backUser.getProduct());
        }

        if(backUser.getLat()!=null){
            map.put("lat",backUser.getLat());
        }

        if(backUser.getLng()!=null){
            map.put("lng",backUser.getLng());
        }
        String msg = backCompService.changeCompInfo(map);
        BackUser comp = backCompService.findCompByID(compID);
        request.getSession().setAttribute("admin",comp);
        return msg;
    }

    @RequestMapping("/uploadLogo")
    //    @Loger(operationType="后端日志",operationName="企业上传logo")
    public @ResponseBody String uploadLogo(MultipartFile photo,HttpServletRequest request) throws IOException {
        String msg = "";
        System.out.println("tupin"+photo);
        String path = request.getSession().getServletContext().getRealPath("/uploadLogo/");

        String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        File file = new File(path,date);
        if(!file.exists()) file.mkdirs();

        String fileName = photo.getOriginalFilename();

        String uuid = UUID.randomUUID().toString().replace("-","");
        fileName = uuid+"_"+fileName;
        String savePath = "/"+date+"/"+fileName;
        photo.transferTo(new File(file,fileName));

        Map<String,Object> map = new HashMap<>();
        BackUser bUser = (BackUser) request.getSession().getAttribute("admin");
        int compID = (int) bUser.getbUserId();
        map.put("compID",compID);
        map.put("logo",savePath);
        String msgs = backCompService.changeCompInfo(map);
        BackUser comp = backCompService.findCompByID(compID);
        request.getSession().setAttribute("admin",comp);

        return msgs;
    }

    @RequestMapping("/compChangePwd")
    //    @Loger(operationType="后端日志",operationName="修改密码")
    public @ResponseBody String compChangePwd(String newPwd,String pwd,HttpServletRequest request){
        BackUser bUser = (BackUser) request.getSession().getAttribute("admin");
        int compID = (int) bUser.getbUserId();
        return backCompService.changePwd(newPwd,pwd,compID);
    }

    @RequestMapping("/outTalentResum")
    //    @Loger(operationType="后端日志",operationName="导出人才简历")
    public ResponseEntity<byte[]> outTalentResum(int talentID,HttpServletRequest request) throws IOException {
        String savePath = request.getSession().getServletContext().getRealPath("/outResume/");
        Talent talent = backCompService.findTalentByID(talentID);
        System.out.println(talent);
        Map<String,Object> map = new HashMap<>();
        map.put("talentName",talent.getTalentName());
        map.put("school",talent.getSchool());
        map.put("birthday",talent.getBirthday());
        map.put("contactInfo",talent.getContactInfo());
        map.put("profession",talent.getProfession());
        map.put("politicalStatus",talent.getPoliticalStatus());
        map.put("workExp",talent.getWorkExp());
        map.put("jobPlan",talent.getJobPlan());
        map.put("selfEva",talent.getSelfEva());
        map.put("education",talent.getEducation());
        map.put("address",talent.getAddress());
        map.put("certificate",talent.getCertificate());
        WordUtil wordUtil = new WordUtil();
        String path = wordUtil.createWord(map, MyUtil.TALENTRESUME,savePath);

        //把下载文件构成一个文件处理
        File file = new File(path);
        //设置头信息
        HttpHeaders httpHeaders = new HttpHeaders();
        String downloadFileName = new String((path.substring(path.lastIndexOf("\\")+1)).getBytes("UTF-8"), "iso-8859-1");
        //设置响应的文件名
        httpHeaders.setContentDispositionFormData("attachment",downloadFileName);
        //MediaType:互联网媒介类型，contextType 具体请求中的媒体类型信息
        httpHeaders.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),httpHeaders, HttpStatus.CREATED);
    }

    @RequestMapping("/outResume")
    //    @Loger(operationType="后端日志",operationName="导出简历")
    public ResponseEntity<byte[]> outResume(int resumeID,HttpServletRequest request) throws IOException {
        String savePath = request.getSession().getServletContext().getRealPath("/outResume/");
        String photoPath = request.getSession().getServletContext().getRealPath("");
        String path = backCompService.outResume(resumeID,savePath,photoPath);
        //把下载文件构成一个文件处理
        File file = new File(path);
        //设置头信息
        HttpHeaders httpHeaders = new HttpHeaders();
        String downloadFileName = new String((path.substring(path.lastIndexOf("\\")+1)).getBytes("UTF-8"), "iso-8859-1");
        //设置响应的文件名
        httpHeaders.setContentDispositionFormData("attachment",downloadFileName);
        //MediaType:互联网媒介类型，contextType 具体请求中的媒体类型信息
        httpHeaders.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),httpHeaders, HttpStatus.CREATED);
    }
    //修改密码发送验证码
    @RequestMapping("/sendCode")
    //    @Loger(operationType="后端日志",operationName="修改密码发生验证码")
    public @ResponseBody String sendCode(String phone,HttpServletRequest request){
        BackUser backUser = backCompService.findByPhone(phone);
        if(backUser==null) return "2";

        String code = "";
        for(int i=0;i<4;i++){
            int num = (int)(1+Math.random()*9);
            code += num;
        }
        System.out.println("code="+code);
        request.getSession().setAttribute("phone",phone);
        request.getSession().setAttribute("code",code);
        String s = PhoneCodeUtil.sendCode(phone, code);
        System.out.println(s);
        return "1";
    }
    //注册发送验证码
    @RequestMapping("/regSendCode")
    //    @Loger(operationType="后端日志",operationName="注册发生验证码")
    public @ResponseBody String regSendCode(String phone,HttpServletRequest request){
        BackUser backUser = backCompService.findByPhone(phone);
        if(backUser!=null) return "2";

        String code = "";
        for(int i=0;i<4;i++){
            int num = (int)(1+Math.random()*9);
            code += num;
        }
        System.out.println("code="+code);
        request.getSession().setAttribute("regPhone",phone);
        request.getSession().setAttribute("regCode",code);
        String s = PhoneCodeUtil.sendCode(phone, code);
        System.out.println(s);
        return "1";
    }
    //企业找回密码
    @RequestMapping("/findPwd")
    //    @Loger(operationType="后端日志",operationName="用户找回密码")
    public @ResponseBody String findPwd(String phone,String vCode,String pwd,HttpServletRequest request){
        String savePhone = (String) request.getSession().getAttribute("phone");
        String saveCode = (String)request.getSession().getAttribute("code");
        if(!phone.equals(savePhone)){
            return "2";
        }
        if(!vCode.equals(saveCode)){
            return "3";
        }
//        pwd = MD5Utils.md5(pwd);
        int n = backCompService.changePwdByPhone(pwd,phone);

        return n>0?"1":"4";
    }
    //企业注册
    @RequestMapping("/compReg")
    public @ResponseBody String compReg(BackUser backUser,MultipartFile photo, int industry,String code,HttpServletRequest request) throws IOException {

        System.out.println(backUser);
        String savePhone = (String) request.getSession().getAttribute("regPhone");
        String saveCode = (String)request.getSession().getAttribute("regCode");

        if(saveCode!=null&&!saveCode.equals(code)){
            return "1";//验证码错误
        }

        if(savePhone!=null&&!savePhone.equals(backUser.getContactInfo())){
            return "2";//手机号与验证码接收手机号不同
        }
        //判断地址是否存在
        if(GaoDeMapUtil.getLocation(backUser.getAddress()).equals("null%null")){
            return "8";
        }

        BackUser user = backCompService.findCompByAcc(backUser.getAccount());
        if(user!=null){
            return "3";//账号重复请重新填写
        }

        String msg = "";
        String path = request.getSession().getServletContext().getRealPath("/uploadBusiLice/");

        String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        File file = new File(path,date);
        if(!file.exists()) file.mkdirs();

        String fileName = photo.getOriginalFilename();

        String uuid = UUID.randomUUID().toString().replace("-","");
        fileName = uuid+"_"+fileName;
        String savePath = "/"+date+"/"+fileName;
        photo.transferTo(new File(file,fileName));
        backUser.setBusiLice(savePath);
        backUser.setRoleId(1);
        backUser.setStateId("17");
        String location = GaoDeMapUtil.getLocation(backUser.getAddress());
        backUser.setLng(location.split("%")[0]);
        backUser.setLat(location.split("%")[1]);

        int n = backCompService.RegComp(backUser,industry);
        return n+"";
    }
    //判断是否下载简历开启收费
    @RequestMapping("/judgeDownFee")
    public @ResponseBody String judgeDownFee(){
        return  backCompService.judegCharse();
    }
    //关闭下载简历收费
    @RequestMapping("/closeFee")
    //    @Loger(operationType="后端日志",operationName="关闭下载简历收费")
    public  @ResponseBody String closeFee(){
        return backCompService.changeFeeStand(1);
    }
    //打开下载简历i收费
    @RequestMapping("/openFee")
    //    @Loger(operationType="后端日志",operationName="开启下载简历收费")
    public  @ResponseBody String openFee(){

        return backCompService.openFee(2);
    }
    //判断是否下载收费
    @RequestMapping("/judgeResumeShowOrHidden")
    public @ResponseBody String judgeResumeShowOrHidden(){
        return backCompService.judgeResumeShowOrHidden();
    }
    //查找下载简历需要的费用
    @RequestMapping("/findDownFee")
    public @ResponseBody String findDownFee(){
        return backCompService.findDownFee();
    }
    //花费积分下载简历
    @RequestMapping("/downFeeResume")
    //    @Loger(operationType="后端日志",operationName="花费人才下载简历")
    public @ResponseBody String downFeeResume(HttpServletRequest request){
//        BackUser backUser = (BackUser)request.getSession().getAttribute("admin");
//        long fee = Long.parseLong(backCompService.findDownFee());
//        if(backUser.getBalance()<fee) return "1";
//        long newBanlace = (backUser.getBalance()-fee);

        return backCompService.downFeeResume(request);
    }
    //跳转企业通讯页面
    @RequestMapping("/chat")
    public String chat(HttpServletRequest request){
//        BackUser backUsers = (BackUser) request.getSession().getAttribute("admin");
//        int compID = (int) backUser.getbUserId();
//        int compID = 3;
//        BackUser backUser = backCompService.findCompByID(compID);
//        request.setAttribute("admin",backUser);
        return "comp/Chat";
    }


    @RequestMapping("/getChatUser")
    public @ResponseBody String getChatUser(HttpServletRequest request){
        BackUser backUser = (BackUser) request.getSession().getAttribute("admin");
        int compID = (int) backUser.getbUserId();
//        int compID = 3;
        return backCompService.compfindChat(compID);
    }
    //查找聊天记录
    @RequestMapping("/findChatRec")
    public @ResponseBody String findChatRec(String userID,HttpServletRequest request){
        System.out.println("收地点ID"+userID);
        BackUser backUser = (BackUser) request.getSession().getAttribute("admin");
        int compID = (int) backUser.getbUserId();
//        int compID = 3;
        return backCompService.findChatRec(compID, Integer.parseInt(userID));
    }

    @RequestMapping("/userChat")
    public String userChat(HttpServletRequest request,String compID){
        BackUser backUser = backCompService.findCompByID(Integer.parseInt(compID));
//        UserInfo userInfo = new UserInfo();
//        userInfo.setUserId(1);
//        userInfo.setUserName("慕莲");
//        userInfo.setHeadImgUrl("/headimg/images/headImg.png");
        request.getSession().setAttribute("bUser",backUser);
//        request.getSession().setAttribute("qUser",userInfo);
        return "comp/UserChat";
    }
    //查找用户聊过的公司
    @RequestMapping("/getChatComp")
    public @ResponseBody String getChatComp(HttpServletRequest request){
        UserInfo userInfo = (UserInfo) request.getSession().getAttribute("qUser");
        int userID = (int) userInfo.getUserId();
//        int userID = 1;
        return backCompService.userFindChat(userID);
    }
    //用户查找具体和某个企业的聊天纪律
    @RequestMapping("/findChatRecs")
    public @ResponseBody String findChatRecs(String compID,HttpServletRequest request){
        UserInfo userInfo = (UserInfo) request.getSession().getAttribute("qUser");
        int userID = (int) userInfo.getUserId();
//        int userID = 1;
        return backCompService.findChatRecs(Integer.parseInt(compID),userID);
    }
    //把读过的用户消息设为已读
    @RequestMapping("/readUserMsg")
    public @ResponseBody String readUserMsg(String userID,HttpServletRequest request){
        BackUser backUser = (BackUser) request.getSession().getAttribute("admin");
        int compID = (int) backUser.getbUserId();
//        int compID = 3;
        backCompService.readUserMsg(compID,Integer.parseInt(userID));
        return "1";
    }

    //把读过的用户消息设为已读
    @RequestMapping("/readCompMsg")
    public @ResponseBody String readCompMsg(String compID,HttpServletRequest request){
        UserInfo userInfo = (UserInfo) request.getSession().getAttribute("qUser");
        int userID = (int) userInfo.getUserId();
//        int userID = 1;
        backCompService.readCompMsg(Integer.parseInt(compID),userID);
        return "1";
    }
    //后台用户退出登录
    @RequestMapping("/exitsLogin")
    //    @Loger(operationType="后端日志",operationName="退出登录")
    public String exitsLogin(HttpServletRequest request){
        request.getSession().removeAttribute("admin");
        return "adminLog";
    }

    @RequestMapping("/changeFee")
    //    @Loger(operationType="后端日志",operationName="修改费用")
    public @ResponseBody String changeFee(String money){
        int result = backCompService.changeFee(money);
        return result>0? "success":"failed";
    }
}
