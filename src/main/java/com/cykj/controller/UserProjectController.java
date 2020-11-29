package com.cykj.controller;

import com.alipay.api.AlipayApiException;
import com.cykj.entity.*;
import com.cykj.service.ParameterService;
import com.cykj.service.ProjectService;
import com.cykj.service.UserProjectService;
import com.cykj.service.impl.ProjectServiceImpl;
import com.cykj.util.TableInfo;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/userProject")
public class UserProjectController {

    @Resource
    UserProjectService userProjectServiceImpl;

    @Resource
    ProjectService projectServiceImpl;

    @Resource
    ParameterService parameterServiceImpl;

    @RequestMapping("/projectOfUser")
    public String goProjectOfUser(HttpServletRequest request){
        Map<String,Object> parameterCondition=new HashMap<>();
        parameterCondition.put("paramType","项目订单状态");
        List<Parameter> parameters=parameterServiceImpl.findParameter(parameterCondition);
        request.setAttribute("parameters",parameters);
        return "project/ProjectOfUser";
    }


    /**
     * 用户申请项目，添加订单（未付款）状态。
     *  @param request
     * @param userProject
     * @return
     * @throws JsonProcessingException
     */
    @RequestMapping("/addUserProject")
    public @ResponseBody String addUserProject(HttpServletRequest request,UserProject userProject) throws JsonProcessingException {
        String  msg=null;
        System.out.println(userProject.getProjectId() +"   "+ userProject.getPayMoney());
        UserInfo userInfo=(UserInfo) request.getSession().getAttribute("qUser");
        if (userInfo!=null){
            userProject.setUserId(userInfo.getUserId());
        }else{
            userProject.setUserId(1);
        }

        Map<String,Object> condition=new HashMap<>();
        condition.put("paramType","费用");
        condition.put("paramName","保证金");
        Parameter moneyRate=parameterServiceImpl.findParameter(condition).get(0);
        long money=(long)(userProject.getPayMoney()*Integer.parseInt(moneyRate.getParamValues().trim())/100.0);
        System.out.println(money);
        userProject.setPayMoney(money);
        UserProject userProject2=userProjectServiceImpl.addUserProject(userProject);
        return new ObjectMapper().writeValueAsString(userProject2);
    }

    /**
     * 查询
     * @param request
     * @param page
     * @param limit
     * @param orderNum
     * @param stateId
     * @return
     * @throws JsonProcessingException
     */
    @RequestMapping("/findUserProject")
    public @ResponseBody String findUserProject(HttpServletRequest request,String page,String limit,String orderNum,String stateId) throws JsonProcessingException {
        int pageNum=Integer.parseInt(page);
        int limitNum=Integer.parseInt(limit);
        Map<String,Object> condition=new HashMap<>();
        UserInfo userInfo=(UserInfo) request.getSession().getAttribute("qUser");
        if (userInfo!=null){
            condition.put("userId",userInfo.getUserId());
        }else{
            condition.put("userId","1");
        }
        if (orderNum!=null && !orderNum.trim().equals("")){
            condition.put("orderNum",orderNum);
        }
        if (orderNum!=null && !orderNum.trim().equals("")){
            condition.put("orderNum",orderNum);
        }
        if (stateId!=null && !stateId.trim().equals("")){
            condition.put("stateId",stateId);
        }
        List<UserProject> userProjects=userProjectServiceImpl.findUserProjectByPage(condition,(pageNum-1)*limitNum,limitNum);
        TableInfo tableInfo=new TableInfo();
        tableInfo.setCount(userProjectServiceImpl.findUserProjectRecord(condition));
        tableInfo.setData(userProjects);
        return new ObjectMapper().writeValueAsString(tableInfo);
    }

    /**
     *发布项目、生成订单
     * @param request
     * @param userProject
     * @return
     */
    @RequestMapping("/del")
    public @ResponseBody String delOrder(HttpServletRequest request ,UserProject userProject) throws JsonProcessingException {
        String msg="";
        int n=userProjectServiceImpl.updateState(userProject);
        if (n>0){
            msg="success";
            System.out.println("删除成功！！！！！！");
        }
        return msg;
    }


    @RequestMapping("/updateUrl")
    public @ResponseBody String updateUrl(HttpServletRequest request,ProjectInfo projectInfo){
        String msg="";
        System.out.println("2222222222222222");
        projectInfo.setStateId(37);
        int n=projectServiceImpl.updateState(projectInfo);
        if (n>0){
            msg="success";
        }
        return msg;
    }

    @RequestMapping("/userExit")
    public @ResponseBody String userExit(HttpServletRequest request,ProjectInfo projectInfo){
        UserInfo userInfo=(UserInfo) request.getSession().getAttribute("qUser");
        if (userInfo!=null){
            request.getSession().removeAttribute("qUser");
        }
        return "success";
    }





    //支付成功后的异步回调，用于处理服务端业务
    @RequestMapping("/notifyUrl")
    public void notifyUrl(HttpServletRequest request)throws Exception{
        System.out.println("异步回调");
        userProjectServiceImpl.notifyUrl(request);
    }

    //支付成功后同步回调，用于展示给用户查看
    @RequestMapping("/returnUrl")
    public String returnUrl(HttpServletRequest request)throws Exception{
        System.out.println("同步回调");
        return userProjectServiceImpl.returnUrl(request);
    }

    //用户点击付款后请求此方法
    @RequestMapping("/alipayTradePagePay")
    public String alipayTradePagePay(HttpServletRequest request, HttpServletResponse response,String id) throws Exception{
        return userProjectServiceImpl.alipayTradePagePay(request,response,id);
    }
    //用户点击付款后请求此方法
    @RequestMapping("/refund")
    public @ResponseBody String refund(HttpServletRequest request,HttpServletResponse response, HttpSession session) throws IOException, AlipayApiException {
         return userProjectServiceImpl.refund(request,response,session);
    }



}
