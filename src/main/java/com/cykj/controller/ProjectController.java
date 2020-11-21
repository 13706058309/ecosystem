package com.cykj.controller;

import com.cykj.entity.BackUser;
import com.cykj.entity.Parameter;
import com.cykj.entity.ProjectInfo;
import com.cykj.service.ParameterService;
import com.cykj.service.ProjectService;
import com.cykj.util.TableInfo;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/project")
public class ProjectController {

    @Resource
    ProjectService projectServiceImpl;
    @Resource
    ParameterService parameterServiceImpl;

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
    public @ResponseBody String findProjectAll(HttpServletRequest request, HttpServletResponse response,String page,String limit,String stateId) throws JsonProcessingException {
        int pageNum=Integer.parseInt(page);
        int limitNum=Integer.parseInt(limit);
        Map<String,Object> condition=new HashMap<>();
//        BackUser backUser=request.getSession().getAttribute("bUser");
        BackUser backUser=new BackUser();
        backUser.setBUserId(1);

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

}
