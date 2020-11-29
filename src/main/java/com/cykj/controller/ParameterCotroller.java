package com.cykj.controller;

import com.cykj.entity.Parameter;
import com.cykj.service.ParameterService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/parameter")
public class ParameterCotroller {
    @Resource
    ParameterService parameterServiceImpl;


    @RequestMapping("/findAssureMoney")
    public @ResponseBody String findAssureMoney(){
        Map<String,Object> condition =new HashMap<>();
        condition.put("paramName","保证金");
        condition.put("paramType","费用");
        List<Parameter> parameters=parameterServiceImpl.findParameter(condition);
        return parameters.get(0).getParamValues();
    }

    @RequestMapping("/findCommission")
    public @ResponseBody String findCommission(){
        Map<String,Object> condition =new HashMap<>();
        condition.put("paramName","佣金");
        condition.put("paramType","费用");
        List<Parameter> parameters=parameterServiceImpl.findParameter(condition);
        return parameters.get(0).getParamValues();
    }
}
