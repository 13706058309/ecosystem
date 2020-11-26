package com.cykj.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.cykj.entity.BackUser;
import com.cykj.entity.Parameter;
import com.cykj.entity.ProjectInfo;
import com.cykj.entity.UserProject;
import com.cykj.service.ParameterService;
import com.cykj.service.ProjectService;
import com.cykj.service.UserProjectService;
import com.cykj.util.TableInfo;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/project")
public class ProjectController {

    @Resource
    ProjectService projectServiceImpl;

    @Resource
    ParameterService parameterServiceImpl;

    @Resource
    UserProjectService userProjectServiceImpl;
    /**
     * 前端用户找项目首页
     * @param request
     * @param projectName
     * @return
     */
    @RequestMapping({"/",""})
    public String goProject(HttpServletRequest request,String projectName){
        Map<String,Object> parameterCondition=new HashMap<>();
        if (projectName!=null && !projectName.trim().equals("")){
            request.setAttribute("projectName",projectName);
        }
        parameterCondition.put("paramType","项目一级分类");
        List<Parameter> parameters=parameterServiceImpl.findParameter(parameterCondition);
        request.setAttribute("parameterList",parameters);
        return "project/FindProject";
    }

    /**
     *  根据条件查询项目
     * @param request
     * @param page
     * @param limit
     * @param projectName
     * @param moneyLower
     * @param moneyHigher
     * @param fieldId
     * @return
     * @throws JsonProcessingException
     */
    @RequestMapping("/findProject")
    public @ResponseBody String findProject(HttpServletRequest request,String page,String limit,String projectName,String moneyLower,String moneyHigher,String fieldId) throws JsonProcessingException {
        int pageNum=Integer.parseInt(page);
        int limitNum=Integer.parseInt(limit);
        Map<String,Object> projectCondition=new HashMap<>();
        if (projectName!=null && !projectName.trim().equals("")){
            projectCondition.put("projectName",projectName);
        }
        if (moneyLower!=null && !moneyLower.trim().equals("")){
            projectCondition.put("moneyLower",moneyLower);
        }
        if (moneyHigher!=null && !moneyHigher.trim().equals("")){
            projectCondition.put("moneyHigher",moneyHigher);
        }
        if (fieldId!=null && !fieldId.trim().equals("")){
            projectCondition.put("fieldId",fieldId);
        }
        projectCondition.put("stateName","已发布");
        List<ProjectInfo> projectInfoList=projectServiceImpl.findProjectAll(projectCondition,(pageNum-1)*limitNum,limitNum);
        TableInfo tableInfo=new TableInfo();
        tableInfo.setCount(projectServiceImpl.findRecords(projectCondition));
        tableInfo.setData(projectInfoList);
        return new ObjectMapper().writeValueAsString(tableInfo);
    }

    /**
     * 前端项目详情跳转
     * @return
     */
    @RequestMapping(value = {"/projectDetail"} ,method= RequestMethod.GET)
    public String goProjectDetail(HttpServletRequest request,String projectId){
        ProjectInfo projectInfo=new ProjectInfo();
        projectInfo.setProjectId(Integer.parseInt(projectId));
        ProjectInfo project=projectServiceImpl.findProject(projectInfo);
        request.setAttribute("projectDetail",project);
        Map<String,Object> condition=new HashMap<>();
        condition.put("bUserId",project.getBackUser().getbUserId());
        condition.put("stateName","已发布");
        List<ProjectInfo> projectInfos=projectServiceImpl.findProjectAll(condition,1,3);
        request.setAttribute("projectLists",projectInfos);
        return "project/ProjectDetail";
    }


    /**
     * 企业项目管理页面跳转
     * @return
     */
    @RequestMapping({"/projectManage"})
    public String goProjectManage(HttpServletRequest request){
        Map<String,Object> parameterCondition=new HashMap<>();
        parameterCondition.put("paramType","项目状态");
        List<Parameter> parameters=parameterServiceImpl.findParameter(parameterCondition);
        request.setAttribute("parameters",parameters);
        return "project/ProjectManage";
    }

    /**
     * 企业端查询项目列表
     * @param request
     * @param response
     * @return
     * @throws JsonProcessingException
     */
    @RequestMapping(value = "/findProjectAll")
    public @ResponseBody String findProjectAll(HttpServletRequest request, HttpServletResponse response, String page, String limit, String stateId) throws JsonProcessingException {
        int pageNum=Integer.parseInt(page);
        int limitNum=Integer.parseInt(limit);
        Map<String,Object> condition=new HashMap<>();
        BackUser backUser=(BackUser) request.getSession().getAttribute("admin");

        if (stateId!=null && !stateId.trim().equals("")){
            condition.put("stateId",stateId);
        }
        condition.put("bUserId",backUser.getbUserId());
        List<ProjectInfo> projectInfoList=projectServiceImpl.findProjectAll(condition,(pageNum-1)*limitNum,limitNum);
        TableInfo tableInfo=new TableInfo();
        tableInfo.setCode(0);
        tableInfo.setData(projectInfoList);
        tableInfo.setCount(projectServiceImpl.findRecords(condition));
        tableInfo.setMsg("项目列表");
        System.out.println(new ObjectMapper().writeValueAsString(tableInfo));
        return new ObjectMapper().writeValueAsString(tableInfo);
    }

    /**
     * 企业需求详情页
     *
     */
    @RequestMapping("/projectEvolve")
    public String goProjectEvolve(){
        return "project/ProjectEvolve";
    }

    /**
     * 企业发布项目
     * @return
     */
    @RequestMapping("/publishProject")
    public String goPublishProject( HttpServletRequest request){
        String msg=null;
        Map<String,Object> condition =new HashMap<>();
        condition.put("paramType","项目一级分类");
        List<Parameter> parameters=parameterServiceImpl.findParameter(condition);
        request.setAttribute("parameters",parameters);
        return "project/PublishProject";
    }

    @RequestMapping("/finish")
    public @ResponseBody String updateUrl(HttpServletRequest request,ProjectInfo projectInfo){
        String msg="";
        int n=projectServiceImpl.updateState(projectInfo);
        if (n>0){
            msg="success";
            UserProject condition=new UserProject();
            condition.setUserId(projectInfo.getUserId());
            condition.setProjectId(projectInfo.getProjectId());
            condition.setParamId(50);
            UserProject userProject=userProjectServiceImpl.findUserProject(condition).get(0);
            UserProject newProject=new UserProject();
            newProject.setParamId(52);
            newProject.setId(userProject.getId());
            int res =userProjectServiceImpl.updateState(newProject);
            if (res>0){
                System.out.println("修改成功！");
            }
        }
        return msg;
    }


    @RequestMapping("/uploadDemandFile")
    public @ResponseBody String upload(@RequestParam("file") MultipartFile demandfile , HttpServletRequest request) throws JsonProcessingException {
        System.out.println("222222222222222222222222222222222222222222");
//        1获取上传的目录路径
        String path = request.getSession().getServletContext().getRealPath("/uploadDemand");
        //2以天维单位创建文件夹
        String date=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
//        3创建目录
        File file=new File(path,date);
        if (!file.exists()){
            file.mkdirs();
        }
//        4文件上传
        TableInfo tableInfo=new TableInfo();
        JSONObject json=new JSONObject();
//        4.1获取原始文件名
        String fileName=demandfile.getOriginalFilename();
        if (fileName!=null){
            fileName= UUID.randomUUID().toString() + fileName.substring(fileName.lastIndexOf("."));
            System.out.println(UUID.randomUUID().toString());
            try {
//               4.2文件上传
                demandfile.transferTo(new File(file,fileName));
                json.put("code",0);
                json.put("msg","success");
                JSONObject data=new JSONObject();
                data.put("docUrl","/uploadDemand/"+date+"/"+fileName);
                json.put("data",data);
                System.out.println("/uploadDemand/"+date+"/"+fileName);
                tableInfo.setCode(0);
                tableInfo.setMsg("success");
            } catch (IOException e) {
                e.printStackTrace();
//                tableInfo.setCode(1);
//                tableInfo.setMsg("failed");
                json.put("code",1);
                json.put("msg","failed");
                json.put("data","");
            }
        }
        return json.toString();
    }

    /**
     *发布项目、生成订单
     * @param request
     * @param projectInfo
     * @return
     */
    @RequestMapping("/addProject")
    public @ResponseBody String addProject(HttpServletRequest request ,ProjectInfo projectInfo) throws JsonProcessingException {
        String msg="";
        BackUser backUser=(BackUser)request.getSession().getAttribute("admin");
        if (backUser!=null){
            projectInfo.setbUserId(backUser.getbUserId());
        }else{
            projectInfo.setbUserId(1);
        }
        Map<String,Object> condition=new HashMap<>();
        condition.put("paramName","佣金");
        condition.put("paramType","费用");
        Parameter moneyRate=parameterServiceImpl.findParameter(condition).get(0);
        long trueMoney=(long)(projectInfo.getMoney()*(1+(Integer.parseInt(moneyRate.getParamValues().trim())/100.0)));
        System.out.println(trueMoney);
        projectInfo.setTrueMoney(trueMoney);
        ProjectInfo addRes=projectServiceImpl.addProject(projectInfo);
        return new ObjectMapper().writeValueAsString(addRes);
    }

    //支付成功后的异步回调，用于处理服务端业务
    @RequestMapping("/notifyUrl")
    public void notifyUrl(HttpServletRequest request)throws Exception{
        System.out.println("异步回调");
        projectServiceImpl.notifyUrl(request);
    }

    //支付成功后同步回调，用于展示给用户查看
    @RequestMapping("/returnUrl")
    public String returnUrl(HttpServletRequest request)throws Exception{
        System.out.println("同步回调");
        return projectServiceImpl.returnUrl(request);
    }

    //用户点击付款后请求此方法
    @RequestMapping("/alipayTradePagePay")
    public String alipayTradePagePay(HttpServletRequest request, HttpServletResponse response) throws Exception{
        return projectServiceImpl.alipayTradePagePay(request,response);
    }
}
