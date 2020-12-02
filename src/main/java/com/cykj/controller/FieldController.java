package com.cykj.controller;

import com.cykj.entity.TableInfo;

import com.cykj.log.Loger;
import com.cykj.service.impl.FieldServiceImpl;
import com.cykj.service.impl.UnitServiceImpl;
import com.google.gson.Gson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/field")
public class FieldController {

    @Resource
    private FieldServiceImpl fieldServiceImpl;


    @RequestMapping("goBFM")
    @Loger(operationType = "走入领域管理表格",operationName = "走入领域管理表格数据")
    public String goBackCourseManagement(){
        System.out.println("走入汤某人的测试控制类，即将访问 后台领域管理的JSP！！");

        return "BackFieldManagement";
    }

    @RequestMapping(value = "/findField",produces = "text/html;charset=UTF-8")
    @Loger(operationType = "录入领域表格数据",operationName = "录入领域表格数据")
    public @ResponseBody
    String getTableInfo(Integer page,Integer limit,String fieldName){

        System.out.println("我获取到了fieldName,值为："+fieldName);

        TableInfo tableInfo = fieldServiceImpl.findField(page,limit,fieldName);
        return new Gson().toJson(tableInfo);
    }

    @RequestMapping("deleteField")
    @Loger(operationType = "表格执行删除",operationName = "表格执行删除")
    public void deleteField(Integer fieldId){
        System.out.println(fieldId);
        System.out.println("走入删除 控制类");

        if (fieldId != 0){
            int field = fieldServiceImpl.deleteField(fieldId);
        }

    }

    @RequestMapping("insertField")//新增领域
    @Loger(operationType = "表格执行新增领域",operationName = "表格执行新增领域")
    public void insertField(String fieldName) {
        System.out.println("走入更改控制类");
        System.out.println("fieldName:"+fieldName);

        if (fieldName != null ){
            int insertField = fieldServiceImpl.insertField(fieldName);
        }
    }
}
