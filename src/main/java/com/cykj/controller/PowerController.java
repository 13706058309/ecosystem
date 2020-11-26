package com.cykj.controller;


import com.cykj.entity.Menu;
import com.cykj.entity.RoleInfo;
import com.cykj.service.PowerService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

@Controller
@RequestMapping("/power")
public class PowerController{

    @Resource
    private PowerService powerServiceImpl;
    //    查询权限

    @RequestMapping({"/",""})
    public String toPower(){
        return "PowerManager";
    }


    @RequestMapping("/findExistMenu")
    public void findExistMenu(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int roleId=(Integer.parseInt( request.getParameter("roleId")));
        //查询已分配菜单
        List<Menu> existList =powerServiceImpl.findExistMenu(roleId);
        //查询未分配菜单
        List<Menu> notExistList =powerServiceImpl.findNotExistMenu(roleId);

        Map<String,Object> map=new HashMap<>();
        map.put("existList",existList);
        map.put("notExistList",notExistList);
        System.out.println(new ObjectMapper().writeValueAsString(map));
        PrintWriter out=response.getWriter();
        out.write(new ObjectMapper().writeValueAsString(map));
        out.flush();
        out.close();
    }
//    修改权限
    @RequestMapping("/modifyPower")
    public void modifyPower(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int roleId=Integer.parseInt(request.getParameter("roleId"));
        String[] menuIsArr=request.getParameterValues("menuIds[]");
        System.out.println("ID 长度"+menuIsArr.length);
        List<String> menuIds=new ArrayList<>(Arrays.asList(menuIsArr));
        System.out.println("集合长度"+menuIds.size());
        String code=request.getParameter("code");
        int res=0;
        switch (code){
            case "add":
            case "addAll":
                res=powerServiceImpl.addPower(roleId,menuIds);
                break;
            case "del":
            case "delAll":
                res=powerServiceImpl.delPower(roleId,menuIds);
                break;
            default:
                break;
        }
        if (res>0){
            PrintWriter out=response.getWriter();
            out.write("success");
            out.flush();
            out.close();
        }
    }
    //查询所有角色
    @RequestMapping("/findRoles")
    public void findRoles(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<RoleInfo> roleList=powerServiceImpl.findRoles();
        PrintWriter out=response.getWriter();
        out.write(new ObjectMapper().writeValueAsString(roleList));
        out.flush();
        out.close();
    }

}
