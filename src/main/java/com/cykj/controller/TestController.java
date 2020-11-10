package com.cykj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test")
public class TestController {
        @RequestMapping("/testComp")
        public String test() {
                System.out.println("运行界面");
                return "BackCompInfo";
        }
    @RequestMapping("/mainPage")
    public String mainPage() {
        System.out.println("运行界面");
        return "Main_Page";
    }

        @RequestMapping("/userManage")
        public String userManage ()
        {
            System.out.println("运行界面");
            return "UserManage";
        }

        @RequestMapping("/enterpriseManage")
        public String enterpriseManage ()
        {
            System.out.println("运行界面");
            return "EnterpriseManage";
        }

        @RequestMapping("/changePwd")
        public String changePwd () {
            return "BackChangePwd";
        }

        @RequestMapping("/backUniverTalent")
        public String backUniverTalent () {
            return "BackUniversityTalent";
        }

        @RequestMapping("/backCompFindUser")
        public String backCompFindUser () {
            return "BackCompFindUser";
        }

        @RequestMapping("/findPwd")
        public String findPwd () {
            return "BackFindPwd";
        }
    }
