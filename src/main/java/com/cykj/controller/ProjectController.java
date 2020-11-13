package com.cykj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/project")
public class ProjectController {

    @RequestMapping({"/",""})
    public String goProject(){
        System.out.println("111111111");
        return "project/FindProject";
    }
}
